automacro configurarFurto {
    SkillLevel TF_STEAL = 10
    JobID $parametrosClasses{idC1}, $parametrosClasses{idBC1}
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

automacro desabilitarFurto {
    SkillLevel RG_SNATCHER = 10
    exclusive 1
    ConfigKey attackSkillSlot_0 TF_STEAL
    call {
        [
        log ===================================
        log = Já tenho Mãos Leves, desabilitando 
        log = o furto de gatuno
        log ===================================
        ]
        
        
        do conf attackSkillSlot_0 none
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
        $blocoExiste = checarSeExisteNoConfig("useSelf_skill_0")
        if ($blocoExiste = nao ) {
            adicionaUseSelfSkill()
            pause 1
            do reload config
        }
        do conf useSelf_skill_0 TF_DETOXIFY
        do conf useSelf_skill_0_lvl 1
        do conf useSelf_skill_0_sp >= 10
        do conf useSelf_skill_0_whenStatusActive HEALTHSTATE_POISON, EFST_HEALTHSTATE_POISON 
        do conf useSelf_skill_0_disabled 0
  }
}

automacro configurarAfanar {
  SkillLevel RG_STEALCOIN = 10
  ConfigKeyNot attackSkillSlot_0 RG_STEALCOIN
  exclusive 1
    call {
        $blocoExiste = checarSeExisteNoConfig("attackSkillSlot_0")
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
        do conf attackSkillSlot_0 RG_STEALCOIN
        do conf attackSkillSlot_0_lvl 10
        do conf attackSkillSlot_0_sp >= 15
        do conf attackSkillSlot_0_whenStatusInactive EFST_POSTDELAY
        do conf attackSkillSlot_0_maxUses 1
        do conf attackSkillSlot_0_maxAttempts 2
        do conf attackSkillSlot_0_disabled 0
    }
}

automacro configurarEsconderijo_e_AtaqueSupresa {
    ConfigKeyNot useSelf_skill_1 TF_HIDING
    ConfigKeyNot useSelf_skill_2 RG_RAID
    SkillLevel RG_RAID = 5
    exclusive 1
    call {
        [
        log ===================================
        log = Já tenho Ataque Surpresa, configurando
        log ===================================
        ]
        $blocoExiste = checarSeExisteNoConfig("useSelf_skill_1")
        if ($blocoExiste = nao ) {
            adicionaUseSelfSkill()
            pause 1
            do reload config
        }
        [
        do conf useSelf_skill_1 TF_HIDING
        do conf useSelf_skill_1_lvl 10
        do conf useSelf_skill_1_sp >= 30
        do conf useSelf_skill_1_aggressives >= 3 #Você decide acima de quantos monstros você deseja usar a habilidade
        do conf useSelf_skill_1_whenStatusInactive EFST_HIDING, EFST_POSTDELAY
        ]
        
        $blocoExiste = checarSeExisteNoConfig("useSelf_skill_2")
        if ($blocoExiste = nao ) {
            adicionaUseSelfSkill()
            pause 1
            do reload config
        }
        [
        do conf useSelf_skill_2 RG_RAID
        do conf useSelf_skill_2_lvl 5
        do conf useSelf_skill_2_sp >= 20
        do conf useSelf_skill_2_whenStatusInactive EFST_POSTDELAY
        do conf useSelf_skill_2_whenStatusActive EFST_HIDING
        ]
    }
}

automacro desconfigurarAtaqueSurpresa {
    ConfigKey useSelf_skill_1 TF_HIDING
    ConfigKey useSelf_skill_2 RG_RAID
    SkillLevel RG_RAID != 5
    exclusive 1
    call {
        [
        log ===================================
        log = Estou com ataque surpresa configurado
        log = porém eu não tenho a skill, ou ela 
        log = não está no lvl 5
        log = DESCONFIGURANDO
        log ===================================
        ]
        
        [
        do conf useSelf_skill_1 none
        do conf useSelf_skill_1_lvl none
        do conf useSelf_skill_1_sp none
        do conf useSelf_skill_1_aggressives none #Você decide acima de quantos monstros você deseja usar a habilidade
        do conf useSelf_skill_1_whenStatusInactive none
        ]
        
        [
        do conf useSelf_skill_2 none
        do conf useSelf_skill_2_lvl none
        do conf useSelf_skill_2_sp none
        do conf useSelf_skill_2_whenStatusInactive none
        do conf useSelf_skill_2_whenStatusActive none
        ]
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
        if (&invamount(569) > 0 || &storamount(569) > 0) {
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