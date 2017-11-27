#From- Macro Quest Arruaceiro 2.0

#By Gaspel
#Edited- by CALF
#convertido e reescrito pra eventMacro por Nipodemos
automacro virarArruaceiroInicio_salvarEmMorocc {
	JobID 6 #gatuno
	JobLevel = 50
	FreeSkillPoints = 0
	priority 2
	exclusive 1
	ConfigKeyNot saveMap morocc
	ConfigKeyNot In_saveMap_sequence true
	ConfigKeyNot quest_eden em_curso
	ConfigKeyNot quest_eden terminando
	NpcNotNear /Arruaceira da Guilda/
	QuestInactive 2017
	QuestInactive 2018
	QuestInactive 2022
	QuestInactive 2023
	QuestInactive 2024
	QuestInactive 2026
	call SetSaveIn "morocc"
}

automacro virarArruaceiroInicio_IrNoNpc {
	JobID 6 #gatuno
	JobLevel = 50
	FreeSkillPoints = 0
	priority 2
	exclusive 1
	ConfigKey saveMap morocc
	NpcNotNear /Arruaceira da Guilda/
	QuestInactive 2017
	QuestInactive 2018
	QuestInactive 2022
	QuestInactive 2023
	QuestInactive 2024
	QuestInactive 2026
	call {
		call pararDeAtacar
		do conf lockMap none
		do conf -f virarArruaceiro true
		do move in_rogue &rand(361,366) &rand(112,117)
	}
}

automacro virarArruaceiroInicio {
	JobID 6 #gatuno
	JobLevel = 50
	priority 2
	exclusive 1
	NpcNear /Arruaceira da Guilda/
	QuestInactive 2017
	QuestInactive 2018
	QuestInactive 2022
	QuestInactive 2023
	QuestInactive 2024
	QuestInactive 2026
	call {
		#do talknpc 363 122 c r0 r0 r0 r2 r3 r1 r3 r2 r1 r0 r1 c c c #Arruaceira da Guilda
		do talk $.NpcNearLastBinId
		do talk resp 0
		do talk resp 0
		do talk resp 0
		do talk resp 2
		do talk resp 3
		do talk resp 1
		do talk resp 3
		do talk resp 2
		do talk resp 1
		do talk resp 0
		do talk resp 1
	}
}

automacro virarArruaceiro_etapa2_FalarComSmith {
	JobID 6 #gatuno
	QuestActive 2017
	exclusive 1
	run-once 1
	call {
		do move in_rogue &rand(370,373) &rand(20,24)
		do talk &npc ( 376 23 ) #Smith
	}
}


automacro virarArruaceiro_etapa3_coletarItens {
	JobID 6 #gatuno
	QuestActive 2018
	exclusive 1
	ConfigKeyNot questArruaceiro peguei
	timeout 100
	call  {
		do iconf 510 7 1 0 #ervaAzul
		do iconf 957 10 1 0 #unhaApodrecida
		do iconf 932 10 1 0 #osso
		do iconf 958 10 1 0 #mandibula
		$ervaAzul       = &invamount (Erva Azul)
		$unhaApodrecida = &invamount (Unha Apodrecida)
		$osso           = &invamount (Osso)
		$mandibula      = &invamount (Mandíbula Horrenda)
		if ( $ervaAzul < 6 ) goto Erva
		if ( $ervaAzul >= 6 && $unhaApodrecida < 10 ) goto Unha
		if ( $ervaAzul >= 6 && $unhaApodrecida >= 10 && $osso < 10 ) goto Osso
		if ( $ervaAzul >= 6 && $unhaApodrecida >= 10 && $osso >= 10 && $mandibula < 10 ) goto Mandibula


		:Erva
		log Pegar Erva
		[
		do conf lockMap cmd_fild02
		do mconf 1266 0 0 0
		do mconf 1073 0 0 0
		do mconf 1254 0 0 0
		do mconf Cornutus 0 0 0
		do mconf 1074 0 0 0
		do mconf 1391 0 0 0
		do conf attackAuto_inLockOnly 1
		call voltarAtacar
		log =================================
		log Estou coletando ERVA AZUL pra
		log quest de arruaceiro
		log =================================
		]
		stop


		:Unha
		log Pegar Unha
		[
		do conf lockMap pay_dun00
		do mconf 1005 0 0 0
		do mconf 1031 0 0 0
		do mconf 1078 0 0 0
		do mconf 1084 0 0 0
		do conf attackAuto_inLockOnly 1
		call voltarAtacar
		log ================================
		log Estou coletando UNHA APODRECIDA
		log pra quest de arruaceiro
		log ================================
		]
		stop


		:Osso
		log Pegar Osso
		[
		do conf lockMap pay_dun01
		do mconf Drainliar 0 0 0
		do mconf Eggyra 0 0 0
		do mconf 1084 0 0 0
		do mconf 1078 0 0 0
		do conf attackAuto_inLockOnly 1
		do conf route_randomWalk 1
		call voltarAtacar
		log ==============================
		log Estou coletando OSSO para
		log a quest de arruaceiro
		log ==============================
		]
		stop


		:Mandibula
		log Pegar mandibula
		[
		do conf lockMap pay_dun00
		do mconf 1005 0 0 0
		do mconf 1031 1 0 0
		do mconf 1078 0 0 0
		do mconf 1084 0 0 0
		do mconf 1076 0 0 0
		do conf attackAuto_inLockOnly 1
		do conf route_randomWalk 1
		call voltarAtacar
		log ==============================================
		log Estou coletando MANDIBULA pra quest de arruaceiro
		log Recomendado comprar esse item em vez de dropar
		log Tempo pra dropar todas as mandíbulas: 12 horas
		log ==============================================
		]
		stop
	}
}

