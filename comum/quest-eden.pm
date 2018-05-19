# 22508#Emblema do Éden#


automacro seJuntarAoGrupoEden_MoverPerto {
    InInventoryID 22508 = 0  
    IsNotEquippedID armor 15009
    InInventoryID 15009 = 0
    IsNotEquippedID armor 15010
    InInventoryID 15010 = 0
    IsNotEquippedID armor 15011
    InInventoryID 15011 = 0
    IsNotEquippedID armor 15031
    InInventoryID 15031 = 0
    ConfigKeyNot quest_eden em_curso
    ConfigKeyNot naSequenciaDeSalvamento true
    InInventoryID 2414 = 0 #sapatos de aprendiz
    exclusive 1
    BaseLevel >= 12
    ConfigKeyNot membroDoEden sim
    NpcNotNear /Lenore|Lime/
    JobIDNot 0 #aprendiz
    JobIDNot 4023 #Baby Aprendiz
    call moverPertoDosNpcEden
}

automacro seJuntarAoGrupoEden {
    InInventoryID 22508 = 0
    IsNotEquippedID armor 15009
    InInventoryID 15009 = 0
    IsNotEquippedID armor 15010
    InInventoryID 15010 = 0
    IsNotEquippedID armor 15011
    InInventoryID 15011 = 0
    IsNotEquippedID armor 15031
    InInventoryID 15031 = 0
    ConfigKeyNot membroDoEden sim
    ConfigKeyNot quest_eden em_curso
    ConfigKeyNot naSequenciaDeSalvamento true
    run-once 1
    exclusive 1
    NpcNear /Lenore|Lime/
    call {
        do talk $.NpcNearLastBinId
        do talk resp 1
        do talk resp 0
        do talk text lolol
        do talk text lolol
        do talk resp 4
        do iconf 22508 0 0 0 #Emblema do Éden
    }
}

automacro entreiNoGrupoEden {
    InInventoryID 22508 = 1
    ConfigKeyNot membroDoEden sim
    exclusive 1
    call {
        do conf -f membroDoEden sim
    }
}

automacro questEden_trocarEmblemaIndoProNpc {
    InInventoryID 6219 = 1
    NpcNotNear /Lenore|Lime/
    exclusive 1
    priority -2 # um pouco alta
    call moverPertoDosNpcEden
}

automacro questEden_trocarEmblema {
    InInventoryID 6219 = 1
    exclusive 1    
    priority -2 # um pouco alta
    NpcNear /Lenore|Lime/
    call {
        do talk $.NpcNearLastBinId
        do talk resp 0
        do iconf 22508 0 0 0 #Novo Emblema do Grupo Valhalla
    }
}

automacro questEden12_iniciandoMoverPerto {
    NpcNotNear /Boya/
    InInventoryID 22508 = 1
    ConfigKeyNot fazerQuestEden nao
    BaseLevel 12..18
    exclusive 1
    QuestInactive 7128
    ConfigKeyNot naSequenciaDeSalvamento true
    ConfigKeyNot quest_eden em_curso
    ConfigKeyNot quest_eden terminando
    IsNotEquippedID armor 15009
    InInventoryID 15009 = 0
    call moverPertoDosNpcEden
}

automacro questEden26_iniciandoMoverPerto {
    NpcNotNear /Boya/
    BaseLevel 26..32
    InInventoryID 22508 = 1 
    ConfigKeyNot fazerQuestEden nao
    exclusive 1
    QuestInactive 7138
    QuestInactive 7139
    QuestInactive 7140
    ConfigKeyNot naSequenciaDeSalvamento true
    ConfigKeyNot quest_eden em_curso
    ConfigKeyNot quest_eden terminando
    IsNotEquippedID armor 15010
    InInventoryID 15010 = 0
    call moverPertoDosNpcEden
}

automacro questEden40_iniciandoMoverPerto {
    QuestInactive 7147
    QuestInactive 7148
    QuestInactive 7149
    QuestInactive 7150
    QuestInactive 7151
    ConfigKeyNot fazerQuestEden nao
    JobLevel != 50
    NpcNotNear /Boya/
    BaseLevel 40..49
    exclusive 1
    ConfigKeyNot naSequenciaDeSalvamento true
    ConfigKeyNot quest_eden em_curso
    ConfigKeyNot quest_eden terminando
    IsNotEquippedID armor 15011
    InInventoryID 22508 = 1 
    InInventoryID 15011 = 0 #armadura que ganha com essa quest
    call moverPertoDosNpcEden
}

