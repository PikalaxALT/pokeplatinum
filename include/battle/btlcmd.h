#ifndef POKEPLATINUM_BATTLE_BTLCMD_H
#define POKEPLATINUM_BATTLE_BTLCMD_H

enum BattleScriptVars {
    BTLVAR_BATTLE_TYPE = 0,
    BTLVAR_CRITICAL_BOOSTS,
    BTLVAR_SIDE_EFFECT_FLAGS_DIRECT,
    BTLVAR_SIDE_EFFECT_FLAGS_INDIRECT,
    BTLVAR_SIDE_EFFECT_FLAGS_ABILITY,
    BTLVAR_SIDE_EFFECT_TYPE,
    BTLVAR_BATTLE_CTX_STATUS,
    BTLVAR_FIELD_CONDITIONS,
    BTLVAR_POWER_MULTI,
    BTLVAR_CALC_TEMP,
    BTLVAR_MOVE_STATUS_FLAGS,
    BTLVAR_SIDE_CONDITIONS_ATTACKER,
    BTLVAR_SIDE_CONDITIONS_DEFENDER,
    BTLVAR_SIDE_CONDITIONS_EFFECT_MON,
    BTLVAR_DAMAGE,
    BTLVAR_ATTACKER,
    BTLVAR_DEFENDER,
    BTLVAR_SIDE_EFFECT_MON,
    BTLVAR_FAINTED_MON,
    BTLVAR_SWITCHED_MON,
    BTLVAR_MSG_BATTLER_TEMP,
    BTLVAR_ATTACKER_STORED_DAMAGE,
    BTLVAR_MSG_TEMP,
    BTLVAR_PAY_DAY_COUNT,
    BTLVAR_CURRENT_MOVE,
    BTLVAR_TOTAL_TURNS,
    BTLVAR_MSG_ATTACKER,
    BTLVAR_MSG_DEFENDER,
    BTLVAR_MOVE_TEMP,
    BTLVAR_LAST_BATTLER_ID,
    BTLVAR_MOVE_POWER,
    BTLVAR_AFTER_MOVE_MESSAGE_TYPE,
    BTLVAR_HP_CALC_TEMP,
    BTLVAR_RESULT_MASK,
    BTLVAR_SIDE_EFFECT_PARAM,
    BTLVAR_MSG_MOVE_TEMP,
    BTLVAR_MSG_ITEM_TEMP,
    BTLVAR_MSG_ABILITY_TEMP,
    BTLVAR_WEATHER_TURNS,
    BTLVAR_BATTLER_SPEED_TEMP,
    BTLVAR_MULTI_HIT_LOOP,
    BTLVAR_ATTACKER_PHYSICAL_DAMAGE_MASK,
    BTLVAR_ATTACKER_SPECIAL_DAMAGE_MASK,
    BTLVAR_SCRIPT_TEMP,
    BTLVAR_CRITICAL_MUL,
    BTLVAR_ATTACKER_LAST_DAMAGE_TAKEN,
    BTLVAR_DEFENDER_LAST_DAMAGE_TAKEN,
    BTLVAR_ATTACKER_SELF_TURN_STATUS_FLAGS,
    BTLVAR_DEFENDER_SELF_TURN_STATUS_FLAGS,
    BTLVAR_SIDE_EFFECT_MON_SELF_TURN_STATUS_FLAGS,
    BTLVAR_FLING_TEMP,
    BTLVAR_FLING_SCRIPT,
    BTLVAR_BATTLE_SYS_STATUS,
    BTLVAR_ATTACKER_LOCKED_MOVE,
    BTLVAR_HIT_DAMAGE,
    BTLVAR_NUM_SAFARI_BALLS,
    BTLVAR_SWITCHED_MON_TEMP,
    BTLVAR_MOVE_TYPE,
    BTLVAR_MOVE_EFFECT_CHANCE,
    BTLVAR_REGULATION_FLAG,
    BTLVAR_BATTLE_CTX_STATUS_2,
    BTLVAR_TURN_ORDER_COUNTER,
    BTLVAR_MAX_BATTLERS,
    BTLVAR_ATTACKER_TEMP,
    BTLVAR_DEFENDER_TEMP,
    BTLVAR_DEFENDER_PHYSICAL_DAMAGE_TAKEN,
    BTLVAR_MSG_BATTLER_TEMP_ASSURANCE_DAMAGE_MASK,
    BTLVAR_DEFENDER_ASSURANCE_DAMAGE_MASK,
    BTLVAR_ATTACKER_SHELL_BELL_DAMAGE_DEALT,
    BTLVAR_WAITING_BATTLERS,
};

#define BTLSCR_ALL_BATTLERS         0
#define BTLSCR_ATTACKER             1
#define BTLSCR_DEFENDER             2
#define BTLSCR_PLAYER               3
#define BTLSCR_ENEMY                4
#define BTLSCR_FAINTED_MON          5
#define BTLSCR_SWITCHED_MON         6
#define BTLSCR_SIDE_EFFECT_MON      7
#define BTLSCR_ABILITY_MON          8
#define BTLSCR_PLAYER_SLOT_1        9
#define BTLSCR_ENEMY_SLOT_1         10
#define BTLSCR_PLAYER_SLOT_2        11
#define BTLSCR_ENEMY_SLOT_2         12
// 13 undefined
#define BTLSCR_MSG_ATTACKER         14
#define BTLSCR_MSG_DEFENDER         15
#define BTLSCR_ATTACKER_PARTNER     16
#define BTLSCR_DEFENDER_PARTNER     17
// 18 undefined
#define BTLSCR_ATTACKER_ENEMY       19
#define BTLSCR_DEFENDER_ENEMY       20
#define BTLSCR_MSG_BATTLER_TEMP     21
#define BTLSCR_SWITCHED_MON_AFTER   22
#define BTLSCR_MSG_TEMP             (0xFF)

enum IfOp {
    IFOP_EQU = 0,
    IFOP_NEQ,
    IFOP_LTE,
    IFOP_GT,
    IFOP_FLAG_SET,
    IFOP_FLAG_NOT,
    IFOP_AND,
};

enum StatusEffect {
    STATUS_EFFECT_LEVEL_UP = 8,
};

#endif // POKEPLATINUM_BATTLE_BTLCMD_H