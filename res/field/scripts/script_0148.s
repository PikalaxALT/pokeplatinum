    .include "macros/scrcmd.inc"

    .data

    ScriptEntry _0032
    ScriptEntry _0045
    ScriptEntry _0058
    ScriptEntry _006B
    ScriptEntry _007E
    ScriptEntry _0091
    ScriptEntry _00A4
    ScriptEntry _00FE
    ScriptEntry _022A
    ScriptEntry _06FE
    ScriptEntry _00E8
    ScriptEntry _0708
    .short 0xFD13

_0032:
    ScrCmd_049 0x5DC
    ScrCmd_060
    ScrCmd_068
    ScrCmd_02C 2
    ScrCmd_031
    ScrCmd_034
    ScrCmd_061
    End

_0045:
    ScrCmd_049 0x5DC
    ScrCmd_060
    ScrCmd_068
    ScrCmd_02C 3
    ScrCmd_031
    ScrCmd_034
    ScrCmd_061
    End

_0058:
    ScrCmd_049 0x5DC
    ScrCmd_060
    ScrCmd_068
    ScrCmd_02C 4
    ScrCmd_031
    ScrCmd_034
    ScrCmd_061
    End

_006B:
    ScrCmd_049 0x5DC
    ScrCmd_060
    ScrCmd_068
    ScrCmd_02C 5
    ScrCmd_031
    ScrCmd_034
    ScrCmd_061
    End

_007E:
    ScrCmd_049 0x5DC
    ScrCmd_060
    ScrCmd_068
    ScrCmd_02C 6
    ScrCmd_031
    ScrCmd_034
    ScrCmd_061
    End

_0091:
    ScrCmd_049 0x5DC
    ScrCmd_060
    ScrCmd_068
    ScrCmd_02C 7
    ScrCmd_031
    ScrCmd_034
    ScrCmd_061
    End

_00A4:
    ScrCmd_049 0x5DC
    ScrCmd_060
    GoToIfSet 185, _00D0
    SetFlag 185
    SetFlag 0x185
    ScrCmd_02C 0
    ScrCmd_068
    ScrCmd_0CD 0
    ScrCmd_02C 1
    GoTo _00E0
    End

_00D0:
    ScrCmd_068
    ScrCmd_0CD 0
    ScrCmd_02C 1
    GoTo _00E0
    End

_00E0:
    ScrCmd_031
    ScrCmd_034
    ScrCmd_061
    End

_00E8:
    ScrCmd_049 0x5DC
    ScrCmd_060
    ScrCmd_068
    ScrCmd_014 0x7E3
    ScrCmd_035
    ScrCmd_148 19
    ScrCmd_061
    End

_00FE:
    ScrCmd_049 0x5DC
    ScrCmd_060
    ScrCmd_068
    ScrCmd_072 20, 2
    ScrCmd_02C 8
    ScrCmd_041 31, 11, 0, 1, 0x800C
    ScrCmd_33A 1
    ScrCmd_042 14, 0
    ScrCmd_042 15, 1
    ScrCmd_042 16, 2
    ScrCmd_043
    SetVar 0x8008, 0x800C
    GoToIfEq 0x8008, 0, _0150
    GoToIfEq 0x8008, 1, _018F
    GoTo _0215
    End

_0150:
    SetVar 0x8004, 1
    SetVar 0x8005, 200
    ScrCmd_07D 42, 0x8004, 0x800C
    GoToIfEq 0x800C, 0, _01FF
    ScrCmd_1AB 0x800C, 200
    GoToIfEq 0x800C, 0, _020A
    ScrCmd_02C 9
    GoTo _01CE
    End

_018F:
    SetVar 0x8004, 10
    SetVar 0x8005, 0x7D0
    ScrCmd_07D 42, 0x8004, 0x800C
    GoToIfEq 0x800C, 0, _01FF
    ScrCmd_1AB 0x800C, 0x7D0
    GoToIfEq 0x800C, 0, _020A
    ScrCmd_02C 10
    GoTo _01CE
    End

