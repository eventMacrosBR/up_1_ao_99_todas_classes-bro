# 22508#Emblema do Éden#


automacro seJuntarAoGrupoEden_MoverPerto {
	InInventoryID 22508 = 0 #Emblema do Éden# 
	IsNotEquippedID armor 15009
	InInventoryID 15009 = 0
	IsNotEquippedID armor 15010
	InInventoryID 15010 = 0
	IsNotEquippedID armor 15011
	InInventoryID 15011 = 0
	IsNotEquippedID armor 15031
	InInventoryID 15031 = 0
	ConfigKeyNot quest_eden em_curso
	ConfigKeyNot virarArrauceiro true
	ConfigKeyNot in_saveMap_sequence true
	InInventoryID 2414 = 0 #sapatos de aprendiz
	exclusive 1
	BaseLevel >= 12
	ConfigKeyNot membroDoEden sim
	NpcNotNear /Lenore|Lime/
	JobIDNot 0 #aprendiz
	call moverPertoDosNpcEden
}

automacro seJuntarAoGrupoEden {
	InInventoryID 22508 = 0 #Emblema do Éden#
	IsNotEquippedID armor 15009
	InInventoryID 15009 = 0
	IsNotEquippedID armor 15010
	InInventoryID 15010 = 0
	IsNotEquippedID armor 15011
	InInventoryID 15011 = 0
	IsNotEquippedID armor 15031
	InInventoryID 15031 = 0
	ConfigKeyNot membroDoEden sim
	ConfigKeyNot quest_eden em_curso
	ConfigKeyNot virarArrauceiro true
	ConfigKeyNot in_saveMap_sequence true
	run-once 1
	exclusive 1
	NpcNear /Lenore|Lime/
	call {
		do talk $.NpcNearLastBinId
		do talk resp 1
		do talk resp 0
		do talk text lolol
		do talk text lolol
		do talk resp 4
		do iconf 22508 0 0 0 #Emblema do Éden
	}
}

automacro entrouNoGrupoEden {
	InInventoryID 22508 = 1 #Emblema do eden
	ConfigKeyNot membroDoEden sim
	exclusive 1
	call {
		do conf -f membroDoEden sim
	}
}

automacro TrocarEmblema_IndoProNpc {
	InInventoryID 6219 = 1
	NpcNotNear /Lenore|Lime/
	exclusive 1
	priority -2 # um pouco alta
	call  {
		call moverPertoDosNpcEden
		do reload event
	}
}

automacro TrocarEmblema {
	InInventoryID 6219 = 1
	exclusive 1	
	priority -2 # um pouco alta
	NpcNear /Lenore|Lime/
	call {
		do talk $.NpcNearLastBinId
		do talk resp 0
		do iconf 22508 0 0 0 #Novo Emblema do Grupo Valhalla
	}
}

automacro iniciandoQuestEden12MoverPerto {
	NpcNotNear /Boya/
	InInventoryID 22508 =1 #Emblema do Éden#
	BaseLevel 12..18
	exclusive 1
	QuestInactive 7128
	ConfigKeyNot In_saveMap_sequence true
	ConfigKeyNot quest_eden em_curso
	ConfigKeyNot quest_eden terminando
	IsNotEquippedID armor 15009
	InInventoryID 15009 = 0
	call moverPertoDosNpcEden
}

automacro iniciandoQuestEden26MoverPerto {
	NpcNotNear /Boya/
	BaseLevel 26..32
	InInventoryID 22508 =1 #Emblema do Éden#
	exclusive 1
	QuestInactive 7138
	QuestInactive 7139
	QuestInactive 7140
	ConfigKeyNot In_saveMap_sequence true
	ConfigKeyNot quest_eden em_curso
	ConfigKeyNot quest_eden terminando
	IsNotEquippedID armor 15010
	InInventoryID 15010 = 0
	call moverPertoDosNpcEden
}

automacro IniciandoQuestEden40MoverPerto {
	QuestInactive 7147
	QuestInactive 7148
	QuestInactive 7149
	QuestInactive 7150
	QuestInactive 7151
	JobLevel != 50
	NpcNotNear /Boya/
	BaseLevel 40..49
	exclusive 1
	ConfigKeyNot In_saveMap_sequence true
	ConfigKeyNot quest_eden em_curso
	ConfigKeyNot quest_eden terminando
	IsNotEquippedID armor 15011
	InInventoryID 22508 =1 #Emblema do Éden#
	InInventoryID 15011 = 0 #armadura que ganha com essa quest
	call moverPertoDosNpcEden
}

