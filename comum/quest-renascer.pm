sub inicializarParametrosQuestClasseRenascer {
    my %parametrosQuestClasseRenascer = (
        renascer => 'nao',
        amigo => '',
        #observação sobre o ponto de encontro:
        #só poderá ser as coordenadas, não coloque nome de cidade aqui, senão é treta
        #a cidade sempre será obrigatoriamente em juno, já que o reborn se passa por lá
        #altere a coordenada a seu prazer, fique a vontade
        pontoDeEncontro => '146 116'
    );
    my $eventMacro = $eventMacro::Data::eventMacro;
    $eventMacro->set_full_hash('parametrosQuestClasseRenascer', \%parametrosQuestClasseRenascer);
}

automacro questRenascer_chegueilvl99 {
    BaseLevel = 99
    JobLevel = 50
    JobID $parametrosClasses{idC2}, $parametrosClasses{idC2Alt}
    CharCurrentWeight != 0
    Zeny != 1285000
    Zeny != 0
    exclusive 1
    timeout 60
    ConfigKey estagio_Reborn none
    macro_delay 2
    call {
        if ($parametrosQuestClasseRenascer{renascer} = nao) {
            [
            log ESTOU LVL 99 MAS FUI CONFIGURADO PRA NAO REBORNAR
            log É BOM CASO VC QUEIRA FARMAR ZENY COM CLASSE 2
            log SE QUISER REBORNAR, PROCURE POR :
            log renascer => nao 
            log E TROQUE POR sim
            ]
            lock chamarAmigo
        } else {
            do pm "$parametrosQuestClasseRenascer{amigo}" ajudaRebornar    
            log peso atual: $.weight
            log peso percentual: $.weightpercent
            [
            do conf dealAuto 3
            do conf dealAuto_names $parametrosQuestClasseRenascer{amigo}
            do iconf Camisa de Algodão 0 1 0
            do iconf "Faca [3]" 0 1 0

            # é uma forma que eu pensei de desabilitar TODOS os getAuto
            # independente de quantos hajam
            $continuarLoop = sim
            $i = 0
            while ($continuarLoop = sim) {
                if (checarSeExisteComando("getAuto_$i_disabled") = sim) {
                    do conf getAuto_$i_disabled 1
                } else {
                    $continuarLoop = nao
                }
                $i++
            }
            #desabilitar TODOS os buyAuto
            $continuarLoop = sim
            $i = 0
            while ($continuarLoop = sim) {
                if (checarSeExisteComando("buyAuto_$i_disabled") = sim) {
                    do conf buyAuto_$i_disabled 1
                } else {
                    $continuarLoop = nao
                }
                $i++
            }
            do conf lockMap none
            do conf attackAuto -1
            do conf route_randomWalk 0
            do conf relogAfterStorage 0
            do conf storageAuto 1
            do conf storageAuto_npc yuno 152 187
            do conf sellAuto 1
            do conf sellAuto_npc yuno_in01 25 34
            ]
            #desequipando tudo
            @slots = (topHead, midHead, lowHead, rightHand, leftHand, armor, robe, shoes, rightAccessory, leftAccessory, arrow)
            
            $i = 0
            while ($i < @slots) {
                desequipar("$slots[$i]")
                pause 0.5
                $i++
            }
            [
            log ============================
            log TENTANDO FICAR COM 0 DE PESO
            log ============================
            ]
            do conf -f o_que_estou_fazendo tentandoRebornar
            do conf -f estagio_Reborn preparando
        }
    }
}

automacro questRenascer_salvarNaCidadeQueVouUparEDefinirVariavel {
    ConfigKey estagio_Reborn preparando
    exclusive 1
    priority -10 #prioridade mais alta
    run-once 1
    CharCurrentWeight = 0
    call {
        #essa automacro tem por objetivo, salvar seu personagem
        #na cidade em que ele vai upar quando tiver lvl 1 renascido
        #evita problemas de o char lvl 1 morrer e voltar pra juno
        #sem dinheiro pra ir pro mapa certo
        #pega o mapa do lvl 1
        extrairMapasDeUp(1)
        $mapaQueVouUparNolvl1 = $mapa{saveMap}
        if (&config(saveMap) != $mapaQueVouUparNolvl1) {
            call salvarNaCidade "$mapaQueVouUparNolvl1"
        }
    }
}

