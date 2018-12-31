#####################################################################################################################################
#                                                                                                                                   #
#                                                            [Capítulo VI]                                                          #
#                                                            - Bioética -                                                           #
#                                                              [Parte I]                                                            #
#                                                 - Juntando zenys caso eu não tenha -                                              #
#                                                                                                                                   #
#####################################################################################################################################

automacro questBioetica_naotenhoZenyNemPraComecar {
    JobID 18 #Alquimista
    NotInMap lighthalzen
    NotInMap lhz_in01
    NotInMap lhz_in02
    NotInMap lhz_in03
    Zeny < 25000
    ConfigKeyNot lockMap pay_fild09
    SkillLevel AM_BIOETHICS != 1
    exclusive 1
    timeout 30
    call {
        [
        log ===============================================
        log = Teríamos que começar a quest bioetica agora =
        log =      Mas não temos Zeny suficinte pra isso  =
        log =            vamos conseguir então!           =
        log ===============================================
        ]
        do autosell
        do iconf 690 0 0 1 #Lanças de Fogo Nível 3
        do iconf 757 0 0 1 #Minério de Elunium
        do iconf 907 0 0 1 #Resina
        do iconf 947 0 0 1 #Chifre
        do iconf 914 0 0 1 #Felpa
        do iconf 919 0 0 1 #Couro de Animal
        do iconf 943 0 0 1 ##Casca Rija
        do iconf 935 0 0 1 #Casca
        do iconf 1011 0 0 1 #Emveretarcon
        do iconf 2329 0 0 1 #Armadura de Madeira
        do iconf 1026 0 0 1 #Avelã
        do iconf 2502 0 0 1 #Capuz [1]
        do iconf 2402 0 0 1 #Sandálias [1]
        do conf -f quest_skill true
        do conf -f passoQuestBioetica começo
        call voltarAtacar
        call salvarNaCidade payon
        do conf lockMap pay_fild09
    }
}

automacro questBioetica_juntandoZenyPraComecar {
    ConfigKey quest_skill true
    ConfigKey passoQuestBioetica começo
    exclusive 1
    ConfigKey lockMap pay_fild09
    ConfigKey saveMap payon
    timeout 180
    call {
        [
        log ======================================
        log =Estou coletando itens pra fazer zeny
        log =Para Quest de Bioética
        log ======================================
        ]
        do conf -f quest_skill true
        do conf -f passoQuestBioetica começo
        if (&config(attackAuto) != 2) call voltarAtacar
        if (&config(itemsTakeAuto) != 2) do conf itemsTakeAuto 2
        if (&config(itemsGatherAuto) != 2) do conf itemsGatherAuto 2
        if (&config(itemsMaxWeight_sellOrStore) != 30) do conf itemsMaxWeight_sellOrStore 30
    }
}

#####################################################################################################################################
#                                                                                                                                    #
#                                                                 [Capítulo VI]                                                        #
#                                                                    - Bioética -                                                        #
#                                                                    [Parte II]                                                        #
#                                                           - Começando a Quest de Bióetica -                                            #
#                                                                                                                                    #
#####################################################################################################################################

automacro estouFazendoQuestBioetica {
    ConfigKeyNot quest_skill true #vai ativar se não for true... tem que ser true!
    exclusive 1
    JobID 18 #Alquimista
    SkillLevel AM_BIOETHICS != 1
    call {
        do conf -f quest_skill true
    }
}

automacro lockMapAtivado_temQueDesativar {
    ConfigKeyNot lockMap none
    exclusive 1
    ConfigKey quest_skill true
    call {
        do conf lockMap none
    }
}

automacro desabilitandoAutoBuy {
    ConfigKey quest_skill true
    ConfigKeyNot buyAuto_1_disabled 1
    exclusive 1
    call {
        $blocoExiste = checarSeExisteNoConfig("buyAuto_1")
        if ( $blocoExiste = nao ) {
            log não existe o bloco de autoBuy
            log interrompendo essa macro
            lock desabilitandoAutoBuy
        } else {
            do conf buyAuto_1_disabled 1
        }
    }
}
#####################################################################################################################################
#                                                                                                                                    #
#                                                                 [Capítulo VI]                                                        #
#                                                                    - Bioética -                                                        #
#                                                                   [Parte III]                                                        #
#                                                               - Indo para Lighthalzen -                                                #
#                                                                                                                                    #
#####################################################################################################################################

