sub inicializarParametrosClasses {
    my %parametrosClasses = (
        idC1 => 6,
        idC2 => 17,
        idC2Alt => -1,
        idC1T => 4007,
        idC2T => 4018,
        idC2TAlt => -2,
        idC3 => 4072,
        idBC1 => 4029,
        idBC2 => 4040,
        idBC2Alt => -3
    );
    my $eventMacro = $eventMacro::Data::eventMacro;
    $eventMacro->set_full_hash('parametrosClasses', \%parametrosClasses);
}

