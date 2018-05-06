sub inicializarParametrosClasses {
    my %parametrosClasses = (
        idC1 => 2,
        idC2 => 16,
        idC2Alt => -1,
        idC1T => 4003,
        idC2T => 4017,
        idC2TAlt => -2,
        idC3 => 4067
    );
    my $eventMacro = $eventMacro::Data::eventMacro;
    $eventMacro->set_full_hash('parametrosClasses', \%parametrosClasses);
}

