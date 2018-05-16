sub inicializarParametrosClasses {
    my %parametrosClasses = (
        idC1 => 3,
        idC2 => 11,
        idC2Alt => $INDEFINIDO,
        idC1T => 4004,
        idC2T => 4012,
        idC2TAlt => $INDEFINIDO,
        idC3 => 4056,
        idBC1 => 4026,
        idBC2 => 4034,
        idBC2Alt => $INDEFINIDO
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

