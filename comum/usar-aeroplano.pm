#Digite no console do eventMacro
#eventMacro aeroplano_junoPara --cidade
#Pode ser tambem
#eventMacro aeroplano_einbrochPara --cidade
#ou
#eventMacro aeroplano_junoPara --cidade
#se o nome estiver certo, ele vai mover pra cidade desejada
macro aeroplano_junoPara {
    set exclusive 1
    log Vamos ir de Juno para $.param[0]
    #Se a cidade for izlude ou rachel , ele pega o aeroplano respectivo
    switch ( $.param[0] ) {
        case (=~ /izlude/i) {
            do conf -f aeroplano1 izlude
            do conf -f aeroplano2 none
        }
        case (=~ /rachel/i) {
            do conf -f aeroplano1 rachel
            do conf -f aeroplano2 none
        }
        case (=~ /hugel/i) {
            do conf -f aeroplano1 none
            do conf -f aeroplano2 hugel
        }
        case (=~ /lighthalzen/i) {
            do conf -f aeroplano1 none
            do conf -f aeroplano2 lighthalzen
        }
        case (=~ /einbroch/i) {
            do conf -f aeroplano1 none
            do conf -f aeroplano2 einbroch
        }
        case (=~ /[jy]uno/) {
            log VOCÊ QUER IR DE JUNO PRA JUNO?
            log PORQUE VOCÊ FARIA ISSO?
            stop
        }
        else {
            [
            log Você digitou um nome inválido, por favor tente novamente
            log Os valores podem ser:
            log izlude , rachel , juno ou yuno
            log hugel , lighthalzen ou einbroch
            log Escreva como quiser, desde que escreva certo
            ]
            stop
        }
    }
    $varAeroplano1 = &config(aeroplano1)
    $varAeroplano2 = &config(aeroplano2)
    do conf -f aeroplano_macroChamada aeroplano_junoPara "$.param[0]"
    do conf lockMap none
    do ai manual
    if ($.map ~ airplane, airplane_01) {
        log ja estamos no aeroplano, só esperar agora
    } else {
        if ( $.map != yuno ) do move yuno
    }
    log $varAeroplano1, $varAeroplano2
}

macro aeroplano_einbrochPara {
    set exclusive 1
    log Vamos ir de Eibroch para $.param[0]
    #se a cidade for juno hugel ou lighthalzen ele só pega 1 aeroplano
    # se for outra cidade, ele pega os dois aeroplanos
    switch ($.param[0]) {
        case (=~ /izlude/i) {
            do conf -f aeroplano1 izlude
            do conf -f aeroplano2 juno
        }
        case (=~ /rachel/i) {
            do conf -f aeroplano1 rachel
            do conf -f aeroplano2 juno
        }
        case (=~ /hugel/i) {
            do conf -f aeroplano1 none
            do conf -f aeroplano2 hugel
        }
        case (=~ /lighthalzen/i) {
            do conf -f aeroplano1 none
            do conf -f aeroplano2 lighthalzen
        }
        case (=~ /einbroch/i) {
            log VOCÊ QUER IR DE EINBROCH PRA EINBROCH?
            log PORQUE VOCÊ FARIA ISSO?
            stop
        }
        case (=~ /[jy]uno/) {
            do conf -f aeroplano1 none
            do conf -f aeroplano2 juno
        }
        else {
            [
            log Você digitou um nome inválido, por favor tente novamente
            log Os valores podem ser izlude , rachel , juno ou yuno ,
            log hugel , lighthalzen ou einbroch
            log pode ser com letra maiuscula ou sem
            ]
            stop
        }
    }
    $varAeroplano1 = &config(aeroplano1)
    $varAeroplano2 = &config(aeroplano2)
    do conf -f aeroplano_macroChamada aeroplano_einbrochPara "$.param[0]"
    do conf lockMap none
    do ai manual
    if ($.map ~ airplane, airplane_01) {
        log ja estamos no aeroplano, só esperar agora
    } else {
        do move airplane
    }
    log $varAeroplano1, $varAeroplano2
}

