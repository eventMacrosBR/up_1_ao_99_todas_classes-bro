#campo dos aprendizes by HenryBK and Nipodemos

automacro campoDeAprendiz_irAteSprakkiLadoDeFora {
    exclusive 1
    InMap new_1-1, new_2-1, new_3-1, new_4-1, new_5-1
    BaseLevel = 1
    NpcNotNear /Sprakki/
    QuestInactive 7117
    call {
        do move 52 113
    }
}

automacro campoDeAprendiz_falarComSprakkiLadoDeFora {
    exclusive 1
    InMap new_1-1, new_2-1, new_3-1, new_4-1, new_5-1
    BaseLevel = 1
    NpcNear /Sprakki/
    QuestInactive 7117
    call {
        [
        do conf -f naSequenciaDeSalvamento false
        do conf -f membroDoEden none
        do conf -f quest_atual none
        do conf -f saveMap_storage_sequence none
        do conf -f saveMap_wanted none
        do conf -f saveMap_kafra_position none
        do conf -f saveMap_sellNpc_position none
        do conf autoMoveOnDeath 1
        do conf autoMoveOnDeath_x none
        do conf autoMoveOnDeath_y none
        do conf autoMoveOnDeath_map none
        do conf saveMap none
        do conf saveMap_warpToBuyOrSell 0
        do conf sellAuto 0
        do conf storageAuto 0
        do conf storageAuto_npc none
        do conf getAuto_0 none
        do conf autoTalkCont 1
        do conf sitAuto_idle 0
        do conf sitAuto_hp_lower 40
        do conf sitAuto_hp_upper 80
        do conf itemsTakeAuto 0
        do conf itemsGatherAuto 0
        do conf lockMap none
        do conf attackAuto_inLockOnly 0
        do conf route_randomWalk 0
        do conf statsAddAuto_dontUseBonus 1
        do conf itemsMaxWeight 49
        do conf itemsMaxWeight_sellOrStore 48
        do conf itemsMaxNum_sellOrStore 99
        do iconf 12323 0 0 0
        do iconf 12324 0 0 0
        do iconf 569 0 0 0
        do iconf 7059 50 0 0
        do iconf 7060 50 0 0
        do iconf 13040 0 0 0
        do iconf 1243 0 0 0
        do iconf 2112 0 0 0
        do iconf 5055 0 0 0
        do iconf 2414 0 0 0
        do iconf 2510 0 0 0
        do iconf 2352 0 0 0
        do iconf 1201 0 0 0
        do iconf 13041 0 0 0
        do iconf 2393 0 0 0
        do iconf 2301 0 0 0
        ]
        do talk $.NpcNearLastBinId
    }
}

#7117#Campo de Treinamento#SG_FEEL#QUE_NOIMAGE#
#Cruze a ponte e encontre o castelo do Campo de Treinamento. #
#Converse com o responsável pelo Campo de Treinamento #
automacro campoDeAprendiz_entrar {
    exclusive 1
    QuestActive 7117
    InMap new_1-1, new_2-1, new_3-1, new_4-1, new_5-1
    priority 1
    call GotoInside
}

automacro moveInsideBugged1 {
    exclusive 1
    QuestInactive 7117
    BaseLevel = 2
    InMap new_1-1, new_2-1, new_3-1, new_4-1, new_5-1
    priority 1
    call GotoInside
}

#7118#Campo de Treinamento#SG_FEEL#QUE_NOIMAGE#
#Os próximos passos serão ensinados pelo instrutor. #
#Converse com Brade #
automacro campoDeAprendiz_entrar_bugado {
    exclusive 1
    QuestActive 7118
    BaseLevel = 2
    InMap new_1-1, new_2-1, new_3-1, new_4-1, new_5-1
    priority 1
    call GotoInside
}

macro GotoInside {
    $proximoMapa = proximoMapa("$.map")
    do move $proximoMapa 101 29
}

#7117#Campo de Treinamento#SG_FEEL#QUE_NOIMAGE#
#Cruze a ponte e encontre o castelo do Campo de Treinamento. #
#Converse com o responsável pelo Campo de Treinamento #
automacro campoDeAprendiz_irAteSprakki {
    exclusive 1
    QuestActive 7117
    NpcNotNear /Sprakki/
    BaseLevel = 1
    InMap new_1-2, new_2-2, new_3-2, new_4-2, new_5-2
    priority 1
    call GotoSpraki
}

automacro campoDeAprendiz_irAteSprakki_bugado1 {
    exclusive 1
    QuestInactive 7117
    BaseLevel = 2
    NpcNotNear /Sprakki/
    InMap new_1-2, new_2-2, new_3-2, new_4-2, new_5-2
    priority 1
    call GotoSpraki
}

