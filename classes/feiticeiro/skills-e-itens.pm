automacro configurarLancasDeGelo {
    SkillLevel MG_COLDBOLT > 1
    ConfigKeyNot attackSkillSlot_0 MG_COLDBOLT
    priority 0
    exclusive 1
    call {
        [
        log ===========================================
        log =Já tenho a skill Lanças de Gelo,
        log =Configurando pra usar ela
        log ===========================================
        ]
        $blocoExiste = checarSeExisteNoConfig("attackSkillSlot_0")
        if ($blocoExiste = nao ) {
            adicionaAttackSkillSlot()
            pause 1
            do reload config
        }
        
        do conf attackSkillSlot_0 MG_COLDBOLT
        do conf attackSkillSlot_0_sp >= 20
        do conf attackSkillSlot_0_dist 10
        do conf attackSkillSlot_0_whenStatusInactive EFST_POSTDELAY
        do conf attackSkillSlot_0_monsters
        do conf attackSkillSlot_0_disabled 1
    }
}

automacro configurarLancasDeFogo {
    SkillLevel MG_FIREBOLT > 0
    ConfigKeyNot attackSkillSlot_1 MG_FIREBOLT
    priority 0
    exclusive 1
    call {
        [
        log ===========================================
        log =Já tenho a skill Lanças de Fogo,
        log =Configurando pra usar ela
        log ===========================================
        ]
        $blocoExiste = checarSeExisteNoConfig("attackSkillSlot_1")
        if ($blocoExiste = nao ) {
            adicionaAttackSkillSlot()
            pause 1
            do reload config
        }
        
        do conf attackSkillSlot_1 MG_FIREBOLT
        do conf attackSkillSlot_1_sp >= 20
        do conf attackSkillSlot_1_dist 10
        do conf attackSkillSlot_1_whenStatusInactive EFST_POSTDELAY
        do conf attackSkillSlot_1_monsters
        do conf attackSkillSlot_1_disabled 0
    }
}

automacro configurarAtaqueEspiritual {
    SkillLevel MG_NAPALMBEAT > 0
    ConfigKeyNot attackSkillSlot_2 MG_NAPALMBEAT
    priority 0
    exclusive 1
    call {
        [
        log ===========================================
        log =Já tenho a skill Ataque Espiritual,
        log =Configurando pra usar ela
        log ===========================================
        ]
        $blocoExiste = checarSeExisteNoConfig("attackSkillSlot_2")
        if ($blocoExiste = nao ) {
            adicionaAttackSkillSlot()
            pause 1
            do reload config
        }
        
        do conf attackSkillSlot_2 MG_NAPALMBEAT
        do conf attackSkillSlot_2_sp >= 25
        do conf attackSkillSlot_2_dist 10
        do conf attackSkillSlot_2_whenStatusInactive EFST_POSTDELAY
        do conf attackSkillSlot_2_monsters
        do conf attackSkillSlot_2_disabled 1
    }
}

automacro configurarAtaqueEspiritual {
    SkillLevel MG_LIGHTNINGBOLT > 0
    ConfigKeyNot attackSkillSlot_3 MG_LIGHTNINGBOLT
    priority 0
    exclusive 1
    call {
        [
        log ===========================================
        log =Já tenho a skill Relâmpago,
        log =Configurando pra usar ela
        log ===========================================
        ]
        $blocoExiste = checarSeExisteNoConfig("attackSkillSlot_3")
        if ($blocoExiste = nao ) {
            adicionaAttackSkillSlot()
            pause 1
            do reload config
        }
        
        do conf attackSkillSlot_3 MG_LIGHTNINGBOLT
        do conf attackSkillSlot_3_sp >= 25
        do conf attackSkillSlot_3_dist 10
        do conf attackSkillSlot_3_whenStatusInactive EFST_POSTDELAY
        do conf attackSkillSlot_3_target_whenStatusActive EFST_BODYSTATE_FREEZING
        do conf attackSkillSlot_3_monsters
        do conf attackSkillSlot_3_disabled 1
    }
}

automacro configurarEspiritosAncioes {
    SkillLevel MG_SOULSTRIKE > 0
    ConfigKeyNot attackSkillSlot_4 MG_SOULSTRIKE
    priority 0
    exclusive 1
    call {
        [
        log ===========================================
        log =Já tenho a skill Espíritos Anciões,
        log =Configurando pra usar ela
        log ===========================================
        ]
        $blocoExiste = checarSeExisteNoConfig("attackSkillSlot_4")
        if ($blocoExiste = nao ) {
            adicionaAttackSkillSlot()
            pause 1
            do reload config
        }
        
        do conf attackSkillSlot_4 MG_SOULSTRIKE
        do conf attackSkillSlot_4_sp >= 25
        do conf attackSkillSlot_4_dist 10
        do conf attackSkillSlot_4_whenStatusInactive EFST_POSTDELAY
        do conf attackSkillSlot_4_monsters
        do conf attackSkillSlot_4_disabled 1
    }
}

automacro configurarRajadaCongelante {
    SkillLevel MG_FROSTDIVER > 0
    ConfigKeyNot attackSkillSlot_5 MG_FROSTDIVER
    priority 0
    exclusive 1
    call {
        [
        log ===========================================
        log =Já tenho a skill Rajada Congelante,
        log =Configurando pra usar ela
        log ===========================================
        ]
        $blocoExiste = checarSeExisteNoConfig("attackSkillSlot_5")
        if ($blocoExiste = nao ) {
            adicionaAttackSkillSlot()
            pause 1
            do reload config
        }
        
        do conf attackSkillSlot_5 MG_FROSTDIVER
        do conf attackSkillSlot_5_sp >= 25
        do conf attackSkillSlot_5_dist 10
        do conf attackSkillSlot_5_whenStatusInactive EFST_POSTDELAY
        do conf attackSkillSlot_5_target_whenStatusInactive EFST_BODYSTATE_FREEZING
        do conf attackSkillSlot_5_monsters
        do conf attackSkillSlot_5_disabled 1
    }
}

