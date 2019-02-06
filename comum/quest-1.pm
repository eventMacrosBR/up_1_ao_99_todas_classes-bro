automacro questClasse1_virandoClasse1_bugada {
    JobLevel = 10
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

automacro questClasse1_virandoClasse1 {
    InMap $parametrosQuestClasse1{mapa}
    JobID 0, 4023 #Aprendiz e Baby Aprendiz
    JobLevel 10
    SkillLevel NV_BASIC = 9
    exclusive 1
    call {
        # $virarclasse1precisamover tem como valor sim ou nao
        # $virarclasse1mapa tem como valor o mapa em vc vira classe 1
        # $virarclasse1coordenadanpc contem as coordenadas do npc
        # $virarclasse1sequenciadeconversa tem como valor a sequencia de conversação correta
        # $idequipiniciante tem como valor a id da arma que vc recebe quando vira classe 1
        
        do conf -f o_que_estou_fazendo virando Classe 1
        if ($parametrosQuestClasse1{precisaMover} = sim) {
            do move $parametrosQuestClasse1{mapa} $parametrosQuestClasse1{npc} &rand(1,5)
        }
        do talknpc $parametrosQuestClasse1{npc} $parametrosQuestClasse1{sequenciaConversa}
        call equiparSePossivel rightHand $parametrosQuestClasse1{equipeIniciante}

        #Voltar pegar itens após o campo de treinamento
        do conf itemsTakeAuto 1
        do conf itemsGatherAuto 1
    }
}

automacro questClasse1_saiDoCampoDeTreinamentoEEstouNoMapaErrado {
    NotInMap $parametrosQuestClasse1{mapa}
    InMapRegex /^(?!new_\d-\d).*/
    JobID 0, 4023 #Aprendiz e Baby Aprendiz
    JobLevel 10
    SkillLevel NV_BASIC = 9
    exclusive 1
    BaseLevel > 11
    call {
        [
            log ==============================================
            log Deveria estar em $parametrosQuestClasse1{mapa}
            log mas não estou, vou para lá
            log ==============================================
        ]
        do move $parametrosQuestClasse1{mapa} $parametrosQuestClasse1{npc} &rand(1,5)
    }
}

automacro questClasse1_jaSouClasse1 {
    JobIDNot 0 #aprendiz
    JobIDNot 4023 #Baby Aprendiz
    InInventoryID 2414 = 1 #sandalias de aprendiz
    exclusive 1
    call {
        do pconf 1243 0 #1243#Adaga_do_Aprendiz#
        do pconf 2112 0 #2112#Vembrassa_do_Aprendiz#
        do pconf 2414 0 #2414#Sandálias_do_Aprendiz#
        do pconf 2510 0 #2510#Capuz_do_Aprendiz#
        do pconf 2532 0 #2352#Traje_do_Aprendiz#
        do pconf 5055 0 #5055#Chapéu_de_Ovo_do_Aprendiz#
        do iconf 2393 0 0 0 #Tunica de Iniciante
        do iconf $parametrosQuestClasse1{equipeIniciante} 0 0 0
        $check = pegarIndiceDoEquipamentoPeloId("rightHand", 1243) #Adaga_do_Aprendiz#
        if ($check != -1) do drop $check
        $check = pegarIndiceDoEquipamentoPeloId("leftHand", 2112)#Vembrassa_do_Aprendiz#
        if ($check != -1) do drop $check
        $check = pegarIndiceDoEquipamentoPeloId("shoes", 2414) #Sandálias_do_Aprendiz#
        if ($check != -1) do drop $check
        $check = pegarIndiceDoEquipamentoPeloId("robe", 2510) #Capuz_do_Aprendiz#
        if ($check != -1) do drop $check
        $check = pegarIndiceDoEquipamentoPeloId("armor", 2352) #Chapéu_de_Ovo_do_Aprendiz#
        if ($check != -1) do drop $check
        $check = pegarIndiceDoEquipamentoPeloId("topHead", 5055) #Chapéu_de_Ovo_do_Aprendiz#
        if ($check != -1) do drop $check
        $check = pegarIndiceDoEquipamentoPeloId("armor", 2393) #Tunica de Iniciante
        if ($check != -1) do eq $check
        $check = pegarIndiceDoEquipamentoPeloId("rightHand", "$parametrosQuestClasse1{equipeIniciante}")
        if ($check != -1) do eq $check
        call atualizarBuild
        do conf -f o_que_estou_fazendo acabei de Virar Classe 1
    }
}

