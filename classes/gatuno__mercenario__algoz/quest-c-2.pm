sub inicializarParametrosQuestClasse2 {
    my ($manterOuGuardar) = @_;
    my %items = (
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