automacro estouFazendoQuestBioetica_masNaoToEmLighthalzen {
    ConfigKey quest_skill true
    ConfigKey passoQuestBioetica none
    JobID 18 #Alquimista
    NotInMap lighthalzen
    NotInMap lhz_in01
    NotInMap lhz_in02
    NotInMap lhz_in03
    exclusive 1
    call {
        do conf -f passoQuestBioetica começo
    }
}

automacro questBioetica_comeco_IndoPraLighthalzen {
    Zeny >= 25000
    CheckOnAI auto,manual
    SkillLevel AM_BIOETHICS != 1
    ConfigKey passoQuestBioetica começo
    NotInMap lighthalzen
    NotInMap lhz_in01
    NotInMap lhz_in02
    NotInMap lhz_in03
    exclusive 1
    timeout 300
    call {
        do conf -f quest_skill true
        call aeroplano_junoPara "lighthalzen"
    }
}
  
automacro estouEmLighthalzen {
    JobID 18 #Alquimista
    InMap lighthalzen
    SkillLevel AM_BIOETHICS != 1
    exclusive 1
    ConfigKey passoQuestBioetica começo
    call {
        do conf -f quest_skill true
        do conf -f passoQuestBioetica comprarBigodeEOculos
    }
}

#####################################################################################################################################
#                                                                                                                                    #
#                                                                 [Capítulo VI]                                                        #
#                                                                    - Bioética -                                                        #
#                                                                   [Parte IV]                                                        #
#                                                      - Comprando Bigode Grisalho e Quatro-Olhos -                                    #
#                                                                                                                                    #
#####################################################################################################################################

automacro questBioetica_ComprandoQuatro-Olhos {
    JobID 18 #Alquimista
    InMap lighthalzen,lhz_in02
    Zeny >= 20000
    exclusive 1
    ConfigKey passoQuestBioetica comprarBigodeEOculos
    InInventoryID 2243 < 1 #Quatro-Olhos
    IsNotEquippedID midHead 2243 #Quatro-Olhos
    SkillLevel AM_BIOETHICS != 1
    call comprarItem "lhz_in02" "87 213" "ulos" "Quatro-Olhos" "1"
}

automacro questBioetica_ComprandoBigode {
    JobID 18 #Alquimista
    InMap lighthalzen,lhz_in02
    Zeny >= 5000
    exclusive 1
    ConfigKey passoQuestBioetica comprarBigodeEOculos
    InInventoryID 2243 = 1 #só compra o bigode depois de comprar o óculus
    InInventoryID 2241 < 1 #Bigode Grisalho
    IsNotEquippedID lowHead 2241 #Bigode Grisalho
    SkillLevel AM_BIOETHICS != 1
    call comprarItem "lhz_in02" "87 213" "ulos" "Bigode Grisalho" "1"
}

#####################################################################################################################################
#                                                                                                                                    #
#                                                                 [Capítulo VI]                                                        #
#                                                                    - Bioética -                                                        #
#                                                                    [Parte V]                                                        #
#                                                      - Equipando Bigode Grisalho e Quatro-Olhos -                                    #
#                                                                                                                                    #
#####################################################################################################################################

automacro questBioetica_EquipandoBigodeGrisalhoEQuatro-Olhos {
    exclusive 1
    InInventoryID 2243 > 0 #Quatro-Olhos
    InInventoryID 2241 > 0 #Bigode Grisalho
    ConfigKey passoQuestBioetica comprarBigodeEOculos
    IsNotEquippedID midHead 2243, lowHead 2241 #Quatro-Olhos & Bigode Grisalho
    call {
        $check = pegarIndiceDoEquipamentoPeloId("midHead", 2243) #Quatro-Olhos
        if ($check != -1) do eq $check
        $check = pegarIndiceDoEquipamentoPeloId("lowHead", 2241) #Bigode Grisalho
        if ($check != -1) do eq $check
    }
}

