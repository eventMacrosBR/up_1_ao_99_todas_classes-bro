sub inicializarParametrosQuestClasse1 {
    Commands::run("eventMacro disable questClasse1_virandoClasse1");
    return {
        nomeClasse => "arqueiro", #isso é gambiarra pra ele sair do campo de aprendiz e ir pra payon
        equipeIniciante => -1,
        mapa => 'payon_in02',
    }
}


#6000#Mudança de Classe: Taekwon#SG_FEEL#QUE_NOIMAGE#
#Você escolheu o caminho do Taekwon. Você deve aumentar seu nível de base e falar com Fênix. #
#

#6001#Mudança de Classe: Taekwon#SG_FEEL#QUE_NOIMAGE#
#Você escolheu o caminho do Taekwon. Você deve passar pelo exame de aptidão mental dado por Fênix. #
#

#6002#Mudança de Classe: Taekwon#SG_FEEL#QUE_NOIMAGE#
#Você finalmente pode se tornar Taekwon, falando mais uma vez com Fênix. #
#

#automacro questTaekwon_começo_npcLonge {
#    exclusive 1
#    JobID 0, 4023
#    InMap payon_in02,payon,pay_arche
#    QuestInactive 6000
#    QuestInactive 6001
#    QuestInactive 6002
#    call {
#        do move payon 157 141 &rand(2,7)
#        do talknpc 157 141
#    }
#}