sub initParamsQuestClasse1 {
    my %paramsQuestClasse1 = (
        nomeClasse => 'mercador',
        npc => '53 43',
        mapa => 'alberta_in',
        precisaMover => 'sim',
        sequenciaConversa => 'r0',
        equipeIniciante => 1381
    );
    my $eventMacro = $eventMacro::Data::eventMacro;
    $eventMacro->set_full_hash('paramsQuestClasse1', \%paramsQuestClasse1);
}

