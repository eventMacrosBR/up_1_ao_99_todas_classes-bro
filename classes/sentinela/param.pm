sub initParamsClasses {
    my %paramsClasses = (
        idC1 => 3,
        idC2 => 11,
        idC1T => 4004,
        idC2T => 4012,
        idC3 => 4056
    );
    my $eventMacro = $eventMacro::Data::eventMacro;
    $eventMacro->set_full_hash('paramsClasses', \%paramsClasses);
}

