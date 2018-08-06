
automacro configurarConcentracao {
    SkillLevel AC_CONCENTRATION >= 1
    ConfigKeyNot useSelf_skill_0 AC_CONCENTRATION
    priority 0
    exclusive 1
    call {
        [
        log ===========================================
        log =Já tenho a skill Concentração,
        log =Configurando ela
        log ===========================================
        ]
        $blocoExiste = checarSeExisteNoConfig("useSelf_skill_0")
        if ($blocoExiste = nao ) {
            adicionaUseSelfSkill()
            pause 1
            do reload config
        }
        #dicas de configuração do bloco enviadas por @MrAnderson
        do conf useSelf_skill_0 AC_CONCENTRATION
        do conf useSelf_skill_0_lvl 10
        do conf useSelf_skill_0_sp > 70
        do conf useSelf_skill_0_whenStatusInactive EFST_CONCENTRATION, EFST_POSTDELAY
        do conf useSelf_skill_0_disabled 0
        do conf useSelf_skill_0_notInTown 1
        do conf useSelf_skill_0_inLockOnly 1
        do conf useSelf_skill_0_notWhileSitting 1

    }
}

automacro configurarVisaoReal {
    SkillLevel SN_SIGHT >= 1
    ConfigKeyNot useSelf_skill_1 SN_SIGHT
    priority 0
    exclusive 1
    call {
        [
        log ===========================================
        log =Já tenho a skill Visão Real,
        log =Configurando ela
        log ===========================================
        ]
        $blocoExiste = checarSeExisteNoConfig("useSelf_skill_1")
        if ($blocoExiste = nao ) {
            adicionaUseSelfSkill()
            pause 1
            do reload config
        }
        do conf useSelf_skill_1 SN_SIGHT
        do conf useSelf_skill_1_lvl 10
        do conf useSelf_skill_1_sp > 40
        do conf useSelf_skill_1_whenStatusInactive Visão Real, EFST_POSTDELAY
        do conf useSelf_skill_1_disabled 0
        do conf useSelf_skill_1_notInTown 1
        do conf useSelf_skill_1_inLockOnly 1
        do conf useSelf_skill_1_notWhileSitting 1

    }
}

automacro configurarCaminhoDoVento {
    SkillLevel SN_WINDWALK >= 1
    ConfigKeyNot useSelf_skill_2 SN_WINDWALK
    priority 0
    exclusive 1
    call {
        [
        log ===========================================
        log =Já tenho a skill Caminho do Vento,
        log =Configurando ela
        log ===========================================
        ]
        $blocoExiste = checarSeExisteNoConfig("useSelf_skill_2")
        if ($blocoExiste = nao ) {
            adicionaUseSelfSkill()
            pause 1
            do reload config
        }
        do conf useSelf_skill_2 SN_WINDWALK
        do conf useSelf_skill_2_lvl 10
        do conf useSelf_skill_2_sp > 100
        do conf useSelf_skill_2_whenStatusInactive Caminho do Vento, EFST_POSTDELAY
        do conf useSelf_skill_2_disabled 0
        do conf useSelf_skill_2_notInTown 1
        do conf useSelf_skill_2_inLockOnly 1
        do conf useSelf_skill_2_notWhileSitting 1

    }
}

automacro configurarRajadaDeFlechas {
    SkillLevel AC_DOUBLE > 1
    ConfigKeyNot attackSkillSlot_0 AC_DOUBLE
    priority 0
    exclusive 1
    call {
        [
        log ===========================================
        log =Já tenho a skill Rajada de Flechas,
        log =Configurando pra usar ela
        log ===========================================
        ]
        $blocoExiste = checarSeExisteNoConfig("attackSkillSlot_0")
        if ($blocoExiste = nao ) {
            adicionaAttackSkillSlot()
            pause 1
            do reload config
        }
        #dicas de configuração do bloco enviadas por @MrAnderson
        do conf attackSkillSlot_0 AC_DOUBLE
        do conf attackSkillSlot_0_sp >= 82
        do conf attackSkillSlot_0_dist none
        do conf attackSkillSlot_0_whenStatusActive EFST_CONCENTRATION
        do conf attackSkillSlot_0_whenStatusInactive EFST_POSTDELAY
        do conf attackSkillSlot_0_maxUses 1 #usar uma rajada por monstro, acho que fica legal assim
        do conf attackSkillSlot_0_disabled 0
    }
}

