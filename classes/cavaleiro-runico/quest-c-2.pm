sub initParamsQuestClasse2 {
    #Possibilidade 1:
    Commands::run ("iconf 931 5 1 0" ); #Amuleto dos Orcs
    Commands::run ("iconf 903 5 1 0" ); #Língua de Réptil
    Commands::run ("iconf 1040 5 1 0"); #Bigode de Anão Ancião
    Commands::run ("iconf 7006 5 1 0"); #Asa de Morcego Vermelha
    Commands::run ("iconf 1057 5 1 0"); #Pó de Traça
    Commands::run ("iconf 1028 5 1 0"); #Crina
    #Possibilidade 2:
    Commands::run ("iconf 966 5 1 0" ); #Carne de Ostra
    Commands::run ("iconf 950 5 1 0" ); #Coração de Sereia
    Commands::run ("iconf 1042 5 1 0"); #Pata de Inseto
    Commands::run ("iconf 1032 5 1 0"); #Flor de Planta Carnívora
    Commands::run ("iconf 7031 5 1 0"); #Frigideira Velha
    Commands::run ("iconf 946 5 1 0" ); #Casco de Caramujo

    Commands::run("conf -f questc2_implementada true");
}

# 1 edit : reiropke
# Testada e Funcional por Sarampo 
automacro virarCavaleiro_Começo_irAoNpc {
    JobLevel = 50
    JobID $paramsClasses{idC1}
    exclusive 1
    QuestInactive 9000 #
    QuestInactive 9001 #
    QuestInactive 9002 #
    QuestInactive 9003 #
    QuestInactive 9004 #
    QuestInactive 9005 #
    QuestInactive 9006 #
    QuestInactive 9007 #
    QuestInactive 9008 #
    QuestInactive 9009 #
    QuestInactive 9010 #
    QuestInactive 9011 #
    QuestInactive 9012 #
    NpcNotNear /Chefe dos Cavaleiros/ #ou Chivalry Captain
    call {
    do conf lockMap none
    do move prt_in 88 101
    }
}

automacro virarCavaleiro_Começo {
    JobLevel = 50
    JobID $paramsClasses{idC1}
    exclusive 1
    QuestInactive 9000 # job change to knight
    QuestInactive 9001 #
    QuestInactive 9002 #
    QuestInactive 9003 #
    QuestInactive 9004 #
    QuestInactive 9005 #
    QuestInactive 9006 #
    QuestInactive 9007 #
    QuestInactive 9008 #
    QuestInactive 9009 #
    QuestInactive 9010 #
    QuestInactive 9011 #
    QuestInactive 9012 #
    NpcNear /Chefe dos Cavaleiros/ #ou Chivalry Captain
    call {
    do talk $.NpcNearLastBinId
    do talk resp 0
    do talk resp 0
    [
    log ==============================
    log Falei com o Chefe dos cavaleiros
    log ==============================
    ]
    }
}


#coleta os itens só ocorre SE voce esta entre os joblvl 40 -> 49, no  joblvl 50 nao é necessario esta etapa

#automacro virarCavaleiro_PegarItens { #falta configurar
#    QuestActive 9000
#    exclusive 1
#}

automacro virarCavaleiro_irAoNpc2 {
    JobLevel = 50
    JobID $paramsClasses{idC1}
    exclusive 1
    QuestActive   9000 #
    QuestInactive 9001 #
    QuestInactive 9002 #
    QuestInactive 9003 #
    QuestInactive 9004 #
    QuestInactive 9005 #
    QuestInactive 9006 #
    QuestInactive 9007 #
    QuestInactive 9008 #
    QuestInactive 9009 #
    QuestInactive 9010 #
    QuestInactive 9011 #
    QuestInactive 9012 #
    NpcNear /Cavaleiro Dedicado/ #ou Sir Andrew
    call {
    do move prt_in 75 107
    do talk $.NpcNearLastBinId
    do talk resp 0
    [
    log ==============================
    log Falei com o Cavaleiro Dedicado
    log ==============================
    ]
    do move prt_in 71 91
    }
}        

