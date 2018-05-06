sub inicializarParametrosQuestClasse1T {
        my %parametrosQuestClasse1T = (
        npc => '53 43',
        mapa => 'alberta_in',
        sequenciaConversa => '', #não sabemos ainda
        equipeIniciante => 1381
    );
    my $eventMacro = $eventMacro::Data::eventMacro;
    $eventMacro->set_full_hash('parametrosQuestClasse1T', \%parametrosQuestClasse1);
}