automacro inciandoQuestEden60MoverPerto {
	NpcNotNear /Ur/
	BaseLevel 60..69
	exclusive 1
	InInventoryID 22508 =1 #Emblema do Éden#
	JobID $paramsClasses{idC2}
	QuestInactive 7214
	ConfigKeyNot In_saveMap_sequence true
	ConfigKeyNot quest_eden em_curso
	ConfigKeyNot quest_eden terminando
	IsNotEquippedID armor 15031
	InInventoryID 15031 = 0
	call moverPertoDosNpcEden
}

macro moverPertoDosNpcEden {
	do conf lockMap none
	call pararDeAtacar
	[
	log ===========================================
	log =movendo pra perto dos npc do eden pra começar a quest
	log ===========================================
	]
	do move moc_para01 &rand(33,35) &rand(25,27) #posição otima no Eden
}

automacro iniciandoQuestEden12 {
	NpcNear /Boya/
	InInventoryID 22508 =1 #Emblema do Éden#
	BaseLevel 12..17
	exclusive 1
	QuestInactive 7128
	ConfigKeyNot In_saveMap_sequence true
	ConfigKeyNot quest_eden em_curso
	ConfigKeyNot quest_eden terminando
	IsNotEquippedID armor 15009
	InInventoryID 15009 = 0
	call iniciandoQuestEden '1' '0' '0'
}


automacro iniciandoQuestEden26 {
	NpcNear /Boya/
	BaseLevel 26..32
	InInventoryID 22508 =1 #Emblema do Éden#
	exclusive 1
	QuestInactive 7138
	QuestInactive 7139
	QuestInactive 7140
	ConfigKeyNot In_saveMap_sequence true
	ConfigKeyNot quest_eden em_curso
	ConfigKeyNot quest_eden terminando
	IsNotEquippedID armor 15010
	InInventoryID 15010 = 0
	call iniciandoQuestEden '1'
}

automacro IniciandoQuestEden40 {
	NpcNear /Boya/
	BaseLevel 40..49
	InInventoryID 22508 = 1
	exclusive 1
	QuestInactive 7147
	ConfigKeyNot In_saveMap_sequence true
	ConfigKeyNot quest_eden em_curso
	ConfigKeyNot quest_eden terminando
	IsNotEquippedID armor 15011
	InInventoryID 15011 = 0
	call iniciandoQuestEden '0'
}

automacro inciandoQuestEden60 {
	NpcNear /Ur/
	BaseLevel 60..69
	exclusive 1
	InInventoryID 22508 = 1
	JobID $paramsClasses{idC2} 
	QuestInactive 7214
	ConfigKeyNot In_saveMap_sequence true
	ConfigKeyNot quest_eden em_curso
	ConfigKeyNot quest_eden terminando
	IsNotEquippedID armor 15031
	InInventoryID 15031 = 0
	call iniciandoQuestEden '0' '1'
}

macro iniciandoQuestEden {
	[
	log ==========================
	log =Iniciando a quest eden
	log ==========================
	]

	#$.param[0] tem como valor a sequencia de conversação correta
	do talk $.NpcNearLastBinId
	if (&defined($.param[0]) = 1) do talk resp $.param[0]
	if (&defined($.param[1]) = 1) do talk resp $.param[1]
	if (&defined($.param[2]) = 1) do talk resp $.param[2]

	switch ($.lvl) {
		case (<= 18) $lvlQueVaiIr = 15
		case (<= 32) $lvlQueVaiIr = 26
		case (<= 49) $lvlQueVaiIr = 50
		case (<= 69) $lvlQueVaiIr = 70
	}
	[
	log ======================================
	log comecei a quest eden, porém só vou
	log fazer ela no lvl $lvlQueVaiIr ou acima!
	log se eu nao tiver no lvl , eu vou upar.
	log lvl que eu estou: $.lvl
	log ======================================
	]
}

