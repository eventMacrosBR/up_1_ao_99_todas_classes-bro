sub inicializarParametrosClasses {
    my %parametrosClasses = (
        idC1 => 2,
        idC2 => 9,
        idC2Alt => $INDEFINIDO,
        idC1T => 4003,
        idC2T => 4010,
        idC2TAlt => $INDEFINIDO,
        idC3 => 4055,
        idBC1 => 4025,
        idBC2 => 4032,
        idBC2Alt => $INDEFINIDO
    );
    my $eventMacro = $eventMacro::Data::eventMacro;
    $eventMacro->set_full_hash('parametrosClasses', \%parametrosClasses);
}

