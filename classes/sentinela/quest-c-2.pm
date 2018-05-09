sub inicializarParametrosQuestClasse2 {
	my ($classe) = @_;
	my %items = (
	    #Possibilidade 1    
        920 => "5 1 0", #Garras de Lobo
        1019 => "5 1 0", #Troncos
        509 => "3 1 0", #Ervas Brancas
    
        #Possibilidade 2
        955 => "9 1 0", #Peles de Verme
        935 => "9 1 0", #Cascas
        508 => "9 1 0", #Ervas Amarelas
    
        #Possibilidade 3
        1021 => "3 1 0", #Chifres de Dokebi
        7032 => "3 1 0", #Pedaços de Casca de Ovo
        914 => "10 1 0", #Felpas
    
        #Possibilidade 4
        937 => "3 1 0", #Caninos Venenosos
        507 => "5 1 0", #Ervas Vermelhas
        919 => "3 1 0", #Couros de Animal
    
        #Possibilidade 5
        925 => "3 1 0", #Bicos de Ave
        932 => "5 1 0", #Ossos
        511 => "3 1 0", #Ervas Verdes
    
        #Possibilidade 6
        913 => "3 1 0", #Dentes de Morcego
        938 => "1 1 0", #Mucos Pegajosos
        948 => "1 1 0", #Patas de Urso
    
        #Possibilidade 7     
        1027 => "2 1 0", #Espinhos de Porco-Espinho
        942 => "1 1 0", #Caudas de Yoyo
        1026 => "1 1 0" #Avelãs
    );
	Commands::run("conf -f questc2_implementada true");
	foreach $key (keys %items) {
        if ($classe == 1) { 
            Commands::run("iconf $key $items{$key}") 
        } else {
            Commands::run("iconf $key 0 1 0")
        }
    }
}

#Primeiros esboços da quest
#NPC: Caçadora da Guilda
#Local: hu_in01 386 373
#r1 r1 r3 r3 r3 r2 r1 r2 r3 r2 r1 r2
# NPC: Recepcionista da Guilda
#Local: hu_in01 382 382
#r1
# Pediu itens (mas existem várias opções de conjuntos de itens:
#http://browiki.org/wiki/Mudan%C3%A7a_de_Classe:_Ca%C3%A7adores

#3 Caninos Venenosos
#5 Ervas Vermelhas
#3 Couros de Animal
# Entregar os itens para o Recepcionista da Guilda
#NPC: Recepcionista da Guilda
#Local: hu_in01 382 382
# Agora procurar o Mestre da Guilda. Ele fica no Palácio de Payon (payon_in02 21 31) ou na Guilda dos Arqueiros (payon_in03 131 7)
#ACHO QUE VOCÊ ENCONTRA ELE EM QUALQUER UM DOS DOIS QUE RESOLVER IR...
# NPC: Caçadora
#Local: payon_in03 131 7
#r4
# NPC: Sala de Espera
#Entrar no chat
#Local: job_hunte 176 38
#(Eles te dão umas flechas de prata, pode-se equipar porque são mortos-vivos no teste)
# Faz o teste do mapa. Matar só monstros de nome Monstro Alvo
#Clica no switch no centro.
#r1
#Vai até o portal na parte norte e sai do teste.
# http://browiki.org/images/b/b7/Que_hunt05.png
# Retorna à Caçadora
#NPC: Caçadora
#Local: payon_in03 131 7
#(Sem respostas certas aqui, só confirmar 2 ou 3x
#Ela te entrega um Colar da Sabedoria)
# Voltar à Guilda dos Caçadores em Hugel (hu_in01 386 373)
#(Sem respostas certas aqui, só confirmar 2 ou 3x)
#Fim da Quest

