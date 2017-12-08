# $.param[0] : nome ou id da skill
# $.param[1] : level
# $.param[2] : sp
# $.param[3] : montros
# $.param[4] : condicao
sub configurarAttackSkill {
    my ($skill, $lvl, $sp, $monstros, $condicao) = @_;

    if ( attackSkillEstaConfigurada() == 'nao') {
        open (my $fh, '>>:encoding(UTF-8)', Settings::getControlFilename('config.txt'));
        print $fh "attackSkillSlot $skill {\n";
		print $fh "\tlvl $lvl\n";
        print $fh "\tsp $sp\n";
        print $fh "\tmonsters $monstros\n"; 
		print $fh "\t$condicao\n";
		print $fh "}\n";
        close ($fh);
    }
}

# $.param[0] : nome ou id da skill
# $.param[1] : level
# $.param[2] : sp
# $.param[3] : condicao
# $.param[4] : hp
sub configurarSelfSkill {
    my ($skill, $lvl, $sp, $condicao, $hp) = @_;

    if ( selfSkillEstaConfigurado() == 'nao') {
        open (my $fh, '>>:encoding(UTF-8)', Settings::getControlFilename('config.txt'));
        print $fh "useSelf_skill $skills {\n";
        print $fh "\tlvl $lvl\n";
		print $fh "\tsp $sp\n";
        print $fh "\t$condicao\n";
        print $fh "\thp $hp\n"; 
		print $fh "}\n";
        close ($fh);
    }
}

# $.param[0] : nome ou id do item
# $.param[1] : condicao
# $.param[2] : hp
# $.param[3] : sp
sub configurarSelfItem {
    my ($item, $condicao, $hp, $sp) = @_;

    if ( usarItemEstaConfigurado() == 'nao') {
        open (my $fh, '>>:encoding(UTF-8)', Settings::getControlFilename('config.txt'));
        print $fh "useSelf_item $item {\n";
        print $fh "\t$condicao\n";
		print $fh "\thp $hp\n";
        print $fh "\tsp $sp\n"; 
		print $fh "}\n";
        close ($fh);
    }
}

# $.param[0] : nome da skill
sub attackSkillEstaConfigurada {

    my $i = 0;
    while ( &config("attackSkillSlot_$i") != none ){
        if ( &config("attackSkillSlot_$i") == $.param[0]) return 'sim';
        $i++;
    }
    return 'nao';
}

# $.param[0] : nome da skill
sub selfSkillEstaConfigurado {

    my $i = 0;
    while ( &config("useSelf_skill_$i") != none ){
        if ( &config("useSelf_skill_$i") == $.param[0]) return 'sim';
        $i++;
    }
    return 'nao';
}

# $.param[0] : nome do item
sub usarItemEstaConfiguradao {
    my $i = 0;
    while ( &config("useSelf_item_$i") != none ){
        if ( &config("useSelf_item_$i") == $.param[0]) return 'sim';
        $i++;
    }
    return 'nao';

}

#TODO implementar getAuto e autoBuy
