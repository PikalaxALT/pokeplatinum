    .include "macros/scrcmd.inc"

    .data

    ScriptEntry _000A
    ScriptEntry _003A
    .short 0xFD13

_000A:
    ScrCmd_049 0x5DC
    ScrCmd_060
    ScrCmd_068
    ScrCmd_22D 2, 0x800C
    GoToIfEq 0x800C, 1, _002F
    ScrCmd_02C 0
    ScrCmd_031
    ScrCmd_034
    ScrCmd_061
    End

_002F:
    ScrCmd_02C 1
    ScrCmd_031
    ScrCmd_034
    ScrCmd_061
    End

_003A:
    ScrCmd_049 0x5DC
    ScrCmd_060
    ScrCmd_068
    ScrCmd_22D 2, 0x800C
    GoToIfEq 0x800C, 1, _009A
    GoTo _005A

_005A:
    ScrCmd_14D 0x800C
    GoToIfEq 0x800C, 0, _007A
    GoToIfEq 0x800C, 1, _0086
    End

_007A:
    ScrCmd_0CD 0
    ScrCmd_02C 2
    GoTo _0092

_0086:
    ScrCmd_0CD 0
    ScrCmd_02C 3
    GoTo _0092

_0092:
    ScrCmd_031
    ScrCmd_034
    ScrCmd_061
    End

_009A:
    GoToIfUnset 0x964, _005A
    GoToIfSet 240, _00C4
    SetFlag 240
    ScrCmd_21B
    ScrCmd_0CD 0
    ScrCmd_02C 4
    ScrCmd_031
    ScrCmd_034
    ScrCmd_061
    End

_00C4:
    ScrCmd_0CD 0
    ScrCmd_0E3 0x4001, 0x4000
    ScrCmd_0E2 1, 0x4001
    ScrCmd_0DA 2, 0x4000, 0, 1
    ScrCmd_14D 0x800C
    GoToIfEq 0x800C, 0, _00FA
    GoToIfEq 0x800C, 1, _0103
    End

_00FA:
    ScrCmd_02C 5
    GoTo _010F

_0103:
    ScrCmd_0CD 0
    ScrCmd_02C 6
    GoTo _010F

_010F:
    ScrCmd_031
    ScrCmd_034
    ScrCmd_061
    End

    .byte 0
