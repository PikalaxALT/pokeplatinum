    .include "macros/scrcmd.inc"

    .data

    ScriptEntry _0016
    ScriptEntry _001C
    ScriptEntry _007C
    ScriptEntry _0108
    ScriptEntry _02D5
    .short 0xFD13

_0016:
    SetFlag 0x9E7
    End

_001C:
    ScrCmd_049 0x5DC
    ScrCmd_060
    ScrCmd_068
    GoToIfSet 0xAA0, _0067
    ScrCmd_02C 0
    ScrCmd_1B7 0x8004, 26
    AddVar 0x8004, 149
    SetVar 0x8005, 1
    ScrCmd_07D 0x8004, 0x8005, 0x800C
    GoToIfEq 0x800C, 0, _0072
    SetFlag 0xAA0
    ScrCmd_014 0x7E0
    ScrCmd_034
    ScrCmd_061
    End

_0067:
    ScrCmd_02C 1
    ScrCmd_031
    ScrCmd_034
    ScrCmd_061
    End

_0072:
    ScrCmd_014 0x7E1
    ScrCmd_034
    ScrCmd_061
    End

_007C:
    ScrCmd_049 0x5DC
    ScrCmd_060
    ScrCmd_068
    GoToIfEq 0x4000, 1, _00ED
    ScrCmd_134 7, 0x800C
    GoToIfEq 0x800C, 1, _00FD
    ScrCmd_02C 2
    ScrCmd_03E 0x800C
    GoToIfEq 0x800C, 0, _00C7
    GoToIfEq 0x800C, 1, _00E2
    End

_00C7:
    ScrCmd_02C 3
    SetVar 0x4000, 1
    SetVar 0x8004, 7
    ScrCmd_014 0x7D9
    ScrCmd_031
    ScrCmd_034
    ScrCmd_061
    End

_00E2:
    ScrCmd_02C 4
    ScrCmd_031
    ScrCmd_034
    ScrCmd_061
    End

_00ED:
    ScrCmd_0D7 0, 7
    ScrCmd_02C 5
    ScrCmd_031
    ScrCmd_034
    ScrCmd_061
    End

_00FD:
    ScrCmd_02C 6
    ScrCmd_031
    ScrCmd_034
    ScrCmd_061
    End

_0108:
    ScrCmd_049 0x5DC
    ScrCmd_060
    ScrCmd_068
    ScrCmd_02C 7
    ScrCmd_072 20, 2
    ScrCmd_040 1, 1, 0, 1, 0x800C
    ScrCmd_042 223, 0
    ScrCmd_042 224, 1
    ScrCmd_042 225, 2
    ScrCmd_042 226, 3
    ScrCmd_042 227, 4
    ScrCmd_043
    SetVar 0x8000, 0x800C
    SetVar 0x8008, 0x8000
    GoToIfEq 0x8008, 0, _0245
    GoToIfEq 0x8008, 1, _0251
    GoToIfEq 0x8008, 2, _025D
    GoToIfEq 0x8008, 3, _0269
    ScrCmd_02C 9
    GoTo _0229

_0180:
    CallIfEq 0x8000, 0, _0275
    CallIfEq 0x8000, 1, _027F
    CallIfEq 0x8000, 2, _0289
    CallIfEq 0x8000, 3, _0293
    GoToIfEq 0x800C, 0, _023C
    ScrCmd_07D 0x8001, 1, 0x800C
    GoToIfEq 0x800C, 0, _0233
    CallIfEq 0x8000, 0, _029D
    CallIfEq 0x8000, 1, _02AB
    CallIfEq 0x8000, 2, _02B9
    CallIfEq 0x8000, 3, _02C7
    ScrCmd_074
    ScrCmd_049 0x644
    ScrCmd_07B 0x8001, 1, 0x800C
    ScrCmd_0D1 0, 0x8001
    ScrCmd_02C 10
    ScrCmd_02C 8
    GoTo _0229

_0229:
    ScrCmd_031
    ScrCmd_034
    ScrCmd_073
    ScrCmd_061
    End

_0233:
    ScrCmd_02C 11
    GoTo _0229

_023C:
    ScrCmd_02C 12
    GoTo _0229

_0245:
    SetVar 0x8001, 95
    GoTo _0180

_0251:
    SetVar 0x8001, 96
    GoTo _0180

_025D:
    SetVar 0x8001, 97
    GoTo _0180

_0269:
    SetVar 0x8001, 98
    GoTo _0180

_0275:
    ScrCmd_071 0x800C, 200
    Return

_027F:
    ScrCmd_071 0x800C, 200
    Return

_0289:
    ScrCmd_071 0x800C, 200
    Return

_0293:
    ScrCmd_071 0x800C, 200
    Return

_029D:
    ScrCmd_334 35, 200
    ScrCmd_070 200
    Return

_02AB:
    ScrCmd_334 35, 200
    ScrCmd_070 200
    Return

_02B9:
    ScrCmd_334 35, 200
    ScrCmd_070 200
    Return

_02C7:
    ScrCmd_334 35, 200
    ScrCmd_070 200
    Return

_02D5:
    ScrCmd_049 0x5DC
    ScrCmd_060
    ScrCmd_068
    ScrCmd_02C 13
    GoTo _02E8
    End

_02E8:
    ScrCmd_02C 14
    ScrCmd_041 30, 7, 0, 1, 0x800C
    ScrCmd_33A 1
    ScrCmd_042 19, 0
    ScrCmd_042 20, 1
    ScrCmd_042 21, 2
    ScrCmd_042 22, 3
    ScrCmd_042 23, 4
    ScrCmd_043
    SetVar 0x8008, 0x800C
    GoToIfEq 0x8008, 0, _035B
    GoToIfEq 0x8008, 1, _0366
    GoToIfEq 0x8008, 2, _0371
    GoToIfEq 0x8008, 3, _037C
    GoToIfEq 0x8008, 4, _0387
    GoTo _0387
    End

_035B:
    ScrCmd_02C 15
    GoTo _02E8
    End

_0366:
    ScrCmd_02C 16
    GoTo _02E8
    End

_0371:
    ScrCmd_02C 17
    GoTo _02E8
    End

_037C:
    ScrCmd_02C 18
    GoTo _02E8
    End

_0387:
    ScrCmd_034
    ScrCmd_061
    End

    .byte 0
    .byte 0
    .byte 0