automacro questEden60_iniciandoMoverPerto {
    NpcNotNear /Ur/
    BaseLevel 60..69
    exclusive 1
    InInventoryID 22508 = 1 
    JobID $parametrosClasses{idC2}, $parametrosClasses{idC2Alt}, $parametrosClasses{idC2T}, $parametrosClasses{idC2TAlt}, $parametrosClasses{idBC2}, $parametrosClasses{idBC2Alt}
    QuestInactive 7214
    ConfigKeyNot fazerQuestEden nao
    ConfigKeyNot naSequenciaDeSalvamento true
    ConfigKeyNot quest_eden em_curso
    ConfigKeyNot quest_eden terminando
    IsNotEquippedID armor 15031
    InInventoryID 15031 = 0
    call moverPertoDosNpcEden
}

macro moverPertoDosNpcEden {
    do conf lockMap none
    call pararDeAtacar
    [
    log ===========================================
    log =movendo pra perto dos npc do eden pra começar a quest
    log ===========================================
    ]
    do move moc_para01 &rand(33,35) &rand(25,27) #posição otima no Eden
    do reload event 
    #estranhamente qando ele chega perto do npc do eden, ele nao checa alguma 
    #das condições (arrisco dizer a de inventory) por isso tive que colocar essa linha
    #que recarrega o eventMacros, aí a proxima automacro trigga de boas
}

automacro questEden12_iniciando {
    NpcNear /Boya/
    InInventoryID 22508 = 1 
    BaseLevel 12..17
    exclusive 1
    QuestInactive 7128
    ConfigKeyNot fazerQuestEden nao
    ConfigKeyNot naSequenciaDeSalvamento true
    ConfigKeyNot quest_eden em_curso
    ConfigKeyNot quest_eden terminando
    IsNotEquippedID armor 15009
    InInventoryID 15009 = 0
    call iniciandoQuestEden '1' '0' '0'
}


automacro questEden26_iniciando {
    NpcNear /Boya/
    BaseLevel 26..32
    ConfigKeyNot fazerQuestEden nao
    InInventoryID 22508 = 1 
    exclusive 1
    QuestInactive 7138
    QuestInactive 7139
    QuestInactive 7140
    ConfigKeyNot naSequenciaDeSalvamento true
    ConfigKeyNot quest_eden em_curso
    ConfigKeyNot quest_eden terminando
    IsNotEquippedID armor 15010
    InInventoryID 15010 = 0
    call iniciandoQuestEden '1'
}

automacro questEden40_iniciando {
    NpcNear /Boya/
    BaseLevel 40..49
    InInventoryID 22508 = 1
    ConfigKeyNot fazerQuestEden nao
    exclusive 1
    QuestInactive 7147
    ConfigKeyNot naSequenciaDeSalvamento true
    ConfigKeyNot quest_eden em_curso
    ConfigKeyNot quest_eden terminando
    IsNotEquippedID armor 15011
    InInventoryID 15011 = 0
    call iniciandoQuestEden '0'
}

automacro questEden60_iniciando {
    NpcNear /Ur/
    BaseLevel 60..69
    ConfigKeyNot fazerQuestEden nao
    exclusive 1
    InInventoryID 22508 = 1
    JobID $parametrosClasses{idC2}, $parametrosClasses{idC2Alt}, $parametrosClasses{idC2T}, $parametrosClasses{idC2TAlt}, $parametrosClasses{idBC2}, $parametrosClasses{idBC2Alt}
    QuestInactive 7214
    ConfigKeyNot naSequenciaDeSalvamento true
    ConfigKeyNot quest_eden em_curso
    ConfigKeyNot quest_eden terminando
    IsNotEquippedID armor 15031
    InInventoryID 15031 = 0
    call iniciandoQuestEden '0' '1'
}

