sub initParamsQuestClasse2 {
    Commands::run("conf -f questc2_implementada true");
}
#Virar Sacer
#sacer nescessario job 50
#CREDITOS http://openkorebrasil.org/index.php?/topic/3136-virar-novi%C3%A7o-e-sacer/
#ta em macro plugin é so reescrever algumas partes pra eventMacros
#Alterei pro IRO RESTART
#Possivel conflito com o BRO autoTalkCont 1 ainda funciona no IRO
automacro VirarSacer1 {
    JobID $paramsClasses{idC1}
    JobLevel = 50
    priority -2
    exclusive 1
    run-once 1
    call {
        do conf route_maxWarpFee none
        do conf route_maxNpcTries none
        do conf route_teleport none
        do conf lockMap none
        do conf route_randomWalk 0
        do move prt_church 16 41 &rand(3,6)
        do talknpc 16 41 r0 r0 r0  #Bispo da Guilda
        pause 60
        lock VirarSacer1
    }
}

automacro VirarSacer2 {
    JobID $paramsClasses{idC1}
    InMap job_prist
    JobLevel = 50
    exclusive 1
    timeout 60
    macro_delay 4
    call {
        lock VirarSacer1
        pause 60 #sera que isso é necessario?
        do talknpc 24 187 r0 r0 #Smith
        do conf attackAuto 2
        do conf attackUseWeapon 1
        do talk cont
        do move job_prist 24 109
        do move job_prist 168 49
        do talk resp 2
        do move job_prist 169 80
        do talk resp 2
        do move job_prist 168 119
        do talk resp 2
        do move job_prist 168 157
        do talk resp 2
        do move job_prist 168 178
        do move job_prist 97 105
        do talknpc 27 24 r0 r1 r0 r0 r1 r1 r0 r0
        do talknpc 16 41 
    }
}
