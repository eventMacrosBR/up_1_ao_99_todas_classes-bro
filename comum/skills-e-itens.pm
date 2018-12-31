automacro usarPocaoDeAprendiz {
    ConfigKeyNot useSelf_item_0 Poção de Aprendiz
    InInventory "Poção de Aprendiz" > 0
    exclusive 1
    call {
        log parece que tenho poção de aprendiz, mas ainda não foi configurado pra ser usado
        log mudando isso
        $potName = pegarNomePeloIdDoItem(569)
        do conf useSelf_item_0 $potName
        do conf useSelf_item_0_disabled 0
        do conf useSelf_item_0_hp < 60%
        do conf getAuto_0 $potName
        do conf getAuto_0_minAmount 20
        do conf getAuto_0_maxAmount 200
        do conf getAuto_0_passive 0
        log pronto
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
    print $fh "\tlvl\n";
    print $fh "\tdist\n";
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
    print $fh "\tpreviousDamage\n";
    print $fh "\tstopWhenHit 0\n";
    print $fh "\tinLockOnly 0\n";
    print $fh "\tnotInTown 0\n";
    print $fh "\ttimeout 0\n";
    print $fh "\tdisabled 0\n";
    print $fh "\tmonsters\n";
    print $fh "\tnotMonsters\n";
    print $fh "\tmonstersCount\n";
    print $fh "\tmaxAttempts\n";
    print $fh "\tmaxUses\n";
    print $fh "\ttarget_hp\n";
    print $fh "\ttarget_whenStatusActive\n";
    print $fh "\ttarget_whenStatusInactive\n";
    print $fh "\ttarget_deltaHp\n";
    print $fh "\tinInventory\n";
    print $fh "\tisSelfSkill\n";
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
    print $fh "\n"; #deixar uma linha em branco
    close ($fh);
}

sub adicionaUseSelfSkill {
    open (my $fh, '>>:encoding(UTF-8)', Settings::getConfigFilename());
    print $fh "useSelf_skill {\n";
    print $fh "\tlvl\n";
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
    print $fh "\tstopWhenHit\n";
    print $fh "\tinLockOnly\n";
    print $fh "\tnotWhileSitting\n";
    print $fh "\tnotInTown 0\n";
    print $fh "\ttimeout 0\n";
    print $fh "\tdisabled 0\n";
    print $fh "\tinInventory\n";
    print $fh "\tmanualAI 0\n";
    print $fh "\tnotOnAction\n";
    print $fh "}\n";
    print $fh "\n"; #deixar uma linha em branco
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
    print $fh "\n"; #deixar uma linha em branco
    close ($fh);
}

sub adicionaBuyAuto {
    open (my $fh, '>>:encoding(UTF-8)', Settings::getConfigFilename());
    print $fh "buyAuto {\n";
    print $fh "\tnpc\n";
    print $fh "\tstandpoint\n";
    print $fh "\tdistance 5\n";
    print $fh "\tprice\n";
    print $fh "\tminAmount\n";
    print $fh "\tmaxAmount\n";
    print $fh "\tbatchSize\n";
    print $fh "\tdisabled 0\n";
    print $fh "\tzeny\n";
    print $fh "}\n";
    print $fh "\n"; #deixar uma linha em branco
    close ($fh);
}

sub adicionaGetAuto {
    open (my $fh, '>>:encoding(UTF-8)', Settings::getConfigFilename());
    print $fh "getAuto {\n";
    print $fh "\tminAmount\n";
    print $fh "\tmaxAmount\n";
    print $fh "\tpassive\n";
    print $fh "}\n";
    print $fh "\n"; #deixar uma linha em branco
    close ($fh);
}

sub adicionaBetterShopper {
    open (my $fh, '>>:encoding(UTF-8)', Settings::getConfigFilename());
    print $fh "BetterShopper {\n";
    print $fh "\tmaxPrice\n";
    print $fh "\tmaxAmount\n";
    print $fh "\tdisabled 0\n";
    print $fh "}\n";
    print $fh "\n"; #deixar uma linha em branco
    close($fh);
}

sub adicionaEnhancedCasting {
    open (my $fh, '>>:encoding(UTF-8)', Settings::getConfigFilename());
    print $fh "enhancedCasting {\n";
    print $fh "\tlvl\n";
    print $fh "\tmaxCastTime 0\n";
    print $fh "\tminCastTime 0\n";
    print $fh "\thp\n";
    print $fh "\tsp\n";
    print $fh "\tonAction\n";
    print $fh "\twhenStatusActive\n";
    print $fh "\twhenStatusInactive\n";
    print $fh "\twhenFollowing\n";
    print $fh "\taggressives\n";
    print $fh "\tmonsters\n";
    print $fh "\tnotMonsters\n";
    print $fh "\tmonstersCount\n";
    print $fh "\tstopWhenHit\n";
    print $fh "\tinLockOnly\n";
    print $fh "\tnotWhileSitting\n";
    print $fh "\tnotInTown 0\n";
    print $fh "\ttimeout 0\n";
    print $fh "\tdisabled 1\n";
    print $fh "\tinInventory\n";
    print $fh "\tnotOnAction\n";
    print $fh "\tblockDelayBeforeUse\n";
    print $fh "\tblockDelayAfterUse\n";
    print $fh "\ttarget\n";
    print $fh "\tnotTarget\n";
    print $fh "\tElement\n";
    print $fh "\tnotElement\n";
    print $fh "\tRace\n";
    print $fh "\tnotRace\n";
    print $fh "\tSize\n";
    print $fh "\tnotSize\n";
    print $fh "\tnotImmovable\n";
    print $fh "\tdist\n";
    print $fh "\tdamageFormula\n";
    print $fh "\tdamageType\n";
    print $fh "\tfallThrough\n";
    print $fh "}\n";
    print $fh "\n"; #deixar uma linha em branco
    close ($fh);
}
