    .include "macros/scrcmd.inc"

    .data

    ScriptEntry _000E
    ScriptEntry _0021
    ScriptEntry _0034
    .short 0xFD13

_000E:
    ScrCmd_049 0x5DC
    ScrCmd_060
    ScrCmd_068
    ScrCmd_02C 0
    ScrCmd_031
    ScrCmd_034
    ScrCmd_061
    End

_0021:
    ScrCmd_049 0x5DC
    ScrCmd_060
    ScrCmd_068
    ScrCmd_02C 1
    ScrCmd_031
    ScrCmd_034
    ScrCmd_061
    End

_0034:
    ScrCmd_049 0x5DC
    ScrCmd_060
    ScrCmd_068
    GoToIfSet 193, _00A1
    ScrCmd_1C0 0x800C, 74
    GoToIfEq 0x800C, 0, _0096
    ScrCmd_02C 3
    SetVar 0x8004, 14
    SetVar 0x8005, 1
    ScrCmd_07D 0x8004, 0x8005, 0x800C
    GoToIfEq 0x800C, 0, _008C
    SetFlag 193
    ScrCmd_014 0x7E0
    ScrCmd_034
    ScrCmd_061
    End

_008C:
    ScrCmd_014 0x7E1
    ScrCmd_034
    ScrCmd_061
    End

_0096:
    ScrCmd_02C 2
    ScrCmd_031
    ScrCmd_034
    ScrCmd_061
    End

_00A1:
    ScrCmd_02C 4
    ScrCmd_031
    ScrCmd_034
    ScrCmd_061
    End