automacro VirarCacador_SalvarEmHugel {
    JobID $parametrosClasses{idC1}
    JobLevel = 50
    ConfigKeyNot saveMap hugel
    ConfigKeyNot In_saveMap_sequence true
    ConfigKeyNot quest_eden em_curso
    ConfigKeyNot quest_eden terminando
    ConfigKey aeroplano1 none
    ConfigKey aeroplano2 none
    NotInMap hugel
    QuestInactive 4000
    QuestInactive 4001
    QuestInactive 4002
    QuestInactive 4003
    QuestInactive 4004
    QuestInactive 4005
    QuestInactive 4006
    QuestInactive 4007
    QuestInactive 4008
    QuestInactive 4009
    QuestInactive 4010
    QuestInactive 4011
    QuestInactive 4012
    QuestInactive 4013
    exclusive 1
    call junopra "hugel"
}

automacro VirarCAcador_IrNoNpc {
    JobID $parametrosClasses{idC1}
    JobLevel = 50
    FreeSkillPoints = 0
    ConfigKeyNot In_saveMap_sequence true
    NpcNotNear /caçadora da guilda/i
    ConfigKey saveMap hugel
    InMap hugel, hu_in01
    QuestInactive 4000
    QuestInactive 4001
    QuestInactive 4002
    QuestInactive 4003
    QuestInactive 4004
    QuestInactive 4005
    QuestInactive 4006
    QuestInactive 4007
    QuestInactive 4008
    QuestInactive 4009
    QuestInactive 4010
    QuestInactive 4011
    QuestInactive 4012
    QuestInactive 4013
    priority 2
    exclusive 1
    call {
        call pararDeAtacar
        do conf lockMap none
        do move hu_in01 386 373 &rand(2,4)
    }
}

#4000#Mudança de Classe: Caçador#SG_FEEL#QUE_NOIMAGE#
#Você precisa passar pelo teste de Dejiko para avançar. #
##
automacro VirarCacador_FalarDejiko {
    JobID $parametrosClasses{idC1}
    JobLevel = 50
    NpcNear /caçadora da guilda/i
    InMap hu_in01
    QuestInactive 4000
    QuestInactive 4001
    QuestInactive 4002
    QuestInactive 4003
    QuestInactive 4004
    QuestInactive 4005
    QuestInactive 4006
    QuestInactive 4007
    QuestInactive 4008
    QuestInactive 4009
    QuestInactive 4010
    QuestInactive 4011
    QuestInactive 4012
    QuestInactive 4013
    exclusive 1
    call {
        do talknpc 386 373 r1 r1 r3 r3 r3 r2 r1 r2 r3 r2 r1 r2  #Dejiko
    }
}

automacro VirarCacador_FalarComRecepcionista_longeDela {
    NpcNotNear /recepcionista da guilda/i
    exclusive 1
    QuestActive 4001
    InMap hugel,hu_in01
    call {
        do move hu_in01 382 382 &rand(2,4)
    }
}

#4001#Mudança de Classe: Caçador#SG_FEEL#QUE_NOIMAGE#
#Fale com a Caçadora da Guilda para continuar o teste. #
##
automacro VirarCacador_FalarComRecepcionista {
    InMap hu_in01
    QuestActive 4001
    exclusive 1
    NpcNear /recepcionista da guilda/i
    call {
        do talknpc 382 382 r1 #Recepcionista
    }
}

automacro voltandoPraPronteraEArredores {
    InMap hugel,hu_in01
    QuestActive 4002,4003,4004,4005,4006,4007,4008
    exclusive 1
    ConfigKey aeroplano1 none
    ConfigKey aeroplano2 none
    call {

    }
}

