sub inicializarParametrosQuestClasse2 {
    my ($manterOuGuardar) = @_;
    my %items = (
    #TODO
    );
    foreach $key (keys %items) {
        if ($manterOuGuardar eq "manter") {
            Commands::run("iconf $key $items{$key}")
        } else {
            Commands::run("iconf $key 0 1 0")
        }
    }
}

    