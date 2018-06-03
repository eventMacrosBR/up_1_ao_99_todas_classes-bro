automacro configurarRelâmpago {
    SkillLevel MG_LIGHTNINGBOLT > 0
    ConfigKeyNot enhancedCasting_0 MG_LIGHTNINGBOLT
    priority 0
    exclusive 1
    call {
        [
        log =================================================
        log =Já tenho a skill Relâmpago,
        log =Configurando pra usar e eletrocutar as zinimigas
        log ==================================================
        ]
        while (checarSeExisteNoConfig("enhancedCasting_0") = nao ) {
            adicionaEnhancedCasting()
            pause 1
            do reload config
        }
        
        do conf enhancedCasting_0 MG_LIGHTNINGBOLT
		do conf enhancedCasting_0_lvl 10
        do conf enhancedCasting_0_sp >= 25
        do conf enhancedCasting_0_dist 9
        do conf enhancedCasting_0_whenStatusInactive EFST_POSTDELAY
        do conf enhancedCasting_0_inLockOnly 1
        do conf enhancedCasting_0_notInTown 1
        do conf enhancedCasting_0_disabled 0
        do conf enhancedCasting_0_Element Water, Neutral
        do conf enhancedCasting_0_damageFormula mATK * (0.9 * sLVL)
        do conf enhancedCasting_0_damageType Wind        
    }
}

automacro configurarLançasDeGelo {
    SkillLevel MG_COLDBOLT > 1
    ConfigKeyNot enhancedCasting_1 MG_COLDBOLT
    priority 0
    exclusive 1
    call {
        [
        log ===============================================
        log =Já tenho a skill Lanças de Gelo,
        log =Configurando pra usar e congelar as zinimigas
        log ===============================================
        ]
        $blocoExiste = checarSeExisteNoConfig("enhancedCasting_1")
        if ($blocoExiste = nao ) {
            adicionaEnhancedCasting()
            pause 1
            do reload config
        }
        
        do conf enhancedCasting_1 MG_COLDBOLT
		do conf enhancedCasting_1_lvl 10
        do conf enhancedCasting_1_sp >= 20
        do conf enhancedCasting_1_dist 9
        do conf enhancedCasting_1_whenStatusInactive EFST_POSTDELAY
        do conf enhancedCasting_1_inLockOnly 1
        do conf enhancedCasting_1_notInTown 1
        do conf enhancedCasting_1_disabled 0
        do conf enhancedCasting_1_Element Fire
        do conf enhancedCasting_1_damageFormula mATK * (0.9 * sLVL)
        do conf enhancedCasting_1_damageType Water
    }
}

automacro configurarLançasDeFogo {
    SkillLevel MG_FIREBOLT > 0
    ConfigKeyNot enhancedCasting_2 MG_FIREBOLT
    priority 0
    exclusive 1
    call {
        [
        log ==============================================
        log =Já tenho a skill Lanças de Fogo,
        log =Configurando pra usar e queimar as zinimigas
        log ==============================================
        ]
        
        while (checarSeExisteNoConfig("enhancedCasting_2") = nao ) {
            adicionaEnhancedCasting()
            pause 1
            do reload config
        }
        
        do conf enhancedCasting_2 MG_FIREBOLT
		do conf enhancedCasting_2_lvl 10
        do conf enhancedCasting_2_sp >= 20
        do conf enhancedCasting_2_dist 9
        do conf enhancedCasting_2_whenStatusInactive EFST_POSTDELAY
        do conf enhancedCasting_2_inLockOnly 1
        do conf enhancedCasting_2_notInTown 1
        do conf enhancedCasting_2_disabled 0
        do conf enhancedCasting_2_Element Earth
        do conf enhancedCasting_2_damageFormula mATK * (0.9 * sLVL)
        do conf enhancedCasting_2_damageType Fire
    }
}