_01CE:
    ScrCmd_07B 42, 0x8004, 0x800C
    ScrCmd_049 0x644
    ScrCmd_334 35, 0x8005
    ScrCmd_1A3 0x8005
    ScrCmd_074
    ScrCmd_04B 0x644
    CallIfLt 0x4042, 0x2710, _0700
    GoTo _0220
    End

_01FF:
    ScrCmd_02C 11
    GoTo _0220
    End

_020A:
    ScrCmd_02C 12
    GoTo _0220
    End

_0215:
    ScrCmd_02C 13
    GoTo _0220
    End

_0220:
    ScrCmd_031
    ScrCmd_034
    ScrCmd_073
    ScrCmd_061
    End

_022A:
    ScrCmd_049 0x5DC
    ScrCmd_060
    ScrCmd_068
    ScrCmd_072 20, 2
    ScrCmd_02C 17
    ScrCmd_03E 0x800C
    GoToIfEq 0x800C, 0, _025B
    GoToIfEq 0x800C, 1, _0306
    End

_025B:
    ScrCmd_07E 0x1C1, 1, 0x800C
    GoToIfEq 0x800C, 0, _0537
    Call _0697
    SetVar 0x8008, 0x800C
    GoToIfEq 0x8008, 0, _031B
    GoToIfEq 0x8008, 1, _0344
    GoToIfEq 0x8008, 2, _036D
    GoToIfEq 0x8008, 3, _0396
    GoToIfEq 0x8008, 4, _03BF
    GoToIfEq 0x8008, 5, _03E8
    GoToIfEq 0x8008, 6, _0411
    GoToIfEq 0x8008, 7, _043A
    GoToIfEq 0x8008, 8, _0463
    GoToIfEq 0x8008, 9, _048C
    GoTo _0306
    End

_0306:
    ScrCmd_02C 23
    GoTo _0311
    End

_0311:
    ScrCmd_031
    ScrCmd_034
    ScrCmd_073
    ScrCmd_061
    End

_031B:
    ScrCmd_071 0x800C, 0x1900
    GoToIfEq 0x800C, 0, _052C
    SetVar 0x8005, 1
    Call _0557
    GoTo _04B5
    End

_0344:
    ScrCmd_071 0x800C, 0x1900
    GoToIfEq 0x800C, 0, _052C
    SetVar 0x8005, 1
    Call _0577
    GoTo _04B5
    End

_036D:
    ScrCmd_071 0x800C, 0x1900
    GoToIfEq 0x800C, 0, _052C
    SetVar 0x8005, 1
    Call _0597
    GoTo _04B5
    End

_0396:
    ScrCmd_071 0x800C, 0x1900
    GoToIfEq 0x800C, 0, _052C
    SetVar 0x8005, 1
    Call _05B7
    GoTo _04B5
    End

_03BF:
    ScrCmd_071 0x800C, 0x1900
    GoToIfEq 0x800C, 0, _052C
    SetVar 0x8005, 1
    Call _05D7
    GoTo _04B5
    End

_03E8:
    ScrCmd_071 0x800C, 0x1900
    GoToIfEq 0x800C, 0, _052C
    SetVar 0x8005, 1
    Call _05F7
    GoTo _04B5
    End

_0411:
    ScrCmd_071 0x800C, 0x1900
    GoToIfEq 0x800C, 0, _052C
    SetVar 0x8005, 1
    Call _0617
    GoTo _04B5
    End

_043A:
    ScrCmd_071 0x800C, 0x1900
    GoToIfEq 0x800C, 0, _052C
    SetVar 0x8005, 1
    Call _0637
    GoTo _04B5
    End

_0463:
    ScrCmd_071 0x800C, 0x1900
    GoToIfEq 0x800C, 0, _052C
    SetVar 0x8005, 1
    Call _0657
    GoTo _04B5
    End

_048C:
    ScrCmd_071 0x800C, 0x1900
    GoToIfEq 0x800C, 0, _052C
    SetVar 0x8005, 1
    Call _0677
    GoTo _04B5
    End

_04B5:
    ScrCmd_307 0x800C
    GoToIfLt 0x800C, 0x8005, _0521
    GoTo _04CE
    End

