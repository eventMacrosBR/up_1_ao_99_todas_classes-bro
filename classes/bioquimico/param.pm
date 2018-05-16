sub inicializarParametrosClasses {
    my %parametrosClasses = (
        idC1 => 5,
        idC2 => 18,
        idC2Alt => $INDEFINIDO,
        idC1T => 4006,
        idC2T => 4019,
        idC2TAlt => $INDEFINIDO,
        idC3 => 4071,
        idBC1 => 4031,
        idBC2 => 4041,
        idBC2Alt => $INDEFINIDO
    );
    my $eventMacro = $eventMacro::Data::eventMacro;
    $eventMacro->set_full_hash('parametrosClasses', \%parametrosClasses);
}

