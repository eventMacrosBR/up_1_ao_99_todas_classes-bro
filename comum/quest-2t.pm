automacro questClasse2T_iniciarQuestClasse2T_bugada {
    JobLevel = 50
    exclusive 1
    JobID $parametrosClasses{idC1T}
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

automacro questClasse2T_irParaJuno {
    exclusive 1
    JobID $parametrosClasses{idC1T} 
    JobLevel = 50
    FreeSkillPoints = 0
    NotInMap yuno_in02
    call {
        call pararDeAtacar
        do conf lockMap none
        do conf -f virarClasse2T true
        do conf -f o_que_estou_fazendo virandoClasse2T
        do move yuno_in02
    }
}

automacro questClasse2T_irFalarComLivro {
    exclusive 1
    JobID $parametrosClasses{idC1T} 
    JobLevel = 50
    FreeSkillPoints = 0
    InMap yuno_in02
    NpcNotNear /Livro de Ymir/
    call {
        do talknpc 88 164
        do move yuno_in02 &rand(91,95) &rand(204,206)
    }
}

automacro questClasse2T_falarComLivro {
    exclusive 1
    JobID $parametrosClasses{idC1T} 
    JobLevel = 50
    FreeSkillPoints = 0
    InMap yuno_in02
    NpcNear /Livro de Ymir/
    call {
        do talknpc 93 207 r1
    }
}

automacro questClasse2T_falarComNpcDaClasse {
    exclusive 1
    JobID $parametrosClasses{idC1T} 
    JobLevel = 50
    FreeSkillPoints = 0
    InMap valkyrie
    call {
        do move valkyrie $parametrosQuestClasse2T{Npc} &rand(2,5)
        do talknpc $parametrosQuestClasse2T{Npc} r1
    }
}

automacro questClasse2T_jaSouClasse2T {
    exclusive 1
    JobID $parametrosClasses{idC2T}, $parametrosClasses{idC2TAlt}
    ConfigKey virarClasse2T true
    macro_delay 2
    call {
        do move valkyrie 44 33 &rand(3,10)
        do talk &npc(44 33) #teleportadora
        do talk resp /$mapa{saveMap}/i
        do conf virarClasse2T none
        do conf -f o_que_estou_fazendo acabeiDeVirarClasse2T
        call atualizarBuild
    }
}

