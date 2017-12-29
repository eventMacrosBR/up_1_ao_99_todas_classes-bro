sub initParamsQuestClasse2 {
	#TODO
}

automacro virarFerreiro {
	JobLevel = 50
	JobID $paramsClasses{idC1}
	exclusive 1
	ConfigKeyNot virarClasse2 true
	call {
		[
			do conf lockMap none
			do conf route_randomWalk 0
			do conf attackAuto 0
		]
		
		do conf quest_classe2 IrParaEinbroch
	}	
}

automacro virarFerreiro_Inicio {
	ConfigKey quest_classe2 IrParaEinbroch
	NpcNotNear /Mestre Ferreiro/ #Altazen
	exclusive 1
	call {
		call setSaveIn "einbroch"
		do move ein_in01 &rand(16,20) &rand(26, 30)
		do conf quest_classe2 TalkToAltazen
	}
}

automacro virarFerreiro_falarComAltazen {
	ConfigKey quest_classe2 TalkToAltazen
	NpcNear /Mestre Ferreiro/ #Altazen
	location ein_in01
	exclusive 1
	call {
		do talknpc 110 169 c c c r0 c c c c #Do the job change.
		do conf quest_classe2 primeiro_questionario
	}
}

automacro virarFerreiro_responderPrimeiroQuestionario{
	ConfigKey quest_classe2 primeiro_questionario
	QuestActive 2000
	macro_delay 2
	call {
		do move ein_in01 &rand(199,203) &rand(25,29)
		do conf quest_classe2 TalkToGetsufenst
	}	
}

automacro TalkToGetsufenst {
	ConfigKey quest_classe2 TalkToGetsufenst
	NpcNear /Mestre Ferreiro/ #Getsufenst
	macro_delay 2
	exclusive 1
	call {
		do talknpc 201 27 r0 r~/(Alberta - Maça-Espada)|(Al De Baran - Martelo)/ r~/Atordoamento|3/ r~/Agilidade|carrinho/ r~/Alberta|Geffen/ r~/Noroeste|Sudeste/ r~/Bíblia|Claymore/ r~/Casaco de Pele/ r~/5|4/ r~/sakkat|ANOLIAN/ r~/Dinheiro/
		pause &rand(5,10)
		do talknpc 201 27
		pause &rand(2,5)
		do conf quest_classe2 GetsufenstTask
	}
}

# Até aqui parece ok

automacro GetsufenstTask {
    ConfigKey quest_classe2 GetsufenstTask
	QuestActive 2003
    location alberta_in
    exclusive 1
    run-once 1
    call {
		do move alberta &rand(115, 118) &rand(51, 54)
		pause 1
		do conf autoTalkCont 1
		pause 0.8
		do talknpc 113 60
		do talk resp 1
		call CheckKafra
    }
}

#TODO REmover esses GOTO, jumps são ruins
macro CheckKafra {
	if (&invamount(Green Herb) < 20) goto getGreenHerb
    if (&invamount(Iron) < 8) goto getIron
	if (&invamount(Animal Skin) < 2) goto getAnimalSkin
	
	log Cheking kafra storage done.
	do conf quest_classe2 FarmQuestItems
	
	:getGreenHerb
		do autostorage
		if ($.storageopen) {
			do storage get &storage (Green Herb) &eval (20 - $invGH)
			pause 1
			do storage close
		}
    :getIron
		do autostorage
		if ($.storageopen) {
			do storage get &storage (Iron) &eval (8 - $invIR)
			pause 1
			do storage close
		}
    :getAnimalSkin
		do autostorage 
		if ($.storageopen) {
			do storage get &storage (Animal Skin) &eval (2 - $invAS)
			pause 1
			do storage close
		}
}

automacro FarmQuestItems {
	ConfigKey quest_classe2 FarmQuestItems
	exclusive 1
	run-once 1
	call {	
		if (&invamount(Iron) < 8) goto farmIron
		if (&invamount(Green Herb) < 20) goto farmGreenHerb
		if (&invamount(Animal Skin) < 2) goto farmAnimalSkin
		if (&invamount(Ring Pommel Saber [2]) < 1) goto getRingPommel
		
		
		do move alberta_in &rand(176,180) &rand(21,26)
		do conf quest_classe2 TalkToGetsufenstAgain
		
		:farmIron
			[
				do conf quest_classe2 farmIron
				do mconf Steel Chonchon 2
				do pconf Iron 2
				do conf lockMap moc_fild18
				do conf route_randomWalk 1
				do conf attackAuto 2
			]
			lock FarmQuestItems
			stop
		:farmGreenHerb
			[
				do conf quest_classe2 farmGreenHerb
				do mconf Green Plant 2
				do mconf Fabre 2
				do mconf Poporing 2
				do pconf Green Herb 2
				do conf lockMap gef_fild00
				do conf route_randomWalk 1
				do conf attackAuto 2
			]
			lock FarmQuestItems
			stop
		:farmAnimalSkin
			[
				do conf quest_classe2 farmAnimalSkin
				do mconf Savage Babe 2
				do mconf Baby Dessert Wolf 2
				do pconf Animal Skin 2
				do conf lockMap prt_fild09
				do conf route_randomWalk 1
				do conf attackAuto 2
			]
			lock FarmQuestItems
			stop
		:getRingPommel
			[
				do conf quest_classe2 BuyRingPommelSaber
				do conf route_randomWalk 0
				do conf attackAuto 0
				do conf lockMap none
			]
			do respawn
			lock FarmQuestItems
			stop
	}
}

