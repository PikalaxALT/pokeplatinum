    .include "macros/scrcmd.inc"

    .data

    ScriptEntry _002E
    ScriptEntry _0041
    ScriptEntry _0054
    ScriptEntry _0012
    .short 0xFD13

_0012:
    ScrCmd_22D 2, 0x4000
    GoToIfEq 0x4000, 0, _002C
    SetFlag 0x27F
    SetFlag 0x280
_002C:
    End

_002E:
    ScrCmd_049 0x5DC
    ScrCmd_060
    ScrCmd_068
    ScrCmd_02C 0
    ScrCmd_031
    ScrCmd_034
    ScrCmd_061
    End

_0041:
    ScrCmd_049 0x5DC
    ScrCmd_060
    ScrCmd_068
    ScrCmd_02C 1
    ScrCmd_031
    ScrCmd_034
    ScrCmd_061
    End

_0054:
    ScrCmd_036 2, 2, 0, 0x800C
    ScrCmd_038 3
    ScrCmd_039
    ScrCmd_03B 0x800C
    ScrCmd_014 0x7D0
    End

    .byte 0
