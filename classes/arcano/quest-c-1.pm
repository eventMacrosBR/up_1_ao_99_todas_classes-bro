sub inicializarParametrosQuestClasse1 {
    my %parametrosQuestClasse1 = (
        nomeClasse => 'mago',
        npc => '164 124',
        mapa => 'geffen_in',
        precisaMover => 'sim',
        sequenciaConversa => 'r0 r0',
        equipeIniciante => 1639
    );
    my $eventMacro = $eventMacro::Data::eventMacro;
    $eventMacro->set_full_hash('parametrosQuestClasse1', \%parametrosQuestClasse1);
}

