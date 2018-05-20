automacro inicializar {
    run-once 1
    priority -999 #pioridade altíssmia, sempre vai ser a primeira a executar
    exclusive 1
    BaseLevel > 0
    call {
        # Carregando Plugins necessários
        inicializarPlugins()
        
        # Configurações de Ids de classe
        
        # Esse sub gera a hash %parametrosClasses com as seguintes keys:
        # parametrosClasses{idC1} 
        # parametrosClasses{idC2} 
        # parametrosClasses{idC1T}
        # parametrosClasses{idC2T}
        # parametrosClasses{idC3} 
        inicializarParametrosClasses()

        # Configurações Gerais de Build
        
        # Esse sub gera as hash %configsBuild e %mapa com as seguintes keys:
        # $configsBuild{skillsAprendiz}
        # $configsBuild{skillsClasse1}
        # $configsBuild{skillsClasse2}
        # $configsBuild{skillsClasse1T}
        # $configsBuild{skillsClasse2T}
        # $configsBuild{skillsClasse3}
        # $configsBuild{statsPadrao}
        configurarBuild()

        # Configurações Quests
        
        # Esse sub gera a hash %parametrosQuestEden com as seguintes keys:
        # $parametrosQuestEden{armaLevel26e40}
        # $parametrosQuestEden{armaLevel60}
        inicializarParametrosQuestEden()
        
        # Esse sub gera a hash %parametrosQuestClasse1 com as seguintes keys:
        # $parametrosQuestClasse1{nomeClasse}
        # $parametrosQuestClasse1{npc}
        # $parametrosQuestClasse1{mapa}
        # $parametrosQuestClasse1{precisaMover}
        # $parametrosQuestClasse1{sequenciaConversa}
        # $parametrosQuestClasse1{equipeIniciante}        
        inicializarParametrosQuestClasse1()
        
        # Esse sub gera a hash %parametrosQuestClasse1T com as seguintes keys:
        # $parametrosQuestClasse1T{nomeClasse}
        # $parametrosQuestClasse1T{npc}
        # $parametrosQuestClasse1T{mapa}
        # $parametrosQuestClasse1T{sequenciaConversa}
        # $parametrosQuestClasse1T{equipeIniciante}
        inicializarParametrosQuestClasse1T()
        
        # Esse sub configura os itens da quest de classe 2 (para não vender nem guardar)
        if (pegarID() ~ $parametrosClasses{idC1}, 0, 4023 ) {
            inicializarParametrosQuestClasse2("manter") 
            #Se o personagem for classe 1, então queremos manter os itens da
            #quest de classe 2 no inventário
        } else {
            inicializarParametrosQuestClasse2("guardar") 
            #se NÃO for classe 1, então guarda tudo no armazém
        }
        
        # Esse sub gera a hash %parametrosQuestClasse2T com a seguinte key:
        # $parametrosQuestClasse2T{npc}
        inicializarParametrosQuestClasse2T()
        
        # Esse sub por enquanto nao gera nada, porque ainda não foi implementado
        inicializarParametrosQuestClasse3()

        # Esse sub gera a hash %parametrosQuestClasseRenascer com a seguinte key:
        # $parametrosQuestClasseRenascer{renascer}
        # $parametrosQuestClasseRenascer{amigo}
        inicializarParametrosQuestClasseRenascer()        
    }
}

automacro atualizadorBuild {
    BaseLevel > 0
    priority -998 #sempre a segunda a executar
    timeout 300 #atualiza as variáveis a cada 5 minutos
    exclusive 1
    call atualizarBuild
}

automacro atualizarBuild_mudancaDeNivel {
    SimpleHookEvent base_level_changed, job_level_changed
    exclusive 1
    call atualizarBuild
}

