automacro configurarRelampago {
    SkillLevel MG_LIGHTNINGBOLT >=1
    ConfigKeyNot attackSkillSlot_0 MG_LIGHTNINGBOLT
    priority 0
    exclusive 1
    call {
         [
        log ===========================================
        log =Já tenho a skill Relampago,
        log =Configurando pra usar ela
        log ===========================================
        ]
        while (checarSeExisteNoConfig("attackSkillSlot_0") = nao ) {
    adicionaAttackSkillSlot()
    pause 1
    do reload config
    }
    do conf attackSkillSlot_0 MG_LIGHTNINGBOLT
    do conf attackSkillSlot_0_lvl 10
    do conf attackSkillSlot_0_dist 10
    do conf attackSkillSlot_0_maxCastTime 0.1
    do conf attackSkillSlot_0_minCastTime 0
    do conf attackSkillSlot_0_sp > 30
    do conf attackSkillSlot_0_whenStatusInactive EFST_POSTDELAY
    do conf attackSkillSlot_0_stopWhenHit 1
    do conf attackSkillSlot_0_inLockOnly 1
    do conf attackSkillSlot_0_notInTown 1
    do conf attackSkillSlot_0_maxUses 1
    do conf attackSkillSlot_0_maxAttempts 2
    do conf attackSkillSlot_0_monsters Esporo, Hidra
    do conf attackSkillSlot_0_disabled 0
    }
}

automacro configurarLancasdeFogo {
    SkillLevel MG_FIREBOLT >= 1
    ConfigKeyNot attackSkillSlot_1 MG_FIREBOLT
    priority 1
    exclusive 1
    call {
        [
        log ===========================================
        log =Já tenho a skill LancasdeFogo,
        log =Configurando pra usar ela
        log ===========================================
        ]
        while (checarSeExisteNoConfig("attackSkillSlot_1") = nao ) {
    adicionaAttackSkillSlot()
    pause 1
    do reload config
    }
    do conf attackSkillSlot_1 MG_FIREBOLT
    do conf attackSkillSlot_1_lvl 10
    do conf attackSkillSlot_1_dist 10
    do conf attackSkillSlot_1_maxCastTime 0.1
    do conf attackSkillSlot_1_minCastTime 0
    do conf attackSkillSlot_1_sp > 30
    do conf attackSkillSlot_1_whenStatusInactive EFST_POSTDELAY
    do conf attackSkillSlot_0_stopWhenHit 1
    do conf attackSkillSlot_1_inLockOnly 1
    do conf attackSkillSlot_1_notInTown 1
    do conf attackSkillSlot_1_maxUses 1
    do conf attackSkillSlot_1_maxAttempts 2
    do conf attackSkillSlot_1_monsters Mandrágora, Lunático, Fabre, ChonChon, Rabo de Verme, Jibóia, Zumbi, Esqueleto, Familiar, Poporing, Lobo, Argos. ChonChon de Aço, Grove, Flora, Hode, Arenoso, Rochoso, Planta Carnívora, Porcellio, Guerreiro Orc, Senhora Orc, Filhote de Orc, Tribolita, Nereida, Guerreiro Wootnan, Dríade, Atirador Wootnan, Golem de Madeira, Condor 
    do conf attackSkillSlot_1_disabled 0
    }
}

automacro configurarLancasdeGelo {
    SkillLevel MG_COLDBOLT >= 1
    ConfigKeyNot attackSkillSlot_2 MG_COLDBOLT
    priority 2
    exclusive 1
    call {
        [
        log ===========================================
        log =Já tenho a skill LancasdeGelo,
        log =Configurando pra usar ela
        log ===========================================
        ]
        while (checarSeExisteNoConfig("attackSkillSlot_2") = nao ) {
    adicionaAttackSkillSlot()
    pause 1
    do reload config
    }
    do conf attackSkillSlot_2 MG_COLDBOLT
    do conf attackSkillSlot_2_lvl 10
    do conf attackSkillSlot_2_dist 10
    do conf attackSkillSlot_2_maxCastTime 0.1
    do conf attackSkillSlot_2_minCastTime 0
    do conf attackSkillSlot_2_sp > 30
    do conf attackSkillSlot_2_whenStatusInactive EFST_POSTDELAY
    do conf attackSkillSlot_0_stopWhenHit 1
    do conf attackSkillSlot_2_inLockOnly 1
    do conf attackSkillSlot_2_notInTown 1
    do conf attackSkillSlot_2_maxUses 1
    do conf attackSkillSlot_2_maxAttempts 2
    do conf attackSkillSlot_2_monsters Frilldora, Grand Peco, Metaling, Escorpião, Filhote de Lobo do Deserto, Atirador de Pedras 
    do conf attackSkillSlot_2_disabled 0
    }
}

automacro configurarAtaqueEspiritual {
    SkillLevel MG_NAPALMBEAT >= 1
    ConfigKeyNot attackSkillSlot_3 MG_NAPALMBEAT
    priority 3
    exclusive 1
    call {
        [
        log ===========================================
        log =Já tenho a skill AtaqueEspiritual,
        log =Configurando pra usar ela
        log ===========================================
        ]
        while (checarSeExisteNoConfig("attackSkillSlot_3") = nao ) {
    adicionaAttackSkillSlot()
    pause 1
    do reload config
    }
    do conf attackSkillSlot_3 MG_NAPALMBEAT
    do conf attackSkillSlot_3_lvl 10
    do conf attackSkillSlot_3_dist 8
    do conf attackSkillSlot_3_maxCastTime 0.1
    do conf attackSkillSlot_3_minCastTime 0
    do conf attackSkillSlot_3_sp > 38
    do conf attackSkillSlot_3_whenStatusInactive EFST_POSTDELAY
    do conf attackSkillSlot_0_stopWhenHit 1
    do conf attackSkillSlot_3_inLockOnly 1
    do conf attackSkillSlot_3_notInTown 1
    do conf attackSkillSlot_3_maxUses 1
    do conf attackSkillSlot_3_maxAttempts 2
    do conf attackSkillSlot_3_disabled 0
    }
}

