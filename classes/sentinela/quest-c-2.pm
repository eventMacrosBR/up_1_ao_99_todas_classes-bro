sub initParamsQuestClasse2 {
	#Possibilidade 1	
	Commands::run("do iconf 920 5 1 0"); #Garras de Lobo
	Commands::run("do iconf 1019 5 1 0"); #Troncos
	Commands::run("do iconf 509 3 1 0"); #Ervas Brancas

	#Possibilidade 2
	Commands::run("do iconf 955 9 1 0"); #Peles de Verme
	Commands::run("do iconf 935 9 1 0"); #Cascas
	Commands::run("do iconf 508 9 1 0"); #Ervas Amarelas

	#Possibilidade 3
	Commands::run("do iconf 1021 3 1 0"); #Chifres de Dokebi
	Commands::run("do iconf 7032 3 1 0"); #Pedaços de Casca de Ovo
	Commands::run("do iconf 914 10 1 0"); #Felpas

	#Possibilidade 4
	Commands::run("do iconf 937 3 1 0"); #Caninos Venenosos
	Commands::run("do iconf 507 5 1 0"); #Ervas Vermelhas
	Commands::run("do iconf 919 3 1 0"); #Couros de Animal

	#Possibilidade 5
	Commands::run("do iconf 925 3 1 0"); #Bicos de Ave
	Commands::run("do iconf 932 5 1 0"); #Ossos
	Commands::run("do iconf 511 3 1 0"); #Ervas Verdes

	#Possibilidade 6
	Commands::run("do iconf 913 3 1 0"); #Dentes de Morcego
	Commands::run("do iconf 938 1 1 0"); #Mucos Pegajosos
	Commands::run("do iconf 948 1 1 0"); #Patas de Urso

	#Possibilidade 7 	
	Commands::run("do iconf 1027 2 1 0"); #Espinhos de Porco-Espinho
	Commands::run("do iconf 942 1 1 0"); #Caudas de Yoyo
	Commands::run("do iconf 1026 1 1 0"); #Avelãs
	
	Commands::run("conf -f questc2_implementada false");
}