macro iniciandoQuestEden {
    [
    log ==========================
    log =Iniciando a quest eden
    log = parametro 0 : $.param[0]
    log = parametro 1 : $.param[1]
    log = parametro 2 : $.param[2]
    log ===================================
    ]
    do talk $.NpcNearLastBinId
    if (&defined($.param[0]) = 1) do talk resp $.param[0]
    if (&defined($.param[1]) = 1) do talk resp $.param[1]
    if (&defined($.param[2]) = 1) do talk resp $.param[2]

    switch ($.lvl) {
        case (<= 18) $lvlDaQuestEden = 12
        case (<= 32) $lvlDaQuestEden = 26
        case (<= 49) $lvlDaQuestEden = 40
        case (<= 69) $lvlDaQuestEden = 60
    }
    do conf -f o_que_estou_fazendo iniciandoQuestEden$lvlDaQuestEden

}

automacro questEden_avisoIntermitenteNivel12 {
    exclusive 1
    QuestActive 7128
    BaseLevel 12..15
    timeout 120
    call avisoIntermitente '15'
}

#Lembrete: quest éden lvl 26 não precisa desse aviso interminente
#porque ele já vai matar no lvl que começa, diferente das outras

automacro questEden_avisoIntermitenteNivel40 {
    exclusive 1
    QuestActive 7147
    BaseLevel 40..49
    timeout 180
    call avisoIntermitente '50'
}

automacro questEden_avisoIntermitenteNivel60 {
    exclusive 1
    QuestActive 7214
    BaseLevel 60..69
    timeout 240
    call avisoIntermitente '70'
}

macro avisoIntermitente {        
    [
    log ======================================
    log comecei a quest eden, porém só vou
    log fazer ela no lvl $.param[0] ou acima!
    log se eu nao tiver no lvl , eu vou upar.
    log eu estou no lvl $.lvl agora
    log ======================================
    ]
}


#7128#Grupo Valhalla#SG_FEEL#QUE_NOIMAGE#
#Você começa seu treinamento com o Grupo Valhalla. Procure o cão falante em Sograt. #
#Converse com o cão falante #
automacro questEden12_salvarNaKafra {
    QuestActive 7128
    exclusive 1
    BaseLevel >= 15
    ConfigKeyNot naSequenciaDeSalvamento true
    ConfigKeyNot saveMap morocc
    call {
        do conf -f quest_eden em_curso
        call salvarNaCidade "morocc"
        do conf -f o_que_estou_fazendo quest_eden12
    }
}

#7138#Grupo Valhalla#SG_FEEL#QUE_NOIMAGE#
#Seu próximo desafio é em na Caverna de Payon. Procure um representante do Grupo Valhalla. #
#Converse com o representante do Grupo Valhalla #
automacro questEden26_SalvarNaKafra {
    QuestActive 7138
    BaseLevel >= 26
    exclusive 1
    ConfigKeyNot naSequenciaDeSalvamento true
    ConfigKeyNot saveMap payon
    call {
        do conf -f quest_eden em_curso
        call salvarNaCidade "payon"
        do conf -f o_que_estou_fazendo quest_eden26
    }
}

#7147#Grupo Valhalla#SG_FEEL#QUE_NOIMAGE#
#Seu próximo desafio é na Vila Orc. Procure um representante do Grupo Valhalla. #
#Converse com o representante do Grupo Valhalla #
automacro questEden40_SalvarNaKafra {
    QuestActive 7147
    BaseLevel >= 50
    exclusive 1
    ConfigKeyNot naSequenciaDeSalvamento true
    ConfigKeyNot saveMap prontera
    call {
        do conf -f quest_eden em_curso
        call salvarNaCidade "prontera"
        do conf -f o_que_estou_fazendo quest_eden40
    }
}

#7214#Treino Avançado - Passo 1 - Comodo#SG_FEEL#QUE_NOIMAGE#
#Encontre o Membro do Grupo Éden em frente à entrada da caverna norte de Comodo #
#Fale com Romeo #
automacro questEden60_SalvarNaKafra {
    QuestActive 7214
    BaseLevel >= 70
    exclusive 1
    ConfigKeyNot naSequenciaDeSalvamento true
    ConfigKeyNot saveMap comodo
    call {
        do conf -f quest_eden em_curso
        call salvarNaCidade "comodo"
        do conf -f o_que_estou_fazendo quest_eden60
    }
}

