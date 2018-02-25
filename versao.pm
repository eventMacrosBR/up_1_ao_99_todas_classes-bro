automacro versao { 
    BaseLevel > 0 
    priority -999 
    run-once 1 
    call { 
        [ 
        log ================================================================= 
        log   EventMacrosBR /               
        log                  up_1_ao_99_todas_classes-bro  
        log   Versão: <versao>
        log   https://github.com/eventMacrosBR/up_1_ao_99_todas_classes-bro 
        log ================================================================= 
        ] 
        log Versão <versao> da macro
        do conf -f versao_eventmacro_up_todas_as_classes_bro <versao>
    } 
} 
 
