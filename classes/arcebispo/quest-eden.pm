sub inicializarParametrosQuestEden {
    my %parametrosQuestEden = (
        armaLevel26e40 => 'maça',
        armaLevel60 => 'cajado',
        IDarmaIniciante => 16004,
        IDarmaIntermediario => 16005,
        IDarmaEden => 1658
    );
    my $eventMacro = $eventMacro::Data::eventMacro;
    $eventMacro->set_full_hash('parametrosQuestEden', \%parametrosQuestEden);
}

