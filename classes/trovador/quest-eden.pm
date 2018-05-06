sub inicializarParamsQuestEden {
    my %paramsQuestEden = (
        armaLevel26e40 => 'arco',
        armaLevel60 => 'guitarra',
        IDarmaIniciante => 1747,
        IDarmaIntermediario => 1748,
        IDarmaEden => 1931
    );
    my $eventMacro = $eventMacro::Data::eventMacro;
    $eventMacro->set_full_hash('paramsQuestEden', \%paramsQuestEden);
}

