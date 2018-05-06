sub inicializarParametrosQuestClasse1 {
    my %parametrosQuestClasse1 = (
        nomeClasse => 'gatuno',
        npc => '42 133',
        mapa => 'moc_prydb1',
        precisaMover => 'sim',
        sequenciaConversa => 'r1 r1',
        equipeIniciante => 13041
    );
    my $eventMacro = $eventMacro::Data::eventMacro;
    $eventMacro->set_full_hash('parametrosQuestClasse1', \%parametrosQuestClasse1);
}

