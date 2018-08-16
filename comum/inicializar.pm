automacro inicializar {
    run-once 1
    priority -998 #pioridade alta, sempre vai ser a segunda a executar
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
        
        # Esse sub gera as hash %configsBuild com as seguintes keys:
        # $configsBuild{skillsAprendiz}
        # $configsBuild{skillsClasse1}
        # $configsBuild{skillsClasse2}
        # $configsBuild{skillsClasse1T}
        # $configsBuild{skillsClasse2T}
        # $configsBuild{skillsClasse3}
        # $configsBuild{statsPadrao}
        %configsBuild = configurarBuild()

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
        %parametrosQuestClasseRenascer = inicializarParametrosQuestClasseRenascer()        
    }
}

automacro atualizarBuild {
    BaseLevel > 0
    priority -997 #sempre a terceira a executar
    timeout 300 #atualiza as variáveis a cada 5 minutos
    exclusive 1
    call atualizarBuild
}

macro atualizarBuild {

    $idClasseAtual = pegarID() #sub se encontra no arquivo utilidades.pm
    call atualizarBuild_atributos
    call atualizarBuild_skills
    
    if (&config(questc2_implementada) != true && pegarID() = $parametrosQuestClasse1{idC1}) {
        [
        do eval Log::warning "=========================================================\n"
        do eval Log::warning "  AVISO!\n"
        do eval Log::warning "  ------\n"
        do eval Log::warning "Este script para classe escolhida ainda está incompleto.\n"
        do eval Log::warning "Portanto haverá um grande número de bugs e \n"
        do eval Log::warning "não fará a quest da classe 2.\n"
        do eval Log::warning "Ao continuar você está ciente de que essa macro não fará\n"
        do eval Log::warning "tudo por você.\n"
        do eval Log::warning "==========================================================\n"
        ]
        pause 4
    }
}

macro atualizarBuild_atributos {
    $classeSemBuildDeAtributos = undef
    do conf statsAddAuto 1 if (&config(statsAddAuto) != 1)
    do conf statsAddAuto_dontUseBonus 1 if (&config(statsAddAuto_dontUseBonus) != 1)
    if ($idClasseAtual ~ 0, 4023, $parametrosClasses{idC1}, $parametrosClasses{idBC1}, $parametrosClasses{idC2}, $parametrosClasses{idBC2}, $parametrosClasses{idC2Alt}, $parametrosClasses{idBC2Alt} ) {
        if ($configsBuild{statsPadrao} != -1) {
            do conf statsAddAuto_list $configsBuild{statsPadrao} if (&config(statsAddAuto_list) != $configsBuild{statsPadrao})
        } else {
            $classeSemBuildDeAtributos = 1
        }
        
    } elsif ($idClasseAtual ~ 4001, $parametrosClasses{idC1T}, $parametrosClasses{idC2T}, $parametrosClasses{idC2TAlt}) {
        if ($configsBuild{statsPadraoTransclasse} != -1) {
            do conf statsAddAuto_list $configsBuild{statsPadraoTransclasse} if (&config(statsAddAuto_list) != $configsBuild{statsPadraoTransclasse})
        } else {
            $classeSemBuildDeAtributos = 1
        }
        
    } elsif ($idClasseAtual ~ $parametrosClasses{idC3}, $parametrosClasses{idC3Alt}, $parametrosClasses{idBC3}, $parametrosClasses{idBC3Alt} ) {
        if ($configsBuild{statsPadraoClasse3} != -1) {
            do conf statsAddAuto_list $configsBuild{statsPadraoClasse3} if (&config(statsAddAuto_list) != $configsBuild{statsPadraoClasse3})
        } else {
            $classeSemBuildDeAtributos = 1
        }
    
    } else {
        [
        log ===================================
        log = ocorreu um erro ao definir a build de atributos padrão para sua classe
        log = caso isso apareça mais de 1 vez, contate os criadores da eventMacro
        log = \$idClasseAtual : "$idClasseAtual"
        log ===================================
        ]
        stop
    }
    
    if ($classeSemBuildDeAtributos = 1) {
        [
        do eval Log::error "===================================\n"
        do eval Log::error "= NÃO EXISTE UMA BUILD DE ATRIBUTOS PRONTA PARA A CLASSE\n"
        do eval Log::error "= SEU BOT NÃO VAI DISTRIBIUR PONTOS DE ATRIBUTOS\n"
        do eval Log::error "= SUGIRO FORTEMENTE CRIAR A SUA PRÓPRIA BUILD\n"
        do eval Log::error "===================================\n"
        ]
        stop
    }

    #se chegar até aqui tudo deu certo
    [
    log ===================================
    log = build de atributos atualizada
    log ===================================
    ]
}

