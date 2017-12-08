macro configurarAttackSkill {
    $skill = $.param[0];
    $lvl = $.param[1];
    $sp = $.param[2];
    $monstros = $.param[3];
    $condicao = $.param[4];

    $attackSkillEstaConfigurada = 'nao';
    $i = 0
    while ( &config("attackSkillSlot_$i") ) {
        if ( &config("attackSkillSlot_$i") == Skill ) {
            $attackSkillEstaConfigurada = 'sim';
        }
        $i++
    }
    if ( $attackSkillEstaConfigurada == 'nao' ) {
        adicionaAttackSkillSlot($skill, $lvl, $sp, $monstros, $condicao);
    }
}

macro configurarSelfSkill {
    $skill = $.param[0];
    $lvl = $.param[1];
    $sp = $.param[2];
    $condicao = $.param[3];
    $hp = $.param[4];

    $selfSkillEstaConfigurado = 'nao';
    $i = 0;
    while ( &config("useSelf_skill_$i") ) {
        if ( &config("useSelf_skill_$i") == $skill ) {
            $selfSkillEstaConfigurado = 'sim';
        }
        $i++;
    }
    if ( $selfSkillEstaConfigurado == 'nao' ) {
        adicionarSelfSkill($skill, $lvl, $sp, $condicao, $hp);
    }
}

macro configurarSelfItem {
    $item = $.param[0];
    $condicao = $.param[1];
    $hp = $.param[2];
    $sp = $.param[3];

    $usarItemEstaConfigurado = 'nao'
    $i = 0;
    while ( &config("useSelf_item_$i") ) {
        if ( &config("useSelf_item_$i") == $item ) {
            $usarItemEstaConfigurado = 'sim';
        }
        $i++;
    }

    if ( $usarItemEstaConfigurado == 'nao' ) {
        adicionarSelfItem($item, $condicao, $hp, $sp);
    }
}

sub adicionaAttackSkillSlot {
    my ($skill, $lvl, $sp, $monstros, $condicao) = @_;
    open (my $fh, '>>:encoding(UTF-8)', Settings::getControlFilename('config.txt'));
    print $fh "attackSkillSlot $skill {\n";
    print $fh "\tlvl $lvl\n";
    print $fh "\tsp $sp\n";
    print $fh "\tmonsters $monstros\n"; 
    print $fh "\t$condicao\n";
    print $fh "}\n";
    close ($fh);
}

sub adicionarSelfSkill {
    my ($skill, $lvl, $sp, $condicao, $hp) = @_;
    open (my $fh, '>>:encoding(UTF-8)', Settings::getControlFilename('config.txt'));
    print $fh "useSelf_skill $skills {\n";
    print $fh "\tlvl $lvl\n";
    print $fh "\tsp $sp\n";
    print $fh "\t$condicao\n";
    print $fh "\thp $hp\n"; 
    print $fh "}\n";
    close ($fh);
}

sub adicionarSelfItem {
    my ($item, $condicao, $hp, $sp) = @_;
    open (my $fh, '>>:encoding(UTF-8)', Settings::getControlFilename('config.txt'));
    print $fh "useSelf_item $item {\n";
    print $fh "\t$condicao\n";
    print $fh "\thp $hp\n";
    print $fh "\tsp $sp\n"; 
    print $fh "}\n";
    close ($fh);
}

#TODO implementar getAuto e autoBuy
