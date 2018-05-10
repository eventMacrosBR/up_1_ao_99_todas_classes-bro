sub inicializarParametrosClasses {
    my %parametrosClasses = (
        idC1 => 5,
        idC2 => 10,
        idC2Alt => -1,
        idC1T => 4006,
        idC2T => 4011,
        idC2TAlt => -2,
        idC3 => 4064,
        idBC1 => 4028,
        idBC2 => 4033,
        idBC2Alt => -3
    );
    my $eventMacro = $eventMacro::Data::eventMacro;
    $eventMacro->set_full_hash('parametrosClasses', \%parametrosClasses);
}

