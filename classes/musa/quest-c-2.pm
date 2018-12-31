sub inicializarParametrosQuestClasse2 {
    my ($manterOuGuardar) = @_;
    my %items = (
    #Possibilidade 1
    938 => "20 1 0", #Muco Pegajoso
    501 => "5 1 0", #Poção Vermelha
    909 => "3 1 0", #Jellopy
    2403 => "1 1 0", #Sapatos [0]
    #Possibilidade 2
    1055 => "5 1 0", #Pele de Minhoca
    2405 => "1 1 0", #Botas [0]
    #Possibilidade 3
    965 => "2 1 0", #Casco de Ostra
    503 => "5 1 0", #Poção Amarela
    909 => "20 1 0", #Jellopy
    1020 => "10 1 0", #Cabelos Morenos
    2401 => "1 1 0" #    Sandálias [0]
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

