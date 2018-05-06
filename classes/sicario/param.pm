sub inicializarParametrosClasses {
    my %parametrosClasses = (
        idC1 => 6,
        idC2 => 12,
        idC2Alt => -1,
        idC1T => 4007,
        idC2T => 4013,
        idC2TAlt => -2,
        idC3 => 4059
    );
    my $eventMacro = $eventMacro::Data::eventMacro;
    $eventMacro->set_full_hash('parametrosClasses', \%parametrosClasses);
}

