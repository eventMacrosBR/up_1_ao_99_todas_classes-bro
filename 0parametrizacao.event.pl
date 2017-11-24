#Parametrização by vitorsilverio

#Macro responsavel por definir as skills/stats padroes dependendo da classe
#Planejada para extender outras classes no futuro
automacro definirVariaveis{
	timeout 300 #che e atualiza as variáveis a cada 5 minutos
	priority -999 #pioridade altíssmia, sempre vai ser a primeira a executar
	exclusive 1
	ConfigKeyNot classe none
	call {
		$skillsAprendiz = NV_BASIC 9 #Essa é padrão independente da classe
		switch (&config(classe)) {
			case (=~ /alquimista/i) {
				do conf classe alquimista #deixar por padrão tudo lowercase (caso o usuario colocar letra maiuscula)
				call definirVariaveisClasse1 "mercador"
				$skillsClasse1 = MC_INCCARRY 10, MC_DISCOUNT 8, MC_OVERCHARGE 10, MC_PUSHCART 10, MC_VENDING 10, MC_IDENTIFY 1
				$skillsClasse2 = AM_REST 1, AM_CALLHOMUN 1, AM_RESURRECTHOMUN 5, AM_AXEMASTERY 10, AM_LEARNINGPOTION 10, AM_PHARMACY 10, AM_POTIONPITCHER 5, MC_DISCOUNT 10, AM_CANNIBALIZE 5
				$statsPadrao = 10 dex, 15 agi, 20 dex, 25 agi, 20 str, 30 dex, 60 agi, 30 str, 40 dex, 20 vit, 80 agi ,60 dex, 50 str, 90 agi, 70 str, 40 vit
				$IDClasse1 = 5
				$IDClasse2 = 18	
				#Itens da quest de classe
				do iconf 657 7 1 0 #Poção da Fúria Selvagem
				do iconf 612 100 1 0 #Mini Fornalha
				do iconf 1752 7500 1 0 #Flecha de Fogo
				do iconf 710 0 0 0 #Flor das ilusoes (vai ser feita a quest mais rapida)

				@mapasDeUp = ("1;11;pay_fild01;payon", "12;25;pay_fild08;payon", "26;40;pay_dun00;payon", "41;45;pay_fild09;payon", "46;53;iz_dun00;izlude", "54;59;iz_dun02;izlude", "60;70;moc_fild17;morocc", "71;79;mjolnir_11;prontera", "80;98;gef_fild06;geffen")
			}
			case (=~ /arruaceiro/i) {
				do conf classe arruaceiro
				call definirVariaveisClasse1 "gatuno"	
				$skillsClasse1 = TF_DOUBLE 10, TF_MISS 10, TF_STEAL 10, TF_HIDING 8, TF_POISON 10, TF_DETOXIFY 1
				$skillsClasse2 =  RG_SNATCHER 10, RG_STEALCOIN 10, RG_BACKSTAP 4, RG_TUNNELDRIVE 5, RG_RAID 5, RG_INTIMIDATE 5, RG_PLAGIARISM 10
				$statsPadrao = 10 dex, 15 agi, 20 dex, 25 agi, 20 str, 30 dex, 60 agi, 30 str, 40 dex, 20 vit, 80 agi, 25 luk ,60 dex, 50 str, 40 luk, 90 agi, 60 str, 29 vit
				$IDClasse1 = 6
				$IDClasse2 = 17
				#Itens da quest de classe
				do iconf 510 7 1 0 #ervaAzul
				do iconf 957 10 1 0 #unhaApodrecida
				do iconf 932 10 1 0 #osso
				do iconf 958 10 1 0 #mandibula
				@mapasDeUp = ("1;11;pay_fild01;payon", "12;25;pay_fild08;payon", "26;40;pay_dun00;payon", "41;45;pay_fild09;payon", "46;53;iz_dun00;izlude", "54;59;iz_dun02;izlude", "60;70;moc_fild17;morocc", "71;79;mjolnir_11;prontera", "80;98;gef_fild06;geffen")
			}
			case (=~ /bardo/i) {
				do conf classe bardo
				call definirVariaveisClasse1 "arqueiro"		
				$skillsClasse1 = #TODO
				$skillsClasse2 = #TODO 
				$statsPadrao = #TODO
				$IDClasse1 = 3
				$IDClasse2 = 19
				#Itens da quest de classe
				do iconf x 1 1 0 #Flor qualquer. Pode ser: Aloés(704), Hinalle(703), Flor das Ilusões(710), Izidor(709), Menta(708), Flor Cantante(629), Rosa de Gelo(749), Rosa Eterna(748)
				do iconf 938 1 1 0 #Muco Pegajoso
				do iconf 1024 1 1 0 #Tinta de Polvo
				@mapasDeUp = ("1;11;pay_fild01;payon", "12;25;pay_fild08;payon", "26;40;pay_dun00;payon", "41;45;pay_fild09;payon", "46;53;iz_dun00;izlude", "54;59;iz_dun02;izlude", "60;70;moc_fild17;morocc", "71;79;mjolnir_11;prontera", "80;98;gef_fild06;geffen")
			}
			case (=~ /bruxo/i) {
				do conf classe bruxo
				call definirVariaveisClasse1 "mago"		
				$skillsClasse1 = MG_LIGHTNINGBOLT 5, MG_FIREBOLT 7, MG_COLDBOLT 7,MG_SRECOVERY 10, MG_FIREBOLT 10, MG_COLDBOLT 10, MG_STONECURSE 1, MG_FROSTDIVER 10,MG_SOULSTRIKE 3
				$skillsClasse2 = #TODO 
				$statsPadrao = 20 int, 20 dex, 30 int, 30 dex, 50 int, 20 agi, 60 int, 40 dex, 20 vit, 70 int, 70 dex, 45 agi, 90 int, 90 dex, 2 luk 
				$IDClasse1 = 2
				$IDClasse2 = 9
				#Não necessita Itens paraa quest de classe
        		@mapasDeUp = ("1;11;pay_fild02;alberta", "12;25;pay_fild08;payon", "26;40;pay_dun00;payon", "41;45;moc_fild03;payon", "46;60;cmd_fild01;comodo", "61;70;moc_fild17;morocc", "71;79;yuno_fild09;aldebaran", "80;98;ein_fild09;einbroch")#minhas recomendaçoes de mapa/level,evitando bichos agressivos/detectores
			}
			case (=~ /ca[cç]ador/i) {
				#pior quest de classe possível, altas chances de bugs
				do conf classe cacador	
				call definirVariaveisClasse1 "arqueiro"	
				$skillsClasse1 = #TODO
				$skillsClasse2 = #TODO 
				$statsPadrao = #TODO
				$IDClasse1 = 3
				$IDClasse2 = 11
				#Itens da quest de classe
				#Possibilidade 1	
				do iconf 920 5 1 0 #Garras de Lobo
				do iconf 1019 5 1 0 #Troncos
				do iconf 509 3 1 0 #Ervas Brancas

				#Possibilidade 2
				do iconf 955 9 1 0 #Peles de Verme
				do iconf 935 9 1 0 #Cascas
				do iconf 508 9 1 0 #Ervas Amarelas

				#Possibilidade 3
				do iconf 1021 3 1 0 #Chifres de Dokebi
				do iconf 7032 3 1 0 #Pedaços de Casca de Ovo
				do iconf 914 10 1 0 #Felpas

				#Possibilidade 4
				do iconf 937 3 1 0 #Caninos Venenosos
				do iconf 507 5 1 0 #Ervas Vermelhas
				do iconf 919 3 1 0 #Couros de Animal

				#Possibilidade 5
				do iconf 925 3 1 0 #Bicos de Ave
				do iconf 932 5 1 0 #Ossos
				do iconf 511 3 1 0 #Ervas Verdes

				#Possibilidade 6
				do iconf 913 3 1 0 #Dentes de Morcego
				do iconf 938 1 1 0 #Mucos Pegajosos
				do iconf 948 1 1 0 #Patas de Urso

				#Possibilidade 7 	
				do iconf 1027 2 1 0 #Espinhos de Porco-Espinho
				do iconf 942 1 1 0 #Caudas de Yoyo
				do iconf 1026 1 1 0 #Avelãs

				@mapasDeUp = ("1;11;pay_fild01;payon", "12;25;pay_fild08;payon", "26;40;pay_dun00;payon", "41;45;pay_fild09;payon", "46;53;iz_dun00;izlude", "54;59;iz_dun02;izlude", "60;70;moc_fild17;morocc", "71;79;mjolnir_11;prontera", "80;98;gef_fild06;geffen")
			}
			case (=~ /cavaleiro/i) {
				do conf classe cavaleiro
				call definirVariaveisClasse1 "espadachim"	
				$skillsClasse1 = #TODO
				$skillsClasse2 = #TODO 
				$statsPadrao = #TODO
				$IDClasse1 = 1
				$IDClasse2 = 7,13
				#Itens da quest de classe
				#Possibilidade 1:
				do iconf 1040 5 1 0 #Bigode de Anão Ancião
				do iconf 7006 5 1 0 #Asa de Morcego Vermelha
				do iconf 931 5 1 0 #Amuleto dos Orcs
				do iconf 1057 5 1 0 #Pó de Traça
				do iconf 903 5 1 0 #Língua de Réptil
				do iconf 1028 5 1 0 #Crina
				#Possibilidade 2:
				do iconf 1042 5 1 0 #Pata de Inseto
				do iconf 950 5 1 0 #Coração de Sereia
				do iconf 1032 5 1 0 #Flor de Planta Carnívora
				do iconf 966 5 1 0 #Carne de Ostra
				do iconf 7031 5 1 0 #Frigideira Velha
				do iconf 946 5 1 0 #Casco de Caramujo
				@mapasDeUp = ("1;11;pay_fild01;payon", "12;25;pay_fild08;payon", "26;40;pay_dun00;payon", "41;45;pay_fild09;payon", "46;53;iz_dun00;izlude", "54;59;iz_dun02;izlude", "60;70;moc_fild17;morocc", "71;79;mjolnir_11;prontera", "80;98;gef_fild06;geffen")
			}
			case (=~ /ferreiro/i) {
				do conf classe ferreiro
				call definirVariaveisClasse1 "mercador"	
				$skillsClasse1 = #TODO
				$skillsClasse2 = #TODO 
				$statsPadrao = #TODO
				$IDClasse1 = 5
				$IDClasse2 = 10
				#Itens da quest de classe
				#Possibilidade 1:
				do iconf 998 8 1 0 #Ferros
				do iconf 511 20 1 0 #Ervas Verdes
				do iconf 919 2 1 0 #Couros de Animal
				do iconf 1122 1 1 0 #Sabre de Impacto

				#Possibilidade 2:
				do iconf 1002 8 1 0 #Minérios de Ferro
				do iconf 2212 1 1 0 #Tapa-Olho
				do iconf 717 2 1 0 #Gemas Azuis
				do iconf 1713 1 1 0 #Arbaleste

				#Possibilidade 3:
				do iconf 999 2 1 0 #Aços
				do iconf 930 1 1 0 #Bandagem Estragada
				do iconf 717 2 1 0 #Gemas Azuis
				do iconf 1610 1 1 0 #Cetro

				#Possibilidade 4:
				do iconf 1001 2 1 0 #Poeiras Estelares
				do iconf 932 1 1 0 #Osso
				do iconf 912 1 1 0 #Zargônio
				do iconf 1220 1 1 0 #Gladius

				#Possibilidade 5:
				do iconf 1003 2 1 0 #Carvões
				do iconf 961 2 1 0 #Conchas
				do iconf 990 2 1 0 #Sangues Escarlates
				do iconf 1119 1 1 0 #Tsurugi

				@mapasDeUp = ("1;11;pay_fild01;payon", "12;25;pay_fild08;payon", "26;40;pay_dun00;payon", "41;45;pay_fild09;payon", "46;53;iz_dun00;izlude", "54;59;iz_dun02;izlude", "60;70;moc_fild17;morocc", "71;79;mjolnir_11;prontera", "80;98;gef_fild06;geffen")
			}
			case (=~ /mercenario/i) {
				do conf classe mercenario
				call definirVariaveisClasse1 "gatuno"		
				$skillsClasse1 = TF_DOUBLE 10, TF_MISS 10, TF_STEAL 10, TF_HIDING 8, TF_POISON 10, TF_DETOXIFY 1
				$skillsClasse2 =  #TODO
				$statsPadrao = 10 dex, 15 agi, 20 dex, 25 agi, 20 str, 30 dex, 60 agi, 30 str, 40 dex, 20 vit, 80 agi, 25 luk ,60 dex, 50 str, 40 luk, 90 agi, 60 str, 29 vit
				$IDClasse1 = 6
				$IDClasse2 = 12

				#não é necessario items para a quest 2

				@mapasDeUp = ("1;11;pay_fild01;payon", "12;25;pay_fild08;payon", "26;40;pay_dun00;payon", "41;45;pay_fild09;payon", "46;53;iz_dun00;izlude", "54;59;iz_dun02;izlude", "60;70;moc_fild17;morocc", "71;79;mjolnir_11;prontera", "80;98;gef_fild06;geffen")
			}
			case (=~ /monge/i) {
				do conf classe monge	
				call definirVariaveisClasse1 "noviço"	
				$skillsClasse1 = #TODO
				$skillsClasse2 = #TODO 
				$statsPadrao = #TODO
				$IDClasse1 = 4
				$IDClasse2 = 15
				#Itens da quest de classe
				#Possibilidade 1:
				do iconf 7053 5 1 0 #Cyfar
				do iconf 508 10 1 0 #Erva Amarela
				do iconf 509 10 1 0 #Erva Branca

				#Possibilidade 2:
				do iconf 943 5 1 0 #Casca Rija
				do iconf 935 20 1 0 #Casca
				do iconf 912 5 1 0 #Zargônio

				#Possibilidade 3:
				do iconf 1027 5 1 0 #Espinho de Porco-Espinho
				do iconf 1042 10 1 0 #Pata de Inseto
				do iconf 1025 20 1 0 #Teia de Aranha

				#Possibilidade 4:
				do iconf 938 5 1 0 #Muco Pegajoso
				do iconf 1055 10 1 0 #Pele de Minhoca
				do iconf 511 20 1 0 #Erva Verde

				#Possibilidade 5:
				do iconf 913 10 1 0 #Dente de Morcego
				do iconf 948 5 1 0 #Pata de Urso
				do iconf 7033 20 1 0 #Esporo Venenoso

				#Possibilidade 6:
				do iconf 905 30 1 0 #Caule
				do iconf 909 5 1 0 #Jellopy
				do iconf 955 10 1 0 #Pele de Verme

				#Possibilidade 7:
				do iconf 942 20 1 0 #Cauda de Yoyo
				do iconf 1002 5 1 0 #Minério de Ferro
				do iconf 510 3 1 0 #Erva Azul

				@mapasDeUp = ("1;11;pay_fild01;payon", "12;25;pay_fild08;payon", "26;40;pay_dun00;payon", "41;45;pay_fild09;payon", "46;53;iz_dun00;izlude", "54;59;iz_dun02;izlude", "60;70;moc_fild17;morocc", "71;79;mjolnir_11;prontera", "80;98;gef_fild06;geffen")
			}
			case (=~ /odalisca/i) {
				do conf classe odalisca
				call definirVariaveisClasse1 "arqueiro"	
				$skillsClasse1 = #TODO
				$skillsClasse2 = #TODO 
				$statsPadrao = #TODO
				$IDClasse1 = 3
				$IDClasse2 = 20
				#Itens da quest de classe
				#Possibilidade 1
				do iconf 938 20 1 0 #Muco Pegajoso
				do iconf 501 5 1 0 #Poção Vermelha
				do iconf 909 3 1 0 #Jellopy
				do iconf 2403 1 1 0 #Sapatos [0]
				#Possibilidade 2
				do iconf 1055 5 1 0 #Pele de Minhoca
				do iconf 2405 1 1 0 #Botas [0]
				#Possibilidade 3
				do iconf 965 2 1 0 #Casco de Ostra
				do iconf 503 5 1 0 #Poção Amarela
				do iconf 909 20 1 0 #Jellopy
				do iconf 1020 10 1 0 #Cabelos Morenos
				do iconf 2401 1 1 0 #	Sandálias [0]
				@mapasDeUp = ("1;11;pay_fild01;payon", "12;25;pay_fild08;payon", "26;40;pay_dun00;payon", "41;45;pay_fild09;payon", "46;53;iz_dun00;izlude", "54;59;iz_dun02;izlude", "60;70;moc_fild17;morocc", "71;79;mjolnir_11;prontera", "80;98;gef_fild06;geffen")
			}
			case (=~ /s[áa]bio/i) {
				do conf classe sabio
				call definirVariaveisClasse1 "mago"	
				$IDClasse1 = 2
				$IDClasse2 = 16
				$statsPadrao = #TODO
				#Itens da quest de classe
				do iconf 916 1 1 0 #Plumas de Ave
				do iconf 919 1 1 0 #Couro de Animal
				do iconf 1019 1 1 0 #Tronco
				do iconf 1024 1 1 0 #Tinta de Polvo
				do iconf 713 1 1 0 #Garrafa Vazia 
				@mapasDeUp = ("1;11;pay_fild02;alberta", "12;25;pay_fild08;payon", "26;40;pay_dun00;payon", "41;45;moc_fild03;payon", "46;60;cmd_fild01;comodo", "61;70;moc_fild17;morocc", "71;79;yuno_fild09;aldebaran", "80;98;ein_fild09;einbroch")#minhas recomendaçoes de mapa/level,evitando bichos agressivos/detectores
			}
			case (=~ /sacerdote|sacer/i) {
				do conf classe sacerdote
				call definirVariaveisClasse1 "noviço"		
				$skillsClasse1 = #TODO
				$skillsClasse2 = #TODO 
				$statsPadrao = #TODO
				$IDClasse1 = 4
				$IDClasse2 = 8
				@mapasDeUp = ("1;11;pay_fild01;payon", "12;25;pay_fild08;payon", "26;40;pay_dun00;payon", "41;45;pay_fild09;payon", "46;53;iz_dun00;izlude", "54;59;iz_dun02;izlude", "60;70;moc_fild17;morocc", "71;79;mjolnir_11;prontera", "80;98;gef_fild06;geffen")
			}
			case (=~ /templ[áa]rio/i) {
				do conf classe templario
				call definirVariaveisClasse1 "espadachim"
				$skillsClasse1 = #TODO
				$skillsClasse2 = #TODO 
				$statsPadrao = #TODO
				$IDClasse1 = 1
				$IDClasse2 = 14,21
				#Itens da quest de classe
				do iconf 523 1 1 0 #Água Benta
				do iconf 1041 10 1 0 #Lampiões
				do iconf 930 10 1 0 #Bandagens Estragadas
				do iconf 2608 1 1 0 #Rosário 
				@mapasDeUp = ("1;11;pay_fild01;payon", "12;25;pay_fild08;payon", "26;40;pay_dun00;payon", "41;45;pay_fild09;payon", "46;53;iz_dun00;izlude", "54;59;iz_dun02;izlude", "60;70;moc_fild17;morocc", "71;79;mjolnir_11;prontera", "80;98;gef_fild06;geffen")
			}
			else {
				log ============================================
				log Erro ao tentar definir classe 2 desejada
				log Provavelmente há um erro de digitação
				log valor que foi passado : &config(classe)
				log Até ser corrigido a macro não irá prosseguir
				log ============================================
				do eval Misc::offlineMode();
				stop
			}
		}
	}
}

