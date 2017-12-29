sub initParamsQuestClasse1T {
    my %paramsQuestClasse1T = (
        npc => '42 133',
        mapa => 'moc_prydb1',
        precisaMover => 'sim',
        sequenciaConversa => '',
        equipeIniciante => 13041
    );
    my $eventMacro = $eventMacro::Data::eventMacro;
    $eventMacro->set_full_hash('paramsQuestClasse1T', \%paramsQuestClasse1T);
}

