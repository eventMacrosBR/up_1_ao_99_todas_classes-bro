#Parte comum em todas quests de classes
automacro questClasse3_virarClasse3Inicio_bugada {
    FreeSkillPoints > 0
    timeout 30
    BaseLevel = 99
    JobID $parametrosClasses{idC2T}, $parametrosClasses{idC2TAlt}, $parametrosClasses{idBC2}, $parametrosClasses{idBC2Alt}
    exclusive 1
    call {
        [
        log =============================================
        log = Estou pronto para virar classe3, porém    =
        log =     os pontos não estão distribuídos...   =
        log =            Vamos resolver isso!        =
        log =============================================
        ]
        do conf skillsAddAuto 1
        do conf skillsAddAuto_list $configsBuild{skillsClasse2T}
        [
        log ================================================================
        log = Se isso estiver aparecendo repetidamente, a macro tem um bug
        log = Ou não foi definido skills para serem distribuídas nessa classe
        log ================================================================
        ]
    }
}

automacro questClasse3_inicio {
    BaseLevel = 99
    FreeSkillPoints = 0
    JobID $parametrosClasses{idC2T}, $parametrosClasses{idC2TAlt}, $parametrosClasses{idBC2}, $parametrosClasses{idBC2Alt}
    ConfigKeyNot virarClasse3 true
    exclusive 1
    ConfigKey questc3_implementada true
    call {
        do conf -f virarClasse3 true
        do conf -f o_que_estou_fazendo virandoClasse3
    }
}

automacro questClasse3_jaSouClasse3 {
    JobID $parametrosClasses{idC3}, $parametrosClasses{idC3Alt}, $parametrosClasses{idBC3}, $parametrosClasses{idBC3Alt}
    ConfigKey virarClasse3 true
    exclusive 1
    call {
        [
        log ===================
        log = Já sou classe 3 =
        log ===================
        ]
        do conf virarClasse3 none
        do conf -f o_que_estou_fazendo acabeiDeVirarClasse3
        release equipandoArmaEden
        release equipandoArmaduraEden
        release equipandoBotaEden
        release equipandoChapeuEden
        release equipandoCapaEden
        call atualizarBuild
    }
}

automacro questClasse3_jaSouClasse3NaoAutomatico {
    JobID $parametrosClasses{idC3}, $parametrosClasses{idC3Alt}, $parametrosClasses{idBC3}, $parametrosClasses{idBC3Alt}
    ConfigKey esperarFazerQuest true
    exclusive 1
    call {
        [
        log =================================================
        log = Já sou classe 3, pois fiz a quest manualmente =
        log =================================================
        ]
        do conf esperarFazerQuest none
        do conf -f o_que_estou_fazendo acabeiDeVirarClasse3
        release equipandoArmaEden
        release equipandoArmaduraEden
        release equipandoBotaEden
        release equipandoChapeuEden
        release equipandoCapaEden
        call atualizarBuild
    }
}



automacro questClasse3_avisoNivelDeBase99 {
    BaseLevel = 99
    JobID $parametrosClasses{idC2T}, $parametrosClasses{idC2TAlt}, $parametrosClasses{idBC2}, $parametrosClasses{idBC2Alt}
    exclusive 1
    timeout 20
    ConfigKeyNot virarClasse3 true
    ConfigKeyNot questc3_implementada true
    call {
        [
        log ===================================
        log SEU CHAR JÁ ESTÁ NO NIVEL 99 DE BASE
        log FAÇA A QUEST PARA VIRAR CLASSE 3 MANUALMENTE POR FAVOR
        log DEPOIS ABRA O BOT NOVAMENTE
        log ASSIM QUE ELE SE TORNAR UM CLASSE 3, A MACRO VOLTA A UPAR NORMALMENTE
        log ===================================
        ]
        do conf lockMap none
        call pararDeAtacar
        do conf -f esperarFazerQuest true
        do conf -f o_que_estou_fazendo esperandoQuestSerFeitaManualmente
        do move &config(saveMap) if ($.map != &config(saveMap))
    }
}

