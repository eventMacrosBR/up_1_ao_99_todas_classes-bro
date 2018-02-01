automacro configurarPotLaranja {
    InInventoryID 569 < 1 #Poção de Aprendiz (não pode ter essa poção)
    InStorageID 569 < 1 #Poção de Aprendiz (não pode ter essa poção)
    Zeny > 30000
    ConfigKeyNot useSelf_item_0 Poção de Aprendiz #só se ativa quando nao ta usando mais pot aprendiz
    ConfigKeyNot useSelf_item_0 Poção Laranja
    exclusive 1
    call {
        [
        log ===================================
        log = configurando poção laranja
        log ===================================
        ]
        do iconf 502 100 0 0 #pot laranja
        if (&config(buyAuto_1) = Poção Laranja ) {
            log pot Laranja já está configurada, essa mensagem não deveria aparecer
            log caso apareça repetidamente, relate aos criadores da macro
        } else {
            adicionaBuyAuto() #preciso adicionar um bloco novo, porque o bloco
            #de buyauto padrão não tem o "zeny" como chave, apesar que deveria
            pause 1
            do reload config 

            do conf buyAuto_1 Poção Laranja
            do conf buyAuto_1_maxAmount 100
            do conf buyAuto_1_zeny > 30000
            do conf buyAuto_1_npc payon_in01 5 49
            do conf buyAuto_1_disabled 0
        }
        $blocoExiste = checarSeExisteNoConfig("useSelf_item_0")
        if ( $blocoExiste = nao ) {
            adicionaUseSelfItem()
            pause 1
            do reload config
        }
        do conf useSelf_item_0 Poção Laranja
        do conf useSelf_item_0_hp < 50%
        do conf useSelf_item_0_disabled 0

        [
        log ========================================
        log Configação para usar e comprar Poção Laranja
        log feita com sucesso
        log ========================================
        ]
    }
}

automacro desabilitarPotLaranja {
    ConfigKey buyAuto_1 Poção Laranja
    ConfigKeyNot buyAuto_1_disabled 1
    JobID $paramsClasses{idC1}
    exclusive 1
    call {
        [
        log ===================================
        log = DESABILITANDO COMPRA DE POÇÃO LARANJA
        log = PARA ECONOMIZAR DINHEIRO PRA QUEST 2
        log ===================================
        ]
        
        do conf buyAuto_1_disabled 1
    }
}

automacro habilitarNovamentePotLaranja {
    ConfigKey buyAuto_1 Poção Laranja
    ConfigKeyNot buyAuto_1_disabled 0
    JobID $paramsClasses{idC2}
    ConfigKeyNot quest_skill true
    exclusive 1
    call {
        [
        log ===================================
        log = HABILITANDO COMPRA DE POÇÃO LARANJA
        log ===================================
        ]
        
        do conf buyAuto_1_disabled 0
    }
}

automacro parandoDePegarPotDeAprendiz {
    InInventoryID 569 < 1
    InStorageID 569 < 1
    ConfigKey useSelf_item_0 Poção de Aprendiz
    exclusive 1
    call {
        [
        log ===================================
        log = as poções de aprendiz acabaram, 
        log = removendo o getAuto
        log ===================================
        ]
        #parar de tentar usar tambem
        do conf sitAuto_hp_upper 80
        do conf getAuto_0 none
        if (&config(useSelf_item_0) =~ /Aprendiz/) do conf useSelf_item_0 none
    }
}

sub adicionaAttackSkillSlot {
    open (my $fh, '>>:encoding(UTF-8)', Settings::getConfigFilename());
    print $fh "attackSkillSlot {\n";
    print $fh "\tlvl 10\n";
    print $fh "\tdist 1.5\n";
    print $fh "\tmaxCastTime 0\n";
    print $fh "\tminCastTime 0\n";
    print $fh "\thp\n";
    print $fh "\tsp > 10\n";
    print $fh "\thomunculus_hp\n";
    print $fh "\thomunculus_sp\n";
    print $fh "\thomunculus_dead\n";
    print $fh "\tonAction\n";
    print $fh "\twhenStatusActive\n";
    print $fh "\twhenStatusInactive\n";
    print $fh "\twhenFollowing\n";
    print $fh "\tspirit\n";
    print $fh "\tamuletType\n";
    print $fh "\taggressives\n";
    print $fh "\tpreviousDamage\n";
    print $fh "\tstopWhenHit 0\n";
    print $fh "\tinLockOnly 0\n";
    print $fh "\tnotInTown 0\n";
    print $fh "\ttimeout 0\n";
    print $fh "\tdisabled 0\n";
    print $fh "\tmonsters\n";
    print $fh "\tnotMonsters\n";
    print $fh "\tmonstersCount\n";
    print $fh "\tmaxAttempts 0\n";
    print $fh "\tmaxUses 0\n";
    print $fh "\ttarget_hp\n";
    print $fh "\ttarget_whenStatusActive\n";
    print $fh "\ttarget_whenStatusInactive\n";
    print $fh "\ttarget_deltaHp\n";
    print $fh "\tinInventory\n";
    print $fh "\tisSelfSkill 0\n";
    print $fh "\tequip_topHead\n";
    print $fh "\tequip_midHead\n";
    print $fh "\tequip_lowHead\n";
    print $fh "\tequip_leftHand\n";
    print $fh "\tequip_rightHand\n";
    print $fh "\tequip_leftAccessory\n";
    print $fh "\tequip_rightAccessory\n";
    print $fh "\tequip_robe\n";
    print $fh "\tequip_armor\n";
    print $fh "\tequip_shoes\n";
    print $fh "\tequip_arrow\n";
    print $fh "\tmanualAI 0\n";
    print $fh "\tzeny\n";
    print $fh "\tnotOnAction\n";
    print $fh "}\n";
    close ($fh);
}

