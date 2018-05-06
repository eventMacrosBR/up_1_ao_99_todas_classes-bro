sub inicializarParametrosQuestClasse1 {
    my %parametrosQuestClasse1 = (
        nomeClasse => 'novi[cç]o',
        npc => '184 41',
        mapa => 'prt_church',
        precisaMover => 'sim',
        sequenciaConversa => 'r0',
        equipeIniciante => 1545
    );
    my $eventMacro = $eventMacro::Data::eventMacro;
    $eventMacro->set_full_hash('parametrosQuestClasse1', \%parametrosQuestClasse1);
}

