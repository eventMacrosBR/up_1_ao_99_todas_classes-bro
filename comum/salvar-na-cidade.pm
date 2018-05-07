macro SetSaveIn {
    call pararDeAtacar
    do conf lockMap none
    if (&config(master) =~ /Valhalla/ ) {
        do conf -f saveMap_storage_sequence r1 r0
    } else  {
        do conf -f saveMap_storage_sequence r1 
    }
    switch ($.param[0]) {
        case (=~ /einbroch/i ) {
            do conf -f saveMap_wanted einbroch
            do conf -f saveMap_kafra_position 242 205
            do conf -f saveMap_sellNpc_position einbroch 224 207
            do conf -f saveMap_potionNpc_position ein_in01 189 15
        }
        case (=~ /aldebaran/i ) {
            do conf -f saveMap_wanted aldebaran
            do conf -f saveMap_kafra_position 143 119
            do conf -f saveMap_sellNpc_position aldebaran 165 107
            do conf -f saveMap_potionNpc_position aldeba_in 94 56
        }
        case (=~ /juno|yuno/i ) {
            do conf -f saveMap_wanted yuno
            do conf -f saveMap_kafra_position 152 187
            do conf -f saveMap_sellNpc_position yuno 163 187
            do conf -f saveMap_potionNpc_position yuno 218 97
        }
        case (=~ /rachel/i ) {
            do conf -f saveMap_wanted rachel
            do conf -f saveMap_kafra_position 109 138
            do conf -f saveMap_sellNpc_position ra_in01 257 269
            do conf -f saveMap_potionNpc_position ra_in01 257 269
        }
        case (=~ /comodo/i ) {
            do conf -f saveMap_wanted comodo
            do conf -f saveMap_kafra_position 195 150
            do conf -f saveMap_sellNpc_position cmd_in01 79 182
            do conf -f saveMap_potionNpc_position cmd_in01 79 182
        }
        case (=~ /prontera/i ) {
            do conf -f saveMap_wanted prontera
            do conf -f saveMap_kafra_position 151 29
            do conf -f saveMap_sellNpc_position prontera 113 42
            do conf -f saveMap_potionNpc_position prt_in 126 76
        }
        case (=~ /payon/i ) {
            do conf -f saveMap_wanted payon
            do conf -f saveMap_kafra_position 181 104
            do conf -f saveMap_sellNpc_position payon 159 96
            do conf -f saveMap_potionNpc_position payon_in01 5 49
        }
        case (=~ /geffen/i ) {
            do conf -f saveMap_wanted geffen
            do conf -f saveMap_kafra_position 120 62
            do conf -f saveMap_sellNpc_position geffen_in 74 144
            do conf -f saveMap_potionNpc_position geffen_in 77 167
        }
        case (=~ /morocc|morroc|morooc/i ) {
            do conf -f saveMap_wanted morocc
            do conf -f saveMap_kafra_position 156 97
            do conf -f saveMap_sellNpc_position morocc_in 141 67
            do conf -f saveMap_potionNpc_position moc_ruins 114 63
        }
        case (=~ /izlude/i ) {
            do conf -f saveMap_wanted izlude
            do conf -f saveMap_kafra_position 134 88
            do conf -f saveMap_sellNpc_position izlude 105 99
            do conf -f saveMap_potionNpc_position izlude_in 115 61
        }
        case ( =~ /veins/i ) {
            do conf -f saveMap_wanted veins
            do conf -f saveMap_kafra_position 208 128
            do conf -f saveMap_sellNpc_position ve_in 243 303
            do conf -f saveMap_potionNpc_position ve_in 243 303
        }
        case (=~ /alberta/i ) {
        	do conf -f saveMap_wanted alberta
            do conf -f saveMap_kafra_position 113 60
            do conf -f saveMap_sellNpc_position alberta_in 182 97
            do conf -f saveMap_potionNpc_position alberta_in 182 97
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

automacro definirVariavelSaveMap {
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
        do conf saveMap_potionNpc_position none
        do conf In_saveMap_sequence false
        do ai on
        release definirVariavelSaveMap
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
    NpcNotNear /Kafra Employee|Funcionária Kafra|Corp./
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
    NpcNear /Kafra Employee|Funcionária Kafra|Corp./
    delay 2
    timeout 20
    call {
        log ==============================================================
        log Falando com kafra na posição: &config(saveMap_kafra_position
        log ==============================================================
        do talknpc &config(saveMap_kafra_position) r0
    }
}

automacro SalvoNaKafra {
    exclusive 1
    CheckOnAI manual
    priority -5
    NpcMsgName /O seu Ponto (de Retorno )?foi salvo|saved here|foi salvo aqui na cidade|foi salvo em/ /Kafra Employee|Funcionária Kafra|Corp/
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
        do conf saveMap_potionNpc_position none
        do conf In_saveMap_sequence false

        $continuarLoop = sim
	    $i = 0
	    while ($continuarLoop = sim && checarSeExisteComando("buyAuto_$i") = sim) {
	    	if (&config(buyAuto_$i) =~ /Poção/i) {
	    		do conf buyAuto_$i_npc &config(saveMap_potionNpc_position)
	    	}

	    	if (a&config(buyAuto_$i) = a) {
	    		$continuarLoop = nao
	    	}
	    	$i++
	    }

	    #felizmente TODOS os npcs que vendem poção amarela, também vendem flecha normal
	    $continuarLoop = sim
	    $i = 0
	    while ($continuarLoop = sim && checarSeExisteComando("buyAuto_$i") = sim) {
	    	if (&config(buyAuto_$i) =~ /Flecha/i) {
	    		do conf buyAuto_$i_npc &config(saveMap_potionNpc_position)
	    	}

	    	if (a&config(buyAuto_$i) = a) {
	    		$continuarLoop = nao
	    	}
	    	$i++
	    }

        release definirVariavelSaveMap
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

