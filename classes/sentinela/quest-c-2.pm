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


automacro questCacador_salvarEmHugel {
    JobID $parametrosClasses{idC1}, $parametrosClasses{idBC1}
    JobLevel = 50
    ConfigKeyNot saveMap hugel
    ConfigKeyNot naSequenciaDeSalvamento true
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
    call aeroplano_junoPara "hugel"
}

automacro questCacador_irAteACacadoraDaGuild {
    JobID $parametrosClasses{idC1}, $parametrosClasses{idBC1}
    JobLevel = 50
    FreeSkillPoints = 0
    ConfigKeyNot naSequenciaDeSalvamento true
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
automacro questCacador_falarDejiko {
    JobID $parametrosClasses{idC1}, $parametrosClasses{idBC1}
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
        do talknpc 386 373 r0 r0 r2 r2 r2 r1 r0 r1 r2 r1 r0 r1  #Dejiko
    }
}

automacro questCacador_irAteARecepcionista {
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
automacro questCacador_falarComRecepcionista {
    InMap hu_in01
    QuestActive 4001
    exclusive 1
    NpcNear /recepcionista da guilda/i
    call {
        do talknpc 382 382 r0 #Recepcionista
	do conf -f passo_quest_cacador coletar itens
    }
}

automacro questCacador_voltandoPraPronteraEArredores {
    InMap hugel,hu_in01
    QuestActive 4002,4003,4004,4005,4006,4007,4008
    exclusive 1
    ConfigKey aeroplano1 none
    ConfigKey aeroplano2 none
    ConfigKey passo_quest_cacador coletar itens
    call {
	call aeroplano_hugelPara "izlude"
    }
}

#4002#Mudança de Classe: Caçador#SG_FEEL#QUE_NOIMAGE#
#Colete os itens que o Caçador de Demônios pedir. - 5 Garras do Lobo, 5 Troncos e 3 Ervas Brancas #
##
automacro questCacador_coletarItens_possibilidade1 {
    QuestActive 4002
    exclusive 1
    timeout 120
    ConfigKeyNot passo_quest_cacador indo entregar itens
    call {
        $qtdItem1 = &invamount(Garras de Lobo)
        $qtdItem2 = &invamount(Troncos)
        $qtdItem3 = &invamount(Ervas Brancas)

        call voltarAtacar

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
automacro questCacador_coletarItens_possibilidade2 {
    QuestActive 4003
    exclusive 1
    timeout 120
    ConfigKeyNot passo_quest_cacador indo entregar itens
    call {
        $qtdItem1 = &invamount(Bico de Ave)
        $qtdItem2 = &invamount(Osso)
        $qtdItem3 = &invamount(Erva Verde)

        call voltarAtacar

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
automacro questCacador_coletarItens_possibilidade3 {
    QuestActive 4004
    exclusive 1
    timeout 120
    ConfigKeyNot passo_quest_cacador indo entregar itens
    call {
        $qtdItem1 = &invamount(Canino Venenoso)
        $qtdItem2 = &invamount(Erva Vermelha)
        $qtdItem3 = &invamount(Couro de Animal)

        call voltarAtacar

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
automacro questCacador_coletarItens_possibilidade4 {
    QuestActive 4005
    exclusive 1
    timeout 120
    ConfigKeyNot passo_quest_cacador indo entregar itens
    call {
        $qtdItem1 = &invamount(Chifre de Dokebi)
        $qtdItem2 = &invamount(Pedaço de Casca de Ovo)
        $qtdItem3 = &invamount(Felpa)

        call voltarAtacar

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
automacro questCacador_coletarItens_possibilidade5 {
    QuestActive 4006
    exclusive 1
    timeout 120
    ConfigKeyNot passo_quest_cacador indo entregar itens
    call {
        $qtdItem2 = &invamount(Casca)
        $qtdItem1 = &invamount(Pele de Verme)
        $qtdItem3 = &invamount(Erva Amarela)

        call voltarAtacar

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
automacro questCacador_coletarItens_possibilidade6 {
    QuestActive 4007
    exclusive 1
    timeout 60
    ConfigKeyNot passo_quest_cacador indo entregar itens
    call {
        $qtdItem1 = &invamount(Dente de Morcego)
        $qtdItem2 = &invamount(Muco Pegajoso)
        $qtdItem3 = &invamount(Pata de Urso)

        call voltarAtacar

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
automacro questCacador_coletarItens_possibilidade7 {
    QuestActive 4008
    exclusive 1
    timeout 120
    ConfigKeyNot passo_quest_cacador indo entregar itens
    call {
        $qtdItem1 = &invamount(Espinho de Porco-Espinho)
        $qtdItem2 = &invamount(Avelã)
        $qtdItem3 = &invamount(Cauda de Yoyo)

        call voltarAtacar

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
automacro questCacador_entregarItensEmHugel {
    QuestActive 4002, 4003, 4004, 4005, 4006, 4007, 4008
    ConfigKey passo_quest_cacador indo entregar itens
    NotInMap hugel
    NotInMap hu_in01
    ConfigKey aeroplano1 none
    ConfigKey aeroplano2 none
    exclusive 1
    call {
        call pararDeAtacar
	do conf lockMap none 
        call aeroplano_junoPara "hugel"

    }
}

automacro questCacador_entregarItens_todasAsPossibilidades {
    QuestActive 4002, 4003, 4004, 4005, 4006, 4007, 4008
    ConfigKey passo_quest_cacador indo entregar itens
    InMap hugel, hu_in01
    exclusive 1
    call {
        do move hu_in01 382 382 &rand(2,4)
        do talknpc 382 382 #Recepcionista
    }
}

#4009#Mudança de Classe: Caçador#SG_FEEL#QUE_NOIMAGE#
#Vá falar com o Líder da Guilda, que está no Palácio Central de Payon. #
#
#4010#Mudança de Classe: Caçador#SG_FEEL#QUE_NOIMAGE#
#Vá falar com o Líder da Guilda, que está na Guilda dos Arqueiros. #
#
automacro questCacador_falarComACacadoraDaGuildIrIzlude {
    QuestActive 4009, 4010
    InMap hugel, hu_in01
    exclusive 1
    call {
	 call aeroplano_hugelPara "izlude"
    }
}

automacro questCacador_falarComACacadoraDaGuildIrPayon {
    QuestActive 4009, 4010
    InMap izlude
    exclusive 1
    call {
	 call salvarNaCidade "payon"
    }
}



#4009#Mudança de Classe: Caçador#SG_FEEL#QUE_NOIMAGE#
#Vá falar com o Líder da Guilda, que está no Palácio Central de Payon. #
#
automacro questCacador_irAteOPalacioDePayonEntrar {
    QuestActive 4009
    exclusive 1
    InMap payon
    call {
        do conf -f quest_cacador_lider palacio_payon
        do move payon 188 233
    }
}

automacro questCacador_irAteOPalacioDePayon {
    QuestActive 4009
    exclusive 1
    InMap payon_in03
    call {
	do move payon_in03 158 33
        do move payon_in03 131 7 &rand(2,4)
	do talknpc 131 7 r3 
    }
}


#4010#Mudança de Classe: Caçador#SG_FEEL#QUE_NOIMAGE#
#Vá falar com o Líder da Guilda, que está na Guilda dos Arqueiros. #
#
automacro questCacador_irAteAGuildaDosArqueiros {
    QuestActive 4010
    exclusive 1
    InMap payon, pay_arche, payon_in02
    call {
        do conf -f quest_cacador_lider guilda_arqueiros
        do move payon_in02 21 31 &rand(2,4)
	do talknpc 21 31 r3
    }
}

automacro questCacador_labirintoMoverPraPertoDoChat {
    QuestActive 4011
    InChatRoom 0
    IsInCoordinate 164..187 18..41
    exclusive 1
    InMap job_hunte
    call {
        do move &rand(174,177) &rand(34,31)
        do talk resp 0
        do chat join 0
    }
}

automacro questCacador_labirintoChatPerto {
    QuestActive 4011
    InChatRoom 0
    ChatRoomNear /Espera|Waiting/i
    IsInCoordinate 164..187 18..41
    exclusive 1
    InMap job_hunte
    priority -1
    call {
        do chat join 0
    }
}

automacro questCacador_DentroDoChat {
    exclusive 1
    InChatRoom 1
    QuestActive 4011
    InMap job_hunte
    timeout 40
    call {
        [
        log ===================================
        log = Estou dentro do chat
        log = agora é só esperar minha vez
        log ===================================
        ]
    }
}

#4011#Mudança de Classe: Caçador#SG_FEEL#QUE_NOIMAGE#
#Mate todos os ^ff0000monstros de mudança de classe^000000, e o interruptor vai aparecer. Destrua o interruptor e fuja pela saída ao norte. #
#
automacro questCacador_labirinto {
    QuestActive 4011
    InChatRoom 0
    IsInCoordinate 87..92 65..70
    exclusive 1
    InMap job_hunte
    call {
        if (&config(route_avoidWalls) != 0) do conf route_avoidWalls 0
        if (&config(lockMap) != none) do conf lockMap none
        call pararDeAtacarApenasCorrer

        do move 72 76
        $contador = 0
        do ml #comando pra listar os monstros na tela
        while (&monster(Monstro Alvo) = -1 && $contador < 4) {
            log = procurando monstro alvo...
            $contador++
        }
        if (&monster(Monstro Alvo) != -1) {
            do a &monster(Monstro Alvo)
        } else {
            [
            log ===================================
            log = o Monstro Alvo não está por perto...
            log = pelo menos é o que a eventMacro diz.
            log = agora ela vai pular pra próxima linha
            log = sem matar o monstro ...
            log ===================================
            ]
        }
        do ml #comando pra listar os monstros na tela
        do move 117 76
        #do west 10 # 80 83
        #do west 10 # 70 73
        if (&arg("$.pos", 1) = 164..187 && &arg("$.pos", 2) = 18..41) {
            [
            log ===================================
            log = errei novamente....
            log ===================================
            ]
            stop
        }
        $contador = 0
        while (&monster(Monstro Alvo) == -1 && $contador < 4) {
            log = procurando monstro alvo...
            $contador++
        }
        if (&monster(Monstro Alvo) != -1) {
            do a &monster(Monstro Alvo)
        } else {
            [
            log ===================================
            log = o monstro Monstro Alvo não está por perto...
            log = pelo menos é o que a eventMacro diz.
            log = agora ela vai pular pra próxima linha
            log = sem matar o monstro ...
            log ===================================
            ]
        }
        do ml
        do move 117 76 #movendo pro mesmo lugar, mas para matar outro monstro
        
         if (&arg("$.pos", 1) = 164..187 && &arg("$.pos", 2) = 18..41) {
            [
            log ===================================
            log = errei novamente....
            log ===================================
            ]
            stop
        }
        $contador = 0
        while (&monster(Monstro Alvo) == -1 && $contador < 4) {
            log = procurando monstro alvo...
            $contador++
        }
        if (&monster(Monstro Alvo) != -1) {
            do a &monster(Monstro Alvo)
        } else {
            [
            log ===================================
            log = o monstro Monstro Alvo não está por perto...
            log = pelo menos é o que a eventMacro diz.
            log = agora ela vai pular pra próxima linha
            log = sem matar o monstro ...
            log ===================================
            ]
        }
        do ml
        do north 55
        do move 94 131
         if (&arg("$.pos", 1) = 164..187 && &arg("$.pos", 2) = 18..41) {
            [
            log ===================================
            log = errei novamente....
            log ===================================
            ]
            stop
        }
        $contador = 0
        while (&monster(Monstro Alvo) == -1 && $contador < 4) {
            log = procurando monstro alvo...
            $contador++
        }
        if (&monster(Monstro Alvo) != -1) {
            do a &monster(Monstro Alvo)
        } else {
            [
            log ===================================
            log = o monstro Monstro Alvo não está por perto...
            log = pelo menos é o que a eventMacro diz.
            log = agora ela vai pular pra próxima linha
            log = sem matar o monstro ...
            log ===================================
            ]
        }
        do ml
        
        [
        log ===================================
        log = teoricamente já matamos todos so monstros
        log = pelos menos eles tem que estar mortos agora
        log ===================================
        ]
        do move 110 131
        do south 25 
        do west 10
        do talk &npc(/switch/i)
        do talk resp 0
        do east 10 
        do north 25
        do move 89 131
        do north 10
        do conf route_avoidWalls 1
    }
}


#4012#Mudança de Classe: Caçador#SG_FEEL#QUE_NOIMAGE#
#Relate ao Senhor da Guilda dos Caçadores que passou no exame. #
##
automacro questCacador_irAteAGuildaDosArqueirosRelatarSucesso {
    QuestActive 4012
    exclusive 1
    ConfigKey quest_cacador_lider guilda_arqueiros
    call {
        do move payon_in02 21 31 &rand(2,4)
	do talknpc 21 31 r0
    }
}

#4012#Mudança de Classe: Caçador#SG_FEEL#QUE_NOIMAGE#
#Relate ao Senhor da Guilda dos Caçadores que passou no exame. #
##
automacro questCacador_irAteOPalacioDePayonRelatarSucessoEntrarPalacio {
    QuestActive 4012
    exclusive 1
    InMap payon
    ConfigKey quest_cacador_lider palacio_payon
    call {
        do move payon 188 233 
    }
}

automacro questCacador_irAteOPalacioDePayonRelatarSucessoNoPalacio {
    QuestActive 4012
    exclusive 1
    InMap payon_in03
    ConfigKey quest_cacador_lider palacio_payon
    call {
        do move payon_in03 158 33
        do move payon_in03 131 7 &rand(2,4)
	do talknpc 131 7 r0 
    }
}

#4013#Mudança de Classe: Caçador#SG_FEEL#QUE_NOIMAGE#
#Volte à Guilda dos Caçadores para relatar que passou no exame. #
#Penetração #
automacro questCacador_termineiDesafiosVoltandoHugel {
    QuestActive 4013
    NotInMap hugel
    NotInMap hu_in01
    ConfigKey aeroplano1 none
    ConfigKey aeroplano2 none
    exclusive 1
    call {
        call pararDeAtacar
	do conf lockMap none 
        call aeroplano_junoPara "hugel"

    }
}

#4013#Mudança de Classe: Caçador#SG_FEEL#QUE_NOIMAGE#
#Volte à Guilda dos Caçadores para relatar que passou no exame. #
#Penetração #
automacro questCacador_relatarAoLiderDaGuildDosCacadores {
    QuestActive 4013
    InMap hugel, hu_in01
    exclusive 1
    call {
        do move hu_in01 386 373 &rand(2,4)
        do talknpc 386 373
	[
	    log =======================
	    log Finalmente sou caçador
	    log demorou para caramba
	    log =======================
	]
    }
}



