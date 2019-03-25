sub inicializarParametrosQuestClasse2 {
    my ($manterOuGuardar) = @_;
    my %items = (
    #TODO
    );
    foreach $key (keys %items) {
        if ($manterOuGuardar eq "manter") {
            Commands::run("iconf $key $items{$key}")
        } else {
            Commands::run("iconf $key 0 1 0")
        }
    }
}

#automacro virarFerreiro {
#    JobLevel = 50
#    JobID $parametrosClasses{idC1}, $parametrosClasses{idBC1}
#    exclusive 1
#    ConfigKeyNot virarClasse2 true
#    call {
#        [
#            do conf lockMap none
#            do conf route_randomWalk 0
#            do conf attackAuto 0
#        ]
#        do conf -f virarClasse2 true
#        do conf -f quest_classe2 IrParaEinbroch
#    }
#}
#
#automacro virarFerreiro_Inicio_irPraEinbroch {
#    ConfigKey quest_classe2 IrParaEinbroch
#    NpcNotNear /Mestre Ferreiro/ #Altazen
#    NotInMap einbroch
#    exclusive 1
#    call aeroplano_junoPara "einbroch"
#}
#
#automacro virarFerreiro_Inicio_emEinbroch {
#    ConfigKey quest_classe2 IrParaEinbroch
#    NpcNotNear /Mestre Ferreiro/ #Altazen
#    InMap einbroch, ein_in01
#    exclusive 1
#    call {
#        do move ein_in01 &rand(16,20) &rand(26, 30)
#    }
#}
#
#automacro virarFerreiro_falarComAltazen {
#    ConfigKey quest_classe2 IrParaEinbroch
#    NpcNear /Mestre Ferreiro/ #Altazen
#    InMap ein_in01
#    exclusive 1
#    call {
#        do talknpc 110 169 r0 #Do the job change.
#        do conf quest_classe2 primeiro_questionario
#    }
#}
#
##2000#Mudança de Classe: Ferreiro#SG_FEEL#QUE_NOIMAGE#
##Queremos verificar a dedicação e vontade dos Mercadores que querem se tornar Ferreiros. Como primeiro teste, vá até Einbech e ajude Geschupenschte, um dos membros da guilda. #
##Encontre o Ferreiro Geschupenschte em Einbech. #
#automacro virarFerreiro_responderPrimeiroQuestionario{
#    ConfigKey quest_classe2 primeiro_questionario
#    QuestActive 2000
#    macro_delay 2
#    call {
#        do move ein_in01 &rand(199,203) &rand(25,29)
#        do conf quest_classe2 TalkToGetsufenst
#    }
#}
#
#automacro TalkToGetsufenst {
#    ConfigKey quest_classe2 TalkToGetsufenst
#    NpcNear /Mestre Ferreiro/ #Getsufenst
#    macro_delay 2
#    exclusive 1
#    call {
#        do talknpc 201 27 r0 r~/(Alberta - Maça-Espada)|(Al De Baran - Martelo)/ r~/Atordoamento|3/ r~/Agilidade|carrinho/ r~/Alberta|Geffen/ r~/Noroeste|Sudeste/ r~/Bíblia|Claymore/ r~/Casaco de Pele/ r~/5|4/ r~/sakkat|ANOLIAN/ r~/Dinheiro/
#        pause &rand(5,10)
#        do talknpc 201 27
#        pause &rand(2,5)
#        do conf quest_classe2 GetsufenstTask
#    }
#}
#
## Até aqui parece ok
##2003#Mudança de Classe: Ferreiro#SG_FEEL#QUE_NOIMAGE#
##Preciso de alguns materiais para cuidar de várias encomendas. Pode me trazer estes materiais? É só um teste, não pense que nós, Ferreiros, somos preguiçosos. Hum. #
##Traga 2 unidades de Aço, 1 Bandagem Estragada, 1 Gema Azul e 1 Cetro da loja. Depois, volte a falar com Geschupenschte. #
#automacro GetsufenstTask {
#    ConfigKey quest_classe2 GetsufenstTask
#    QuestActive 2003
#    InMap alberta_in
#    exclusive 1
#    run-once 1
#    call {
#        do move alberta &rand(115, 118) &rand(51, 54)
#        pause 1
#        do conf autoTalkCont 1
#        pause 0.8
#        do talknpc 113 60
#        do talk resp 1
#    }
#}
#
##2003#Mudança de Classe: Ferreiro#SG_FEEL#QUE_NOIMAGE#
##Preciso de alguns materiais para cuidar de várias encomendas. Pode me trazer estes materiais? É só um teste, não pense que nós, Ferreiros, somos preguiçosos. Hum. #
##Traga 2 unidades de Aço, 1 Bandagem Estragada, 1 Gema Azul e 1 Cetro da loja. Depois, volte a falar com Geschupenschte. #
#automacro pegarItensDaKafra {
#    ConfigKey quest_classe2 GetsufenstTask
#    QuestActive 2003
#    InMap alberta_in
#    StorageOpened 1
#    exclusive 1
#    call {
#        $qtdErvaVerde = &invamount(511)
#        $qtdFerro = &invamount(998)
#        $qtdCouro = &invamount(919)
#        log Checando se tem dos items que eu preciso no armazém
#        if ( $qtdErvaVerde < 20 ) {
#            do storage get &storage (511) &eval (20 - $qtdErvaVerde)
#        }
#        if ( $qtdFerro < 8 ) {
#            do storage get &storage (998) &eval (8 - $qtdFerro)
#        }
#        if ( $qtdCouro < 2 ) {
#            do storage get &storage (919) &eval (2 - $qtdCouro)
#        }
#        log Checado.
#        do storage close
#        do conf quest_classe2 FarmQuestItems
#    }
#}
#
#
#automacro FarmQuestItems {
#    ConfigKey quest_classe2 FarmQuestItems
#    JobLevel = 50
#    exclusive 1
#    timeout 120
#    call {
#        $qtdErvaVerde = &invamount(511)
#        $qtdFerro = &invamount(998)
#        $qtdCouro = &invamount(919)
#        $qtdSabre = &invamount(1122)
#        [
#
#        if ( $qtdFerro < 8) {
#            do mconf Steel Chonchon 2
#            do pconf Iron 2
#            do conf lockMap moc_fild18
#            call voltarAtacar
#            stop
#        }
#        if ( $qtdErvaVerde < 20) {
#            do mconf Green Plant 2
#            do mconf Fabre 2
#            do mconf Poporing 2
#            do pconf Green Herb 2
#            do conf lockMap gef_fild00
#            call voltarAtacar
#            stop
#        }
#        if ( $qtdCouro < 2) {
#            do mconf Savage Babe 2
#            do mconf Baby Dessert Wolf 2
#            do pconf Animal Skin 2
#            do conf lockMap prt_fild09
#            call voltarAtacar
#            stop
#        }
#        if ($qtdSabre < 1) { #sabre de impacto
#            call pararDeAtacar
#            do conf lockMap none
#            do respawn
#            do conf sellAuto 0
#            do conf storageAuto 0
#             $blocoExiste = checarSeExisteNoConfig("buyAuto_0")
#            if ( $blocoExiste = nao ) {
#                adicionaBuyAuto()
#                pause 1
#                do reload config
#            }
#            do conf buyAuto_0 Sabre De Impacto [2]
#            do conf buyAuto_0_npc prt_in 172 130
#            do conf buyAuto_0_minAmount none
#            do conf buyAuto_0_maxAmount 1
#            do autobuy
#            stop
#        }
#
#        #condição especial pra desativar o buyAuto, só pra ter certeza
#        if ($qtdSabre >= 1) { #sabre de impacto
#            do conf buyAuto_0 none
#            do conf buyAuto_0_npc none
#            do conf buyAuto_0_minAmount none
#            do conf buyAuto_0_maxAmount none
#            #não vou parar a macro porque tem que continuar
#        }
#
#        ]
#
#        #se chegar nessa linha, significa que temos todos os itens
#
#        do move alberta_in &rand(176,180) &rand(21,26)
#        do conf quest_classe2 TalkToGetsufenstAgain
#    }
#}
#
#automacro TalkToGetsufenstAgain {
#    ConfigKey quest_classe2 TalkToGetsufenstAgain
#    InInventoryID 998 >= 8 #Ferro
#    InInventoryID 511 >= 20 #Erva Verde
#    InInventoryID 919 >= 2 #Couro de Animal
#    NpcNear /Guildsman/ #Getsufenst
#    exclusive 1
#    call {
#        do talknpc 174 22 r1 #I'm only holding the items required for this Job.
#        pause &rand(2,4)
#        do move comodo &rand(159,161) &rand(338,342)
#    }
#}
#
##2012#Mudança de Classe: Ferreiro#SG_FEEL#QUE_NOIMAGE#
##Tudo pronto! Certo. Dê este Sabre de Impacto a Bismarc, que está em Hugel. Não esqueça de me trazer o recibo. #
##Entregue o Sabre de Impacto a Bismarc em Hugel. #
#automacro DeliverToBismark {
#    QuestActive 2012
#    NpcNear /Bismark/
#    exclusive 1
#    call {
#        do talknpc 158 342 r1 #I assure you that it's new!
#        do conf quest_classe2 GoBackToGetsufenst
#        pause &rand(2,4)
#        do move alberta_in &rand(176,180) &rand(21,26)
#    }
#}
#
##2012#Mudança de Classe: Ferreiro#SG_FEEL#QUE_NOIMAGE#
##Tudo pronto! Certo. Dê este Sabre de Impacto a Bismarc, que está em Hugel. Não esqueça de me trazer o recibo. #
##Entregue o Sabre de Impacto a Bismarc em Hugel. #
#automacro DeliverVoucher {
#    ConfigKey quest_classe2 GoBackToGetsufenst
#    QuestActive 2012
#    NpcNear /Guildsman/ #Getsufenst
#    exclusive 1
#    call {
#        do talknpc 174 22 c c c r0 #Ah, yes. Here it is!
#        do conf quest_classe2 TalkToAltazen
#        pause &rand(2,4)
#        do move geffen_in &rand(106,110) &rand(172, 177)
#    }
#}
#
##2013#Mudança de Classe: Ferreiro#SG_FEEL#QUE_NOIMAGE#
##Excelente! Você é um grande Mercador! Certo, volte a falar com Altiregen em Einbroch! #
##Volte a falar com Altiregen #
#automacro TalkToAltazen {
#    ConfigKey quest_classe2 TalkToAltazen
#    QuestActive 2013
#    InMap geffen_in
#    NpcNear /Guildsman/ #Altazen
#    exclusive 1
#    call {
#        do talknpc 110 169 r0 #It's tough, but I have to go do it.
#        do conf quest_classe2 TalkToMitmayer
#    }
#}
#
#automacro TalkToMitmayer{
#    ConfigKey quest_classe2 TalkToMitmayer
#    exclusive 1
#    macro_delay 6
#    call {
#        do move morocc &rand(101,103) &rand(107,109)
#        do move morocc &rand(93,95) &rand(116,118)
#        do move morocc &rand(92,94) &rand(125,127)
#        do talknpc 95 133 r0 r~/Esqueleto|Aumentar|precisa/ r~/Alberta|Coração|Atordoamento/ r~/Sudoeste|Sangue|1000/ r~/Einbroch|Água|24/ r~/DES|5|24/
#        do conf quest_classe2 TalkToAltazenAgain
#    }
#}
#
#automacro TalkToAltazenAgain{
#    ConfigKey quest_classe2 TalkToAltazenAgain
#    exclusive 1
#    macro_delay 5
#    call {
#        do move morocc &rand(101,103) &rand(107,109)
#        do move geffen_in &rand(106,110) &rand(172, 177)
#        do talknpc 110 169
#        log Finally~!
#        do conf quest_classe2 none
#        do eq Sword Mace
#        [
#            do conf buyAuto_0 none
#            do conf buyAuto_0_npc none
#            do conf buyAuto_0_minAmount none
#            do conf buyAuto_0_maxAmount 3
#        ]
#    }
#}