#4002#Mudança de Classe: Caçador#SG_FEEL#QUE_NOIMAGE#
#Colete os itens que o Caçador de Demônios pedir. - 5 Garras do Lobo, 5 Troncos e 3 Ervas Brancas #
##
automacro coletarItens_Possibilidade1 {
    QuestActive 4002
    exclusive 1
    timeout 120
    ConfigKeyNot passo_quest_cacador indo entregar itens
    call {
        $qtdItem1 = &invamount(Garras de Lobo)
        $qtdItem2 = &invamount(Troncos)
        $qtdItem3 = &invamount(Ervas Brancas)

        if ( $qtdItem1 < 5 ) {
            do conf lockMap moc_fild11
            #esses dois o bot não pode e nem precisa atacar
            do mconf Condor 0
            do mconf Escorpião 0
        } elsif ( $qtdItem1 >= 5 && $qtdItem2 < 5 ) {
            do conf lockMap pay_fild10
            #esses dois o bot não pode e nem precisa atacar
            do mconf Selvagem 0
            do mconf 1494 0 #besouro que não sei o nome exato
        } elsif ( $qtdItem1 >= 5 && $qtdItem2 >= 5 && $qtdItem3 < 3) {
            do conf lockMap beach_dun3
            #esses tres o bot não pode e nem precisa atacar
            do mconf Hidra 0
            do mconf Megalodon 0
            do mconf Nereida 0 -8
        } elsif ( $qtdItem1 >= 5 && $qtdItem2 >= 5 && $qtdItem3 >= 3) {
            [
            log ================================
            log Coletei todos os itens, indo Entregar!
            log ================================
            ]
            
            do mconf Condor 1
            do mconf Escorpião 1
            do mconf Selvagem 1
            do mconf 1494 1 #besouro que não sei o nome exato
            do mconf Hidra 1
            do mconf Megalodon 1
            do mconf Nereida 1
            do conf -f passo_quest_cacador indo entregar itens
        } else {
            [
            log ====================================================
            log Deveria estar coletando 5 Garras do Lobo, 5 Troncos e 3 Ervas Brancas agora
            log Mas algo deu errado... reporte aos criadores dessa eventMacro
            log ====================================================
            ]
        }
    }
}

#4003#Mudança de Classe: Caçador#SG_FEEL#QUE_NOIMAGE#
#Colete os itens que o Caçador de Demônios pedir. - 3 Bicos de Ave, 5 Ossos e 3 Ervas Verdes #
##
automacro coletarItens_Possibilidade2 {
    QuestActive 4003
    exclusive 1
    timeout 120
    ConfigKeyNot passo_quest_cacador indo entregar itens
    call {
        $qtdItem1 = &invamount(Bico de Ave)
        $qtdItem2 = &invamount(Osso)
        $qtdItem3 = &invamount(Erva Verde)

        if ( $qtdItem1 < 3 ) {
            do conf lockMap moc_fild01
        } elsif ( $qtdItem1 >= 3 && $qtdItem2 < 5 ) {
            do conf lockMap pay_dun01
        } elsif ( $qtdItem1 >= 3 && $qtdItem2 >= 5 && $qtdItem3 < 3) {
            do conf lockMap prt_fild08
        } elsif ( $qtdItem1 >= 3 && $qtdItem2 >= 5 && $qtdItem3 >= 3) {
            [
            log ================================
            log Coletei todos os itens, indo Entregar!
            log ================================
            ]
            do conf -f passo_quest_cacador indo entregar itens
        } else {
            [
            log ====================================================
            log Deveria estar coletando 3 Bicos de Ave, 5 Ossos e 3 Ervas Verdes agora
            log Mas algo deu errado... reporte aos criadores dessa eventMacro
            log ====================================================
            ]
        }
    }
}

#4004#Mudança de Classe: Caçador#SG_FEEL#QUE_NOIMAGE#
#Colete os itens que o Caçador de Demônios pedir. - 3 Caninos Venenosos, 3 Couros de Animal e 5 Ervas Vermelhas #
##
automacro coletarItens_Possibilidade3 {
    QuestActive 4004
    exclusive 1
    timeout 120
    ConfigKeyNot passo_quest_cacador indo entregar itens
    call {
        $qtdItem1 = &invamount(Canino Venenoso)
        $qtdItem2 = &invamount(Erva Vermelha)
        $qtdItem3 = &invamount(Couro de Animal)

        if ( $qtdItem1 < 3 ) {
            do conf lockMap pay_fild08
        } elsif ( $qtdItem1 >= 3 && $qtdItem2 < 5 ) {
            do conf lockMap mjolnir_09
        } elsif ( $qtdItem1 >= 3 && $qtdItem2 >= 5 && $qtdItem3 < 3) {
            do conf lockMap pay_fild08
        } elsif ( $qtdItem1 >= 3 && $qtdItem2 >= 5 && $qtdItem3 >= 3) {
            [
            log ================================
            log Coletei todos os itens, indo Entregar!
            log ================================
            ]
            do conf -f passo_quest_cacador indo entregar itens
        } else {
            [
            log ====================================================
            log Deveria estar coletando 3 Caninos Venenosos, 3 Couros de Animal e 5 Ervas Vermelhas agora
            log Mas algo deu errado... reporte aos criadores dessa eventMacro
            log ====================================================
            ]
        }
    }
}

