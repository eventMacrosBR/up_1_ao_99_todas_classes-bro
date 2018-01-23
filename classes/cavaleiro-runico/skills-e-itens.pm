automacro configurarGolpeFulminante {
    SkillLevel SM_BASH = 10
    exclusive 1
    ConfigKeyNot attackSkillSlot_0 SM_BASH
    call {
        $blocoExiste = checarSeExisteNoConfig("attackSkillSlot_0")
        if ( $blocoExiste = nao ) {
            adicionaAttackSkillSlot()
            pause 1
            do reload config
        }
        do conf attackSkillSlot_0 SM_BASH
        do conf attackSkillSlot_0_lvl 10
        do conf attackSkillSlot_0_sp >= 15
        do conf attackSkillSlot_0_maxUses 1
        do conf attackSkillSlot_0_maxAttempts 3
        do conf attackSkillSlot_0_inLockOnly 1
    }
}
automacro configurarVigor {
    SkillLevel SM_ENDURE = 10
    ConfigKeyNot useSelf_skill_0 SM_ENDURE
    priority 0
    exclusive 1
    call {
        $blocoExiste = checarSeExisteNoConfig("useSelf_skill_0")
        if ( $blocoExiste = nao ) {
            adicionaUseSelfSkill()
            pause 1
            do reload config
        }
        do conf useSelf_skill_0 SM_ENDURE
        do conf useSelf_skill_0_lvl 10
        do conf useSelf_skill_0_sp >= 15%
        do conf useSelf_skill_0_whenStatusInactive EFST_POSTDELAY, Vigor
        do conf useSelf_skill_0_disabled 0
        do conf useSelf_skill_0_agressives > 1
        do conf useSelf_skill_0_timeout 10
    }
}

