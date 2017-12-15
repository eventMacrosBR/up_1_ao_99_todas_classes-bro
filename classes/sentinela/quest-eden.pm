sub initParamsQuestEden {
    my %paramsQuestEden = (
        armaLevel26e40 => 'arco',
        armaLevel60 => 'arco',
        IDarmaIniciante => 1747,
		IDarmaIntermediario => 1748,
		IDarmaEden => 18106
    );
    my $eventMacro = $eventMacro::Data::eventMacro;
    $eventMacro->set_full_hash('paramsQuestEden', \%paramsQuestEden);
}

