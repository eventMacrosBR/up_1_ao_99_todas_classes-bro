sub initParamsQuestEden {
    my %paramsQuestEden = (
        armaLevel26e40 => 'maça',
        armaLevel60 => 'garra',
        IDarmaIniciante => 16004,
        IDarmaIntermediario => 16005,
        IDarmaEden => 1831
    );
    my $eventMacro = $eventMacro::Data::eventMacro;
    $eventMacro->set_full_hash('paramsQuestEden', \%paramsQuestEden);
}