#7128#Grupo Valhalla#SG_FEEL#QUE_NOIMAGE#
#Você começa seu treinamento com o Grupo Valhalla. Procure o cão falante em Sograt. #
#Converse com o cão falante #
automacro questEden12_IrNoMapa {
    QuestActive 7128
    exclusive 1
    BaseLevel >= 15
    ConfigKeyNot naSequenciaDeSalvamento true
    ConfigKey saveMap morocc
    call irNoMapa 'moc_fild11' '180 253' '1107' '1001' '1009' #monstros: filhote de lobo, escopião, condor
}

#7138#Grupo Valhalla#SG_FEEL#QUE_NOIMAGE#
#Seu próximo desafio é em na Caverna de Payon. Procure um representante do Grupo Valhalla. #
#Converse com o representante do Grupo Valhalla #
automacro questEden26_IrNoMapa {
    QuestActive 7138
    BaseLevel >= 26
    exclusive 1
    ConfigKeyNot naSequenciaDeSalvamento true
    ConfigKey saveMap payon
    call irNoMapa 'pay_arche' '41 136' '1076' '1031' '1015' #monstros: esqueleto, poporing, zumbi
}

#7147#Grupo Valhalla#SG_FEEL#QUE_NOIMAGE#
#Seu próximo desafio é na Vila Orc. Procure um representante do Grupo Valhalla. #
#Converse com o representante do Grupo Valhalla #
automacro questEden40_IrNoMapa {
    QuestActive 7147
    BaseLevel >= 50
    exclusive 1
    ConfigKeyNot naSequenciaDeSalvamento true
    ConfigKey saveMap prontera
    call irNoMapa 'in_orcs01' '38 175' '1023' '1686' '1273' #monstros: guerreiro orc, filhote de orc, senhora orc
}

#7214#Treino Avançado - Passo 1 - Comodo#SG_FEEL#QUE_NOIMAGE#
#Encontre o Membro do Grupo Éden em frente à entrada da caverna norte de Comodo #
#Fale com Romeo #
automacro questEden60_IrNoMapa {
    QuestActive 7214
    BaseLevel >= 70
    exclusive 1
    ConfigKeyNot naSequenciaDeSalvamento true
    ConfigKey saveMap comodo
    call irNoMapa 'comodo' '173 354'
}

macro irNoMapa {
    do conf -f quest_eden em_curso
    [
    log ===========================
    log =indo fazer a quest eden
    log ===========================
    ]
    ## $.param[0] tem como valor o local do npc
    ## $.param[1] tem como valor a coordenada x e y
    ## $.param[2] tem como valor a id do monstro 1
    ## $.param[3] tem como valor a id do monstro 2
    ## $.param[4] tem como valor a id do monstro 3
    
    do move $.param[0] $.param[1] &rand(1,5)
    do talk &npc($.param[1])
    if ($.param[0] = moc_fild11) do talk resp 1  #significa que ta na quest eden 12
    if (&defined($.param[2]) = 1) { #evita de mostrar linhas vermelhas a toa de "variavel não existe"
        do mconf $.param[2] 0 0 0
        do mconf $.param[3] 0 0 0
        do mconf $.param[4] 0 0 0
    }
}


automacro questEden12_Caçar {
    QuestHuntOngoing 7129 1009, 7130 1107, 7131 1001
    exclusive 1
    timeout 120
    call caçarMonstros "moc_fild11" "12"
}

automacro questEden26_Caçar {
    QuestHuntOngoing 7139 1076, 7140 1031
    exclusive 1
    timeout 180
    call caçarMonstros "pay_dun00" "26"
}

automacro questEden40_Caçar {
    QuestHuntOngoing 7148 1686, 7149 1023, 7150 1273
    exclusive 1
    timeout 180
    JobLevel != 50
    call caçarMonstros "gef_fild10" "40"
}

automacro questEden60_Caçar {
    QuestHuntOngoing 7215 1278, 7216 1278
    exclusive 1
    timeout 60
    call caçarMonstros "beach_dun2" "60"
}

