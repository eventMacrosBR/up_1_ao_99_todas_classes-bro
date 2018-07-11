sub inicializarParametrosQuestClasse2 {
    my ($manterOuGuardar) = @_;
    my %items = (
    #Possibilidade 1
    7053 => "5 1 0", #Cyfar
    508 => "10 1 0", #Erva Amarela
    509 => "10 1 0", #Erva Branca

    #Possibilidade 2
    943 => "5 1 0", #Casca Rija
    935 => "20 1 0", #Casca
    912 => "5 1 0", #Zargônio

    #Possibilidade 3
    1027 => "5 1 0", #Espinho de Porco-Espinho
    1042 => "10 1 0", #Pata de Inseto
    1025 => "20 1 0", #Teia de Aranha

    #Possibilidade 4
    938 => "5 1 0", #Muco Pegajoso
    1055 => "10 1 0", #Pele de Minhoca
    511 => "20 1 0", #Erva Verde

    #Possibilidade 5
    913 => "10 1 0", #Dente de Morcego
    948 => "5 1 0", #Pata de Urso
    7033 => "20 1 0", #Esporo Venenoso

    #Possibilidade 6
    905 => "30 1 0", #Caule
    909 => "5 1 0", #Jellopy
    955 => "10 1 0", #Pele de Verme

    #Possibilidade 7
    942 => "20 1 0", #Cauda de Yoyo
    1002 => "5 1 0", #Minério de Ferro
    510 => "3 1 0" #Erva Azul

    );
    Commands::run("conf -f questc2_implementada false");
    foreach $key (keys %items) {
        if ($manterOuGuardar eq "manter") { 
            Commands::run("iconf $key $items{$key}") 
        } else {
            Commands::run("iconf $key 0 1 0")
        }
    }
}

#Creditos lucasbradok/punky
#Virar Monge
#novico nescessario job 50
#até a parte de dropar os items
#Não esta completo
#falta a parte dos cogumelos e a parte final
#Testar no BRO pois esta pro IRO RESTART
automacro configurarMonge1 {
    NotInMap prt_monk
    NotInMap monk_in
    JobLevel = 50
    priority 2
    run-once 1
    QuestInactive 3016
    QuestInactive 3023
    call {
        do conf route_maxWarpFee none
        do conf route_maxNpcTries none
        do conf route_teleport none
        do conf lockMap none
        conf route_randomWalk 0
        do conf follow 0
        do conf route_teleport 5
        do conf route_teleport_minDistance 150
        do conf attackAuto -1
        do conf sitAuto_sp_lower 40
        do conf sitAuto_sp_upper 100
        do pconf all 0
        do pconf Orange Net Mushroom 2
        do pconf Orange Gooey Mushroom 2
        do move prt_monk
    }
}

automacro virarMonge1 {
    InMap prt_monk
    QuestInactive 3016 
    priority 2
    run-once 1
    call {
        do move prt_monk 57 245
        pause 2
        do talknpc 59 247 c r1 c r1 c     #Primeira parte Guarding Monk 
    }
}

#3016#Mudança de Classe: Monge#SG_FEEL#QUE_NOIMAGE#
#'Você quer ser um Monge? Então entre e fale com o Monge ^0000FFMuhae^000000. Ele vai orientar você.' #
##
automacro virarMonge2 {
    QuestActive 3016
    priority 2
    run-once 1
    call {
        do move monk_in 99 56
        do talknpc 99 58 c r0 c
    }
}

#3023#Mudança de Classe: Monge#SG_FEEL#QUE_NOIMAGE#
#'Vou avaliar seu esforço e decidir se você está qualificado ou não. Você deve trazer ^3355FFEspinhos de Porco-Espinho, Teias de Aranha e Patas de Inseto^000000.' #
#5 Espinhos de Porco-Espinho, 20 Teias de Aranha e 10 Patas de Inseto #
automacro virarMonge3 {
    QuestActive 3023
    priority 2
    timeout 300
    call {
        do pconf 1027 1
        do pconf 1025 1
        do pconf 940 1
        $cobWeb = &invamount (1025)
        $porcupineQuill  = &invamount (1027)
        $gLeg = &invamount (940) 
        if ( $cobWeb < 20 ) goto Cobweb
        if ( $cobWeb >= 20 && $porcupineQuill < 5 ) goto Porcupine
        if ( $cobWeb >= 20 && $porcupineQuill >= 5 && $gLeg < 10 ) goto GLeg


        :Cobweb
        log Pegar Cobweb
        [
        do conf lockMap mjolnir_04
        do mconf Argos 1 0 1
        do mconf Caramel 1 0 1
        do mconf all -1 0 1
        do conf teleportAuto_hp 50
        do conf teleportAuto_minAggressives 2
        do conf teleportAuto_minAggressivesInLock 2
        do conf attackAuto_inLockOnly 1
        call voltarAtacar
        log =================================
        log Estou coletando Cobweb pra
        log pra quest de Monk
        log =================================
        ]
        stop


        :Porcupine
        log Pegar Porcupine
        [
        do conf lockMap mjolnir_04
        do mconf Argos 1 0 1
        do mconf Caramel 1 0 1
        do mconf all -1 0 1
        do conf teleportAuto_hp 50
        do conf teleportAuto_minAggressives 2
        do conf attackAuto_inLockOnly 1
        call voltarAtacar
        log ================================
        log Estou coletando Porcupine
        log pra quest de Monk
        log ================================
        ]
        stop


        :GLeg
        log Pegar GLEG
        [
        do conf lockMap prt_fild07
        do mconf Drainliar 0 0 0
        do mconf Eggyra 0 0 0
        do mconf 1084 0 0 0
        do mconf 1078 0 0 0
        do conf attackAuto_inLockOnly 1
        do conf route_randomWalk 1
        call voltarAtacar
        log ==============================
        log Estou coletando GLEG para
        log pra quest de Monk
        log ==============================
        ]
        stop
    }
}

#3023#Mudança de Classe: Monge#SG_FEEL#QUE_NOIMAGE#
#'Vou avaliar seu esforço e decidir se você está qualificado ou não. Você deve trazer ^3355FFEspinhos de Porco-Espinho, Teias de Aranha e Patas de Inseto^000000.' #
#5 Espinhos de Porco-Espinho, 20 Teias de Aranha e 10 Patas de Inseto #
automacro virarMonk4 {
    InInventory "Cobweb" >= 20
    InInventory "Porcupine Quill" >= 5
    InInventory "Grasshopper's Leg" >= 10
    QuestActive 3023
    NpcNotNear /Sensei Moohae/
    exclusive 1
    timeout 600
    call {
        do conf lockMap none
        call pararDeAtacar
        do move monk_in 99 57
        pause 1
        do talknpc 99 58 c

    }
}


automacro vireiMonk {
    exclusive 1
    JobLevel = 1
    run-once 1
    call {
        do conf follow 1
        call pararDeAtacar
        do conf teleportAuto_hp 20
        do conf teleportAuto_minAggressives 0
        do conf teleportAuto_minAggressivesInLock 0
    }
}

