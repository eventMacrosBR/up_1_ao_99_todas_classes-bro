sub inicializarParamsQuestEden {
    my %paramsQuestEden = (
        armaLevel26e40 => 'cajado',
        armaLevel60 => 'cajado',
        IDarmaIniciante => 1650,
        IDarmaIntermediario => 1651,
        IDarmaEden => 1658
    );
    my $eventMacro = $eventMacro::Data::eventMacro;
    $eventMacro->set_full_hash('paramsQuestEden', \%paramsQuestEden);
}

