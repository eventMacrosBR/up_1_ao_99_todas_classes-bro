sub initParamsClasses {
    my %paramsClasses = (
        idC1 => 3,
        idC2 => 20,
        idC1T => 4004,
        idC2T => 4021,
        idC3 => 4069
    );
    my $eventMacro = $eventMacro::Data::eventMacro;
    $eventMacro->set_full_hash('paramsClasses', \%paramsClasses);
}

