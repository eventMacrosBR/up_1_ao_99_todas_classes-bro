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
        do conf enhancedCasting_0_dist 9
        do conf enhancedCasting_0_whenStatusInactive EFST_POSTDELAY
        do conf enhancedCasting_0_monsters
        do conf enhancedCasting_0_disabled 0
        do conf enhancedCasting_0_Element Fire
        do conf enhancedCasting_0_damageFormula mATK * (0.9 * sLVL)
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
        do conf enhancedCasting_1_dist 9
        do conf enhancedCasting_1_whenStatusInactive EFST_POSTDELAY
        do conf enhancedCasting_1_monsters
        do conf enhancedCasting_1_disabled 0
        do conf enhancedCasting_1_Element Earth
        do conf enhancedCasting_1_damageFormula mATK * (0.9 * sLVL)
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
        do conf enhancedCasting_2_dist 9
        do conf enhancedCasting_2_whenStatusInactive EFST_POSTDELAY
        do conf enhancedCasting_2_disabled 0
        do conf enhancedCasting_2_Element Water
        do conf enhancedCasting_2_damageFormula mATK * (0.9 * sLVL)
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
        do conf enhancedCasting_3_dist 9
        do conf enhancedCasting_3_whenStatusInactive EFST_POSTDELAY
        do conf enhancedCasting_3_disabled 0
        do conf enhancedCasting_3_Element Shadow, Undead
        do conf enhancedCasting_3_damageFormula mATK * ((sLVL / 10) + 0.6)
        do conf enhancedCasting_3_damageType Holy
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
        do conf enhancedCasting_3_damageFormula mATK * (1 + 0.05 * sLVL)
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
        do conf attackMaxDistance 8
    }
}

automacro configurarDistanciaDeAtaque_naCajadada {
    ConfigKey attackUseWeapon 1
    ConfigKeyNot attackDistance 1.5
    exclusive 1
    call {
        do conf attackDistance 1.5
        do conf attackMaxDistance 2.5
    }
}

automacro configurarPotLaranja {
    InInventoryID 569 < 1 #Poção de Aprendiz (não pode ter essa poção)
    InStorageID 569 < 1 #Poção de Aprendiz (não pode ter essa poção)
    Zeny > 30000
    BaseLevel != 99
    JobIDNot 0 #aprendiz
    JobIDNot 4023 # baby aprendiz
    JobIDNot $parametrosClasses{idC1} #não pode comprar na classe 1 porque precisa economizar pra quest
    JobIDNot $parametrosClasses{idBC1} #não pode comprar na classe 1 porque precisa economizar pra quest
    ConfigKey quest_skill none
    ConfigKey questRenascer_estagio none
    ConfigKeyNot useSelf_item_0 Poção de Aprendiz #só se ativa quando nao ta usando mais pot aprendiz
    ConfigKeyNot useSelf_item_0 Poção Laranja
    exclusive 1
    call {
        [
        log ===================================
        log = configurando poção laranja
        log ===================================
        ]
        if (&invamount(569) != 0 || &storamount(569) != 0) {
            [
            log ===================================
            log = um bug ocorreu
            log = a eventMacro está tentando desativar as pot aprendiz
            log = mas ainda tenho um pouco delas
            log = tenho &invamount(569) no inventário
            log = e tenho &storamount(569) no storage
            log = então vou continuar usando
            log = reativando useSelf_item Poção de Aprendiz
            log ===================================
            ]
            do conf useSelf_item_0 Poção de Aprendiz
            do conf useSelf_item_0_disabled 0
            do conf useSelf_item_0_hp < 60%
            do conf getAuto_0 Poção de Aprendiz
            do conf getAuto_0_minAmount 20
            do conf getAuto_0_maxAmount 200
            do conf getAuto_0_passive 0
            stop
        }
        do iconf 502 100 0 0 #pot laranja
        if (&config(buyAuto_1) = Poção Laranja ) {
            log pot Laranja já está configurada, essa mensagem não deveria aparecer
            log caso apareça repetidamente, relate aos criadores da macro
        } else {
            adicionaBuyAuto() #preciso adicionar um bloco novo, porque o bloco
            #de buyauto padrão não tem o "zeny" como chave, apesar que deveria
            pause 1
            do reload config

            do conf buyAuto_1 Poção Laranja
            do conf buyAuto_1_minAmount 5
            do conf buyAuto_1_maxAmount 50
            do conf buyAuto_1_zeny > 30000
            do conf buyAuto_1_npc payon_in01 5 49
            do conf buyAuto_1_disabled 0
        }
        $blocoExiste = checarSeExisteNoConfig("useSelf_item_0")
        if ( $blocoExiste = nao ) {
            adicionaUseSelfItem()
            pause 1
            do reload config
        }
        do conf useSelf_item_0 Poção Laranja
        do conf useSelf_item_0_hp < 50%
        do conf useSelf_item_0_disabled 0

        [
        log ========================================
        log Configação para usar e comprar Poção Laranja
        log feita com sucesso
        log ========================================
        ]
    }
}

#só vai reabilitar o buyAuto se não tiver fazendo nada!!!
#upando ou coisa assim
automacro reabilitarBuyAuto {
    BaseLevel != 99
    ConfigKeyNot quest_eden em_curso
    ConfigKeyNot quest_eden terminando
    ConfigKeyNot naSequenciaDeSalvamento true
    ConfigKeyNot virarClasse2 true
    ConfigKeyNot virarClasse2T true
    ConfigKeyNot quest_skill true
    ConfigKeyNot esperarFazerQuest true
    ConfigKey aeroplano1 none
    ConfigKey aeroplano2 none
    ConfigKey questRenascer_estagio none
    exclusive 1
    JobIDNot 0 #Ou o campo de treinamento fica louco
    JobIDNot 4023 #Baby Aprendiz
    ConfigKey buyAuto_1 Poção Laranja
    ConfigKeyNot buyAuto_1_disabled 0
    call {
        do conf buyAuto_1_disabled 0
    }
}

