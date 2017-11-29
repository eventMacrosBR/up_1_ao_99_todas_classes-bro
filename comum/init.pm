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
			case (== 0) { #Aprendiz
				if(&config(skillsAddAuto_list) != $configsBuild{skillsAprendiz}) do conf skillsAddAuto_list $configsBuild{skillsAprendiz}
			}
			case (~ 1,2,3,4,5,6) { #Classes 1
				if(&config(skillsAddAuto_list) != $configsBuild{skillsClasse1}) do conf skillsAddAuto_list $configsBuild{skillsClasse1}
			}
			case (~ 7,8,9,10,11,12,13,14,15,16,17,18,19,20,21) { #Classes 2
				if(&config(skillsAddAuto_list) =! $configsBuild{skillsClasse2}) do conf skillsAddAuto_list $configsBuild{skillsClasse2}
			}
			else {
				do eval Log::error "Nao foi possivel definir qual a sua classe.\n" . "Talvez seja transclasse ou classe 3?\n";
			}
		}
	}
}

