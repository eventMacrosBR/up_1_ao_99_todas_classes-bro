sub initParamsQuestClasse2 {
	#Possibilidade 1
	Commands::run("do iconf 938 20 1 0"); #Muco Pegajoso
	Commands::run("do iconf 501 5 1 0"); #Poção Vermelha
	Commands::run("do iconf 909 3 1 0"); #Jellopy
	Commands::run("do iconf 2403 1 1 0"); #Sapatos [0]
	#Possibilidade 2
	Commands::run("do iconf 1055 5 1 0"); #Pele de Minhoca
	Commands::run("do iconf 2405 1 1 0"); #Botas [0]
	#Possibilidade 3
	Commands::run("do iconf 965 2 1 0"); #Casco de Ostra
	Commands::run("do iconf 503 5 1 0"); #Poção Amarela
	Commands::run("do iconf 909 20 1 0"); #Jellopy
	Commands::run("do iconf 1020 10 1 0"); #Cabelos Morenos
	Commands::run("do iconf 2401 1 1 0"); #	Sandálias [0]
	
	Commands::run("conf -f questc2_implementada false");
}