automacro Eden12salvarNaKafra {
	QuestActive 7128
	exclusive 1
	BaseLevel 15..25
	ConfigKeyNot In_saveMap_sequence true
	ConfigKeyNot saveMap morocc
	call {
		do conf -f quest_eden em_curso
		call SetSaveIn "morocc"
	}
}

automacro Eden26SalvarNaKafra {
	QuestActive 7138
	BaseLevel >= 26
	exclusive 1
	ConfigKeyNot In_saveMap_sequence true
	ConfigKeyNot saveMap payon
	call {
		do conf -f quest_eden em_curso
		call SetSaveIn "payon"
	}
}

automacro Eden40SalvarNaKafra {
	QuestActive 7147
	BaseLevel >= 50
	exclusive 1
	ConfigKeyNot virarArrauceiro true
	ConfigKeyNot In_saveMap_sequence true
	ConfigKeyNot saveMap prontera
	call {
		do conf -f quest_eden em_curso
		call SetSaveIn "prontera"
	}
}

automacro Eden60SalvarNaKafra {
	QuestActive 7214
	BaseLevel >= 70
	exclusive 1
	ConfigKeyNot In_saveMap_sequence true
	ConfigKeyNot saveMap comodo
	call {
		do conf -f quest_eden em_curso
		call SetSaveIn "comodo"
	}
}

automacro Eden12IrNoMapa {
	QuestActive 7128
	exclusive 1
	BaseLevel >= 15
	ConfigKeyNot In_saveMap_sequence true
	ConfigKey saveMap morocc
	call irNoMapa 'moc_fild11' '180' '253' 'Filhote de Lobo' 'Escorpião' 'Condor'
}

automacro Eden26IrNoMapa {
	QuestActive 7138
	BaseLevel >= 26
	exclusive 1
	ConfigKeyNot In_saveMap_sequence true
	ConfigKey saveMap payon
	call irNoMapa 'pay_arche' '41' '136' 'Esqueleto' 'Poporing' 'Zumbi'
}

automacro Eden40IrNoMapa {
	QuestActive 7147
	BaseLevel >= 50
	exclusive 1
	ConfigKeyNot virarArrauceiro true
	ConfigKeyNot In_saveMap_sequence true
	ConfigKey saveMap prontera
	call irNoMapa 'in_orcs01' '38' '175' 'Guerreiro Orc' 'Filhote de Orc' 'Senhora Orc'
}

automacro Eden60IrNoMapa {
	QuestActive 7214
	BaseLevel >= 70
	exclusive 1
	ConfigKeyNot In_saveMap_sequence true
	ConfigKey saveMap comodo
	call irNoMapa 'comodo' '173' '354'
}

macro irNoMapa {
	do conf -f quest_eden em_curso
	[
	log ===========================
	log =indo fazer a quest eden
	log ===========================
	]
	## $.param[0] tem como valor a cidade
	## $.param[1] tem como valor a coordenada x
	## $.param[2] tem como valor a coordenada y
	## $.param[3] tem como valor o monstro 1
	## $.param[4] tem como valor o monstro 2
	## $.param[5] tem como valor o monstro 3
	
	do move $.param[0] $.param[1] $.param[2] &rand(1,5)
	do talk &npc($.param[1] $.param[2])
	if ($.param[0] = moc_fild11) do talk resp 1  #significa que ta na quest eden 12
	if (&defined($.param[3]) = 1) { #evita de mostrar linhas vermelhas a toa de "variavel não existe"
		do mconf $.param[3] 0 0 0
		do mconf $.param[4] 0 0 0
		do mconf $.param[5] 0 0 0
	}
}


automacro Eden12Caçar {
	QuestHuntOngoing 7129 1009, 7130 1107, 7131 1001
	exclusive 1
	timeout 120
	call caçarMonstros "moc_fild11"
}

automacro Eden26Caçar {
	QuestHuntOngoing 7139 1076, 7140 1031
	exclusive 1
	timeout 180
	call caçarMonstros "pay_dun00"
}

automacro Eden40Caçar {
	QuestHuntOngoing 7148 1686, 7149 1023, 7150 1273
	exclusive 1
	timeout 180
	ConfigKeyNot virarArruaceiro true
	JobLevel != 50
	call caçarMonstros "gef_fild10"
}

