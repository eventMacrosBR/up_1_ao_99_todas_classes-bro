
sub configurarBuild {
    my %configsBuild = (
        skillsAprendiz => 'Habilidades Básicas 9',
        skillsClasse1 => 'Relâmpago 3, Aumentar Recuperação de SP 5, Lanças de Fogo 7, Lanças de Gelo 7, Lanças de Fogo 10, Lanças de Gelo 10, Aumentar Recuperação de SP 8, Chama Reveladora 1, Rajada Congelante 1, Ataque Espiritual 4, Espíritos Anciões 10, Relâmpago 4, Tempestade de Raios 1',
        skillsClasse2 => 'Barreira de Gelo 9',
        skillsClasse1T => 'Relâmpago 5, Lanças de Fogo 7, Lanças de Gelo 7,Aumentar Recuperação de SP 10, Lanças de Fogo 10, Lanças de Gelo 10, Rajada Congelante 1, Espíritos Anciões 3',
        skillsClasse2T => '',
        skillsClasse3 => '',
        statsPadrao => '50 int, 20 dex, 70 int, 50 dex, 20 vit, 90 int, 65 vit, 99 int, 70 dex',
        statsPadraoTransclasse => '50 int, 20 dex, 70 int, 50 dex, 20 vit, 90 int, 65 vit, 99 int, 70 dex',
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
        {lvlMin => 1 , lvlMax => 11, lockMap => 'gef_fild04',  saveMap => 'geffen'},
        {lvlMin => 12, lvlMax => 25, lockMap => 'pay_fild08',  saveMap => 'payon'},
        {lvlMin => 26, lvlMax => 40, lockMap => 'pay_dun00',   saveMap => 'payon'},
        {lvlMin => 41, lvlMax => 45, lockMap => 'moc_fild03',  saveMap => 'payon'},
        {lvlMin => 46, lvlMax => 60, lockMap => 'cmd_fild01',  saveMap => 'comodo'},
        {lvlMin => 60, lvlMax => 70, lockMap => 'moc_fild17',  saveMap => 'morocc'},
        {lvlMin => 71, lvlMax => 79, lockMap => 'yuno_fild09', saveMap => 'aldebaran'},
        {lvlMin => 80, lvlMax => 98, lockMap => 'ein_fild09',  saveMap => 'einbroch'}
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

