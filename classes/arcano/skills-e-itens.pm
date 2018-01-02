automacro configurarRelâmpago {
    SkillLevel MG_LIGHTNINGBOLT >= 3
    exclusive 1
    ConfigKeyNot attackSkillSlot_0 MG_LIGHTNINGBOLT
    priority 1
    call {
        [
        log ===================================
        log = configurando relâmpago
        log ===================================
        ]
        
        $blocoExiste = checarSeExisteNoConfig("attackSkillSlot_0")
        if ( $blocoExiste = nao ) {
            adicionaAttackSkillSlot()
            pause 1
            do reload config
        }
        
        do conf attackSkillSlot_0 MG_LIGHTNINGBOLT
        do conf attackSkillSlot_0_sp > 20%
        do conf attackSkillSlot_0_stopWhenHit 1
        do conf attackSkillSlot_0_inLockOnly 1
        do conf attackSkillSlot_0_notInTown 1
        do conf attackSkillSlot_0_monsters Esporo
    }
}

automacro configurarLançasDeFogo {
    SkillLevel MG_FIREBOLT >= 5
    exclusive 1
    ConfigKeyNot attackSkillSlot_1 MG_FIREBOLT
    priority 2
    call {
        [
        log ===================================
        log = configurando Lanças de Fogo
        log ===================================
        ]
        
        $blocoExiste = checarSeExisteNoConfig("attackSkillSlot_1")
        if ( $blocoExiste = nao ) {
            adicionaAttackSkillSlot()
            pause 1
            do reload config
        }
        
        do conf attackSkillSlot_1 MG_FIREBOLT
        do conf attackSkillSlot_1_sp > 20%
        do conf attackSkillSlot_1_stopWhenHit 1
        do conf attackSkillSlot_1_inLockOnly 1
        do conf attackSkillSlot_1_notInTown 1
        do conf attackSkillSlot_1_monsters Rabo de Verme, Jibóia, Pé-Grande
    }
}