#7118#Campo de Treinamento#SG_FEEL#QUE_NOIMAGE#
#Os próximos passos serão ensinados pelo instrutor. #
#Converse com Brade #
automacro campoDeAprendiz_irAteSprakki_bugado2 {
    exclusive 1
    QuestActive 7118
    BaseLevel = 2
    NpcNotNear /Sprakki/
    InMap new_1-2, new_2-2, new_3-2, new_4-2, new_5-2
    priority 1
    call GotoSpraki
}

macro GotoSpraki {
    do move 101 29
}

automacro campoDeAprendiz_falarComSprakki_bugado1 {
    exclusive 1
    QuestInactive 7117
    BaseLevel = 2
    NpcNear /Sprakki/
    InMap new_1-2, new_2-2, new_3-2, new_4-2, new_5-2
    priority 0
    call {
      do talk $.NpcNearLastBinId
      do talk resp 0
    }
}

#7118#Campo de Treinamento#SG_FEEL#QUE_NOIMAGE#
#Os próximos passos serão ensinados pelo instrutor. #
#Converse com Brade #
automacro campoDeAprendiz_falarComSprakki_bugado2 {
    exclusive 1
    QuestActive 7118
    BaseLevel = 2
    NpcNear /Sprakki/
    InMap new_1-2, new_2-2, new_3-2, new_4-2, new_5-2
    priority 0
    call {
      do talk $.NpcNearLastBinId
      do talk resp 0
    }
}

#7117#Campo de Treinamento#SG_FEEL#QUE_NOIMAGE#
#Cruze a ponte e encontre o castelo do Campo de Treinamento. #
#Converse com o responsável pelo Campo de Treinamento #
automacro campoDeAprendiz_falarComSprakki {
    exclusive 1
    QuestActive 7117
    BaseLevel = 1
    NpcNear /Sprakki/
    InMap new_1-2, new_2-2, new_3-2, new_4-2, new_5-2
    priority 0
    call {
        do talk $.NpcNearLastBinId
        do talk resp 0
    }
}

#7118#Campo de Treinamento#SG_FEEL#QUE_NOIMAGE#
#Os próximos passos serão ensinados pelo instrutor. #
#Converse com Brade #
automacro campoDeAprendiz_irAteBrade1 {
    exclusive 1
    QuestActive 7118
    NpcNotNear /Brade/
    InMap new_1-2, new_2-2, new_3-2, new_4-2, new_5-2
    priority 2
    call MoveToBrade
}

#7119#Campo de Treinamento#SG_FEEL#QUE_NOIMAGE#
#Você recebeu novos equipamentos. Equipe todos eles. #
#Coloque os novos equipamentos. #
automacro campoDeAprendiz_irAteBrade2 {
    exclusive 1
    QuestActive 7119
    NpcNotNear /Brade/
    InMap new_1-2, new_2-2, new_3-2, new_4-2, new_5-2
    priority 2
    call MoveToBrade
}

macro MoveToBrade {
    do move 103 105
}

#7118#Campo de Treinamento#SG_FEEL#QUE_NOIMAGE#
#Os próximos passos serão ensinados pelo instrutor. #
#Converse com Brade #
automacro campoDeAprendiz_falarComBrade {
    exclusive 1
    QuestActive 7118
    BaseLevel = 2
    NpcNear /Brade/
    InMap new_1-2, new_2-2, new_3-2, new_4-2, new_5-2
    priority 0
    call {
        do pconf 5055 0
        do pconf 2510 0
        do pconf 2414 0
        do pconf 2112 0
        do pconf 1243 0
        do pconf 2352 0
        do talk $.NpcNearLastBinId
    }
}


automacro campoDeAprendiz_irAteBrade_bugado {
    exclusive 1
    QuestInactive 7118
    QuestInactive 7119
    BaseLevel = 3
    InInventoryID 5055 = 0
    NpcNotNear /Brade/
    InMap new_1-2, new_2-2, new_3-2, new_4-2, new_5-2
    priority 1
    call MoveToBrade
}

automacro campoDeAprendiz_falarComBrade_bugado {
    exclusive 1
    QuestInactive 7118
    QuestInactive 7119
    BaseLevel = 3
    InInventoryID 5055 = 0
    NpcNear /Brade/
    InMap new_1-2, new_2-2, new_3-2, new_4-2, new_5-2
    priority 0
    call {
        do pconf 5055 0
        do pconf 2510 0
        do pconf 2414 0
        do pconf 2112 0
        do pconf 1243 0
        do pconf 2352 0
        do talk $.NpcNearLastBinId
    }
}

