automacro init {
	timeout 300 #atualiza as variáveis a cada 5 minutos
	priority -999 #pioridade altíssmia, sempre vai ser a primeira a executar
	exclusive 1
	BaseLevel > 0
	call {
		# Configurações de Ids de classe
		
		# Esse sub gera a hash %paramsClasses com as seguintes keys:
		# paramsClasses{idC1} 
		# paramsClasses{idC2} 
		# paramsClasses{idC1T}
		# paramsClasses{idC2T}
		# paramsClasses{idC3} 
		initParamsClasses()

		# Configurações Gerais de Build
		
		# Esse sub gera as hash %configsBuild e %mapa com as seguintes keys:
		# $configsBuild{skillsAprendiz}
		# $configsBuild{skillsClasse1}
		# $configsBuild{skillsClasse2}
		# $configsBuild{skillsClasse1T}
		# $configsBuild{skillsClasse2T}
		# $configsBuild{skillsClasse3}
		# $configsBuild{statsPadrao}
		# $mapa{lockMap}
		# $mapa{saveMap}
		configurarBuild()

		# Configurações Quests
		
		# Esse sub gera a hash %paramsQuestEden com as seguintes keys:
		# $paramsQuestEden{armaLevel26e40}
		# $paramsQuestEden{armaLevel60}
		initParamsQuestEden()
		
		# Esse sub gera a hash %paramsQuestClasse1 com as seguintes keys:
		# $paramsQuestClasse1{nomeClasse}
		# $paramsQuestClasse1{npc}
		# $paramsQuestClasse1{mapa}
		# $paramsQuestClasse1{precisaMover}
		# $paramsQuestClasse1{sequenciaConversa}
		# $paramsQuestClasse1{equipeIniciante}		
		initParamsQuestClasse1()
		
		# Esse sub gera a hash %paramsQuestClasse1T com as seguintes keys:
		# $paramsQuestClasse1T{nomeClasse}
		# $paramsQuestClasse1T{npc}
		# $paramsQuestClasse1T{mapa}
		# $paramsQuestClasse1T{sequenciaConversa}
		# $paramsQuestClasse1T{equipeIniciante}
		initParamsQuestClasse1T()
		
		# Esse sub configura os itens da quest de classe 2 (para não vender nem guardar)
		initParamsQuestClasse2()
		
		# Esse sub gera a hash %paramsQuestClasse2T com a seguinte key:
		# $paramsQuestClasse2T{npc}
		initParamsQuestClasse2T()
		
		# Esse sub por enquanto nao gera nada, porque ainda não foi implementado
		initParamsQuestClasse3()
	}
}

automacro atualizadorBuild {
	BaseLevel > 0
	priority -998 #sempre a segunda a executar
	timeout 300 #atualiza as variáveis a cada 5 minutos
	exclusive 1
	call {
		#parte feita por vitorsilveiro
		$idClasseAtual = pegarID() #sub se encontra no arquivo utilidades.pm
		if (&config(skillsAddAuto) != 1) do conf skillsAddAuto 1
		if (&config(statsAddAuto_list) != $configsBuild{statsPadrao}) do conf statsAddAuto_list $configsBuild{statsPadrao}
		if (&config(statsAddAuto) != 1) do conf statsAddAuto 1
		if (&config(statsAddAuto_dontUseBonus) != 1) do conf statsAddAuto_dontUseBonus 1
		
		xConfConfiguratedOrNot()  #sub se encontra no arquivo utilidades.pm
		
		switch ($idClasseAtual){
			case (~ 0, 4001) { #Aprendiz / Aprendiz T.
				if (&config(skillsAddAuto_list) != $configsBuild{skillsAprendiz}) do conf skillsAddAuto_list $configsBuild{skillsAprendiz}
			}
			case (== $paramsClasses{idC1}) { #Classes 1
				if (&config(skillsAddAuto_list) != $configsBuild{skillsClasse1})  do conf skillsAddAuto_list $configsBuild{skillsClasse1}
			}
			case (== $paramsClasses{idC2}) { #Classes 2
				if (&config(skillsAddAuto_list) =! $configsBuild{skillsClasse2})  do conf skillsAddAuto_list $configsBuild{skillsClasse2}
			}
			case (== $paramsClasses{idC1T}) { #Classes 1T
				if (&config(skillsAddAuto_list) =! $configsBuild{skillsClasse1T}) do conf skillsAddAuto_list $configsBuild{skillsClasse1T}
			}
			case (== $paramsClasses{idC2T}) { #Classes 2T
				if (&config(skillsAddAuto_list) =! $configsBuild{skillsClasse2T}) do conf skillsAddAuto_list $configsBuild{skillsClasse2T}
			}
			case (== $paramsClasses{idC3}) { #Classes 3
				if (&config(skillsAddAuto_list) =! $configsBuild{skillsClasse3})  do conf skillsAddAuto_list $configsBuild{skillsClasse3}
			}
			else {
				do eval Log::error "Nao foi possivel definir qual a sua classe.\n";
			}
		}
	}
}

