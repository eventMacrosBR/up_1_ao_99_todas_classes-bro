sub initParamsQuestClasse1{
    my %paramsQuestClasse1 = (
        nomeClasse => espadachim,
        npc => '74 172'
        mapa => 'izlude_in',
        precisaMover => 'Nao',
        sequenciaConversa => 'r1 r0',
        equipeIniciante => 13041
    )
    my $eventMacro = $eventMacro::Data::eventMacro;
    $eventMacro->set_full_hash('paramsQuestClasse1', \%paramsQuestClasse1);
}

