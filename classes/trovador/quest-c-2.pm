sub initParamsQuestClasse2 {
	my %items = (
	#Flor qualquer. Pode ser Aloés(704), Hinalle(703), Flor das Ilusões(710), Izidor(709), Menta(708), Flor Cantante(629), Rosa de Gelo(749), Rosa Eterna(748)
    
    704 => "1 1 0", #Aloés
    938 => "1 1 0", #Muco Pegajoso
    1024 => "1 1 0" #Tinta de Polvo
    
    );
	Commands::run("conf -f questc2_implementada false");
}

