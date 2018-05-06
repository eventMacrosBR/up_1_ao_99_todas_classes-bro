sub inicializarParamsClasses {
    my %paramsClasses = (
        idC1 => 2,
        idC2 => 9,
        idC2Alt => -1,
        idC1T => 4003,
        idC2T => 4010,
        idC2TAlt => -2,
        idC3 => 4055
    );
    my $eventMacro = $eventMacro::Data::eventMacro;
    $eventMacro->set_full_hash('paramsClasses', \%paramsClasses);
}