automacro virarCavaleiro_irAoNpc3 {
    JobLevel = 50
    JobID $paramsClasses{idC1}
    exclusive 1
    QuestInactive 9000 #
    QuestInactive 9001 #
    QuestInactive 9002 #
    QuestActive   9003 #
    QuestInactive 9004 # 
    QuestInactive 9005 #
    QuestInactive 9006 #
    QuestInactive 9007 #
    QuestInactive 9008 #
    QuestInactive 9009 #
    QuestInactive 9010 #
    QuestInactive 9011 #
    QuestInactive 9012 #
    NpcNear /Cavaleiro Honroso/ #ou Sir Siracuse
    call {
    do move prt_in 71 91 
    do talk $.NpcNearLastBinId
    do talk resp 0  #esta é a unica resposta certa as outras estao incertas.. porem precisa acertar 8 de 10 pra passar!!!
    do talk resp 3  #flamberge
    do talk resp 2  # provoke lvl 10
    do talk resp 2  #spear boomerang
    do talk resp 0  #zefiro
    do talk resp 1  #80%
    do talk resp 0  #indica uma bora area de up
    do talk resp 0  #proteger todo mundo
    do talk resp 0  #honra
    [
    log ==============================
    log Falei com o Cavaleiro Honroso
    log ==============================
    ]
    }
}        

automacro virarCavaleiro_irAoNpc4 {
    JobLevel = 50
    JobID $paramsClasses{idC1}
    exclusive 1
    QuestInactive 9000 # 
    QuestInactive 9001 #
    QuestInactive 9002 #
    QuestInactive 9003 #
    QuestActive 9004 #
    QuestInactive   9005 #
    QuestInactive 9006 #
    QuestInactive 9007 #
    QuestInactive 9008 #
    QuestInactive 9009 #
    QuestInactive 9010 #
    QuestInactive 9011 #
    QuestInactive 9012 #
    NpcNear /Cavaleiro das Lutas/ #ou Sir Windsor
    call {
    do move prt_in 79 94
    do talk $.NpcNearLastBinId
    do talk resp 0  
    [
    log ==============================
    log Falei com o Cavaleiro das Lutas
    log ==============================
    ]
    }
}        
automacro virarCavaleiro_irAoNpc4_parte_2_morri { 
    NotInMap job_knt
	NotInMap prt_fild05
	JobLevel = 50
    JobID $paramsClasses{idC1}
    exclusive 1
    QuestInactive 9000 #
    QuestInactive 9001 #
    QuestInactive 9002 #
    QuestInactive 9003 #
    QuestInactive 9004 # 
    QuestInactive   9005 #
    QuestActive 9006 #
    QuestInactive 9007 #
    QuestInactive 9008 #
    QuestInactive 9009 #
    QuestInactive 9010 #
    QuestInactive 9011 #
    QuestInactive 9012 #
	NpcNotNear /Cavaleiro das Lutas/ #ou Sir Windsor
    call {
    do move prt_in 71 91 #CHECAR
    }
}
automacro virarCavaleiro_irAoNpc4_parte_2_morri_cheguei {
    NpcNear /Cavaleiro das Lutas/
    exclusive 1
    QuestActive 9006 #
    call {
    do talk $.NpcNearLastBinId
    do talk resp 0 
    lock virarCavaleiro_irAoNpc4_parte_2_morri_cheguei
    }
}
automacro virarCavaleiro_irAoNpc4_parte_2 { 
    InMap job_knt
	JobLevel = 50
    JobID $paramsClasses{idC1}
    exclusive 1
    QuestInactive 9000 # CHECAR!!!!
    QuestInactive 9001 #
    QuestInactive 9002 #
    QuestInactive 9003 #
    QuestInactive 9004 # 
    QuestInactive   9005 #
    QuestActive 9006 #
    QuestInactive 9007 #
    QuestInactive 9008 #
    QuestInactive 9009 #
    QuestInactive 9010 #
    QuestInactive 9011 #
    QuestInactive 9012 #
    call {
    do chat join 0
	do conf attackAuto 2
	do conf lockMap none
	do conf route_randomWalk 2
	lock virarCavaleiro_irAoNpc4_parte_2
    }
}        

automacro virarCavaleiro_irAoNpcmulher {
    JobLevel = 50
    JobID $paramsClasses{idC1}
    exclusive 1
    QuestInactive 9000 #
    QuestInactive 9001 #
    QuestInactive 9002 #
    QuestInactive 9003 # 
    QuestInactive 9004 # 
    QuestInactive 9005 #
    QuestActive 9006 #
    QuestInactive   9007 #
    QuestInactive 9008 #
    QuestInactive 9009 #
    QuestInactive 9010 #
    QuestInactive 9011 #
    QuestInactive 9012 #
    NpcNear /Cavaleira Educada/ #ou Amy Beatrice
    call {
    do move prt_in 69 107 #CHECAR
    do talk $.NpcNearLastBinId
    do talk resp 0  #apos falar com ela a quest 9008 é ativada
    do talk resp 2 #abre uma sala e espera 2
    do talk resp 2 # vou na frente
    do talk resp 1 #impeço mosntros de chegarem na party 1
    do talk resp 0 #pede pro sacer ajudar
    do talk resp 2 #decide com o grupo
    do talk resp 1 #abre um chat e espera
    do talk resp 2 # a sugestoes de onde caçar
    do talk resp 0 # leva a pessoa a saida 0
    do talk resp 0 # pede gentilmente a cura
    do talk resp 1 #pergunta se é de alguem 

    [
    log ==============================
    log Falei com a Cavaleira Educada , teste completo 
    log ==============================
    ]

    }
}        