automacro aumentarFlechasLevel30 {
    ConfigKey buyAuto_1 Flecha
    ConfigKeyNot buyAuto_1_maxAmount 5000
    BaseLevel >= 30
    exclusive 1
    call {
        do conf buyAuto_1_maxAmount 5000
        do conf buyAuto_1_zeny > 5000
    }
}


automacro configurarEquiparFlechaAutomaticamente {
    ConfigKeyNot attackEquip_arrow Flecha
    exclusive 1
    JobIDNot 0 #Aprendiz
    JobIDNot 4001 #Aprendiz T.
    JobIDNot 4023 #Baby aprendiz
    call {
        do conf attackEquip_arrow Flecha
        do iconf Flecha 0 0 0
    }
}

automacro desconfigurarAutoEquiparFlechaAprendizT {
    ConfigKey attackEquip_arrow Flecha
    exclusive 1
    JobID 4001 #Aprendiz T.
    call {
        do conf attackEquip_arrow none
    }
} 

automacro configurarParaComprarPoucasFlechasArqueiroT {
    ConfigKey buyAuto_1 Flecha
    ConfigKey buyAuto_1_maxAmount 5000
    BaseLevel < 30
    JobID $parametrosClasses{idC1T}
    call {
        do conf buyAuto_1_maxAmount 2000
        do conf buyAuto_1_zeny > 2000
    }
}

automacro configurarUsarAljave {
    ConfigKeyNot useSelf_item_1 Aljave
    exclusive 1
    call {
        $blocoExiste = checarSeExisteNoConfig("useSelf_item_1")
        if ($blocoExiste = nao ) {
            adicionaUseSelfItem()
            pause 1
            do reload config
        }
        do conf useSelf_item_1 Aljave
        do conf useSelf_item_1_inInventory Flecha < 50
    }
}

automacro configurarBuyAutoFlecha {
    ConfigKeyNot buyAuto_1 Flecha
    JobIDNot 0 #Aprendiz
    JobIDNot 4001 #Aprendiz T.
    JobIDNot 4023 #Aprendiz Baby
    exclusive 1
    call {
        $blocoExiste = checarSeExisteNoConfig("buyAuto_1")
        if ($blocoExiste = nao ) {
            adicionaBuyAuto() #preciso adicionar um bloco novo, porque o bloco
            #de buyauto padrão não tem o "zeny" como chave, apesar que deveria
            pause 1
            do reload config
        }
        do conf buyAuto_1 Flecha
        do conf buyAuto_1_minAmount 100
        do conf buyAuto_1_maxAmount 2000
        do conf buyAuto_1_zeny > 2000
    }
}

automacro configurarAtaqueADistancia {
    ConfigKeyNot attackDistanceAuto 1
    exclusive 1
    JobIDNot 0 #Aprendiz
    JobIDNot 4023 #Baby Aprendiz
    JobIDNot 4001 #Aprendiz T.
    call {
        do conf attackDistanceAuto 1
    }
}

automacro removerConfiguracaoAtaqueADistanciaAprendizT {
    ConfigKey attackDistanceAuto 1
    exclusive 1
    JobID 4001 #Aprendiz T.
    call {
        do conf attackDistanceAuto 0
    }
}

