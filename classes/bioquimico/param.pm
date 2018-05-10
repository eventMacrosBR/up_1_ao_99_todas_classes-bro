sub inicializarParametrosClasses {
    my %parametrosClasses = (
        idC1 => 5,
        idC2 => 18,
        idC2Alt => -1,
        idC1T => 4006,
        idC2T => 4019,
        idC2TAlt => -2,
        idC3 => 4071,
        idBC1 => 4031,
        idBC2 => 4041,
        idBC2Alt => -3
    );
    my $eventMacro = $eventMacro::Data::eventMacro;
    $eventMacro->set_full_hash('parametrosClasses', \%parametrosClasses);
}

