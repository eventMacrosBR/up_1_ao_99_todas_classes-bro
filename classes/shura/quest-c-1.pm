sub initParamsQuestClasse1 {
    my %paramsQuestClasse1 = (
        nomeClasse => 'novi[cç]o',
        npc => '173 23',
        mapa => 'prt_church',
        precisaMover => 'sim',
        sequenciaConversa => 'r0',
        equipeIniciante => 1545
    );
    my $eventMacro = $eventMacro::Data::eventMacro;
    $eventMacro->set_full_hash('paramsQuestClasse1', \%paramsQuestClasse1);
}

