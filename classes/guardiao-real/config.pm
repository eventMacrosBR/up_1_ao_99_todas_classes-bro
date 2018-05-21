
sub configurarBuild {
    my %configsBuild = (
        skillsAprendiz => 'Habilidades Básicas 9',
        skillsClasse1 => 'Aumentar Recuperação de HP 10, Provocar 9, Golpe Fulminante 10, Vigor 10, Impacto Explosivo 10',
        skillsClasse2 => 'Fé 7, Crux Divinum 10, Medicar 1, Montaria 1, Perícia em Montaria 5, Perícia com Lança 10, Proteção Divina 3, Flagelo do Mal 5, Fé 10, Curar 5',
        skillsClasse1T => 'Aumentar Recuperação de HP 10, Provocar 9, Golpe Fulminante 10, Vigor 10, Impacto Explosivo 10',
        skillsClasse2T => '',
        skillsClasse3 => '',
        statsPadrao => '10 dex, 15 agi, 20 dex, 20 agi, 20 str, 30 dex, 30 str, 40 dex, 20 vit, 40 str, 60 dex, 50 str, 20 int, 65 str, 40 int, 70 dex, 40 vit, 50 int, 75 dex, 60 int, 80 dex, 70 int',
        statsPadraoTransclasse => '10 dex, 15 agi, 20 dex, 20 agi, 20 str, 30 dex, 30 str, 40 dex, 20 vit, 40 str, 60 dex, 50 str, 20 int, 65 str, 40 int, 70 dex, 40 vit, 50 int, 75 dex, 60 int, 80 dex, 70 int',
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
        {lvlMin => 1 , lvlMax => 11, lockMap => 'prt_fild08', saveMap => 'izlude'},
        {lvlMin => 12, lvlMax => 25, lockMap => 'pay_fild08', saveMap => 'payon'},
        {lvlMin => 26, lvlMax => 40, lockMap => 'pay_dun00',  saveMap => 'payon'},
        {lvlMin => 41, lvlMax => 45, lockMap => 'pay_fild09', saveMap => 'payon'},
        {lvlMin => 46, lvlMax => 53, lockMap => 'iz_dun00',   saveMap => 'izlude'},
        {lvlMin => 54, lvlMax => 59, lockMap => 'iz_dun02',   saveMap => 'izlude'},
        {lvlMin => 60, lvlMax => 70, lockMap => 'moc_fild17', saveMap => 'morocc'},
        {lvlMin => 71, lvlMax => 74, lockMap => 'mjolnir_11', saveMap => 'prontera'},
        {lvlMin => 75, lvlMax => 98, lockMap => 'gl_church',  saveMap => 'geffen'}
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