#7119#Campo de Treinamento#SG_FEEL#QUE_NOIMAGE#
#Você recebeu novos equipamentos. Equipe todos eles. #
#Coloque os novos equipamentos. #
automacro campoDeAprendiz_equiparEsquipesDoBrade {
    exclusive 1
    QuestActive 7119
    IsNotEquippedID topHead 5055, leftHand 2112, robe 2510, shoes 2414, armor 2352, rightHand 1243
    call {
        do pconf 5055 0
        do pconf 2510 0
        do pconf 2414 0
        do pconf 2112 0
        do pconf 1243 0
        do pconf 2352 0
        $check = pegarIndiceDoEquipamentoPeloId("topHead", 5055)
        if ($check != -1) do eq $check
        $check = pegarIndiceDoEquipamentoPeloId("robe", 2510)
        if ($check != -1) do eq $check
        $check = pegarIndiceDoEquipamentoPeloId("shoes",2414)
        if ($check != -1) do eq $check
        $check = pegarIndiceDoEquipamentoPeloId("armor",2352)
        if ($check != -1) do eq $check
        $check = pegarIndiceDoEquipamentoPeloId("leftHand",2112)
        if ($check != -1) do eq $check
        $check = pegarIndiceDoEquipamentoPeloId("rightHand",1243)
        if ($check != -1) do eq $check
    }
}

#7119#Campo de Treinamento#SG_FEEL#QUE_NOIMAGE#
#Você recebeu novos equipamentos. Equipe todos eles. #
#Coloque os novos equipamentos. #
automacro campoDeAprendiz_falarComBradeSegundaVez {
    exclusive 1
    QuestActive 7119
    BaseLevel = 3
    IsEquippedID topHead 5055
    IsEquippedID leftHand 2112
    IsEquippedID rightHand 1243
    IsEquippedID robe 2510
    IsEquippedID armor 2352
    IsEquippedID shoes 2414
    NpcNear /Brade/
    call {
        do talk $.NpcNearLastBinId
    }
}

automacro campoDeAprendiz_bugouNoBradeNaQuest7120IrAteJinha {
    exclusive 1
    QuestInactive 7119
    QuestInactive 7120
    BaseLevel = 4
    InInventoryID 12324 > 0
    IsEquippedID topHead 5055
    IsEquippedID leftHand 2112
    IsEquippedID rightHand 1243
    IsEquippedID robe 2510
    IsEquippedID armor 2352
    IsEquippedID shoes 2414
    SkillLevel NV_FIRSTAID = 0
    NpcNotNear /Jinha/
    call MoveJinha
}

#7120#Campo de Treinamento#SG_FEEL#QUE_NOIMAGE#
#Fale com a instrutora sobre a habilidade Primeiros Socorros. #
#Aprenda sobre Primeiros Socorros #
automacro campoDeAprendiz_irAteJinha {
    exclusive 1
    QuestActive 7120
    NpcNotNear /Jinha/
    SkillLevel NV_FIRSTAID = 0
    priority 0
    call MoveJinha
}

macro MoveJinha {
    do move 107 108
}

automacro campoDeAprendiz_bugouNoBradeNaQuest7120FalarComJinha {
    exclusive 1
    QuestInactive 7119
    QuestInactive 7120
    BaseLevel = 4
    InInventoryID 12324 > 0
    IsEquippedID topHead 5055
    IsEquippedID leftHand 2112
    IsEquippedID rightHand 1243
    IsEquippedID robe 2510
    IsEquippedID armor 2352
    IsEquippedID shoes 2414
    SkillLevel NV_FIRSTAID = 0
    NpcNear /Jinha/
    call TalkJinha
}

#7120#Campo de Treinamento#SG_FEEL#QUE_NOIMAGE#
#Fale com a instrutora sobre a habilidade Primeiros Socorros. #
#Aprenda sobre Primeiros Socorros #
automacro campoDeAprendiz_falarComJinha {
    exclusive 1
    QuestActive 7120
    NpcNear /Jinha/
    SkillLevel NV_FIRSTAID = 0
    priority 0
    call TalkJinha
}

macro TalkJinha {
    do talk $.NpcNearLastBinId
    do talk resp 0
}

automacro campoDeAprendiz_bugouNoBradeNaQuest7120IrAteBrade {
    exclusive 1
    QuestInactive 7119
    QuestInactive 7120
    BaseLevel = 4
    InInventoryID 12324 > 0
    InInventoryID 2393 = 0
    IsEquippedID topHead 5055
    IsEquippedID leftHand 2112
    IsEquippedID rightHand 1243
    IsEquippedID robe 2510
    IsEquippedID armor 2352
    IsEquippedID shoes 2414
    SkillLevel NV_FIRSTAID = 1
    NpcNotNear /Brade/
    call MoveToBrade
}

