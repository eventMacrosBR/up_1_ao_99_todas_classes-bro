sub inicializarParametrosQuestClasse2 {
    my ($manterOuGuardar) = @_;
    my %items = (
    657 => "7 1 0",     #Poção da Fúria Selvagem
    612 => "100 1 0",   #Mini Fornalha
    1752 => "500 1 0", #Flecha de Fogo
    710 => "0 0 0"     #Flor das ilusoes (vai ser feita a quest mais rapida)
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

#################################################################
#                                #
#                       Virando Alquimista    #
#                                #
#################################################################

#################################################################
#                                #
#             Indo para a Guilda dos Alquimistas    #
#                                #
#################################################################

automacro virarAlquimistaInicio_IrNoNpc {
    JobID $parametrosClasses{idC1}, $parametrosClasses{idBC1}
    JobLevel = 50
    FreeSkillPoints = 0
    priority 2
    exclusive 1
    ConfigKeyNot virarAlquimista true
    NpcNotNear /Alquimista sênior/
    call {
        call pararDeAtacar
        do conf lockMap none
        do move alde_alche &rand(25,27) &rand(179,181)
    }
}

#################################################################
#                                #
#             Começando a Quest de Alquimista!    #
#        Parte 1 - Falando com o Alquimista Sênior    #
#                                #
#################################################################

automacro virarAlquimistaInicio {
    JobID $parametrosClasses{idC1}, $parametrosClasses{idBC1}
    JobLevel = 50
    priority 2
    timeout 30
    ConfigKeyNot virarAlquimista true
    NpcNear /Alquimista sênior/
    call {
        do conf autoTalkCont 1
        do talk $.NpcNearLastBinId
        do talk resp 1
        do talk resp 0
        do talk resp 0
    }
}

#################################################################################
#                                        #
#                  Continuando a Quest de Alquimista!        #
#    Parte 2 - Identificando/Comprando/Levando os itens necessários         #
#                         para o Alquimista Sênior        #
#                                        #
#################################################################################

automacro virarAlquimista_descobrindoQualItem_fornalha {
    NpcMsg /trazer 100 Mini-Fornalhas/
    exclusive 1
    call {
        do conf -f questAlquimista comprarFornalha
        do conf -f virarAlquimista true
    }
}

automacro virarAlquimista_descobrindoQualItem_flecha {
    NpcMsg /trazer \d+ Flecha/
    exclusive 1
    call {
        do conf -f questAlquimista comprarFlecha
        do conf -f virarAlquimista true
    }
}

automacro virarAlquimista_descobrindoQualItem_pocao {
    NpcMsg /trazer \d+ .+F.ria Selvagem/
    exclusive 1
    call {
        do conf -f questAlquimista comprarPocao
        do conf -f virarAlquimista true
    }
}

automacro virarAlquimista_comprarFornalha {
    exclusive 1
    JobID $parametrosClasses{idC1}, $parametrosClasses{idBC1}
    JobLevel = 50
    ConfigKey questAlquimista comprarFornalha
    InInventoryID 612 < 100 #Mini-Fornalha
    call {
        do move geffen
        do move geffen_in 106 178
        do talk &npc(110 172)
        do talk resp 1
        do talk resp 0
        do talk num 100
    }
}

automacro virarAlquimista_comprarFuria {
    exclusive 1
    JobID $parametrosClasses{idC1}, $parametrosClasses{idBC1}
    JobLevel = 50
    InInventoryID 657 < 7 #Poção da Fúria Selvagem
    ConfigKey questAlquimista comprarPocao
    call comprarItem "cmd_in01" "79 182" "Ferramentas" "Poção da Fúria Selvagem" "7"
}

automacro virarAlquimista_comprarFlechaDeFogo {
    exclusive 1
    JobID $parametrosClasses{idC1}, $parametrosClasses{idBC1}
    JobLevel = 50
    ConfigKey questAlquimista comprarFlecha
    InInventoryID 1752 <= 500 #Flecha de Fogo
    call comprarItem "alb2trea" "87 65" "Ferramentas" "Flecha de Fogo" "500"
}

macro comprarItem {
    ### $.param[0] tem como valor a cidade
    ### $.param[1] tem como valor as coordenadas
    ### $.param[2] tem como valor o NPC
    ### $.param[3] tem como valor o item
    ### $.param[4] tem como valor a quantidade
    [
    log ===================================
    log = vou em $.param[0] nas coordenadas $.param[1]
    log = conversar com o npc $.param[2] , pode ser 
    log = que o nome do npc seja abreviado
    log = para comprar $.param[4] $.param[3]
    log ===================================
    ]
    log movendo-se para $.param[0] $.param[1]
    do move $.param[0] $.param[1] &rand(1,6)
    do talk no
    log conversando com npc de venda
    do talk &npc(/$.param[2]/)
    do store
    if (&store($.param[3]) != -1) {
        log o item existe na lista de itens do npc
        log tentando comprar o item
        do buy &store($.param[3]) $.param[4]
    } else {
        [
        log ===================================
        log = ihhhhhhhhhhh deu ruim demais
        log = muita treta vish mano
        log = manda mensagem lá pros criador dessa macro
        log = pq senão vai continuar na treta
        log = E JÁ MANDA AS ÚLTIMAS 20 LINHAS DO CONFIG.TXT 
        log = KKKKKKKKKKKKKKKKKKKKKKK
        log ===================================
        ]
    }
}

automacro virarAlquimista_FuriaComprada_indoEntregar {
    InInventoryID 657 >= 7 #Poção da Fúria Selvagem
    ConfigKey questAlquimista comprarPocao
    exclusive 1
    call voltarProAlquimistaSenior
}

automacro virarAlquimsta_FornalhaComprada_indoEntregar {
    InInventoryID 612 >= 100 #Mini-Fornalha
    ConfigKey questAlquimista comprarFornalha
    exclusive 1
    call voltarProAlquimistaSenior
}

automacro virarAlquimista_FlechaComprada_indoEntregar {
    InInventoryID 1752 >= 500 #Flecha de Fogo
    ConfigKey questAlquimista comprarFlecha
    exclusive 1
    call voltarProAlquimistaSenior
}

macro voltarProAlquimistaSenior {
    do move alde_alche &rand(25,27) &rand(178,180)
    do talk &npc (/Alquimista sênior/)
    do conf lockMap none
    pause 3
    #isso vai checar se realmente entregamos o item, ja que está sempre suscetivel a falhas
    #se não tiver entregado por qualquer motivo que seja, ele simplesmente vai tentar denovo 
    #Se conseguir, ele move pra o proximo passo
    if ($.InInventoryIDLast = 657) { #Poção da Fúria Selvagem
        if (&inventory(657) < 7) do conf -f questAlquimista questionario
    } elsif ($.InInventoryIDLast = 612) { #Mini-Fornalha
        if (&inventory(612) < 100) do conf -f questAlquimista questionario
    } elsif ($.InInventoryIDLast = 1752) { #Flecha de Fogo
        if (&inventory(1752)  < 500) do conf -f questAlquimista questionario
    }
}        

#################################################################
#                                                               #
#                 Continuando a Quest de Alquimista!            #
#                 Parte 3 - Falando com Raspuchin               #
#                                                               #
#################################################################

automacro virarAlquistia_npcDoQuestionario {
    #QuestActive 2031 #ja nao ta funcionando mais vitor hahah
    ConfigKey questAlquimista questionario
    timeout 60
    call {
        [
        log ======================================================
        log =         Como estamos no nível de classe 50,     =
        log =  não precisamos responder o questionário, somente  =
        log =                 falar com ele! hehehe     =
        log ======================================================
        ]
        do move alde_alche &rand(166,168) &rand(106,108)
        pause 5
        do talk &npc (/Alquimista Misterioso/)
    }
}

automacro virarAlquimista_npcQuestionario_bugged {
    NpcMsgName /.*vez que falou comigo.*/ / Misterioso/
    ConfigKey questAlquimista questionario
    exclusive 1
    call {
        do conf -f questAlquimista npcDaFlor
    }
}

automacro virarAlquimista_jaFaleiComNpcQuestionario {
    exclusive 1
    NpcMsg /Diga a Darcya que eu te mandei/
    ConfigKey questAlquimista questionario
    call {
        do conf -f questAlquimista npcDaFlor
    }
}

#2032#Mudança de Classe: Alquimista#SG_FEEL#QUE_NOIMAGE#
#Por seu olhar, posso ver que você é inteligente. Certo, excelente. Agora vá falar com Darwin. Ele vai lhe ensinar a realizar os experimentos. #
#Fale com o estudioso Darwin. #
automacro virarAlquimista_falarComNpcFlor {
    QuestActive 2032
    ConfigKey questAlquimista questionario
    call {
        do conf -f questAlquimista npcDaFlor
    }
}

        
#################################################################
#                                                               #
#                Continuando a Quest de Alquimista!             #
#                 Parte IV - Falando com Darcya                 #
#                                                               #
#################################################################

automacro virarAlquimista_NpcDaFlor {
    ConfigKey questAlquimista npcDaFlor
    timeout 30
    call {
        call pararDeAtacar
        do conf lockMap none
        do iconf 710 0 0 0 #Flor das Ilusões
        do move alde_alche &rand(13,16) &rand(18,20)
        do talk &npc(/Pesquisador/)
        do talk resp 0
    }
}

automacro virarAlquimista_faleiComNpcDaFlor_bugged {
    ConfigKey questAlquimista npcDaFlor
    NpcMsgName /Volte quando estiver tudo pronto/ /Pesquisador/
    exclusive 1
    call {
        do conf -f questAlquimista pegarAFlor
    }
}
automacro virarAlquimista_faleiComNpcDaFlor {
    ConfigKey questAlquimista npcDaFlor
    exclusive 1
    NpcMsg /Consiga os itens e volte/
    call {
        do conf -f questAlquimista pegarAFlor
    }
}

#2033#Mudança de Classe: Alquimista#SG_FEEL#QUE_NOIMAGE#
#Vou lhe ensinar a fazer um remédio simples. Traga os seguintes materiais imediatamente. #
#3 Tigelas de Porcelana Branca, 3 Garrafas Vazias, 1 Erva Vermelha, 1 Erva Amarela e 1 Erva Branca #
automacro virarAlquimista_naoTenhoAFlorVouPegar {
    QuestActive 2033
    InInventoryID 710 < 1
    ConfigKey questAlquimista npcDaFlor
    call {
        do conf -f questAlquimista pegarAFlor
    }
}

#################################################################
#                                                               #
#             Caso não tenha a Flor, vou ter que                #
#        comprá-la! Configurando BetterShopper...               #
#                                                               #
#################################################################

automacro virarAlquimista_naoTenhoAFlor {
    ConfigKey questAlquimista pegarAFlor
    ConfigKeyNot questAlquimista fimDaQuest
    exclusive 1
    Zeny >= 300000
    InInventoryID 710 < 1 #Flor das Ilusões
    ConfigKeyNot BetterShopper_on 1
    call {
        call pararDeAtacar
        do conf lockMap none
        if ( recursoTecnicoPaliativo() = 1 ) { #Significa que o BetterShopper está ativado
            do conf lockMap prontera
            do conf route_randomWalk 1
            do conf route_randomWalk_inTown 1
            do conf itemsTakeAuto 1
            do conf itemsGatherAuto 0
            do conf itemsMaxWeight_sellOrStore 40
        
            if ( checarSeExisteNoConfig('BetterShopper_0') == nao ) {
                #Se o bloco não existir, vamos criar ele!
                adicionaBetterShopper()
                pause 1
                do reload config
            }
            do conf BetterShopper_0 Flor das Ilusões
            do conf BetterShopper_0_maxPrice 350000
            do conf BetterShopper_0_maxAmount 1
            do conf -f BetterShopper_on 1
        } else {
            [
            log =*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=
            log *      É preciso baixar e ativa o plugin BetterShopper.             *
            log =      Até lá nem a macro nem o Openkore vão continuar!             =
            log * Caso já tenha feito isso, feche e abra o Openkore novamente!      *
            log =*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=
            ]
            do eval Misc::offlineMode();
            stop
        }
    }
}

automacro virarAlquimista_naoTenhoAFlor_bugged {
    ConfigKey questAlquimista pegarAFlor
    ConfigKeyNot questAlquimista fimDaQuest
    exclusive 1
    Zeny >= 300000
    InInventoryID 710 < 1 #Flor das Ilusões
    ConfigKey BetterShopper_on 1
    NotInMap prontera
    call {
        do move prontera
        do conf lockMap prontera
    }
}

automacro virarAlquimista_naoTenhoAFlor_NemZeny {
    ConfigKey questAlquimista pegarAFlor
    ConfigKeyNot questAlquimista fimDaQuest
    exclusive 1
    Zeny < 300000
    InInventoryID 710 < 1 #Flor das Ilusões
    ConfigKeyNot lockMap pay_fild09
    ConfigKeyNot In_saveMap_sequence true
    timeout 120
    call {
        [
        log =====================================================
        log =Não tenho zeny suficiente para comprar a Flor     
        log =Então vou conseguir o dinheiro!                 
        log =Começando o processo de vender loot e conseguir mais
        log =====================================================
        ]
        do autosell
        do iconf 690 0 0 1 #Lanças de Fogo Nível 3
        do iconf 757 0 0 1 #Minério de Elunium
        do iconf 907 0 0 1 #Resina
        do iconf 947 0 0 1 #Chifre
        do iconf 914 0 0 1 #Felpa
        do iconf 919 0 0 1 #Couro de Animal
        do iconf 943 0 0 1 ##Casca Rija
        do iconf 935 0 0 1 #Casca
        do iconf 1011 0 0 1 #Emveretarcon
        do iconf 2329 0 0 1 #Armadura de Madeira
        do iconf 1026 0 0 1 #Avelã
        do iconf 2502 0 0 1 #Capuz [1]
        do iconf 2402 0 0 1 #Sandálias [1]
        
        call voltarAtacar
        call salvarNaCidade "payon" 
        do conf lockMap pay_fild09
    }
}

sub recursoTecnicoPaliativo {
    my $estaNoSys;
    my $controlfile = Settings::getSysFilename();
    open(FILE, '<:encoding(UTF-8)', $controlfile);
    my @lines = <FILE>;
    close(FILE);
    chomp @lines;
    
    foreach my $line (@lines) {
        next if $line =~ /^$/ || $line =~ /^#/;
        if ($line =~ /BetterShopper/ ) {
            $estaNoSys = 1 ;
            last;
        }
    }
    
    if ($estaNoSys == 1 ) {
        return 1;
    } else {
        return -1;
    }
}

automacro virarAlquimista_juntandoZeny {
    ConfigKey questAlquimista pegarAFlor
    ConfigKeyNot questAlquimista fimDaQuest
    exclusive 1
    ConfigKey lockMap pay_fild09
    ConfigKey saveMap payon
    timeout 180
    call {
        [
        log ======================================
        log =Estou coletando items pra fazer zeny
        log =Para Quest de Alquimista         
        log ======================================
        ]
        if (&config(attackAuto) != 2) call voltarAtacar
        if (&config(itemsTakeAuto) != 2) do conf itemsTakeAuto 2
        if (&config(itemsGatherAuto) != 2) do conf itemsGatherAuto 2
        if (&config(itemsMaxWeight_sellOrStore) != 30) do conf itemsMaxWeight_sellOrStore 30
    }
}


automacro virarAlquimista_euTenhoAFlor {
    ConfigKey questAlquimista pegarAFlor
    InInventoryID 710 >= 1 #Flor das Ilusões
    timeout 60
    call {
        do conf -f questAlquimista jaPegueiAFlor
    }
}

automacro virarAlquimista_indoEntregaAFlor {
    ConfigKey questAlquimista jaPegueiAFlor
    timeout 60
    InInventoryID 710 >= 1 #Flor das Ilusões
    call {
        call pararDeAtacar
        do conf lockMap none
        do conf route_randomWalk_inTown 0
        do conf BetterShopper_on none
        do move alde_alche &rand(13,16) &rand(18,20)
        do talk &npc(/Pesquisador/)
        do talk resp 1
    }
}

automacro virarAlquimista_entregueiAFlor {
    ConfigKey questAlquimista jaPegueiAFlor
    exclusive 1
    NpcMsgName /torne-se um Alquimista de verdade/ /Pesquisador/
    priority -5 #alto
    call {
        pause 1
        do conf -f questAlquimista fimDaQuest
    }
}

automacro virarAlquimista_entregueiAFlor_bugged {
    exclusive 1
    NpcMsgName /de um Alquimista/ /Pesquisador/
    ConfigKey questAlquimista jaPegueiAFlor
    call {
        do conf -f questAlquimista fimDaQuest
    }
}

automacro virarAlquimista_entregueiAFlor_bugged2 {
    exclusive 1
    ConfigKey questAlquimista jaPegueiAFlor
    InInventoryID 710 < 1 #Flor das Ilusões
    call {
        #se isso ativar, significa que entregamos a flor
        do conf -f questAlquimista fimDaQuest
    }
}

#################################################################
#                                #
#             Terminando a Quest de Alquimista!    #
#             Parte V - Falando com Alquimista Chefe    #
#                                #
#################################################################

automacro virarAlquimista_FimDaQuest_FalarComAlquimistaChefe {
    ConfigKey questAlquimista fimDaQuest
    JobLevel = 50
    JobID 5
    exclusive 1
    call {
        do move alde_alche &rand(99,101) &rand(182,184)
        do talk &npc(101 184)
        [
        log ==============================
        log =Finalmente virei Alquimista!=
        log ==============================
        ]
       }
}

automacro jaSouAlquimista {
    JobID $parametrosClasses{idC2}, $parametrosClasses{idBC2}
    ConfigKey questAlquimista fimDaQuest
    priority -5
    exclusive 1
    call {
        do conf teleportAuto_MaxDmg 1000
        call pararDeAtacar
        do conf BetterShopper_on 0
        do conf route_randomWalk_inTown 0
        do conf questAlquimista none
    }
}

