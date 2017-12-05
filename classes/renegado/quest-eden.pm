sub initParamsQuestEden {
    my %paramsQuestEden = (
        armaLevel26e40 => 'adaga',
        armaLevel60 => 'adaga'
    );
    my $eventMacro = $eventMacro::Data::eventMacro;
    $eventMacro->set_full_hash('paramsQuestEden', \%paramsQuestEden);
}

