sub initParamsQuestClasse1T {
    my %paramsQuestClasse1T = (
        npc => '74 172',
        mapa => 'izlude_in',
        precisaMover => 'nao',
        sequenciaConversa => '',
        equipeIniciante => 13415
    );
    my $eventMacro = $eventMacro::Data::eventMacro;
    $eventMacro->set_full_hash('paramsQuestClasse1T', \%paramsQuestClasse1T);
}