macro caçarMonstros {
    ## $.param[0] tem como valor o lockMap que o bot
    ## vai caçar os monstros
    if (&config(quest_eden) != em_curso) do conf -f quest_eden em_curso
    [
    call voltarAtacar
    if ( &config(lockMap) != $.param[0]) do conf lockMap $.param[0]
    do mconf $.QuestHuntOngoingLastMobID 2 0 0
    ## $.param[1] tem como valor o lvl da quest
    log ===========================================
    log =caçando monstro da quest eden $.param[1]
    log ===========================================
    ]
}

#7217#Treino Avançado - Passo 1.3 - Comodo#SG_FEEL#QUE_NOIMAGE#
#Romeo te passou uma última missão. Derrote Guerreiros Wootan e Dríades para conseguir alguns itens #
#Traga 5 Ombreiras, 7 Folhas Afiadas #
automacro questEden60__JuntarItens {
    QuestActive 7217
    exclusive 1
    timeout 120
    call {
        do iconf 7196 5 1 0 #ombreira
        do iconf 7100 7 1 0 #folha
        $qtdOmbreira = &invamount (7196)
        $qtdFolha = &invamount (7100)
        if (&config(quest_eden) != em_curso) do conf -f quest_eden em_curso
        do conf -f o_que_estou_fazendo quest_eden60_coletandoItens
        
        if ( $qtdOmbreira < 5 ) {
            [
            log ===========================================
            log = coletando Ombreiras pra quest eden
            log = tenho: $qtdOmbreira , Quero: 5 , Falta: &eval(5 - $qtdOmbreira)
            log ===========================================
            ]
            do conf lockMap um_fild02
            call voltarAtacar
        } elsif ( $qtdOmbreira >= 5 && $qtdFolha < 7 ) {
            [
            log ===========================================
            log = coletando Folha Afiada pra quest eden
            log = tenho: $qtdFolha , Quero: 7 , Falta: &eval(7 - $qtdFolha)
            log ===========================================
            ]
            do conf lockMap um_fild01
            call voltarAtacar    
        }
    }
}

#7217#Treino Avançado - Passo 1.3 - Comodo#SG_FEEL#QUE_NOIMAGE#
#Romeo te passou uma última missão. Derrote Guerreiros Wootan e Dríades para conseguir alguns itens #
#Traga 5 Ombreiras, 7 Folhas Afiadas #
automacro questEden60__JaJunteiOsItens {
    InInventoryID 7196 >= 5
    InInventoryID 7100 >= 7
    QuestActive 7217
    CurrentHP > 80%
    exclusive 1
    call {
        lock questEden60__JuntarItens
        [
        log ===================================
        log Ombreira e Folha Afiada coletada
        log vou ao npc entregar
        log ===================================
        ]
        if (&config(quest_eden) != em_curso) do conf -f quest_eden em_curso
        call pararDeAtacarApenasCorrer
        do move um_fild01 &rand(36,38) &rand(277,279)
        do talknpc 34 280 c #Romeo#2nd02
        do iconf 7196 0 0 1 #ombreira
        do iconf 7100 0 0 1 #folha
    }
}

automacro questEden12_FinalizarCaças {
    QuestHuntCompleted 7129 1009, 7130 1107, 7131 1001
    exclusive 1
    call {
        call pararDeAtacar
        if (&config(quest_eden) != em_curso) do conf -f quest_eden em_curso
        do mconf $.QuestHuntCompletedLastMobID 0 0 0
        [
        log ===========================================
        log =completei a caça, indo falar com o Cão falante
        log ===========================================
        ]
        do move moc_fild11 &rand(181,183) &rand(254,256)
        do talk 0 #Cão falante
        release Eden12Caçar
    }
}

automacro questEden26_FinalizarCaças {
    QuestHuntCompleted 7139 1076, 7140 1031
    exclusive 1
    call {
        call pararDeAtacar
        if (&config(quest_eden) != em_curso) do conf -f quest_eden em_curso
        do mconf $.QuestHuntCompletedLastMobID 0 0 0
        [
        log ===========================================
        log =completei a caça, indo falar com o Coral
        log ===========================================
        ]
        do move pay_arche &rand(44,46) &rand(132,134)
        #do talknpc 41 136 c c c c c #Coral
        do talk &npc( 41 136 ) #Coral
        release Eden26Caçar
    }
}