#4005#Mudança de Classe: Caçador#SG_FEEL#QUE_NOIMAGE#
#Colete os itens que o Caçador de Demônios pedir. - 3 Chifres de Dokebi, 3 Pedaços de Casca de Ovo e 10 Felpas #
##
automacro coletarItens_Possibilidade4 {
    QuestActive 4005
    exclusive 1
    timeout 120
    ConfigKeyNot passo_quest_cacador indo entregar itens
    call {
        $qtdItem1 = &invamount(Chifre de Dokebi)
        $qtdItem2 = &invamount(Pedaço de Casca de Ovo)
        $qtdItem3 = &invamount(Felpa)

        if ( $qtdItem1 < 3 ) {
            #VAI TER QUE COMPRAR O CHIFRE USANDO O BETTERSHOPPER
            #PIOR QUE ISSO VAIDAR TRABALHO HAHAHA
            #MAS VOU COLOCAR O MAPA PRA TENTAR DROPAR E FODAS
            #QUEM SABE UM DIA EU FAÇA
            do conf lockMap pay_dun04
        } elsif ( $qtdItem1 >= 3 && $qtdItem2 < 3 ) {
            do conf lockMap pay_dun01
        } elsif ( $qtdItem1 >= 3 && $qtdItem2 >= 3 && $qtdItem3 < 10) {
            do conf lockMap prt_fild08
        } elsif ( $qtdItem1 >= 3 && $qtdItem2 >= 3 && $qtdItem3 >= 10) {
            [
            log ================================
            log Coletei todos os itens, indo Entregar!
            log ================================
            ]
            do conf -f passo_quest_cacador indo entregar itens
        } else {
            [
            log ====================================================
            log Deveria estar coletando 3 Chifres de Dokebi, 3 Pedaços de Casca de Ovo e 10 Felpas agora
            log Mas algo deu errado... reporte aos criadores dessa eventMacro
            log ====================================================
            ]
        }
    }
}

#4006#Mudança de Classe: Caçador#SG_FEEL#QUE_NOIMAGE#
#Colete os itens que o Caçador de Demônios pedir. - 9 Cascas, 9 Peles de Verme e 9 Ervas Amarelas. #
##
automacro coletarItens_Possibilidade5 {
    QuestActive 4006
    exclusive 1
    timeout 120
    ConfigKeyNot passo_quest_cacador indo entregar itens
    call {
        $qtdItem2 = &invamount(Casca)
        $qtdItem1 = &invamount(Pele de Verme)
        $qtdItem3 = &invamount(Erva Amarela)

        if ( $qtdItem1 < 9 ) {
            do conf lockMap gef_fild00
        } elsif ( $qtdItem1 >= 9 && $qtdItem2 < 9 ) {
            do conf lockMap anthell02
        } elsif ( $qtdItem1 >= 9 && $qtdItem2 >= 9 && $qtdItem3 < 9) {
            do conf lockMap prt_fild03
        } elsif ( $qtdItem1 >= 9 && $qtdItem2 >= 9 && $qtdItem3 >= 9) {
            [
            log ================================
            log Coletei todos os itens, indo Entregar!
            log ================================
            ]
            do conf -f passo_quest_cacador indo entregar itens
        } else {
            [
            log ====================================================
            log Deveria estar coletando 9 Cascas, 9 Peles de Verme e 9 Ervas Amarelas agora
            log Mas algo deu errado... reporte aos criadores dessa eventMacro
            log ====================================================
            ]
        }
    }
}

