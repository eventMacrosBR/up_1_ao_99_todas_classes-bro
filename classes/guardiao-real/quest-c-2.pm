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
	QuestInactive 3006
	QuestInactive 3007
	QuestInactive 3008
	ConfigKeyNot virarClasse2 true
	NpcNotNear /Senior Crusader/
	call {
		do move prt_castle 45 169 &rand(2,5)
	}
}

automacro virarTemplario_Começo {
	JobLevel = 50
	JobID $paramsClasses{idC1}
	exclusive 1
	QuestInactive 3006
	QuestInactive 3007
	QuestInactive 3008
	run-once 1 #não gosto de fazer isso mas é a melhor opção
	NpcNear /Senior Crusader/
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
	QuestActive 3006, 3007, 3008
	exclusive 1
	timeout 100
	ConfigKeyNot questTemplario jaColeteiOsItens
	call {
		do conf -f virarClasse2 true
		$bandagem = Bandagem Estragada
		$lampiao = Lampião

		if (&invamount($bandagem) < 10) {
			#primeiro item a pegar, depois pega o outro
			$mapaDesejado = moc_pryd03
			$nomeDoItem = $bandagem
			do mconf 1191 1 0 0 #mimico
		} elsif (&invamount($bandagem) >= 10 && &invamount($lampiao) < 10) {
			#quando já tiver 10 bandagens, ele vai pegar os lampiao
			$mapaDesejado = mjo_dun02
			$nomeDoItem = $lampiao
			do mconf 1145 0 0 0 #Martin
			do mconf 1121 0 0 0 #Giearth
		} elsif (&invamount($bandagem) >= 10 && &invamount($lampiao) >= 10) {
			#se já tiver todos os itens, tá na hora!
			log ====================================
			log Já coletei todos os itens, 
			log Indo falar com o NPC
			log ====================================
			do conf -f questTemplario jaColeteiOsItens
			do conf lockMap none
			stop
		}

		if (&config(lockMap) != $mapaDesejado) do conf lockMap $mapaDesejado
		if (&config(attackAuto) != 2) call voltarAtacar
		[
		log ==============================================
		log Estou coletando $nomeDoItem, já tenho &invamount($nomeDoItem)
		log ==============================================
		]
	}
}

automacro virarTemplario_ColeteiTodosOsItens_IndoProNpc {
	InInventoryID 930 >= 10 #Bandagem Estragada
	InInventoryID 1041 >= 10 #Lampião
	ConfigKey questTemplario jaColeteiOsItens
	exclusive 1
	QuestActive 3006, 3007, 3008
	NpcNotNear /Senior Crusader/
	call {
		do move prt_castle 45 169 &rand(2,5)
	}
}

automacro virarTemplario_ColeteiTodosOsItens {
	InInventoryID 930 >= 10 #Bandagem Estragada
	InInventoryID 1041 >= 10 #Lampião
	ConfigKey questTemplario jaColeteiOsItens
	exclusive 1
	QuestActive 3006, 3007, 3008
	NpcNear /Senior Crusader/
	call {
		do talk $.NpcNearLastBinId
	}
}

automacro virarTemplario_comprarRosário {
	InInventoryID 2608 < 1 #Rosário
	IsNotEquippedID rightAccessory 2608 #Rosário
	QuestActive 3009
	Zeny > 16000  #tem q ter pelo menos 1k a mais pra não dar treta
	exclusive 1
	call {
		do move prt_church 108 124
		do talk &npc(/Madre/)
    	do store
    	do buy &store(Rosário) 1
	}
}

automacro virarTemplario_comprarRosário_jaComprado {
	InInventoryID 2608 = 1 #Rosário
	IsNotEquippedID rightAccessory 2608 #Rosário
	QuestActive 3009
	exclusive 1
	call {
		do eq rightAccessory &inventory(Rosário)
		do reload eventMacros
	}
}

automacro virarTemplario_FalarComCaraNaPrisão_IndoAteEle {
	QuestActive 3009
	exclusive 1
	NpcNotNear /Man in Anguish/
	InInventoryID 14586 > 0 #Doce Hiper Açucarado
	InInventoryID 504 > 10 #Poção Branca
	IsEquippedID rightAccessory 2608 #Rosário
	call {
		do move prt_castle 164 32 &rand(4,7)
	}
}

sub configurarBetterShopperProTemplario {
	open (my $write, '>>:encoding(UTF-8)', Settings::getControlFilename('config.txt'));
    print $write "BetterShopper_on 1\n";
	print $write "BetterShopper Doce Hiper Açucarado {\n";
	print $write "\tmaxPrice 40000\n";
	print $write "\tmaxAmount 1\n";
	print $write "\tdisabled 0\n";
	print $write "}\n";
	
	print $write "BetterShopper Poção Branca {\n";
	print $write "\tmaxPrice 1100\n";
	print $write "\tmaxAmount 50\n";
	print $write "\tdisabled 0\n";
	print $write "}\n";
	
    close($fh);
}

automacro virarTemplario_ComprarHiper {
	InInventoryID 14586 = 0 #Doce Hiper Açucarado
	exclusive 1
	Zeny > 100000
	QuestActive 3009
	call {
		do conf lockMap prontera
		do conf route_randomWalk_inTown 1
		call pararDeAtacar
		configurarBetterShopperProTemplario()
		do reload config
		
	}
}

automacro virarTemplario_FalarComCaraNaPrisão {
	QuestActive 3009
	exclusive 1
	InInventoryID 14586 > 0 #Doce Hiper Açucarado
	InInventoryID 504 > 10 #Poção Branca
	NpcNear /Man in Anguish/
	IsEquippedID rightAccessory 2608 #Rosário
	call {
		# essa é a parte dificil que ele tem que passar pelos bixos
		# melhor comprar pot e guaraná
		do conf BetterShopper_on 0
		do talk $.NpcNearLastBinId
		do conf attackAuto -1
		do conf lockMap none
		do talk resp 0
		do is &inventory(14586)
		do move 

	}
}


#Referencias pra quest de classe 2

#Templario
#NPC'S
#Senior Crusader prt_castle 45 169
#Man in Anguish prt_castle 164 32
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

#npc matar tudo : Patron kinght 35 151 talk resp 0 (Tem um typo no nome dele, é intencional, a lug errou)
#precisa de 10 pots no máximo (provavelmente bem menos)
#job_cru Patron kinght

#questinario
#r1 = abençoado
#r2 = 50%
#r3 = chapeeeu de monge
#r4 = zumbi prisioneiro
#r5 = Drake
#r6 = orc zumbi
#r7 = meio-irmão e irmã
#r8 = esqueleto
#r9 = amuleto escudo
#r10 = munak
#
#r1 = 3
#r2 = 440
#r3 = 21
#r4 = Zéfiro
#r5 = 2
#r6 = 80% da velocidade
#r7 = Somente Noviços podem aprender
#r8 = 31
#r9 = Maldição
#r10 = Uma pessoa se preparando para a Guerra
#
#r1 = isis
#r2 = Tsurugi Sagrada
#r3 = Martelo Dourado
#r4 = Marionete
#r5 = Ghostring
#r6 = Escudo do Inferno
#r7 = Terra
#r8 = Cochicho
#r9 = fantasma
#r10 = Jogar Água Benta
#Deu certo, finalmente