automacro inicializar {
    run-once 1
    priority -999 #pioridade altíssmia, sempre vai ser a primeira a executar
    exclusive 1
    BaseLevel > 0
    call {
        # Carregando Plugins necessários
        xConfConfiguratedOrNot() 
        BetterShopperConfiguratedOrNot()
        
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
        if (pegarID() == parametrosClasses{idC1} || pegarID() == 0) {
            inicializarParametrosQuestClasse2(1) #representa classe 1, o momento que queremos que configure isso
            #aprendiz também pois essa sub só é executada uma vez, se você fazer uma classe 2 num dia só ele não guarda os itens
        } else {
            inicializarParametrosQuestClasse2(-1) #qualquer outro número serve, contanto que não seja 1
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

        if (&config(questc2_implementada) != true && pegarID() = $parametrosQuestClasse1{idC1}) {
            [
            log =========================================================
            log   AVISO!
            log   ------
            log Este script para classe escolhida ainda está incompleto.
            log Portanto haverá um grande número de bugs e possivelmente
            log não fará a quest da classe 2.
            log Ao continuar você está ciente de que essa macro não fará
            log tudo por você.
            log ==========================================================
            ]
        }
        
    }
}

automacro atualizadorBuild {
    BaseLevel > 0
    priority -998 #sempre a segunda a executar
    timeout 300 #atualiza as variáveis a cada 5 minutos
    exclusive 1
    call atualizarBuild
}

macro atualizarBuild {

    #parte feita por vitorsilveiro
    $idClasseAtual = pegarID() #sub se encontra no arquivo utilidades.pm
    if (&config(skillsAddAuto) != 1) do conf skillsAddAuto 1
    if ($idClasseAtual == 0 || $idClasseAtual == 4023 || $idClasseAtual == $parametrosClasses{idC1} || $idClasseAtual == $parametrosClasses{idBC1} || $idClasseAtual == $parametrosClasses{idC2} || $idClasseAtual == $parametrosClasses{idBC2} || $idClasseAtual == $parametrosClasses{idC2Alt} || $idClasseAtual == $parametrosClasses{idBC2Alt} ) {
        if (&config(statsAddAuto_list) != $configsBuild{statsPadrao}) do conf statsAddAuto_list $configsBuild{statsPadrao}
    } else {
        if (&config(statsAddAuto_list) != $configsBuild{statsPadraoTransclasse}) do conf statsAddAuto_list $configsBuild{statsPadraoTransclasse}
    }
    if (&config(statsAddAuto) != 1) do conf statsAddAuto 1
    if (&config(statsAddAuto_dontUseBonus) != 1) do conf statsAddAuto_dontUseBonus 1
    
    #sub 'extrairMapasDeUp' pega o mapa de up e o saveMap correto dependendo do lvl atual
    # $mapa{lockMap}
    # $mapa{saveMap}
    extrairMapasDeUp("$.lvl")
    
    switch ($idClasseAtual) {
        case (~ 0, 161, 4001, 4023) { #Aprendiz / Aprendiz T. / Baby Aprendiz
            if (&config(skillsAddAuto_list) != $configsBuild{skillsAprendiz}) do conf skillsAddAuto_list $configsBuild{skillsAprendiz}
        }
        case (~ $parametrosClasses{idC1}, $parametrosClasses{idBC1}) { #Classes 1
            if (&config(skillsAddAuto_list) != $configsBuild{skillsClasse1})  do conf skillsAddAuto_list $configsBuild{skillsClasse1}
        }
        case (~ $parametrosClasses{idC2}, $parametrosClasses{idC2Alt}, $parametrosClasses{idBC2}, $parametrosClasses{idBC2Alt}) { #Classes 2
            if (&config(skillsAddAuto_list) != $configsBuild{skillsClasse2})  do conf skillsAddAuto_list $configsBuild{skillsClasse2}
        }
        case (== $parametrosClasses{idC1T}) { #Classes 1T
            if (&config(skillsAddAuto_list) != $configsBuild{skillsClasse1T}) do conf skillsAddAuto_list $configsBuild{skillsClasse1T}
        }
        case (~ $parametrosClasses{idC2T}, $parametrosClasses{idC2TAlt} ) { #Classes 2T
            if (&config(skillsAddAuto_list) != $configsBuild{skillsClasse2T}) do conf skillsAddAuto_list $configsBuild{skillsClasse2T}
        }
        case (~ $parametrosClasses{idC3}) { #Classes 3
            if (&config(skillsAddAuto_list) != $configsBuild{skillsClasse3})  do conf skillsAddAuto_list $configsBuild{skillsClasse3}
        }
        else {
            do eval Log::error "Nao foi possivel definir qual a sua classe.\n";
            do eval Log::error "Valor encontrado: $idClasseAtual\n";
        }
    }
}

