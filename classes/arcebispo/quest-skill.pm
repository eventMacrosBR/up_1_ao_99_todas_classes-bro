automacro questLuzDivina_configurandoItens {
    JobID $parametrosClasses{idC1}, $parametrosClasses{idC2}
    SkillLevel AL_HOLYLIGHT != 1
    run-once 1
    exclusive 1
    call {
        do iconf 727 1 1 0 #Opala
        do iconf 991 1 1 0 #Cristal Azul
        do iconf 2608 1 1 0 #Rosário
    }
}

automacro questLuzDivina_inicioTenhoOsItens {
    JobID $parametrosClasses{idC1}, $parametrosClasses{idC2}
    SkillLevel AL_HOLYLIGHT != 1
    JobLevel >= 30
    ConfigKeyNot quest_eden em_curso
    ConfigKeyNot quest_eden terminando
    ConfigKeyNot naSequenciaDeSalvamento true
    ConfigKeyNot virarClasse2 true
    InInventoryID 727 > 0
    InInventoryID 991 > 0
    InInventoryID 2608 > 0
    exclusive 1
    call {
        if (&invamount(Opala) > 0 && &invamount(Cristal Azul) > 0 && &invamount(Rosário) > 0) {
            [
            log ===================================
            log = Iniciando a quest da Luz Divina
            log = Tenho os itens.
            log ===================================
            ]
            call pararDeAtacar
            do move prontera
            do conf -f quest_skill true
            do conf -f quest_luz_divina falar_com_npc
        } else {
            log pequeno bug, ignorando
        }
    }
}

automacro questLuzDivina_inicioNaoTenhoOsItensMasTenhoZenys {
    JobID $parametrosClasses{idC1}, $parametrosClasses{idC2}
    SkillLevel AL_HOLYLIGHT != 1
    JobLevel >= 30
    ConfigKeyNot quest_eden em_curso
    ConfigKeyNot quest_eden terminando
    ConfigKeyNot naSequenciaDeSalvamento true
    ConfigKeyNot virarClasse2 true
    ConfigKeyNot quest_skill true
    ConfigKeyNot quest_luz_divina falar_com_npc
    Zeny >= 36000
    exclusive 1
    call { 
        [
        log ===================================
        log = Iniciando a quest da Luz Divina =
        log = Não tenho os itens, vou comprar =
        log ===================================
        ]
        call pararDeAtacar
        do move prontera
        do conf -f quest_skill true
        do conf -f quest_luz_divina comprar_itens
    }
}

automacro questLuzDivina_comprarRosario {
    ConfigKey quest_skill true
    ConfigKey quest_luz_divina comprar_itens
    InInventoryID 2608 < 1
    SkillLevel AL_HOLYLIGHT != 1
    Zeny >= 16000
    timeout 120
    exclusive 1
    priority -1
    call {
        call pararDeAtacar
        $tenhoRosario = nao
        $tenhoOpala = nao
        $tenhoCristal = nao
        
        if (&invamount (2608)  < 1 ) { #Rosário
            do move prt_church 108 124
            do talk &npc(/Madre/)
            do store
            do buy &store(2608) 1
        } else {
            log Já tenho Rosário, indo comprar Opala
            $tenhoRosario = sim
        }
        
        if (&invamount(Opala) < 1) {
            if (&config(BetterShopper_0) != Opala) {
                [
                log ===================================
                log = Configurando pra comprar Opala
                log ===================================
                ]
                do conf lockMap prontera
                do conf route_randomWalk 1
                do conf route_randomWalk_inTown 1
                if (checarSeExisteNoConfig("BetterShopper_0") = nao) {
                    adicionaBetterShopper()
                    pause 1
                    do reload config
                }
                do conf BetterShopper_0 Opala
                do conf BetterShopper_0_maxPrice 10000
                do conf BetterShopper_0_maxAmount 1
                do conf BetterShopper_0_disabled 0
                do conf -f BetterShopper_on 1
            }
        } else {
            log Já tenho Opala
            if (&config(BetterShopper_0_disabled) != 1) do conf BetterShopper_0_disabled 1
            $tenhoOpala = sim
        }
        
        if (&invamount(Cristal Azul) < 1) {
            if (&config(BetterShopper_1) != Cristal Azul) {
                do conf lockMap prontera
                do conf route_randomWalk 1
                do conf route_randomWalk_inTown 1
                if (checarSeExisteNoConfig("BetterShopper_1") = nao) {
                    adicionaBetterShopper()
                    pause 1
                    do reload config
                }
                do conf BetterShopper_1 Cristal Azul
                do conf BetterShopper_1_maxPrice 10000
                do conf BetterShopper_1_maxAmount 1
                do conf BetterShopper_1_disabled 0
                do conf -f BetterShopper_on 1
            }
        } else {
            log Já tenho Cristal Azul
            if (&config(BetterShopper_1_disabled) != 1) do conf BetterShopper_1_disabled 1
            $tenhoCristal = sim
        }
        
        if ( $tenhoRosario = sim && $tenhoOpala = sim && $tenhoCristal = sim ) {
            [
            log ===================================
            log = TENHO TODOS OS ITENS, VOU FALAR COM NPC
            log ===================================
            ]
            do conf -f quest_luz_divina falar_com_npc
            do conf -f BetterShopper_on 0
        } else {
            [
            log ===================================
            log = ainda não tenho todos os itens para a quest
            log ===================================
            ]
        }
    }
}

