sub initParamsClasses {
    my %paramsClasses = (
        idC1 => 6,
        idC2 => 12,
        idC1T => 4007,
        idC2T => 4013,
        idC3 => 4059
    );
    my $eventMacro = $eventMacro::Data::eventMacro;
    $eventMacro->set_full_hash('paramsClasses', \%paramsClasses);
}

