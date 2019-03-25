sub inicializarParametrosQuestClasse2 {
    my ($manterOuGuardar) = @_;
    my %items = (
     );
    Commands::run("conf -f questc2_implementada true");
    foreach $key (keys %items) {
        if ($manterOuGuardar eq "manter") {
            Commands::run("iconf $key $items{$key}")
        } else {
            Commands::run("iconf $key 0 1 0")
        }
    }
}

#Virar Sacer
#sacer nescessario job 50
#CREDITOS http://openkorebrasil.org/index.php?/topic/3136-virar-novi%C3%A7o-e-sacer/
#ta em macro plugin é so reescrever algumas partes pra eventMacros
#Alterei pro IRO RESTART
#Possivel conflito com o BRO autoTalkCont 1 ainda funciona no IRO

automacro VirarSacer_SalvarEmProntera {
    JobID $parametrosClasses{idC1}, $parametrosClasses{idBC1}
    JobLevel = 50
    ConfigKeyNot saveMap prontera
    ConfigKeyNot naSequenciaDeSalvamento true
    ConfigKeyNot quest_eden em_curso
    ConfigKeyNot quest_eden terminando
    QuestInactive 8012
    QuestInactive 8013
    QuestInactive 8014
    QuestInactive 8015
    exclusive 1
    call salvarNaCidade "prontera"
}

automacro VirarSacer_IrNoNpc {
    JobID $parametrosClasses{idC1}, $parametrosClasses{idBC1}
    JobLevel = 50
    FreeSkillPoints = 0
    ConfigKey saveMap prontera
    QuestInactive 8012
    QuestInactive 8013
    QuestInactive 8014
    QuestInactive 8015
    priority 2
    exclusive 1
    call {
        call pararDeAtacar
        do conf lockMap none
        do move prt_church &rand(14,18) &rand(39,43)
    }
}

automacro VirarSacer_FalarComBispo {
    JobID $parametrosClasses{idC1}, $parametrosClasses{idBC1}
    JobLevel = 50
    InMap prt_church
    QuestInactive 8012
    QuestInactive 8013
    QuestInactive 8014
    QuestInactive 8015
    NpcNear /Bispo/
    exclusive 1
    call {
        do talknpc 16 41 r0 r0 r0  #Bispo da Guilda
    }
}

#8012#Mudança de Classe: Sacerdote#SG_FEEL#QUE_NOIMAGE#
#Comece o treinamento. Mate todos os monstros! Não tenha pena das criaturas da escuridão! #
#2a. Prova, o Treinamento Espiritual #
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
        do move prt_church &rand(14,18) &rand(39,43)
        do talknpc 16 41 r0 r0 r0
    }
}

automacro VirarSacer_TesteExorcismo {
    JobID $parametrosClasses{idC1}, $parametrosClasses{idBC1}
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

#8013#Mudança de Classe: Sacerdote#SG_FEEL#QUE_NOIMAGE#
#Você concluiu o Treinamento Espiritual! Vá falar com a Irmã Cecília. #
#Mudança de Classe: Sacerdote - Teste #
#8014#Mudança de Classe: Sacerdote#SG_FEEL#QUE_NOIMAGE#
#Faça a promessa de se devotar a Deus. #
#3a. Prova, Devoção a Deus #
automacro VirarSacer_FalarComIrmaCecilia {
    JobID $parametrosClasses{idC1}, $parametrosClasses{idBC1}
    JobLevel = 50
    QuestActive 8013, 8014
    InMap prt_church
    exclusive 1
    call {
        do move &rand(25,29) &rand(22,26)
        do talknpc 27 24  r0 r1 r0 r0 r1 r1 r0 r0
    }
}

#8015#Mudança de Classe: Sacerdote#SG_FEEL#QUE_NOIMAGE#
#Você concluiu as 3 missões e fez o Juramento do Sacerdócio. Volte a falar com o Bispo Paul. #
#Mudança de Classe: Sacerdote - Inscrição #
automacro VirarSacer_Final {
    JobID $parametrosClasses{idC1}, $parametrosClasses{idBC1}
    JobLevel = 50
    QuestActive 8015
    InMap prt_church
    exclusive 1
    call {
        do move &rand(14,18) &rand(39,43)
        do talknpc 16 41
    }
}