automacro campoDeAprendiz_bugouNoBradeNaQuest7120FalarComBrade {
    exclusive 1
    QuestInactive 7119
    QuestInactive 7120
    BaseLevel = 4
    InInventoryID 12324 > 0
    InInventoryID 2393 = 0
    IsEquippedID topHead 5055
    IsEquippedID leftHand 2112
    IsEquippedID rightHand 1243
    IsEquippedID robe 2510
    IsEquippedID armor 2352
    IsEquippedID shoes 2414
    SkillLevel NV_FIRSTAID = 1
    NpcNear /Brade/
    call TalkBradeGetTunic
}

#7120#Campo de Treinamento#SG_FEEL#QUE_NOIMAGE#
#Fale com a instrutora sobre a habilidade Primeiros Socorros. #
#Aprenda sobre Primeiros Socorros #
automacro campoDeAprendiz_falarComBradeTerceiraVez {
    exclusive 1
    QuestActive 7120
    SkillLevel NV_FIRSTAID = 1
    NpcNear /Brade/
    priority 0
    call TalkBradeGetTunic
}

macro TalkBradeGetTunic {
    do talk $.NpcNearLastBinId
}

automacro campoDeAprendiz_equiparEquipesDaGarota {
    exclusive 1
    QuestInactive 7120
    InInventoryID 2393 = 1
    InMap new_1-2, new_2-2, new_3-2, new_4-2, new_5-2
    IsNotEquippedID armor 2393
    call {
        $check = pegarIndiceDoEquipamentoPeloId("armor", 2393)
        if ($check != -1) {
            do eq $check
        }
    }
}

automacro campoDeAprendiz_irAteChoco {
    exclusive 1
    IsEquippedID armor 2393
    InMap new_1-2, new_2-2, new_3-2, new_4-2, new_5-2
    NpcNotNear /Choco/
    priority 1
    call {
        do move 32 171
    }
}

automacro campoDeAprendiz_falarComChoco {
    exclusive 1
    QuestInactive 7120
    QuestInactive 7121
    IsEquippedID armor 2393
    InMap new_1-2, new_2-2, new_3-2, new_4-2, new_5-2
    NpcNear /Choco/
    call {
        do talk $.NpcNearLastBinId
        do conf -f  current_npc kafra
    }
}

#7121#Campo de Treinamento#SG_FEEL#QUE_NOIMAGE#
#Converse com os NPCs. #
#Fale com os Guias e com a Kafra. #
automacro campoDeAprendiz_irAteOsGuias {
    exclusive 1
    QuestActive 7121
    NpcNotNear /(Choco|Kafra|Zonda|Soldado)/
    priority 0
    call {
        do move 32 171
    }
}

#7121#Campo de Treinamento#SG_FEEL#QUE_NOIMAGE#
#Converse com os NPCs. #
#Fale com os Guias e com a Kafra. #
automacro campoDeAprendiz_falarComOsGuias_bugado {
    exclusive 1
    QuestActive 7121
    ConfigKeyNotExist current_npc
    NpcNear /Kafra/
    call {
        log Há um bug, a config $.ConfigKeyNotExistLastKey já deveria existir nesse ponto
        log Mas ainda não existe
        log Mudando isso:
        do conf -f current_npc kafra
    }
}

#7121#Campo de Treinamento#SG_FEEL#QUE_NOIMAGE#
#Converse com os NPCs. #
#Fale com os Guias e com a Kafra. #
automacro campoDeAprendiz_falarComKafra {
    exclusive 1
    QuestActive 7121
    ConfigKey current_npc kafra
    NpcNear /Kafra/
    call {
        do talk $.NpcNearLastBinId
        do talk resp 4
        do conf current_npc zonda
    }
}

#7121#Campo de Treinamento#SG_FEEL#QUE_NOIMAGE#
#Converse com os NPCs. #
#Fale com os Guias e com a Kafra. #
automacro campoDeAprendiz_falarComZonda {
    exclusive 1
    QuestActive 7121
    ConfigKey current_npc zonda
    NpcNear /Zonda|Corp/
    call {
        do talk $.NpcNearLastBinId
        do conf current_npc soldado
    }
}

#7121#Campo de Treinamento#SG_FEEL#QUE_NOIMAGE#
#Converse com os NPCs. #
#Fale com os Guias e com a Kafra. #
automacro campoDeAprendiz_falarComSoldado {
    exclusive 1
    QuestActive 7121
    ConfigKey current_npc soldado
    NpcNear /Soldado|Guide/
    call {
        do talk $.NpcNearLastBinId
        do conf current_npc choco
    }
}

#7121#Campo de Treinamento#SG_FEEL#QUE_NOIMAGE#
#Converse com os NPCs. #
#Fale com os Guias e com a Kafra. #
automacro campoDeAprendiz_falarComChocoDeNovo {
    exclusive 1
    QuestActive 7121
    ConfigKey current_npc choco
    NpcNear /Choco/
    call {
        do talk $.NpcNearLastBinId
        do conf current_npc kafra
    }
}

