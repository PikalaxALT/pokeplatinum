    .include "macros/scrcmd.inc"

    .data

    ScriptEntry _0012
    ScriptEntry _0028
    ScriptEntry _003E
    ScriptEntry _005B
    .short 0xFD13

_0012:
    ScrCmd_049 0x5DC
    ScrCmd_060
    ScrCmd_068
    ScrCmd_014 0x7E3
    ScrCmd_035
    ScrCmd_147 1
    ScrCmd_061
    End

_0028:
    ScrCmd_049 0x5DC
    ScrCmd_060
    ScrCmd_068
    ScrCmd_014 0x7E3
    ScrCmd_035
    ScrCmd_148 3
    ScrCmd_061
    End

_003E:
    ScrCmd_0D1 0, 26
    ScrCmd_0D1 1, 0x14A
    ScrCmd_049 0x5DC
    ScrCmd_060
    ScrCmd_068
    ScrCmd_02C 0
    ScrCmd_031
    ScrCmd_034
    ScrCmd_061
    End

_005B:
    ScrCmd_049 0x5DC
    ScrCmd_060
    ScrCmd_068
    ScrCmd_02C 1
    ScrCmd_031
    ScrCmd_034
    ScrCmd_061
    End

    .byte 0
    .byte 0
