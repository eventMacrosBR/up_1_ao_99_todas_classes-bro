#campo dos aprendizes by HenryBK and Nipodemos

automacro moveToSprakkiOutside {
	exclusive 1
	InMap new_1-1, new_2-1, new_3-1, new_4-1, new_5-1
	BaseLevel = 1
	NpcNotNear /Sprakki/
	QuestInactive 7117
	call {
		do move 52 113
	}
}

automacro TalkSprakkiOutside {
	exclusive 1
	InMap new_1-1, new_2-1, new_3-1, new_4-1, new_5-1
	BaseLevel = 1
	NpcNear /Sprakki/
	QuestInactive 7117
	call {
		[
        do conf -f in_saveMap_sequence false
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

automacro moveInside {
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

automacro moveInsideBugged2 {
	exclusive 1
	QuestActive 7118
	BaseLevel = 2
	InMap new_1-1, new_2-1, new_3-1, new_4-1, new_5-1
	priority 1
	call GotoInside
}

macro GotoInside {
	$nextMap = nextMap("$.map")
	do move $nextMap 101 29
}

automacro moveNextToSprakki {
	exclusive 1
	QuestActive 7117
	NpcNotNear /Sprakki/
	BaseLevel = 1
	InMap new_1-2, new_2-2, new_3-2, new_4-2, new_5-2
	priority 1
	call GotoSpraki
}

automacro moveNextToSprakkiBugged1 {
	exclusive 1
	QuestInactive 7117
	BaseLevel = 2
	NpcNotNear /Sprakki/
	InMap new_1-2, new_2-2, new_3-2, new_4-2, new_5-2
	priority 1
	call GotoSpraki
}

automacro moveNextToSprakkiBugged2 {
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

automacro talkSprakkiBugged1 {
	exclusive 1
	QuestInactive 7117
	BaseLevel = 2
	NpcNear /Sprakki/
	InMap new_1-2, new_2-2, new_3-2, new_4-2, new_5-2
	priority 0
	call SprakiiBuggedTalk
}

automacro talkSprakkiBugged2 {
	exclusive 1
	QuestActive 7118
	BaseLevel = 2
	NpcNear /Sprakki/
	InMap new_1-2, new_2-2, new_3-2, new_4-2, new_5-2
	priority 0
	call SprakiiBuggedTalk
}

macro SprakiiBuggedTalk {
	do talk $.NpcNearLastBinId

}

automacro talkSprakki {
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

automacro moveNextToBrade1 {
	exclusive 1
	QuestActive 7118
	NpcNotNear /Brade/
	InMap new_1-2, new_2-2, new_3-2, new_4-2, new_5-2
	priority 2
	call MoveToBrade
}

automacro moveNextToBrade2 {
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

automacro talkBrade {
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


automacro moveNextToBradeBugged {
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

automacro talkBradeBugged {
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

automacro equipStuffForBrade {
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
		$check = GetIndexAndEquipped("topHead", 5055)
		if ($check != -1) do eq $check
		$check = GetIndexAndEquipped("robe", 2510)
		if ($check != -1) do eq $check
		$check = GetIndexAndEquipped("shoes",2414)
		if ($check != -1) do eq $check
		$check = GetIndexAndEquipped("armor",2352)
		if ($check != -1) do eq $check
		$check = GetIndexAndEquipped("leftHand",2112)
		if ($check != -1) do eq $check
		$check = GetIndexAndEquipped("rightHand",1243)
		if ($check != -1) do eq $check
	}
}

automacro talkBradeSecond {
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

automacro BradeBuggedNo7120MoveJinha {
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

automacro moveToGirlSkill {
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

automacro BradeBuggedNo7120TalkJinha {
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

automacro talkGirlSkill {
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

automacro BradeBuggedNo7120MoveBrade {
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

automacro BradeBuggedNo7120TalkBrade {
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

automacro talkBradeThird {
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

automacro equipStuffForGirl {
	exclusive 1
	QuestInactive 7120
	InInventoryID 2393 = 1
	InMap new_1-2, new_2-2, new_3-2, new_4-2, new_5-2
	IsNotEquippedID armor 2393
	call {
		$check = GetIndexAndEquipped("armor", 2393)
		if ($check != -1) {
			do eq $check
		}
	}
}

automacro moveNextToChoco {
	exclusive 1
	IsEquippedID armor 2393
	InMap new_1-2, new_2-2, new_3-2, new_4-2, new_5-2
	NpcNotNear /Choco/
	priority 1
	call {
		do move 32 171
	}
}

automacro talkChoco {
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

automacro moveNextToGuys {
	exclusive 1
	QuestActive 7121
	NpcNotNear /(Choco|Kafra|Zonda|Soldado)/
	priority 0
	call {
		do move 32 171
	}
}
automacro talkToGuysBugged {
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

automacro talkKafra {
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

automacro talkZonda {
	exclusive 1
	QuestActive 7121
	ConfigKey current_npc zonda
	NpcNear /Zonda|Corp/
	call {
		do talk $.NpcNearLastBinId
		do conf current_npc soldado
	}
}

automacro talkSoldado {
	exclusive 1
	QuestActive 7121
	ConfigKey current_npc soldado
	NpcNear /Soldado|Guide/
	call {
		do talk $.NpcNearLastBinId
		do conf current_npc choco
	}
}

automacro talkChocoAgain {
	exclusive 1
	QuestActive 7121
	ConfigKey current_npc choco
	NpcNear /Choco/
	call {
		do talk $.NpcNearLastBinId
		do conf current_npc kafra

	}
}

automacro moveBradeGrounds {
	exclusive 1
	QuestInactive 7122
	InInventoryID 13040 = 0
	InMap new_1-3, new_2-3, new_3-3, new_4-3, new_5-3
	NpcNotNear /Brade/
	priority 1
	call moveBradeGrounds
}

automacro talkBradeonGroundsGetQuest {
	exclusive 1
	QuestInactive 7122
	InInventoryID 13040 = 0
	InMap new_1-3, new_2-3, new_3-3, new_4-3, new_5-3
	NpcNear /Brade/
	call {
		do talk $.NpcNearLastBinId
		do conf route_randomWalk 1
		do conf itemsTakeAuto 2
		$potName = GetNamenyNameID(569)
		do conf useSelf_item_0 $potName
		do conf useSelf_item_0_disabled 0
		do conf useSelf_item_0_hp < 60%
		do conf getAuto_0 $potName
		do conf getAuto_0_minAmount 20
		do conf getAuto_0_maxAmount 200
		do conf getAuto_0_passive 0
		do mconf 1063 0 0 0
		do mconf 1002 1 0 0
		do mconf 1113 0 0 0
		call voltarAtacar
	}
}

automacro usarPocaoDeApreniz {
	ConfigKeyNot useSelf_item_0 Poção de Aprendiz
	InInventory "Poção de Aprendiz" > 0
	exclusive 1
	call {
		log parece que tenho poção de aprendiz, mas ainda não foi configurado pra ser usado
		log mudando isso
		$potName = GetNamenyNameID(569)
		do conf useSelf_item_0 $potName
		do conf useSelf_item_0_disabled 0
		do conf useSelf_item_0_hp < 60%
		do conf getAuto_0 $potName
		do conf getAuto_0_minAmount 20
		do conf getAuto_0_maxAmount 200
		do conf getAuto_0_passive 0
		log pronto
	}
}

automacro moveBradeCompleteQuest {
	exclusive 1
	QuestHuntCompleted 7122 1002
	InMap new_1-3, new_2-3, new_3-3, new_4-3, new_5-3
	NpcNotNear /Brade/
	priority 1
	call moveBradeGrounds
}

macro moveBradeGrounds {
	do mconf 1063 0 0 0
	do mconf 1002 0 0 0
	do mconf 1113 0 0 0
	call pararDeAtacar
	do move 99 31
}

automacro talkBradeonGroundsCompleteQuest {
	exclusive 1
	QuestHuntCompleted 7122 1002
	InMap new_1-3, new_2-3, new_3-3, new_4-3, new_5-3
	NpcNear /Brade/
	call {
		do talk $.NpcNearLastBinId
		do conf -f quest_atual lunaticos
	}
}

automacro equipStuffForBradeGrounds {
	exclusive 1
	QuestInactive 7122
	InInventoryID 13040 = 1
	IsNotEquippedID rightHand 13040
	InMap new_1-3, new_2-3, new_3-3, new_4-3, new_5-3
	call {
		$check = GetIndexAndEquipped("rightHand", 13040)
		if ($check != -1) do eq $check
	}
}

automacro LastBradeBug {
	NpcMsg /Você ainda está no processo de treinamento/
	exclusive 1
	priority 0
	call {
		log Acabou de ocorrer um bug na sequencia do campo de treinamento
		log Resolvendo isso
		call moveBradeGrounds
		do talk &npc(/Brade/)
		do conf -f quest_atual lunaticos
	}
}

automacro questLunaticoBugged {
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
automacro irAteQuestLunatico {
	ConfigKey quest_atual lunaticos
	exclusive 1
	NpcNotNear /Mago|Mage/
	QuestInactive 7124
	InMap new_1-3, new_2-3, new_3-3, new_4-3, new_5-3
	call moverPertoDosNpc
}

automacro começarQuestLunaticos {
	ConfigKey quest_atual lunaticos
	exclusive 1
	QuestInactive 7124
	NpcNear /Mago|Mage/
	InMap new_1-3, new_2-3, new_3-3, new_4-3, new_5-3
	run-once 1
	call {
		do talk $.NpcNearLastBinId
		do talk resp 2
	}
}

automacro caçandoLunaticos {
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

automacro lockMap setado quando nao deveria {
	ConfigKeyNot lockMap none
	exclusive 1
	InMap new_1-3, new_2-3, new_3-3, new_4-3, new_5-3
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

automacro mateiLunaticosIndoAteoNpc {
	QuestHuntCompleted 7124 1063
	exclusive 1
	NpcNotNear /Mago|Mage/
	InMap new_1-3, new_2-3, new_3-3
	call moverPertoDosNpc
}

automacro mateiLunaticos {
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

automacro ComeçarQuestPickyMoverPerto {
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

automacro começarQuestPicky {
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
		pause 2
		do talk $.NpcNearLastBinId
		do talk resp 2
		do conf -f quest_atual salgueiros
	}
}

automacro começarQuestSalgueiroMoverPerto {
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

automacro começarQuestSalgueiro {
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
		log Indo pegar quest para  Salgueiro
		do talk $.NpcNearLastBinId
		do talk resp 2
		do conf -f quest_atual none
	}
}

automacro changeToHeavierTrainingMoveClose {
	QuestActive 7123
	QuestActive 7127
	exclusive 1
	NpcNotNear /Trainer/
	InMap new_1-3, new_2-3, new_3-3
	ConfigKey master RMS Renewal Test Server
	call {
		do move &rand(103,105) &rand(36,38)
	}
}


automacro changeToHeavierTraining {
	QuestActive 7123
	QuestActive 7127
	exclusive 1
	NpcNear /Trainer/
	InMap new_1-3, new_2-3, new_3-3
	ConfigKey master RMS Renewal Test Server
	call {
		log mudando pra mapa onde tem pickys e salgueiros
		do talk $.NpcNearLastBinId #Treinador
		do talk resp 0
		do talk resp /5/
	}
}

automacro treinoMaisPesadoMoverPerto {
	QuestActive 7123
	QuestActive 7127
	ConfigKeyNot master RMS Renewal Test Server
	exclusive 1
	NpcNotNear /Treinador/
	InMap new_1-3, new_2-3, new_3-3
	call moverPertoDosNpc
}

automacro treinoMaisPesado {
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

automacro caçandoPickys {
	QuestHuntOngoing 7123 1049
	InMap new_4-3, new_5-3
	timeout 60
	exclusive 1
	call sePreparandoPraMatar
}

automacro caçandoSalgueiro {
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
	log ======== Indo matar pickys e salgueiros
}

automacro mateiPickysIndoAteNpc {
	QuestHuntCompleted 7123 1049
	exclusive 1
	InMap new_4-3, new_5-3
	NpcNotNear /Espadachi|Swordman/i
	call moverPertoDosNpc
}

automacro mateiPickys {
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

automacro mateiSalgueirosIndoAteNpc {
	QuestHuntCompleted 7127 1010
	exclusive 1
	InMap new_4-3, new_5-3
	NpcNotNear /Gatuno|Thief/i
	call moverPertoDosNpc
}

automacro mateiSalgueiros {
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

automacro completeiTodasAsQuests {
	JobLevel = 10
	BaseLevel < 12
	ConfigKeyNot quest_atual todas_completadas
	QuestInactive 7127
	QuestInactive 7123
	QuestInactive 7124
	exclusive 1
	InMap new_1-3, new_2-3, new_3-3, new_4-3, new_5-3
	call {
		log ======== Completei todas as Quests
		do conf -f quest_atual todas_completadas
	}
}

automacro continuarUpandoAte12 {
	ConfigKey quest_atual todas_completadas
	QuestInactive 7127
	QuestInactive 7123
	QuestInactive 7124
	InInventoryID 12323 > 50 #asa de mosca de iniciante
	InInventoryID 12324 > 20 #asa de borboleta de iniciante
	BaseLevel < 12
	exclusive 1
	timeout 180
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
		log =================================
		log upando até o lvl 12
		log =================================
		]
	}
}
automacro continuar upando ate 12 bugged {
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


automacro seMorrerEnquantoUpaAteLv12 {
	ConfigKey quest_atual todas_completadas
	CurrentHP >= 50%
	IsInCoordinate 95 21
	InMap new_1-3, new_2-3, new_3-3
	exclusive 1
	call mudarDeMapa
}

automacro se morrer enquanto mata pickys_e_salgueiros {
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
	log ======== mudando pra mapa onde tem pickys e salgueiros
	do talk &npc(/Treinador/) #Treinador
	do talk resp 1
	call voltarAtacar
}

automacro ifDieWhileKillPickyAndWillow {
	QuestActive 7123, 7127
	CurrentHP >= 50%
	IsInCoordinate 95 21
	InMap new_1-3, new_2-3, new_3-3
	exclusive 1
	call changeMap
}

automacro ifDieWhileLevelingto12 {
	ConfigKey quest_atual todas_completadas
	CurrentHP >= 50%
	IsInCoordinate 95 21
	InMap new_1-3, new_2-3, new_3-3
	exclusive 1
	call changeMap
}

macro changeMap {
	call pararDeAtacar
	do move &rand(103,105) &rand(36,38)
	log ======== mudando pra mapa onde tem pickys e salgueiros
	do talk &npc(/Trainer/) #Treinador
	do talk resp 0
	do talk resp /5/
	call voltarAtacar
}

automacro seClasseNaoExistir {
	ConfigKeyNotExist classe
	exclusive 1
	priority -3
	call {
		log A config de classe ainda nao existe no config.txt
		log Vamos mudar isso
		do conf -f classe none
		log Prontinho
	}
}

automacro EndLeveling Bugged {
	JobLevel 10
	ConfigKey quest_atual todas_completadas
	ConfigKey classe none
	timeout 20
	exclusive 1
	call {
		[
		log TEM UM PEQUENO ERRO
		log VOCE ESQUECEU DE COLOCAR NO CONFIG.TXT QUAL CLASSE 2 QUER SER
		log PRA FAZER ISSO VC DIGITA AQUI NO CONSOLE
		log conf classe CLASSEDESEJADA
		log ALGUNS VALORES: tempario, sacerdote, ferreiro, bruxo
		log EXEMPLO: conf classe caçador
		log OUTRO EXEMPLO: conf classe bardo
		log ATE ISSO SER RESOLVIDO A MACRO NAO VAI PROSSEGUIR
		]
	}
}

automacro endleveling {
	exclusive 1
	JobLevel 10
	BaseLevel > 11
	ConfigKey quest_atual todas_completadas
	ConfigKeyNot classe none
	InMap new_1-3, new_2-3, new_3-3, new_4-3, new_5-3
	priority 1
	call {
	    call pararDeAtacar
		do move &rand(103,105) &rand(36,38)
		do talk &npc(/$classe1Desejada/i)
		do talk resp 1
		do talk resp 1
		log ======== Agora vou virar um $classe1Desejada!!!
		do conf quest_atual none
	}
}



automacro virandoClasse1Bugged {
	JobLevel = 10
	InMapRegex /^(?!new_\d-\d)$/
	SkillLevel NV_BASIC != 9
	exclusive 1
	call {
		$pontos = $.SkillLevelLastLevel
		log As Habilidades básicas nao foram distribuídas!!!
		log A skill ta lvl $.SkillLevelLastLevel
		log Mudando isso
		while ($pontos < 9 ) {
			do skills add NV_BASIC
			$pontos++
		}
	}
}

automacro virandoClasse1 {
	InMap $mapaPraVirarClasse1
	JobID 0 #Aprendiz
	JobLevel 10
	SkillLevel NV_BASIC = 10
	exclusive 1
	call {
		if (&defined($virarClasse1Mover) = 1) do move $virarClasse1Mover
		do talknpc $coordenadaNpcClasse1 $virarClasse1SequenciaDeConversa
		$check = GetIndexAndEquipped("rightHand", "$IDequipIniciante")
		if ($check != -1) do eq $check
	}
}

automacro jaSouClasse1 {
	JobIDNot 0 #aprendiz
	InInventoryID 2414 = 1 #sandalias de aprendiz
	InInventoryID 5055 = 1 #chapeu de ovo de aprendiz
	exclusive 1
	call {
		do pconf 1243 0 #1243#Adaga_do_Aprendiz#
		do pconf 2112 0 #2112#Vembrassa_do_Aprendiz#
		do pconf 2414 0 #2414#Sandálias_do_Aprendiz#
		do pconf 2510 0 #2510#Capuz_do_Aprendiz#
		do pconf 2532 0 #2352#Traje_do_Aprendiz#
		do pconf 5055 0 #5055#Chapéu_de_Ovo_do_Aprendiz#
		do iconf 2393 0 0 0 #Tunica de Iniciante
		do iconf $IDequipIniciante 0 0 0
		$check = GetIndexAndEquipped("rightHand", 1243) #Adaga_do_Aprendiz#
		if ($check != -1) do drop $check
		$check = GetIndexAndEquipped("leftHand", 2112)#Vembrassa_do_Aprendiz#
		if ($check != -1) do drop $check
		$check = GetIndexAndEquipped("shoes", 2414) #Sandálias_do_Aprendiz#
		if ($check != -1) do drop $check
		$check = GetIndexAndEquipped("robe", 2510) #Capuz_do_Aprendiz#
		if ($check != -1) do drop $check
		$check = GetIndexAndEquipped("armor", 2352) #Chapéu_de_Ovo_do_Aprendiz#
		if ($check != -1) do drop $check
		$check = GetIndexAndEquipped("topHead", 5055) #Chapéu_de_Ovo_do_Aprendiz#
		if ($check != -1) do drop $check
		$check = GetIndexAndEquipped("armor", 2393) #Tunica de Iniciante
		if ($check != -1) do eq $check
		$check = GetIndexAndEquipped("rightHand", "$IDequipIniciante")
		if ($check != -1) do eq $check
	}
}

automacro todobugadão {
	InMapRegex /^(?!new_\d-\d|moc_prydb1)$/
	JobID 0
	exclusive 1
	JobLevel = 10
	timeout 100
	call {
		[
		log WTF?
		log Deveria ser $classe1Desejada agora, mas nem isso eu sou
		log tô todo bugado
		log vamo virar $classe1Desejada, tá na hora
		]
		do move $mapaPraVirarClasse1
	}
}