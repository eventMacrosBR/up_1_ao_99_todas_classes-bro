sub initParamsQuestClasse1{
    my %paramsQuestClasse1 = (
        nomeClasse => mago,
        npc => '164 124'
        mapa => geffen_in,
        precisaMover => sim,
        sequenciaConversa => 'r0 r0',
        equipeIniciante => 1639
    );
    my $eventMacro = $eventMacro::Data::eventMacro;
    $eventMacro->set_full_hash('paramsQuestClasse1', \%paramsQuestClasse1);
}

