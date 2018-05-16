sub inicializarParametrosClasses {
    my %parametrosClasses = (
        idC1 => 5,
        idC2 => 10,
        idC2Alt => $INDEFINIDO,
        idC1T => 4006,
        idC2T => 4011,
        idC2TAlt => $INDEFINIDO,
        idC3 => 4064,
        idBC1 => 4028,
        idBC2 => 4033,
        idBC2Alt => $INDEFINIDO
    );
    my $eventMacro = $eventMacro::Data::eventMacro;
    $eventMacro->set_full_hash('parametrosClasses', \%parametrosClasses);
}

