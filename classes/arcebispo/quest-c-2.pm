sub initParamsQuestClasse2 {
    Commands::run("conf -f questc2_implementada true");
}
#Virar Sacer
#sacer nescessario job 50
#CREDITOS http://openkorebrasil.org/index.php?/topic/3136-virar-novi%C3%A7o-e-sacer/
#ta em macro plugin é so reescrever algumas partes pra eventMacros
#Alterei pro IRO RESTART
#Possivel conflito com o BRO autoTalkCont 1 ainda funciona no IRO

automacro VirarSacer_SalvarEmProntera {
    JobID $paramsClasses{idC1}
    JobLevel = 50
    ConfigKeyNot saveMap prontera
    ConfigKeyNot In_saveMap_sequence true
    ConfigKeyNot quest_eden em_curso
    ConfigKeyNot quest_eden terminando
    QuestInactive 8012
    QuestInactive 8013
    QuestInactive 8014
    call SetSaveIn "prontera"
}

automacro VirarSacer_IrNoNpc {
    JobID $paramsClasses{idC1}
    JobLevel = 50
    FreeSkillPoints = 0
    ConfigKey saveMap prontera
    QuestInactive 8012
    QuestInactive 8013
    QuestInactive 8014
    call SetSaveIn "prontera"
    priority 2
    exclusive 1
    call {
        call pararDeAtacar
        do conf lockMap none
        do move prt_church 16 41 &rand(3,6)
    }
}

automacro VirarSacer_FalarComBispo {
    JobID $paramsClasses{idC1}
    JobLevel = 50
    InMap prt_church
    QuestInactive 8012
    QuestInactive 8013
    NpcNear /Bispo da Guilda/
    exclusive 1
    call {
        do talknpc 16 41 r0 r0 r0  #Bispo da Guilda
    }
}

automacro VirarSacer_Morri {
    NotInMap job_prist
    QuestActive 8012
    CurrentSP > 90%
    exclusive 1
    call {
        call pararDeAtacar
        [
        log ---------------------------------------
        log Morri no labirinto voltando para fazer
        log ---------------------------------------
        ]
        do move prt_church 16 41 &rand(3,6)
        do talknpc 16 41 r0 r0 r0
    }
}

automacro VirarSacer_TesteExorcismo {
    JobID $paramsClasses{idC1}
    InMap job_prist
    JobLevel = 50
    exclusive 1
    timeout 60
    macro_delay 4
    call {
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
    }
}

automacro VirarSacer_FalarComIrmaCecilia {
    JobID $paramsClasses{idC1}
    JobLevel = 50
    QuestActive 8013
    InMap prt_church
    call { 
        do move prt_church 27 24 &rand(3,6)
        do talknpc 27 24  r0 r1 r0 r0 r1 r1 r0 r0
    } 
}

automacro VirarSacer_Final {
    JobID $paramsClasses{idC1}
    JobLevel = 50
    QuestActive 8014
    InMap prt_church
    call { 
        do talknpc 16 41
    } 
}

