
#Creditos lucasbradok/punky
#Virar Monge
#novico nescessario job 50
#até a parte de dropar os items
#Não esta completo
#falta a parte dos cogumelos e a parte final
#Testar no BRO pois esta pro IRO RESTART
automacro configurar Monge 1 {
	NotInMap prt_monk
	NotInMap monk_in
	JobLevel = 50
	priority 2
	run-once 1
	QuestInactive 3016
	QuestInactive 3023
	call {
		do conf route_maxWarpFee none
		do conf route_maxNpcTries none
		do conf route_teleport none
		do conf lockMap none
		conf route_randomWalk 0
		do conf follow 0
		do conf route_teleport 5
		do conf route_teleport_minDistance 150
		do conf attackAuto -1
		do mconf -1 0 1
		do conf sitAuto_sp_lower 40
		do conf sitAuto_sp_upper 100
		do pconf all 0
		do pconf Orange Net Mushroom 2
		do pconf Orange Gooey Mushroom 2
		do move prt_monk
}
}
automacro virar Monge 1 {
	InMap prt_monk
	QuestInactive 3016 
	priority 2
	run-once 1
	call {
		do move prt_monk 57 245
		pause 2
		do talknpc 59 247 c r1 c r1 c 	#Primeira parte Guarding Monk 
}
}

automacro virar Monge 2 {
	QuestActive 3016
	priority 2
	run-once 1
	call {
		do move monk_in 99 56
		do talknpc 99 58 c r0 c
}
}

automacro virar Monge 3 {
	QuestActive 3023
	priority 2
	timeout 300
	call {
		do pconf 1027 1
		do pconf 1025 1
		do pconf 940 1
		$cobWeb = &invamount (Cobweb)
		$porcupineQuill  = &invamount (Porcupine Quill)
		$gLeg = &invamount (Grasshopper's Leg)
		if ( $cobWeb < 20 ) goto Cobweb
		if ( $cobWeb >= 20 && $porcupineQuill < 5 ) goto Porcupine
		if ( $cobWeb >= 20 && $porcupineQuill >= 5 && $gLeg < 10 ) goto GLeg


		:Cobweb
		log Pegar Cobweb
		[
		do conf lockMap mjolnir_04
		do mconf Argos 1 0 1
		do mconf Caramel 1 0 1
		do mconf all -1 0 1
		do conf teleportAuto_hp 50
		do conf teleportAuto_minAggressives 2
		do conf teleportAuto_minAggressivesInLock 2
		do conf attackAuto_inLockOnly 1
		call voltarAtacar
		log =================================
		log Estou coletando Cobweb pra
		log pra quest de Monk
		log =================================
		]
		stop


		:Porcupine
		log Pegar Porcupine
		[
		do conf lockMap mjolnir_04
		do mconf Argos 1 0 1
		do mconf Caramel 1 0 1
		do mconf all -1 0 1
		do conf teleportAuto_hp 50
		do conf teleportAuto_minAggressives 2
		do conf attackAuto_inLockOnly 1
		call voltarAtacar
		log ================================
		log Estou coletando Porcupine
		log pra quest de Monk
		log ================================
		]
		stop


		:GLeg
		log Pegar GLEG
		[
		do conf lockMap prt_fild07
		do mconf Drainliar 0 0 0
		do mconf Eggyra 0 0 0
		do mconf 1084 0 0 0
		do mconf 1078 0 0 0
		do conf attackAuto_inLockOnly 1
		do conf route_randomWalk 1
		call voltarAtacar
		log ==============================
		log Estou coletando GLEG para
		log pra quest de Monk
		log ==============================
		]
		stop
}
}


automacro virar Monk 4  {
	InInventory "Cobweb" >= 20
	InInventory "Porcupine Quill" >= 5
	InInventory "Grasshopper's Leg" >= 10
	QuestActive 3023
	NpcNotNear /Sensei Moohae/
	exclusive 1
	timeout 600
	call {
		do conf lockMap none
		call pararDeAtacar
		do move monk_in 99 57
		pause 1
		do talknpc 99 58 c

	}
	}

	#NpcMsg /an Assassin, aren't you?/

automacro vireiMonk {
exclusive 1
JobLevel = 1
run-once 1
	call {
		do conf follow 1
		call pararDeAtacar
		do conf teleportAuto_hp 20
		do conf teleportAuto_minAggressives 0
		do conf teleportAuto_minAggressivesInLock 0
}
}


macro pararDeAtacar {
	[
	do conf route_randomWalk 0
	do conf attackAuto 1
	]
}


macro voltarAtacar {
	[
	do conf route_randomWalk 1
	do conf attackAuto 2
	]
	}
