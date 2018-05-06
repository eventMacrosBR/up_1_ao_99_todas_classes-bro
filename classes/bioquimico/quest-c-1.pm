sub inicializarParametrosQuestClasse1 {
    my %parametrosQuestClasse1 = (
        nomeClasse => 'mercador',
        npc => '53 43',
        mapa => 'alberta_in',
        precisaMover => 'sim',
        sequenciaConversa => 'r0',
        equipeIniciante => 1381
    );
    my $eventMacro = $eventMacro::Data::eventMacro;
    $eventMacro->set_full_hash('parametrosQuestClasse1', \%parametrosQuestClasse1);
}