automacro Eden60Caçar {
	QuestHuntOngoing 7215 1278, 7216 1278
	exclusive 1
	timeout 60
	call caçarMonstros "beach_dun2"
}

macro caçarMonstros {
	## $.param[0] tem como valor o lockMap que o bot
	## vai caçar os monstros
	[
	call voltarAtacar
	if ( &config(lockMap) != $.param[0]) do conf lockMap $.param[0]
	do mconf $.QuestHuntOngoingLastMobID 2 0 0
	log ===========================================
	log =caçando monstro da quest eden
	log ===========================================
	]
}

automacro Eden60_JuntarItens {
	QuestActive 7217
	exclusive 1
	timeout 120
	call {
		do iconf 7196 5 1 0 #ombreira
		do iconf 7100 7 1 0 #folha
		$ombreira = &invamount (Ombreira)
		$folha = &invamount (Folha Afiada)

		if ( $ombreira < 5 ) goto Ombreira
		if ( $ombreira >= 5 && $folha < 7 ) goto Folha
		:Ombreira
		[
		log ===========================================
		log =coletando Ombreiras pra quest eden
		log ===========================================
		]
		do conf lockMap um_fild02
		call voltarAtacar
		stop

		:Folha
		[
		log ===========================================
		log =coletando Folha Afiada pra quest eden
		log ===========================================
		]
		do conf lockMap um_fild01
		call voltarAtacar
		stop
	}
}

automacro Eden60_JaJunteiOsItens {
	InInventoryID 7196 >= 5
	InInventoryID 7100 >= 7
	QuestActive 7217
	CurrentHP > 80%
	exclusive 1
	call {
		lock Eden60_JuntarItens
		[
		log ===================================
		log Vamos No NPC já tenho os Itens
		log ===================================
		]
		call pararDeAtacar
		do conf attackAuto -1
		do move um_fild01 &rand(36,38) &rand(277,279)
		do talknpc 34 280 c #Romeo#2nd02
		do iconf 7196 0 0 1 #ombreira
		do iconf 7100 0 0 1 #folha
	}
}

automacro Eden12FinalizarCaças {
	QuestHuntCompleted 7129 1009, 7130 1107, 7131 1001
	exclusive 1
	call {
		call pararDeAtacar
		do mconf $.QuestHuntCompletedLastMobID 0 0 0
		[
		log ===========================================
		log =completei a caça, indo falar com o cao falante
		log ===========================================
		]
		do move moc_fild11 &rand(181,183) &rand(254,256)
	  	do talk 0 #cao falante
		release Eden12Caçar
	}
}

automacro Eden26FinalizarCaças {
	QuestHuntCompleted 7139 1076, 7140 1031
	exclusive 1
	call {
		call pararDeAtacar
		do mconf $.QuestHuntCompletedLastMobID 0 0 0
		[
		log ===========================================
		log =completei a caça, indo falar com o Coral
		log ===========================================
		]
		do move pay_arche &rand(44,46) &rand(132,134)
		#do talknpc 41 136 c c c c c #Coral
		do talk &npc( 41 136 ) #Coral
		release Eden26Caçar
	}
}

automacro Eden40FinalizarCaças {
	QuestHuntCompleted 7148 1686, 7149 1023, 7150 1273
	QuestInactive 2017
	QuestInactive 2018
	QuestInactive 2022
	QuestInactive 2023
	QuestInactive 2024
	QuestInactive 2026
	exclusive 1
	call {
		call pararDeAtacar
		do mconf $.QuestHuntCompletedLastMobID 0 0 0
		[
		log ===========================================
		log =completei a caça, indo falar com o Absalom
		log ===========================================
		]
		do move in_orcs01 38 175 &rand(1,4)
		#do talknpc 38 175 c c #Absalom#para07
		do talk 0 #Absalom
		release Eden40Caçar
	}
}

