    .include "macros/scrcmd.inc"

    .data

    ScriptEntry _0032
    ScriptEntry _0308
    ScriptEntry _03AD
    ScriptEntry _03C4
    ScriptEntry _031B
    ScriptEntry _032C
    ScriptEntry _033D
    ScriptEntry _0350
    ScriptEntry _0361
    ScriptEntry _0374
    ScriptEntry _0387
    ScriptEntry _039A
    .short 0xFD13

_0032:
    ScrCmd_060
    ScrCmd_069 0x8004, 0x8005
    CallIfEq 0x8004, 23, _01A8
    CallIfEq 0x8004, 24, _01BA
    CallIfEq 0x8004, 25, _01CC
    CallIfEq 0x8004, 26, _01DE
    ClearFlag 0x276
    ScrCmd_064 11
    ScrCmd_062 11
    ApplyMovement 11, _02C8
    ApplyMovement 0xFF, _0290
    WaitMovement
    ScrCmd_049 0x602
    ScrCmd_0CD 1
    ScrCmd_02C 0
    ScrCmd_034
    ScrCmd_003 30, 0x800C
    ApplyMovement 11, _02D0
    WaitMovement
    ScrCmd_02C 1
    ScrCmd_034
    ApplyMovement 11, _02E0
    WaitMovement
    ScrCmd_02C 2
    ApplyMovement 11, _02E8
    WaitMovement
    ScrCmd_02C 3
    ScrCmd_034
    ScrCmd_069 0x8004, 0x8005
    CallIfEq 0x8004, 23, _01F0
    CallIfEq 0x8004, 24, _0204
    CallIfEq 0x8004, 25, _0218
    CallIfEq 0x8004, 26, _022C
    ScrCmd_065 11
    ClearFlag 0x277
    ScrCmd_064 12
    ScrCmd_062 12
    ApplyMovement 12, _02C8
    ApplyMovement 0xFF, _0290
    WaitMovement
    ScrCmd_049 0x602
    ScrCmd_0CE 0
    ScrCmd_0CD 1
    ScrCmd_02C 4
    ScrCmd_034
    ScrCmd_003 30, 0x800C
    CallIfLt 0x409E, 1, _019E
    CallIfGe 0x409E, 1, _01A3
    ScrCmd_034
    ScrCmd_069 0x8004, 0x8005
    CallIfEq 0x8004, 23, _0240
    CallIfEq 0x8004, 24, _0254
    CallIfEq 0x8004, 25, _0268
    CallIfEq 0x8004, 26, _027C
    ScrCmd_065 12
    SetVar 0x410E, 1
    ScrCmd_061
    End

_019E:
    ScrCmd_02C 5
    Return

_01A3:
    ScrCmd_02C 6
    Return

_01A8:
    ScrCmd_186 11, 23, 41
    ScrCmd_186 12, 23, 40
    Return

_01BA:
    ScrCmd_186 11, 24, 41
    ScrCmd_186 12, 24, 40
    Return

_01CC:
    ScrCmd_186 11, 25, 41
    ScrCmd_186 12, 25, 40
    Return

_01DE:
    ScrCmd_186 11, 26, 41
    ScrCmd_186 12, 26, 40
    Return

_01F0:
    ApplyMovement 11, _02F0
    ApplyMovement 0xFF, _02A8
    WaitMovement
    Return

_0204:
    ApplyMovement 11, _02F0
    ApplyMovement 0xFF, _02A8
    WaitMovement
    Return

_0218:
    ApplyMovement 11, _02FC
    ApplyMovement 0xFF, _02B8
    WaitMovement
    Return

_022C:
    ApplyMovement 11, _02FC
    ApplyMovement 0xFF, _02B8
    WaitMovement
    Return

_0240:
    ApplyMovement 12, _02F0
    ApplyMovement 0xFF, _02A8
    WaitMovement
    Return

_0254:
    ApplyMovement 12, _02F0
    ApplyMovement 0xFF, _02A8
    WaitMovement
    Return

_0268:
    ApplyMovement 12, _02FC
    ApplyMovement 0xFF, _02B8
    WaitMovement
    Return

_027C:
    ApplyMovement 12, _02FC
    ApplyMovement 0xFF, _02B8
    WaitMovement
    Return

    .balign 4, 0
_0290:
    MoveAction_03E 7
    MoveAction_025
    MoveAction_047
    MoveAction_010
    MoveAction_048
    EndMovement

    .balign 4, 0
_02A8:
    MoveAction_03F
    MoveAction_023
    MoveAction_020
    EndMovement

    .balign 4, 0
_02B8:
    MoveAction_03F
    MoveAction_022
    MoveAction_020
    EndMovement

    .balign 4, 0
_02C8:
    MoveAction_010 8
    EndMovement

    .balign 4, 0
_02D0:
    MoveAction_022
    MoveAction_023
    MoveAction_021
    EndMovement

    .balign 4, 0
_02E0:
    MoveAction_020
    EndMovement

    .balign 4, 0
_02E8:
    MoveAction_04B
    EndMovement

    .balign 4, 0
_02F0:
    MoveAction_013
    MoveAction_010 8
    EndMovement

    .balign 4, 0
_02FC:
    MoveAction_012
    MoveAction_010 8
    EndMovement

_0308:
    ScrCmd_049 0x5DC
    ScrCmd_060
    ScrCmd_068
    ScrCmd_02C 6
    ScrCmd_031
    ScrCmd_034
    ScrCmd_061
    End

_031B:
    ScrCmd_049 0x5DC
    ScrCmd_060
    ScrCmd_02C 9
    ScrCmd_031
    ScrCmd_034
    ScrCmd_061
    End

_032C:
    ScrCmd_049 0x5DC
    ScrCmd_060
    ScrCmd_02C 10
    ScrCmd_031
    ScrCmd_034
    ScrCmd_061
    End

_033D:
    ScrCmd_049 0x5DC
    ScrCmd_060
    ScrCmd_068
    ScrCmd_02C 11
    ScrCmd_031
    ScrCmd_034
    ScrCmd_061
    End

_0350:
    ScrCmd_049 0x5DC
    ScrCmd_060
    ScrCmd_02C 12
    ScrCmd_031
    ScrCmd_034
    ScrCmd_061
    End

_0361:
    ScrCmd_049 0x5DC
    ScrCmd_060
    ScrCmd_068
    ScrCmd_02C 13
    ScrCmd_031
    ScrCmd_034
    ScrCmd_061
    End

_0374:
    ScrCmd_049 0x5DC
    ScrCmd_060
    ScrCmd_068
    ScrCmd_02C 14
    ScrCmd_031
    ScrCmd_034
    ScrCmd_061
    End

_0387:
    ScrCmd_049 0x5DC
    ScrCmd_060
    ScrCmd_068
    ScrCmd_02C 15
    ScrCmd_031
    ScrCmd_034
    ScrCmd_061
    End

_039A:
    ScrCmd_049 0x5DC
    ScrCmd_060
    ScrCmd_068
    ScrCmd_02C 16
    ScrCmd_031
    ScrCmd_034
    ScrCmd_061
    End

_03AD:
    ScrCmd_036 7, 2, 0, 0x800C
    ScrCmd_038 3
    ScrCmd_039
    ScrCmd_03B 0x800C
    ScrCmd_014 0x7D0
    End

_03C4:
    ScrCmd_036 8, 2, 0, 0x800C
    ScrCmd_038 3
    ScrCmd_039
    ScrCmd_03B 0x800C
    ScrCmd_014 0x7D0
    End

    .byte 0