automacro configurarEspiritosAncioes {
    SkillLevel MG_SOULSTRIKE >= 1
    ConfigKeyNot attackSkillSlot_4 MG_SOULSTRIKE
    priority 4
    exclusive 1
    call {
        [
        log ===========================================
        log =Já tenho a skill EspiritosAncioes,
        log =Configurando pra usar ela
        log ===========================================
        ]
        while (checarSeExisteNoConfig("attackSkillSlot_4") = nao ) {
    adicionaAttackSkillSlot()
    pause 1
    do reload config
    }
    do conf attackSkillSlot_4 MG_SOULSTRIKE
    do conf attackSkillSlot_4_lvl 10
    do conf attackSkillSlot_4_dist 8
    do conf attackSkillSlot_4_maxCastTime 0.1
    do conf attackSkillSlot_4_minCastTime 0
    do conf attackSkillSlot_4_sp > 12
    do conf attackSkillSlot_4_whenStatusInactive EFST_POSTDELAY
    do conf attackSkillSlot_4_stopWhenHit 1
    do conf attackSkillSlot_4_inLockOnly 1
    do conf attackSkillSlot_4_notInTown 1
    do conf attackSkillSlot_4_maxUses 1
    do conf attackSkillSlot_4_maxAttempts 2
    do conf attackSkillSlot_4_disabled 0
    }
}

automacro configurarProtecaoArcana {
    SkillLevel MG_ENERGYCOAT 1
    ConfigKeyNot useSelf_skill_5 MG_ENERGYCOAT
    priority 5
    exclusive 1
    call {
        [
        log ===========================================
        log =Já tenho a skill ProtecaoArcana,
        log =Configurando ela
        log ===========================================
        ]
        $blocoExiste = checarSeExisteNoConfig("useSelf_skill_5")
        if ($blocoExiste = nao ) {
            adicionaUseSelfSkill()
            pause 1
            do reload config
        }
        do conf useSelf_skill_5 MG_ENERGYCOAT
        do conf useSelf_skill_5_lvl 1
        do conf useSelf_skill_5_sp >= 20
        do conf useSelf_skill_5_whenStatusInactive MG_ENERGYCOAT, EFST_POSTDELAY
        do conf useSelf_skill_5_notWhileSitting 1
        do conf useSelf_skill_5_notInTown 1
        do conf useSelf_skill_5_stopWhenHit 1
        do conf useSelf_skill_5_disabled 0
    }
}

automacro configurarAmplificacaoMistica {
    SkillLevel HW_MAGICPOWER >= 1
    ConfigKeyNot useSelf_skill_6 HW_MAGICPOWER
    priority 6
    exclusive 1
    call {
        [
        log ===========================================
        log =Já tenho a skill AmplificacaoMistica,
        log =Configurando ela
        log ===========================================
        ]
        $blocoExiste = checarSeExisteNoConfig("useSelf_skill_6")
        if ($blocoExiste = nao ) {
            adicionaUseSelfSkill()
            pause 1
            do reload config
        }
        do conf useSelf_skill_6 HW_MAGICPOWER
        do conf useSelf_skill_6_lvl 10
        do conf useSelf_skill_6_sp >= 20
        do conf useSelf_skill_6_whenStatusInactive EFST_MAGICPOWER, EFST_POSTDELAY
        do conf useSelf_skill_6_notWhileSitting 1
        do conf useSelf_skill_6_notInTown 1
        do conf useSelf_skill_6_stopWhenHit 1
        do conf useSelf_skill_6_disabled 0
    }
}

automacro darCajadadaNeles {
    exclusive 1
    JobID $parametrosClasses{idC1}, $parametrosClasses{idBC1}
    JobLevel < 2
    ConfigKeyNot attackUseWeapon 1
    call {
        do conf attackUseWeapon 1
    }
}

automacro jaTenhoSkill_pararDeBaterNaCajadada {
    JobLevel > 1
    exclusive 1
    ConfigKeyNot attackUseWeapon 0
    JobID $parametrosClasses{idC1}, $parametrosClasses{idBC1}, $parametrosClasses{idC1T}
    call {
        do conf attackUseWeapon 0
    }
}

automacro souUmMeroAprendizEqueroBater {
    JobID 0, 4023, 4001
    exclusive 1
    ConfigKeyNot attackUseWeapon 1
    call {
        do conf attackUseWeapon 1
    }
}

automacro configurarDistanciaDeAtaque_usandoMagias {
    ConfigKey attackUseWeapon 0
    ConfigKeyNot attackDistance 6
    exclusive 1
    call {
        do conf attackDistance 6
    }
}

automacro configurarDistanciaDeAtaque_naCajadada {
    ConfigKey attackUseWeapon 1
    ConfigKeyNot attackDistance 1.5
    exclusive 1
    call {
        do conf attackDistance 1.5
    }
}

