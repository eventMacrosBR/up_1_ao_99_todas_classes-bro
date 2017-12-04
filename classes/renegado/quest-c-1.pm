sub initParamsQuestClasse1 {
    my %paramsQuestClasse1 = (
        nomeClasse => 'gatuno',
        npc => '42 133',
        mapa => 'moc_prydb1',
        precisaMover => 'Sim',
        sequenciaConversa => 'r1 r1',
        equipeIniciante => 13041
    );
    my $eventMacro = $eventMacro::Data::eventMacro;
    $eventMacro->set_full_hash('paramsQuestClasse1', \%paramsQuestClasse1);
}