macro aeroplano_rachelPara {
    set exclusive 1
    log Vamos ir de Rachel para $.param[0]
    #se a cidade for izlude ou juno ele só pega 1 aeroplano
    # se for outra cidade, ele pega os dois aeroplanos

    switch ($.param[0]) {
        case (=~ /izlude/i) {
            do conf -f aeroplano1 izlude
            do conf -f aeroplano2 none
        }
        case (=~ /rachel/i) {
            log VOCÊ QUER IR DE RACHEL PRA RACHEL?
            log PORQUE VOCÊ FARIA ISSO?
            stop
        }
        case (=~ /hugel/i) {
            do conf -f aeroplano1 juno
            do conf -f aeroplano2 hugel
        }
        case (=~ /lighthalzen/i) {
            do conf -f aeroplano1 juno
            do conf -f aeroplano2 lighthalzen
        }
        case (=~ /einbroch/i) {
            do conf -f aeroplano1 juno
            do conf -f aeroplano2 einbroch
        }
        case (=~ /[jy]uno/) {
            do conf -f aeroplano1 juno
            do conf -f aeroplano2 none
        }
        else {
            [
            log Você digitou um nome inválido, por favor tente novamente
            log Os valores podem ser izlude , rachel , juno ou yuno ,
            log hugel , lighthalzen ou einbroch
            log pode ser com letra maiuscula ou sem
            ]
            stop
        }
    }
    $varAeroplano1 = &config(aeroplano1)
    $varAeroplano2 = &config(aeroplano2)
    do conf -f aeroplano_macroChamada aeroplano_rachelPara "$.param[0]"
    do conf lockMap none
    do ai manual
    if ( $.map ~ airplane, airplane_01) {
        log ja estamos no aeroplano, só esperar agora
    } else {
        do move ra_fild12 294 208
        do talk resp 0
        log $varAeroplano1, $varAeroplano2
    }
}

macro aeroplano_izludePara {
    set exclusive 1
    log Vamos ir de izlude para $.param[0]
    #se a cidade for izlude ou juno ele só pega 1 aeroplano
    # se for outra cidade, ele pega os dois aeroplanos

    switch ($.param[0]) {
        case (=~ /izlude/i) {
            log VOCÊ QUER IR DE IZLUDE PRA IZLUDE?
            log PORQUE VOCÊ FARIA ISSO?
            stop
        }
        case (=~ /rachel/i) {
            do conf -f aeroplano1 rachel
            do conf -f aeroplano2 none
        }
        case (=~ /hugel/i) {
            do conf -f aeroplano1 juno
            do conf -f aeroplano2 hugel
        }
        case (=~ /lighthalzen/i) {
            do conf -f aeroplano1 juno
            do conf -f aeroplano2 lighthalzen
        }
        case (=~ /einbroch/i) {
            do conf -f aeroplano1 juno
            do conf -f aeroplano2 einbroch
        }
        case (=~ /[jy]uno/) {
            do conf -f aeroplano1 juno
            do conf -f aeroplano2 none
        }
        else {
            [
            log Você digitou um nome inválido, por favor tente novamente
            log Os valores podem ser izlude , rachel , juno ou yuno ,
            log hugel , lighthalzen ou einbroch
            log pode ser com letra maiuscula ou sem
            ]
            stop
        }
    }
    $varAeroplano1 = &config(aeroplano1)
    $varAeroplano2 = &config(aeroplano2)
    do conf -f aeroplano_macroChamada aeroplano_izludePara "$.param[0]"
    do conf lockMap none
    do ai manual
    if ( $.map ~ airplane, airplane_01) {
        log ja estamos no aeroplano, só esperar agora
    } else {
        do move izlude 206 55
        do talknpc 206 55
        log $varAeroplano1, $varAeroplano2
    }
}

