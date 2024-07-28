#include "macros/btlcmd.inc"

    .data

_000:
    CompareMonDataToValue OPCODE_FLAG_SET, BTLSCR_ATTACKER, BATTLEMON_VOLATILE_STATUS, VOLATILE_CONDITION_MOVE_LOCKED, _044
    CheckItemHoldEffect CHECK_HAVE, BTLSCR_ATTACKER, HOLD_EFFECT_CHARGE_SKIP, _024
    UpdateMonData OPCODE_FLAG_ON, BTLSCR_ATTACKER, BATTLEMON_MOVE_EFFECTS_MASK, MOVE_EFFECT_UNDERGROUND
    UpdateVar OPCODE_SET, BTLVAR_SIDE_EFFECT_FLAGS_DIRECT, MOVE_SIDE_EFFECT_TO_ATTACKER|MOVE_SUBSCRIPT_PTR_VANISH_CHARGE_TURN
    UpdateVar OPCODE_FLAG_ON, BTLVAR_BATTLE_CTX_STATUS, SYSCTL_SKIP_ATTACK_MESSAGE|SYSCTL_CHECK_LOOP_ONLY_ONCE|SYSCTL_FIRST_OF_MULTI_TURN
    End 

_024:
    UpdateMonData OPCODE_FLAG_ON, BTLSCR_ATTACKER, BATTLEMON_MOVE_EFFECTS_MASK, MOVE_EFFECT_UNDERGROUND
    UpdateMonData OPCODE_FLAG_ON, BTLSCR_ATTACKER, BATTLEMON_MOVE_EFFECTS_TEMP, 128
    Call BATTLE_SUBSCRIPT_ITEM_SKIP_CHARGE_TURN
    ToggleVanish BTLSCR_ATTACKER, TRUE
    CompareVarToValue OPCODE_EQU, BTLVAR_DEFENDER, BATTLER_NONE, _046

_044:
    CalcCrit 
    CalcDamage 

_046:
    UpdateMonData OPCODE_FLAG_OFF, BTLSCR_ATTACKER, BATTLEMON_MOVE_EFFECTS_MASK, MOVE_EFFECT_SEMI_INVULNERABLE
    Call BATTLE_SUBSCRIPT_CHARGE_MOVE_CLEANUP
    End 
