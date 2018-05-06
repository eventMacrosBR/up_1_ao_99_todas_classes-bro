sub inicializarParamsQuestClasse1T {
    my %paramsQuestClasse1T = (
        npc => '64 71',
        mapa => 'payon_in02',
        precisaMover => 'nao',
        sequenciaConversa => '',
        equipeIniciante => 1742
    );
    my $eventMacro = $eventMacro::Data::eventMacro;
    $eventMacro->set_full_hash('paramsQuestClasse1T', \%paramsQuestClasse1T);
}

