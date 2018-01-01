sub initParamsQuestEden {
    my %paramsQuestEden = (
        armaLevel26e40 => 'sabre|espada',
        armaLevel60 => 'sabre|espada',
        IDarmaIniciante => 16004,
        IDarmaIntermediario => 16005,
        IDarmaEden => 1391
    );
    my $eventMacro = $eventMacro::Data::eventMacro;
    $eventMacro->set_full_hash('paramsQuestEden', \%paramsQuestEden);
}

