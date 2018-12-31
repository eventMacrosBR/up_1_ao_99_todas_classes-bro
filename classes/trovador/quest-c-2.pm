sub inicializarParametrosQuestClasse2 {
    my ($manterOuGuardar) = @_;
    my %items = (
    #Flor qualquer. Pode ser Aloés(704), Hinalle(703), Flor das Ilusões(710), Izidor(709), Menta(708), Flor Cantante(629), Rosa de Gelo(749), Rosa Eterna(748)
    
    704 => "1 1 0", #Aloés
    938 => "1 1 0", #Muco Pegajoso
    1024 => "1 1 0" #Tinta de Polvo
    
    );
    Commands::run("conf -f questc2_implementada false");
    foreach $key (keys %items) {
        if ($manterOuGuardar eq "manter") {
            Commands::run("iconf $key $items{$key}")
        } else {
            Commands::run("iconf $key 0 1 0")
        }
    }
}

