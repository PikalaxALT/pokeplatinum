    .include "macros/scrcmd.inc"

    .data

    ScriptEntry _000A
    ScriptEntry _0010
    .short 0xFD13

_000A:
    SetFlag 0x9EA
    End

_0010:
    ScrCmd_049 0x5DC
    ScrCmd_060
    ScrCmd_068
    GoToIfSet 0x100, _0041
    SetFlag 0x100
    ScrCmd_02C 0
    ScrCmd_03E 0x800C
    GoToIfEq 0x800C, 1, _005B
    GoTo _00A2

_0041:
    ScrCmd_02C 1
    ScrCmd_03E 0x800C
    GoToIfEq 0x800C, 1, _005B
    GoTo _00A2

_005B:
    ScrCmd_02C 2
    ScrCmd_031
    ScrCmd_034
    ScrCmd_061
    End

_0066:
    ScrCmd_02C 3
    ScrCmd_031
    ScrCmd_034
    ScrCmd_061
    End

_0071:
    ScrCmd_02C 6
    ScrCmd_031
    ScrCmd_034
    ScrCmd_061
    End

_007C:
    ScrCmd_02C 7
    ScrCmd_031
    ScrCmd_034
    ScrCmd_061
    End

_0087:
    ScrCmd_0D4 0, 0x1B2
    ScrCmd_02C 8
    ScrCmd_031
    ScrCmd_034
    ScrCmd_061
    End

_0097:
    ScrCmd_02C 5
    ScrCmd_031
    ScrCmd_034
    ScrCmd_061
    End

_00A2:
    ScrCmd_177 0x4000
_00A6:
    SubVar 0x4000, 1
    ScrCmd_198 0x4000, 0x800C
    GoToIfEq 0x800C, 0, _00FC
    ScrCmd_248 0x8004, 0x8005, 0x4000
    GoToIfEq 0x8004, 16, _00E7
    GoToIfEq 0x8005, 16, _00E7
    GoTo _00FC

_00E7:
    ScrCmd_099 0x800C, 0x1B2, 0x4000
    GoToIfEq 0x800C, 0, _010F
_00FC:
    GoToIfNe 0x4000, 0, _00A6
    GoTo _0066

_010F:
    ScrCmd_02C 4
    ScrCmd_034
    ScrCmd_0BC 6, 1, 0, 0
    ScrCmd_0BD
    ScrCmd_191
    ScrCmd_193 0x8000
    ScrCmd_0A1
    ScrCmd_0BC 6, 1, 1, 0
    ScrCmd_0BD
    GoToIfEq 0x8000, 0xFF, _005B
    ScrCmd_198 0x8000, 0x8001
    GoToIfEq 0x8001, 0, _007C
    Call _01D7
    GoToIfEq 0x800C, 0, _0071
    ScrCmd_099 0x800C, 0x1B2, 0x8000
    GoToIfEq 0x800C, 1, _0087
    ScrCmd_1B9 0x800C, 0x8000
    GoToIfLt 0x800C, 0xFF, _0097
    SetVar 0x8003, 0x1B2
    GoTo _019B

_019B:
    ScrCmd_0BC 6, 1, 0, 0
    ScrCmd_0BD
    ScrCmd_224 0x8000, 0x1B2
    ScrCmd_225 0x800C
    ScrCmd_0A1
    ScrCmd_0BC 6, 1, 1, 0
    ScrCmd_0BD
    GoToIfEq 0x800C, 0xFF, _005B
    ScrCmd_02C 16
    ScrCmd_031
    ScrCmd_034
    ScrCmd_061
    End

_01D7:
    ScrCmd_248 0x8004, 0x8005, 0x8000
    GoToIfEq 0x8004, 16, _0201
    GoToIfEq 0x8005, 16, _0201
    SetVar 0x800C, 0
    Return

_0201:
    SetVar 0x800C, 1
    Return

    .byte 0
    .byte 0
    .byte 0