automacro farmIron{
	ConfigKey quest_classe2 farmIron
	InInventory "Iron" >= 8
	run-once 1
	call endfarmIron {
		do conf quest_classe2 QuestItems
		pause &rand(2,4)
		release FarmQuestItems
		release farmIron
	}
}

automacro farmGreenHerb{
	ConfigKey quest_classe2 farmGreenHerb
	InInventory "Green Herb" >= 20
	run-once 1
	call {
		do conf quest_classe2 QuestItems
		pause &rand(2,4)
		release FarmQuestItems
		release farmGreenHerb
	}
}

automacro farmAnimalSkin{
	ConfigKey quest_classe2 farmAnimalSkin
	InInventory "Animal Skin" >= 2
	run-once 1
	call {
		do conf quest_classe2 QuestItems
		pause &rand(2,4)
		release FarmQuestItems
		release farmAnimalSkin
	}
}

automacro BuyRingPommelSaber {
	ConfigKey quest_classe2 BuyRingPommelSaber
	InInventoryID 998 >= 8 #Ferro
	InInventoryID 511 >= 20 #Erva Verde
	InInventoryID 919 >= 2 #Couro de Animal
	Zeny >= 24000
	exclusive 1
	run-once 1
	call {
		if (&inventory "Ring Pommel Saber" >= 1) goto end
		
		[
			do conf attackAuto 0
			do conf route_randomWalk 0	
			do conf lockMap none
			do conf sellAuto 0
			do conf storageAuto 0
			
			do conf buyAuto_0 Ring Pommel Saber [2]
			do conf buyAuto_0_npc prt_in 172 130
			do conf buyAuto_0_minAmount none
			do conf buyAuto_0_maxAmount 1
		]
		
		pause &rand(2,4)
		do autobuy
		
		:end
			do move alberta_in &rand(176,180) &rand(21,26)
			do conf quest_classe2 TalkToGetsufenstAgain
	}
}

automacro TalkToGetsufenstAgain {
	ConfigKey quest_classe2 TalkToGetsufenstAgain
	InInventoryID 998 >= 8 #Ferro
	InInventoryID 511 >= 20 #Erva Verde
	InInventoryID 919 >= 2 #Couro de Animal
	NpcNear /Guildsman/ #Getsufenst
	exclusive 1
	call {
		do talknpc 174 22 c c c c c c r1 c c c c c c #I'm only holding the items required for this Job.
		pause &rand(2,4)
		do move comodo &rand(159,161) &rand(338,342)
	}
}

automacro DeliverToBismark {
	QuestActive 2012
	NpcNear /Bismark/ 
	exclusive 1
	call {
		do talknpc 158 342 c c r1 c c c c c c #I assure you that it's new!
		do conf quest_classe2 GoBackToGetsufenst
		pause &rand(2,4)
		do move alberta_in &rand(176,180) &rand(21,26)
	}
}

automacro DeliverVoucher {
	ConfigKey quest_classe2 GoBackToGetsufenst
	QuestActiive 2012
	NpcNear /Guildsman/ Getsufenst
	exclusive 1
	call {
		do talknpc 174 22 c c c r0 #Ah, yes. Here it is!
		do conf quest_classe2 TalkToAltazen
		pause &rand(2,4)
		do move geffen_in &rand(106,110) &rand(172, 177)
	}
}

automacro TalkToAltazen {
	ConfigKey quest_classe2 TalkToAltazen
	QuestActive 2013
	InMap geffen_in
	NpcNear /Guildsman/ #Altazen
	exclusive 1
	call {
		do talknpc 110 169 c c c c r0 c #It's tough, but I have to go do it.
		do conf quest_classe2 TalkToMitmayer
	}
}

automacro TalkToMitmayer{
	ConfigKey quest_classe2 TalkToMitmayer
	exclusive 1
	call {
		do move morocc &rand(101,103) &rand(107,109)
		pause 30
		do move morocc &rand(93,95) &rand(116,118)
		pause &rand(5,10)
		do move morocc &rand(92,94) &rand(125,127)
		pause &rand(5,10)
		do talknpc 95 133 c c r0 c c c r~/Esqueleto|Aumentar|precisa/ r~/Alberta|Coração|Atordoamento/ r~/Sudoeste|Sangue|1000/ r~/Einbroch|Água|24/ r~/DES|5|24/
		pause &rand(2,4)
		do conf quest_classe2 TalkToAltazenAgain
	}
}

automacro TalkToAltazenAgain{
	ConfigKey quest_classe2 TalkToAltazenAgain
	exclusive 1
	call {
		do move morocc &rand(101,103) &rand(107,109)
		pause &rand(5,10)
		do move geffen_in &rand(106,110) &rand(172, 177)
		pause 30
		do talknpc 110 169 c c c c
		log Finally~!
		do conf quest_classe2 none
		do eq Sword Mace
		[
			do conf buyAuto_0 none
			do conf buyAuto_0_npc none
			do conf buyAuto_0_minAmount none
			do conf buyAuto_0_maxAmount 3
		]
	}
}
