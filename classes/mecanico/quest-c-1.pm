sub initParamsQuestClasse1 {
    my %paramsQuestClasse1 = (
        nomeClasse => 'mercador',
        npc => '53 43',
        mapa => 'alberta_in',
        precisaMover => 'nao',
        sequenciaConversa => 'c',
        equipeIniciante => 1381
    );
    my $eventMacro = $eventMacro::Data::eventMacro;
    $eventMacro->set_full_hash('paramsQuestClasse1', \%paramsQuestClasse1);
}

