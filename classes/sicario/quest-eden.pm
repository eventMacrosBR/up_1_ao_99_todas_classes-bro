sub initParamsQuestEden {
    my %paramsQuestEden = (
        armaLevel26e40 => 'adaga',
        armaLevel60 => 'katar',
        IDarmaIniciante => 13050,
        IDarmaIntermediario => 13051,
        IDarmaEden => 1289
    );
    my $eventMacro = $eventMacro::Data::eventMacro;
    $eventMacro->set_full_hash('paramsQuestEden', \%paramsQuestEden);
}