macro aeroplano_hugelPara {
    set exclusive 1
    log Vamos ir de Hugel para $.param[0]
    #se a cidade for izlude ou juno ele só pega 1 aeroplano
    # se for outra cidade, ele pega os dois aeroplanos

    switch ($.param[0]) {
        case (=~ /izlude/i) {
            do conf -f aeroplano1 izlude
            do conf -f aeroplano2 juno
        }
        case (=~ /rachel/i) {
            do conf -f aeroplano1 juno
            do conf -f aeroplano2 hugel
        }
        case (=~ /hugel/i) {
            log VOCÊ QUER IR DE HUGEL PRA HUGEL?
            log PORQUE VOCÊ FARIA ISSO?
            stop
        }
        case (=~ /lighthalzen/i) {
            do conf -f aeroplano1 none
            do conf -f aeroplano2 lighthalzen
        }
        case (=~ /einbroch/i) {
            do conf -f aeroplano1 none
            do conf -f aeroplano2 einbroch
        }
        case (=~ /[jy]uno/) {
            do conf -f aeroplano1 none
            do conf -f aeroplano2 juno
        }
        else {
            [
            log Você digitou um nome inválido, por favor tente novamente
            log Os valores podem ser izlude , rachel , juno ou yuno ,
            log lighthalzen ou einbroch
            log pode ser com letra maiuscula ou sem
            ]
            stop
        }
    }
    $varAeroplano1 = &config(aeroplano1)
    $varAeroplano2 = &config(aeroplano2)
    do conf -f aeroplano_macroChamada aeroplano_hugelPara "$.param[0]"
    do conf lockMap none
    do ai manual
    if ( $.map ~ airplane, airplane_01) {
        log ja estamos no aeroplano, só esperar agora
    } else {
        do move hugel 178 142
        do talk resp 0
        log $varAeroplano1, $varAeroplano2
    }
}

macro aeroplano_lighthalzenPara {
    set exclusive 1
    log Vamos ir de Eibroch para $.param[0]
    #se a cidade for juno hugel ou lighthalzen ele só pega 1 aeroplano
    # se for outra cidade, ele pega os dois aeroplanos
    switch ($.param[0]) {
        case (=~ /izlude/i) {
            do conf -f aeroplano1 izlude
            do conf -f aeroplano2 juno
        }
        case (=~ /rachel/i) {
            do conf -f aeroplano1 rachel
            do conf -f aeroplano2 juno
        }
        case (=~ /hugel/i) {
            do conf -f aeroplano1 none
            do conf -f aeroplano2 hugel
        }
        case (=~ /lighthalzen/i) {
            log VOCÊ QUER IR DE EINBROCH PRA EINBROCH?
            log PORQUE VOCÊ FARIA ISSO?
            stop
        }
        case (=~ /einbroch/i) {
            do conf -f aeroplano1 none
            do conf -f aeroplano2 einbroch
        }
        case (=~ /[jy]uno/) {
            do conf -f aeroplano1 none
            do conf -f aeroplano2 juno
        }
        else {
            [
            log Você digitou um nome inválido, por favor tente novamente
            log Os valores podem ser izlude , rachel , juno ou yuno ,
            log hugel , lighthalzen ou einbroch
            log pode ser com letra maiuscula ou sem
            ]
            stop
        }
    }
    $varAeroplano1 = &config(aeroplano1)
    $varAeroplano2 = &config(aeroplano2)
    do conf -f aeroplano_macroChamada aeroplano_lighthalzenPara "$.param[0]"
    do conf lockMap none
    do ai manual
    if ($.map ~ airplane, airplane_01) {
        log ja estamos no aeroplano, só esperar agora
    } else {
        do move airplane
    }
    log $varAeroplano1, $varAeroplano2
}

automacro dentroDoAeroplanoBugged {
    InMap airplane, airplane_01
    exclusive 1
    CheckOnAI manual
    ConfigKeyNot lockMap none
    call {
        do conf lockMap none
    }
}

automacro usarAeroplanoBugged {
    CheckOnAI auto
    exclusive 1
    ConfigKeyNot aeroplano1 none, aeroplano2 none
    call {
        #se essa macro se ativar, significa que a AI ta no automático
        #quando deveria estar no manual pra todas as outras macros se ativarem
        #aconteceria se no meio do uso da macro (mover ate la ou dentro do aeroplano)
        #o openkore fosse fechado
        do ai manual
        $macro = &config(aeroplano_macroChamada)
        [
        log ===================================
        log = chamando a macro $macro
        log ===================================
        ]
        call $macro
    }
}

automacro dentroDoAeroplanoInternacional_checagem {
    ConfigKeyNot aeroplano1 none
    InMap airplane_01
    CheckOnAI manual
    timeout 50
    call {
        if (! &defined($varAeroplano1) ) {
            $varAeroplano1 = &config(aeroplano1)
        }
        [
        log ===================================
        log Estamos no aeroplano, aguardando chegada ao destino
        log ===================================
        ]
    }
}

