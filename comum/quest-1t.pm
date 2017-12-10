automacro virandoClasse1tBugged {
	JobLevel = 10
	JobID 161 #aprendiz T.
	InMapRegex /^(?!new_\d-\d)$/
	SkillLevel NV_BASIC != 9
	exclusive 1
	call {
		$pontos = $.SkillLevelLastLevel
		log As Habilidades básicas nao foram distribuídas!!!
		log A skill ta lvl $.SkillLevelLastLevel
		log Mudando isso
		while ($pontos < 9 ) {
			do skills add NV_BASIC
			$pontos++
		}
	}
}

automacro virandoClasse1t {
	InMap $paramsQuestClasse1{mapa}
	JobID 161,4001 #Aprendiz
	JobLevel 10
	SkillLevel NV_BASIC = 9
	exclusive 1
	call {
		# $virarclasse1mapa tem como valor o mapa em vc vira classe 1
		# $virarclasse1coordenadanpc contem as coordenadas do npc
		# $virarclasse1sequenciadeconversa tem como valor a sequencia de conversação correta
		# $idequipiniciante tem como valor a id da arma que vc recebe quando vira classe 1
		do conf -f virandoClasse1T true
		
		do move $paramsQuestClasse1t{mapa} $paramsQuestClasse1t{npc} &rand(1,5)
		do talknpc $paramsQuestClasse1t{npc} $paramsQuestClasse1t{sequenciaConversa}
		$check = GetIndexAndEquipped("rightHand", "$paramsQuestClasse1t{equipeIniciante}")
		if ($check != -1) do eq $check
	}
}

automacro jaSouClasse1t {
	JobID $paramsClasse{idC2T}
	ConfigKey virandoClasse1T true
	exclusive 1
	call {
		do iconf 2393 0 0 0 #Tunica de Iniciante
		do iconf $paramsQuestClasse1{equipeIniciante} 0 0 0
		$check = GetIndexAndEquipped("armor", 2393) #Tunica de Iniciante
		if ($check != -1) do eq $check
		$check = GetIndexAndEquipped("rightHand", "$paramsQuestClasse1{equipeIniciante}")
		if ($check != -1) do eq $check
		do conf virandoClasse1T none
		call atualizarBuild
	}
}