automacro questBioEtica_BigodeEOculosEquipado {
    IsEquippedID midHead 2243 #Quatro-Olhos
    IsEquippedID lowHead 2241 #Bigode Grisalho
    ConfigKey passoQuestBioetica comprarBigodeEOculos
    exclusive 1
    call {
        do conf -f tenhoQueFalarComGuarda sim
        do conf -f passoQuestBioetica falarComKellasus
    }
}

#####################################################################################################################################
#                                                                                                                                    #
#                                                                 [Capítulo VI]                                                        #
#                                                                    - Bioética -                                                        #
#                                                                    [Parte VI]                                                        #
#                                              - Indo atrás do Guarda da Rekenber & Falando com ele  -                                    #
#                                                                                                                                    #
#####################################################################################################################################

automacro FalarComGuardaRekenber {
    JobID 18 #Alquimista
    ConfigKey tenhoQueFalarComGuarda sim
    ConfigKey quest_skill true
    ConfigKeyNot passoQuestBioetica none
    IsEquippedID midHead 2243 #Quatro-Olhos
    IsEquippedID lowHead 2241 #Bigode Grisalho
    SkillLevel AM_BIOETHICS != 1
    exclusive 1
    call {
        #essa macro só se ativa dentro da quest bioetica,
        #serve pra conversar com o guarda rekenber
        do move lhz_in01 &rand(34,36) &rand(224,226)
        do talk &npc(/Rekenber/)
    }
}

automacro FalComGuardaRekenber {
    JobID 18 #Alquimista
    ConfigKeyNot passoQuestBioetica none
    ConfigKey quest_skill true
    IsInMapAndCoordinate lhz_in01 37 225
    priority -5 #alta
    exclusive 1
    call {
        do conf -f tenhoQueFalarComGuarda none
        do move 0
    }
}

#####################################################################################################################################
#                                                                                                                                    #
#                                                                 [Capítulo VI]                                                        #
#                                                                    - Bioética -                                                        #
#                                                                   [Parte VII]                                                        #
#                                              - Indo atrás de Kellasus & Falando com ele pela primeira vez  -                            #
#                                                                                                                                    #
#####################################################################################################################################

automacro guardinhaAleatorioIrritante {
    NpcMsg /\.{7}/
    exclusive 1
    call {
        do talk resp 0
        do reload event
    }
}

automacro questBioetica_FirstKellasus {
    JobID 18 #Alquimista
    timeout 130
    ConfigKeyNot tenhoQueFalarComGuarda sim
    ConfigKey passoQuestBioetica falarComKellasus
    call {
        do move lhz_in01 &rand(222,224) &rand(139,141)
        [
        log =======================
        log vou falar 3 vezes ate ele
        log me dizer oq eu quero
        log =======================
        ]
        do talk &npc (/Kellasus/)
        do talk &npc (/Kellasus/)
        do talk &npc (/Kellasus/)
        do talk &npc (/Kellasus/)
    }
}

automacro questBioetica_irriteiKellasus {
    NpcMsg /algum conselho se você estiver|me recuso a ensinar qualquer coisa/
    ConfigKey passoQuestBioetica falarComKellasus
    exclusive 1
    call {
        do talk resp 0 #Kellasus
        do conf -f passoQuestBioetica Skrajjad
    }
}

#####################################################################################################################################
#                                                                                                                                    #
#                                                                 [Capítulo VI]                                                        #
#                                                                    - Bioética -                                                        #
#                                                                   [Parte VIII]                                                        #
#                                                      - Indo atrás de Skrajjad & Falando com ele   -                                    #
#                                                                                                                                    #
#####################################################################################################################################

