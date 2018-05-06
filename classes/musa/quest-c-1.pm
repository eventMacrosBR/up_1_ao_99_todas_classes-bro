sub inicializarParametrosQuestClasse1 {
    my %parametrosQuestClasse1 = (
        nomeClasse => 'arqueiro',
        npc => '64 71',
        mapa => 'payon_in02',
        precisaMover => 'nao',
        sequenciaConversa => 'r0',
        equipeIniciante => 1742
    );
    my $eventMacro = $eventMacro::Data::eventMacro;
    $eventMacro->set_full_hash('parametrosQuestClasse1', \%parametrosQuestClasse1);
}

