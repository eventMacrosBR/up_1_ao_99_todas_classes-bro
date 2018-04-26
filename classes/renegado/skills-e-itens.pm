automacro configurarFurto {
    SkillLevel TF_STEAL = 10
    JobID $paramsClasses{idC1}
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

automacro configurarPotLaranja {
    InInventoryID 569 < 1 #Poção de Aprendiz (não pode ter essa poção)
    InStorageID 569 < 1 #Poção de Aprendiz (não pode ter essa poção)
    Zeny > 30000
    BaseLevel != 99
    JobID $paramsClasses{idC2}
    ConfigKeyNot useSelf_item_0 Poção de Aprendiz #só se ativa quando nao ta usando mais pot aprendiz
    ConfigKeyNot useSelf_item_0 Poção Laranja
    exclusive 1
    call {
        [
        log ===================================
        log = configurando poção laranja
        log ===================================
        ]
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