automacro virarArruaceiro_etapa3_tenhoOsItensIrProNpc {
	InInventory "Erva Azul" >= 6
	InInventory "Unha Apodrecida" >= 10
	InInventory "Osso" >= 10
	InInventory "Mandíbula Horrenda" >= 10
	QuestActive 2018
	Zeny > 9999
	NpcNotNear /Smith/
	exclusive 1
	call {
		lock virarArruaceiro3
		do conf -f questArruaceiro peguei
		log Vamos No NPC já temos os Itens...
		call pararDeAtacar
		do conf lockMap none
		do conf attackAuto_inLockOnly 0
		do mconf 1266 1 0 0
		do mconf 1073 1 0 0
		do mconf 1254 1 0 0
		do mconf Cornutus 1 0 0
		do mconf 1074 1 0 0
		do mconf 1391 1 0 0
		do mconf 1005 1 0 0
		do mconf 1031 1 0 0
		do mconf 1078 1 0 0
		do mconf 1084 1 0 0
		do mconf 1076 1 0 0
		lock virarArruaceiro3
		do move in_rogue &rand(370,373) &rand(20,24)
	}
}

automacro virarArruaceiro_etapa3_tenhoOsItensbugged {
	InInventory "Erva Azul" >= 6
	InInventory "Unha Apodrecida" >= 10
	InInventory "Osso" >= 10
	InInventory "Mandíbula Horrenda" >= 10
	QuestActive 2018
	Zeny < 10000
	exclusive 1
	call {
		log por algum motivo, o bot não tem nem os 10k de zeny pra fazer a quest
		log tentando resolver isso
		do autosell
	}
}


automacro virarArruaceiro_etapa3_tenhoOsItens {
	InInventory "Erva Azul" >= 6
	InInventory "Unha Apodrecida" >= 10
	InInventory "Osso" >= 10
	NpcNear /Smith/
	InInventory "Mandíbula Horrenda" >= 10
	Zeny > 9999
	QuestActive 2018
	exclusive 1
	call {
		lock virarArruaceiro3
		do conf lockMap none
        do conf sitAuto_hp_upper 80
		call pararDeAtacar
		do talk $.NpcNearLastBinId #Smith
		do talk $.NpcNearLastBinId #Smith
		do talk $.NpcNearLastBinId #Smith
		lock virarArruaceiro3
	}
}

automacro virarArruaceiro_etapa4 {
	JobID 6 #gatuno
	exclusive 1
	JobLevel = 50
    CurrentHP >= 80%
	priority 5 #prioridade baixa
	delay 5
	QuestActive 2022, 2023, 2024
	call {
		if ($.map = in_rogue && $.pos ~ 169 34, 246 25, 164 106) {
		    [
		    log ==================================
			log essa macro está se ativando no momento errado
			log reporte esse bug ao criador da macro
			log ==================================
			]
			stop
		}
		do conf lockMap none
        do stand
		do conf attackAuto -1
        log sua posição atual é: $.map $.pos
		switch ($.QuestActiveLastID) {
			case (= 2022) { #opção 1
				do conf -f questArruaceiro 1
				call irAteLocal_questArruaceiro "cmd_fild09 107 195" "1" "2" "1" "0" #local e respostas apropriadas
			}
			case (= 2023) { #opção 2
				do conf -f questArruaceiro 2
				call irAteLocal_questArruaceiro "cmd_fild04 304 180" "2" "1" "1" "2" #local e respostas apropriadas
			}
			case (= 2024) { #opção 3
				do conf -f questArruaceiro 3
				call irAteLocal_questArruaceiro "cmd_fild09 335 143" "0" "2" "4" "0" #local e respostas apropriadas
			}
		}
	}
}

macro irAteLocal_questArruaceiro {
    [
    log ================================
    log =Mapa pra qual está se movendo: '$.param[0]'
    log =Sequência de conversação: '$.param[1] $.param[2] $.param[3] $.param[4]'
    log ================================
    ]
    ## $.param[0] tem como valor cidade e coordenadas
    ## $.param[1] até $.param[4] tem como valor as respostas corretas pra entrar na casa

	do move $.param[0]
	do talk resp $.param[1]
	do talk resp $.param[2]
	do talk resp $.param[3]
	do talk resp $.param[4]
	set exclusive 0
	pause 5
}

