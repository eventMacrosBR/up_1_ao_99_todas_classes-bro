sub initParamsQuestClasse2 {
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
	Commands::run("conf -f questc2_implementada false");
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

#4000#Mudança de Classe: Caçador#SG_FEEL#QUE_NOIMAGE#
#Você precisa passar pelo teste de Dejiko para avançar. #
##

#4001#Mudança de Classe: Caçador#SG_FEEL#QUE_NOIMAGE#
#Fale com a Caçadora da Guilda para continuar o teste. #
##

#4002#Mudança de Classe: Caçador#SG_FEEL#QUE_NOIMAGE#
#Colete os itens que o Caçador de Demônios pedir. - 5 Garras do Lobo, 5 Troncos e 3 Ervas Brancas #
##
automacro coletarItens_Possibilidade1 {
    QuestActive 4002
    exclusive 1
    timeout 120
    ConfigKeyNot passo_quest_cacador indo entregar itens
    call {
        #Possibilidade 1    
        $qtdItem1 = &invamount(920)  #Garras de Lobo
        $qtdItem2 = &invamount(1019) #Troncos
        $qtdItem3 = &invamount(509)  #Ervas Brancas

        if ( $qtdItem1 < 5 ) {
            do conf lockMap TODO
        } elsif ( $qtdItem1 >= 5 && $qtdItem2 < 5 ) {
            do conf lockMap TODO
        } elsif ( $qtdItem1 >= 5 && $qtdItem2 >= 5 && $qtdItem3 < 3) {
            do conf lockMap TODO
        } elsif ( $qtdItem1 >= 5 && $qtdItem2 >= 5 && $qtdItem3 >= 3) {
            log ================================
            log Coletei todos os itens, indo Entregar!
            log ================================
            do conf -f passo_quest_cacador indo entregar itens
        } else {
            log ====================================================
            log Deveria estar coletando 5 Garras do Lobo, 5 Troncos e 3 Ervas Brancas agora
            log Mas algo deu errado... reporte aos criadores dessa eventMacro
            log ====================================================
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
        #Possibilidade 1    
        $qtdItem1 = &invamount(925)  #Bico de Ave
        $qtdItem2 = &invamount(932)  #Osso
        $qtdItem3 = &invamount(511)  #Erva Verde

        if ( $qtdItem1 < 3 ) {
            do conf lockMap TODO
        } elsif ( $qtdItem1 >= 3 && $qtdItem2 < 5 ) {
            do conf lockMap TODO
        } elsif ( $qtdItem1 >= 3 && $qtdItem2 >= 5 && $qtdItem3 < 3) {
            do conf lockMap TODO
        } elsif ( $qtdItem1 >= 3 && $qtdItem2 >= 5 && $qtdItem3 >= 3) {
            log ================================
            log Coletei todos os itens, indo Entregar!
            log ================================
            do conf -f passo_quest_cacador indo entregar itens
        } else {
            log ====================================================
            log Deveria estar coletando 3 Bicos de Ave, 5 Ossos e 3 Ervas Verdes agora
            log Mas algo deu errado... reporte aos criadores dessa eventMacro
            log ====================================================
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
        #Possibilidade 2
        $qtdItem1 = &invamount(937)  #Canino Venenoso
        $qtdItem2 = &invamount(507)  #Erva Vermelha
        $qtdItem3 = &invamount(919)  #Couro de Animal

        if ( $qtdItem1 < 3 ) {
            do conf lockMap TODO
        } elsif ( $qtdItem1 >= 3 && $qtdItem2 < 5 ) {
            do conf lockMap TODO
        } elsif ( $qtdItem1 >= 3 && $qtdItem2 >= 5 && $qtdItem3 < 3) {
            do conf lockMap TODO
        } elsif ( $qtdItem1 >= 3 && $qtdItem2 >= 5 && $qtdItem3 >= 3) {
            log ================================
            log Coletei todos os itens, indo Entregar!
            log ================================
            do conf -f passo_quest_cacador indo entregar itens
        } else {
            log ====================================================
            log Deveria estar coletando Pele de Verme, Casca ou Erva Amarela agora
            log Mas algo deu errado... reporte aos criadores dessa eventMacro
            log ====================================================
        }
    }
}

automacro coletarItens_Possibilidade5 {
    QuestActive 4006
    exclusive 1
    timeout 120
    ConfigKeyNot passo_quest_cacador indo entregar itens
    call {
        #Possibilidade 2
        $qtdItem1 = &invamount(955)  #Pele de Verme
        $qtdItem2 = &invamount(935) #Casca
        $qtdItem3 = &invamount(508)  #Erva Amarela

        if ( $qtdItem1 < 9 ) {
            do conf lockMap TODO
        } elsif ( $qtdItem1 >= 9 && $qtdItem2 < 9 ) {
            do conf lockMap TODO
        } elsif ( $qtdItem1 >= 9 && $qtdItem2 >= 9 && $qtdItem3 < 9) {
            do conf lockMap TODO
        } elsif ( $qtdItem1 >= 9 && $qtdItem2 >= 9 && $qtdItem3 >= 9) {
            log ================================
            log Coletei todos os itens, indo Entregar!
            log ================================
            do conf -f passo_quest_cacador indo entregar itens
        } else {
            log ====================================================
            log Deveria estar coletando Pele de Verme, Casca ou Erva Amarela agora
            log Mas algo deu errado... reporte aos criadores dessa eventMacro
            log ====================================================
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

#4004#Mudança de Classe: Caçador#SG_FEEL#QUE_NOIMAGE#
#Colete os itens que o Caçador de Demônios pedir. - 3 Caninos Venenosos, 3 Couros de Animal e 5 Ervas Vermelhas #
##
automacro coletarCaninosVenenosos {
    QuestActive 4004
    InInventoryID 937 < 3
    exclusive 1
    call {
        [
            log "Coletar"
        ]
    }
}

#4004#Mudança de Classe: Caçador#SG_FEEL#QUE_NOIMAGE#
#Colete os itens que o Caçador de Demônios pedir. - 3 Caninos Venenosos, 3 Couros de Animal e 5 Ervas Vermelhas #
##
automacro coletarErvasVermelhas {
    QuestActive 4004
    InInventoryID 507 < 5
    exclusive 1
    call {
        [
            log "Coletar"
        ]
    }
}


automacro coletarCourosDeAnimais {
    QuestActive 4004
    InInventoryID 919 < 3
    exclusive 1
    call {
        [
            log "Coletar"
        ]
    }
}

#4005#Mudança de Classe: Caçador#SG_FEEL#QUE_NOIMAGE#
#Colete os itens que o Caçador de Demônios pedir. - 3 Chifres de Dokebi, 3 Pedaços de Casca de Ovo e 10 Felpas #
##
automacro coletarChifresDeDokebi {
    QuestActive 4005
    InInventoryID 1021 < 3
    exclusive 1
    call {
        [
            log "Coletar"
        ]
    }
}

#4005#Mudança de Classe: Caçador#SG_FEEL#QUE_NOIMAGE#
#Colete os itens que o Caçador de Demônios pedir. - 3 Chifres de Dokebi, 3 Pedaços de Casca de Ovo e 10 Felpas #
##
automacro coletarPedacosDeCascaDeOvo {
    QuestActive 4005
    InInventoryID 7032 < 3
    exclusive 1
    call {
        [
            log "Coletar"
        ]
    }
}


automacro coletarFelpas {
    QuestActive 4005
    InInventoryID 914 < 10
    exclusive 1
    call {
        [
            log "Coletar"
        ]
    }
}

#4006#Mudança de Classe: Caçador#SG_FEEL#QUE_NOIMAGE#
#Colete os itens que o Caçador de Demônios pedir. - 9 Cascas, 9 Peles de Verme e 9 Ervas Amarelas. #
##
automacro coletarCascas {
    QuestActive 4006
    InInventoryID 935 < 9
    exclusive 1
    call {
        [
            log "Coletar"
        ]
    }
}

#4006#Mudança de Classe: Caçador#SG_FEEL#QUE_NOIMAGE#
#Colete os itens que o Caçador de Demônios pedir. - 9 Cascas, 9 Peles de Verme e 9 Ervas Amarelas. #
##
automacro coletarPelesDeVerme {
    QuestActive 4006
    InInventoryID 955 < 9
    exclusive 1
    call {
        [
            log "Coletar"
        ]
    }
}


automacro coletarErvasAmarelas {
    QuestActive 4006
    InInventoryID 508 < 9
    exclusive 1
    call {
        [
            log "Coletar"
        ]
    }
}


automacro coletarDentesDeMorcego {
    QuestActive 4007
    InInventoryID 913 < 3
    exclusive 1
    call {
        [
            log "Coletar"
        ]
    }
}

#4007#Mudança de Classe: Caçador#SG_FEEL#QUE_NOIMAGE#
#Colete os itens que o Caçador de Demônios pedir. - 3 Dentes de Morcego, 1 Muco Pegajoso, 1 Pata de Urso #
##
automacro coletarMucoPegajoso {
    QuestActive 4007
    InInventoryID 938 < 1
    exclusive 1
    call {
        [
            log "Coletar"
        ]
    }
}

#4007#Mudança de Classe: Caçador#SG_FEEL#QUE_NOIMAGE#
#Colete os itens que o Caçador de Demônios pedir. - 3 Dentes de Morcego, 1 Muco Pegajoso, 1 Pata de Urso #
##
automacro coletarPataDeUrso {
    QuestActive 4007
    InInventoryID 948 < 1
    exclusive 1
    call {
        [
            log "Coletar"
        ]
    }
}

#4008#Mudança de Classe: Caçador#SG_FEEL#QUE_NOIMAGE#
#Colete os itens que o Caçador de Demônios pedir. - 2 Espinhos de Porco-Espinho,  1 Avelã e 1 Cauda de Yoyo #
#
automacro coletarEspinhosDePorcoEspinho {
    QuestActive 4008
    InInventoryID 1027 < 2
    exclusive 1
    call {
        [
            log "Coletar"
        ]
    }
}

#4008#Mudança de Classe: Caçador#SG_FEEL#QUE_NOIMAGE#
#Colete os itens que o Caçador de Demônios pedir. - 2 Espinhos de Porco-Espinho,  1 Avelã e 1 Cauda de Yoyo #
#
automacro coletarAvela {
    QuestActive 4008
    InInventoryID 1026 < 1
    exclusive 1
    call {
        [
            log "Coletar"
        ]
    }
}

#4008#Mudança de Classe: Caçador#SG_FEEL#QUE_NOIMAGE#
#Colete os itens que o Caçador de Demônios pedir. - 2 Espinhos de Porco-Espinho,  1 Avelã e 1 Cauda de Yoyo #
#
automacro coletarCaldaDeYoyo {
    QuestActive 4008
    InInventoryID 942 < 1
    exclusive 1
    call {
        [
            log "Coletar"
        ]
    }
}

#4009#Mudança de Classe: Caçador#SG_FEEL#QUE_NOIMAGE#
#Vá falar com o Líder da Guilda, que está no Palácio Central de Payon. #
#

#4010#Mudança de Classe: Caçador#SG_FEEL#QUE_NOIMAGE#
#Vá falar com o Líder da Guilda, que está na Guilda dos Arqueiros. #
#

#4011#Mudança de Classe: Caçador#SG_FEEL#QUE_NOIMAGE#
#Mate todos os ^ff0000monstros de mudança de classe^000000, e o interruptor vai aparecer. Destrua o interruptor e fuja pela saída ao norte. #
#

#4012#Mudança de Classe: Caçador#SG_FEEL#QUE_NOIMAGE#
#Relate ao Senhor da Guilda dos Caçadores que passou no exame. #
##

#4013#Mudança de Classe: Caçador#SG_FEEL#QUE_NOIMAGE#
#Volte à Guilda dos Caçadores para relatar que passou no exame. #
#Penetração #

