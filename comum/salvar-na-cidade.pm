macro salvarNaCidade {
    call pararDeAtacar
    do conf lockMap none
    if (&config(master) =~ /Valhalla/ ) {
        do conf -f saveMap_sequenciaPraArmazenar r1 r0
    } else  {
        do conf -f saveMap_sequenciaPraArmazenar r1
    }
    switch ($.param[0]) {
        case (=~ /einbroch/i ) {
            do conf -f saveMap_desejado einbroch
            do conf -f saveMap_posicaoKafra 242 205
            do conf -f saveMap_posicaoNpcVenda einbroch 224 207
            do conf -f saveMap_posicaoNpcPraPocao ein_in01 189 15
        }
        case (=~ /aldebaran/i ) {
            do conf -f saveMap_desejado aldebaran
            do conf -f saveMap_posicaoKafra 143 119
            do conf -f saveMap_posicaoNpcVenda aldebaran 165 107
            do conf -f saveMap_posicaoNpcPraPocao aldeba_in 94 56
        }
        case (=~ /juno|yuno/i ) {
            do conf -f saveMap_desejado yuno
            do conf -f saveMap_posicaoKafra 152 187
            do conf -f saveMap_posicaoNpcVenda yuno 163 187
            do conf -f saveMap_posicaoNpcPraPocao yuno 218 97
        }
        case (=~ /rachel/i ) {
            do conf -f saveMap_desejado rachel
            do conf -f saveMap_posicaoKafra 109 138
            do conf -f saveMap_posicaoNpcVenda ra_in01 257 269
            do conf -f saveMap_posicaoNpcPraPocao ra_in01 257 269
        }
        case (=~ /comodo/i ) {
            do conf -f saveMap_desejado comodo
            do conf -f saveMap_posicaoKafra 195 150
            do conf -f saveMap_posicaoNpcVenda cmd_in01 79 182
            do conf -f saveMap_posicaoNpcPraPocao moc_ruins 114 63
        }
        case (=~ /prontera/i ) {
            do conf -f saveMap_desejado prontera
            do conf -f saveMap_posicaoKafra 151 29
            do conf -f saveMap_posicaoNpcVenda prontera 113 42
            do conf -f saveMap_posicaoNpcPraPocao prt_in 126 76
        }
        case (=~ /payon/i ) {
            do conf -f saveMap_desejado payon
            do conf -f saveMap_posicaoKafra 181 104
            do conf -f saveMap_posicaoNpcVenda payon 159 96
            do conf -f saveMap_posicaoNpcPraPocao payon_in01 5 49
        }
        case (=~ /geffen/i ) {
            do conf -f saveMap_desejado geffen
            do conf -f saveMap_posicaoKafra 120 62
            do conf -f saveMap_posicaoNpcVenda geffen_in 74 144
            do conf -f saveMap_posicaoNpcPraPocao geffen_in 77 167
        }
        case (=~ /morocc|morroc|morooc/i ) {
            do conf -f saveMap_desejado morocc
            do conf -f saveMap_posicaoKafra 156 97
            do conf -f saveMap_posicaoNpcVenda morocc_in 141 67
            do conf -f saveMap_posicaoNpcPraPocao moc_ruins 114 63
        }
        case (=~ /izlude/i ) {
            do conf -f saveMap_desejado izlude
            do conf -f saveMap_posicaoKafra 134 88
            do conf -f saveMap_posicaoNpcVenda izlude 105 99
            do conf -f saveMap_posicaoNpcPraPocao izlude_in 115 61
        }
        case ( =~ /veins/i ) {
            do conf -f saveMap_desejado veins
            do conf -f saveMap_posicaoKafra 208 128
            do conf -f saveMap_posicaoNpcVenda ve_in 243 303
            do conf -f saveMap_posicaoNpcPraPocao ve_in 243 303
        }
        case (=~ /alberta/i ) {
            do conf -f saveMap_desejado alberta
            do conf -f saveMap_posicaoKafra 113 60
            do conf -f saveMap_posicaoNpcVenda alberta_in 182 97
            do conf -f saveMap_posicaoNpcPraPocao alberta_in 182 97
        }
        case ( =~ /hugel/i ) {
            do conf -f saveMap_desejado hugel
            do conf -f saveMap_posicaoKafra 88 168
            do conf -f saveMap_posicaoNpcVenda hugel 77 167
            do conf -f saveMap_posicaoNpcPraPocao # não tem infelizmente!
        }
        else {
            [
            log =====================================
            log = nome da cidade inválido, tente novamente...
            log = nome é: $.param[0]
            log = Talvez o nome foi escrito errado?
            log =====================================
            ]
            stop
        }
    }

    [
    log =============================================
    log =Iniciando seguência de salvamento em &config(saveMap_desejado)
    log =============================================
    ]
    do ai manual
    do conf -f o_que_estou_fazendo indoSalvarem $.param[0]
    do conf -f naSequenciaDeSalvamento true

}

automacro definirVariavelSaveMap {
    exclusive 1
    run-once 1
    ConfigKeyNot saveMap_desejado           none
    ConfigKeyNot saveMap_posicaoKafra       none
    ConfigKeyNot saveMap_posicaoNpcVenda    none
    ConfigKey naSequenciaDeSalvamento true
    priority -4
    CheckOnAI auto, manual
    call {
        $saveMap = &config(saveMap_desejado)
        do ai manual
    }
}

automacro salvarNaCidade_bugged {
    exclusive 1
    ConfigKey saveMap_desejado           none
    ConfigKey saveMap_posicaoKafra       none
    ConfigKey saveMap_posicaoNpcVenda    none
    ConfigKey naSequenciaDeSalvamento true
    CheckOnAI auto, manual
    call {
        [
        log ===================================
        log = tem algum bug bem sério
        log = tentando resolver
        log ===================================
        ]
        do conf -f naSequenciaDeSalvamento false
    }
}

