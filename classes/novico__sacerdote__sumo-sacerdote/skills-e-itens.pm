    #SKILL NOVIÇO PRA USAR EM SI "AJUDANDO A UPAR SOLO"#

automacro configurarCurar {
    SkillLevel AL_HEAL >= 2
    ConfigKeyNot useSelf_skill_0 AL_HEAL
    priority 0
    exclusive 1
    call {
        [
        log ===========================================
        log =Já tenho a skill Curar,
        log =Configurando ela
        log ===========================================
        ]
        $blocoExiste = checarSeExisteNoConfig("useSelf_skill_0")
        if ($blocoExiste = nao ) {
            adicionaUseSelfSkill()
            pause 1
            do reload config
        }
        do conf useSelf_skill_0 AL_HEAL
        do conf useSelf_skill_0_lvl 10
        do conf useSelf_skill_0_hp < 90%
        do conf useSelf_skill_0_whenStatusInactive EFST_POSTDELAY
        do conf useSelf_skill_0_disabled 0
    }
}

automacro configurarAL_INCAGI {
    SkillLevel AL_INCAGI >= 1
    ConfigKeyNot useSelf_skill_1 AL_INCAGI
    priority 1
    exclusive 1
    call {
        [
        log ===========================================
        log =Já tenho a skill Aumentar Agilidade,
        log =Configurando ela
        log ===========================================
        ]
        $blocoExiste = checarSeExisteNoConfig("useSelf_skill_1")
        if ($blocoExiste = nao ) {
            adicionaUseSelfSkill()
            pause 1
            do reload config
        }
        do conf useSelf_skill_1 AL_INCAGI
        do conf useSelf_skill_1_lvl 10
        do conf useSelf_skill_1_sp >= 45
        do conf useSelf_skill_1_whenStatusInactive EFST_INC_AGI, EFST_POSTDELAY
        do conf useSelf_skill_1_notWhileSitting 1
        do conf useSelf_skill_1_notInTown 0
        do conf useSelf_skill_1_stopWhenHit 1
        do conf useSelf_skill_1_disabled 0
    }
}

automacro configurarAngelus {
    SkillLevel AL_ANGELUS >= 1
    ConfigKeyNot useSelf_skill_2 AL_ANGELUS
    priority 2
    exclusive 1
    call {
        [
        log ===========================================
        log =Já tenho a skill Angelus,
        log =Configurando ela
        log ===========================================
        ]
        $blocoExiste = checarSeExisteNoConfig("useSelf_skill_2")
        if ($blocoExiste = nao ) {
            adicionaUseSelfSkill()
            pause 1
            do reload config
        }
        do conf useSelf_skill_2 AL_ANGELUS
        do conf useSelf_skill_2_sp >= 50
        do conf useSelf_skill_2_whenStatusInactive EFST_ANGELUS, EFST_POSTDELAY
        do conf useSelf_skill_2_notWhileSitting 1
        do conf useSelf_skill_2_notInTown 1
        do conf useSelf_skill_2_stopWhenHit 1
        do conf useSelf_skill_2_disabled 0
    }
}

automacro configurarAL_BLESSING {
    SkillLevel AL_BLESSING >= 1
    ConfigKeyNot useSelf_skill_3 AL_BLESSING
    priority 3
    exclusive 1
    call {
        [
        log ===========================================
        log =Já tenho a skill Bênção,
        log =Configurando ela
        log ===========================================
        ]
        $blocoExiste = checarSeExisteNoConfig("useSelf_skill_3")
        if ($blocoExiste = nao ) {
            adicionaUseSelfSkill()
            pause 1
            do reload config
        }
        do conf useSelf_skill_3 AL_BLESSING
        do conf useSelf_skill_3_lvl 10
        do conf useSelf_skill_3_sp >= 64
        do conf useSelf_skill_3_whenStatusInactive EFST_BLESSING, EFST_POSTDELAY
        do conf useSelf_skill_3_notWhileSitting 1
        do conf useSelf_skill_3_notInTown 1
        do conf useSelf_skill_3_disabled 0
    }
}

#SKILL SACERDOTE PRA USAR EM SI "AJUDANDO A UPAR SOLO"#

automacro configurarKyrieEleison {
    SkillLevel PR_KYRIE >= 1
    ConfigKeyNot useSelf_skill_4 PR_KYRIE
    priority 4
    exclusive 1
    call {
        [
        log ===========================================
        log =Já tenho a skill Kyrie Eleison,
        log =Configurando ela
        log ===========================================
        ]
        $blocoExiste = checarSeExisteNoConfig("useSelf_skill_4")
        if ($blocoExiste = nao ) {
            adicionaUseSelfSkill()
            pause 1
            do reload config
        }
        do conf useSelf_skill_4 PR_KYRIE
        do conf useSelf_skill_4_lvl 10
        do conf useSelf_skill_4_sp >= 35
        do conf useSelf_skill_4_whenStatusInactive EFST_KYRIE, EFST_ASSUMPTIO, EFST_POSTDELAY
        do conf useSelf_skill_4_notWhileSitting 1
        do conf useSelf_skill_4_notInTown 1
        do conf useSelf_skill_4_stopWhenHit 1
        do conf useSelf_skill_4_disabled 0
    }
}

