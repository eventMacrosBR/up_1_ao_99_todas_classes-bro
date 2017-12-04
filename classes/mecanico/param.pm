sub initParamsQuestEden{
    my %paramsClasses = (
        idC1 => 5,
        idC2 => 10,
        idC1T => 4006,
        idC2T => 4011,
        idC3 => 4064
    )
    my $eventMacro = $eventMacro::Data::eventMacro;
    $eventMacro->set_full_hash('paramsClasses', \%paramsClasses);
}

