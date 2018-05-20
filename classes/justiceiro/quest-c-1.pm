sub inicializarParametrosQuestClasse1 {
     Commands::run("eventMacro disable questClasse1_virandoClasse1");
     my %parametrosQuestClasse1 = (
        equipeIniciante => 0
    );
    my $eventMacro = $eventMacro::Data::eventMacro;
    $eventMacro->set_full_hash('parametrosQuestClasse1', \%parametrosQuestClasse1);
}

