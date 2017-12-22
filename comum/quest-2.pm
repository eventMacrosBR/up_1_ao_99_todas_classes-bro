#Parte comum em todas quests de classes
automacro virarClasse2Inicio_Bugged {
	FreeSkillPoints > 0
	timeout 30
	JobLevel = 50
	JobID $paramsClasses{idC1}
	exclusive 1
	call {
		[
		log =============================================
		log = Estou pronto para virar claase2, porém    =
		log =     os pontos não estão distribuídos...   =
		log =            Vamos resolver isso!		=
		log =============================================
		]
		do conf skillsAddAuto 1
		do conf skillsAddAuto_list $configsBuild{skillsClasse1}
		[
		log ================================================================
		log = Se isso estiver aparecendo repetidamente, a macro tem um bug =
		log ================================================================
		]
	}
}

automacro virarClasse2Inicio {
	JobLevel = 50
	JobID $paramsClasses{idC1}
	ConfigKeyNot virarClasse2 true
	exclusive 1
	ConfigKey questc2_implementada true
	call {
		do conf -f virarClasse2 true
	}
}

automacro jsSouClasse2 {
	JobID $paramsClasses{idC2}, $paramsClasses{idC2Alt}
	ConfigKey virarClasse2 true
	exclusive 1
	call {
		[
		log ===================
		log = Já sou classe 2 =
		log ===================
		]
		do conf virarClasse2 none
		call atualizarBuild
	}
}

automacro jsSouClasse2NaoAutomatico {
	JobID $paramsClasses{idC2} , $paramsClasses{idC2Alt}
	ConfigKey esperarFazerQuest true
	exclusive 1
	call {
		[
		log =================================================
		log = Já sou classe 2, pois fiz a quest manualmente =
		log =================================================
		]
		do conf esperarFazerQuest none
		call atualizarBuild
	}
}

 
