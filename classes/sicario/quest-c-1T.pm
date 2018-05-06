sub inicializarParametrosQuestClasse1T {
    my %parametrosQuestClasse1T = (
        npc => '42 133',
        mapa => 'moc_prydb1',
        precisaMover => 'sim',
        sequenciaConversa => '',
        equipeIniciante => 13041
    );
    my $eventMacro = $eventMacro::Data::eventMacro;
    $eventMacro->set_full_hash('parametrosQuestClasse1T', \%parametrosQuestClasse1T);
}