macro definirVariaveisClasse1 {
	# $.param[0] tem como valor a classe 1
	switch ($.param[0]) {
		case (=~ /espadachi[mn]/i) {
			$virarClasse1Mapa = izlude_in
			$virarClasse1CoodenadaNPC = 74 172
			$virarClasse1SequenciaDeConversa = r1 r0
			$virarClasse1PrecisaMover = nao
			$IDequipIniciante = 13415
		} 
		case (=~ /gatuno/i) {
			$virarClasse1Mapa = moc_prydb1
			$virarClasse1CoodenadaNPC = 42 133
			$virarClasse1PrecisaMover = sim
			$virarClasse1SequenciaDeConversa = r1 r1
			$IDequipIniciante = 13041
		} 
		case (=~ /mercador/i) {
			$virarClasse1Mapa = alberta_in
			$virarClasse1CoodenadaNPC = 53 43
			$virarClasse1PrecisaMover = nao
			#$virarClasse1SequenciaDeConversa = não tem sequencia, é só next next next
			$IDequipIniciante = 1381
		}
		case (=~ /mago/i) {
			$virarClasse1Mapa = geffen_in
			$virarClasse1CoodenadaNPC = 164 124
			$virarClasse1PrecisaMover = sim
			$virarClasse1SequenciaDeConversa = r0 r0
			$IDequipIniciante = 1639
		}
		case (=~ /novi[cç]o/i) {
			$virarClasse1Mapa = prt_church
			$virarClasse1CoodenadaNPC = 184 41
			$virarClasse1PrecisaMover = sim
			$virarClasse1SequenciaDeConversa = r0
			$IDequipIniciante = 1545
		}
		case (=~ /arqueiro/i) {
			$virarClasse1Mapa = payon_in02
			$virarClasse1CoodenadaNPC = 64 71
			$virarClasse1PrecisaMover = nao
			$virarClasse1SequenciaDeConversa = r0
			$IDequipIniciante = 1742
		}
		else {
			log ============================================
			log Erro ao tentar definir classe 1 desejada
			log Provavelmente há um erro de digitação
			log valor que foi passado : $.param[0]
			log Até ser corrigido a macro não irá prosseguir
			log ============================================
			do eval Misc::offlineMode();
			stop
		}
	}
	$classe1Desejada = $.param[0]
}

#Macro Generica para subir as skills e status dependendo das variaveis
#Essa macro mantem configurações feitas diretamente no config.txt
automacro configurarSkillsEStats{
	timeout 300 #vai rodar de 5 em 5 minutos
	BaseLevel > 0
	exclusive 1
	call{
		$idClasseAtual = pegarID()
		switch($idClasseAtual){
			case(== 0){ #Aprendiz
				if(&config(skillsAddAuto_list) != $skillsAprendiz) do conf skillsAddAuto_list $skillsAprendiz
				stop
			}
			case(= 1..7){ #Classes 1
				if(&config(skillsAddAuto_list) != $skillsClasse1) do conf skillsAddAuto_list $skillsClasse1
				stop
			}
			case(= 8..20){ #Classes 2
				if(&config(skillsAddAuto_list) =! $skillsClasse2) do conf skillsAddAuto_list $skillsClasse2
				stop
			}
		}
		do conf skillsAddAuto 1
		if(&config(statsAddAuto_list) != $statsPadrao) do conf statsAddAuto_list $statsPadrao
		do conf statsAddAuto 1
		do conf statsAddAuto_dontUseBonus 1
	}	

}

sub pegarID {
    return $char->{jobID};
}
