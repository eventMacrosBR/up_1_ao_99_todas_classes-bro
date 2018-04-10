sub initParamsQuestClasse2 {
	my ($classe) = @_;
	my %items = (
	 );
	Commands::run("conf -f questc2_implementada false");
	foreach $key (keys %items) {
        if ($classe == 1) { 
            Commands::run("iconf $key $items{$key}") 
        } else {
            Commands::run("iconf $key 0 1 0")
        }
    }
}