automacro questLuzDivina_jaTenhosOsItens {
    ConfigKey quest_skill true
    ConfigKey quest_luz_divina comprar_itens
    SkillLevel AL_HOLYLIGHT != 1
    InInventoryID 727 > 0
    InInventoryID 991 > 0
    InInventoryID 2608 > 0
    exclusive 1
    call {
        do conf BetterShopper_on 0
        do conf quest_luz_divina falar_com_npc
    }
}

automacro questLuzDivina_jaTenhosOsItens_bugged {
    ConfigKey quest_skill true
    ConfigKey quest_luz_divina comprar_itens
    SkillLevel AL_HOLYLIGHT != 1
    InInventory "Opala" > 0
    InInventory "Cristal Azul" > 0
    InInventory "Rosário" > 0
    exclusive 1
    call {
        do conf BetterShopper_on 0
        do conf quest_luz_divina falar_com_npc
    }
}

automacro questLuzDivina_falarComNpc {
    ConfigKey quest_skill true
    ConfigKey quest_luz_divina falar_com_npc
    exclusive 1
    SkillLevel AL_HOLYLIGHT != 1
    call {
        do move prt_church  &rand(171,175) &rand(21,25)
        do talknpc 173 23 r1
    }
}

automacro questLuzDivina_aprendiLuzDivina {
    ConfigKey quest_skill true
    SkillLevel AL_HOLYLIGHT = 1
    priority -1
    exclusive 1
    call {
        [
        log ===================================
        log = Aprendi Luz Divina Yayyy        =
        log ===================================
        ]
        do conf quest_skill none
        do conf quest_luz_divina none
    }
}

automacro comprandoCristalAzulAdoidadoBug {
    ConfigKey quest_skill true
    SkillLevel AL_HOLYLIGHT != 1
    ConfigKey quest_luz_divina comprar_itens
    ConfigKey BetterShopper_1 Cristal Azul
    ConfigKeyNot BetterShopper_1_disabled 1
    InInventoryID 991 > 0
    priority -10
    call {
        do conf BetterShopper_1_disabled 1
    }
}

automacro comprandoOpalaAdoidadoBug {
    SkillLevel AL_HOLYLIGHT != 1
    ConfigKey quest_skill true
    ConfigKey quest_luz_divina comprar_itens
    ConfigKey BetterShopper_0 Opala
    ConfigKeyNot BetterShopper_0_disabled 1
    InInventoryID 727 > 0
    priority -10
    call {
        do conf BetterShopper_0_disabled 1
    }
}

automacro comprandoCristalAzulAdoidadoBug2 {
    SkillLevel AL_HOLYLIGHT != 1
    ConfigKey quest_skill true
    ConfigKey quest_luz_divina comprar_itens
    ConfigKey BetterShopper_1 Cristal Azul
    ConfigKeyNot BetterShopper_1_disabled 1
    InInventory "Cristal Azul" > 0
    priority -10
    call {
        do conf BetterShopper_1_disabled 1
    }
}

automacro comprandoOpalaAdoidadoBug2 {
    SkillLevel AL_HOLYLIGHT != 1
    ConfigKey quest_skill true
    ConfigKey quest_luz_divina comprar_itens
    ConfigKey BetterShopper_0 Opala
    ConfigKeyNot BetterShopper_0_disabled 1
    InInventory "Opala" > 0
    priority -10
    call {
        do conf BetterShopper_0_disabled 1
    }
}

automacro betterShopper_bugged {
    priority -5
    exclusive 1
    ConfigKey BetterShopper_on 1
    ConfigKey quest_skill true
    ConfigKey quest_luz_divina falar_com_npc
    call {
        do conf -f BetterShopper_on 0
    }
}