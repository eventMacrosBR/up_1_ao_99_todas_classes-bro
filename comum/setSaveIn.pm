macro SetSaveIn {
    call pararDeAtacar
    do conf lockMap none
    do conf -f saveMap_storage_sequence c r1
    do conf -f saveMap_save_sequence c r0
    switch ($.param[0]) {
        case (=~ /einbroch/i ) {
            do conf -f saveMap_wanted einbroch
            do conf -f saveMap_kafra_position 242 205
            do conf -f saveMap_sellNpc_position einbroch 224 207
        }
        case (=~ /aldebaran/i ) {
            do conf -f saveMap_wanted aldebaran
            do conf -f saveMap_kafra_position 143 119
            do conf -f saveMap_sellNpc_position aldebaran 165 107
        }
        case (=~ /juno|yuno/i ) {
            do conf -f saveMap_wanted yuno
            do conf -f saveMap_kafra_position 152 187
            do conf -f saveMap_sellNpc_position yuno_in01 25 34
        }
        case (=~ /rachel/i ) {
            do conf -f saveMap_wanted rachel
            do conf -f saveMap_kafra_position 109 138
            do conf -f saveMap_sellNpc_position rachel 65 80
        }
        case (=~ /comodo/i ) {
            do conf -f saveMap_wanted comodo
            do conf -f saveMap_kafra_position 195 150
            do conf -f saveMap_sellNpc_position cmd_in01 79 182
            do conf buyAuto_1_npc cmd_in01 79 182
        }
        case (=~ /prontera/i ) {
            do conf -f saveMap_wanted prontera
            do conf -f saveMap_kafra_position 151 29
            do conf -f saveMap_sellNpc_position prontera 113 42
            do conf buyAuto_1_npc prt_in 126 76
        }
        case (=~ /payon/i ) {
            do conf -f saveMap_wanted payon
            do conf -f saveMap_kafra_position 181 104
            do conf -f saveMap_sellNpc_position payon_in01 5 49
            do conf buyAuto_1_npc payon_in01 5 49
        }
        case (=~ /geffen/i ) {
            do conf -f saveMap_wanted geffen
            do conf -f saveMap_kafra_position 120 62
            do conf -f saveMap_sellNpc_position geffen_in 74 144
            do conf buyAuto_1_npc geffen_in 77 167
        }
        case (=~ /morocc|morroc|morooc/i ) {
            do conf -f saveMap_wanted morocc
            do conf -f saveMap_kafra_position 156 97
            do conf -f saveMap_sellNpc_position morocc_in 141 67
            do conf buyAuto_1_npc moc_ruins 114 63
        }
        case (=~ /izlude/i ) {
            do conf -f saveMap_wanted izlude
            do conf -f saveMap_kafra_position 134 88
            do conf -f saveMap_sellNpc_position izlude 105 99
            do conf buyAuto_1_npc izlude_in 115 61
        }
        case ( =~ /veins/i ) {
            do conf -f saveMap_wanted veins
            do conf -f saveMap_kafra_position 207 128
            do conf -f saveMap_sellNpc_position ve_in 243 303
        }
        else {
            log nome da cidade inválido, tente novamente...
            log nome é: $.param[0]
            log Talvez o nome foi escrito errado?
            stop
        }
    }
    [
    log =============================================
    log =Iniciando seguência de salvamento em &config(saveMap_wanted)
    log =============================================
    ]
    do ai manual
    do conf -f o_que_estou_fazendo indoSalvarem $.param[0]
    do conf -f In_saveMap_sequence true

}

automacro set_savemap_variables {
    exclusive 1
    run-once 1
    ConfigKey In_saveMap_sequence true
    priority -4
    CheckOnAI auto, manual
    call {
        $saveMap = &config(saveMap_wanted)
        do ai manual
    }
}