automacro jaToSalvoNessaCidade {
    exclusive 1
    ConfigKey naSequenciaDeSalvamento true
    ConfigKey saveMap $saveMap
    CheckOnAI manual
    ConfigKeyNot saveMap_desejado none
    call {
        [
        log ==============================================
        log já esta salvo em $saveMap , nao precisa fazer a sequencia toda denovo
        log mas só por precaução, as configurações serão feitas
        log ==============================================
        ]

        do conf saveMap $saveMap
        do conf storageAuto_npc $saveMap &config(saveMap_posicaoKafra)
        do conf storageAuto 1
        do conf sellAuto 1
        do conf sellAuto_npc &config(saveMap_posicaoNpcVenda)
        do conf storageAuto_npc_type 3
        do conf storageAuto_npc_steps &config(saveMap_sequenciaPraArmazenar)

        do conf saveMap $saveMap
        do conf saveMap_sequenciaPraArmazenar none
        do conf saveMap_desejado none
        do conf saveMap_posicaoKafra none
        do conf saveMap_posicaoNpcVenda none
        do conf saveMap_posicaoNpcPraPocao none
        do conf naSequenciaDeSalvamento false
        do ai on
        release definirVariavelSaveMap
    }
}

automacro movendoPraKafraForaDaCidade {
    exclusive 1
    CheckOnAI manual
    ConfigKey naSequenciaDeSalvamento true
    ConfigKeyNot saveMap_desejado none
    ConfigKeyNot saveMap $saveMap
    NotInMap $saveMap
    call move_to_near_kafra
}

automacro movendoPraKafraDentroDaCidade {
    exclusive 1
    CheckOnAI manual
    ConfigKeyNot saveMap $saveMap
    ConfigKeyNot saveMap_desejado none
    NpcNotNear /Kafra Employee|Funcionária Kafra|Corp.|Kafra Recepc/
    InMap $saveMap
    call move_to_near_kafra
}

macro move_to_near_Kafra {
    log estou indo para a kafra em $saveMap &config(saveMap_posicaoKafra)
    do move $saveMap &config(saveMap_posicaoKafra) &random("1","2","3","4","5")
}

automacro FalarComKafra {
    CheckOnAI manual
    ConfigKey naSequenciaDeSalvamento true
    ConfigKeyNot saveMap $saveMap
    ConfigKeyNot saveMap_desejado none
    InMap $saveMap
    NpcNear /Kafra Employee|Funcionária Kafra|Corp.|Kafra Recepc/
    delay 2
    timeout 20
    call {
        log ===============================================
        log Falando com kafra na posição: &config(saveMap_posicaoKafra)
        log ===============================================
        do talknpc &config(saveMap_posicaoKafra) r0
    }
}

automacro SalvoNaKafra {
    exclusive 1
    CheckOnAI manual
    priority -5
    NpcMsgName /O seu Ponto (de Retorno )?foi salvo|saved here|foi salvo aqui na cidade|foi salvo em|foi salvo aqui/ /Kafra Employee|Funcionária Kafra|Corp|Kafra Recepc/
    ConfigKeyNot saveMap $saveMap
    ConfigKey naSequenciaDeSalvamento true
    InMap $saveMap
    call {
        [
        if (&config(storageAuto) != 1) do conf storageAuto 1
        if (&config(sellAuto) != 1) do conf sellAuto 1
        if (&config(storageAuto_npc_type) != 3) do conf storageAuto_npc_type 3
        do conf storageAuto_npc_steps &config(saveMap_sequenciaPraArmazenar) if (&config(storageAuto_npc_steps) != &config(saveMap_sequenciaPraArmazenar))
        do conf saveMap $saveMap
        do conf storageAuto_npc $saveMap &config(saveMap_posicaoKafra)
        do conf sellAuto_npc &config(saveMap_posicaoNpcVenda)
        ]
        
        #felizmente TODOS os npcs que vendem poção amarela, também vendem flecha normal
        $continuarLoop = sim
        $i = 0
        while ($continuarLoop = sim && &config(saveMap_posicaoNpcPraPocao) != -1) {
            
            if (&config(buyAuto_$i) =~ /Poção|Flecha/i) {
                [
                log ===================================
                log = configurando bloco "buyAuto_$i"
                log ===================================
                ]
                do conf buyAuto_$i_npc &config(saveMap_posicaoNpcPraPocao)
            }

            if (checarSeExisteNoConfig("buyAuto_$i") = nao) {
                $continuarLoop = nao
            } elsif (&config(buyAuto_$i) = -1) {
                $continuarLoop = nao
            }
            $i++
        }

        [
        do conf saveMap_sequenciaPraArmazenar none
        do conf saveMap_desejado none
        do conf saveMap_posicaoKafra none
        do conf saveMap_posicaoNpcVenda none
        do conf saveMap_posicaoNpcPraPocao none
        do conf naSequenciaDeSalvamento false
        
        release definirVariavelSaveMap
        do ai on

        log ================================
        log =Salvo em &config(saveMap)
        log ================================
        ]
        do conf -f o_que_estou_fazendo acabeiDeSalvarNaKafraDe $saveMap
    }
}

automacro saveMapNone {
    ConfigKey saveMap none
    exclusive 1
    JobIDNot 0
    JobIDNot 4023
    call {
        do conf -f saveMap indefinido
    }
}
#
#
#
# FIM DA MACRO DE SALVAR NA KAFRA
#

