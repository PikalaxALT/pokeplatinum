    .include "macros/scrcmd.inc"

    .data

    ScriptEntry _001A
    ScriptEntry _00F9
    ScriptEntry _014A
    ScriptEntry _01A1
    ScriptEntry _020D
    ScriptEntry _0266
    .short 0xFD13

_001A:
    ScrCmd_049 0x5DC
    ScrCmd_060
    ScrCmd_068
    GoToIfGe 0x4086, 3, _003D
    ScrCmd_0CD 1
    ScrCmd_02C 1
    ScrCmd_031
    ScrCmd_034
    ScrCmd_061
    End

_003D:
    GoToIfGe 0x40CA, 5, _009C
    GoToIfEq 0x40CA, 4, _00AA
    GoToIfEq 0x40CA, 3, _00BA
    GoToIfEq 0x40CA, 2, _00CA
    GoToIfEq 0x40CA, 1, _00DD
    ScrCmd_0CE 0
    ScrCmd_02C 2
    ScrCmd_031
    GoTo _00ED

    .byte 2
    .byte 0
    .byte 206
    .byte 0
    .byte 0
    .byte 44
    .byte 0
    .byte 8
    .byte 49
    .byte 0
    .byte 52
    .byte 0
    .byte 97
    .byte 0
    .byte 2
    .byte 0

_009C:
    ScrCmd_0CE 0
    ScrCmd_02C 7
    ScrCmd_031
    ScrCmd_034
    ScrCmd_061
    End

_00AA:
    ScrCmd_0CE 0
    ScrCmd_02C 6
    ScrCmd_031
    GoTo _00ED
    End

_00BA:
    ScrCmd_0CE 0
    ScrCmd_02C 5
    ScrCmd_031
    GoTo _00ED
    End

_00CA:
    ScrCmd_0CE 0
    ScrCmd_0DC 1
    ScrCmd_02C 4
    ScrCmd_031
    GoTo _00ED
    End

_00DD:
    ScrCmd_0CE 0
    ScrCmd_02C 3
    ScrCmd_031
    GoTo _00ED
    End

_00ED:
    AddVar 0x40CA, 1
    ScrCmd_034
    ScrCmd_061
    End

_00F9:
    ScrCmd_049 0x5DC
    ScrCmd_060
    ScrCmd_068
    GoToIfGe 0x40CB, 2, _0126
    GoToIfEq 0x40CB, 1, _0131
    ScrCmd_0CE 0
    GoTo _013C
    End

_0126:
    ScrCmd_0CE 0
    ScrCmd_031
    ScrCmd_034
    ScrCmd_061
    End

_0131:
    ScrCmd_0CE 0
    GoTo _013C
    End

_013C:
    ScrCmd_031
    ScrCmd_034
    AddVar 0x40CB, 1
    ScrCmd_061
    End

_014A:
    ScrCmd_049 0x5DC
    ScrCmd_060
    ScrCmd_068
    GoToIfGe 0x40E8, 2, _0185
    GoToIfEq 0x40E8, 1, _017A
    ScrCmd_0CD 0
    ScrCmd_02C 12
    GoTo _0193
    End

_017A:
    ScrCmd_02C 13
    GoTo _0193
    End

_0185:
    ScrCmd_0CD 0
    ScrCmd_02C 14
    ScrCmd_031
    ScrCmd_034
    ScrCmd_061
    End

_0193:
    AddVar 0x40E8, 1
    ScrCmd_031
    ScrCmd_034
    ScrCmd_061
    End

_01A1:
    ScrCmd_049 0x5DC
    ScrCmd_060
    ScrCmd_068
    GoToIfGe 0x40E1, 3, _01F4
    GoToIfEq 0x40E1, 2, _01E9
    GoToIfEq 0x40E1, 1, _01DE
    ScrCmd_0CD 0
    ScrCmd_02C 42
    GoTo _01FF
    End

_01DE:
    ScrCmd_02C 43
    GoTo _01FF
    End

_01E9:
    ScrCmd_02C 44
    GoTo _01FF
    End

_01F4:
    ScrCmd_02C 45
    ScrCmd_031
    ScrCmd_034
    ScrCmd_061
    End

_01FF:
    AddVar 0x40E1, 1
    ScrCmd_031
    ScrCmd_034
    ScrCmd_061
    End

_020D:
    ScrCmd_049 0x5DC
    ScrCmd_060
    ScrCmd_068
    GoToIfGe 0x40E2, 2, _0248
    GoToIfEq 0x40E2, 1, _023D
    ScrCmd_0CD 0
    ScrCmd_02C 19
    GoTo _0256
    End

_023D:
    ScrCmd_02C 20
    GoTo _0256
    End

_0248:
    ScrCmd_0CD 0
    ScrCmd_02C 21
    ScrCmd_031
    ScrCmd_034
    ScrCmd_061
    End

_0256:
    AddVar 0x40E2, 1
    ScrCmd_031
    ScrCmd_034
    ScrCmd_061
    End
    End

_0266:
    ScrCmd_049 0x5DC
    ScrCmd_060
    ScrCmd_068
    GoToIfGe 0x40E4, 1, _0289
    ScrCmd_0CD 0
    ScrCmd_02C 38
    GoTo _0294
    End

_0289:
    ScrCmd_02C 39
    ScrCmd_031
    ScrCmd_034
    ScrCmd_061
    End

_0294:
    AddVar 0x40E4, 1
    ScrCmd_031
    ScrCmd_034
    ScrCmd_061
    End

    .byte 0
    .byte 0
