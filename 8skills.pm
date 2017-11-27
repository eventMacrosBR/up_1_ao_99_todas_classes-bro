automacro criandoblocos {
	ConfigKeyNotExist attackSkillSlot_3 #caso não tenha pelo menos 3 blocos criar até 3 blocos novos, somando quatro no total
	exclusive 1
	priority -2
	call {
		log criando blocos attackSkillSlot
		configurarSkills() #chamando o sub que coloca os blocos no config.txt
		pause 2
		do reload config
		if (&config(attackSkillSlot_2_sp) =~ /sp/) { #se for verdadeiro significa que o bloco existe
			log configurado com sucesso
		} else {
			erro ao configurar os blocos de skills
			contate os criadores dessa macro
		}
	}
}
	
automacro configurandoblocos {
	ConfigKeyNot classe none
	ConfigKeyNotExist attackskillSlot_3
	JobID $IDClasse1, $IDClasse2  #dessa forma isso não irá triggar enquanto ele for aprendiz
	BaseLevel < 99 #se ele chegar no lvl máximo não precisa mais disso né? :D
	run-once 1
	exclusive 1
	call {
		
		switch(&config(classe)) {
		
			case(=~ /templ[áa]rio/i ) {
				do conf attackSkillSlot_0 
				do conf attackSkillSlot_0_monsters 
				do conf attackSkillSlot_0_sp > 50
				do conf attackSkillSlot_0_WhenStatusInactive EFST_POSTDELAY
				
				do conf attackSkillSlot_1
				do conf attackSkillSlot_1_monsters 
				do conf attackSkillSlot_1_sp > 50
				do conf attackSkillSlot_1_WhenStatusInactive EFST_POSTDELAY
				
				do conf attackSkillSlot_2 
				do conf attackSkillSlot_2_monsters 
				do conf attackSkillSlot_2_sp > 50
				do conf attackSkillSlot_2_WhenStatusInactive EFST_POSTDELAY
			}
			case(=~ /cavaleiro/i ) {
				do conf attackSkillSlot_0 
				do conf attackSkillSlot_0_monsters 
				do conf attackSkillSlot_0_sp > 50
				do conf attackSkillSlot_0_WhenStatusInactive EFST_POSTDELAY
				
				do conf attackSkillSlot_1
				do conf attackSkillSlot_1_monsters 
				do conf attackSkillSlot_1_sp > 50
				do conf attackSkillSlot_1_WhenStatusInactive EFST_POSTDELAY
				
				do conf attackSkillSlot_2 
				do conf attackSkillSlot_2_monsters 
				do conf attackSkillSlot_2_sp > 50
				do conf attackSkillSlot_2_WhenStatusInactive EFST_POSTDELAY
			}
			case(=~ /sacerdote|sacer/i)
				do conf attackSkillSlot_0 
				do conf attackSkillSlot_0_monsters 
				do conf attackSkillSlot_0_sp > 50
				do conf attackSkillSlot_0_WhenStatusInactive EFST_POSTDELAY
				
				do conf attackSkillSlot_1
				do conf attackSkillSlot_1_monsters 
				do conf attackSkillSlot_1_sp > 50
				do conf attackSkillSlot_1_WhenStatusInactive EFST_POSTDELAY
				
				do conf attackSkillSlot_2 
				do conf attackSkillSlot_2_monsters 
				do conf attackSkillSlot_2_sp > 50
				do conf attackSkillSlot_2_WhenStatusInactive EFST_POSTDELAY
			}
			case(=~ /monge/i) {
				do conf attackSkillSlot_0 
				do conf attackSkillSlot_0_monsters 
				do conf attackSkillSlot_0_sp > 50
				do conf attackSkillSlot_0_WhenStatusInactive EFST_POSTDELAY
				
				do conf attackSkillSlot_1
				do conf attackSkillSlot_1_monsters 
				do conf attackSkillSlot_1_sp > 50
				do conf attackSkillSlot_1_WhenStatusInactive EFST_POSTDELAY
				
				do conf attackSkillSlot_2 
				do conf attackSkillSlot_2_monsters 
				do conf attackSkillSlot_2_sp > 50
				do conf attackSkillSlot_2_WhenStatusInactive EFST_POSTDELAY
			}		
			case(=~ /bruxo/) {
				#Mapas de base -> ein_fild09 | pay_fild02 | mjolnir_11 | mjolnir_01 | mjolnir_02 | cmd_fild01
				#Só Skills de Mago por enquanto
				do conf attackSkillSlot_0 Lanças de Fogo #Monstros de Terra/Sem dano elemental
				do conf attackSkillSlot_0_monsters Jiboía, Rabo de Verme, Caramelo, Pé Grande, Creamy, Percevejo, Poporing, Besouro-Chifre, Yoyo, Grove, Flora, Argiope, Argos, Porcellio, Metaling
				do conf attackSkillSlot_0_sp > 50
				do conf attackSkillSlot_0_WhenStatusInactive EFST_POSTDELAY
				
				do conf attackSkillSlot_1 Lanças de Gelo #Monstros de Fogo
				do conf attackSkillSlot_1_monsters Salgueiro Ancião 
				do conf attackSkillSlot_1_sp > 50
				do conf attackSkillSlot_1_WhenStatusInactive EFST_POSTDELAY
				
				do conf attackSkillSlot_2 Relampago #Monstros de Agua
				do conf attackSkillSlot_2_monsters Esporo 
				do conf attackSkillSlot_2_sp > 50
				do conf attackSkillSlot_2_WhenStatusInactive EFST_POSTDELAY
			}
			case(=~ /s[áa]bio/i) {
				#Mapas de base -> ein_fild09 | pay_fild02 | mjolnir_11 | mjolnir_01 | mjolnir_02 | cmd_fild01
				#Só Skills de Mago por enquanto
				do conf attackSkillSlot_0 Lanças de Fogo #Monstros de Terra/Sem dano elemental
				do conf attackSkillSlot_0_monsters Jiboía, Rabo de Verme, Caramelo, Pé Grande, Creamy, Percevejo, Poporing, Besouro-Chifre, Yoyo, Grove, Flora, Argiope, Argos, Porcellio, Metaling
				do conf attackSkillSlot_0_sp > 50
				do conf attackSkillSlot_0_WhenStatusInactive EFST_POSTDELAY
				
				do conf attackSkillSlot_1 Lanças de Gelo #Monstros de Fogo
				do conf attackSkillSlot_1_monsters Salgueiro Ancião 
				do conf attackSkillSlot_1_sp > 50
				do conf attackSkillSlot_1_WhenStatusInactive EFST_POSTDELAY
				
				do conf attackSkillSlot_2 Relampago #Monstros de Agua
				do conf attackSkillSlot_2_monsters Esporo 
				do conf attackSkillSlot_2_sp > 50
				do conf attackSkillSlot_2_WhenStatusInactive EFST_POSTDELAY
			}
			case(=~ /ca[cç]ador/i) {
				do conf attackSkillSlot_0 
				do conf attackSkillSlot_0_monsters 
				do conf attackSkillSlot_0_sp > 50
				do conf attackSkillSlot_0_WhenStatusInactive EFST_POSTDELAY
				
				do conf attackSkillSlot_1
				do conf attackSkillSlot_1_monsters 
				do conf attackSkillSlot_1_sp > 50
				do conf attackSkillSlot_1_WhenStatusInactive EFST_POSTDELAY
				
				do conf attackSkillSlot_2 
				do conf attackSkillSlot_2_monsters 
				do conf attackSkillSlot_2_sp > 50
				do conf attackSkillSlot_2_WhenStatusInactive EFST_POSTDELAY
			}
			case(=~ /bardo/i ) {
				do conf attackSkillSlot_0 
				do conf attackSkillSlot_0_monsters 
				do conf attackSkillSlot_0_sp > 50
				do conf attackSkillSlot_0_WhenStatusInactive EFST_POSTDELAY
				
				do conf attackSkillSlot_1 
				do conf attackSkillSlot_1_monsters 
				do conf attackSkillSlot_1_sp > 50
				do conf attackSkillSlot_1_WhenStatusInactive EFST_POSTDELAY
				
				do conf attackSkillSlot_2 
				do conf attackSkillSlot_2_monsters
				do conf attackSkillSlot_2_sp > 50
				do conf attackSkillSlot_2_WhenStatusInactive EFST_POSTDELAY
			}
			case(=~ /mercenario/i) {
				do conf attackSkillSlot_0 
				do conf attackSkillSlot_0_monsters 
				do conf attackSkillSlot_0_sp > 50
				do conf attackSkillSlot_0_WhenStatusInactive EFST_POSTDELAY
				
				do conf attackSkillSlot_1 
				do conf attackSkillSlot_1_monsters 
				do conf attackSkillSlot_1_sp > 50
				do conf attackSkillSlot_1_WhenStatusInactive EFST_POSTDELAY
				
				do conf attackSkillSlot_2 
				do conf attackSkillSlot_2_monsters 
				do conf attackSkillSlot_2_sp > 50
				do conf attackSkillSlot_2_WhenStatusInactive EFST_POSTDELAY
			}
			case(=~ /arruaceiro/i) {
				do conf attackSkillSlot_0 
				do conf attackSkillSlot_0_monsters 
				do conf attackSkillSlot_0_sp > 50
				do conf attackSkillSlot_0_WhenStatusInactive EFST_POSTDELAY
				
				do conf attackSkillSlot_1 
				do conf attackSkillSlot_1_monsters 
				do conf attackSkillSlot_1_sp > 50
				do conf attackSkillSlot_1_WhenStatusInactive EFST_POSTDELAY
				
				do conf attackSkillSlot_2 
				do conf attackSkillSlot_2_monsters 
				do conf attackSkillSlot_2_sp > 50
				do conf attackSkillSlot_2_WhenStatusInactive EFST_POSTDELAY
				}
			}
		}
	}
}	
		
	
##################################	
#SUB Criar Blocos attackSkillSlot#
##################################
sub cofigurarskills {
	open (my $fh, '>>:encoding(UTF-8)', Settings::getControlFilename('config.txt'));
	my $i = 0;
	while($i < 3 ){
		print $fh "attackSkillSlot {\n";
		print $fh "	monsters \n";  
		print $fh "	sp \n";
		print $fh "	whenStatusInactive \n";
		print $fh "}\n";
		$i++;
	}
	close ($fh);
}