automacro configurarAtaqueEspiritual {
    SkillLevel MG_NAPALMBEAT > 0
    SkillLevel MG_SOULSTRIKE < 3
    ConfigKeyNot enhancedCasting_3 MG_NAPALMBEAT
    priority 0
    exclusive 1
    call {
        [
        log ===============================================
        log =Já tenho a skill Ataque Espiritual,
        log =Configurando pra usar e assustar as zinimigas
        log ===============================================
        ]
        while (checarSeExisteNoConfig("enhancedCasting_3") = nao ) {
            adicionaEnhancedCasting()
            pause 1
            do reload config
        }
        
        do conf enhancedCasting_3 MG_NAPALMBEAT
        do conf enhancedCasting_3_sp >= 25
        do conf enhancedCasting_3_dist 9
        do conf enhancedCasting_3_whenStatusInactive EFST_POSTDELAY
        do conf enhancedCasting_3_inLockOnly 1
        do conf enhancedCasting_3_notInTown 1
        do conf enhancedCasting_3_disabled 0
        do conf enhancedCasting_3_Element Shadow, Undead
		do conf enhancedCasting_3_damageFormula mATK * ((sLVL / 10) + 0,6)
        do conf enhancedCasting_3_damageType Holy
    }
}

automacro configurarEspirítosAnciões {
    SkillLevel MG_SOULSTRIKE >= 3
    ConfigKeyNot enhancedCasting_3 MG_SOULSTRIKE
    priority 0
    exclusive 1
    call {
        [
        log ==================================================
        log =Já tenho a skill Espíritos Anciões,
        log =Configurando pra usar e aterrorizar as zinimigas
        log ==================================================
        ]
        while (checarSeExisteNoConfig("enhancedCasting_3") = nao ) {
            adicionaEnhancedCasting()
            pause 1
            do reload config
        }

        do conf enhancedCasting_3 MG_SOULSTRIKE
	    do conf enhancedCasting_3_lvl 10
        do conf enhancedCasting_3_sp >= 25
        do conf enhancedCasting_3_dist 9
        do conf enhancedCasting_3_whenStatusInactive EFST_POSTDELAY
        do conf enhancedCasting_3_monsters
        do conf enhancedCasting_3_disabled 0
        do conf enhancedCasting_3_Element Shadow, Undead
        do conf enhancedCasting_3_damageFormula mATK * (1 + 0.05 * sLVL)
        do conf enhancedCasting_3_damageType Holy
    }
}

automacro configurarProteçãoArcana {
    SkillLevel MG_ENERGYCOAT 1
    ConfigKeyNot useSelf_skill_4 MG_ENERGYCOAT
    priority 5
    exclusive 1
    call {
        [
        log ===========================================
        log =Já tenho a skill Proteção Arcana,
        log =Configurando ela para se proteger
        log ===========================================
        ]
        $blocoExiste = checarSeExisteNoConfig("useSelf_skill_4")
        if ($blocoExiste = nao ) {
            adicionaUseSelfSkill()
            pause 1
            do reload config
        }
        do conf useSelf_skill_4 MG_ENERGYCOAT
        do conf useSelf_skill_4_lvl 1
        do conf useSelf_skill_4_sp >= 20
        do conf useSelf_skill_4_whenStatusInactive MG_ENERGYCOAT, EFST_POSTDELAY
        do conf useSelf_skill_4_notWhileSitting 1
        do conf useSelf_skill_4_notInTown 1
        do conf useSelf_skill_4_stopWhenHit 1
        do conf useSelf_skill_4_disabled 0
    }
}

automacro configurarAmplificaçãoMística {
    SkillLevel HW_MAGICPOWER >= 1
    ConfigKeyNot useSelf_skill_5 HW_MAGICPOWER
    priority 0
    exclusive 1
    call {
        [
        log ===========================================
        log =Já tenho a skill Amplificação Mística,
        log =Configurando ela para ficar bruxão
        log ===========================================
        ]
        $blocoExiste = checarSeExisteNoConfig("useSelf_skill_5")
        if ($blocoExiste = nao ) {
            adicionaUseSelfSkill()
            pause 1
            do reload config
        }
        do conf useSelf_skill_5 HW_MAGICPOWER
        do conf useSelf_skill_5_lvl 10
        do conf useSelf_skill_5_sp >= 20
        do conf useSelf_skill_5_whenStatusInactive EFST_MAGICPOWER, EFST_POSTDELAY
        do conf useSelf_skill_5_notWhileSitting 1
        do conf useSelf_skill_5_notInTown 1
        do conf useSelf_skill_5_stopWhenHit 1
        do conf useSelf_skill_5_disabled 0
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
    ConfigKeyNot attackDistance 7
    exclusive 1
    call {
        do conf attackDistance 7
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