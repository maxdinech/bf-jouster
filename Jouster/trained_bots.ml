(** Concaténation rapide *)
let rec ( **^) str n =
    if n < 1 then ""
    else (str ^ str) **^ (n / 2) ^ if n mod 2 = 0 then "" else str

(*SCORE             BOT                         CODE*)

(* 584 *) let bot_MickeyV4              = "++>------>->---<<<------------->------>->---->------------->>--->------<----------------<------<-<<--<------------->--------<-->------>------->----------->-------------->-------->------->----------------[>[--[-[+]]]>[--[+]]-]-------[>[--[-[+]]]>[--[+]]-]<--<------>------->----------------[>[--[-[+]]]>[--[+]]-]<--<---------------------->------>->-<-----"
(* 512 *) let bot_CounterPunch          = "++++++>------------>>>>>>><------------<++++++++++++<------------<++++++++++++<------------<++++++++++++>>>>>>>" ^ ("[-[------[+.]][------[+.]][------[+.]][------[+.]][------[+.]]][-[------[+.]][------[+.]][------[+.]][------[+.]][------[+.]]][-[------[+.]][------[+.]][------[+.]][------[+.]][------[+.]]][-[------[+.]][------[+.]][------[+.]][------[+.]][------[+.]]]>" **^ 21)
(* 493 *) let bot_Bigger                = "+>->+>+>->------------------>++++++++++++++++++>------------------>++++++++++++++++++" ^ (">[++++++++++++++++++[-][-[+]]][++++++++++++++++++[-][-[+]]]" **^ 21)
(* 489 *) let bot_DecoyMaster           = ">>>>++++++++++<----------<++++++++++++++++++++++++++++++<------------------------------>>>>+>+>->-" ^ (">[-[++[++++++++++[-]]]]+" **^ 21)
(* 478 *) let bot_Wut                   = ">->++>++>++<<<-------------------->>>>>>>" ^ (">[++++++++++++++++++[-]]" **^ 30)
(* 475 *) let bot_LightfootPlodder      = ">---->------->---->+++++++>----------------->+++>->---------->++++++++++++++++[-]<-" ^ (("[[>>[+[--[+++[<+>++++++++++++++[-]]]]]<-]>>[" ^ ("+" **^ 126) ^ "+.+.+.+.>]<]+") **^ 10)
(* 438 *) let bot_MetalDetector         = ("-------->" **^ 9) ^ ("[+]>" **^ 21)
(* 433 *) let bot_BeatYouMate           = (">------>+++++++" **^ 4) ^ ("[++++++[-]]>" **^ 21)
(* 412 *) let bot_SeeSawRush            = ">>>>------<+++++<----<+++>>>>(----->+++++>)*2([(+)*4[-]]>)*21"
(* 406 *) let bot_Stitcher              = ">+>->+>->>>>" ^ (">[(+)*18[-]]" **^ 30)
(* 403 *) let bot_RandomOscillator      = ">->+>->+>+>->->+" ^ (">[+[-]]" **^ 21)
(* 398 *) let bot_AnybodyThere          = ">>>+<+++++<----->>[(>[([++++++++++[-]]>)*29])*4+<<<<[>>>(+)*5<(-)*5<<[-]]>>>>]([-[(+)*10[-]]]>)*29"
(* 381 *) let bot_EvoBot1               = ">+>--->>>>>>" ^ (">[+++[-]]" **^ 30)
(* 319 *) let bot_Alternator            = ">+>->+>->+>->+>->+" ^ (">[-][.]" **^ 21)
(* 302 *) let bot_FastClearBot          = ">>>>>>>>>" ^ ("[+++[-]]>" **^ 21)
(* 215 *) let bot_CloakingDeviceBot     = ("-" **^ 127) ^ ("-+--+-++" **^ 12500)
(* 215 *) let bot_CloakingDeviceBot2    = ("-" **^ 127) ^ ("-++-" **^ 12500)
(* 123 *) let bot_DoNothingBot          = "."


