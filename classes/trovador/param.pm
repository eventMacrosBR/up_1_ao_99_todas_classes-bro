sub inicializarParametrosClasses {
    my %parametrosClasses = (
        idC1 => 3,
        idC2 => 19,
        idC2Alt => -1,
        idC1T => 4004,
        idC2T => 4020,
        idC2TAlt => -2,
        idC3 => 4068,
        idBC1 => 4026,
        idBC2 => 4042,
        idBC2Alt => -3
    );
    my $eventMacro = $eventMacro::Data::eventMacro;
    $eventMacro->set_full_hash('parametrosClasses', \%parametrosClasses);
}

automacro configurarAtaqueADistancia {
    ConfigKeyNot attackDistanceAuto 1
    exclusive 1
    JobIDNot $APRENDIZ
    JobIDNot $APRENDIZ_BABY
    JobIDNot $APRENDIZ_T
    call {
        do conf attackDistanceAuto 1
    }
}

automacro removerConfiguracaoAtaqueADistanciaAprendizT {
    ConfigKey attackDistanceAuto 1
    exclusive 1
    JobID $APRENDIZ_T
    call {
        do conf attackDistanceAuto 0
    }
}