automacro questRenascer_chamarAmigo {
    exclusive 1
    timeout 60
    JobID $parametrosClasses{idC2}, $parametrosClasses{idC2Alt}
    ConfigKey estagio_Reborn preparando
    Zeny != 1285000
    Zeny != 0
    ConfigKey saveMap $mapaQueVouUparNolvl1
    CharCurrentWeight != 0
    CheckOnAI auto,manual
    BaseLevel = 99
    JobLevel = 50
    priority -5 #prioridade alta
    call {
        $vezesQueTentouZerarPeso++

        if ( $vezesQueTentouZerarPeso > 2 ) {
            [
            log já tentei ficar com peso zero,
            log pra poder rebornar
            log mas sem sucesso, esvazie seu bot manualmente
            log (provavelmente algum item configurado pra não guardar
            log tipo pots ou os itens da quest 2 ou sei lá)
            log quando tiver terminado, feche e abra o openkore novamente
            ]
            do ai manual
            lock chamarAmigo
            do conf -f o_que_estou_fazendo tentandoRebornar_aindaEstouComPeso
            stop
        }
        do ai on
        @falas = (da um help pra rebornar, ajudaRebornar, preciso de ajuda pra rebornar)
        do pm "$parametrosQuestClasseRenascer{amigo}" $falas[&rand(0,2)]
        
        do iconf 502 0 1 0
        do conf storageAuto_npc yuno 152 187
        do conf sellAuto_npc yuno_in01 25 34
        #esvazia tudo pra ficar com 0 de peso
        do autosell #se bem me lembro, ele ta autostorage logo depois, o que é bom
        do autostorage
    }
}

automacro questRenascer_irNoLocalPraNegociar {
    BaseLevel = 99
    JobLevel = 50
    overrideAI 1
    ConfigKey saveMap $mapaQueVouUparNolvl1
    CharCurrentWeight = 0
    ConfigKey estagio_Reborn preparando
    Zeny != 1285000  #vamos ficar com o zeny certo
    Zeny != 0
    exclusive 1
    timeout 50
    call {        
        do conf storageAuto_npc yuno 152 187
        do conf sellAuto_npc yuno_in01 25 34
        $vezesQuePediPraVir++
        if ($vezesQuePediPraVir > 2) {
            do pm "$parametrosQuestClasseRenascer{amigo}" vou ficar spammando isso ate vc chegar perto de mim
            do pm "$parametrosQuestClasseRenascer{amigo}" vem em juno $parametrosQuestClasseRenascer{pontoDeEncontro}
        }
        
        do pm "$parametrosQuestClasseRenascer{amigo}" vem aqui em juno $parametrosQuestClasseRenascer{pontoDeEncontro}
        do pm "$parametrosQuestClasseRenascer{amigo}" quando chegar, negocia comigo
        #movendo pra local especifico
        do move yuno $parametrosQuestClasseRenascer{pontoDeEncontro} &rand(1,2)
    }
}

automacro questRenascer_amigoPertoPedindoTrade {
    CharCurrentWeight 0
    Zeny != 1285000
    priority -5
    ConfigKey estagio_Reborn preparando
    InMap yuno
    PlayerNear /$parametrosQuestClasseRenascer{amigo}/
    timeout 20
    call {
        lock irNoLocalPraNegociar
        do conf -f o_que_estou_fazendo tentandoRebornar_esperandoNegociação
        log posição do $parametrosQuestClasseRenascer{amigo}: $.PlayerNearLastDist 
        if ($.PlayerNearLastDist  > 3) {
            do pm "$parametrosQuestClasseRenascer{amigo}" ow, chega mais perto pow
        } else { 
            do deal &player($parametrosQuestClasseRenascer{amigo})
        }
    }
}

automacro questRenascer_amigoPertoRecebiTrade {
    CharCurrentWeight 0
    Zeny != 1285000
    priority -5
    ConfigKey estagio_Reborn preparando
    InMap yuno
    PlayerNear /$parametrosQuestClasseRenascer{amigo}/
    timeout 10
    SimpleHookEvent incoming_deal
    macro_delay 0.2
    call {
        lock irNoLocalPraNegociar
        pause 1
        do deal
    }
}

automacro questRenascer_dandoOuReceBendoZeny {
    CharCurrentWeight 0
    Zeny != 1285000
    ConfigKey estagio_Reborn preparando
    IsInMapAndCoordinate yuno 145..147 115..117 #lugar pra negociar
    PlayerNear /$parametrosQuestClasseRenascer{amigo}/ 
    SimpleHookEvent engaged_deal
    priority -5
    call {
        lock amigoPerto_pedindoPraDarTrade
        pause 3
        $zenyPraDar = &eval($.zeny - 1285000)
        if ( $zenyPraDar > 0) {
            pause 2
            #se o zeny atual for maior que 1285000, vc dá o excedente pro mercador
            do deal add z $zenyPraDar
            do pm "$parametrosQuestClasseRenascer{amigo}" coloquei o zeny, finaliza ai
        } else {
            #se o zeny atual for menor que 1285000, vc manda pro mercador via pm quanto mais precisa
            $zenyQuePreciso = &eval(1285000 - $.zeny)
            do pm "$parametrosQuestClasseRenascer{amigo}" preciso da quantia de exatamente $zenyQuePreciso zenys
        }
        do deal
        pause 3
        do deal
    }
}