sub adicionaUseSelfSkill {
    open (my $fh, '>>:encoding(UTF-8)', Settings::getConfigFilename());
    print $fh "useSelf_skill {\n";
    print $fh "\tlvl 10\n";
    print $fh "\tmaxCastTime 0\n";
    print $fh "\tminCastTime 0\n";
    print $fh "\thp\n";
    print $fh "\tsp\n";
    print $fh "\thomunculus_hp\n";
    print $fh "\thomunculus_sp\n";
    print $fh "\thomunculus_dead\n";
    print $fh "\tonAction\n";
    print $fh "\twhenStatusActive\n";
    print $fh "\twhenStatusInactive\n";
    print $fh "\twhenFollowing\n";
    print $fh "\tspirit\n";
    print $fh "\tamuletType\n";
    print $fh "\taggressives\n";
    print $fh "\tmonsters\n";
    print $fh "\tnotMonsters\n";
    print $fh "\tmonstersCount\n";
    print $fh "\tstopWhenHit 0\n";
    print $fh "\tinLockOnly 0\n";
    print $fh "\tnotWhileSitting 0\n";
    print $fh "\tnotInTown 0\n";
    print $fh "\ttimeout 0\n";
    print $fh "\tdisabled 0\n";
    print $fh "\tinInventory\n";
    print $fh "\tmanualAI 0\n";
    print $fh "\tnotOnAction\n";
    print $fh "}\n";
    close ($fh);
}

sub adicionaUseSelfItem {
    open (my $fh, '>>:encoding(UTF-8)', Settings::getConfigFilename());
    print $fh "useSelf_item {\n";
    print $fh "\thp\n";
    print $fh "\tsp\n";
    print $fh "\thomunculus_hp\n";
    print $fh "\thomunculus_sp\n";
    print $fh "\thomunculus_dead\n";
    print $fh "\tonAction\n";
    print $fh "\twhenStatusActive\n";
    print $fh "\twhenStatusInactive\n";
    print $fh "\twhenFollowing\n";
    print $fh "\tspirit\n";
    print $fh "\tamuletType\n";
    print $fh "\taggressives\n";
    print $fh "\tmonsters\n";
    print $fh "\tnotMonsters\n";
    print $fh "\tmonstersCount\n";
    print $fh "\tstopWhenHit 0\n";
    print $fh "\tinLockOnly 0\n";
    print $fh "\tnotWhileSitting 0\n";
    print $fh "\tnotInTown 0\n";
    print $fh "\ttimeout\n";
    print $fh "\tdisabled 0\n";
    print $fh "\tinInventory\n";
    print $fh "\tmanualAI 0\n";
    print $fh "\tnotOnAction\n";
    print $fh "}\n";
    close ($fh);
}

sub adicionaBuyAuto {
    open (my $fh, '>>:encoding(UTF-8)', Settings::getConfigFilename());
    print $fh "buyAuto {\n";
    print $fh "\tnpc\n";
    print $fh "\tstandpoint\n";
    print $fh "\tdistance 5\n";
    print $fh "\tprice\n";
    print $fh "\tminAmount 2\n";
    print $fh "\tmaxAmount 3\n";
    print $fh "\tbatchSize\n";
    print $fh "\tdisabled 0\n";
    print $fh "\tzeny\n";
    print $fh "}\n";
    close ($fh);
}

sub adicionaGetAuto {
    open (my $fh, '>>:encoding(UTF-8)', Settings::getConfigFilename());
    print $fh "getAuto {\n";
    print $fh "\tminAmount\n";
    print $fh "\tmaxAmount\n";
    print $fh "\tpassive\n";
    print $fh "}\n";
    close ($fh);
}

sub adicionaBetterShopper {
    open (my $fh, '>>:encoding(UTF-8)', Settings::getConfigFilename());
    print $fh "BetterShopper {\n";
    print $fh "\tmaxPrice\n";
    print $fh "\tmaxAmount\n";
    print $fh "\tdisabled 0\n";
    print $fh "}\n";
    close($fh);
}

