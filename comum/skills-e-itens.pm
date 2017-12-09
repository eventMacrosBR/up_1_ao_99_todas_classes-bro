sub adicionaAttackSkillSlot {
    open (my $fh, '>>:encoding(UTF-8)', Settings::getControlFilename('config.txt'));
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
    print $fh "\t}\n";
    close ($fh);
}

sub adicionaUseSelfSkill {
    open (my $fh, '>>:encoding(UTF-8)', Settings::getControlFilename('config.txt'));
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
    print $fh "\t}\n";
    close ($fh);
}

sub adicionaUseSelfItem {
    open (my $fh, '>>:encoding(UTF-8)', Settings::getControlFilename('config.txt'));
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
    print $fh "\t}\n";
    close ($fh);
}

sub adicionaBuyAuto {
    open (my $fh, '>>:encoding(UTF-8)', Settings::getControlFilename('config.txt'));
    print $fh "\tbuyAuto {\n";
	print $fh "\tnpc\n";
	print $fh "\tstandpoint\n";
	print $fh "\tdistance 5\n";
	print $fh "\tprice\n";
	print $fh "\tminAmount 2\n";
	print $fh "\tmaxAmount 3\n";
	print $fh "\tbatchSize\n";
	print $fh "\tdisabled 0\n";
    print $fh "\t}\n";
    close ($fh);
}

sub adicionaGetAuto {
    open (my $fh, '>>:encoding(UTF-8)', Settings::getControlFilename('config.txt'));
    print $fh "\tgetAuto {\n";
	print $fh "\tminAmount\n";
	print $fh "\tmaxAmount\n";
	print $fh "\tpassive\n";
    print $fh "\t}\n";
    close ($fh);
}

