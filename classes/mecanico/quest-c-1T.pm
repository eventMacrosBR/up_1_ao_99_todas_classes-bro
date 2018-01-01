sub initParamsQuestClasse1T {
        my %paramsQuestClasse1T = (
        npc => '53 43',
        mapa => 'alberta_in',
        sequenciaConversa => '', #não sabemos ainda
        equipeIniciante => 1381
    );
    my $eventMacro = $eventMacro::Data::eventMacro;
    $eventMacro->set_full_hash('paramsQuestClasse1T', \%paramsQuestClasse1);
}

