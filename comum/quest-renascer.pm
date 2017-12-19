
automacro chegueilvl99 {
	BaseLevel = 99
	JobLevel = 50
	JobID $paramsClasses{idC2}
	CharCurrentWeight != 0
	Zeny != 1285000
	Zeny != 0
	exclusive 1
	ConfigKey estagio_Reborn none
	macro_delay 2
	call {
		if ($paramsQuestClasseRenascer{renascer} = nao) {
			[
			log ESTOU LVL 99 MAS FUI CONFIGURADO PRA NAO REBORNAR
			log É BOM CASO VC QUEIRA FARMAR ZENY COM CLASSE 2
			log SE QUISER REBORNAR, PROCURE POR :
			log renascer => nao 
			log E TROQUE POR sim
			]
			lock chamarAmigo
		} else {
			do pm "$paramsQuestClasseRenascer{amigo}" ajudaRebornar	
			log peso atual: $.weight
			log peso percentual: $.weightpercent
			[
			do conf dealAuto 3
			do conf dealAuto_names $paramsQuestClasseRenascer{amigo}
			do iconf Camisa de Algodão 0 1 0
			do iconf "Faca [3]" 0 1 0
			do conf getAuto_0 none
			do conf getAuto_1 none
			do conf buyAuto_0 none
			do conf buyAuto_1 none
			do conf lockMap none
			do conf attackAuto -1
			do conf route_randomWalk 0
			do conf relogAfterStorage 0
			do conf storageAuto 1
			do conf storageAuto_npc yuno 152 187
			do conf sellAuto 1
			do conf sellAuto_npc yuno_in01 25 34
			]
			#desequipando tudo
			@slots = (topHead, midHead, lowHead, rightHand, leftHand, armor, robe, shoes, rightAccessory, leftAccessory, arrow)
			
			$i = 0
			while ($i < @slots) {
				desequipar("$slots[$i]")
				pause 0.5
			}
			[
			log ============================
			log TENTANDO FICAR COM 0 DE PESO
			log ============================
			]
			do conf -f estagio_Reborn preparando
		}
	}
}

automacro chamarAmigo {
	exclusive 1
	timeout 120
	JobID $paramsClasses{idC2}
	ConfigKey estagio_Reborn preparando
	Zeny != 1285000
	Zeny != 0
	BaseLevel = 99
	JobLevel = 50
	priority -5 #prioridade alta
	call {
		do pm "$paramsQuestClasseRenascer{amigo}" ajudaRebornar
		#esvazia tudo pra ficar com 0 de peso
		do autosell #se bem me lembro, ele ta autostorage logo depois, o que é bom
	}
}

automacro irNoLocalPraNegociar {
	BaseLevel = 99
	JobLevel = 50
	overrideAI 1
	PlayerNotNear /$paramsQuestClasseRenascer{amigo}/
	CharCurrentWeight = 0
	ConfigKey estagio_Reborn none
	Zeny != 1285000  #vamos ficar com o zeny certo
	exclusive 1
	macro_delay 2
	run-once 1
	ConfigKey saveMap yuno
	call {
		#movendo pra local especifico
		do pm "$paramsQuestClasseRenascer{amigo}" me ajuda a rebornar, vem aqui em juno 146 116
		do move yuno &rand(145,147) &rand(115,117)
	}
}

automacro DandoOuReceBendoZeny {
	CharCurrentWeight 0
	Zeny != 1285000
	ConfigKey estagio_Reborn none
	IsInMapAndCoordinate yuno 145..147 115..117 #lugar pra negociar
	PlayerNear /$paramsQuestClasseRenascer{amigo}/ 
	SimpleHookEvent engaged_deal
	exclusive 1
	call {
		pause 3
		$zenyPraDar = &eval($.zeny - 1285000)
		if ( $zenyPraDar > 0) {
			pause 2
			#se o zeny atual for maior que 1285000, vc dá o excedente pro mercador
			do deal add z $zenyPraDar
			do pm "$paramsQuestClasseRenascer{amigo}" coloquei o zeny, finaliza ai
			pause 2
			do deal
		} else {
			do pm "$paramsQuestClasseRenascer{amigo}" preciso de exatamente $.zeny zenys
			#se o zeny atual for menor que 1285000, vc manda pro mercador via pm quanto mais precisa
		}
	}
}