automacro questEden40_FinalizarCaças {
    QuestHuntCompleted 7148 1686, 7149 1023, 7150 1273
    QuestInactive 2017
    QuestInactive 2018
    QuestInactive 2022
    QuestInactive 2023
    QuestInactive 2024
    QuestInactive 2026
    exclusive 1
    call {
        call pararDeAtacar
        if (&config(quest_eden) != em_curso) do conf -f quest_eden em_curso
        do mconf $.QuestHuntCompletedLastMobID 0 0 0
        [
        log ===========================================
        log =completei a caça, indo falar com o Absalom
        log ===========================================
        ]
        do move in_orcs01 38 175 &rand(1,4)
        #do talknpc 38 175 c c #Absalom#para07
        do talk 0 #Absalom
        release Eden40Caçar
    }
}

automacro questEden60_FinalizarCaças {
    QuestHuntCompleted 7215 1278, 7216 1278
    exclusive 1
    call {
        if (&config(quest_eden) != em_curso) do conf -f quest_eden em_curso
        do mconf $.QuestHuntCompletedLastMobID 0 0 0
        [
        log ===========================================
        log =completei a caça, indo falar com o npc do eden
        log ===========================================
        ]
        switch ( $.QuestHuntCompletedLastQuestID ) {

            case (= 7215) { #golem1
                do move comodo &rand(174,176) &rand(344,346)
                #do talknpc 173 354 c c c c c #Mémbro do grupo Éden#2n
                do talk &npc( 173 354 )
                release Eden60Caçar
            }

            case (= 7216) { #golem2
                do move um_fild01 &rand(36,38) &rand(277,279)
                #do talknpc 34 280 c c c c #Romeo#2nd02
                do talk &npc( 34 280 )
                release Eden60Caçar
            }
        }
    }
}

#7132#Grupo Valhalla#SG_FEEL#QUE_NOIMAGE#
#Você completou todas as tarefas do cão falante. Fale com o membro do Grupo Valhalla. #
#Vá ao escritório do Grupo Valhalla #
#7141#Grupo Valhalla#SG_FEEL#QUE_NOIMAGE#
#Você completou todas as tarefas. Fale com o membro do Grupo Valhalla. #
#Vá ao escritório do Grupo Valhalla #
#7151#Grupo Valhalla#SG_FEEL#QUE_NOIMAGE#
#Você completou todas as tarefas. Fale com o membro do Grupo Valhalla. #
#Vá ao escritório do Grupo Valhalla #
#7218#Reporte para Uru#SG_FEEL#QUE_NOIMAGE#
#Você completou este passo do Grupo Éden. Você pode voltar para a sede do Grupo Éden. #
#Reporte para Uru #
automacro questEden_voltarDoMapaMoverPerto {
    QuestActive 7132, 7141, 7151, 7218
    NpcNotNear /Boya|Ur/
    exclusive 1
    call {
        if (&config(quest_eden) != em_curso) do conf -f quest_eden em_curso
        [
        log ===========================================
        log Completei as Caças!
        log vamo lá pegar meus equips de direito!
        log ===========================================
        ]
        
        do conf -f o_que_estou_fazendo quest_eden_completada_voltando_para_pegar_equips
        call moverPertoDosNpcEden
    }
}