automacro questBioetica_Skrajjad {
    JobID 18 #Alquimista
    timeout 20
    ConfigKey passoQuestBioetica Skrajjad
    call {
        do move lhz_in01 &rand(223,225) &rand(121,123)
        do talk &npc (/Skrajjad/)
    }
}

automacro questBioetica_jaFaleiComSkrajjad {
    JobID 18 #Alquimista
    exclusive 1
    ConfigKey passoQuestBioetica Skrajjad
    NpcMsgName /espero que encontre as respostas|visite Keshibien/ /Skrajj/
    call {
        do conf -f passoQuestBioetica keshibien
    }
}

#####################################################################################################################################
#                                                                                                                                    #
#                                                                 [Capítulo VI]                                                        #
#                                                                    - Bioética -                                                        #
#                                                                    [Parte IX]                                                        #
#                                                      - Indo atrás de Keshibien & Falando com ele   -                                    #
#                                                                                                                                    #
#####################################################################################################################################

automacro questBioetica_Keshibien {
    JobID 18 #Alquimista
    timeout 20
    ConfigKey passoQuestBioetica keshibien
    call {
        do move lhz_in01 &rand(203,205) &rand(136,138)
        do talk &npc (/Keshibien/)
    }
}

automacro questBioetica_jaFaleiComKeshibiem {
    ConfigKey passoQuestBioetica keshibien
    exclusive 1
    NpcMsg /ocê ainda tem que convencer Kellasus|em algum lugar onde sirvam/
    call {
        do conf -f passoQuestBioetica broncher
    }
}

#####################################################################################################################################
#                                                                                                                                    #
#                                                                 [Capítulo VI]                                                        #
#                                                                    - Bioética -                                                        #
#                                                                    [Parte X]                                                        #
#                                                      - Indo atrás de Broncher & Falando com ele   -                                    #
#                                                                                                                                    #
#####################################################################################################################################

automacro questBioetica_Broncher {
    JobID 18 #Alquimista
    timeout 30
    ConfigKey passoQuestBioetica broncher
    call {
        do move lhz_in02 &rand(277,279) &rand(273,275)
        do talk &npc (/Broncher/)
    }
}

automacro questBioetica_jaFaleiComBroncher {
    JobID 18 #Alquimista
    exclusive 1
    ConfigKey passoQuestBioetica broncher
    NpcMsgName /tenho muito no que...|Vai, dá o fora daqui/ /Bronche/
    call {
        do conf -f tenhoQueFalarComGuarda sim
        do conf -f passoQuestBioetica falarComKellasusDenovo
    }
}

#####################################################################################################################################
#                                                                                                                                    #
#                                                                 [Capítulo VI]                                                        #
#                                                                    - Bioética -                                                        #
#                                                                   [Parte XI]                                                        #
#                                          - Indo atrás de Kellasus & Falando com ele pela segunda vez   -                                #
#                                                                                                                                    #
#####################################################################################################################################

automacro questBioetica_KellasusDenovo {
    JobID 18 #Alquimista
    timeout 30
    ConfigKeyNot tenhoQueFalarComGuarda sim #só ativa depois que ja tiver falado com o guardinha
    ConfigKey passoQuestBioetica falarComKellasusDenovo
    call {
        do move lhz_in01 &rand(222,224) &rand(139,141)
        do talk &npc (/Kellasus/)
        do talk text Vaporizar
        do talk text Embrião
        do talk text Ressurreição\ de\ Homunculus
    }
}

automacro questBioetica_jaFaleiComKellasusDenovo {
    ConfigKey passoQuestBioetica falarComKellasusDenovo
    NpcMsg /surja da existência de|fazer isso de consciência tranquila/
    exclusive 1
    call {
        do conf -f passoQuestBioetica falarComKoring
    }
}

#####################################################################################################################################
#                                                                                                                                    #
#                                                                 [Capítulo VI]                                                        #
#                                                                    - Bioética -                                                        #
#                                                                   [Parte XII]                                                        #
#                                                      - Indo atrás de Koring & Falando com ele   -                                    #
#                                                                                                                                    #
#####################################################################################################################################