_04CE:
    GoToIfEq 0x8005, 0, _0503
    ScrCmd_289 0x800C, 0x8007, 0x8000, 0x8001, 0x8002, 0x8003, 20
    ScrCmd_334 35, 0x1900
    ScrCmd_1A3 0x1900
    SubVar 0x8005, 1
    GoTo _04CE
    End

_0503:
    ScrCmd_049 0x644
    ScrCmd_074
    CallIfLt 0x4042, 0x2710, _0700
    ScrCmd_02C 20
    GoTo _054D
    End

_0521:
    ScrCmd_02C 22
    GoTo _054D
    End

_052C:
    ScrCmd_02C 21
    GoTo _054D
    End

_0537:
    ScrCmd_02C 24
    GoTo _054D

    .byte 2
    .byte 0
    .byte 44
    .byte 0
    .byte 23
    .byte 22
    .byte 0
    .byte 2
    .byte 0
    .byte 0
    .byte 0
    .byte 2
    .byte 0

_054D:
    ScrCmd_031
    ScrCmd_034
    ScrCmd_073
    ScrCmd_061
    End

_0557:
    SetVar 0x8007, 32
    SetVar 0x8000, 32
    SetVar 0x8001, 0
    SetVar 0x8002, 0
    SetVar 0x8003, 0
    Return

_0577:
    SetVar 0x8007, 32
    SetVar 0x8000, 0
    SetVar 0x8001, 32
    SetVar 0x8002, 0
    SetVar 0x8003, 0
    Return

_0597:
    SetVar 0x8007, 32
    SetVar 0x8000, 0
    SetVar 0x8001, 0
    SetVar 0x8002, 32
    SetVar 0x8003, 0
    Return

_05B7:
    SetVar 0x8007, 32
    SetVar 0x8000, 0
    SetVar 0x8001, 0
    SetVar 0x8002, 0
    SetVar 0x8003, 32
    Return

_05D7:
    SetVar 0x8007, 0
    SetVar 0x8000, 32
    SetVar 0x8001, 32
    SetVar 0x8002, 0
    SetVar 0x8003, 0
    Return

_05F7:
    SetVar 0x8007, 0
    SetVar 0x8000, 32
    SetVar 0x8001, 0
    SetVar 0x8002, 32
    SetVar 0x8003, 0
    Return

_0617:
    SetVar 0x8007, 0
    SetVar 0x8000, 32
    SetVar 0x8001, 0
    SetVar 0x8002, 0
    SetVar 0x8003, 32
    Return

_0637:
    SetVar 0x8007, 0
    SetVar 0x8000, 0
    SetVar 0x8001, 32
    SetVar 0x8002, 32
    SetVar 0x8003, 0
    Return

_0657:
    SetVar 0x8007, 0
    SetVar 0x8000, 0
    SetVar 0x8001, 32
    SetVar 0x8002, 0
    SetVar 0x8003, 32
    Return

_0677:
    SetVar 0x8007, 0
    SetVar 0x8000, 0
    SetVar 0x8001, 0
    SetVar 0x8002, 32
    SetVar 0x8003, 32
    Return

_0697:
    ScrCmd_02C 18
    ScrCmd_045 1, 1, 0, 1, 0x800C
    ScrCmd_046 25, 0xFF, 0
    ScrCmd_046 26, 0xFF, 1
    ScrCmd_046 27, 0xFF, 2
    ScrCmd_046 28, 0xFF, 3
    ScrCmd_046 29, 0xFF, 4
    ScrCmd_046 30, 0xFF, 5
    ScrCmd_046 31, 0xFF, 6
    ScrCmd_046 32, 0xFF, 7
    ScrCmd_046 33, 0xFF, 8
    ScrCmd_046 34, 0xFF, 9
    ScrCmd_046 35, 0xFF, 10
    ScrCmd_047
    Return

_06FE:
    End

_0700:
    AddVar 0x4042, 1
    Return

_0708:
    ScrCmd_049 0x5DC
    ScrCmd_060
    ScrCmd_02C 37
    ScrCmd_031
    ScrCmd_034
    ScrCmd_061
    End

    .byte 0
    .byte 0
    .byte 0