#7132#Grupo Valhalla#SG_FEEL#QUE_NOIMAGE#
#Você completou todas as tarefas do cão falante. Fale com o membro do Grupo Valhalla. #
#Vá ao escritório do Grupo Valhalla #
#7141#Grupo Valhalla#SG_FEEL#QUE_NOIMAGE#
#Você completou todas as tarefas. Fale com o membro do Grupo Valhalla. #
#Vá ao escritório do Grupo Valhalla #
#7151#Grupo Valhalla#SG_FEEL#QUE_NOIMAGE#
#Você completou todas as tarefas. Fale com o membro do Grupo Valhalla. #
#Vá ao escritório do Grupo Valhalla #
#7218#Reporte para Uru#SG_FEEL#QUE_NOIMAGE#
#Você completou este passo do Grupo Éden. Você pode voltar para a sede do Grupo Éden. #
#Reporte para Uru #
automacro questEden_voltarDoMapa {
    QuestActive 7132, 7141, 7151, 7218
    NpcNear /Boya|Ur/
    exclusive 1
    call {
        #7132 : eden 12
        #7141 : eden 26
        #7151 : eden 40
        #7218 : eden 60
        if (&config(quest_eden) != em_curso) do conf -f quest_eden em_curso
        [
        log ===========================================
        log =terminando a quest eden, falando com o npc
        log ===========================================
        ]
        
        switch ($.QuestActiveLastID) {

            case (= 7132) { #eden 12
                #do talknpc 25 35 c c c #Boya
                do talk &npc(/Boya/)
                do mconf 1107 1 0 0 #Filhote de lobo
                do mconf 1001 1 0 0 #escorpiao
                do mconf 1009 1 0 0 #Condor
            }

            case (= 7141) { #eden 26
                #do talknpc 25 35 c c #Boya
                do talk &npc(/Boya/)
                do mconf 1076 1 0 0 #Esqueleto
                do mconf 1031 1 0 0 #poporing
                do mconf 1015 1 0 0 #Zumbi
            }

            case (= 7151) { #eden 40
                #do talknpc 25 35 c c #Boya
                do talk &npc(/Boya/)
                do mconf 1023 1 0 0 #Guerreiro Orc
                do mconf 1686 1 0 0 #Filhote de Orc
                do mconf 1273 1 0 0 #Senhora Orc 
            }

            case (= 7218) { #eden 60
                #do talknpc 23 35 c c c #Uru
                do talk &npc(/Ur/)
            }
        }
        if (&questInactiveCount(7132, 7141, 7151, 7218) = 4) {
            do conf -f quest_eden terminando
        } else {
            [
            log ===================================
            log = acredito que há uma treta no término da quest Éden
            log ===================================
            ]
        }
    }
}
automacro EdenPegandoEquips_IndoProNpc {
    NpcNotNear /hael/i
    ConfigKey quest_eden terminando
    BaseLevel 12..99
    exclusive 1
    call {
        do move moc_para01 48 37 #portal que antes era porta
        do move moc_para01 &rand(112,114) &rand(31,33)
    }
}


automacro questEden12e26e40_PegandoEquips {
    ConfigKey quest_eden terminando
    BaseLevel 12..59
    timeout 120
    NpcNear /hael/i
    call {
        [
        log ===========================================
        log =falando com o Mihael pra ganhar meus equips
        log ===========================================
        ]
        do conf -f o_que_estou_fazendo quest_eden pegandoMeusEquipsDeDireito
        do talk $.NpcNearLastBinId
        do talk resp 0
        do talk resp 1
        do talk resp /$parametrosQuestEden{armaLevel26e40}/i

        if ( $.lvl >= 40 ) {
            #pegar encantamento do chapeu valhalla
            do talk $.NpcNearLastBinId
            do talk resp 2
            do talk resp 4
            do talk resp 0
        }
    }
}

automacro questEden12e26e40_acabeiDePegarEquips {
    ConfigKey quest_eden terminando
    BaseLevel 12..59
    NpcNear /hael/i
    exclusive 1
    SimpleHookEvent item_gathered
    call {
        do conf -f quest_eden none
        do conf -f o_que_estou_fazendo acabeiDeTerminarQuestEden
    }
}

automacro questEden60_PegandoEquips {
    ConfigKey quest_eden terminando
    BaseLevel 70..98
    timeout 120
    IsNotEquippedID armor 15031
    NpcNear /Ferreiro|smith/i
    call {
        [
        log ===========================================
        log =falando com o ferreiro pra ganhar meus equips
        log ===========================================
        ]
        #do talknpc 111 83 c r2 c c r1 #Ferreiro Torhen#2nd10
        do talk $.NpcNearLastBinId
        do talk resp 2
        do talk resp 1
        do talk resp /$parametrosQuestEden{armaLevel60}/i
    }
}

automacro questEden60_acabeiDePegarEquips {
    ConfigKey quest_eden terminando
    BaseLevel 70..98
    exclusive 1
    IsNotEquippedID armor 15031
    NpcNear /Ferreiro|smith/i
    SimpleHookEvent item_gathered
    call {
        do conf -f quest_eden none
        do conf -f o_que_estou_fazendo acabeiDeTerminarQuestEden60
    }
}

