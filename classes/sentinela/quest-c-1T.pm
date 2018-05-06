sub inicializarParametrosQuestClasse1T {
    my %parametrosQuestClasse1T = (
        npc => '64 71',
        mapa => 'payon_in02',
        precisaMover => 'nao',
        sequenciaConversa => '',
        equipeIniciante => 1742
    );
    my $eventMacro = $eventMacro::Data::eventMacro;
    $eventMacro->set_full_hash('parametrosQuestClasse1T', \%parametrosQuestClasse1T);
}

