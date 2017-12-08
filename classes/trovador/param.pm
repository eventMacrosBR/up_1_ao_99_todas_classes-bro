sub initParamsClasses {
    my %paramsClasses = (
        idC1 => 3,
        idC2 => 19,
        idC1T => 4004,
        idC2T => 4020,
        idC3 => 4068
    );
    my $eventMacro = $eventMacro::Data::eventMacro;
    $eventMacro->set_full_hash('paramsClasses', \%paramsClasses);
}