#4007#Mudança de Classe: Caçador#SG_FEEL#QUE_NOIMAGE#
#Colete os itens que o Caçador de Demônios pedir. - 3 Dentes de Morcego, 1 Muco Pegajoso, 1 Pata de Urso #
##
automacro coletarItens_Possibilidade6 {
    QuestActive 4007
    exclusive 1
    timeout 60
    ConfigKeyNot passo_quest_cacador indo entregar itens
    call {
        $qtdItem1 = &invamount(Dente de Morcego)
        $qtdItem2 = &invamount(Muco Pegajoso)
        $qtdItem3 = &invamount(Pata de Urso)

        if ( $qtdItem1 < 3 ) {
            do mconf Piere 0
            do mconf Deniro 0
            do mconf Andre 0
            do mconf Vitata 0
            do mconf Gierath 0
            do conf lockMap anthell01
        } elsif ( $qtdItem1 >= 3 && $qtdItem2 < 1 ) {
            do conf lockMap pay_dun00
        } elsif ( $qtdItem1 >= 3 && $qtdItem2 >= 1 && $qtdItem3 < 1) {
            do conf lockMap pay_fild07
        } elsif ( $qtdItem1 >= 3 && $qtdItem2 >= 1 && $qtdItem3 >= 1) {
            [
            log ================================
            log Coletei todos os itens, indo Entregar!
            log ================================
            ]
            
            do mconf Piere 1
            do mconf Deniro 1
            do mconf Andre 1
            do mconf Vitata 1
            do mconf Gierath 1
            
            do conf -f passo_quest_cacador indo entregar itens
        } else {
            [
            log ====================================================
            log Deveria estar coletando 3 Dentes de Morcego, 1 Muco Pegajoso, 1 Pata de Urso agora
            log Mas algo deu errado... reporte aos criadores dessa eventMacro
            log ====================================================
            ]
        }
    }
}

#4008#Mudança de Classe: Caçador#SG_FEEL#QUE_NOIMAGE#
#Colete os itens que o Caçador de Demônios pedir. - 2 Espinhos de Porco-Espinho,  1 Avelã e 1 Cauda de Yoyo #
#
automacro coletarItens_Possibilidade7 {
    QuestActive 4008
    exclusive 1
    timeout 120
    ConfigKeyNot passo_quest_cacador indo entregar itens
    call {
        $qtdItem1 = &invamount(Espinho de Porco-Espinho)
        $qtdItem2 = &invamount(Avelã)
        $qtdItem3 = &invamount(Cauda de Yoyo)

        if ( $qtdItem1 < 2 ) {
            do conf lockMap mjolnir_01
        } elsif ( $qtdItem1 >= 2 && $qtdItem2 < 1 ) {
            do mconf Salgueiro Ancião 0
            do conf lockMap pay_fild09
        } elsif ( $qtdItem1 >= 2 && $qtdItem2 >= 1 && $qtdItem3 < 1) {
            do conf lockMap prt_fild03
        } elsif ( $qtdItem1 >= 2 && $qtdItem2 >= 1 && $qtdItem3 >= 1) {
            [
            log ================================
            log Coletei todos os itens, indo Entregar!
            log ================================
            ]
            
            do mconf Salgueiro Ancião 1
            
            do conf -f passo_quest_cacador indo entregar itens
        } else {
            [
            log ====================================================
            log Deveria estar coletando 2 Espinhos de Porco-Espinho,  1 Avelã e 1 Cauda de Yoyo agora
            log Mas algo deu errado... reporte aos criadores dessa eventMacro
            log ====================================================
            ]
        }
    }
}

