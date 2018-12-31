sub inicializarParametrosQuestClasse2 {
    my ($manterOuGuardar) = @_;
    my %items = (
    523 => "1 1 0", #Água Benta
    930 => "10 1 0", #Bandagem Estragada
    1041 => "10 1 0", #Lampião
    2608 => "1 1 0" #Rosário
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

automacro virarTemplario_Começo_irAoNpc {
    JobLevel = 50
    JobID $parametrosClasses{idC1}, $parametrosClasses{idBC1}
    exclusive 1
    QuestInactive 3006 #
    QuestInactive 3007 #
    QuestInactive 3008 #
    QuestInactive 3009 #
    QuestInactive 3010 # TODAS SÃO QUESTS DE TEMPLARIO
    QuestInactive 3011 #
    QuestInactive 3012 #
    QuestInactive 3013 #
    QuestInactive 3014 #
    QuestInactive 3015 #
    ConfigKeyNot virarClasse2 true
    NpcNotNear /Senior Crusader/
    call {
        do move prt_castle 45 169 &rand(2,5)
    }
}

automacro virarTemplario_Começo {
    JobLevel = 50
    JobID $parametrosClasses{idC1}, $parametrosClasses{idBC1}
    exclusive 1
    QuestInactive 3006 #
    QuestInactive 3007 #
    QuestInactive 3008 #
    QuestInactive 3009 #
    QuestInactive 3010 # TODAS SÃO QUESTS DE TEMPLARIO
    QuestInactive 3011 #
    QuestInactive 3012 #
    QuestInactive 3013 #
    QuestInactive 3014 #
    QuestInactive 3015 #
    NpcNear /Senior Crusader/
    call {
        do talk $.NpcNearLastBinId
        do talk resp 0
        do talk resp 0
        [
        log ==============================
        log Falei com o Templario, agora
        log vou coletar os itens!
        log ==============================
        ]
    }
}

#3006#Mudança de Classe: Templário#SG_FEEL#QUE_NOIMAGE#
#'Vou avaliar seu esforço e decidir se você está qualificado ou não. Você deve trazer ^3355FFBandagens Estragadas e Lampiões^000000' #
#10 Bandagens Estragadas e 10 Lampiões #
#3007#Mudança de Classe: Templário#SG_FEEL#QUE_NOIMAGE#
#'Vou avaliar seu esforço e decidir se você está qualificado ou não. Você deve trazer ^3355FFBandagens Estragadas e Lampiões^000000' #
#10 Bandagens Estragadas e 10 Lampiões #
#3008#Mudança de Classe: Templário#SG_FEEL#QUE_NOIMAGE#
#'Vou avaliar seu esforço e decidir se você está qualificado ou não. Você deve trazer ^3355FFBandagens Estragadas e Lampiões^000000' #
#10 Bandagens Estragadas e 10 Lampiões #
automacro virarTemplario_PegarItens {
    QuestActive 3006, 3007, 3008
    exclusive 1
    timeout 100
    ConfigKeyNot questTemplario jaColeteiOsItens
    call {
        do conf -f virarClasse2 true
        $qtdBandagem = &invamount(930)
        $qtdLampiao = &invamount(1041)

        if ( $qtdBandagem < 10 ) {
            #primeiro item a pegar, depois pega o outro
            $nomeDoItem = Bandagem Estragada
            if (&config(lockMap) != moc_pryd03) do conf lockMap moc_pryd03
            if (&config(attackAuto) != 2) call voltarAtacar
            do mconf 1191 1 0 0 #mimico
        } elsif ( $qtdBandagem >= 10 && $qtdLampiao < 10) {
            #quando já tiver 10 bandagens, ele vai pegar os lampiao
            $nomeDoItem = Lampião
            if (&config(lockMap) != mjo_dun02) do conf lockMap mjo_dun02
            if (&config(attackAuto) != 2) call voltarAtacar
            do mconf 1145 0 0 0 #Martin
            do mconf 1121 0 0 0 #Giearth
        } elsif ( $qtdBandagem >= 10 && $qtdLampiao >= 10) {
            #se já tiver todos os itens, tá na hora!
            log ====================================
            log Já coletei todos os itens,
            log Indo falar com o NPC
            log ====================================
            do conf -f questTemplario jaColeteiOsItens
            do conf lockMap none
            stop
        }


        [
        log ===================================================
        log = Estou coletando $nomeDoItem, já tenho &invamount($nomeDoItem)
        log ===================================================
        ]
    }
}

#3006#Mudança de Classe: Templário#SG_FEEL#QUE_NOIMAGE#
#'Vou avaliar seu esforço e decidir se você está qualificado ou não. Você deve trazer ^3355FFBandagens Estragadas e Lampiões^000000' #
#10 Bandagens Estragadas e 10 Lampiões #
#3007#Mudança de Classe: Templário#SG_FEEL#QUE_NOIMAGE#
#'Vou avaliar seu esforço e decidir se você está qualificado ou não. Você deve trazer ^3355FFBandagens Estragadas e Lampiões^000000' #
#10 Bandagens Estragadas e 10 Lampiões #
#3008#Mudança de Classe: Templário#SG_FEEL#QUE_NOIMAGE#
#'Vou avaliar seu esforço e decidir se você está qualificado ou não. Você deve trazer ^3355FFBandagens Estragadas e Lampiões^000000' #
#10 Bandagens Estragadas e 10 Lampiões #
automacro virarTemplario_ColeteiTodosOsItens_IndoProNpc {
    InInventoryID 930 >= 10 #Bandagem Estragada
    InInventoryID 1041 >= 10 #Lampião
    ConfigKey questTemplario jaColeteiOsItens
    exclusive 1
    QuestActive 3006, 3007, 3008
    NpcNotNear /Senior Crusader/
    call {
        do conf lockMap none
        do move prt_castle 45 169 &rand(2,5)
    }
}

#3006#Mudança de Classe: Templário#SG_FEEL#QUE_NOIMAGE#
#'Vou avaliar seu esforço e decidir se você está qualificado ou não. Você deve trazer ^3355FFBandagens Estragadas e Lampiões^000000' #
#10 Bandagens Estragadas e 10 Lampiões #
#3007#Mudança de Classe: Templário#SG_FEEL#QUE_NOIMAGE#
#'Vou avaliar seu esforço e decidir se você está qualificado ou não. Você deve trazer ^3355FFBandagens Estragadas e Lampiões^000000' #
#10 Bandagens Estragadas e 10 Lampiões #
#3008#Mudança de Classe: Templário#SG_FEEL#QUE_NOIMAGE#
#'Vou avaliar seu esforço e decidir se você está qualificado ou não. Você deve trazer ^3355FFBandagens Estragadas e Lampiões^000000' #
#10 Bandagens Estragadas e 10 Lampiões #
automacro virarTemplario_ColeteiTodosOsItens {
    InInventoryID 930 >= 10 #Bandagem Estragada
    InInventoryID 1041 >= 10 #Lampião
    ConfigKey questTemplario jaColeteiOsItens
    exclusive 1
    QuestActive 3006, 3007, 3008
    NpcNear /Senior Crusader/
    call {
        do talk $.NpcNearLastBinId
    }
}

#3009#Mudança de Classe: Templário#SG_FEEL#QUE_NOIMAGE#
#'Posso ver seu potencial como templário. Encontre-se com ^0000FFMoorenak Miyol^000000. Ele está na prisão subterrânea do Castelo de Prontera. Fale com ele primeiro.' #
##
automacro virarTemplario_comprarRosário {
    InInventoryID 2608 < 1 #Rosário
    IsNotEquippedID rightAccessory 2608 #Rosário
    QuestActive 3009
    Zeny > 16000  #tem q ter pelo menos 1k a mais pra não dar treta
    exclusive 1
    call {
        do move prt_church 108 124
        do talk &npc(/Madre/)
        do store
        do buy &store(2608) 1
    }
}

#3009#Mudança de Classe: Templário#SG_FEEL#QUE_NOIMAGE#
#'Posso ver seu potencial como templário. Encontre-se com ^0000FFMoorenak Miyol^000000. Ele está na prisão subterrânea do Castelo de Prontera. Fale com ele primeiro.' #
##
automacro virarTemplario_comprarRosário_jaComprado {
    InInventoryID 2608 = 1 #Rosário
    IsNotEquippedID rightAccessory 2608 #Rosário
    QuestActive 3009
    exclusive 1
    call {
        do eq rightAccessory &inventory(Rosário)
        do reload eventMacros
    }
}

#3009#Mudança de Classe: Templário#SG_FEEL#QUE_NOIMAGE#
#'Posso ver seu potencial como templário. Encontre-se com ^0000FFMoorenak Miyol^000000. Ele está na prisão subterrânea do Castelo de Prontera. Fale com ele primeiro.' #
##
automacro virarTemplario_ComprarHiper_poucoZeny {
    InInventoryID 14586 = 0 #Doce Hiper Açucarado
    ConfigKey BetterShopper_0 Doce Hiper Açucarado
    exclusive 1
    priority -3
    Zeny < 40000
    QuestActive 3009
    timeout 30
    call {
        [
        log ===================================
        log = Não tenho zeny Suficiente Pra
        log = Comprar hiper, melhor me dar zeny
        log ===================================
        ]
        do conf BetterShopper_on none
    }
}

#3009#Mudança de Classe: Templário#SG_FEEL#QUE_NOIMAGE#
#'Posso ver seu potencial como templário. Encontre-se com ^0000FFMoorenak Miyol^000000. Ele está na prisão subterrânea do Castelo de Prontera. Fale com ele primeiro.' #
##
automacro virarTemplario_ComprarHiper {
    InInventoryID 14586 = 0 #Doce Hiper Açucarado
    ConfigKeyNot BetterShopper_0 Doce Hiper Açucarado
    exclusive 1
    priority -3
    Zeny >= 40000
    QuestActive 3009
    call {
        do conf lockMap prontera
        do conf route_randomWalk 1
        do conf route_randomWalk_inTown 1
        call pararDeAtacar
        if (checarSeExisteNoConfig("BetterShopper_0") = nao) {
            adicionaBetterShopper()
            pause 1
            do reload config
        }
        do conf BetterShopper_0 Doce Hiper Açucarado
        do conf BetterShopper_0_maxPrice 60000
        do conf BetterShopper_0_maxAmount 1
        do conf BetterShopper_0_disabled 0
        do conf -f BetterShopper_on 1
    }
}


#3009#Mudança de Classe: Templário#SG_FEEL#QUE_NOIMAGE#
#'Posso ver seu potencial como templário. Encontre-se com ^0000FFMoorenak Miyol^000000. Ele está na prisão subterrânea do Castelo de Prontera. Fale com ele primeiro.' #
##
automacro virarTemplario_ComprarPotBranca {
    InInventoryID 504 = 0 #Poção Branca
    ConfigKeyNot BetterShopper_1 Poção Branca
    exclusive 1
    priority -2
    QuestActive 3009
    call {
        do conf lockMap prontera
        do conf route_randomWalk 1
        do conf route_randomWalk_inTown 1
        call pararDeAtacar
        if (checarSeExisteNoConfig("BetterShopper_1") = nao) {
            adicionaBetterShopper()
            pause 1
            do reload config
        }
        do conf BetterShopper_1 Poção Branca
        do conf BetterShopper_1_maxPrice 1100
        do conf BetterShopper_1_maxAmount 20
        do conf BetterShopper_1_disabled 0
        do conf -f BetterShopper_on 1
    }
}

#3009#Mudança de Classe: Templário#SG_FEEL#QUE_NOIMAGE#
#'Posso ver seu potencial como templário. Encontre-se com ^0000FFMoorenak Miyol^000000. Ele está na prisão subterrânea do Castelo de Prontera. Fale com ele primeiro.' #
##
automacro virarTemplario_ComparBalaDeGuaraná {
    InInventoryID 12414 = 0 #Bala de Guaraná
    QuestActive 3009
    exclusive 1
    priority -1
    ConfigKeyNot BetterShopper_2 Bala de Guaraná
    call {
        do conf lockMap prontera
        do conf route_randomWalk 1
        do conf route_randomWalk_inTown 1
        call pararDeAtacar
        if (checarSeExisteNoConfig("BetterShopper_2") = nao) {
            adicionaBetterShopper()
            pause 1
            do reload config
        }
        do conf BetterShopper_2 Bala de Guaraná
        do conf BetterShopper_2_maxPrice 1650
        do conf BetterShopper_2_maxAmount 2
        do conf BetterShopper_2_disabled 0
        do conf -f BetterShopper_on 1
    }
}

automacro virarTemplario_bugado {
    ConfigKey BetterShopper_on 1
    ConfigKeyNot route_randomWalk 1
    exclusive 1
    call {
        do conf route_randomWalk 1
    }
}

automacro virarTemplario_bugado2 {
    ConfigKey BetterShopper_on 1
    ConfigKeyNot route_randomWalk_inTown 1
    exclusive 1
    call {
        do conf route_randomWalk_inTown 1
    }
}

#3009#Mudança de Classe: Templário#SG_FEEL#QUE_NOIMAGE#
#'Posso ver seu potencial como templário. Encontre-se com ^0000FFMoorenak Miyol^000000. Ele está na prisão subterrânea do Castelo de Prontera. Fale com ele primeiro.' #
##
automacro virarTemplario_FalarComCaraNaPrisão_IndoAteEle {
    QuestActive 3009
    exclusive 1
    NpcNotNear /Man in Anguish/
    InInventoryID 14586 > 0 #Doce Hiper Açucarado
    InInventoryID 504 > 10 #Poção Branca
    IsEquippedID rightAccessory 2608 #Rosário
    call {
        do conf BetterShopper_on none
        do move prt_castle 164 32 &rand(4,7)
    }
}


#3009#Mudança de Classe: Templário#SG_FEEL#QUE_NOIMAGE#
#'Posso ver seu potencial como templário. Encontre-se com ^0000FFMoorenak Miyol^000000. Ele está na prisão subterrânea do Castelo de Prontera. Fale com ele primeiro.' #
##
#3010#Mudança de Classe: Templário#SG_FEEL#QUE_NOIMAGE#
#'Para um templário, a resistência e a paciência são muito importantes. Você só precisa atravessar o corredor até o final. Mas não mate um único monstro, mesmo que eles ataquem você.' #
##
automacro virarTemplario_FalarComCaraNaPrisão {
    QuestActive 3009, 3010
    exclusive 1
    InInventoryID 14586 > 0 #Doce Hiper Açucarado
    InInventoryID 504 > 10 #Poção Branca
    InInventoryID 12414 > 0 #Bala de Guaraná
    NpcNear /Man in Anguish/
    NotInMap job_cru
    IsEquippedID rightAccessory 2608 #Rosário
    call {
        # essa é a parte dificil que ele tem que passar pelos bixos
        # melhor comprar pot e guaraná
        
        do conf BetterShopper_on 0
        do conf BetterShopper_0_disabled 1
        do conf BetterShopper_1_disabled 1
        do conf BetterShopper_2_disabled 1
        do conf lockMap none
        call pararDeAtacarApenasCorrer
        $blocoJaExiste = checarSeExisteNoConfig("useSelf_item_1")
        if ($blocoJaExiste = nao) {
            adicionaUseSelfItem()
            pause 1
            do reload config
        }

        do conf useSelf_item_1 Poção Branca
        do conf useSelf_item_1_hp < 60%
        do talk $.NpcNearLastBinId
        do talk resp 0
    }
}

#3009#Mudança de Classe: Templário#SG_FEEL#QUE_NOIMAGE#
#'Posso ver seu potencial como templário. Encontre-se com ^0000FFMoorenak Miyol^000000. Ele está na prisão subterrânea do Castelo de Prontera. Fale com ele primeiro.' #
##
#3010#Mudança de Classe: Templário#SG_FEEL#QUE_NOIMAGE#
#'Para um templário, a resistência e a paciência são muito importantes. Você só precisa atravessar o corredor até o final. Mas não mate um único monstro, mesmo que eles ataquem você.' #
##
automacro virarTemplario_correr {
    QuestActive 3009, 3010
    InMap job_cru
    exclusive 1
    call {
        [
        do is &inventory(12414) #Bala de Guaraná
        do is &inventory(14586) #Doce Hiper Açucarado
        ]
        do move 98 102
        if ($.map = prt_castle) {
            do talk &npc(164 32)
        } elsif ($.map = job_cru) {
            do move 98 102
        } else {
            log acho que morri...
            log muita treta vixi
        }
    }
}

#3010#Mudança de Classe: Templário#SG_FEEL#QUE_NOIMAGE#
#'Para um templário, a resistência e a paciência são muito importantes. Você só precisa atravessar o corredor até o final. Mas não mate um único monstro, mesmo que eles ataquem você.' #
##
automacro virarTemplario_correr_morri_indoTentarDenovo_npcLonge {
    QuestActive 3010
    NotInMap job_cru
    exclusive 1
    NpcNotNear /Man in Anguish/
    InInventoryID 14586 > 0 #Doce Hiper Açucarado
    InInventoryID 504 > 10 #Poção Branca
    InInventoryID 12414 > 0 #Bala de Guaraná
    call {
        do move prt_castle 164 32 &rand(4,7)
    }
}

#3010#Mudança de Classe: Templário#SG_FEEL#QUE_NOIMAGE#
#'Para um templário, a resistência e a paciência são muito importantes. Você só precisa atravessar o corredor até o final. Mas não mate um único monstro, mesmo que eles ataquem você.' #
##
automacro virarTemplario_correr_morri_indoTentarDenovo {
    QuestActive 3010
    NotInMap job_cru
    exclusive 1
    NpcNear /Man in Anguish/
    InInventoryID 14586 > 0 #Doce Hiper Açucarado
    InInventoryID 504 > 10 #Poção Branca
    InInventoryID 12414 > 0 #Bala de Guaraná
    call {
        log morri no labirinto
        log vamos tentar denovo!
        # essa é a parte dificil que ele tem que passar pelos bixos
        # melhor comprar pot e guaraná
        
        do conf BetterShopper_on 0
        do conf BetterShopper_0_disabled 1
        do conf BetterShopper_1_disabled 1
        do conf BetterShopper_2_disabled 1
        do conf lockMap none
        call pararDeAtacarApenasCorrer
        $blocoJaExiste = checarSeExisteNoConfig("useSelf_item_1")
        if ($blocoJaExiste = nao) {
            adicionaUseSelfItem()
            pause 1
            do reload config
        }

        do conf useSelf_item_1 Poção Branca
        do conf useSelf_item_1_hp < 60%
        do talk $.NpcNearLastBinId
        do talk resp 0
    }
}

#3011#Mudança de Classe: Templário#SG_FEEL#QUE_NOIMAGE#
#'Encontre Gabriela Valentine no Santuário de Prontera. Ela vai lhe dar o próximo teste... Pode ir agora.' #
##
automacro virarTemplario_questionario_indoFalarComNpc {
    QuestActive 3011
    NpcNotNear /Crusader/
    exclusive 1
    call {
        do move prt_church 95 127 &rand(2,6)
    }
}

#3011#Mudança de Classe: Templário#SG_FEEL#QUE_NOIMAGE#
#'Encontre Gabriela Valentine no Santuário de Prontera. Ela vai lhe dar o próximo teste... Pode ir agora.' #
##
#3012#Mudança de Classe: Templário#SG_FEEL#QUE_NOIMAGE#
#'Você precisa ter conhecimento suficiente para assumir a classe. Desculpe, mas acho que você precisa estudar mais. Volte quando estiver pronto.' #
##
automacro virarTemplario_questionario {
    QuestActive 3011, 3012
    NpcNear /Crusader/
    exclusive 1
    macro_delay 3
    call {
        [
        log ===============================================================
        log = pra vc q ta lendo isso
        log = provavelmente vai dar uns erros bem loko aqui
        log = se isso acontecer, só esperar, é porque as respostas não estão 100%
        log = e sempre mudam
        log = então só espere e observe
        log ==================================================================
        ]
        
        do talk resp 4
        do talk $.NpcNearLastBinId
        do talk resp /abençoado|3|ísis|sagrado/i #1
        do talk resp /50|440|cruzada/i #2
        do talk resp /monge|21|dourado/i #3
        do talk resp /prisioneiro|zéfiro|Marionete/i #4
        do talk resp /drake|2|Ghostring|marionete/i #5
        do talk resp /zumbi|80|Inferno/i #6
        do talk resp /meio|aprender|terra/i #7
        do talk resp /esqueleto|31|cochicho/i #8
        do talk resp /escudo|maldição|fantasma/i #9
        do talk resp /munak|guerra|benta/i #10
    }
}

#3013#Mudança de Classe: Templário#SG_FEEL#QUE_NOIMAGE#
#'Muito bom. Pode prestar o próximo exame agora. Vá ao Castelo de Prontera e encontre Bliant Piyord. Vou dizer a ele para preparar o próximo teste.' #
##
automacro virarTemplario_Matarbixo_ComprarAgua {
    QuestActive 3013
    exclusive 1
    InInventoryID 523 = 0 #água benta, quando não tiver
    ConfigKeyNot BetterShopper_0 Água Benta
    call {
        $configExiste = checarSeExisteNoConfig("BetterShopper_0")
        if ($configExiste = nao) {
            adicionaBetterShopper()
            pause 1
            do reload config
        }
        do conf lockMap prontera
        do conf route_randomWalk 1
        do conf route_randomWalk_inTown 1
        do conf BetterShopper_0 Água Benta
        do conf BetterShopper_0_maxAmount 2
        do conf BetterShopper_0_maxPrice 2000
        do conf BetterShopper_0_disabled 0
        do conf BetterShopper_on 1
    }
}

#3013#Mudança de Classe: Templário#SG_FEEL#QUE_NOIMAGE#
#'Muito bom. Pode prestar o próximo exame agora. Vá ao Castelo de Prontera e encontre Bliant Piyord. Vou dizer a ele para preparar o próximo teste.' #
##
#3014#Mudança de Classe: Templário#SG_FEEL#QUE_NOIMAGE#
#'Este é o último teste que você precisa prestar. É um teste de combate. Somente pessoas com boas habilidades de batalha servem para se tornar Templários. Traga 1 Água Benta antes de prestar o teste de combate.' #
#1 Água Benta #
automacro virarTemplario_Matarbixo_irAteNpc {
    QuestActive 3013, 3014
    InInventoryID 523 >= 1 #água benta, quando tiver 1 ou mais
    exclusive 1
    NotInMap job_cru
    NpcNotNear /Patron/
    call {
        do conf BetterShopper_on none
        do move prt_castle 35 151 &rand(2,5)
    }
}

#3013#Mudança de Classe: Templário#SG_FEEL#QUE_NOIMAGE#
#'Muito bom. Pode prestar o próximo exame agora. Vá ao Castelo de Prontera e encontre Bliant Piyord. Vou dizer a ele para preparar o próximo teste.' #
##
#3014#Mudança de Classe: Templário#SG_FEEL#QUE_NOIMAGE#
#'Este é o último teste que você precisa prestar. É um teste de combate. Somente pessoas com boas habilidades de batalha servem para se tornar Templários. Traga 1 Água Benta antes de prestar o teste de combate.' #
#1 Água Benta #
automacro virarTemplario_Matarbixo {
    QuestActive 3013, 3014
    InInventoryID 523 >= 1 #água benta, quando tiver 1 ou mais
    IsEquippedID rightAccessory 2608 #Rosário
    exclusive 1
    NpcNear /Patron/
    call {
        do talk $.NpcNearLastBinId
        do talk resp 0
    }
}

automacro virarTemplario_manterRosarioSempreEquipado {
    JobID $parametrosClasses{idC1}, $parametrosClasses{idBC1}
    JobLevel = 50
    exclusive 1
    timeout 120
    InInventoryID 2608 >= 1 #Rosário
    IsNotEquippedID rightAccessory 2608 #Rosário
    call {
        do eq rightAccessory &inventory(2608)
    }
}

#3014#Mudança de Classe: Templário#SG_FEEL#QUE_NOIMAGE#
#'Este é o último teste que você precisa prestar. É um teste de combate. Somente pessoas com boas habilidades de batalha servem para se tornar Templários. Traga 1 Água Benta antes de prestar o teste de combate.' #
#1 Água Benta #
automacro virarTemplario_matarBixos_dentroDoMapa_irNoChat {
    InMap job_cru
    QuestActive 3014
    exclusive 1
    ConfigKeyNot questTemplario entreiNoChat
    call {
        [
        log ===================================
        log = estou no mapa , tenho que falar com o npc
        log = e entrar no chat
        log ===================================
        ]
        do north
        do north
        do north
    }
}

#3014#Mudança de Classe: Templário#SG_FEEL#QUE_NOIMAGE#
#'Este é o último teste que você precisa prestar. É um teste de combate. Somente pessoas com boas habilidades de batalha servem para se tornar Templários. Traga 1 Água Benta antes de prestar o teste de combate.' #
#1 Água Benta #
automacro virarTemplario_matarBixos_dentroDoMapa {
    ChatRoomNear /Waiting|Espera/
    exclusive 1
    InMap job_cru
    QuestActive 3014
    priority -5
    ConfigKeyNot questTemplario entreiNoChat
    call {
        do chat join 0
        [
        log ===================================
        log = entrei no chat, devo ir agora matar os bixos
        log ===================================
        ]
        do conf -f questTemplario entreiNoChat
    }
}

#3014#Mudança de Classe: Templário#SG_FEEL#QUE_NOIMAGE#
#'Este é o último teste que você precisa prestar. É um teste de combate. Somente pessoas com boas habilidades de batalha servem para se tornar Templários. Traga 1 Água Benta antes de prestar o teste de combate.' #
#1 Água Benta #
automacro virarTemplario_matarBixos_dentroDoMapa_correr {
    IsInCoordinate 160..175 15..180
    ConfigKey questTemplario entreiNoChat
    InMap job_cru
    QuestActive 3014
    ConfigKeyNot lockMap job_cru
    exclusive 1
    call {
        do conf lockMap job_cru
        do conf lockMap_x 167
        do conf lockMap_y 178
        call voltarAtacar
    }
}

#3014#Mudança de Classe: Templário#SG_FEEL#QUE_NOIMAGE#
#'Este é o último teste que você precisa prestar. É um teste de combate. Somente pessoas com boas habilidades de batalha servem para se tornar Templários. Traga 1 Água Benta antes de prestar o teste de combate.' #
#1 Água Benta #
automacro virarTemplario_matarbixs_falhei {
    NotInMap job_cru
    QuestActive 3014
    ConfigKey questTemplario entreiNoChat
    exclusive 1
    call {
        [
        log ===================================
        log = falhei em matar os monstros...
        log = vou comprar agua benta e começar denovo
        log ===================================
        ]
        do conf lockMap none
        do conf lockMap_x none
        do conf lockMap_y none
        do conf questTemplario none
    }
}

#3015#Mudança de Classe: Templário#SG_FEEL#QUE_NOIMAGE#
#'Parabéns! Você passou em todos os testes. Fale com nosso líder lá dentro. Você é um dos escolhidos para a Guerra Santa.' #
##
automacro virarTemplario_final_irAteNpc {
    QuestActive 3015
    exclusive 1
    NotInMap job_cru
    JobID $parametrosClasses{idC1}, $parametrosClasses{idBC1}
    NpcNotNear /Senior Crusader/
    call {
        do conf lockMap none
        do conf lockMap_x none
        do conf lockMap_y none
        do conf questTemplario none
        do move prt_castle 45 169 &rand(2,5)
    }
}

#3015#Mudança de Classe: Templário#SG_FEEL#QUE_NOIMAGE#
#'Parabéns! Você passou em todos os testes. Fale com nosso líder lá dentro. Você é um dos escolhidos para a Guerra Santa.' #
##
automacro virarTemplario_termineiDeMatar {
    QuestActive 3015
    exclusive 1
    InMap job_cru
    JobID $parametrosClasses{idC1}, $parametrosClasses{idBC1}
    call {
        do move job_cru 167 178
    }
}

#3015#Mudança de Classe: Templário#SG_FEEL#QUE_NOIMAGE#
#'Parabéns! Você passou em todos os testes. Fale com nosso líder lá dentro. Você é um dos escolhidos para a Guerra Santa.' #
##
automacro virarTemplario_final {
    QuestActive 3015
    exclusive 1
    NotInMap job_cru
    JobID $parametrosClasses{idC1}, $parametrosClasses{idBC1}
    NpcNear /Senior Crusader/
    call {
        do talk $.NpcNearLastBinId
    }
}

#questionario
#r1 = abençoado
#r2 = 50%
#r3 = chapéu de monge
#r4 = zumbi prisioneiro
#r5 = Drake
#r6 = orc zumbi
#r7 = meio-irmão e irmã
#r8 = esqueleto
#r9 = amuleto escudo
#r10 = munak
#
#r1 = 3
#r2 = 440
#r3 = 21
#r4 = Zéfiro
#r5 = 2
#r6 = 80% da velocidade
#r7 = Somente Noviços podem aprender
#r8 = 31
#r9 = Maldição
#r10 = Uma pessoa se preparando para a Guerra
#
#r1 = ísis
#r2 = Tsurugi Sagrada
#r3 = Martelo Dourado
#r4 = Marionete
#r5 = Ghostring
#r6 = Escudo do Inferno
#r7 = Terra
#r8 = Cochicho
#r9 = fantasma
#r10 = Jogar Água Benta
#Deu certo, finalmente

#Referencias pra quest de classe 2

#Templario
#NPC'S
#Senior Crusader prt_castle 45 169
#Man in Anguish prt_castle 164 32
#Crusader prt_church 95 127
#Bliant Piyord prt_castle 35 151

#lugar pra pegar os 10 Lampião:
#mjo_dun02 (lento mas morre menos na teoria)
#mjo_dun03 (rápido mas morre mais teoricamente)
#
#lugar pra pegar as 10 Bandagem Estragada
#moc_pryd03 (melhor, mas mesmo assim é bem dificil , o ideral seria ter pots)

#Agua Benta só é obtivel por meio de lojinha de players, então é necessario o uso do plugin better shopper
#Precisa tambem de bala de guraná com certeza
#e precisa habilitar vigor dentro daquele mapa
#e precisa de Rosário, que pode ser comprado em: prt_church 108 124 (npc Madre) ,custo: 15k
# o ideal é comprar pot branca que cura mais! assim tem menos chance de morrer porque vai ter que usar menos vezes a pot

#npc matar tudo : Patron kinght 35 151 talk resp 0 (Tem um typo no nome dele, é intencional, a lug errou)
#precisa de 10 pots no máximo (provavelmente bem menos)
#job_cru Patron kinght

