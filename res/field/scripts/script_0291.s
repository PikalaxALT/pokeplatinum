    .include "macros/scrcmd.inc"

    .data

    ScriptEntry _001C
    ScriptEntry _0037
    ScriptEntry _00A5
    ScriptEntry _0116
    ScriptEntry _001A
    ScriptEntry _0127
    .short 0xFD13

_001A:
    End

_001C:
    GoToIfSet 142, _0029
    End

_0029:
    SetFlag 0x250
    ScrCmd_065 0
    ClearFlag 142
    End

_0037:
    ScrCmd_060
    ScrCmd_049 0x5DC
    ScrCmd_04B 0x5DC
    ScrCmd_04C 0x1E7, 0
    ScrCmd_02C 0
    ScrCmd_034
    SetFlag 142
    ScrCmd_2BD 0x1E7, 47
    ClearFlag 142
    ScrCmd_0EC 0x800C
    GoToIfEq 0x800C, 0, _009B
    ScrCmd_2BC 0x800C
    GoToIfEq 0x800C, 1, _0090
    GoTo _0084
    End

_0084:
    SetFlag 0x121
    SetFlag 0x250
    ScrCmd_061
    End

_0090:
    ScrCmd_02C 1
    ScrCmd_031
    ScrCmd_034
    ScrCmd_061
    End

_009B:
    ClearFlag 0x250
    ScrCmd_0EB
    ScrCmd_061
    End

_00A5:
    ScrCmd_049 0x5DC
    ScrCmd_060
    GoToIfEq 0x410C, 3, _00F4
    GoToIfLt 0x410C, 15, _0100
    SetVar 0x8004, 90
_00CB:
    SetVar 0x8005, 1
    ScrCmd_07D 0x8004, 0x8005, 0x800C
    GoToIfEq 0x800C, 0, _010C
    ScrCmd_014 0x7E0
    ScrCmd_034
    ScrCmd_065 1
    ScrCmd_061
    End

_00F4:
    SetVar 0x8004, 0x145
    GoTo _00CB

_0100:
    SetVar 0x8004, 106
    GoTo _00CB

_010C:
    ScrCmd_014 0x7E1
    ScrCmd_034
    ScrCmd_061
    End

_0116:
    ScrCmd_049 0x5DC
    ScrCmd_060
    ScrCmd_02C 4
    ScrCmd_031
    ScrCmd_034
    ScrCmd_061
    End

_0127:
    ScrCmd_049 0x5DC
    ScrCmd_060
    ScrCmd_02C 2
    ScrCmd_03E 0x800C
    GoToIfEq 0x800C, 0, _0149
    GoTo _017F
    End

_0149:
    ScrCmd_0CD 0
    ScrCmd_02C 3
    ScrCmd_034
    ScrCmd_049 0x5D2
    ScrCmd_328 1
    ScrCmd_0BC 6, 1, 0, 0
    ScrCmd_0BD
    ScrCmd_0BE 0x247, 0, 116, 75, 1
    ScrCmd_0BC 6, 1, 1, 0
    ScrCmd_0BD
    End

_017F:
    ScrCmd_034
    ScrCmd_061
    End

    .byte 0
    .byte 0
    .byte 0