automacro virarArruaceiro_etapa5_DentroDaCasa {
	JobLevel = 50
	IsInMapAndCoordinate in_rogue 169 34, in_rogue 246 25, in_rogue 164 106
	exclusive 1
	priority -5
	call {
		switch ($.pos) {
			case (= 169 34) {
				do talknpc 160 34 c r0 c
			}
			case (= 246 25) {
				do move in_rogue 244 33
				do talknpc 244 39 c r0 c
			}
			case (= 164 106) {
				do move in_rogue 172 108
				do talknpc 177 109 c r0 c
			}
		}
	}
}

automacro virarArruaceiro_etapa6_labirinto {
	JobLevel = 50
	exclusive 1
	IsInMapAndCoordinate in_rogue 15 105
	macro_delay 0.5
	call {
		#ahhhh o labirinto.... o bixin vai morrer algumas vezes aqui viu... ou não kkkk
		do conf attackAuto -1
		do conf itemsTakeAuto 0
		do conf lockMap none
		log ================================
		log Iniciando Labirinto
		log ================================
		do move 23 105
		do move 23 334
		#preguiça de fazer o resto das coordenadas específicas
		do move in_rogue 359 117
	}
}

automacro virarArruaceiro_etapa6_morreuNoLabirinto_hpAlto {
	QuestActive 2026
	ConfigKeyNot questArruaceiro none
	JobLevel = 50
	NotInMap in_rogue
	CurrentHP >= 80%
	exclusive 1
	call {
		do stand
		[
		log ==================================================
		log Já esou com hp alto, vou retentar o labirinto
		log ==================================================
		]
		do conf lockMap none
		log a opção de caminho é a &config(questArruaceiro)
		# se vc tiver morrido no labirindo, essa macro que vai fazer voce ir la tentar denovo
		# vai pegar qual o caminho certo e seguir ele
		switch ( &config(questArruaceiro) ) {
			case (= 1) call irAteLocal_questArruaceiro "cmd_fild09 107 195" "1" "2" "1" "0"  #local e respostas apropriadas
			case (= 2) call irAteLocal_questArruaceiro "cmd_fild04 304 180" "2" "1" "1" "2"  #local e respostas apropriadas
			case (= 3) call irAteLocal_questArruaceiro "cmd_fild09 335 143" "0" "2" "4" "0"  #local e respostas apropriadas
			else {
				[
				log ================================
				log =a macro deveria ter escolhido um caminho, mas não conseguiu, isso é um bug
				log ================================
				]
				stop
			}
		}
		log Indo até o local &config(questArruaceiro)
	}
}

automacro virarArruaceiro_etapa6_morreuNoLabirinto_hpBaixo {
	QuestActive 2026
	JobLevel = 50
	NotInMap in_rogue
	CurrentHP < 80%
	exclusive 1
	timeout 120
	call {
		[
		log ====================================
		log MORRI TENTANDO PASSAR PELO LABIRINTO
		log HP ATUAL: $.CurrentHPLastPercent%
		log ESPERANDO HP FICAR ACIMA DE 80%
		log ====================================
		]
		do sit
		if ( &config (sitAuto_hp_upper) != 80 ) {
		do conf sitAuto_hp_lower 20
		do conf sitAuto_hp_upper 80
		}
	}
}

automacro virarArruaceiro_etapaFinal {
	JobLevel = 50
	#IsInMapAndCoordinate in_rogue 359 117
	NpcNear /Marybell/
	InMap in_rogue
	QuestActive 2026
	exclusive 1
	call {
		log ===========================
		log PASSEI PELO LABIRINTO!!!!
		log ===========================
		do move in_rogue 369 119
		do talknpc 363 122 c c c
		do conf itemsTakeAuto 1
	}
}

automacro virarArruaceiro_etapaFinal_Alternativo {
	JobLevel = 50
	#IsInMapAndCoordinate in_rogue 378 113
	NpcNear /Homem Assustador/
	InMap in_rogue
	QuestActive 2026
	exclusive 1
	call {
		log ===========================
		log PASSEI PELO LABIRINTO!!!!
		log ===========================
		do move in_rogue 369 119
		do talknpc 363 122 c c c
		do conf itemsTakeAuto 1
	}
}

automacro jaSouArruaceiro {
	JobID 17 #arruaceiro
	ConfigKey virarArruaceiro true
	exclusive 1
	call {
		do conf teleportAuto_MaxDmg 1000
		do iconf Erva Azul 0 1 0
		do iconf Mandíbula Horrenda 0 0 1
		do iconf Osso 0 0 1
		do iconf Unha Apodrecida 0 0 1
		$check = GetIndexAndEquipped("robe", 2560) #Capa Valhalla
		if ($check != -1) do eq $check
		$check = GetIndexAndEquipped("topHead", 5583) #Chapeu valhalla
		if ($check != -1) do eq $check
		call pararDeAtacar
		do conf virarArruaceiro none
		do conf questArruaceiro none
	}
}
#
#
#
# FIM DA QUEST PRA VIRAR ARRUACEIRO
#
