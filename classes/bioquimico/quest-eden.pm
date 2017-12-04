sub initParamsQuestEden {
    my %paramsQuestEden = (
        armaLevel26e40 => maça,
        armaLevel60 => machado
    );
    my $eventMacro = $eventMacro::Data::eventMacro;
    $eventMacro->set_full_hash('paramsQuestEden', \%paramsQuestEden);
}

