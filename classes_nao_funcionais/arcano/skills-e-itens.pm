automacro configurarRelâmpago {
    SkillLevel MG_LIGHTNINGBOLT > 0
    ConfigKeyNot attackSkillSlot_0 MG_LIGHTNINGBOLT
    priority 0
    exclusive 1
    call {
        [
        log =================================================
        log =Já tenho a skill Relâmpago,
        log =Configurando pra usar e eletrocutar as zinimigas
        log ==================================================
        ]
        while (checarSeExisteNoConfig("attackSkillSlot_0") = nao ) {
            adicionaAttackSkillSlot()
            pause 1
            do reload config
        }
        
        do conf attackSkillSlot_0 MG_LIGHTNINGBOLT
        do conf attackSkillSlot_0_lvl 10
        do conf attackSkillSlot_0_sp >= 25
        do conf attackSkillSlot_0_dist 9
        do conf attackSkillSlot_0_whenStatusInactive EFST_POSTDELAY
        do conf attackSkillSlot_0_inLockOnly 1
        do conf attackSkillSlot_0_notInTown 1
        do conf attackSkillSlot_0_disabled 0
        do conf attackSkillSlot_0_monsters Esporo
    }
}

automacro configurarLançasDeGelo {
    SkillLevel MG_COLDBOLT > 1
    ConfigKeyNot attackSkillSlot_1 MG_COLDBOLT
    priority 0
    exclusive 1
    call {
        [
        log ===============================================
        log =Já tenho a skill Lanças de Gelo,
        log =Configurando pra usar e congelar as zinimigas
        log ===============================================
        ]
        $blocoExiste = checarSeExisteNoConfig("attackSkillSlot_1")
        if ($blocoExiste = nao ) {
            adicionaAttackSkillSlot()
            pause 1
            do reload config
        }
        
        do conf attackSkillSlot_1 MG_COLDBOLT
        do conf attackSkillSlot_1_lvl 10
        do conf attackSkillSlot_1_sp >= 20
        do conf attackSkillSlot_1_dist 9
        do conf attackSkillSlot_1_whenStatusInactive EFST_POSTDELAY
        do conf attackSkillSlot_1_inLockOnly 1
        do conf attackSkillSlot_1_notInTown 1
        do conf attackSkillSlot_1_disabled 0
        do conf attackSkillSlot_1_monsters Frilldora, Grand Peco
    }
}

automacro configurarLançasDeFogo {
    SkillLevel MG_FIREBOLT > 0
    ConfigKeyNot attackSkillSlot_2 MG_FIREBOLT
    priority 0
    exclusive 1
    call {
        [
        log ==============================================
        log =Já tenho a skill Lanças de Fogo,
        log =Configurando pra usar e queimar as zinimigas
        log ==============================================
        ]
        
        while (checarSeExisteNoConfig("attackSkillSlot_2") = nao ) {
            adicionaAttackSkillSlot()
            pause 1
            do reload config
        }
        
        do conf attackSkillSlot_2 MG_FIREBOLT
        do conf attackSkillSlot_2_lvl 10
        do conf attackSkillSlot_2_sp >= 20
        do conf attackSkillSlot_2_dist 9
        do conf attackSkillSlot_2_whenStatusInactive EFST_POSTDELAY
        do conf attackSkillSlot_2_inLockOnly 1
        do conf attackSkillSlot_2_notInTown 1
        do conf attackSkillSlot_2_disabled 0
        do conf attackSkillSlot_2_monsters Mandrágora, Jibóia, Deniro, Piere, Andre, Lobo, Grove, Flora, Hode, Rochoso, Planta Carnívora, Porcellio
        
    }
}

automacro configurarAtaqueEspiritual {
    SkillLevel MG_NAPALMBEAT > 0
    SkillLevel MG_SOULSTRIKE < 3
    ConfigKeyNot attackSkillSlot_3 MG_NAPALMBEAT
    priority 0
    exclusive 1
    call {
        [
        log ===============================================
        log =Já tenho a skill Ataque Espiritual,
        log =Configurando pra usar e assustar as zinimigas
        log ===============================================
        ]
        while (checarSeExisteNoConfig("attackSkillSlot_3") = nao ) {
            adicionaAttackSkillSlot()
            pause 1
            do reload config
        }
        
        do conf attackSkillSlot_3 MG_NAPALMBEAT
        do conf attackSkillSlot_3_sp >= 25
        do conf attackSkillSlot_3_dist 9
        do conf attackSkillSlot_3_whenStatusInactive EFST_POSTDELAY
        do conf attackSkillSlot_3_inLockOnly 1
        do conf attackSkillSlot_3_notInTown 1
        do conf attackSkillSlot_3_disabled 0
    }
}

automacro configurarEspirítosAnciões {
    SkillLevel MG_SOULSTRIKE >= 3
    ConfigKeyNot attackSkillSlot_3 MG_SOULSTRIKE
    priority 0
    exclusive 1
    call {
        [
        log ==================================================
        log =Já tenho a skill Espíritos Anciões,
        log =Configurando pra usar e aterrorizar as zinimigas
        log ==================================================
        ]
        while (checarSeExisteNoConfig("attackSkillSlot_3") = nao ) {
            adicionaAttackSkillSlot()
            pause 1
            do reload config
        }

        do conf attackSkillSlot_3 MG_SOULSTRIKE
        do conf attackSkillSlot_3_lvl 10
        do conf attackSkillSlot_3_sp >= 25
        do conf attackSkillSlot_3_dist 9
        do conf attackSkillSlot_3_whenStatusInactive EFST_POSTDELAY
        do conf attackSkillSlot_3_disabled 0
        do conf attackSkillSlot_3_monsters Argos, Ovo de Andre, Arenoso
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

automacro configurarPotLaranja {
    InInventoryID 569 < 1 #Poção de Aprendiz (não pode ter essa poção)
    InStorageID 569 < 1 #Poção de Aprendiz (não pode ter essa poção)
    Zeny > 30000
    BaseLevel != 99
    JobIDNot 0 #aprendiz
    JobIDNot 4023 # baby aprendiz
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