automacro virarCavaleiro_irAoNpcCalmo {
    JobLevel = 50
    JobID $paramsClasses{idC1}
    exclusive 1
    QuestInactive 9000 #
    QuestInactive 9001 #
    QuestInactive 9002 #
    QuestInactive 9003 # 
    QuestInactive 9004 # 
    QuestInactive 9005 #
    QuestInactive 9006 #
    QuestInactive 9007 #
    QuestInactive 9008 #
    QuestActive   9009 #
    QuestInactive 9010 #
    QuestInactive 9011 #
    QuestInactive 9012 #
    NpcNear /Cavaleiro Devotado/ #ou Sir Edmond
    call {
    do move prt_in 70 99 #CHECAR
    do talk $.NpcNearLastBinId
    do talk resp 0 
    do conf attackAuto 0
    do conf lockMap none
    do conf route_randomWalk 0
    pause 350
    [
    log ==============================
    log Falei com o Cavaleiro Devotado , teste completo 
    log ==============================
    ]
    }
}        
automacro virarCavaleiro_matei_monstro {
	InMap prt_fild05
	JobLevel = 50
    JobID $paramsClasses{idC1}
    exclusive 1
    QuestInactive 9000 #
    QuestInactive 9001 #
    QuestInactive 9002 #
    QuestInactive 9003 # 
    QuestInactive 9004 # 
    QuestInactive 9005 #
    QuestInactive 9006 #
    QuestInactive 9007 #
    QuestInactive 9008 #
    QuestInactive   9009 #
    QuestActive 9010 # 
    QuestInactive 9011 #
    QuestInactive 9012 #
    NpcNotNear /Cavaleiro Devotado/ #ou Sir Edmond
    call {
    do move prt_in 70 99
    }
}        
automacro virarCavaleiro_matei_monstro_voltei {
    NpcNear /Cavaleiro Devotado/
    exclusive 1
    QuestActive 9010 #
    call {
    do talk $.NpcNearLastBinId
    do talk resp 0 
    do conf attackAuto 0
    do conf lockMap none
    do conf route_randomWalk 0
    lock virarCavaleiro_matei_monstro_voltei
    }
}

automacro virarCavaleiro_irAoNpcpenultimo {
    JobLevel = 50
    JobID $paramsClasses{idC1}
    exclusive 1
    QuestInactive 9000 #
    QuestInactive 9001 #
    QuestInactive 9002 #
    QuestInactive 9003 # 
    QuestInactive 9004 # 
    QuestInactive 9005 #
    QuestInactive 9006 #
    QuestInactive 9007 #
    QuestInactive 9008 #
    QuestInactive   9009 #
    QuestInactive 9010 # 
    QuestActive 9011 #
    QuestInactive 9012 #
    NpcNear /Cavaleiro Modesto/ #ou Sir Gray
    call {
    do move prt_in 87 92
    do talk $.NpcNearLastBinId
    do talk resp 0 
    do talk resp 2 
    do talk resp 1
    do talk resp 1
    do talk resp 0 

    [
    log ==============================
    log Falei com o Cavaleiro Modesto , teste completo 
    log ==============================
    ]
    }
}        


automacro virarCavaleiro_FIM {
    JobLevel = 50
    JobID $paramsClasses{idC1}
    exclusive 1
    QuestInactive 9000 #
    QuestInactive 9001 #
    QuestInactive 9002 #
    QuestInactive 9003 #
    QuestInactive 9004 #
    QuestInactive 9005 #
    QuestInactive 9006 #
    QuestInactive 9007 #
    QuestInactive 9008 #
    QuestInactive 9009 #
    QuestInactive 9010 # 
    QuestInactive 9011 #
    QuestActive   9012 #
    NpcNear /Chefe dos Cavaleiros/ #ou Chivalry Captain
    call {
    do move prt_in 88 101 #CHECAR
    do talk $.NpcNearLastBinId
    [
    log ==============================
    log Se tudo deu certo!
    log AGORA EU LUTO PELA JUSTIÇA E BONS COSTUMES!
    log ==============================
    ]
    }
}

