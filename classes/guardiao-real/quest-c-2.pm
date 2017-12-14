sub initParamsQuestClasse2 {
	Commands::run("iconf 523 1 1 0"  ); #Água Benta
	Commands::run("iconf 930 10 1 0" ); #Bandagem Estragada
	Commands::run("iconf 1041 10 1 0"); #Lampião
	Commands::run("iconf 2608 1 1 0" ); #Rosário 
	Commands::run("conf -f questc2_implementada true");
}

automacro virarTemplario_Começo_irAoNpc {
	JobLevel = 50
	JobID $paramsClasses{idC1}
	exclusive 1
	QuestInactive 3008
	ConfigKeyNot virarClasse2 true
	NpcNotNear /Templário Sênior/
	call {
		do move prt_castle 45 169 &rand(2,5)
	}
}

automacro virarTemplario_Começo {
	JobLevel = 50
	JobID $paramsClasses{idC1}
	exclusive 1
	QuestInactive 3008
	ConfigKeyNot virarClasse2 true
	NpcNear /Templário Sênior/
	call {
		do talk $.NpcNearLastBinId
		do talk resp 0
		do talk resp 0
		[
		log ==============================
		log Falei com o Templario, agora 
		log vou coletar os itens!
		log ==============================
		]
	}
}

automacro virarTemplario_PegarItens {
	QuestActive 3008
	exclusive 1
	timeout 100
	call {
		do conf -f virarClasse2 true
		$bandagem = 930
		$lampiao = 1041

		if (&invamount($bandagem) <= 10) {
			#primeiro item a pegar, depois pega o outro
			$mapaDesejado = moc_pryd03
			$nomeDoItem = Bandagem Estragada
			do mconf 1191 1 0 0 #mimico
		} elsif (&invamount($bandagem) >= 10 && &invamount($lampiao) <= 10) {
			#quando já tiver 10 bandagens, ele vai pegar os lampiao
			$mapaDesejado = mjo_dun02
			$nomeDoItem = Lampião
			do mconf 1145 0 0 0 #Martin
			do mconf 1121 0 0 0 #Giearth
		}

		if (&config(lockMap) != $mapaDesejado) do conf lockMap $mapaDesejado
		if (&config(attackAuto) != 2) call voltarAtacar
		[
		log ===================================
		log Estou coletando $nomeDoItem
		log ===================================
		]
	}
}

automacro virarTemplario_ColeteiTodosOsItens {
	InInventoryID 930 >= 10 #Bandagem Estragada
	InInventoryID 1041 >= 10 #Lampião
	exclusive 1
	QuestActive 3008
	NpcNotNear /Templário Sênior/
	call {
		do move prt_castle 45 169 &rand(2,5)
		do talk $.NpcNearLastBinId
	}
}

#Referencias pra quest de classe 2

#Templario
#NPC'S
#Templário Sênior prt_castle 45 169
#Homem Angustiado prt_castle 164 32
#Templária prt_church 95 127
#Bliant Piyord prt_castle 35 151

#lugar pra pegar os 10 Lampião: 
#mjo_dun02 (lento mas morre menos na teoria)
#mjo_dun03 (rápido mas morre mais teoricamente)
#
#lugar pra pegar as 10 Bandagem Estragada
#moc_pryd03 (melhor, mas mesmo assim é bem dificil , o ideral seria ter pots)

#Agua Benta só é obtivel por meio de lojinha de players, então é necessario o uso do plugin better shopper
#Precisa tambem de bala de guraná com certeza
#e precisa habilitar vigor dentro daquele mapa
#e precisa de Rosário, que pode ser comprado em: prt_church 108 124 (npc Madre) ,custo: 15k
# o ideal é comprar pot branca que cura mais! assim tem menos chance de morrer porque vai ter que usar menos vezes a pot