automacro TudoCerto_VamosRebornar {
	BaseLevel = 99
	JobLevel = 50
	CharCurrentWeight = 0
	Zeny = 1285000
	exclusive 1
	ConfigKey estagio_Reborn preparando
	call {
		# se tiver tudo certinho pra começar o reborn ,essa automacro ativa
		do conf -f estagio_Reborn 1
	}
}

automacro Rebornar_primeiroEstagio {
	ConfigKey estagio_Reborn 1
	InMap yuno
	exclusive 1
	call {
		[
		do ai auto
		do conf lockMap 0
		do conf attackAuto 0
		do conf route_randomWalk 0
		do conf sitAuto_idle 0
		]
		do move yuno_in02
		if ($.map = yuno_in02) do conf estagio_Reborn 2
	}
}
automacro Rebornar_primeiroEstagioBugged {
	ConfigKey estagio_Reborn 1
	NotInMap yuno
	NotInMap yuno_in02
	NotInMap yuno_in05
	exclusive 1
	call {
		log bugs e mais bugs
		log resolvendo
		do move yuno
	}
}

automacro Rebornar_pagarTaxa {
	ConfigKey estagio_Reborn 2
	Zeny = 1285000
	InMap yuno_in02
	exclusive 1
	call {
		do move 90 166
		####do talknpc 88 164 c w1 c w1 c w1 r0
		do talk &npc(/Metheus /)
		do talk resp 0
	}
}

automacro rebornar_lerOLivroEDescer {
	ConfigKey estagio_Reborn 2
	InMap yuno_in02
	exclusive 1
	Zeny = 0
	call {
		do move 93 202
		####do talknpc 93 207 c w1 c w1 c w1 c w1 c w1 c w1 c w1 c
		do talk &npc(93 207)
		do move yuno_in05
		if ($.map = yuno_in05) do conf estagio_Reborn 3
	}
}

automacro Rebornar_terceiroEstagio {
	ConfigKey estagio_Reborn 3
	InMap yuno_in05
	exclusive 1
	call {
		while ($.pos != 41 42) {
			if ( $.pos == 15 185 ) do move 50 85
			if ( $.pos == 50 85 ) do move 41 42
			$randCoord = &random("15 185", "50 85", "41 42")
			if ( $.pos != 41 42 || $.pos != 50 85 || $.pos != 15 185 ) do move $randCoord
		}
		if ( $.pos == 41 42 ) {
			do talknpc 49 43 c
			do conf estagio_Reborn 4
		}
	}
}

automacro Rebornar_ultimoEstagio {
	ConfigKey estagio_Reborn 4
	exclusive 1
	call {
		do move 49 86
		###do talknpc 48 86 c w1 c w1 c w1 c w1 c w1 c w1 c w1 c w1 c
		do talk &npc(48 86)
		do conf estagio_Reborn none
		[
		log =========================================
		log REBORNEEEEEEEEEEEEEEEEEEEEEEEEEEEEEI 
		log =========================================
		]
		stop
	}
}

automacro ConfigEstáErrada2 {
	exclusive 1
	overrideAI 1
	priority -5
	ConfigKeyNot autoTalkCont 1
	call {
		[
		log Tem uma config que está errada
		log A config é $.ConfigKeyNotLastKey
		log O valor que quero é $.ConfigKeyNotLastWantedValue
		log Mas o valor atual é $.ConfigKeyNotLastKeyValue
		log Mudando valor da config $.ConfigKeyNotLastKey de $.ConfigKeyNotLastKeyValue para $.ConfigKeyNotLastWantedValue
		do conf $.ConfigKeyNotLastKey $.ConfigKeyNotLastWantedValue
		]
	}
}

sub desequipar {
	my $type = shift;
	if (exists $char->{equipment}{$type}) {
		$char->{equipment}{$type}->unequip();
	} else {
		message "There is nothing equipped in $type\n";
	}
}

