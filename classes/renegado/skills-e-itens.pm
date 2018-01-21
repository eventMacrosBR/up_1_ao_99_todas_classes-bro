automacro configurarFurto {
    SkillLevel TF_STEAL = 10
    ConfigKeyNot attackSkillSlot_0 TF_STEAL
    exclusive 1
    call {
        [
        log ===========================================
        log =Já tenho a skill Furto no 10,
        log =Configurando pra usar ela
        log ===========================================
        ]
        $blocoExiste = checarSeExisteNoConfig("attackSkillSlot_0")
        if ( $blocoExiste = nao ) {
            adicionaAttackSkillSlot()
            pause 1
            do reload config
        }
        do conf attackSkillSlot_0 TF_STEAL
        do conf attackSkillSlot_0_lvl 10
        do conf attackSkillSlot_0_sp >= 10
        do conf attackSkillSlot_0_whenStatusInactive EFST_POSTDELAY
        do conf attackSkillSlot_0_maxUses 1
        do conf attackSkillSlot_0_maxAttempts 2
        do conf attackSkillSlot_0_disabled 0
    }
}

automacro configurarDesintoxicar {
    SkillLevel TF_DETOXIFY 1
    ConfigKeyNot useSelf_skill_0 TF_DETOXIFY
    exclusive 1
    call {
        [
        log ===========================================
        log =Já tenho a skill Desintoxicar,
        log =Configurando ela
        log ===========================================
        ]
        do conf useSelf_skill_0 TF_DETOXIFY
        do conf useSelf_skill_0_lvl 1
        do conf useSelf_skill_0_sp >= 10
        do conf useSelf_skill_0_whenStatusActive HEALTHSTATE_POISON
        do conf useSelf_skill_0_disabled 0
  }
}

automacro configurarAfanar {
  SkillLevel RG_STEALCOIN = 10
  ConfigKeyNot attackSkillSlot_1 RG_STEALCOIN
  exclusive 1
    call {
        $blocoExiste = checarSeExisteNoConfig("attackSkillSlot_1")
        if ($blocoExiste = nao ) {
            adicionaAttackSkillSlot()
            pause 1
            do reload config
        }
        [
        log ===========================================
        log =Já tenho a skill Afanar no 10,
        log =Configurando pra usar ela
        log ===========================================
        ]
        do conf attackSkillSlot_1 RG_STEALCOIN
        do conf attackSkillSlot_1_lvl 10
        do conf attackSkillSlot_1_sp >= 15
        do conf attackSkillSlot_1_whenStatusInactive EFST_POSTDELAY
        do conf attackSkillSlot_1_maxUses 1
        do conf attackSkillSlot_1_maxAttempts 2
        do conf attackSkillSlot_1_disabled 0
        # Desativar Furto
        do conf attackSkillSlot_0_disabled 1
    }
}