automacro jaToSalvoNessaCidade {
    exclusive 1
    ConfigKey In_saveMap_sequence true
    ConfigKey saveMap $saveMap
    CheckOnAI manual
    ConfigKeyNot saveMap_wanted none
    call {
        [
        log ==============================================
        log já esta salvo em $saveMap , nao precisa fazer a sequencia toda denovo
        log mas só por precaução, as configurações serão feitas
        log ==============================================
        ]

        do conf saveMap $saveMap
        do conf storageAuto_npc $saveMap &config(saveMap_kafra_position)
        do conf storageAuto 1
        do conf sellAuto 1
        do conf sellAuto_npc &config(saveMap_sellNpc_position)
        do conf storageAuto_npc_type 3
        do conf storageAuto_npc_steps &config(saveMap_storage_sequence)

        do conf saveMap $saveMap
        do conf saveMap_storage_sequence none
        do conf saveMap_wanted none
        do conf saveMap_kafra_position none
        do conf saveMap_sellNpc_position none
        do conf In_saveMap_sequence false
        do ai on
        release set_savemap_variables
    }
}

automacro movendoPraKafraForaDaCidade {
    exclusive 1
    CheckOnAI manual
    ConfigKey In_saveMap_sequence true
    ConfigKeyNot saveMap_wanted none
    ConfigKeyNot saveMap $saveMap
    NotInMap $saveMap
    call move_to_near_kafra
}

automacro movendoPraKafraDentroDaCidade {
    exclusive 1
    CheckOnAI manual
    ConfigKeyNot saveMap $saveMap
    ConfigKeyNot saveMap_wanted none
    NpcNotNear /(Kafra Employee|Funcionária Kafra|Corp. Ev. Incríveis)/
    InMap $saveMap
    call move_to_near_kafra
}

macro move_to_near_Kafra {
    log estou indo para a kafra em $saveMap &config(saveMap_kafra_position)
    do move $saveMap &config(saveMap_kafra_position) &random("1","2","3","4","5")
}

automacro FalarComKafra {
    CheckOnAI manual
    ConfigKey In_saveMap_sequence true
    ConfigKeyNot saveMap $saveMap
    ConfigKeyNot saveMap_wanted none
    InMap $saveMap
    NpcNear /(Kafra Employee|Funcionária Kafra|Corp. Ev. Incríveis)/
    delay 2
    timeout 20
    call {
        log ==============================================================
        log Falando com kafra na posição: &config(saveMap_kafra_position)
        log Usando a sequência: &config(saveMap_save_sequence)
        log ==============================================================
        do talknpc &config(saveMap_kafra_position) &config(saveMap_save_sequence)
    }
}

automacro SalvoNaKafra {
    exclusive 1
    CheckOnAI manual
    priority -5
    NpcMsgName /O seu Ponto (de Retorno )?foi salvo|saved here|foi salvo aqui na cidade/ /(Kafra Employee|Funcionária Kafra|Corp)/
    ConfigKeyNot saveMap $saveMap
    ConfigKey In_saveMap_sequence true
    InMap $saveMap
    call {
        [
        do conf saveMap $saveMap
        do conf storageAuto_npc $saveMap &config(saveMap_kafra_position)
        do conf storageAuto 1
        do conf sellAuto 1
        do conf sellAuto_npc &config(saveMap_sellNpc_position)
        do conf storageAuto_npc_type 3
        do conf storageAuto_npc_steps &config(saveMap_storage_sequence)

        do conf saveMap_storage_sequence none
        do conf saveMap_wanted none
        do conf saveMap_kafra_position none
        do conf saveMap_sellNpc_position none
        do conf In_saveMap_sequence false
        release set_savemap_variables
        do ai on

        log ===========================================
        log =Salvo em &config(saveMap)
        log ===========================================
        ]
        do conf -f o_que_estou_fazendo acabeiDeSalvarNaKafraDe $saveMap
    }
}
#
#
#
# FIM DA MACRO DE SALVAR NA KAFRA
#