automacro campoDeAprendiz_irParaOsCamposDoBrade {
    exclusive 1
    QuestInactive 7122
    InInventoryID 13040 = 0
    InMap new_1-3, new_2-3, new_3-3, new_4-3, new_5-3
    NpcNotNear /Brade/
    priority 1
    call moveBradeGrounds
}

automacro campoDeAprendiz_falarComBradeNosCamposParaPegarQuests {
    exclusive 1
    QuestInactive 7122
    InInventoryID 13040 = 0
    InMap new_1-3, new_2-3, new_3-3, new_4-3, new_5-3
    NpcNear /Brade/
    call {
        do talk $.NpcNearLastBinId
        do conf route_randomWalk 1
        do conf itemsTakeAuto 2
        $potName = pegarNomePeloIdDoItem(569)
        do conf useSelf_item_0 $potName
        do conf useSelf_item_0_disabled 0
        do conf useSelf_item_0_hp < 60%
        do conf getAuto_0 $potName
        do conf getAuto_0_minAmount 20
        do conf getAuto_0_maxAmount 200
        do conf getAuto_0_passive 0
        do mconf 1063 0 0 0 #lunatico
        do mconf 1002 1 0 0 #poring
        do mconf 1113 0 0 0 #drops
        call voltarAtacar
    }
}

automacro campoDeAprendiz_irAteBradeQuestCompleta {
    exclusive 1
    QuestHuntCompleted 7122 1002
    InMap new_1-3, new_2-3, new_3-3, new_4-3, new_5-3
    NpcNotNear /Brade/
    priority 1
    call moveBradeGrounds
}

macro moveBradeGrounds {
    do mconf 1063 0 0 0 #lunatico
    do mconf 1002 0 0 0 #poring
    do mconf 1113 0 0 0 #drops
    call pararDeAtacar
    do move 99 31
}

automacro campoDeAprendiz_falarComBradeNosCamposQuestCompleta {
    exclusive 1
    QuestHuntCompleted 7122 1002
    InMap new_1-3, new_2-3, new_3-3, new_4-3, new_5-3
    NpcNear /Brade/
    call {
        do talk $.NpcNearLastBinId
        do conf -f quest_atual lunaticos
    }
}

automacro campoDeAprendiz_equiparEquipesParaBradeNosCampos {
    exclusive 1
    QuestInactive 7122
    InInventoryID 13040 = 1
    IsNotEquippedID rightHand 13040
    InMap new_1-3, new_2-3, new_3-3, new_4-3, new_5-3
    call {
        $check = pegarIndiceDoEquipamentoPeloId("rightHand", 13040)
        if ($check != -1) do eq $check
    }
}

automacro campoDeAprendiz_ultimoBugDoBrade {
    NpcMsg /Você ainda está no processo de treinamento/
    exclusive 1
    call {
        log Acabou de ocorrer um bug na sequencia do campo de treinamento
        log Resolvendo isso
        call moveBradeGrounds
        do talk &npc(/Brade/)
        do conf -f quest_atual lunaticos
    }
}

automacro campoDeAprendiz_questLunaticos_bugada {
    QuestHuntCompleted 7122 1002
    ConfigKey quest_atual lunaticos
    exclusive 1
    call {
        log Acabou de ocorrer um bug na sequencia do campo de treinamento
        log Resolvendo isso
        call moveBradeGrounds
        do talk &npc(/Brade/)
    }
}

# Quest de lunaticos , pickys e salgueiros by Nipodemos
# Inspirada na macro de 1 a 99 do CALF
automacro campoDeAprendiz_irAteQuestLunaticos {
    ConfigKey quest_atual lunaticos
    exclusive 1
    NpcNotNear /Mago|Mage/
    QuestInactive 7124
    InMap new_1-3, new_2-3, new_3-3, new_4-3, new_5-3
    call moverPertoDosNpc
}

automacro campoDeAprendiz_comecarQuestLunaticos {
    ConfigKey quest_atual lunaticos
    exclusive 1
    QuestInactive 7124
    NpcNear /Mago|Mage/
    InMap new_1-3, new_2-3, new_3-3, new_4-3, new_5-3
    run-once 1
    call {
        do conf -f o_que_estou_fazendo matando lunático no campo de aprendiz
        do talk $.NpcNearLastBinId
        do talk resp 2
    }
}

#7124#Campo de Treinamento#SG_FEEL#QUE_NOIMAGE#
#Você pode derrotar 5 Lunáticos? Use as 'Lanças de Fogo' do manual para Magos. #
#Derrote 5 Lunáticos #
automacro campoDeAprendiz_cacandoLunaticos {
    QuestActive 7124
    exclusive 1
    InMap new_1-3, new_2-3, new_3-3
    run-once 1
    call {
        [
        do mconf 1063 1 0 0 #lunatico
        do mconf 1002 0 0 0 #poring
        do mconf 1113 0 0 0 #drops
        ]
        call voltarAtacar
        log ======== Indo matar lunaticos
    }
}

