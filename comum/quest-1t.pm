automacro virandoClasse1tBugged {
    JobLevel = 10
    JobID 161 #aprendiz T.
    InMapRegex /^(?!new_\d-\d)$/
    SkillLevel NV_BASIC != 9
    exclusive 1
    call {
        $pontos = $.SkillLevelLastLevel
        log As Habilidades básicas nao foram distribuídas!!!
        log A skill ta lvl $.SkillLevelLastLevel
        log Mudando isso
        while ($pontos < 9 ) {
            do skills add NV_BASIC
            $pontos++
        }
    }
}
automacro virandoClasse1T_movendoAteLa {
    NotInMap $paramsQuestClasse1T{mapa}
    JobID 161,4001 #Aprendiz
    JobLevel 10
    SkillLevel NV_BASIC = 9
    exclusive 1
    call {
        do conf lockMap none
        call pararDeAtacar
        do conf -f virandoClasse1T true
        do conf -f o_que_estou_fazendo virandoClasse1Trans
        log cidade: $paramsQuestClasse1T
        do move $paramsQuestClasse1T{mapa} $paramsQuestClasse1T{npc} &rand(1,5)
    }
}

automacro virandoClasse1t {
    InMap $paramsQuestClasse1T{mapa}
    JobID 161,4001 #Aprendiz
    JobLevel 10
    SkillLevel NV_BASIC = 9
    exclusive 1
    call {
        # $paramsQuestClasse1T{mapa} tem como valor o mapa em vc vira classe 1
        # $paramsQuestClasse1T{npc} contem as coordenadas do npc
        # $paramsQuestClasse1T{sequenciaConversa} tem como valor a sequencia de conversação correta
        # $paramsQuestClasse1T{equipeIniciante} tem como valor a id da arma que vc recebe quando vira classe 1
        do conf -f virandoClasse1T true
        do conf -f o_que_estou_fazendo virandoClasse1Trans
        log mapa: "$paramsQuestClasse1T{mapa}"
        log npc:  "$paramsQuestClasse1T{npc}"
        log sequenciaConversa: "$paramsQuestClasse1T{sequenciaConversa}"
        log equip: "$paramsQuestClasse1T{equipeIniciante}"
        #repetindo o comando de se mover só por desencargo de consciencia
        do move $paramsQuestClasse1T{mapa} $paramsQuestClasse1T{npc} &rand(1,5)
        if (a$paramsQuestClasse1T{sequenciaConversa} = a) {
            log iniciando conversa sem sequencia
            do talknpc $paramsQuestClasse1T{npc}
        } else {
            log conversa tem sequencia, usando ela
            do talknpc $paramsQuestClasse1T{npc} $paramsQuestClasse1T{sequenciaConversa}
        }
    }
}

automacro jaSouClasse1t {
    JobID $paramsClasses{idC1T}
    ConfigKey virandoClasse1T true
    exclusive 1
    call {
        call atualizarBuild
        do iconf 2393 0 0 0 #Tunica de Iniciante
        do iconf $paramsQuestClasse1T{equipeIniciante} 0 0 0
        $check = GetIndexAndEquipped("armor", 2393) #Tunica de Iniciante
        if ($check != -1) do eq $check
        $check = GetIndexAndEquipped("rightHand", "$paramsQuestClasse1T{equipeIniciante}")
        if ($check != -1) do eq $check
        do conf virandoClasse1T none
        
        do conf -f o_que_estou_fazendo acabeiDeVirarClasse1T
    }
}