automacro pegarFalcao_irAteNpc {
    SkillLevel HT_FALCON >= 1
    exclusive 1
    NotInMap hugel
    StatusInactiveHandle EFST_FALCON
    NpcNotNear /Falcoeiro/
    Zeny >= 3500
    priority -3
    BaseLevel != 99
    call {
        do conf saveMap izlude
        do conf -f quest_skill true
        call aeroplano_junoPara "hugel"
        [
        log ==================================
        log =Indo agora para Hugel pelo
        log =aeroplano pra buscar minha águia!
        log ==================================
        ]
    }
}

automacro pegarFalcao_jaEstouEmHugel_irAteNpc {
    SkillLevel HT_FALCON >= 1
    exclusive 1
    ConfigKey saveMap hugel
    StatusInactiveHandle EFST_FALCON
    NpcNotNear /Falcoeiro/
    Zeny >= 3500
    priority -3
    BaseLevel != 99
    call {
        do move hu_in01 385 307 &rand(3,7)
        [
        log ==============================
        log =Indo até a Guilda dos
        log =Caçadores buscar minha águia!
        log ==============================
        ]
    }
}

automacro pegarFalcao {
    SkillLevel HT_FALCON >= 1
    exclusive 1
    StatusInactiveHandle EFST_FALCON
    NpcNear /Falcoeiro/
    priority -3
    BaseLevel != 99
    Zeny >= 3500
    call {
        do talk $.NpcNearLastBinId
        do talk resp 0
        if ($.statushandle =~ /FALCON/) {
            do conf quest_skill none
            [
            log ==========================
            log =Feito!
            log =Já estou com a águia...
            log ==========================
            ]
        } else {
            [
            log ===================================
            log = PROBLEMA
            log = falei com o npc falcoeiro mas ainda
            log = nao tenho o falcão, reporte aos criadores
            log = da eventMacro
            log ===================================
            ]
        }
    }
}

automacro verificarFlechas {
    exclusive 1
    JobIDNot 0 #Aprendiz
    JobIDNot 4001 #Aprendiz T.
    JobIDNot 4023 #Baby Aprendiz
    InInventory "Flecha" < 100
    InInventory "Flecha" > 0
    ConfigKey buyAuto_1_zeny > 2000, buyAuto_1_zeny > 5000
    call {
        [
        log ===================================
        log Quantidade de flechas insuficiente,
        log Inicializando compras automáticas!!
        log ===================================
        ]
        call pararDeAtacar
        do autosell
        # buyAuto_1_zeny contem valores como "> 5000" ou "> 2000" temos que remover o "> "
        [
        log ================================
        log = tentando descobrir quantos zenys precisamos
        log ================================
        ]
        $zenyNecessario = pegarZenyDoBuyAuto()
        if ($zenyNecessario = erro) stop
        
        [
        log ====================================
        log Checando se tenho no minimo $zenyNecessario zenys
        ]
        if ( $.zeny >= $zenyNecessario ) {
            [
            log = tenho sim
            log ===================================
            ]
            do autobuy
        } else {
            [
            log ===================================
            log = estou sem flechas, e estou sem zeny pra comprar
            log ===================================
            ]
            do eval Misc::offlineMode()
        }
        do eq &inventory(1750) #Id da flecha
        call voltarAtacar
    }
}

sub pegarZenyDoBuyAuto {

    if ($config{"buyAuto_1_zeny"} =~ /(\d+)/) {
        return $1;
    } else {
        error "Erro encontrado tentando saber quanto zeny preciso ter pra comprar flechas\n".
        "valor: '" . $config{"buyAuto_1_zeny"} . "' \n";
        return "erro";
    }
}

automacro autoEquiparFlechas {
    exclusive 1
    JobIDNot 0 #Aprendiz
    JobIDNot 4001 #Aprendiz T.
    JobIDNot 4023 #Baby Aprendiz
    InInventory "Flecha" >= 100
    IsNotEquippedID arrow 1750
    call {
        [
        log ===================================
        log Tenho flechas, mas não equipadas
        log Equipando!!
        log ===================================
        ]
        do eq &inventory(1750) #Id da flecha
    }
}

