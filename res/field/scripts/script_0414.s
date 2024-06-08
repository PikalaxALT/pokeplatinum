    .include "macros/scrcmd.inc"

    .data

    ScriptEntry _0012
    ScriptEntry _004E
    ScriptEntry _0066
    ScriptEntry _014C
    .short 0xFD13

_0012:
    GoToIfUnset 0x13E, _002A
    GoToIfSet 0x13E, _003C
    End

_002A:
    ScrCmd_18A 2, 80, 0x348
    ScrCmd_18A 3, 81, 0x348
    End

_003C:
    ScrCmd_18A 1, 80, 0x348
    ScrCmd_18A 0, 81, 0x348
    End

_004E:
    GoToIfUnset 0x13E, _002A
    GoToIfSet 0x13E, _003C
    End

_0066:
    ScrCmd_060
    ApplyMovement 242, _0124
    ApplyMovement 0xFF, _0144
    WaitMovement
    ScrCmd_0CE 0
    ScrCmd_02C 0
    ScrCmd_034
    ScrCmd_069 0x8004, 0x8005
    GoToIfEq 0x8004, 80, _00D8
    GoToIfEq 0x8004, 81, _00D8
    GoToIfEq 0x8004, 82, _00D8
    GoToIfEq 0x8004, 83, _00D8
    GoToIfEq 0x8004, 84, _00D8
    GoToIfEq 0x8004, 85, _00D8
    End

_00D8:
    ApplyMovement 0xFF, _0138
    ApplyMovement 242, _012C
    WaitMovement
    GoTo _00F0

_00F0:
    SetVar 0x4082, 1
    ScrCmd_061
    ScrCmd_049 0x603
    ScrCmd_0BC 6, 1, 0, 0
    ScrCmd_0BD
    ScrCmd_0BE 0x137, 0, 46, 54, 0
    ScrCmd_0BC 6, 1, 1, 0
    ScrCmd_0BD
    End

    .balign 4, 0
_0124:
    MoveAction_020
    EndMovement

    .balign 4, 0
_012C:
    MoveAction_00C 2
    MoveAction_045
    EndMovement

    .balign 4, 0
_0138:
    MoveAction_00C
    MoveAction_045
    EndMovement

    .balign 4, 0
_0144:
    MoveAction_021
    EndMovement

_014C:
    ScrCmd_037 3, 0
    ScrCmd_038 3
    ScrCmd_039
    ScrCmd_03A 3, 0x800C
    ScrCmd_014 0x7D0
    End

    .byte 0
    .byte 0
    .byte 0