#4002#Mudança de Classe: Caçador#SG_FEEL#QUE_NOIMAGE#
#Colete os itens que o Caçador de Demônios pedir. - 5 Garras do Lobo, 5 Troncos e 3 Ervas Brancas #
##
#4003#Mudança de Classe: Caçador#SG_FEEL#QUE_NOIMAGE#
#Colete os itens que o Caçador de Demônios pedir. - 3 Bicos de Ave, 5 Ossos e 3 Ervas Verdes #
##
#4004#Mudança de Classe: Caçador#SG_FEEL#QUE_NOIMAGE#
#Colete os itens que o Caçador de Demônios pedir. - 3 Caninos Venenosos, 3 Couros de Animal e 5 Ervas Vermelhas #
##
#4005#Mudança de Classe: Caçador#SG_FEEL#QUE_NOIMAGE#
#Colete os itens que o Caçador de Demônios pedir. - 3 Chifres de Dokebi, 3 Pedaços de Casca de Ovo e 10 Felpas #
##
#4006#Mudança de Classe: Caçador#SG_FEEL#QUE_NOIMAGE#
#Colete os itens que o Caçador de Demônios pedir. - 9 Cascas, 9 Peles de Verme e 9 Ervas Amarelas. #
##
#4007#Mudança de Classe: Caçador#SG_FEEL#QUE_NOIMAGE#
#Colete os itens que o Caçador de Demônios pedir. - 3 Dentes de Morcego, 1 Muco Pegajoso, 1 Pata de Urso #
##
#4008#Mudança de Classe: Caçador#SG_FEEL#QUE_NOIMAGE#
#Colete os itens que o Caçador de Demônios pedir. - 2 Espinhos de Porco-Espinho,  1 Avelã e 1 Cauda de Yoyo #
#
automacro entregarItens_todasAsPossibilidades {
    QuestActive 4002, 4003, 4004, 4005, 4006, 4007, 4008
    ConfigKey passo_quest_cacador indo entregar itens
    exclusive 1
    call {
        [
            log "Entregar"
        ]
    }
}

#4009#Mudança de Classe: Caçador#SG_FEEL#QUE_NOIMAGE#
#Vá falar com o Líder da Guilda, que está no Palácio Central de Payon. #
#
automacro questCacador_irAteOPalacioDePayon {
    QuestActive 4009
    exclusive 1
    call {
        log Não implementado ainda!
    }
}

#4010#Mudança de Classe: Caçador#SG_FEEL#QUE_NOIMAGE#
#Vá falar com o Líder da Guilda, que está na Guilda dos Arqueiros. #
#
automacro questCacador_irAteAGuildaDosArqueiros {
    QuestActive 4010
    exclusive 1
    call {
        log Não implementado ainda!
    }
}

#4011#Mudança de Classe: Caçador#SG_FEEL#QUE_NOIMAGE#
#Mate todos os ^ff0000monstros de mudança de classe^000000, e o interruptor vai aparecer. Destrua o interruptor e fuja pela saída ao norte. #
#
automacro questCacador_labirinto {
    InMap job_hunte
    call {
        #TODO por ai Manual e configurar monstros que são os alvos
        do conf route_randomWalk 0
        call pararDeAtacar

        do move 72 76 #-> ataque Monstro Alvo
        do move 107 76 #-> ataque Monstro Alvo 
        do move 117 76 #-> ataque Monstro Alvo
        do north 
	    do north 
	    do north 
	    do north 
	    do north 
	    do north 
	    do north 
	    do north 
	    do north 
	    do north 
	    do north 
        do move 94 131 #-> ataque Monstro Alvo
        do move 110 131
        do south 
	    do south 
	    do south 
	    do south 
	    do south 
	    #fica em 110 106
        do west
	    do west

        do talk &npc(/switch.nht/)

        do east
	    do east
	
        do north
	    do north
	    do north
	    do north
	    do north
	
        do move 89 131
	
	    do north
	    do north
    }
}

#4011#Mudança de Classe: Caçador#SG_FEEL#QUE_NOIMAGE#
#Mate todos os ^ff0000monstros de mudança de classe^000000, e o interruptor vai aparecer. Destrua o interruptor e fuja pela saída ao norte. #
#
automacro questCacador_labirinto {
    InMap job_hunte
    MobNear /Monstro Alvo/
    call {
        do a &monster(/Monstro Alvo/)
    }
}

#4012#Mudança de Classe: Caçador#SG_FEEL#QUE_NOIMAGE#
#Relate ao Senhor da Guilda dos Caçadores que passou no exame. #
##

#4013#Mudança de Classe: Caçador#SG_FEEL#QUE_NOIMAGE#
#Volte à Guilda dos Caçadores para relatar que passou no exame. #
#Penetração #

