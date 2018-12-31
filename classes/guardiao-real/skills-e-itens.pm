automacro configurarGolpeFulminante {
    SkillLevel SM_BASH = 10
    SkillLevel CR_HOLYCROSS != 10 #essa automacro nao vai ativar quando o holycross tiver lvl máximo
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

automacro configurarHolyCross {
    SkillLevel CR_HOLYCROSS = 10
    exclusive 1
    ConfigKeyNot attackSkillSlot_0 CR_HOLYCROSS
    call {
        $blocoExiste = checarSeExisteNoConfig("attackSkillSlot_0")
        if ( $blocoExiste = nao ) {
            adicionaAttackSkillSlot()
            pause 1
            do reload config
        }
        do conf attackSkillSlot_0 CR_HOLYCROSS
        do conf attackSkillSlot_0_lvl 10
        do conf attackSkillSlot_0_sp >= 20
        do conf attackSkillSlot_0_maxUses 1
        do conf attackSkillSlot_0_maxAttempts 3
        do conf attackSkillSlot_0_inLockOnly 1
        do conf attackSkillSlot_0_notMonsters Argos
        do conf attackSkillSlot_0_whenStatusInactive EFST_POSTDELAY
    }
}

automacro configurarMedicar {
    SkillLevel AL_CURE = 1
    exclusive 1
    ConfigKeyNot useSelf_skill_0 AL_CURE
    call {
        $blocoExiste = checarSeExisteNoConfig("attackSkillSlot_0")
        if ( $blocoExiste = nao ) {
            adicionaAttackSkillSlot()
            pause 1
            do reload config
        }
        do conf useSelf_skill_0 AL_CURE
        do conf useSelf_skill_0_lvl 1
        do conf useSelf_skill_0_sp > 15
        do conf useSelf_skill_0_whenStatusActive EFST_HEALTHSTATE_BLIND
    }
}

automacro configurarCura {
    SkillLevel AL_HEAL >= 1
    exclusive 1
    ConfigKeyNot useSelf_skill_1 AL_HEAL
    call {
        $blocoExiste = checarSeExisteNoConfig("useSelf_skill_1")
        if ($blocoExiste = nao) {
            adicionaUseSelfSkill()
            pause 1
            do reload config
        }
        do conf useSelf_skill_1 AL_HEAL
        do conf useSelf_skill_1_hp < 60%
        do conf useSelf_skill_1_sp >= 40%
        do conf useSelf_skill_1_whenStatusInactive EFST_POSTDELAY
        do conf useSelf_skill_1_notOnAction attack
    }
}
automacro configurarPotBranca {
    ConfigKeyNot useSelf_item_1 504 #Poção Branca
    exclusive 1
    call {
        $blocoExiste = checarSeExisteNoConfig("useSelf_item_1")
        if ($blocoExiste = nao ) {
            adicionaUseSelfItem()
            pause 1
            do reload config
        }
        do conf useSelf_item_1 504 #Poção Branca
        do conf useSelf_item_1_hp < 60%
        do conf useSelf_item_1_disabled 0
    }
}

automacro pegarPeco_irAteNpc {
    SkillLevel KN_CAVALIERMASTERY = 5
    exclusive 1
    StatusInactiveHandle EFST_RIDING
    NpcNotNear /Peco Peco/
    Zeny >= 3500
    priority -3
    BaseLevel != 99
    call {
        do move prontera 232 318 &rand(3,7)
    }
}

automacro pegarPeco {
    SkillLevel KN_CAVALIERMASTERY = 5
    exclusive 1
    StatusInactiveHandle EFST_RIDING
    NpcNear /Peco Peco/
    priority -3
    BaseLevel != 99
    Zeny >= 3500
    call {
        do talk $.NpcNearLastBinId
        do talk resp 0
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
            do conf buyAuto_1_minAmount 10
            do conf buyAuto_1_maxAmount 100
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

