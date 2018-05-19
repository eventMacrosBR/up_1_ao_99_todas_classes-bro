automacro UpClasse {
    BaseLevel != 99
    ConfigKeyNot quest_eden em_curso
    ConfigKeyNot quest_eden terminando
    ConfigKeyNot naSequenciaDeSalvamento true
    ConfigKeyNot virarClasse2 true
    ConfigKeyNot virarClasse2T true
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
    log vou upar em: $mapa{lockMap}
    
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
        do conf lockMap none
        
        if ($.map =~ /^hu/ && $mapa{saveMap} != hugel) {
            #agora é a parte que damos um jeito de chegar onde queremos!
            [
            log ===================================
            log = Estou em hugel, mas quero upar em outro lugar longe
            log = decidindo como chegar la
            log ===================================
            ]
            switch ($mapa{saveMap}) {
                case (~ rachel, veins) {
                    log = usando aeroplano para salvar em rachel
                    call aeroplano_hugelPara "rachel"
                }
                case (= einbroch) {
                    log = usando aeroplano para salvar em einbroch
                    call aeroplano_hugelPara "einbroch"
                }
                else {
                    log = usando aeroplano para salvar em juno
                    call aeroplano_hugelPara "juno"
                }
            }
            stop
        } elsif ($.map =~ /^ra|^ve|^aru/ && $mapa{saveMap} != rachel && $mapa{saveMap} != veins) {
            [
            log ===================================
            log = estou em $.map, mas quero upar em outro lugar longe
            log = decidindo como chegar la
            log ===================================
            ]
            switch ($mapa{saveMap}) {
                case (= einbroch) {
                    log = usando aeroplano para salvar em einbroch
                    call aeroplano_rachelPara "einbroch"
                }
                case (= hugel) {
                    log = usando aeroplano para salvar em hugel
                    call aeroplano_rachelPara "hugel"
                }
                else {
                    log = usando aeroplano para salvar em juno
                    call aeroplano_rachelPara "juno"
                }
            }
            stop
        }
        #TODO fazer um pra einbroch
        [
        log ===================================
        log = não estou nem em rachel, nem hugel, nem veins
        log ===================================
        ]

        if ($mapa{saveMap} ~ rachel,veins) {
            if ($.map =~ /^ra^ve|^aru/) {
                call salvarNaCidade "$mapa{saveMap}"
            } else {
                call aeroplano_junoPara "$mapa{saveMap}"
            }
            stop
        }
        
        if ($mapa{saveMap} = einbroch) {
            if ($.map =~ /^ein|lhz_fild|/) {
                call salvarNaCidade "$mapa{saveMap}"
            } else {
                call aeroplano_junoPara "$mapa{saveMap}"
            }
            stop
        }
        call salvarNaCidade "$mapa{saveMap}"
    }
}

automacro estouLv99 {
    BaseLevel = 99
    ConfigKey questRenascer_estagio none
    exclusive 1
    timeout 120
    JobID $parametrosClasses{idC2}, $parametrosClasses{idC2Alt}, $parametrosClasses{idC2T}, $parametrosClasses{idC2TAlt}, $parametrosClasses{idBC2}, $parametrosClasses{idBC2Alt}
    call {
        log CHEGUEI NO LVL 99 FINALMENTE !!!!!!!
        log CARA ISSO LEVOU TEMPO PARA CAR**HO
    }
}

