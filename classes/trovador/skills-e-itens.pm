automacro configurarConcentracao {
    SkillLevel AC_CONCENTRATION >= 2
    ConfigKeyNot useSelf_skill_0 AC_CONCENTRATION
    priority 0
    exclusive 1
    call {
        [
        log ===========================================
        log =Já tenho a skill Concentracao,
        log =Configurando ela
        log ===========================================
        ]
        do conf -f useSelf_skill_0 AC_CONCENTRATION
        do conf -f useSelf_skill_0_lvl 10
        do conf -f useSelf_skill_0_whenStatusInactive EFST_CONCENTRATION, EFST_POSTDELAY
        do conf -f useSelf_skill_0_disabled 0
    }
}
automacro configurarRajadadeFlechas {
    SkillLevel AC_DOUBLE = 10
    ConfigKeyNot attackSkillSlot_0 AC_DOUBLE
    priority 0
    exclusive 1
    call {
        [
        log ===========================================
        log =Já tenho a skill Rajada de Flechas no 10,
        log =Configurando pra usar ela
        log ===========================================
        ]
        do conf -f attackSkillSlot_0 AC_DOUBLE
        do conf -f attackSkillSlot_0_lvl 10
        do conf -f attackSkillSlot_0_sp >= 40
        do conf -f attackSkillSlot_0_distance 10
        do conf -f attackSkillSlot_0_aggressives > 1
        do conf -f attackSkillSlot_0_maxUses 3
        do conf -f attackSkillSlot_0_maxAttempts 5
        do conf -f attackSkillSlot_0_disabled 0
    }
}

