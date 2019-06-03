sub inicializarParametrosQuestClasse2 {
    my ($manterOuGuardar) = @_;
    my %items = (
     );
    Commands::run("conf -f questc2_implementada false");
    foreach $key (keys %items) {
        if ($manterOuGuardar eq "manter") {
            Commands::run("iconf $key $items{$key}")
        } else {
            Commands::run("iconf $key 0 1 0")
        }
    }
    Commands::run("do mconf Planta Verde 0 0 0 0 0 0 0 0 0");
    Commands::run("do mconf Planta Azul 0 0 0 0 0 0 0 0 0");
    Commands::run("do mconf Planta Brilhante 0 0 0 0 0 0 0 0 0");
    Commands::run("do mconf Rabo de Verme 0 0 0 0 0 0 0 0 0");
    Commands::run("do mconf Golem 0 0 0 0 0 0 0 0 0");
    Commands::run("do mconf Chon Chon de Aço 0 0 0 0 0 0 0 0 0");
    Commands::run("do mconf Metaling 0 0 0 0 0 0 0 0 0");
}

#COMEÇANDO SÓ PELO GUIA DA BROWIKI MAIS PARA BOTAR OS DADOS
#VOU FAZER UM BRUXO HOJE PARA CONFIRMAR TODOS OS PASSOS E MELHORAR UM POUCO
#MAS TEM UMA BASE AI

#automacro InicioVirarBruxo {
#    JobLevel = 50
#    NotInMap gef_tower
#    exclusive 1
#    call {
#
#        log JÁ TENHO LEVEL PARA VIRAR BRUXO
#        log INICIANDO A QUEST
#            
#        do conf lockMap none #para ele não fujir hehe
#        do move gef_tower 108 35
#    }
#}
#
#automacro ChefedaguildBruxo {
#    InMap gef_tower
#    QuestInactive 9016
#    exclusive 1
#    call {
#        do talk &npc(111 37)
#        do talk resp 0
#        do talk resp 0
#        if (&questStatus(ID da quest) == inactive) log Algo deu errado #Substituir ID,caso de problema na hora de iniciar o que fazer?
#    }
#}

#9016#Mudança de Classe: Bruxo#SG_FEEL#QUE_NOIMAGE#
#A segunda etapa do teste de mudança de classe é responder às perguntas de Raulel. #
#Converse com o Bruxo Misterioso #
#automacro QuestionarioBruxo {
#    InMap gef_tower
#    QuestActive 9016
#    exclusive 1
#    call {
#        do move 100 22
#        do talk &npc(102 24)
#        do talk resp 1
#        
#        #TODO Utilizar a lógica de respostas por expressão regular que é mais simples que esse switch doido
#        #switch() {#deixo com vocês tem que ver qual das 3 sequencias o npc vai seguir,da para adaptar a sub da de alquimista,mas como falei não sou bom com sub
#        #
#        #    case() {
#        #        #Qual dos atributos a seguir é o mais importante para um Mago?
#        #        do talk resp 0
#        #        do talk resp 1
#        #        do talk resp 2
#        #        do talk resp 1
#        #        do talk resp 3
#        #        do talk resp 3
#        #        do talk resp 1
#        #        do talk resp 0
#        #        do talk resp 1
#        #    }
#        #    case() {
#        #        #De que monstro você pode obter uma Vembrassa com Slot?
#        #        do talk resp 2
#        #        do talk resp 0
#        #        do talk resp 1
#        #        do talk resp 3
#        #        do talk resp 0
#        #        do talk resp 1
#        #        do talk resp 3
#        #        do talk resp 3
#        #        do talk resp 2
#        #    }
#        #    case() {
#        #        #Qual das habilidades a seguir não é necessária para aprender Barreira de Fogo? Não achei a ordem dos dialogos infelizmente
#        #    }
#        #}
#    }
#}
#
##9017#Mudança de Classe: Bruxo#SG_FEEL#QUE_NOIMAGE#
##A 3a. etapa do teste de mudança de classe é entender as 3 diferentes propriedades da Magia. #
##Faça o teste prático com 3 propriedades diferentes #
#automacro TestePraticoBruxoIniciar {
#    InMap gef_tower
#    QuestActive 9017
#    exclusive 1
#    call {
#        if (&Invamount(503) >= 50) {
#            do talk &npc(102 24)
#            do talk resp 1
#            do talk resp 0
#        } else {
#            log Indo Comprar poções
#            log Não consigo sem elas
#            do autobuy #?????
#        }
#    }
#}
#
#automacro TestePraticoBruxoSaladeEspera {
#    NpcNear /Sala de Espera/
#    exclusive 1
#    InMap #Nome do mapa, confirmar depois
#    call {
#    
#        #editar priority.txt para atacar os mais perigosos primeiro?
#        do conf -f testepraticobruxo emprogresso
#        
#        do conf attackSkillSlot_0_monsters Guerreiro Orc, Mandrágora, Pé-Grande, Caramelo, Giearth, Vitata, Deniro #lanças de fogo
#        do conf attackSkillSlot_1_monsters Goblin, Salgueiro Ancião, Frilldora, Escorpião, General da Floresta, Pecopeco, Metaller # lanças de gelo
#        do conf attackSkillSlot_2_monsters Hidras, Cornutus, Fens, Moluscos, Vadons, Magnólias,Marins, Marinas, Esferas Marinhas #Relampago
#        
#        #apos isso tem que entrar no chat do npc, não sei fazer :P
#    }
#}
#
##automacro DentrodaSala1Bruxo {
##    InMap #Sala1 do teste pratico,bichos detectores mas não agressivos
##    exclusive 1
##    call {
##        #andar pela sala evitando o centro.vai spawnar esferas marinhas e hidras lá
##    }
##}
##
##automacro DentrodaSala2Bruxo {
##    InMap #Sala2 do teste pratico,bichos detectores somente Orc agressivos
##    exclusive 1
##    call {
##        #priorizar atacar o orc primeiro.pode ser um problema ele quebrando o cast.
##        #andar pela sala evitando o centro.vai spawnar mandragoras
##    }
##}
##
##automacro DentrodaSala3Bruxo {
##    InMap #Sala3 do teste pratico,bichos detectores somente Salgueiro Ancião, Escorpião e Goblin
##    exclusive 1
##    call {
##        #priorizar atacar Salgueiro Ancião, Escorpião e Goblin.pode ser um problema eles quebrando o cast.tentar pegar 1 de cada vez
##        #andar pela sala evitando o centro.vai spawnar Guardião da Floresta
##        do conf -f testepraticobruxo concluido
##    }
##}
#
##9018#Mudança de Classe: Bruxo#SG_FEEL#QUE_NOIMAGE#
##Você passou em todos os testes de Raulel. Fale com Catherine para terminar! #
##Converse com Catherine #
#automacro FinalizandoVirarBruxo {
#    InMap gef_tower
#    QuestActive 9018
#    ConfigKey testepraticobruxo concluido
#    exclusive 1
#    call {
#        do talk &npc(111 37)
#        log AGORA SOU UM BRUXO
#    }
#}

