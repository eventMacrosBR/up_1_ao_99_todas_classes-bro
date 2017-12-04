sub initParamsQuestEden {
    my %paramsQuestEden = (
        armaLevel26e40 => espada,
        armaLevel60 => lança
    );
    my $eventMacro = $eventMacro::Data::eventMacro;
    $eventMacro->set_full_hash('paramsQuestEden', \%paramsQuestEden);
}

