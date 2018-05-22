sub configurarBuild {
    my %configsBuild = (
        skillsAprendiz => 'Habilidades Básicas 9',
        skillsClasse1 => 'Curar 10, Aumentar Agilidade 10, Proteção Divina 3, Angelus 5, Proteção Divina 6, Bênção 5, Angelus 10, Bênção 10, Revelação 1, Aqua Benedicta 1, Escudo Sagrado 1',
        skillsClasse2 => 'Kyrie Eleison 4, Magnificat 5, Glória 5, Graça Divina 1, Kyrie Eleison 10, Impositio Manus 5, Santuário 10, Aumentar Recuperação de SP 4, Ressuscitar 4, Aumentar Recuperação de SP 9',
        skillsClasse1T => 'Curar 10, Aumentar Agilidade 10, Proteção Divina 3, Angelus 5, Proteção Divina 5, Bênção 5, Angelus 10, Bênção 10, Revelação 1, Aqua Benedicta 1, Escudo Sagrado 1, Diminuir Agilidade 1',
        skillsClasse2T => 'Kyrie Eleison 4, Magnificat 5, Glória 3, Graça Divina 1, Kyrie Eleison 10, Impositio Manus 3, Santuário 7, Aumentar Recuperação de SP 5, Ressuscitar 4, Lex Divina 5, Lex Aeterna 1, Meditatio 10, Aspersio 4, Escudo Mágico 8, Martírio 1',
        skillsClasse3 => 'Sopro Divino 3, Canto Candidus 3, Clementia 3, Praefatio 10, Renovatio 1, Curatio 5, Offertorium 5',
        statsPadrao => '10 vit, 20 int, 15 dex, 20 vit, 25 dex, 30 int, 30 vit, 35 dex, 40 int, 45 vit, 50 int, 40 dex, 60 int, 75 vit, 95 int, 56 dex',
        statsPadraoTransclasse => '10 vit, 20 int, 15 dex, 20 vit, 25 dex, 30 int, 30 vit, 35 dex, 40 int, 45 vit, 50 int, 40 dex, 60 int, 75 vit, 95 int, 56 dex',
        statsPadraoClasse3 => ''
    );
    my $eventMacro = $eventMacro::Data::eventMacro;
    $eventMacro->set_full_hash('configsBuild', \%configsBuild);
}


sub extrairMapasDeUp {
    my ($lvl) = @_;
    my $variaveisDeUp;
    
    #########################################################################
    #AQUI É DEFINIDO OS MAPAS QUE CADA CLASSE IRÁ UPAR, DE MODO 
    #QUE SEJA EXTREMAMENTE FÁCIL DE ALTERAR A SEU GOSTO
    ########################################################################

    $variaveisDeUp = 
    [
        {lvlMin => 1 , lvlMax => 11, lockMap => 'prt_fild08', saveMap => 'prontera'},
        {lvlMin => 12, lvlMax => 25, lockMap => 'pay_fild08', saveMap => 'payon'},
        {lvlMin => 26, lvlMax => 40, lockMap => 'pay_fild07',  saveMap => 'payon'},
        {lvlMin => 41, lvlMax => 45, lockMap => 'pay_fild09', saveMap => 'payon'},
        {lvlMin => 46, lvlMax => 53, lockMap => 'iz_dun00',   saveMap => 'izlude'},
        {lvlMin => 54, lvlMax => 59, lockMap => 'iz_dun02',   saveMap => 'izlude'},
        {lvlMin => 60, lvlMax => 70, lockMap => 'moc_fild17', saveMap => 'morocc'},
        {lvlMin => 71, lvlMax => 79, lockMap => 'mjolnir_11', saveMap => 'prontera'},
        {lvlMin => 80, lvlMax => 98, lockMap => 'gef_fild06', saveMap => 'geffen'}
    ];
    
    foreach my $configs (@{$variaveisDeUp}) {
        #mensagem para debug
        #warning "lvl min: " . $configs->{lvlMin}.' '. "lvl max: " . $configs->{lvlMax}."\n";
        if ($configs->{lvlMin} <= $lvl && $lvl <= $configs->{lvlMax}) {  #checa em qual "grupo" (de lvlMin e lvlMax) seu nivel se encaixa
            my %hash = (lockMap => $configs->{lockMap}, saveMap => $configs->{saveMap});
            my $eventMacro = $eventMacro::Data::eventMacro;
            $eventMacro->set_full_hash('mapa', \%hash);
        }    
    }
}

sub inicializarParametrosQuestClasseRenascer {
    my %parametrosQuestClasseRenascer = (
        renascer => 'nao',
        amigo => '',
        #observação sobre o ponto de encontro:
        #só poderá ser as coordenadas, não coloque nome de cidade aqui, senão é treta
        #a cidade sempre será obrigatoriamente em juno, já que o reborn se passa por lá
        #altere a coordenada a seu prazer, fique a vontade
        pontoDeEncontro => '146 116'
    );
    my $eventMacro = $eventMacro::Data::eventMacro;
    $eventMacro->set_full_hash('parametrosQuestClasseRenascer', \%parametrosQuestClasseRenascer);
}