automacro questRenascer_finalizarTrade {
    SimpleHookEvent finalized_deal
    PlayerNear /$parametrosQuestClasseRenascer{amigo}/
    CharCurrentWeight 0
    Zeny != 1285000
    ConfigKey estagio_Reborn preparando
    call {
        do deal
    }
}

automacro questRenascer_tudoCertoVamosRebornar {
    BaseLevel = 99
    JobLevel = 50
    CharCurrentWeight = 0
    Zeny = 1285000
    exclusive 1
    ConfigKeyNot estagio_Reborn 1
    ConfigKeyNot estagio_Reborn 2
    ConfigKeyNot estagio_Reborn 3
    ConfigKeyNot estagio_Reborn 4
    call {
        do conf -f o_que_estou_fazendo indoRebornar!!!
        # se tiver tudo certinho pra começar o reborn ,essa automacro ativa
        do conf -f estagio_Reborn 1
    }
}

automacro questRenascer__primeiroEstagio {
    ConfigKey estagio_Reborn 1
    InMap yuno
    exclusive 1
    call {
        [
        do ai auto
        do conf lockMap 0
        do conf attackAuto 0
        do conf route_randomWalk 0
        do conf sitAuto_idle 0
        ]
        do move yuno_in02
        if ($.map = yuno_in02) do conf estagio_Reborn 2
    }
}
automacro questRenascer_primeiroEstagio_bugada {
    ConfigKey estagio_Reborn 1
    NotInMap yuno
    NotInMap yuno_in02
    NotInMap yuno_in05
    exclusive 1
    call {
        log bugs e mais bugs
        log resolvendo
        do move yuno
    }
}

automacro questRenascer_pagarTaxa {
    ConfigKey estagio_Reborn 2
    Zeny = 1285000
    InMap yuno_in02
    exclusive 1
    call {
        do move 90 166
        ####do talknpc 88 164 c w1 c w1 c w1 r0
        do talk &npc(/Metheus /)
        do talk resp 0
    }
}

automacro questRenascer_lerOLivroEDescer {
    ConfigKey estagio_Reborn 2
    InMap yuno_in02
    #QuestActive 1000
    exclusive 1
    Zeny = 0
    call {
        do move 93 202
        ####do talknpc 93 207 c w1 c w1 c w1 c w1 c w1 c w1 c w1 c
        do talk &npc(93 207)
        do move yuno_in05
        if ($.map = yuno_in05) do conf estagio_Reborn 3
    }
}

automacro questRenascer_terceiroEstagio {
    ConfigKey estagio_Reborn 3
    InMap yuno_in05
    exclusive 1
    call {
        while ($.pos != 41 42) {
            if ( $.pos == 15 185 ) do move 50 85
            if ( $.pos == 50 85 ) do move 41 42
            $randCoord = &random("15 185", "50 85", "41 42")
            if ( $.pos != 41 42 || $.pos != 50 85 || $.pos != 15 185 ) do move $randCoord
        }
        if ( $.pos == 41 42 ) {
            do talknpc 49 43 c
            do conf estagio_Reborn 4
        }
    }
}

automacro questRenascer_terceiroEstagio_bugada {
    ConfigKey estagio_Reborn 3
    InMap yuno_in02
    exclusive 1
    call {
        do move yuno_in05
    }
}
automacro questRenascer_ultimoEstagio {
    ConfigKey estagio_Reborn 4
    exclusive 1
    call {
        do move 49 86
        do conf skillsAddAuto_list none
        do conf statsAddAuto_list none
        ###do talknpc 48 86 c w1 c w1 c w1 c w1 c w1 c w1 c w1 c w1 c
        do talk &npc(48 86)
        do conf estagio_Reborn none
        call atualizarBuild
        do conf -f o_que_estou_fazendo acabeiDeRebornar
        [
        log =========================================
        log REBORNEEEEEEEEEEEEEEEEEEEEEEEEEEEEEI 
        log =========================================
        ]
        stop
    }
}