automacro campoDeAprendiz_lockMapDefinidoQuandoNaoDeveria {
    ConfigKeyNot lockMap none
    exclusive 1
    InMapRegex /new_\d-\d/
    call {
        do conf lockMap none
        do conf attackAuto_inLockOnly 0
    }

}

macro moverPertoDosNpc {
    log indo pra perto dos Npcs
    call pararDeAtacar
    do move &rand(103,105) &rand(36,38)
    pause 1
}

automacro campoDeAprendiz_mateiLunaticosIndoAteoNpc {
    QuestHuntCompleted 7124 1063
    exclusive 1
    NpcNotNear /Mago|Mage/
    InMap new_1-3, new_2-3, new_3-3
    call moverPertoDosNpc
}

automacro campoDeAprendiz_mateiLunaticos {
    exclusive 1
    QuestHuntCompleted 7124 1063
    NpcNear /Mago|Mage/
    InMap new_1-3, new_2-3, new_3-3, new_4-3, new_5-3
    call {
        do mconf 1063 0 0 0 #lunatico
        do talk $.NpcNearLastBinId
        do talk resp 2
        do conf -f quest_atual pickys
    }
}

automacro campoDeAprendiz_comecarQuestPickyMoverPerto {
    ConfigKey quest_atual pickys
    NpcNotNear /Espadachim|Swordman/
    QuestInactive 7123
    QuestInactive 7124
    exclusive 1
    priority -5
    run-once 1
    InMap new_1-3, new_2-3, new_3-3, new_4-3, new_5-3
    call moverPertoDosNpc
}

automacro campoDeAprendiz_comecarQuestPicky {
    ConfigKey quest_atual pickys
    NpcNear /Espadachim|Swordman/
    QuestInactive 7123
    QuestInactive 7124
    exclusive 1
    priority -5
    run-once 1
    InMap new_1-3, new_2-3, new_3-3, new_4-3, new_5-3
    call {
        log Indo pegar quest para  Picks
        pause 1
        do conf -f o_que_estou_fazendo matando Picky e Salgueiro no campo de aprendiz
        do talk $.NpcNearLastBinId
        do talk resp 2
        do conf -f quest_atual salgueiros
    }
}

#7123#Campo de Treinamento#SG_FEEL#QUE_NOIMAGE#
#Derrote 2 Pickys? Use a habilidade 'Golpe Fulminante' do manual para Espadachins. #
#Derrote 2 Pickys #
automacro campoDeAprendiz_comecarQuestSalgueiroMoverPerto {
    NpcNotNear /Thief|Gatuno/
    ConfigKey quest_atual salgueiros
    QuestActive 7123
    QuestInactive 7127
    QuestInactive 7124
    priority -5
    exclusive 1
    run-once 1
    InMap new_1-3, new_2-3, new_3-3, new_4-3, new_5-3
    call moverPertoDosNpc
}

#7123#Campo de Treinamento#SG_FEEL#QUE_NOIMAGE#
#Derrote 2 Pickys? Use a habilidade 'Golpe Fulminante' do manual para Espadachins. #
#Derrote 2 Pickys #
automacro campoDeAprendiz_comecarQuestSalgueiro {
    ConfigKey quest_atual salgueiros
    QuestActive 7123
    QuestInactive 7127
    QuestInactive 7124
    NpcNear /Thief|Gatuno/
    priority -5
    exclusive 1
    run-once 1
    InMap new_1-3, new_2-3, new_3-3, new_4-3, new_5-3
    call {
        log Indo pegar quest para Salgueiro
        do conf -f o_que_estou_fazendo matando Picky e Salgueiro no campo de aprendiz
        do talk $.NpcNearLastBinId
        do talk resp 2
        do conf -f quest_atual none
    }
}

#7123#Campo de Treinamento#SG_FEEL#QUE_NOIMAGE#
#Derrote 2 Pickys? Use a habilidade 'Golpe Fulminante' do manual para Espadachins. #
#Derrote 2 Pickys #
#7127#Campo de Treinamento#SG_FEEL#QUE_NOIMAGE#
#Derrote 5 Salgueiros com a ajuda da habilidade 'Ataque Duplo'. #
#Derrote 5 Salgueiros #
automacro campoDeAprendiz_treinoMaisPesadoMoverPerto {
    QuestActive 7123
    QuestActive 7127
    ConfigKeyNot master RMS Renewal Test Server
    exclusive 1
    NpcNotNear /Treinador/
    InMap new_1-3, new_2-3, new_3-3
    call moverPertoDosNpc
}

