sub initParamsQuestEden {
    my %paramsClasses = (
        idC1 => 6,
        idC2 => 17,
        idC1T => 4007,
        idC2T => 4018,
        idC3 => 4072
    );
    my $eventMacro = $eventMacro::Data::eventMacro;
    $eventMacro->set_full_hash('paramsClasses', \%paramsClasses);
}

