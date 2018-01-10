automacro questLuzDivina_configurandoItens {
    JobID $paramsClasses{idC1}, $paramsClasses{idC2}
    SkillLevel AL_HOLYLIGHT != 1
    run-once 1
    exclusive 1
    call {
        do iconf 727 1 1 0 #Opala
        do iconf 991 1 1 0 #Cristal Azul
        do iconf 2608 1 1 0 #Rosário
    }
}

automacro questLuzDivina_inicioTenhoOsItens {
    JobID $paramsClasses{idC1}, $paramsClasses{idC2}
    SkillLevel AL_HOLYLIGHT != 1
    JobLevel >= 30
    ConfigKeyNot quest_eden em_curso
    ConfigKeyNot quest_eden terminando
    ConfigKeyNot In_saveMap_sequence true
    ConfigKeyNot virarClasse2 true
    ConfigKeyNot quest_skill true
    InInventoryID 727 >= 1
    InInventoryID 991 >= 1
    InInventoryID 2608 >= 1
    exclusive 1
    call { 
        [
        log ===================================
        log = Iniciando a quest da Luz Divina =
        log = Tenho os itens.                 =
        log ===================================
        ]
        call pararDeAtacar
        do move prontera
        do conf -f quest_skill true
        do conf -f quest_luz_divina falar_com_npc
    }
}

automacro questLuzDivina_inicioNaoTenhoOsItensMasTenhoZenys {
    JobID $paramsClasses{idC1}, $paramsClasses{idC2}
    SkillLevel AL_HOLYLIGHT != 1
    BaseLevel >= 30
    ConfigKeyNot quest_eden em_curso
    ConfigKeyNot quest_eden terminando
    ConfigKeyNot In_saveMap_sequence true
    ConfigKeyNot virarClasse2 true
    ConfigKeyNot quest_skill true
    Zeny >= 36000
    exclusive 1
    call { 
        [
        log ===================================
        log = Iniciando a quest da Luz Divina =
        log = Não tenho os itens, vou comprar =
        log ===================================
        ]
        call pararDeAtacar
        do move prontera
        do conf -f quest_skill true
        do conf -f quest_luz_divina comprar_itens
    }
}

automacro questLuzDivina_comprarRosario {
    ConfigKey quest_skill true
    ConfigKey quest_luz_divina comprar_itens
    InInventoryID 2608 < 1
    Zeny >= 16000
    exclusive 1
    priority -1
    call {
        $qtRosario = &invamount (Rosário)
        if ( $qtRosario < 1 ) {
            do move prt_church 108 124
            do talk &npc(/Madre/)
            do store
            do buy &store(Rosário) 1
        }
    }
}

#Caso não tenha conseguido um opala na caverna de payon
automacro questLuzDivina_comprarOpala {
    ConfigKey quest_skill true
    ConfigKey quest_luz_divina comprar_itens
    ConfigKeyNot BetterShopper_0 Opala
    InInventoryID 727 < 1
    Zeny >= 10000
    exclusive 1
    call {
        do conf lockMap prontera
        do conf route_randomWalk 1
        do conf route_randomWalk_inTown 1
        call pararDeAtacar
        if (checarSeExisteNoConfig("BetterShopper_0") = nao) {
            adicionaBetterShopper()
            pause 1
            do reload config
        }
        do conf BetterShopper_0 Opala
        do conf BetterShopper_0_maxPrice 10000
        do conf BetterShopper_0_maxAmount 1
        do conf BetterShopper_0_disabled 0
        do conf -f BetterShopper_on 1
    }
}

automacro questLuzDivina_comprarCristalAzul {
    ConfigKey quest_skill true
    ConfigKey quest_luz_divina comprar_itens
    ConfigKeyNot BetterShopper_1 Cristal Azul
    InInventoryID 991 < 1
    Zeny >= 10000
    exclusive 1
    call {
        do conf lockMap prontera
        do conf route_randomWalk 1
        do conf route_randomWalk_inTown 1
        call pararDeAtacar
        if (checarSeExisteNoConfig("BetterShopper_1") = nao) {
            adicionaBetterShopper()
            pause 1
            do reload config
        }
        do conf BetterShopper_1 Cristal Azul
        do conf BetterShopper_1_maxPrice 10000
        do conf BetterShopper_1_maxAmount 1
        do conf BetterShopper_1_disabled 0
        do conf -f BetterShopper_on 1
    }
}

automacro questLuzDivina_jaTenhosOsItens{
    ConfigKey quest_skill true
    ConfigKey quest_luz_divina comprar_itens
    InInventoryID 727 >= 1
    InInventoryID 991 >= 1
    InInventoryID 2608 >= 1
    exclusive 1
    call {
        do conf BetterShopper_on 0
        do conf quest_luz_divina falar_com_npc
    }
}

automacro questLuzDivina_falarComNpc {
    ConfigKey quest_skill true
    ConfigKey quest_luz_divina falar_com_npc
    exclusive 1
    call {
        do move prt_church  &rand(171,175) &rand(21,25)
        do talknpc 173 23 r1 r0
    }
}

automacro questLuzDivina_aprendiLuzDivina {
    ConfigKey quest_skill true
    ConfigKey quest_luz_divina falar_com_npc
    SkillLevel AL_HOLYLIGHT = 1
    exclusive 1
    call {
        [
        log ===================================
        log = Aprendi Luz Divina Yayyy        =
        log ===================================
        ]
        do conf quest_skill none
        do conf quest_luz_divina none
    }
}

