automacro init{
	timeout 300 #che e atualiza as variáveis a cada 5 minutos
	priority -999 #pioridade altíssmia, sempre vai ser a primeira a executar
	exclusive 1
	call {
        # Configurações de Ids de classe
        initParamsClasses()

        # Configurações Gerais de Build
        configurarBuild()

        # Configurações Quests
        initParamsQuestEden()
        initParamsQuestClasse1()
        initParamsQuestClasse2()
        initParamsQuestClasse1T()
        initParamsQuestClasse2T()
        initParamsQuestClasse3()

    }
}

automacro atualizadorBuild {
	BaseLevel > 0
	priority -998 #sempre a segunda a executar
	run-once 1
	exclusive 1
	call {
		#parte feita por vitorsilveiro
		$idClasseAtual = pegarID()
		if (&config(skillsAddAuto) != 1) do conf skillsAddAuto 1
		if (&config(statsAddAuto_list) != $configsBuild{statsPadrao}) do conf statsAddAuto_list $configsBuild{statsPadrao}
		if (&config(statsAddAuto) != 1) do conf statsAddAuto 1
		if (&config(statsAddAuto_dontUseBonus) != 1) do conf statsAddAuto_dontUseBonus 1
		xConfConfiguratedOrNot()  #instala o plugin xconf
		
		switch ($idClasseAtual){
			case (~ 0, 4001) { #Aprendiz / Aprendiz T.
				if(&config(skillsAddAuto_list) != $configsBuild{skillsAprendiz}) do conf skillsAddAuto_list $configsBuild{skillsAprendiz}
			}
			case (== $paramsClasses{idC1}) { #Classes 1
				if(&config(skillsAddAuto_list) != $configsBuild{skillsClasse1}) do conf skillsAddAuto_list $configsBuild{skillsClasse1}
			}
			case (== $paramsClasses{idC2}) { #Classes 2
				if(&config(skillsAddAuto_list) =! $configsBuild{skillsClasse2}) do conf skillsAddAuto_list $configsBuild{skillsClasse2}
			}
			case (== $paramsClasses{idC1T}) { #Classes 1T
				if(&config(skillsAddAuto_list) =! $configsBuild{skillsClasse1T}) do conf skillsAddAuto_list $configsBuild{skillsClasse1T}
			}
			case (== $paramsClasses{idC2T}) { #Classes 2T
				if(&config(skillsAddAuto_list) =! $configsBuild{skillsClasse2T}) do conf skillsAddAuto_list $configsBuild{skillsClasse2T}
			}
			case (== $paramsClasses{idC3}) { #Classes 3
				if(&config(skillsAddAuto_list) =! $configsBuild{skillsClasse3}) do conf skillsAddAuto_list $configsBuild{skillsClasse3}
			}
			else {
				do eval Log::error "Nao foi possivel definir qual a sua classe.\n";
			}
		}
	}
}

