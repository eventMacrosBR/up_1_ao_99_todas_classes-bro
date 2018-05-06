sub inicializarParametrosQuestClasse1T {
    my %parametrosQuestClasse1T = (
        npc => '164 124',
        mapa => 'geffen_in',
        sequenciaConversa => '',
        equipeIniciante => 1639
    );
    my $eventMacro = $eventMacro::Data::eventMacro;
    $eventMacro->set_full_hash('parametrosQuestClasse1T', \%parametrosQuestClasse1);
}

