sub inicializarParametrosClasses {
    my %parametrosClasses = (
        idC1 => 3,
        idC2 => 20,
        idC2Alt => -1,
        idC1T => 4004,
        idC2T => 4021,
        idC2TAlt => -2,
        idC3 => 4069,
        idBC1 => 4026,
        idBC2 => 4043,
        idBC2Alt => -3
    );
    my $eventMacro = $eventMacro::Data::eventMacro;
    $eventMacro->set_full_hash('parametrosClasses', \%parametrosClasses);
}

automacro configurarAtaqueADistancia {
    ConfigKeyNot attackDistanceAuto 1
    exclusive 1
    JobIDNot 0 #Aprendiz
    JobIDNot 4023 #Baby Aprendiz
    JobIDNot 4001 #Aprendiz T.
    call {
        do conf attackDistanceAuto 1
    }
}

automacro removerConfiguracaoAtaqueADistanciaAprendizT {
    ConfigKey attackDistanceAuto 1
    exclusive 1
    JobID 4001 #Aprendiz T.
    call {
        do conf attackDistanceAuto 0
    }
}

