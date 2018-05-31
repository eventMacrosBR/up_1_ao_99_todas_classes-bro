automacro configurarLancasDeGelo {
    SkillLevel MG_COLDBOLT > 1
    ConfigKeyNot enhancedCasting_0 MG_COLDBOLT
    priority 0
    exclusive 1
    call {
        [
        log ===========================================
        log =Já tenho a skill Lanças de Gelo,
        log =Configurando pra usar ela
        log ===========================================
        ]
        $blocoExiste = checarSeExisteNoConfig("enhancedCasting_0")
        if ($blocoExiste = nao ) {
            adicionaEnhancedCasting()
            pause 1
            do reload config
        }
        
        do conf enhancedCasting_0 MG_COLDBOLT
        do conf enhancedCasting_0_sp >= 20
        do conf enhancedCasting_0_dist 8
        do conf enhancedCasting_0_whenStatusInactive EFST_POSTDELAY
        do conf enhancedCasting_0_monsters
        do conf enhancedCasting_0_disabled 0
        do conf enhancedCasting_0_Element Fire
        do conf enhancedCasting_0_damageFormula mATK * (100 * sLVL)
        do conf enhancedCasting_0_damageType Water
    }
}

automacro configurarLancasDeFogo {
    SkillLevel MG_FIREBOLT > 0
    ConfigKeyNot enhancedCasting_1 MG_FIREBOLT
    priority 0
    exclusive 1
    call {
        [
        log ===========================================
        log =Já tenho a skill Lanças de Fogo,
        log =Configurando pra usar ela
        log ===========================================
        ]
        
        while (checarSeExisteNoConfig("enhancedCasting_1") = nao ) {
            adicionaEnhancedCasting()
            pause 1
            do reload config
        }
        
        do conf enhancedCasting_1 MG_FIREBOLT
        do conf enhancedCasting_1_sp >= 20
        do conf enhancedCasting_1_dist 8
        do conf enhancedCasting_1_whenStatusInactive EFST_POSTDELAY
        do conf enhancedCasting_1_monsters
        do conf enhancedCasting_1_disabled 0
        do conf enhancedCasting_1_Element Earth
        do conf enhancedCasting_1_damageFormula mATK * (100 * sLVL)
        do conf enhancedCasting_1_damageType Fire
    }
}

automacro configurarRelampago {
    SkillLevel MG_LIGHTNINGBOLT > 0
    ConfigKeyNot enhancedCasting_2 MG_LIGHTNINGBOLT
    priority 0
    exclusive 1
    call {
        [
        log ===========================================
        log =Já tenho a skill Relâmpago,
        log =Configurando pra usar ela
        log ===========================================
        ]
        while (checarSeExisteNoConfig("enhancedCasting_2") = nao ) {
            adicionaEnhancedCasting()
            pause 1
            do reload config
        }
        
        do conf enhancedCasting_2 MG_LIGHTNINGBOLT
        do conf enhancedCasting_2_sp >= 25
        do conf enhancedCasting_2_dist 8
        do conf enhancedCasting_2_whenStatusInactive EFST_POSTDELAY
        do conf enhancedCasting_2_disabled 0
        do conf enhancedCasting_2_Element Water
        do conf enhancedCasting_2_damageFormula mATK * (100 * sLVL)
        do conf enhancedCasting_2_damageType Wind        
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
        log ===========================================
        log =Já tenho a skill Ataque Espiritual,
        log =Configurando pra usar ela
        log ===========================================
        ]
        while (checarSeExisteNoConfig("enhancedCasting_3") = nao ) {
            adicionaEnhancedCasting()
            pause 1
            do reload config
        }
        
        do conf enhancedCasting_3 MG_NAPALMBEAT
        do conf enhancedCasting_3_sp >= 25
        do conf enhancedCasting_3_dist 8
        do conf enhancedCasting_3_whenStatusInactive EFST_POSTDELAY
        do conf enhancedCasting_3_disabled 0
        do conf enhancedCasting_3_Element Shadow, Undead
    }
}

automacro configurarEspiritosAncioes {
    SkillLevel MG_SOULSTRIKE >= 3
    ConfigKeyNot enhancedCasting_3 MG_SOULSTRIKE
    priority 0
    exclusive 1
    call {
        [
        log ===========================================
        log =Já tenho a skill Espíritos Anciões,
        log =Configurando pra usar ela
        log ===========================================
        ]
        while (checarSeExisteNoConfig("enhancedCasting_3") = nao ) {
            adicionaEnhancedCasting()
            pause 1
            do reload config
        }
        
        ## O OBJETIVO AQUI É OS ESPIRITOS ANCIOES SUBSTITUIR O BLOCO
        ## DO ATAQUE ESPIRITUAL, NÃO TEM NECESSIDADE DE CASTAR OS DOIS
        ## OU UM OU OUTRO
        
        do conf enhancedCasting_3 MG_SOULSTRIKE
        do conf enhancedCasting_3_sp >= 25
        do conf enhancedCasting_3_dist 8
        do conf enhancedCasting_3_whenStatusInactive EFST_POSTDELAY
        do conf enhancedCasting_3_monsters
        do conf enhancedCasting_3_disabled 0
        do conf enhancedCasting_3_Element Shadow, Undead
        do conf enhancedCasting_3_damageFormula mATK * (5 * sLVL)
        do conf enhancedCasting_3_damageType Holy
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

