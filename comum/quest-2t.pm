automacro iniciarQuestClasse2T_Bugged {
    JobLevel = 50
    exclusive 1
    JobID $paramsClasses{idC1T}
    FreeSkillPoints != 0
    timeout 60
    call {
        [
        log ==================================
        log pontos de skills não distribuidos!
        log tentando resolver isso
        log ==================================
        ]
        do conf skillsAddAuto 1
        do conf skillsAddAuto_list $configsBuild{skillsClasse1T}
    }
}


automacro iniciarQuestClasse2T {
    exclusive 1
    JobID $paramsClasses{idC1T} 
    JobLevel = 50
    FreeSkillPoints = 0
    call {
        call pararDeAtacar
        do conf lockMap none
        do conf -f virarClasse2T true
        do move yuno_in02 &rand(86,90) &rand(162,166)
    }
}

automacro falarComMetheus {
    exclusive 1
    JobID $paramsClasses{idC1T} 
    JobLevel = 50
    FreeSkillPoints = 0
    InMap yuno_in02
    NpcNear /Metheus Sylphe/
    call {
        do talknpc 88 164
        do move yuno_in02 &rand(91,95) &rand(204,206)
    }
}

automacro falarComLivro {
    exclusive 1
    JobID $paramsClasses{idC1T} 
    JobLevel = 50
    FreeSkillPoints = 0
    InMap yuno_in02
    NpcNear /Livro de Ymir/
    call {
        do talknpc 93 207
    }
}

automacro falarComNpcDaClasse {
    exclusive 1
    JobID $paramsClasses{idC1T} 
    JobLevel = 50
    FreeSkillPoints = 0
    InMap valkyrie
    call {
        do move paramsQuestClasse2T{Npc}
        do talknpc paramsQuestClasse2T{Npc} r1
    }
}

automacro jaSouClasse2T {
    exclusive 1
    JobID $paramsClasses{idC2T}, $paramsClasses{idC2TAlt}
    ConfigKey virarClasse2T true
    call {
        do conf virarClasse2T none
        call atualizarBuild
    }
}