automacro Eden60FinalizarCaças {
	QuestHuntCompleted 7215 1278, 7216 1278
	exclusive 1
	call {
		do mconf $.QuestHuntCompletedLastMobID 0 0 0
		[
		log ===========================================
		log =completei a caça, indo falar com o npc do eden
		log ===========================================
		]
		switch ( $.QuestHuntCompletedLastQuestID ) {

			case (= 7215) { #golem1
				do move comodo &rand(174,176) &rand(344,346)
				#do talknpc 173 354 c c c c c #Mémbro do grupo Éden#2n
				do talk &npc( 173 354 )
				release Eden60Caçar
			}

			case (= 7216) { #golem2
				do move um_fild01 &rand(36,38) &rand(277,279)
				#do talknpc 34 280 c c c c #Romeo#2nd02
				do talk &npc( 34 280 )
				release Eden60Caçar
			}
		}
	}
}

automacro voltarDoMapa {
	QuestActive 7132, 7141, 7151, 7218
	NpcNotNear /Boya|Ur/
	exclusive 1
	call {
		[
		log ===========================================
		log Completei as Caças!
		log vamo lá pegar meus equips de direito!
		log ===========================================
		]
		call moverPertoDosNpcEden
	}
}

automacro voltarDoMapaDentroDoEden {
	QuestActive 7132, 7141, 7151, 7218
	NpcNear /Boya|Ur/
	exclusive 1
	call {
		#7132 : eden 12
		#7141 : eden 26
		#7151 : eden 40
		#7218 : eden 60
		[
		log ===========================================
		log =terminando a quest eden, falando com o npc
		log ===========================================
		]
		switch ($.QuestActiveLastID) {

			case (= 7132) { #eden 12
				#do talknpc 25 35 c c c #Boya
				do talk &npc(/Boya/)
				do mconf Filhote de Lobo 1 0 0
				do mconf Escorpião 1 0 0
				do mconf Condor 1 0 0
			}

			case (= 7141) { #eden 26
				#do talknpc 25 35 c c #Boya
				do talk &npc(/Boya/)
				do mconf Esqueleto 1 0 0
				do mconf Poporing 1 0 0
				do mconf Zumbi 1 0 0
			}

			case (= 7151) { #eden 40
				#do talknpc 25 35 c c #Boya
				do talk &npc(/Boya/)
				do mconf Guerreiro Orc 1 0 0
				do mconf Filhote de Orc 1 0 0
				do mconf Senhora Orc 1 0 0
			}

			case (= 7218) { #eden 60
				#do talknpc 23 35 c c c #Uru
				do talk &npc(/Ur/)
			}
		}
		do conf -f quest_eden terminando
	}
}
automacro EdenPegandoEquips_IndoProNpc {
	NpcNotNear /hael/i
	ConfigKey quest_eden terminando
	BaseLevel 12..99
	exclusive 1
	call {
		do move moc_para01 48 37 #portal que antes era porta
		do move moc_para01 &rand(112,114) &rand(31,33)
	}
}


automacro EdenPegandoEquips12e26e40 {
	ConfigKey quest_eden terminando
	BaseLevel 12..59
	timeout 120
	NpcNear /hael/i
	call {
		[
		log ===========================================
		log =falando com o Mihael pra ganhar meus equips
		log ===========================================
		]
		do talk $.NpcNearLastBinId
		do talk resp 0
		do talk resp 1
		
		if ( $.lvl >= 40 ) {
			do talk resp /$paramsQuestEden{armaLevel26e40}/i
			
		} elsif ( $.lvl >= 26) {
			do talk resp /$paramsQuestEden{armaLevel26e40}/i
			
		}

		if ( $.lvl >= 40 ) {
			#pegar encantamento do chapeu valhalla
			do talk $.NpcNearLastBinId
			do talk resp 2
			do talk resp 4
			do talk resp 0
		}
	}
}

automacro EdenPegueiEquips12e26e40 {
	ConfigKey quest_eden terminando
	BaseLevel 12..59
	NpcNear /hael/i
	exclusive 1
	SimpleHookEvent item_gathered
	call {
		do conf -f quest_eden none
	}
}

automacro EdenPegandoEquips60 {
	ConfigKey quest_eden terminando
	BaseLevel 60..98
	timeout 120
	IsNotEquippedID armor 15031
	NpcNear /Ferreiro|smith/i
	call {
		[
		log ===========================================
		log =falando com o ferreiro pra ganhar meus equips
		log ===========================================
		]
		#do talknpc 111 83 c r2 c c r1 #Ferreiro Torhen#2nd10
		do talk $.NpcNearLastBinId
		do talk resp 2
		do talk resp 1
		do talk resp /$paramsQuestEden{armaLevel60}/i
	}
}