#7123#Campo de Treinamento#SG_FEEL#QUE_NOIMAGE#
#Derrote 2 Pickys? Use a habilidade 'Golpe Fulminante' do manual para Espadachins. #
#Derrote 2 Pickys #
#7127#Campo de Treinamento#SG_FEEL#QUE_NOIMAGE#
#Derrote 5 Salgueiros com a ajuda da habilidade 'Ataque Duplo'. #
#Derrote 5 Salgueiros #
automacro campoDeAprendiz_treinoMaisPesado {
    QuestActive 7123
    QuestActive 7127
    ConfigKeyNot master RMS Renewal Test Server
    exclusive 1
    NpcNear /Treinador/
    InMap new_1-3, new_2-3, new_3-3
    call {
        log mudando pra mapa onde tem pickys e salgueiros
        do talk $.NpcNearLastBinId #Treinador
        do talk resp 1
    }
}

automacro campoDeAprendiz_cacandoPickys {
    QuestHuntOngoing 7123 1049
    InMap new_4-3, new_5-3
    timeout 60
    exclusive 1
    call sePreparandoPraMatar
}

automacro campoDeAprendiz_cacandoSalgueiro {
    QuestHuntOngoing 7127 1010
    InMap new_4-3, new_5-3
    timeout 60
    exclusive 1
    call sePreparandoPraMatar
}

macro sePreparandoPraMatar {
    call voltarAtacar
    do mconf 1113 0 0 0 #drops
    do mconf 1004 0 0 0 #zangao
    do mconf 1049 1 0 0 #picky
    do mconf 1010 1 0 0 #Salgueiro
    log  Indo matar pickys e/ou salgueiros
}

automacro campoDeAprendiz_mateiPickysIndoAteNpc {
    QuestHuntCompleted 7123 1049
    exclusive 1
    InMap new_4-3, new_5-3
    NpcNotNear /Espadachi|Swordman/i
    call moverPertoDosNpc
}

automacro campoDeAprendiz_mateiPickys {
    QuestHuntCompleted 7123 1049
    exclusive 1
    InMap new_4-3, new_5-3
    NpcNear /Espadachi|Swordman/i
    call {
        do conf -f quest_atual none
        do mconf 1049 0 0 0 #Picky
        do talk $.NpcNearLastBinId
        do talk resp 2
        call voltarAtacar
    }
}

automacro campoDeAprendiz_mateiSalgueirosIndoAteNpc {
    QuestHuntCompleted 7127 1010
    exclusive 1
    InMap new_4-3, new_5-3
    NpcNotNear /Gatuno|Thief/i
    call moverPertoDosNpc
}

automacro campoDeAprendiz_mateiSalgueiros {
    QuestHuntCompleted 7127 1010
    exclusive 1
    NpcNear /Gatuno|Thief/i
    InMap new_4-3, new_5-3
    call {
        do mconf 1010 0 0 0 #Salgueiro
        do talk $.NpcNearLastBinId
        do talk resp 2
    }
}

automacro campoDeAprendiz_completeiTodasAsQuests {
    JobLevel = 10
    BaseLevel < 12
    BaseLevel >= 9
    ConfigKeyNot quest_atual todas_completadas
    QuestInactive 7127
    QuestInactive 7123
    QuestInactive 7124
    InInventoryID 12323 > 50 #asa de mosca de iniciante
    InInventoryID 12324 > 20 #asa de borboleta de iniciante
    exclusive 1
    InMap new_1-3, new_2-3, new_3-3, new_4-3, new_5-3
    call {
        log Completei todas as Quests
        do conf -f quest_atual todas_completadas
    }
}

automacro campoDeAprendiz_continuarUpandoAte12 {
    ConfigKey quest_atual todas_completadas
    QuestInactive 7127
    QuestInactive 7123
    QuestInactive 7124
    InInventoryID 12323 > 50 #asa de mosca de iniciante
    InInventoryID 12324 > 20 #asa de borboleta de iniciante
    BaseLevel < 12
    exclusive 1
    timeout 100
    InMap new_1-3, new_2-3, new_3-3, new_4-3, new_5-3
    call {
        [
        do mconf 1004 1 0 0 #zangao
        do mconf 1007 1 0 0 #fabre
        do mconf 1049 1 0 0 #Picky
        do mconf 1010 1 0 0 #Salgueiro
        do mconf 1063 1 0 0 #lunatico
        do mconf 1002 1 0 0 #poring
        do mconf 1113 1 0 0 #drops
        call voltarAtacar
        do conf -f o_que_estou_fazendo upando até o lvl 12 no campo de aprendiz
        log =================================
        log upando até o lvl 12
        log =================================
        ]
    }
}

