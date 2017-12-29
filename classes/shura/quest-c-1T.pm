sub initParamsQuestClasse1T {
	my %paramsQuestClasse1T = (
        npc => '184 41',
        mapa => 'prt_church',
        precisaMover => 'sim',
        sequenciaConversa => '',
        equipeIniciante => 1545
    );
    my $eventMacro = $eventMacro::Data::eventMacro;
    $eventMacro->set_full_hash('paramsQuestClasse1T', \%paramsQuestClasse1T);
}

