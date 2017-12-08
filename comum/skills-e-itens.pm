# $.param[0] : nome ou id da skill
# $.param[1] : level
# $.param[2] : sp
# $.param[3] : montros
# $.param[4] : condicao
sub configurarAttackSkill {

    if ( attackSkillEstaConfigurada() == 'nao') {
        open (my $fh, '>>:encoding(UTF-8)', Settings::getControlFilename('config.txt'));
        print $fh "attackSkillSlot $.param[0] {\n";
		print $fh "\tlvl $.param[1]\n";
        print $fh "\tsp $.param[2]\n";
        print $fh "\tmonsters $.param[3]\n"; 
		print $fh "\t$.param[4]\n";
		print $fh "}\n";
        close ($fh);
    }
}

# $.param[0] : nome ou id da skill
# $.param[1] : sp
# $.param[2] : sp
# $.param[3] : condicao
# $.param[4] : hp
sub configurarSelfSkill {

    if ( selfSkillEstaConfigurado() == 'nao') {
        open (my $fh, '>>:encoding(UTF-8)', Settings::getControlFilename('config.txt'));
        print $fh "useSelf_skill $.param[0] {\n";
        print $fh "\tlvl $.param[1]\n";
		print $fh "\tsp $.param[2]\n";
        print $fh "\t$.param[3]\n";
        print $fh "\thp $.param[4]\n"; 
		print $fh "}\n";
        close ($fh);
    }
}

# $.param[0] : nome ou id do item
# $.param[1] : condicao
# $.param[2] : hp
# $.param[3] : sp
sub configurarSelfItem {

    if ( usarItemEstaConfigurado() == 'nao') {
        open (my $fh, '>>:encoding(UTF-8)', Settings::getControlFilename('config.txt'));
        print $fh "useSelf_item $.param[0] {\n";
        print $fh "\t$.param[1]\n";
		print $fh "\thp $.param[2]\n";
        print $fh "\tsp $.param[3]\n"; 
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