automacro dentroDoAeroplanoInternacional {
    InMap airplane_01
    CheckOnAI manual
    LocalMsg /Bem-vindo a $varAeroplano1|Welcome to $varAeroplano1/i
    exclusive 1
    call sairDoAeroplano
}

automacro dentroDoAeroplanoDomestico_checagem {
    ConfigKeyNot aeroplano2 none
    InMap airplane
    CheckOnAI manual
    timeout 50
    call {
        if (&defined($varAeroplano2) = 0) {
            $varAeroplano2 = &config(aeroplano2)
        }
        [
        log ===================================
        log Estou no aeroplano, aguardando chegada ao destino
        log ===================================
        ]
    }
}

automacro dentroDoAeroplanoDomestico {
    InMap airplane
    CheckOnAI manual
    LocalMsg /Bem-vindos a $varAeroplano2|Welcome to $varAeroplano2/i
    exclusive 1
    call sairDoAeroplano
}

macro sairDoAeroplano {
    
    # é preciso ser feito isso para que a Condição InMap funcione
    # já que o nome original da cidade é yuno
    # mas não pode ser mudado antes, porque dentro do aeroplano
    # o valor precisa ser juno
    if ( $varAeroplano1 = juno ) $varAeroplano1 = yuno
    if ( $varAeroplano2 = juno ) $varAeroplano2 = yuno

    do move 243 74
}

#Se estivermos na cidade, e o local desejado for essa cidade, ele completa o objetivo
#se estivermos na cidade, mas nao for o objetivo, nada acontece, já que provavelmente
#ele só está se locomovendo pra fazer qualquer outra coisa aleatoria que nao tem nada
# a ver com esse macro
automacro chegueiEmCidade2 {
    InMap $varAeroplano2
    NotInMap yuno
    CheckOnAI manual
    ConfigKey aeroplano2 $varAeroplano2
    exclusive 1
    call objetivoCompleto
}

automacro chegueiEmCidade1 {
    InMap $varAeroplano1
    NotInMap yuno
    CheckOnAI manual
    ConfigKey aeroplano1 $varAeroplano1
    exclusive 1
    call objetivoCompleto
}

automacro chegueiPertoDeRachel {
    InMap ra_fild12
    ConfigKey aeroplano1 rachel
    exclusive 1
    CheckOnAI manual
    call {
        log agora to bem perto de rachel
        log indo pra la
        do move rachel
    }
}
macro objetivoCompleto {
    #Se estivermos na cidade, e o local desejado for essa cidade, ele completa o objetivo
    #E automaticamente salva na cidade, usando a macro salvarNaCidade
    log cheguei em $.InMapLast , objetivo completo
    do conf aeroplano2 none
    do conf aeroplano1 none
    do conf aeroplano_macroChamada none
    do ai on
    do conf -f o_que_estou_fazendo acabeiDeChegarNaCidadeViaAeroplano
    call salvarNaCidade "$.InMapLast"
}

automacro chegueiEmJuno {
    InMap yuno
    CheckOnAI manual
    priority -20 #prioridade alta
    ConfigKeyNot aeroplano1 none, aeroplano2 none
    exclusive 1
    call {
        # é aqui que ocorre a mágica, quando chega em juno
        # ele detecta se precisa pegar outro aeroplano ou não
        # se ele precisar ele vai
        # se não precisar ele vai pra proximo da kafra e completa o objetivo
        log destino para aeroplano1 é: &config(aeroplano1)
        log destino para aeroplano2 é: &config(aeroplano2)
        
        if (&config(aeroplano1) =~ /rachel|izlude/i ) {
            do move airplane_01
        } elsif ( &config(aeroplano2) =~ /hugel|einbroch|lighthalzen/i ) {
            do move airplane
        } elsif ( &config(aeroplano1) =~  /[yj]uno/i || &config(aeroplano2) =~ /[yj]uno/i ) {
            do move &rand(150, 154) &rand(182, 186)
            call objetivoCompleto
        } else {
            log Falha em descobrir a rota correta, revise o código
        }
    }
}
#
#
#
# FIM DA MACRO DE SALVAR NO AEROPLANO
#

