sub inicializarParamsClasses {
    my %paramsClasses = (
        idC1 => 5,
        idC2 => 18,
        idC2Alt => -1,
        idC1T => 4006,
        idC2T => 4019,
        idC2TAlt => -2,
        idC3 => 4071
    );
    my $eventMacro = $eventMacro::Data::eventMacro;
    $eventMacro->set_full_hash('paramsClasses', \%paramsClasses);
}

