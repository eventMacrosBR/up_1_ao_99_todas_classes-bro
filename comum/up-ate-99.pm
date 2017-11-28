automacro upAteLv12Aprendiz {
	ConfigKeyNot lockMap pay_fild01
	ConfigKeyNot In_saveMap_sequence true
	JobLevel != 10
	JobID 0
	exclusive 1
	timeout 30
	InMapRegex /^(?!new_\d-\d|moc_prydb1)$/
	call {
		log pelo visto, ainda to no lvl de Classe $JobLevelLast ainda...
		log o que aconteceu?
		log a que ponto chegamos?
		log nuss
		log Tentando resolver isso...
		
		call upar
	}
}

automacro UpClasse1 {
	JobID $paramsClasses{idC1} 
	BaseLevel != 99
	ConfigKeyNot quest_eden em_curso
	ConfigKeyNot quest_eden terminando
	ConfigKeyNot In_saveMap_sequence true
	ConfikKeyNot virarClasse2 true
	ConfigKeyNot lockMap $mapa{lockMap}
	ConfigKeyNot classe none
	JobLevel != 50
	exclusive 1
	priority 20 #baixa prioridade
	timeout 30
    call upar
}

automacro upClasse2 {
	JobID $paramsClasses{idC2} 
	BaseLevel != 99
	ConfigKeyNot quest_eden em_curso
	ConfigKeyNot quest_eden terminando
	ConfigKeyNot In_saveMap_sequence true
	ConfikKeyNot virarClasse2 true
	ConfigKeyNot lockMap $mapa{lockMap}
	ConfigKeyNot classe none
	exclusive 1
	priority 20 #baixa prioridade
	timeout 30
    call upar
}


macro upar {

	#sub 'extrairMapasDeUp' se encontra bem no começo da macro
	#e é lá que vc pode alterar quais mapas ele vai upar
	$configCerta = extrairMapasDeUp("$.lvl")
	@configuracoesUp = &split(':',$configCerta)
	
	$mapa{lockMap} = $configuracoesUp[0]
	$mapa{saveMap} = $configuracoesUp[1]
	
	log \$mapa{lockMap} : $mapa{lockMap}
	log \$mapa{saveMap} : $mapa{saveMap}
	
	if (&config(lockMap) = $mapa{lockMap}) {
		[
		log ================================
		log =Tudo Configurado
		log =Continuarei upando em $mapa{lockMap}
		log ================================
		]
		call voltarAtacar
		stop
	}
	
	#se chegar aqui significa que tem que ser mudado o lockmap e/ou o saveMap
	if (&config(saveMap) = $mapa{city}) {
		do conf lockMap $mapa{lockMap}
		call voltarAtacar
	} else {
		call pararDeAtacar
		call SetSaveIn "$mapa{city}"
	}
}

automacro estouLv99 {
	BaseLevel = 99
	exclusive 1
	timeout 120
	JobID 17 #arruaceiro
	call {
		log CHEGUEI NO LVL 99 FINALMENTE !!!!!!!
		log CARA ISSO LEVOU TEMPO PARA CAR**HO
	}
}

automacro nivelDeClasse50 {
	JobLevel = 50
	JobID $paramsClasses{idC1} 
	exclusive 1
	timeout 20
	NotInMap izlude
	ConfigKeyNot virandoClasse2 true
	call {
		log SEU CHAR JÁ ESTÁ NO NIVEL 50 DE CLASSE
		log FAÇA A QUEST PARA VIRAR CLASSE 2 MANUALMENTE POR FAVOR
		log DEPOIS ABRA O BOT NOVAMENTE
		log ASSIM QUE ELE SE TORNAR UM CLASSE 2, A MACRO VOLTA A UPAR NORMALMENTE
		do conf lockMap none
		call pararDeAtacar
	}
}

automacro nivelDeClasse50EmIzlude {
	InMap izlude
	exclusive 1
	timeout 20
	call {
		log SEU CHAR JÁ ESTÁ NO NIVEL 50 DE CLASSE
		log FAÇA A QUEST PARA VIRAR CLASSE 2 MANUALMENTE
		log DEPOIS ABRA O BOT NOVAMENTE
		log ASSIM QUE ELE SE TORNAR UM CLASSE 2, A MACRO VOLTA A UPAR NORMALMENTE
	}
}
