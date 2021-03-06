(*
    File: jouster.ml
    Author: Max D3
*)



(* BOTS FIGHTS! *)

(** Jumps to the matching ']'-bracket after the i-th character in the bot,
    the 'depth' variable allows to avoid sub-loops *)
let rec jump str_bot i depth = match str_bot.[i] with
    | '[' -> jump str_bot (i+1) (depth+1)
    | ']' -> if depth = 1 then i else jump str_bot (i+1) (depth-1)
    |  _  -> jump str_bot (i+1) depth


(** Returns an inverted copy of the bot *)
let rev_bot str_bot =
    let copy = Bytes.copy str_bot in
    let len = String.length(copy) in
    for i = 0 to len - 1 do
        match copy.[i] with
            |'>' -> Bytes.set copy i '<'
            |'<' -> Bytes.set copy i '>'
            | _  -> ()
    done ; copy


(** Returns an polarity-reverted copy of the bot *)
let rev_pol_bot str_bot =
    let copy = Bytes.copy str_bot in
    let len = String.length(copy) in
    for i = 0 to len - 1 do
        match copy.[i] with
            |'+' -> Bytes.set copy i '-'
            |'-' -> Bytes.set copy i '+'
            | _  -> ()
    done ; copy


(** Determines the issue of a joust between bot1 and bot2.
    The joust ends when:
        - A flag is at zero for two consecutive rounds (Capture)
        - A bot exits the arena (Exit) 
        - More than 2000 cycles without victory
    The variable 'delta' represents the difference between the bots flags. *)
let joust bot1 bot2 size pol =
    let bot2 = rev_bot (if pol = Inv then rev_pol_bot bot2 else bot2) in
    let mem = [|128|] @@ ([|0|] *@ (size - 2)) @@ [|128|] in
    let len1, len2 = String.length bot1, String.length bot2 in
    let exec bot p i l = match bot.[i] with
        | '>' -> (p+1, i+1, l)
        | '<' -> (p-1, i+1, l)
        | '+' -> (if mem.(p) = 128 then mem.(p) <- (-127)
                  else mem.(p) <- mem.(p) + 1 ; (p, i+1, l))
        | '-' -> (if mem.(p) = (- 127) then mem.(p) <- 128
                  else mem.(p) <- mem.(p) - 1 ; (p, i+1, l))
        | '.' -> (p, i+1, l)
        | '[' -> if mem.(p) = 0 then (p, 1 + (jump bot i 0), l)
                else (p, i+1, (i+1)::l)
        | ']' -> if mem.(p) = 0 then (p, i+1, (tl l))
                 else (p, (hd l), l)
        |  _  -> (p, i+1, l)
    in let rec fight cycle p1 p2 i1 i2 l1 l2 z1 z2 =
        let delta = (abs mem.(0) - abs mem.(size - 1)) in
        if cycle > 2000 || (i1 >= len1 && i2 >= len2) then
            let gagnant = if delta > 0 then Left else
                          if delta < 0 then Right else Tie in
            (gagnant, Timeout, delta, cycle)
        else
            let (p1, i1, l1) =
                if i1 >= len1 then (p1, i1, l1)
                else exec bot1 p1 i1 l1 in
            let (p2, i2, l2) =
                if i2 >= len2 then (p2, i2, l2)
                else exec bot2 p2 i2 l2 in
            let zz1, zz2 = (mem.(0) = 0), (mem.(size - 1) = 0) in
            if (zz1 && z1) && (zz2 && z2) then (Tie, Capture, 0, cycle) else
            if (abs (p1 - p2)) = (size + 1) then (Tie, Exit, 0, cycle) else
            if (zz1 && z1) then (Right, Capture, delta, cycle) else
            if (zz2 && z2) then (Left, Capture, delta, cycle) else
            if (p1 < 0) || (p1 = size) then (Right, Exit, delta, cycle) else
            if (p2 < 0) || (p2 = size) then (Left, Exit, delta, cycle) else
            fight (cycle + 1) p1 p2 i1 i2 l1 l2 (mem.(0) = 0) (mem.(size-1) = 0)
    in fight 0 0 (size -1) 0 0 [] [] false false



(** MULTIPLE EVALUATIONS **)

let score_joust bot1 bot2 n pol = match joust bot1 bot2 n pol with
    | (Left,_,_,_) -> 1
    | (Right,_,_,_) -> -1
    | (Tie,_,_,_) -> 0


(** Displays the issue of all possible combats between two bots
    1 means win, 0 means tie and -1 means loss *)
let ( *>> ) bot1 bot2 =
    let pts = ref 0 in
    print_string "NORMAL :" ;
    for i = 10 to 30 do
        let s = (score_joust bot1 bot2 i Norm) in
        pts += s ;
        print_string (" " ^ if s < 0 then "" else " ") ;
        print_int s
    done ;
    print_string "\nINVERSE:" ;
    for i = 10 to 30 do
        let s = (score_joust bot1 bot2 i Inv) in
        pts += s ;
        print_string (" " ^ if s < 0 then "" else " ") ;
        print_int s
    done ;
    print_newline () ;
    print_string "Score : " ;
    print_int !pts ;
    print_newline ()


(** Displays only the sum of the points from the previous function *)
let ( *> ) bot1 bot2 =
    let pts = ref 0 in
    for i = 10 to 30 do
        pts += (score_joust bot1 bot2 i Norm) ;
        pts += (score_joust bot1 bot2 i Inv) 
    done ; !pts



(** SPEEDTEST **)

(** Speedtest based on 840 fights between two bots (20*42 possible configs) *)
let speedtest bot1 bot2 =
    Printf.printf "\nBenchmark..." ;
    print_newline() ;
    let t = Sys.time() in
    for i = 1 to 20 do
        ignore (bot1 *> bot2)
    done ;
    let delta_t = Sys.time () -. t in
    let fights_par_sec = iof (840. /. delta_t) in
    Printf.printf "%d fights per second!\n" fights_par_sec
