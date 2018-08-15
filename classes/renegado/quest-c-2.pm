sub inicializarParametrosQuestClasse2 {
    my ($manterOuGuardar) = @_;
    my %items = (
    510 => "7 1 0", #ervaAzul
    957 => "10 1 0", #unhaApodrecida
    932 => "10 1 0", #osso
    958 => "10 1 0" #mandibula
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

#From- Macro Quest Arruaceiro 2.0

#By Gaspel
#Edited- by CALF
#convertido e reescrito pra eventMacro por Nipodemos
automacro virarArruaceiroInicio_salvarEmMorocc {
    JobID $parametrosClasses{idC1}, $parametrosClasses{idBC1}
    JobLevel >= $configsBuild{lvlClasseParaVirarClasse2}
    FreeSkillPoints = 0
    priority 2
    exclusive 1
    ConfigKeyNot saveMap morocc
    ConfigKeyNot naSequenciaDeSalvamento true
    ConfigKeyNot quest_eden em_curso
    ConfigKeyNot quest_eden terminando
    NpcNotNear /Arruaceira da Guilda/
    QuestInactive 2017
    QuestInactive 2018
    QuestInactive 2022
    QuestInactive 2023
    QuestInactive 2024
    QuestInactive 2026
    call salvarNaCidade "morocc"
}

automacro virarArruaceiroInicio_IrNoNpc {
    JobID $parametrosClasses{idC1}, $parametrosClasses{idBC1}
    JobLevel >= $configsBuild{lvlClasseParaVirarClasse2}
    FreeSkillPoints = 0
    priority 2
    exclusive 1
    ConfigKey saveMap morocc
    NpcNotNear /Arruaceira da Guilda/
    QuestInactive 2017
    QuestInactive 2018
    QuestInactive 2022
    QuestInactive 2023
    QuestInactive 2024
    QuestInactive 2026
    call {
        call pararDeAtacar
        do conf lockMap none
        do conf -f virarClasse2 true
        do move in_rogue &rand(361,366) &rand(112,117)
    }
}

automacro virarArruaceiroInicio {
    JobID $parametrosClasses{idC1}, $parametrosClasses{idBC1}
    JobLevel >= $configsBuild{lvlClasseParaVirarClasse2}
    priority 2
    exclusive 1
    NpcNear /Arruaceira da Guilda/
    QuestInactive 2017
    QuestInactive 2018
    QuestInactive 2022
    QuestInactive 2023
    QuestInactive 2024
    QuestInactive 2026
    call {
        #do talknpc 363 122 c r0 r0 r0 r2 r3 r1 r3 r2 r1 r0 r1 c c c #Arruaceira da Guilda
        do talk $.NpcNearLastBinId
        do talk resp 0
        do talk resp 0
        do talk resp 0
        do talk resp 2
        do talk resp 3
        do talk resp 1
        do talk resp 3
        do talk resp 2
        do talk resp 1
        do talk resp 0
        do talk resp 1
    }
}

#2017#Mudança de Classe: Arruaceiro#SG_FEEL#QUE_NOIMAGE#
#Você passou no primeiro teste para se tornar um Arruaceiro. Smithrato cuidará do próximo teste. #
#Fale com Smithrato #
automacro virarArruaceiro_etapa2_FalarComSmith {
    JobID $parametrosClasses{idC1}, $parametrosClasses{idBC1}
    QuestActive 2017
    exclusive 1
    call {
        do move in_rogue &rand(370,373) &rand(20,24)
        do talk &npc ( 376 23 ) #Smith
    }
}

#2018#Mudança de Classe: Arruaceiro#SG_FEEL#QUE_NOIMAGE#
#Você deve pagar uma taxa de registro para se tornar Arruaceiro. Vou lhe dizer os itens que você precisa trazer e o quanto você precisa pagar de taxa. #
#10.000 zenys, 10 Ossos, 6 Ervas Azuis, 10 Unhas Apodrecidas e 10 Mandíbulas Horrendas. #
automacro virarArruaceiro_etapa3_coletarItens {
    JobID $parametrosClasses{idC1}, $parametrosClasses{idBC1}
    QuestActive 2018
    exclusive 1
    ConfigKeyNot questArruaceiro peguei
    timeout 100
    call  {
        do iconf 510 7 1 0 #ervaAzul
        do iconf 957 10 1 0 #unhaApodrecida
        do iconf 932 10 1 0 #osso
        do iconf 958 10 1 0 #mandibula
        $qtdErvaAzul       = &invamount (510)
        $qtdUnha           = &invamount (957)
        $qtdOsso           = &invamount (932)
        $qtdMandibula      = &invamount (958)

        if ( $qtdErvaAzul < 6 ) { #primeiro a coletar: Erva Azul
            [
            do conf lockMap cmd_fild02
            do mconf 1266 0 0 0
            do mconf 1073 0 0 0
            do mconf 1254 0 0 0
            do mconf 1067 0 0 0
            do mconf 1074 0 0 0
            do mconf 1391 0 0 0
            do conf attackAuto_inLockOnly 1
            call voltarAtacar
            log =================================
            log Estou coletando ERVA AZUL pra
            log quest de arruaceiro
            log =================================
            ]

        } elsif ( $qtdErvaAzul >= 6 && $qtdUnha < 10 ) { 
            #se ja tiver Erva Azul, vai coletar: Unha Apodrecida
            [
            do conf lockMap pay_dun00
            do mconf 1005 0 0 0
            do mconf 1031 0 0 0
            do mconf 1078 0 0 0
            do mconf 1084 0 0 0
            do conf attackAuto_inLockOnly 1
            call voltarAtacar
            log ================================
            log Estou coletando UNHA APODRECIDA
            log pra quest de arruaceiro
            log ================================
            ]

        } elsif ( $qtdErvaAzul >= 6 && $qtdUnha >= 10 && $qtdOsso < 10 ) { 
            #se ja tiver Erva Azul e Unha Apodrecida, vai coletar: Osso
            [
            do conf lockMap pay_dun01
            do mconf 1111 0 0 0
            do mconf 1116 0 0 0
            do mconf 1084 0 0 0
            do mconf 1078 0 0 0
            do conf attackAuto_inLockOnly 1
            do conf route_randomWalk 1
            call voltarAtacar
            log ==============================
            log Estou coletando OSSO para
            log a quest de arruaceiro
            log ==============================
            ]

        } elsif ( $qtdErvaAzul >= 6 && $qtdUnha >= 10 && $qtdOsso >= 10 && $qtdMandibula < 10 ) {
            #se tiver Erva Azul, Unha Apodrecida e Osso, vai coletar: Mandíbula Horrenda
            [
            do conf lockMap pay_dun00
            do mconf 1005 0 0 0
            do mconf 1031 1 0 0
            do mconf 1078 0 0 0
            do mconf 1084 0 0 0
            do mconf 1076 0 0 0
            do conf attackAuto_inLockOnly 1
            do conf route_randomWalk 1
            call voltarAtacar
            log ==============================================
            log Estou coletando MANDIBULA pra quest de arruaceiro
            log Recomendado comprar esse item em vez de dropar
            log Tempo pra dropar todas as mandíbulas: 12 horas
            log ==============================================
            ]

        } elsif ( $qtdErvaAzul >= 6 && $qtdUnha >= 10 && $qtdOsso >= 10 && $qtdMandibula >= 10 ) {
            # se tiver todos os itens, ele vai ir pro npc entregar
            do conf -f questArruaceiro peguei
            [
            log ==============================
            log PEGUEI TODOS OS ITENS!!!
            log ==============================
            ]
        }
    }
}

#2018#Mudança de Classe: Arruaceiro#SG_FEEL#QUE_NOIMAGE#
#Você deve pagar uma taxa de registro para se tornar Arruaceiro. Vou lhe dizer os itens que você precisa trazer e o quanto você precisa pagar de taxa. #
#10.000 zenys, 10 Ossos, 6 Ervas Azuis, 10 Unhas Apodrecidas e 10 Mandíbulas Horrendas. #
automacro virarArruaceiro_etapa3_tenhoOsItensbugged {
    ConfigKey questArruaceiro peguei
    QuestActive 2018
    Zeny < 10000
    exclusive 1
    timeout 60
    call {
        [
        log por algum motivo, o bot não tem nem os 10k de zeny pra fazer a quest
        log tentando resolver isso
        log Se essa mensagem aparecer repetidas vezes, seu bot nao tem 
        log zeny suficiente pra fazer a quest, logue manualmente nele
        log e passa pelo menos 20k de zeny 
        ]
        do autosell
    }
}

automacro virarArruaceiro_etapa3_tenhoOsItensbugged2 {
    InInventory "Erva Azul"          >= 6
    InInventory "Unha Apodrecida"    >= 10
    InInventory "Osso"               >= 10
    InInventory "Mandíbula Horrenda" >= 10
    QuestActive 2018
    ConfigKeyNot questArruaceiro peguei
    exclusive 1
    call {
        [
        log ===================================
        log = TENHO TODOS OS ITEMS DA QUEST!!!!
        log ===================================
        ]
        do conf -f questArruaceiro peguei
    }
}

#2018#Mudança de Classe: Arruaceiro#SG_FEEL#QUE_NOIMAGE#
#Você deve pagar uma taxa de registro para se tornar Arruaceiro. Vou lhe dizer os itens que você precisa trazer e o quanto você precisa pagar de taxa. #
#10.000 zenys, 10 Ossos, 6 Ervas Azuis, 10 Unhas Apodrecidas e 10 Mandíbulas Horrendas. #
automacro virarArruaceiro_etapa3_tenhoOsItensIrProNpc {
    ConfigKey questArruaceiro peguei
    QuestActive 2018
    Zeny > 9999
    NpcNotNear /Smith/
    exclusive 1
    call {
        log Vamos No NPC já temos os Itens...
        call pararDeAtacar
        do conf lockMap none
        do conf attackAuto_inLockOnly 0
        do mconf 1266 1 0 0
        do mconf 1073 1 0 0
        do mconf 1254 1 0 0
        do mconf 1067 1 0 0
        do mconf 1074 1 0 0
        do mconf 1391 1 0 0
        do mconf 1005 1 0 0
        do mconf 1031 1 0 0
        do mconf 1078 1 0 0
        do mconf 1084 1 0 0
        do mconf 1076 1 0 0
        do move in_rogue &rand(370,373) &rand(20,24)
    }
}

#2018#Mudança de Classe: Arruaceiro#SG_FEEL#QUE_NOIMAGE#
#Você deve pagar uma taxa de registro para se tornar Arruaceiro. Vou lhe dizer os itens que você precisa trazer e o quanto você precisa pagar de taxa. #
#10.000 zenys, 10 Ossos, 6 Ervas Azuis, 10 Unhas Apodrecidas e 10 Mandíbulas Horrendas. #
automacro virarArruaceiro_etapa3_tenhoOsItens {
    ConfigKey questArruaceiro peguei
    NpcNear /Smith/
    Zeny > 9999
    QuestActive 2018
    exclusive 1
    call {
        do conf lockMap none
        do conf sitAuto_hp_upper 80
        call pararDeAtacar
        do talk $.NpcNearLastBinId #Smith
        do talk $.NpcNearLastBinId #Smith
        do talk $.NpcNearLastBinId #Smith
    }
}

#2022#Mudança de Classe: Arruaceiro#SG_FEEL#QUE_NOIMAGE#
#Vá visitar Aragham Jr., que vive ao sul da Fortaleza de Saint Darmain. Essa área encontra-se ao leste, a um campo de distância daqui. A senha é: ^0000FF'Aragham nunca colecionou itens de aprimoramento.'^000000#
#Fale com Aragham Jr. #
#2023#Mudança de Classe: Arruaceiro#SG_FEEL#QUE_NOIMAGE#
#Vá visitar Antonio Jr., que vive perto da praia de Kokomo, em Comodo. A senha é: ^0000FF'Antonio não gosta de destruir itens de aprimoramento.'^000000#
#Fale com Antonio Jr. #
#2024#Mudança de Classe: Arruaceiro#SG_FEEL#QUE_NOIMAGE#
#Vá visitar Holgren Jr., que está no campo ao sul da Fortaleza de Saint Darmain, no caminho para Morroc. Ele vai lhe informar qual é o teste para se tornar Arruaceiro. A senha é: ^0000FF'Meu pai nunca colecionou itens de aprimoramento.'^000000#
#Fale com Holgren Jr. #
automacro virarArruaceiro_etapa4 {
    JobID $parametrosClasses{idC1}, $parametrosClasses{idBC1}
    exclusive 1
    CurrentHP >= 80%
    priority 5 #prioridade baixa
    delay 5
    QuestActive 2022, 2023, 2024
    call {
        if ($.map = in_rogue && $.pos ~ 169 34, 246 25, 164 106) {
            [
            log ==================================
            log essa macro está se ativando no momento errado
            log reporte esse bug ao criador da macro
            log ==================================
            ]
            stop
        }
        do conf lockMap none
        do stand
        do conf attackAuto -1
        log sua posição atual é: $.map $.pos
        switch ($.QuestActiveLastID) {
            case (= 2022) { #opção 1
                do conf -f questArruaceiro 1
                call irAteLocal_questArruaceiro "cmd_fild09" "107 195" "1" "2" "1" "0" #local e respostas apropriadas
            }
            case (= 2023) { #opção 2
                do conf -f questArruaceiro 2
                call irAteLocal_questArruaceiro "cmd_fild04" "304 180" "2" "1" "1" "2" #local e respostas apropriadas
            }
            case (= 2024) { #opção 3
                do conf -f questArruaceiro 3
                call irAteLocal_questArruaceiro "cmd_fild09" "335 143" "0" "2" "4" "0" #local e respostas apropriadas
            }
        }
    }
}

macro irAteLocal_questArruaceiro {
    [
    log ================================
    log =Mapa pra qual está se movendo: '$.param[0] $.param[1]'
    log =Sequência de conversação: 'resp $.param[2], resp $.param[3], resp $.param[4], resp $.param[5]'
    log ================================
    ]
    ## $.param[0] tem como valor cidade
    ## $.param[1] tem como valor as coordenadas
    ## $.param[2] até $.param[5] tem como valor as respostas corretas pra entrar na casa

    if ($.pos = $.param[1]) {
        do north
        do west
    }

    do move $.param[0] $.param[1]
    do talk resp $.param[2]
    do talk resp $.param[3]
    do talk resp $.param[4]
    do talk resp $.param[5]
    set exclusive 0
    pause 5
}

automacro virarArruaceiro_etapa5_DentroDaCasa {
    IsInMapAndCoordinate in_rogue 169 34, in_rogue 246 25, in_rogue 164 106
    exclusive 1
    priority -5
    call {
        switch ($.pos) {
            case (= 169 34) {
                do talknpc 160 34 c r0 c
            }
            case (= 246 25) {
                do move in_rogue 244 33
                do talknpc 244 39 c r0 c
            }
            case (= 164 106) {
                do move in_rogue 172 108
                do talknpc 177 109 c r0 c
            }
        }
    }
}

automacro virarArruaceiro_etapa6_labirinto {
    exclusive 1
    IsInMapAndCoordinate in_rogue 15 105
    macro_delay 0.5
    call {
        #ahhhh o labirinto.... o bixin vai morrer algumas vezes aqui viu... ou não kkkk
        do conf attackAuto -1
        do conf itemsTakeAuto 0
        do conf lockMap none
        log ================================
        log Iniciando Labirinto
        log ================================
        do move 23 105
        do move 23 334
        #preguiça de fazer o resto das coordenadas específicas
        do move in_rogue 359 117
    }
}

#2026#Mudança de Classe: Arruaceiro#SG_FEEL#QUE_NOIMAGE#
#Você só precisa andar até a Guilda dos Arruaceiros por um túnel subterrâneo. Um teste simples, não é? Mas não posso garantir que seja totalmente seguro. #
#Atravesse o túnel subterrâneo até a Guilda dos Arruaceiros. #
automacro virarArruaceiro_etapa6_morreuNoLabirinto_hpAlto {
    QuestActive 2026
    ConfigKeyNot questArruaceiro none
    NotInMap in_rogue
    CurrentHP >= 80%
    exclusive 1
    call {
        do stand
        [
        log ==================================================
        log Já esou com hp alto, vou retentar o labirinto
        log ==================================================
        ]
        do conf lockMap none
        log a opção de caminho é a &config(questArruaceiro)
        # se vc tiver morrido no labirindo, essa macro que vai fazer voce ir la tentar denovo
        # vai pegar qual o caminho certo e seguir ele
        switch ( &config(questArruaceiro) ) {
            case (= 1) call irAteLocal_questArruaceiro "cmd_fild09" "107 195" "1" "2" "1" "0"  #local e respostas apropriadas
            case (= 2) call irAteLocal_questArruaceiro "cmd_fild04" "304 180" "2" "1" "1" "2"  #local e respostas apropriadas
            case (= 3) call irAteLocal_questArruaceiro "cmd_fild09" "335 143" "0" "2" "4" "0"  #local e respostas apropriadas
            else {
                [
                log ================================
                log =a macro deveria ter escolhido um caminho,
                log =mas não conseguiu, isso é um bug
                log ================================
                ]
                stop
            }
        }
        log Indo até o local &config(questArruaceiro)
    }
}

#2026#Mudança de Classe: Arruaceiro#SG_FEEL#QUE_NOIMAGE#
#Você só precisa andar até a Guilda dos Arruaceiros por um túnel subterrâneo. Um teste simples, não é? Mas não posso garantir que seja totalmente seguro. #
#Atravesse o túnel subterrâneo até a Guilda dos Arruaceiros. #
automacro virarArruaceiro_etapa6_morreuNoLabirinto_hpBaixo {
    QuestActive 2026
    NotInMap in_rogue
    CurrentHP < 80%
    exclusive 1
    timeout 60
    call {
        [
        log ====================================
        log MORRI TENTANDO PASSAR PELO LABIRINTO
        log ESPERANDO HP FICAR ACIMA DE 80%
        log HP ATUAL: $.CurrentHPLastPercent%
        log ====================================
        ]
        do sit
        if ( &config (sitAuto_hp_upper) != 80 ) {
        do conf sitAuto_hp_lower 20
        do conf sitAuto_hp_upper 80
        }
    }
}

#2026#Mudança de Classe: Arruaceiro#SG_FEEL#QUE_NOIMAGE#
#Você só precisa andar até a Guilda dos Arruaceiros por um túnel subterrâneo. Um teste simples, não é? Mas não posso garantir que seja totalmente seguro. #
#Atravesse o túnel subterrâneo até a Guilda dos Arruaceiros. #
automacro virarArruaceiro_etapaFinal {
    #IsInMapAndCoordinate in_rogue 359 117
    NpcNear /Marybell/
    InMap in_rogue
    QuestActive 2026
    exclusive 1
    call {
        [
        log ===========================
        log PASSEI PELO LABIRINTO!!!!
        log ===========================
        ]
        do move in_rogue 369 119
        do talknpc 363 122 c c c
        do conf itemsTakeAuto 1
    }
}

#2026#Mudança de Classe: Arruaceiro#SG_FEEL#QUE_NOIMAGE#
#Você só precisa andar até a Guilda dos Arruaceiros por um túnel subterrâneo. Um teste simples, não é? Mas não posso garantir que seja totalmente seguro. #
#Atravesse o túnel subterrâneo até a Guilda dos Arruaceiros. #
automacro virarArruaceiro_etapaFinal_Alternativo {
    #IsInMapAndCoordinate in_rogue 378 113
    NpcNear /Homem Assustador/
    InMap in_rogue
    QuestActive 2026
    exclusive 1
    call {
        [
        log ===========================
        log PASSEI PELO LABIRINTO!!!!
        log ===========================
        ]
        do move in_rogue 369 119
        do talknpc 363 122 c c c
        do conf itemsTakeAuto 1
    }
}

automacro jaSouArruaceiro {
    JobID $parametrosClasses{idC2}, $parametrosClasses{idBC2}
    ConfigKeyNot questArruaceiro none
    exclusive 1
    call {
        do conf teleportAuto_MaxDmg 1000
        do iconf Erva Azul 0 1 0
        do iconf Mandíbula Horrenda 0 0 1
        do iconf Osso 0 0 1
        do iconf Unha Apodrecida 0 0 1
        $check = pegarIndiceDoEquipamentoPeloId("robe", 2560) #Capa Valhalla
        if ($check != -1) do eq $check
        $check = pegarIndiceDoEquipamentoPeloId("topHead", 5583) #Chapeu valhalla
        if ($check != -1) do eq $check
        call pararDeAtacar
        do conf questArruaceiro none
    }
}
#
#
#
# FIM DA QUEST PRA VIRAR ARRUACEIRO
#