macro atualizarBuild_skills {
    do conf skillsAddAuto 1 if (&config(skillsAddAuto) != 1)
    $classeSemBuild = undef
    
    if ($idClasseAtual ~ 0, 161, 4001, 4023) { #Aprendiz / Aprendiz T. / Baby Aprendiz
        do conf skillsAddAuto_list $configsBuild{skillsAprendiz} if (&config(skillsAddAuto_list) != $configsBuild{skillsAprendiz})
        [
        log ===================================
        log = build de aprendiz configurada
        log ===================================
        ]
    } elsif ($idClasseAtual ~ $parametrosClasses{idC1}, $parametrosClasses{idBC1}) { #Classes 1
        if ($configsBuild{skillsClasse1} != -1) { #se existir as skills
            do conf skillsAddAuto_list $configsBuild{skillsClasse1} if (&config(skillsAddAuto_list) != $configsBuild{skillsClasse1})
            [
            log ===================================
            log = build de skills da classe 1 configurada
            log ===================================
            ]
        } else {
            $classeSemBuild = classe 1
        }
    } elsif ($idClasseAtual ~ $parametrosClasses{idC2}, $parametrosClasses{idC2Alt}, $parametrosClasses{idBC2}, $parametrosClasses{idBC2Alt}) { #Classes 2
        if ($configsBuild{skillsClasse2} != -1) {
            do conf skillsAddAuto_list $configsBuild{skillsClasse2} if (&config(skillsAddAuto_list) != $configsBuild{skillsClasse2})
            [
            log ===================================
            log = build de skills da classe 2 configurada
            log ===================================
            ]
        } else {
            $classeSemBuild = classe 2
        }
    } elsif ($idClasseAtual == $parametrosClasses{idC1T}) { #Classes 1T
        if ($configsBuild{skillsClasse1T} != -1) {
            do conf skillsAddAuto_list $configsBuild{skillsClasse1T} if (&config(skillsAddAuto_list) != $configsBuild{skillsClasse1T})
            [
            log ===================================
            log = build de skills da classe 1 Trans configurada
            log ===================================
            ]
        } else {
            $classeSemBuild = classe 1 Trans
        }
    } elsif ($idClasseAtual ~ $parametrosClasses{idC2T}, $parametrosClasses{idC2TAlt} ) { #Classes 2T
        if ($configsBuild{skillsClasse2T} != -1) {
            do conf skillsAddAuto_list $configsBuild{skillsClasse2T} if (&config(skillsAddAuto_list) != $configsBuild{skillsClasse2T})
            [
            log ===================================
            log = build de skills da classe 2 Trans configurada
            log ===================================
            ]
        } else {
            $classeSemBuild = classe 2 trans
        }
    } elsif ($idClasseAtual ~ $parametrosClasses{idC3}, $parametrosClasses{idC3Alt}, $parametrosClasses{idBC3}, $parametrosClasses{idBC3Alt}) { #Classes 3
        if ($configsBuild{skillsClasse3} != -1) {
            do conf skillsAddAuto_list $configsBuild{skillsClasse3} if (&config(skillsAddAuto_list) != $configsBuild{skillsClasse3})
            [
            log ===================================
            log = build de skills da classe 3 configurada
            log ===================================
            ]
        } else {
            $classeSemBuild = classe 3
        }
    } else {
        do eval Log::error "===================================\n"
        do eval Log::error "Não foi possivel saber qual é a sua classe.\n";
        do eval Log::error "ID encontrado: $idClasseAtual\n";
        do eval Log::error "===================================\n"
        stop
    }
    if (&defined($classeSemBuild) = 1) {
        [
        do eval Log::error "===================================\n"
        do eval Log::error "= NÃO EXISTE UMA BUILD DE SKILLS PRONTA PARA A $classeSemBuild\n"
        do eval Log::error "= SEU BOT NÃO VAI DISTRIBIUR PONTOS DE HABILIDADE\n"
        do eval Log::error "= SUGIRO FORTEMENTE CRIAR A SUA PRÓPRIA BUILD\n"
        do eval Log::error "===================================\n"
        ]
        stop
    }
}


automacro atualizarMapasDeUp_hook {
    SimpleHookEvent base_level_changed, job_level_changed
    exclusive 1
    call atualizarMapasDeUp
}

automacro atualizarMapasDeUp_ACada5Minutos {
    timeout 300
    exclusive 1
    priority -997 #sempre a quarta a executar
    BaseLevel != 99 #se estivermos lvl 99, não precisamos definir mapa de up
    call atualizarMapasDeUp
}

macro atualizarMapasDeUp {
    
    $idClasseAtual = pegarID() #sub se encontra no arquivo utilidades.pm
    
    #sub 'extrairMapasDeUp' pega o mapa de up e o saveMap correto dependendo do lvl atual
    # $mapa{lockMap}
    # $mapa{saveMap}
    if ($idClasseAtual ~ 0, 4023, $parametrosClasses{idC1}, $parametrosClasses{idBC1}, $parametrosClasses{idC2}, $parametrosClasses{idBC2}, $parametrosClasses{idC2Alt}, $parametrosClasses{idBC2Alt} ) {
        %mapa = extrairMapasDeUp("$.lvl", "nao") # "nao" significa que ele não é transclasse
    } elsif ($idClasseAtual ~ 4001, $parametrosClasses{idC1T}, $parametrosClasses{idC2T}, $parametrosClasses{idC2TAlt}) {
        %mapa = extrairMapasDeUp("$.lvl", "sim") # "sim" significa que ele já rebornou e é trans
    } else {
        [
        do eval Log::error "===================================\n"
        do eval Log::error "= ERRO:\n"
        do eval Log::error "= impossível definir locais de up\n"
        do eval Log::error "= contate um dos criadores da macro\n"
        do eval Log::error "= Id encontrada: '$idClasseAtual'\n"
        do eval Log::error "===================================\n"
        ]
        stop
    }
    #futuramente: adicionar uma elsif para caso seja classe 3
    
    if (&exists($mapa{lockMap}) = 0 && $.lvl < 99) {
        [
        do eval Log::error "===================================\n"
        do eval Log::error "= ERRO:\n"
        do eval Log::error "= mapas de up não foram definidos\n"
        do eval Log::error "= significa que seu bot provavelmente nao vai upar\n"
        do eval Log::error "= Contate os criadores da eventMacro\n"
        do eval Log::error "= se vc tiver usando o 'Openkore Premium' do oscar\n"
        do eval Log::error "= peço encarecidamente que vá se fuder\n"
        do eval Log::error "===================================\n"
        ]
        pause 240 #fica travado mesmo, não quero que funcione
        stop
    }
    [
    log ===================================
    log = mapas de up atualizados
    log = vou upar em $mapa{lockMap} e salvar em $mapa{saveMap}
    log ===================================
    ]
}