sub inicializarParametrosClasses {
    my %parametrosClasses = (
        idC1 => 1,
        idC2 => 7,
        idC2Alt => 13,
        idC1T => 4002,
        idC2T => 4008,
        idC2TAlt => 4014,
        idC3 => '4054,4080,4081'
    );
    my $eventMacro = $eventMacro::Data::eventMacro;
    $eventMacro->set_full_hash('parametrosClasses', \%parametrosClasses);
}