automacro EdenPegueiEquips60 {
	ConfigKey quest_eden terminando
	BaseLevel 60..98
	exclusive 1
	IsNotEquippedID armor 15031
	NpcNear /Ferreiro|smith/i
	SimpleHookEvent item_gathered
	call {
		do conf -f quest_eden none
	}
}

automacro Eden12Equipando {
	IsNotEquippedID armor 15009
	InInventoryID 15009 = 1
	BaseLevel 12..25
	exclusive 1
	run-once 1
	call {
		[
		log ===========================================
		log =equipando os itens de eden lvl 12
		log ===========================================
		]
		$check = GetIndexAndEquipped("robe", 2560) #Capa Valhalla
		if ($check != -1) do eq $check
		$check = GetIndexAndEquipped("topHead", 5583) #Chapeu valhalla
		if ($check != -1) do eq $check
		$check = GetIndexAndEquipped("shoes", 2456) #Botas Valhalla Iniciante
		if ($check != -1) do eq $check
		$check = GetIndexAndEquipped("armor", 15009) #Uniforme Valhalla Iniciante
		if ($check != -1) do eq $check
	}
}

automacro Eden26Equipando {
	IsNotEquippedID armor 15010
	InInventoryID 15010 = 1
	BaseLevel 26..49
	exclusive 1
	run-once 1
	call {
		[
		log ===========================================
		log =equipando os itens de eden lvl 26
		log ===========================================
		]

		$check = GetIndexAndEquipped("shoes", 2457) #Botas Valhalla Intermediárias
		if ($check != -1) do eq $check
		$check = GetIndexAndEquipped("rightHand", "$paramsQuestEden{IDarmaIniciante}") #Arma Valhalla Iniciante
		if ($check != -1) do eq $check
		$check = GetIndexAndEquipped("armor", 15010) #Uniforme Valhalla Intermediário
		if ($check != -1) do eq $check
	}
}

automacro Eden40Equipando {
	IsNotEquippedID armor 15011
	InInventoryID 15011 = 1
	BaseLevel 40..69
	exclusive 1
	run-once 1
	call {
		[
		log ===========================================
		log =equipando os itens de eden lvl 40
		log ===========================================
		]
		$check = GetIndexAndEquipped("shoes", 2458) #Botas Valhalla Avançadas
		if ($check != -1) do eq $check
		$check = GetIndexAndEquipped("rightHand", "$paramsQuestEden{IDarmaIntermediario}") #Arma Valhalla Intermediária
		if ($check != -1) do eq $check
		$check = GetIndexAndEquipped("armor", 15011) #Uniforme Valhalla Avançado
		if ($check != -1) do eq $check
	}
}

automacro Eden60Equipando {
	IsNotEquippedID robe 2571
	IsNotEquippedID topHead 18514
	IsNotEquippedID shoes 2473
	IsNotEquippedID rightHand 13066
	IsNotEquippedID armor 15031
	InInventoryID 2571  = 1
	InInventoryID 18514 = 1
	InInventoryID 2473  = 1
	InInventoryID 13066 = 1
	InInventoryID 15031 = 1
	run-once 1
	BaseLevel 60..98
	exclusive 1
	call {
		[
		log ===========================================
		log =equipando os itens de eden level 60
		log ===========================================
		]
		$check = GetIndexAndEquipped("robe", 2571) #Capa II do Grupo Eden
		if ($check != -1) do eq $check
		$check = GetIndexAndEquipped("topHead", 18514) #Chapéu_II_do_Grupo_Éden#
		if ($check != -1) do eq $check
		$check = GetIndexAndEquipped("shoes", 2473) ##Botas_IV_do_Grupo_Éden#
		if ($check != -1) do eq $check
		$check = GetIndexAndEquipped("rightHand","$paramsQuestEden{IDarmaEden}") #Arma do Grupo Eden#
		if ($check != -1) do eq $check
		$check = GetIndexAndEquipped("armor", 15031) #Armadura_do_Grupo_Éden#
		if ($check != -1) do eq $check
	}
}


#
#
#
# FIM DAS QUESTS EDEN
#

