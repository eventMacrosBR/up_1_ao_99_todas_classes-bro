
automacro questRenascer_chegueilvl99 {
    BaseLevel = 99
    JobLevel = 50
    JobID $parametrosClasses{idC2}, $parametrosClasses{idC2Alt}
    CharCurrentWeight != 0
    Zeny != 1285000
    Zeny != 0
    exclusive 1
    timeout 60
    ConfigKey questRenascer_estagio none
    macro_delay 2
    QuestInactive 1000
    call {
        if ($parametrosQuestClasseRenascer{renascer} = nao) {
            [
            log ESTOU LVL 99 MAS FUI CONFIGURADO PRA NAO REBORNAR
            log É BOM CASO VC QUEIRA FARMAR ZENY COM CLASSE 2
            log SE QUISER REBORNAR, PROCURE POR :
            log renascer => nao 
            log E TROQUE POR sim
            ]
            lock questRenascer_chamarAmigo
        } else {
            if ($.statushandle =~ /EFST_RIDING/i) do pecopeco release
            #TODO adicionar uma linha pra remover falcão
            #e outra linha para vaporizar homunculo
            do pm "$parametrosQuestClasseRenascer{amigo}" ajudaRebornar    
            log peso atual: $.weight
            log peso percentual: $.weightpercent
            [
            do conf dealAuto 3
            do conf dealAuto_names $parametrosQuestClasseRenascer{amigo}
            do iconf 2301 0 1 0 # Camisa de Algodão
            do iconf 1201 0 1 0 # Faca [3]

            # é uma forma que eu pensei de desabilitar TODOS os getAuto
            # independente de quantos hajam
            $continuarLoop = sim
            $i = 0
            while ($continuarLoop = sim) {
                if (checarSeExisteNoConfig("getAuto_$i_disabled") = sim) {
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
                if (checarSeExisteNoConfig("buyAuto_$i_disabled") = sim) {
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
                log = desequipando equip do slot $slots[$i]
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
            do conf -f questRenascer_estagio preparando
        }
    }
}

automacro questRenascer_salvarNaCidadeQueVouUparEDefinirVariavel {
    ConfigKey questRenascer_estagio preparando
    exclusive 1
    priority -10 #prioridade mais alta
    run-once 1
    QuestInactive 1000
    call {
        #essa automacro tem por objetivo, salvar seu personagem
        #na cidade em que ele vai upar quando tiver lvl 1 renascido
        #evita problemas de o char lvl 1 morrer e voltar pra juno
        #sem dinheiro pra ir pro mapa certo
        #pega o mapa do lvl 1
        %mapa = extrairMapasDeUp(1, "sim") # o "sim" representa que queremos os mapa de up de transclasse
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
    ConfigKey questRenascer_estagio preparando
    Zeny != 1285000
    Zeny != 0
    ConfigKey saveMap $mapaQueVouUparNolvl1
    CharCurrentWeight != 0
    CheckOnAI auto,manual
    BaseLevel = 99
    JobLevel = 50
    priority -5 #prioridade alta
    QuestInactive 1000
    call {
        $vezesQueTentouZerarPeso++
        if ($.statushandle =~ /EFST_RIDING/i) do pecopeco release
        #TODO adicionar uma linha pra remover falcão
        #e outra linha para vaporizar homunculo
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
    ConfigKey questRenascer_estagio preparando
    Zeny != 1285000  #vamos ficar com o zeny certo
    Zeny != 0
    exclusive 1
    timeout 50
    QuestInactive 1000
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
    ConfigKey questRenascer_estagio preparando
    InMap yuno
    PlayerNear /$parametrosQuestClasseRenascer{amigo}/
    timeout 20
    QuestInactive 1000
    call {
        lock questRenascer_irNoLocalPraNegociar
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
    ConfigKey questRenascer_estagio preparando
    InMap yuno
    PlayerNear /$parametrosQuestClasseRenascer{amigo}/
    timeout 10
    SimpleHookEvent incoming_deal
    macro_delay 0.2
    QuestInactive 1000
    call {
        lock questRenascer_irNoLocalPraNegociar
        pause 1
        do deal
    }
}

automacro questRenascer_dandoOuReceBendoZeny {
    CharCurrentWeight 0
    Zeny != 1285000
    ConfigKey questRenascer_estagio preparando
    PlayerNear /$parametrosQuestClasseRenascer{amigo}/ 
    SimpleHookEvent engaged_deal
    priority -5
    QuestInactive 1000
    call {
        lock questRenascer_amigoPertoPedindoTrade
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
    ConfigKey questRenascer_estagio preparando
    QuestInactive 1000
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
    ConfigKeyNot questRenascer_estagio 1
    ConfigKeyNot questRenascer_estagio 2
    ConfigKeyNot questRenascer_estagio 3
    ConfigKeyNot questRenascer_estagio 4
    QuestInactive 1000
    call {
        do conf -f o_que_estou_fazendo indoRebornar!!!
        [
        do ai auto
        do conf lockMap 0
        call pararDeAtacar
        do conf sitAuto_idle 0
        ]
        # se tiver tudo certinho pra começar o reborn ,essa automacro ativa
        do conf -f questRenascer_estagio 1
    }
}

automacro questRenascer__primeiroEstagio {
    ConfigKey questRenascer_estagio 1
    InMap yuno, yuno_in02
    exclusive 1
    QuestInactive 1000
    call {
        do move yuno_in02
        if ($.map = yuno_in02) do conf questRenascer_estagio 2
    }
}

automacro questRenascer_primeiroEstagio_bugada {
    ConfigKey questRenascer_estagio 1
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
    ConfigKey questRenascer_estagio 2
    Zeny = 1285000
    exclusive 1
    QuestInactive 1000
    call {
        do move yuno_in02 90 166
        ####do talknpc 88 164 c w1 c w1 c w1 r0
        do talk &npc(/Metheus /)
        do talk resp 0
    }
}

automacro questRenascer_lerOLivroEDescer {
    ConfigKey questRenascer_estagio 2
    InMap yuno_in02
    #QuestActive 1000
    exclusive 1
    Zeny = 0
    call {
        do move 93 202
        ####do talknpc 93 207 c w1 c w1 c w1 c w1 c w1 c w1 c w1 c
        do talk &npc(93 207)
        do move yuno_in05
        if ($.map = yuno_in05) do conf questRenascer_estagio 3
    }
}

automacro questRenascer_terceiroEstagio {
    ConfigKey questRenascer_estagio 3
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
            do conf questRenascer_estagio 4
        }
    }
}

automacro questRenascer_terceiroEstagio_bugada {
    ConfigKey questRenascer_estagio 3
    InMap yuno_in02
    exclusive 1
    call {
        do move yuno_in05
    }
}

automacro questRenascer_ultimoEstagio {
    ConfigKey questRenascer_estagio 4
    exclusive 1
    call {
        do move 49 86
        do conf skillsAddAuto_list none
        do conf statsAddAuto_list none
        do talk &npc(48 86)
        do conf questRenascer_estagio none
        call atualizarBuild
        do conf -f o_que_estou_fazendo acabeiDeRebornar
        [
        log =========================================
        log REBORNEEEEEEEEEEEEEEEEEEEEEEEEEEEEEI 
        log =========================================
        ]
    }
}

automacro questRenascer_renasci {
    BaseLevel 1
    exclusive 1
    JobID 4001 #Aprendiz T.
    ConfigKeyNot questRenascer_estagio none
    call {
        do conf questRenascer_estagio none
        call atualizarBuild
    }
}

