sub initParamsQuestClasse1T {
    my %paramsQuestClasse1T = (
        npc => '164 124',
        mapa => 'geffen_in',
        precisaMover => 'sim',
        sequenciaConversa => '',
        equipeIniciante => 1639
    );
    my $eventMacro = $eventMacro::Data::eventMacro;
    $eventMacro->set_full_hash('paramsQuestClasse1T', \%paramsQuestClasse1T);
}

