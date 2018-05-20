sub inicializarParametrosClasses {
    my %parametrosClasses = (
        idC1 => -1,
        idC2 => -1,
        idC2Alt => -1,
        idC1T => -1,
        idC2T => -1,
        idC2TAlt => -1,
        idC3 => -1,
        idBC1 => -1,
        idBC2 => -1,
        idBC2Alt => -1
    );
    my $eventMacro = $eventMacro::Data::eventMacro;
    $eventMacro->set_full_hash('parametrosClasses', \%parametrosClasses);
}

