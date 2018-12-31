automacro versao {
    BaseLevel > 0
    priority -999 #sempre a primeira a ser executada
    exclusive 1
    run-once 1
    call {
        [
        log =================================================================
        log   EventMacrosBR / up_1_ao_99_todas_classes-bro
        log   Versão: <versao>
        log   https://github.com/eventMacrosBR/up_1_ao_99_todas_classes-bro
        log   Em caso de duvidas digite:
        log   eventMacro ajuda
        log =================================================================
        ]
        do conf -f versao_eventmacro_up_todas_as_classes_bro <versao>
    }
}
 