automacro questEden12_Equipando {
    IsNotEquippedID armor 15009
    InInventoryID 15009 = 1
    BaseLevel 12..25
    exclusive 1
    run-once 1
    call {
        [
        log ===========================================
        log =equipando os itens de eden lvl 12
        log ===========================================
        ]
        $check = pegarIndiceDoEquipamentoPeloId("robe", 2560) #Capa Valhalla
        if ($check != -1) do eq $check
        $check = pegarIndiceDoEquipamentoPeloId("topHead", 5583) #Chapeu valhalla
        if ($check != -1) do eq $check
        $check = pegarIndiceDoEquipamentoPeloId("shoes", 2456) #Botas Valhalla Iniciante
        if ($check != -1) do eq $check
        $check = pegarIndiceDoEquipamentoPeloId("armor", 15009) #Uniforme Valhalla Iniciante
        if ($check != -1) do eq $check
    }
}

automacro questEden26_Equipando {
    IsNotEquippedID armor 15010
    InInventoryID 15010 = 1
    BaseLevel 26..49
    exclusive 1
    run-once 1
    call {
        [
        log ===========================================
        log =equipando os itens de eden lvl 26
        log ===========================================
        ]

        $check = pegarIndiceDoEquipamentoPeloId("shoes", 2457) #Botas Valhalla Intermediárias
        if ($check != -1) do eq $check
        $check = pegarIndiceDoEquipamentoPeloId("rightHand", "$parametrosQuestEden{IDarmaIniciante}") #Arma Valhalla Iniciante
        if ($check != -1) do eq $check
        $check = pegarIndiceDoEquipamentoPeloId("armor", 15010) #Uniforme Valhalla Intermediário
        if ($check != -1) do eq $check
    }
}

automacro questEden40_Equipando {
    IsNotEquippedID armor 15011
    InInventoryID 15011 = 1
    BaseLevel 40..59
    exclusive 1
    run-once 1
    call {
        [
        log ===========================================
        log =equipando os itens de eden lvl 40
        log ===========================================
        ]
        $check = pegarIndiceDoEquipamentoPeloId("shoes", 2458) #Botas Valhalla Avançadas
        if ($check != -1) do eq $check
        $check = pegarIndiceDoEquipamentoPeloId("rightHand", "$parametrosQuestEden{IDarmaIntermediario}") #Arma Valhalla Intermediária
        if ($check != -1) do eq $check
        $check = pegarIndiceDoEquipamentoPeloId("armor", 15011) #Uniforme Valhalla Avançado
        if ($check != -1) do eq $check
    }
}

automacro questEden60_Equipando {
    IsNotEquippedID robe 2571
    IsNotEquippedID topHead 18514
    IsNotEquippedID shoes 2473
    IsNotEquippedID rightHand $parametrosQuestEden{IDarmaEden}
    IsNotEquippedID armor 15031
    InInventoryID 2571  = 1
    InInventoryID 18514 = 1
    InInventoryID 2473  = 1
    InInventoryID 15031 = 1
    run-once 1
    BaseLevel 60..98
    exclusive 1
    call {
        [
        log ===========================================
        log =equipando os itens de eden level 60
        log ===========================================
        ]
        $check = pegarIndiceDoEquipamentoPeloId("robe", 2571) #Capa II do Grupo Eden
        if ($check != -1) do eq $check
        $check = pegarIndiceDoEquipamentoPeloId("topHead", 18514) #Chapéu_II_do_Grupo_Éden#
        if ($check != -1) do eq $check
        $check = pegarIndiceDoEquipamentoPeloId("shoes", 2473) ##Botas_IV_do_Grupo_Éden#
        if ($check != -1) do eq $check
        $check = pegarIndiceDoEquipamentoPeloId("rightHand","$parametrosQuestEden{IDarmaEden}") #Arma do Grupo Eden#
        if ($check != -1) do eq $check
        $check = pegarIndiceDoEquipamentoPeloId("armor", 15031) #Armadura_do_Grupo_Éden#
        if ($check != -1) do eq $check
    }
}


#
#
#
# FIM DAS QUESTS EDEN
#

