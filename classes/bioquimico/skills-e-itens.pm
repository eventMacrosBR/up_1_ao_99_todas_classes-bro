#Desabilitar pot laranja enquanto for classe 1

automacro desabilitarPotLaranja {
	ConfigKey buyAuto_1 502
	ConfigKeyNot buyAuto_0_disabled 1
	JobID $paramsClasses{idC1}
	exclusive 1
	call {
		log DESABILITANDO COMPRA DE POÇÃO LARANJA
		log PARA ECONOMIZAR DINHEIRO PRA QUEST 2
		do conf buyAuto_0_disabled 1
	}
}

automacro habilitarNovamentePotLaranja {
	ConfigKey buyAuto_1 502
	ConfigKeyNot buyAuto_0_disabled 1
	JobID $paramsClasses{idC2}
	exclusive 1
	call {
		log HABILITANDO COMPRA DE POÇÃO LARANJA
		do conf buyAuto_0_disabled 0
	}
}