macro atualizarBuild {

    $idClasseAtual = pegarID() #sub se encontra no arquivo utilidades.pm
    do conf skillsAddAuto 1 if (&config(skillsAddAuto) != 1)
    switch ($idClasseAtual) {
        case (~ 0, 4023, $parametrosClasses{idC1}, $parametrosClasses{idBC1}, $parametrosClasses{idC2}, $parametrosClasses{idBC2}, $parametrosClasses{idC2Alt}, $parametrosClasses{idBC2Alt} ) {
            do conf statsAddAuto_list $configsBuild{statsPadrao} if (&config(statsAddAuto_list) != $configsBuild{statsPadrao})
        } 
        case (~ 4001, $parametrosClasses{idC1T}, $parametrosClasses{idC2}, $parametrosClasses{idC2Alt} ) {
            do conf statsAddAuto_list $configsBuild{statsPadraoTransclasse} if (&config(statsAddAuto_list) != $configsBuild{statsPadraoTransclasse})
        }
        case (~ $parametrosClasses{idC3}, $parametrosClasses{idC3Alt}, $parametrosClasses{idBC3}, $parametrosClasses{idBC3Alt} ) {
            do conf statsAddAuto_list $configsBuild{statsPadraoClasse3} if (&config(statsAddAuto_list) != $configsBuild{statsPadraoClasse3})
        }
        else {
            do eval Log::error "Não foi possivel definir qual é a sua classe.\n";
            do eval Log::error "ID encontrado: $idClasseAtual\n";
        }
    }

    do conf statsAddAuto 1 if (&config(statsAddAuto) != 1)
    do conf statsAddAuto_dontUseBonus 1 if (&config(statsAddAuto_dontUseBonus) != 1)
    
    #sub 'extrairMapasDeUp' pega o mapa de up e o saveMap correto dependendo do lvl atual
    # $mapa{lockMap}
    # $mapa{saveMap}
    extrairMapasDeUp("$.lvl")
    
    switch ($idClasseAtual) {
        case (~ 0, 161, 4001, 4023) { #Aprendiz / Aprendiz T. / Baby Aprendiz
            do conf skillsAddAuto_list $configsBuild{skillsAprendiz} if (&config(skillsAddAuto_list) != $configsBuild{skillsAprendiz})
        }
        case (~ $parametrosClasses{idC1}, $parametrosClasses{idBC1}) { #Classes 1
            if ($configsBuild{skillsClasse1}) != 1) { #se existir as skills
                do conf skillsAddAuto_list $configsBuild{skillsClasse1} if (&config(skillsAddAuto_list) != $configsBuild{skillsClasse1})
            } else {
                [
                log ===================================
                log = NÃO EXISTE UMA BUILD DE SKILLS PRONTA PARA A CLASSE 1
                log = SEU BOT NÃO VAI DISTRIBIUR PONTOS DE HABILIDADE
                log = SUGIRO FORTEMENTE CRIAR A SUA PRÓPRIA BUILD
                log ===================================
                ]
            }
        }
        case (~ $parametrosClasses{idC2}, $parametrosClasses{idC2Alt}, $parametrosClasses{idBC2}, $parametrosClasses{idBC2Alt}) { #Classes 2
            if ($configsBuild{skillsClasse2} != '') {
                do conf skillsAddAuto_list $configsBuild{skillsClasse2} if (&config(skillsAddAuto_list) != $configsBuild{skillsClasse2})
            } else {
                [
                log ===================================
                log = NÃO EXISTE UMA BUILD DE SKILLS PRONTA PARA A SUA CLASSE 2
                log = SEU BOT NÃO VAI DISTRIBIUR PONTOS DE HABILIDADE
                log = SUGIRO FORTEMENTE CRIAR A SUA PRÓPRIA BUILD
                log ===================================
                ] 
            }
        }
        case (== $parametrosClasses{idC1T}) { #Classes 1T
            if ($configsBuild{skillsClasse1T} != '') {
                do conf skillsAddAuto_list $configsBuild{skillsClasse1T} if (&config(skillsAddAuto_list) != $configsBuild{skillsClasse1T})
            } else {
                [
                log ===================================
                log = NÃO EXISTE UMA BUILD DE SKILLS PRONTA PARA A SUA CLASSE 1 TRANS
                log = SEU BOT NÃO VAI DISTRIBIUR PONTOS DE HABILIDADE
                log = SUGIRO FORTEMENTE CRIAR A SUA PRÓPRIA BUILD
                log ===================================
                ] 
            }
        }
        case (~ $parametrosClasses{idC2T}, $parametrosClasses{idC2TAlt} ) { #Classes 2T
            if ($configsBuild{skillsClasse2T} != '') {
                do conf skillsAddAuto_list $configsBuild{skillsClasse2T} if (&config(skillsAddAuto_list) != $configsBuild{skillsClasse2T})
            } else {
                [
                log ===================================
                log = NÃO EXISTE UMA BUILD DE SKILLS PRONTA PARA A SUA CLASSE 2 TRANS
                log = SEU BOT NÃO VAI DISTRIBIUR PONTOS DE HABILIDADE
                log = SUGIRO FORTEMENTE CRIAR A SUA PRÓPRIA BUILD
                log ===================================
                ] 
            }
        }
        case (~ $parametrosClasses{idC3}, $parametrosClasses{idC3Alt}, $parametrosClasses{idBC3}, $parametrosClasses{idBC3Alt}) { #Classes 3
            if ($configsBuild{skillsClasse3} != '') {
                do conf skillsAddAuto_list $configsBuild{skillsClasse3} if (&config(skillsAddAuto_list) != $configsBuild{skillsClasse3})
            } else {
                [
                log ===================================
                log = NÃO EXISTE UMA BUILD DE SKILLS PRONTA PARA A SUA CLASSE 3
                log = SEU BOT NÃO VAI DISTRIBIUR PONTOS DE HABILIDADE
                log = SUGIRO FORTEMENTE CRIAR A SUA PRÓPRIA BUILD
                log ===================================
                ] 
            }
        }
        else {
            do eval Log::error "Não foi possivel definir qual é a sua classe.\n";
            do eval Log::error "ID encontrado: $idClasseAtual\n";
        }
        
    }
    if (&config(questc2_implementada) != true && pegarID() = $parametrosQuestClasse1{idC1}) {
        [
        log =========================================================
        log   AVISO!
        log   ------
        log Este script para classe escolhida ainda está incompleto.
        log Portanto haverá um grande número de bugs e 
        log não fará a quest da classe 2.
        log Ao continuar você está ciente de que essa macro não fará
        log tudo por você.
        log ==========================================================
        ]
    }
}