automacro configurarMagnificat {
    SkillLevel PR_MAGNIFICAT >= 1
    ConfigKeyNot useSelf_skill_5 PR_MAGNIFICAT
    priority 5
    exclusive 1
    call {
        [
        log ===========================================
        log =Já tenho a skill Magnificat,
        log =Configurando ela
        log ===========================================
        ]
        $blocoExiste = checarSeExisteNoConfig("useSelf_skill_5")
        if ($blocoExiste = nao ) {
            adicionaUseSelfSkill()
            pause 1
            do reload config
        }
        do conf useSelf_skill_5 PR_MAGNIFICAT
        do conf useSelf_skill_5_sp >= 40
        do conf useSelf_skill_5_whenStatusInactive EFST_MAGNIFICAT, EFST_POSTDELAY
        do conf useSelf_skill_5_notWhileSitting 1
        do conf useSelf_skill_5_notInTown 1
        do conf useSelf_skill_5_stopWhenHit 1
        do conf useSelf_skill_5_disabled 0
    }
}

automacro configurarGloria {
    SkillLevel PR_GLORIA >= 5
    ConfigKeyNot useSelf_skill_6 PR_GLORIA
    priority 6
    exclusive 1
    call {
        [
        log ===========================================
        log =Já tenho a skill Glória,
        log =Configurando ela
        log ===========================================
        ]
        $blocoExiste = checarSeExisteNoConfig("useSelf_skill_6")
        if ($blocoExiste = nao ) {
            adicionaUseSelfSkill()
            pause 1
            do reload config
        }
        do conf useSelf_skill_6 PR_GLORIA
        do conf useSelf_skill_0_lvl 5
        do conf useSelf_skill_6_sp >= 20
        do conf useSelf_skill_6_whenStatusInactive EFST_GLORIA, EFST_POSTDELAY
        do conf useSelf_skill_6_notWhileSitting 1
        do conf useSelf_skill_6_notInTown 0
        do conf useSelf_skill_6_disabled 0
  }
}

automacro configurarGraçaDivina {
    SkillLevel PR_STRECOVERY >= 1
    ConfigKeyNot useSelf_skill_7 PR_STRECOVERY
    priority 7
    exclusive 1
    call {
        [
        log ===========================================
        log =Já tenho a skill Graça Divina,
        log =Configurando ela
        log ===========================================
        ]
        $blocoExiste = checarSeExisteNoConfig("useSelf_skill_7")
        if ($blocoExiste = nao ) {
            adicionaUseSelfSkill()
            pause 1
            do reload config
        }
        do conf useSelf_skill_7 PR_STRECOVERY
        do conf useSelf_skill_7_sp >= 5
        do conf useSelf_skill_7_whenStatusInactive EFST_POSTDELAY
        do conf useSelf_skill_7_whenStatusActive BODYSTATE_FREEZING, BODYSTATE_STUN, BODYSTATE_STONECURSE, BODYSTATE_STONECURSE_ING
        do conf useSelf_skill_7_disabled 0
  }
}

automacro configurarImpositioManus {
    SkillLevel PR_IMPOSITIO >= 1
    ConfigKeyNot useSelf_skill_8 PR_IMPOSITIO
    priority 8
    exclusive 1
    call {
        [
        log ===========================================
        log =Já tenho a skill Impositio Manus,
        log =Configurando ela
        log ===========================================
        ]
        $blocoExiste = checarSeExisteNoConfig("useSelf_skill_8")
        if ($blocoExiste = nao ) {
            adicionaUseSelfSkill()
            pause 1
            do reload config
        }
        do conf useSelf_skill_8 PR_IMPOSITIO
        do conf useSelf_skill_8_sp >= 25
        do conf useSelf_skill_8_whenStatusInactive EFST_IMPOSITIO, EFST_POSTDELAY
        do conf useSelf_skill_8_notWhileSitting 1
        do conf useSelf_skill_8_notInTown 1
        do conf useSelf_skill_8_disabled 0
  }
}

    ###SKILL PARA ATACAR MONSTROS SO COM CURA LVL 10###

automacro configurarCurarMortoVivos {
    SkillLevel AL_HEAL = 10
    ConfigKeyNot attackSkillSlot_0 AL_HEAL
    priority 0
    exclusive 1
    call {
        [
        log ===========================================
        log =Já tenho a skill Curar no 10,
        log =Configurando pra usar ela
        log ===========================================
        ]
        $blocoExiste = checarSeExisteNoConfig("attackSkillSlot_0")
        if ($blocoExiste = nao ) {
            adicionaAttackSkillSlot()
            pause 1
            do reload config
        }
        do conf attackSkillSlot_0 AL_HEAL
        do conf attackSkillSlot_0_lvl 10
        do conf attackSkillSlot_0_sp >= 40
        do conf attackSkillSlot_0_distance 1.5
        do conf attackSkillSlot_0_whenStatusInactive EFST_POSTDELAY
        do conf attackSkillSlot_0_monsters Esqueleto, Zumbi
        do conf attackSkillSlot_0_disabled 0
    }
}



#MACRO PRA PARAR DE USAR POÇÃO DE APRENDIZ QUANDO JA TIVER CURA LVL 1#
#NÃO PARA TOTALMENTE, SO USA QUANDO NESSESSARIO#

automacro diminuirPorcentagemHpAgoraQueTenhoCurar {
    SkillLevel AL_HEAL >= 5
    ConfigKey useSelf_item_0 Poção de Aprendiz
    ConfigKeyNot useSelf_item_0_hp <= 20%
    exclusive 1
    call {
       do conf useSelf_item_0_hp <= 20%
    }
}

