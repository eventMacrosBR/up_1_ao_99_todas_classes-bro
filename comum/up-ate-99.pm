automacro UpClasse {
	BaseLevel != 99
	ConfigKeyNot quest_eden em_curso
	ConfigKeyNot quest_eden terminando
	ConfigKeyNot In_saveMap_sequence true
	ConfigKeyNot virarClasse2 true
	ConfigKeyNot virarClasse2T true
	ConfigKeyNot lockMap $mapa{lockMap}
	exclusive 1
	priority 20 #baixa prioridade
	timeout 30
    call upar
}

macro upar {
	
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
	
	#se chegar ate aqui é porque tem algo a ser configurado
	log vou salvar em: $mapa{saveMap}
	log vou upar em: $mapa{lockMap}
	
	#se chegar aqui significa que tem que ser mudado o lockmap e/ou o saveMap
	if (&config(saveMap) = $mapa{saveMap}) {
		[
		log =====================================
		log =Já estou salvo em $mapa{saveMap}
		log =Configurando lockmap 
		log =====================================
		]
		do conf lockMap $mapa{lockMap}
		call voltarAtacar
	} else {
		call pararDeAtacar
		do conf lockmap none
		call SetSaveIn "$mapa{saveMap}"
	}
}

automacro estouLv99 {
	BaseLevel = 99
	exclusive 1
	timeout 120
	JobID $paramsClasses{idC2}, $paramsClasses{idC2T}
	call {
		log CHEGUEI NO LVL 99 FINALMENTE !!!!!!!
		log CARA ISSO LEVOU TEMPO PARA CAR**HO
	}
}

automacro nivelDeClasse50 {
	JobLevel = 50
	JobID $paramsClasses{idC1}, $paramsClasses{idC1T}
	exclusive 1
	timeout 20
	NotInMap izlude
	ConfigKeyNot virarClasse2 true
	ConfigKeyNot questc2_implementada true
	ConfigKeyNot virarClasse2T true
	call {
		log SEU CHAR JÁ ESTÁ NO NIVEL 50 DE CLASSE
		log FAÇA A QUEST PARA VIRAR CLASSE 2 MANUALMENTE POR FAVOR
		log DEPOIS ABRA O BOT NOVAMENTE
		log ASSIM QUE ELE SE TORNAR UM CLASSE 2, A MACRO VOLTA A UPAR NORMALMENTE
		do conf lockMap none
		call pararDeAtacar
	}
}