(*SCORE             ZIPPED BOT                  CODE*)
(*******
(* 600 *) let botz_NyurokiMagicalFantasy = ""
(* 585 *) let botz_LethalLokeV2_1        = ""
(* 584 *) let botz_MickeyV4              = "++>------>->---<<<------------->------>->---->------------->>--->------<----------------<------<-<<--<------------->--------<-->------>------->----------->-------------->-------->------->----------------[>[--[-[+]]]>[--[+]]-]-------[>[--[-[+]]]>[--[+]]-]<--<------>------->----------------[>[--[-[+]]]>[--[+]]-]<--<---------------------->------>->-<-----"
(* 538 *) let botz_YandereBot            = ""
(* 512 *) let botz_CounterPunch          = "(+)*6>(-)*12(>)*7(<(-)*12<(+)*12)*3(>)*7(([-([(-)*6[+.]])*5])*4>)*21"
(* 507 *) let botz_BurlyBalderV3         = ""
(* 493 *) let botz_NestDarwin            = "(-)*5(>[(-)*4----[.+]]--((-)*5(>[(-)*4----[.+]]--((-)*5(>[(-)*4----[.+]]--((-)*5(>[(-)*4----[.+]]--)*10000)*10000)*10000)*10000)*10000)*10000)*10000"
(* 493 *) let botz_Bigger                = "+>->+>+>-(>(-)*18>(+)*18)*2(>([(+)*18[-][-[+]]])*2)*21"
(* 489 *) let botz_DecoyMaster           = "(>)*4(+)*10<(-)*10<(+)*30<(-)*30(>)*3(>+)*2(>-)*2(>[-[++[(+)*10[-]]]]+)*21"
(* 478 *) let botz_Wut                   = ">-(>++)*3(<)*3(-)*20(>)*7(>[(+)*18[-]])*30"
(* 475 *) let botz_LightfootPlodder      = ">(-)*4>(-)*7>(-)*4>(+)*7>(-)*17>(+)*3>->(-)*10>(+)*16[-]<-([[>>[+[--[+++[<+>(+)*14[-]]]]]<-]>>[(+)*126(+.)*4>]<]+)*10"
(* 461 *) let botz_99BottlesOfBats       = "(>+>->->+)*2(>[[-[-[-[-[-[-[-[-[-[+]]]]]]]]]][+[+[+[+[+[+[+[+[+[-]]]]]]]]]]])*9999"
(* 458 *) let botz_TerribleThorV2        = ""
(* 443 *) let botz_WallE2_0              = "(>)*9(+)*128 << [ (<)*7 ((-+-)*256)*15 ] > [ (<)*8 ((+-+)*256)*15 ](-)*47 < (+)*63 < (-)*72 < (+)*69 <(-)*84 < (+)*66 < (-)*76 < (+)*66 <++++ (>)*9 +.+.+.----.-.-. (>[-[++[(+)*124.+.+.+.+.+.+.+.+.>]]])*21"
(* 441 *) let botz_MultiVAC              = ">---->++++(>)*7(<(-)*80<(+)*80)*3<(+)*76<(-)*76<(-)*28(>)*10([+[+[+[+[+[+[+[+[+[+[+[+[+[+[+[+(-)*17[-[-[-[-[-[-[-[-[-[-[-[-[-[-[-[(-)*112[+]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]][-]++>[-[-[-[-[-[-[-[-[-[-[-[-[-[-[-[-(+)*17[+[+[+[+[+[+[+[+[+[+[+[+[+[+[+[(+)*112[-]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]][+]-->)*11"
(* 439 *) let botz_Twitcher              = ""
(* 438 *) let botz_MetalDetector         = "(-------->)*9([+]>)*21"
(* 433 *) let botz_BeatYouMate           = "(>------>+++++++)*4>([(+)*6[-]]>)*21"
(* 427 *) let botz_TheWallmaster         = ""
(* 412 *) let botz_SeeSawRush            = ">>>>------<+++++<----<+++>>>>(----->+++++>)*2([(+)*4[-]]>)*21"
(* 406 *) let botz_Stitcher              = "(>+>-)*2(>)*4(>[(+)*18[-]])*30"
(* 403 *) let botz_RandomOscillator      = ">->+>->+>+>->->+(>[+[-]])*21"
(* 398 *) let botz_AnybodyThere          = ">>>+<(+)*5<(-)*5>>[(>[([(+)*10[-]]>)*29])*4+<<<<[>>>(+)*5<(-)*5<<[-]]>>>>]([-[(+)*10[-]]]>)*29"
(* 392 *) let botz_2BotsOneCup           = ""
(* 387 *) let botz_SternBot              = "(>->+>)*3(>[+]>[-])*21"
(* 385 *) let botz_EvoBot2               = ">>>>(-)*4<(+)*6<(-)*7<(+)*8(>)*8(>[+++[-]])*30"
(* 381 *) let botz_EvoBot1               = ">+>---(>)*6(>[+++[-]])*30"
(* 373 *) let botz_TimedAttack           = "(-)*1024(>+)*9([-][-[++-]][+-]->)*21"
(* 373 *) let botz_ReluctantRanV2        = ""
(* 359 *) let botz_PrimesAndWonders      = ">>>>>-<<<<<--->------------(-)*5>++++++++++++++++(+)*7>>(+)*13+++++++++++++++++>------------------->+++++++++++++>----------------->++++++++++++++++++++++++++++++>([(+.)*16[-]]>[(-.)*16[-]]>[(+.+.+.+.)*4[-]]>)*7"
(* 357 *) let botz_TruthBot              = "(>++>----)*4>---->(++++[-]>)*99"
(* 356 *) let botz_Plodder               = "(>----)*2>(+)*7>(-)*17>(+)*7>(-)*7>->(-.(+)*126(+.)*4>)*21"
(* 345 *) let botz_FastTrapClearBot      = "(->)*9(+[-]>)*20"
(* 340 *) let botz_PolarBearMkII         = ""
(* 336 *) let botz_ParanoidBot           = ""
(* 319 *) let botz_Alternator            = "(>+>-)*4>+(>[-][.])*21"
(* 302 *) let botz_FastClearBot          = "(>)*9([+++[-]]>)*21"
(* 293 *) let botz_PyBot                 = "------>>->>->>->>->>[-]++>[-]>[-]++>[-]>[-]+>[-]+>[-]+++>[-]+>[-]>[-]>[-]>[-]+++>[-]++>[-]+>[-]++>[-]>[-]+>[-]>[-]>[-]+>[-]++"
(* 293 *) let botz_DecoyBot              = ">(+)*10>(-)*10(>+>-)*3(>[-].)*21"
(* 291 *) let botz_BestOffense           = ">-->+[+]<[-](>(-)*50)*10(>[+])*100"
(* 289 *) let botz_Backtracker           = "(>)*9((-)*4<+<-<(+)*4<)*2(>)*8(>[-])*21(>)*9((-)*4<+<-<(+)*4<)*2(>)*8 (>[-])*21"
(* 280 *) let botz_ScribeBot             = "--->(-)*128>(-)*19>(+)*128>(+)*19(>)*5([<[-]>(-[)*20(+)*20(+[)*20<+>[+](])*20(])*20<[>>([-]>[+]>)*10]>>((-[)*20(+)*20(+[)*20[+](])*20(])*20>)*20]>)*20"
(* 268 *) let botz_Geronimo              = "(>)*9(>[-])*21"
(* 239 *) let botz_CropCircleBot         = "[>>[+][-]-<[-][+]+][>[+][-]<[-][+]++]"
(* 233 *) let botz_CleanUpOnAisleSix     = "(>)*5(-)*4>+[](>[+[-]])*27"
(* 230 *) let botz_ConBot                = ">+[.]<(-)*10000"
(* 222 *) let botz_128Bot                = ">>(+)*128<(+)*128(>)*8([-]>)*21"
(* 219 *) let botz_EndTitled             = ""
(* 215 *) let botz_CloakingDeviceBot     = "(-)*127(-+--+-++)*12500"
(* 206 *) let botz_GetOffMate            = "(>)*19([(+)*6[-]]>)*11"
(* 205 *) let botz_ScaredyBot            = ""
(* 202 *) let botz_CleverAndDetermined   = ">+>-(>+++[-])*21"
(* 202 *) let botz_CantTouchThis         = ""
(* 174 *) let botz_StubbornBot           = ">([+]-)*1000"
(* 168 *) let botz_StallBot              = "-[+-]"
(* 157 *) let botz_Gambler               = "(>)*19(>[-])*11"
(* 129 *) let botz_RussianRoulette       = "(>->[(+)*10])*5(-)*10"
(* 123 *) let botz_DoNothingBot          = "."
(* 115 *) let botz_Dumbot                = "(+)*50(>-)*7(([.])*50(+)*50>)*7([-])*256"
(* 112 *) let botz_PacifistBot           = "(.)*8>([(>)*8[(<)*8]].)*6249"
(* 92  *) let botz_DontUnderstand        = ""
(* 83  *) let botz_PatientBot            = ">++>->->+>+>->->+(>+[-[-[(<)*9--[<--](+)*10000]]])*20"
(* 70  *) let botz_Dumberbot             = "[-]"
(* 68  *) let botz_MetaJSRandomBot       = "+[[>-[->+]>>[-]>-<<[>][+]<]+<]->"
(* 61  *) let botz_TheRetard             = "[+]"
(* 61  *) let botz_Roomba                = "((>)*2((<)*2(+)*10)[>(-)*10])*100"
(* 31  *) let botz_PrussianRoulette      = ">(+)*5(-.[>.[>(-)*10]]>>)*1000"
(* 0   *) let botz_Dumbestbot            = "<"
 *******)