#7123#Campo de Treinamento#SG_FEEL#QUE_NOIMAGE#
#Derrote 2 Pickys? Use a habilidade 'Golpe Fulminante' do manual para Espadachins. #
#Derrote 2 Pickys #
#7124#Campo de Treinamento#SG_FEEL#QUE_NOIMAGE#
#Você pode derrotar 5 Lunáticos? Use as 'Lanças de Fogo' do manual para Magos. #
#Derrote 5 Lunáticos #
automacro campoDeAprendiz_continuarUpandoAte12_bugada {
    ConfigKey quest_atual todas_completadas
    QuestActive 7127, 7123, 7124
    BaseLevel < 12
    exclusive 1
    run-once 1
    InMap new_1-3, new_2-3, new_3-3, new_4-3, new_5-3
    call {
        [
        log ===================================================================
        log Deveria upar ate o lvl 12 agora, mas nao completamos uma das quests
        log O número da quest é $.QuestActiveLastID
        log Resolvendo isso
        log Se vc ver essa mensagem mais de uma vez provavelmente a macro está bugada
        log ===================================================================
        ]
        switch ( $.QuestActiveLastID ) {
            case (= 7124) {
                do conf -f quest_atual lunaticos
            }
            case (= 7123) {
                do conf -f quest_atual pickys
            }
            else {
                do conf -f quest_atual salgueiros
            }
        }
    }
}


automacro campoDeAprendiz_seMorrerEnquantoUpaAteLv12 {
    ConfigKey quest_atual todas_completadas
    CurrentHP >= 50%
    IsInCoordinate 95 21
    InMap new_1-3, new_2-3, new_3-3
    exclusive 1
    call mudarDeMapa
}

#7123#Campo de Treinamento#SG_FEEL#QUE_NOIMAGE#
#Derrote 2 Pickys? Use a habilidade 'Golpe Fulminante' do manual para Espadachins. #
#Derrote 2 Pickys #
#7127#Campo de Treinamento#SG_FEEL#QUE_NOIMAGE#
#Derrote 5 Salgueiros com a ajuda da habilidade 'Ataque Duplo'. #
#Derrote 5 Salgueiros #
automacro campoDeAprendiz_seMorrerEnquantoMataPickysESalgueiros {
    QuestActive 7123, 7127
    CurrentHP >= 50%
    priority 5
    InMap new_1-3, new_2-3, new_3-3
    exclusive 1
    call mudarDeMapa
}

macro mudarDeMapa {
    do mconf 1063 0 0 0 #lunatico
    call pararDeAtacar
    do move &rand(103,105) &rand(36,38)
    log mudando pra mapa onde tem pickys e salgueiros
    do talk &npc(/Treinador/) #Treinador
    do talk resp 1
    call voltarAtacar
}

automacro campoDeAprendiz_terminouDeUpar {
    exclusive 1
    JobLevel = 10
    BaseLevel > 11
    ConfigKey quest_atual todas_completadas
    InMap new_1-3, new_2-3, new_3-3, new_4-3, new_5-3
    priority 1
    call {
        call pararDeAtacar
        do move &rand(103,105) &rand(36,38)
        do talk &npc(/$parametrosQuestClasse1{nomeClasse}/i)
        do talk resp 1
        do talk resp 1
        log Agora vou virar um/uma $parametrosQuestClasse1{nomeClasse}!!!
        do conf quest_atual none
    }
}

automacro campoDeAprendiz_terminouDeUpar_bugada {
    exclusive 1
    JobLevel = 10
    BaseLevel > 11
    JobID 0, 4023
    ConfigKeyNot quest_atual todas_completadas
    QuestInactive 7127
    QuestInactive 7123
    QuestInactive 7124
    InInventoryID 12323 > 50 #asa de mosca de iniciante
    InInventoryID 12324 > 20 #asa de borboleta de iniciante
    call {
        do conf -f quest_atual todas_completadas
    }
}

automacro campoDeAprendiz_muitoBugado {
    #esse regex significa: não está no campo de aprendiz nem no mapa de virar classe 1
    InMapRegex /^(?!new_\d-\d|$parametrosQuestClasse1{mapa})$/
    JobID 0, 4023 #Aprendiz e Baby Aprendiz
    exclusive 1
    JobLevel = 10
    timeout 100
    call {
        [
        log WTF?
        log Deveria ser $parametrosQuestClasse1{nomeClasse} agora, mas nem isso eu sou
        log tô todo bugado
        log vamo virar $parametrosQuestClasse1{nomeClasse}, tá na hora
        ]
        do conf -f o_que_estou_fazendo virando Classe 1
        do move $parametrosQuestClasse1{mapa}
    }
}

automacro campoDeAprendiz_apagarVariaveis {
    JobIDNot 0
    JobIDNot 4023
    exclusive 1
    ConfigKey quest_atual todas_completadas
    call {
        do conf quest_atual none
        do conf current_npc none
    }
}

