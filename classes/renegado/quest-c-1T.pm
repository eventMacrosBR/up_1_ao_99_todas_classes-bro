sub initParamsQuestClasse1T {
    my %paramsQuestClasse1T = (
        npc => '39 129',
        mapa => 'moc_prydb1',
        sequenciaConversa => '',
        equipeIniciante => 13041
    );
    my $eventMacro = $eventMacro::Data::eventMacro;
    $eventMacro->set_full_hash('paramsQuestClasse1T', \%paramsQuestClasse1T);
}