automacro questBioetica_Koring {
    JobID 18 #Alquimista
    timeout 30
    ConfigKey passoQuestBioetica falarComKoring
    call {
        do move lhz_in03 &rand(105,107) &rand(32,34)
        do talk &npc (/Koring/)
    }
}

automacro questBioetica_jaFaleiComKoring {
    JobID 18 #Alquimista
    exclusive 1
    ConfigKey passoQuestBioetica falarComKoring
    NpcMsgName /papai ainda é o melhor/ /Koring/
    call {
        do conf -f passoQuestBioetica falarComBeninne
    }
}

#####################################################################################################################################
#                                                                                                                                    #
#                                                                 [Capítulo VI]                                                        #
#                                                                    - Bioética -                                                        #
#                                                                   [Parte XIII]                                                        #
#                                                      - Indo atrás de Beninne & Falando com ela   -                                    #
#                                                                                                                                    #
#####################################################################################################################################

automacro questBioetica_Beninne {
    JobID 18 #Alquimista
    timeout 20
    ConfigKey passoQuestBioetica falarComBeninne
    call {
        do move lhz_in03 &rand(108,110) &rand(30,32)
        do talk &npc (/Beninne/)
    }
}

automacro questBiotica_Beninne {
    JobID 18 #Alquimista
    exclusive 1
    ConfigKey passoQuestBioetica falarComBeninne
    NpcMsgName /mas ama ainda mais sua família/ /Beninne/
    call {
        do conf -f tenhoQueFalarComGuarda sim
        do conf -f passoQuestBioetica falarComKellasusFinal
    }
}

#####################################################################################################################################
#                                                                                                                                    #
#                                                                 [Capítulo VI]                                                        #
#                                                                    - Bioética -                                                        #
#                                                                   [Parte XIV]                                                        #
#                                      - Indo atrás de Kellasus & Falando com ele pela terceira e última vez   -                        #
#                                                                                                                                    #
#####################################################################################################################################

automacro questBioetica_ThirdKellasus {
    JobID 18 #Alquimista
    timeout 40
    ConfigKeyNot tenhoQueFalarComGuarda sim
    SkillLevel AM_BIOETHICS != 1
    ConfigKey passoQuestBioetica falarComKellasusFinal
    macro_delay 2
    call {
        do move lhz_in01 &rand(222,224) &rand(139,141)
        do talk &npc (/Kellasus/)
        do talk &npc (/Kellasus/)
        do talk &npc (/Kellasus/)
        do talk &npc (/Kellasus/)
    }
}

#####################################################################################################################################
#                                                                                                                                    #
#                                                                 [Capítulo VI]                                                        #
#                                                                    - Bioética -                                                        #
#                                                                   [Parte XV]                                                        #
#                                                  - Consegui a Habilidade! Indo embora de Lighthalzen     -                            #
#                                                                                                                                    #
#####################################################################################################################################

automacro jaTenhoASkill {
    JobID 18 #Alquimista
    SkillLevel AM_BIOETHICS = 1
    ConfigKeyNot passoQuestBioetica none
    exclusive 1
    call {
        do conf -f passoQuestBioetica none
        do conf -f quest_skill none
    }
}

automacro jaTenhoASkill_2 {
    JobID 18 #Alquimista
    SkillLevel AM_BIOETHICS = 1
    ConfigKeyNot quest_skill none
    exclusive 1
    call {
        do conf -f passoQuestBioetica none
        do conf -f quest_skill none
    }
}

automacro voltandoPraJuno {
    JobID 18 #Alquimista
    SkillLevel AM_BIOETHICS = 1
    InMap lighthalzen, lhz_in01, lhz_in02
    ConfigKey quest_skill none
    ConfigKey passoQuestBioetica none
    exclusive 1
    timeout 300
    call {
        
        if (( &invamount(602) > 0 || &invamount(12324) > 0 ) && &config(saveMap) != lighthalzen) {
            do respawn
        } else {
            call lhzpra "yuno"
        }
    }
}

