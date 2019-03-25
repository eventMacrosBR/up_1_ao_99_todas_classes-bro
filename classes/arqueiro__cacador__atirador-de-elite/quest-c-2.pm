sub inicializarParametrosQuestClasse2 {
    my ($manterOuGuardar) = @_;
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
        if ($manterOuGuardar eq "manter") {
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
        $item1{ID}      = 920 #Garra de Lobo
        $item1{lockMap} = moc_fild03
        
        $item2{ID}      = 1019 #Tronco
        $item2{lockMap} = pay_fild10
        
        $item3{ID}      = 509 #Erva Branca
        $item3{lockMap} = orcsdun01
        
        call decidirLockMapProItem
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
        $item1{ID}      = 925 #Bico de Ave
        $item1{lockMap} = moc_fild01
        
        $item2{ID}      = 932 #Osso
        $item1{lockMap} = pay_dun01
        
        $item3{ID}      = 511 #Erva Verde
        $item1{lockMap} = prt_fild08
        
        call decidirLockMapProItem
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
        
        $item1{ID}      = 937 #Canino Venenoso
        $item1{lockMap} = pay_fild08
        
        $item2{ID}      = 507 #Erva Vermelha
        $item1{lockMap} = mjolnir_09
        
        $item3{ID}      = 919 #Couro de Animal
        $item1{lockMap} = pay_fild08 # TODO: esse mapa ta errado com certeza
        
        call decidirLockMapProItem
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
        $item1{ID}      = 1021 #Chifre de Dokebi
        $item1{lockMap} = pay_dun04 # TODO: será que o bot consegue chegar nesse mapa? *pensativo*
        
        $item2{ID}      = 7032 #Pedaço de Casca de Ovo
        $item1{lockMap} = pay_dun01
        
        $item3{ID}      = 914 #Felpa
        $item1{lockMap} = prt_fild08
        
        call decidirLockMapProItem
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
        $item1{ID}      = 935 #Casca
        $item1{lockMap} = gef_fild00
        
        $item2{ID}      = 955 #Pele de Verme
        $item1{lockMap} = anthell02
        
        $item3{ID}      = 508 #Erva Amarela
        $item1{lockMap} = prt_fild03
        
        call decidirLockMapProItem
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
        $item1{ID}      = 913 #Dente de Morcego
        $item1{lockMap} = anthell01
        
        $item2{ID}      = 938 #Muco Pegajoso
        $item1{lockMap} = pay_dun00
        
        $item3{ID}      = 948 #Pata de Urso
        $item1{lockMap} = pay_fild07
        
        call decidirLockMapProItem
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
        $item1{ID}      = 1027 #Espinho de Porco-Espinho
        $item1{lockMap} = mjolnir_01
        
        $item2{ID}      = 1026 #Avelã
        $item1{lockMap} = pay_fild09
        
        $item3{ID}      = 942 #Cauda de Yoyo
        $item1{lockMap} = prt_fild03
        
        call decidirLockMapProItem
    }
}

macro decidirLockMapProItem {
    call voltarAtacar
    
    $item1{qtdQuePreciso} = pegarConfigItemsControl($item1{ID}, "keep")
    $item2{qtdQuePreciso} = pegarConfigItemsControl($item2{ID}, "keep")
    $item3{qtdQuePreciso} = pegarConfigItemsControl($item3{ID}, "keep")
    
    #se não tiver o item1, vamos pegar ele
    if ( &invamount($item1{ID}) < $item1{qtdQuePreciso} ) {
        do conf lockMap $item1{lockMap}
        call pegarItemDoArmazenSeTiver "$item1{ID}" "$item1{qtdQuePreciso}"
        
    #se já tiver o item1, vamos pegar o item2
    } elsif ( &invamount($item1{ID}) >= $item1{qtdQuePreciso} && &invamount($item2{ID}) < $item2{qtdQuePreciso} ) {
        do conf lockMap $item2{lockMap}
        call pegarItemDoArmazenSeTiver "$item2{ID}" "$item2{qtdQuePreciso}"
        
    #se ja tiver tanto o item1 quanto o item2, vamos pegar o item3
    } elsif ( &invamount($item1{ID}) >= $item1{qtdQuePreciso} && &invamount($item2{ID}) >= $item2{qtdQuePreciso} && &invamount($item3{ID}) < $item3{qtdQuePreciso}) {
        do conf lockMap $item3{lockMap}
        call pegarItemDoArmazenSeTiver "$item3{ID}" "$item3{qtdQuePreciso}"
        
    #se tiver todos os 3 items, aí vai entregar
    } elsif ( &invamount($item1{ID}) >= $item1{qtdQuePreciso} && &invamount($item2{ID}) >= $item2{qtdQuePreciso} && &invamount($item3{ID}) >= $item3{qtdQuePreciso}) {
        [
        log ================================
        log Coletei todos os itens, indo Entregar!
        log ================================
        ]
        do conf -f passo_quest_cacador indo entregar itens
    
    #se cair aqui é porque tem um bug na macro, aí é muita treta
    } else {
        [
        error ====================================================
        error Deveria estar coletando:
        error $item1{qtdQuePreciso} pegarNomePeloIdDoItem($item1{ID}),
        error $item1{qtdQuePreciso} pegarNomePeloIdDoItem($item1{ID}) e
        error $item1{qtdQuePreciso} pegarNomePeloIdDoItem($item1{ID}) agora
        error Mas algo deu errado... reporte aos criadores dessa eventMacro
        error ====================================================
        ]
        call informacoes
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
    ConfigKey quest_cacador_lider palacio_payon
    call {
        do move payon_in02 21 31 &rand(2,4)
    do talknpc 21 31 r0
    }
}

#Nao quis entender o porque. Apenas funcionou (testado duas vezes)
#4012#Mudança de Classe: Caçador#SG_FEEL#QUE_NOIMAGE#
#Relate ao Senhor da Guilda dos Caçadores que passou no exame. #
##
automacro questCacador_irAteAGuildaDosArqueirosRelatarSucesso2 {
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



