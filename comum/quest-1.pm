automacro virandoClasse1Bugged {
	JobLevel = 10
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

automacro virandoClasse1 {
	InMap $paramsQuestClasse1{mapa}
	JobID 0 #Aprendiz
	JobLevel 10
	SkillLevel NV_BASIC = 9
	exclusive 1
	call {
		# $virarclasse1precisamover tem como valor sim ou nao
		# $virarclasse1mapa tem como valor o mapa em vc vira classe 1
		# $virarclasse1coordenadanpc contem as coordenadas do npc
		# $virarclasse1sequenciadeconversa tem como valor a sequencia de conversação correta
		# $idequipiniciante tem como valor a id da arma que vc recebe quando vira classe 1
		
		if ($paramsQuestClasse1{precisaMover} = sim) {
			do move $paramsQuestClasse1{mapa} $paramsQuestClasse1{npc} &rand(1,5)
		}
		do talknpc $paramsQuestClasse1{npc}$paramsQuestClasse1{sequenciaConversa}
		$check = GetIndexAndEquipped("rightHand", "$paramsQuestClasse1{equipeIniciante}")
		if ($check != -1) do eq $check
	}
}

automacro jaSouClasse1 {
	JobIDNot 0 #aprendiz
	InInventoryID 2414 = 1 #sandalias de aprendiz
	InInventoryID 5055 = 1 #chapeu de ovo de aprendiz
	exclusive 1
	call {
		do pconf 1243 0 #1243#Adaga_do_Aprendiz#
		do pconf 2112 0 #2112#Vembrassa_do_Aprendiz#
		do pconf 2414 0 #2414#Sandálias_do_Aprendiz#
		do pconf 2510 0 #2510#Capuz_do_Aprendiz#
		do pconf 2532 0 #2352#Traje_do_Aprendiz#
		do pconf 5055 0 #5055#Chapéu_de_Ovo_do_Aprendiz#
		do iconf 2393 0 0 0 #Tunica de Iniciante
		do iconf $paramsQuestClasse1{equipeIniciante} 0 0 0
		$check = GetIndexAndEquipped("rightHand", 1243) #Adaga_do_Aprendiz#
		if ($check != -1) do drop $check
		$check = GetIndexAndEquipped("leftHand", 2112)#Vembrassa_do_Aprendiz#
		if ($check != -1) do drop $check
		$check = GetIndexAndEquipped("shoes", 2414) #Sandálias_do_Aprendiz#
		if ($check != -1) do drop $check
		$check = GetIndexAndEquipped("robe", 2510) #Capuz_do_Aprendiz#
		if ($check != -1) do drop $check
		$check = GetIndexAndEquipped("armor", 2352) #Chapéu_de_Ovo_do_Aprendiz#
		if ($check != -1) do drop $check
		$check = GetIndexAndEquipped("topHead", 5055) #Chapéu_de_Ovo_do_Aprendiz#
		if ($check != -1) do drop $check
		$check = GetIndexAndEquipped("armor", 2393) #Tunica de Iniciante
		if ($check != -1) do eq $check
		$check = GetIndexAndEquipped("rightHand", "$paramsQuestClasse1{equipeIniciante}")
		if ($check != -1) do eq $check
	}
}
