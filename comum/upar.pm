automacro UpClasse {
    BaseLevel != 99
    ConfigKeyNot quest_eden em_curso
    ConfigKeyNot quest_eden terminando
    ConfigKeyNot naSequenciaDeSalvamento true
    ConfigKeyNot virarClasse2 true
    ConfigKeyNot virarClasse2T true
    ConfigKeyNot virarClasse3 true
    ConfigKeyNot quest_skill true
    ConfigKeyNot esperarFazerQuest true
    ConfigKeyNot lockMap $mapa{lockMap}
    ConfigKey aeroplano1 none
    ConfigKey aeroplano2 none
    ConfigKey questRenascer_estagio none
    exclusive 1
    priority 20 #baixa prioridade
    timeout 30
    JobIDNot 0 #Ou o campo de treinamento fica louco
    JobIDNot 4023 #Baby Aprendiz
    call upar
}

automacro UpClasse3rd {
    BaseLevel >= 99
    ConfigKeyNot naSequenciaDeSalvamento true
    ConfigKeyNot esperarFazerQuest true
    ConfigKeyNot lockMap $mapa{lockMap}
    ConfigKey aeroplano1 none
    ConfigKey aeroplano2 none
    exclusive 1
    priority 20 #baixa prioridade
    timeout 30
    JobID $parametrosClasses{idC3}, $parametrosClasses{idC3Alt}, $parametrosClasses{idBC3}, $parametrosClasses{idCB3Alt}
    call upar
}

macro upar {
    
    if (&config(lockMap) = $mapa{lockMap}) {
        [
        log ================================
        log =Tudo Configurado
        log =Continuarei upando em $mapa{lockMap}
        log ================================
        ]
        call voltarAtacar
        do conf -f o_que_estou_fazendo upando
        stop
    }
    
    #se chegar ate aqui é porque tem algo a ser configurado
    [
    log ===================================
    log = saveMap que está configurado agora: &config(saveMap)
    log = saveMap que quero salvar: $mapa{saveMap}
    log ===================================

    log ===================================
    log = lockMap que está configurado agora: &config(lockMap)
    log = lockMap que quero salvar: $mapa{lockMap}
    log ===================================
    ]
    
    #se chegar aqui significa que tem que ser mudado o lockMap e/ou o saveMap
    if (&config(saveMap) = $mapa{saveMap}) {
        [
        log =====================================
        log =Já estou salvo em $mapa{saveMap}
        log =Configurando lockMap
        log =====================================
        ]
        do conf lockMap $mapa{lockMap}
        call voltarAtacar
        do conf -f o_que_estou_fazendo upando
    } else {
        log vou salvar em: $mapa{saveMap}
        call pararDeAtacar
        $macroParaChamar = salvarOndeVouUpar("&config(saveMap)", "$mapa{saveMap}")
        call $macroParaChamar
    }
}

sub salvarOndeVouUpar {
    my $mapaOrigem = $_[0];
    my $mapaDestino = $_[1];
    warning "\$mapaOrigem: $mapaOrigem, \$mapaDestino: $mapaDestino\n";
    my @rotas = (
        { de => 'hugel',   para => 'rachel',    usar => 'aeroplano_hugelPara "rachel"'},
        { de => 'hugel',   para => 'veins',     usar => 'aeroplano_hugelPara "rachel"'},
        { de => 'hugel',   para => 'einbroch',  usar => 'aeroplano_hugelPara "einbroch"'},
        { de => 'hugel',   para => 'yuno',      usar => 'aeroplano_hugelPara "juno"'},
        { de => 'hugel',   para => '*',         usar => 'aeroplano_hugelPara "izlude"'},
        { de => 'rachel',  para => 'hugel',     usar => 'aeroplano_rachelPara "rachel"'},
        { de => 'rachel',  para => 'veins',     usar => 'salvarNaCidade "veins"'},
        { de => 'rachel',  para => 'einbroch',  usar => 'aeroplano_rachelPara "einbroch"'},
        { de => 'rachel',  para => 'yuno',      usar => 'aeroplano_rachelPara "juno"'},
        { de => 'rachel',  para => '*',         usar => 'aeroplano_rachelPara "izlude"'},
        { de => 'veins',   para => 'hugel',     usar => 'aeroplano_rachelPara "rachel"'},
        { de => 'veins',   para => 'rachel',    usar => 'salvarNaCidade "rachel"'},
        { de => 'veins',   para => 'einbroch',  usar => 'aeroplano_rachelPara "einbroch"'},
        { de => 'veins',   para => 'yuno',      usar => 'aeroplano_rachelPara "juno"'},
        { de => 'veins',   para => '*',         usar => 'aeroplano_rachelPara "izlude"'},
        { de => '*',       para => 'hugel',     usar => 'aeroplano_junoPara "hugel"'},
        { de => '*',       para => 'rachel',    usar => 'aeroplano_junoPara "rachel"'},
        { de => '*',       para => 'veins',     usar => 'aeroplano_junoPara "rachel"'},
        { de => '*',       para => 'einbroch',  usar => 'aeroplano_junoPara "einbroch"'},
        { de => '*',       para => '*' }
    );

    foreach my $rota (@rotas) {
        if ($mapaOrigem eq $rota->{de}) {
            if ($mapaDestino eq $rota->{para}) {
                $rotaDecidida = 1;
                message "Será retornado o comando $rota->{usar}\n";
                return $rota->{usar};
            } else {
                if ($rota->{para} eq "*") {
                    $rotaDecidida = 1;
                    message "Será retornado o comando $rota->{usar}\n";
                    return $rota->{usar};
                }
            }
        } else {
            if ($rota->{de} eq "*") {
                if ($mapaDestino eq $rota->{para}) {
                    $rotaDecidida = 1;
                    message "Será retornado o comando $rota->{usar}\n";
                    return $rota->{usar};
                } else {
                    if ($rota->{para} eq "*") {
                        $rotaDecidida = 1;
                        message "Será retornado o comando savarNaCidade $mapaDestino\n";
                        return "salvarNaCidade $mapaDestino";
                    }
                }
            }
        }
    }
    
    if (!$rotaDecidida) {
        error "tem um erro em decidir qual rota deve ser seguida\n";
    }
}

