
sub configurarBuild {
    my %configsBuild = (
        skillsAprendiz => 'Habilidades Básicas 9',
        skillsClasse1 => 'Ataque Duplo 10, Perícia em Esquiva 10, Furto 10, Esconderijo 8, Envenenar 10, Desintoxicar 1',
        skillsClasse2 => 'Mãos Leves 10, Afanar 10, Apunhalar 4, Túnel de Fuga 5, Ataque Surpresa 5, Rapto 5, Plágio 10',
        skillsClasse1T => 'Ataque Duplo 10, Perícia em Esquiva 10, Furto 10, Esconderijo 10, Envenenar 8, Desintoxicar 1',
        skillsClasse2T => 'Mãos Leves 10, Afanar 10, Perícia com Espada 10, Apunhalar 8, Túnel de Fuga 5, Espreitar 5, Ataque Surpresa 5, Rapto 5, RG_PLAGIARSIM 10, Preservar 1',
        skillsClasse3 => '',
        statsPadrao => '10 dex, 15 agi, 20 dex, 25 agi, 20 str, 30 dex, 60 agi, 30 str, 40 dex, 20 vit, 80 agi ,60 dex, 50 str, 90 agi, 70 str, 40 vit',
        statsPadraoTransclasse => '10 dex, 15 agi, 20 dex, 25 agi, 20 str, 30 dex, 60 agi, 40 dex, 35 vit, 80 agi, 50 dex, 99 agi, 70 int',
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
        {lvlMin => 1 , lvlMax => 11, lockMap => 'moc_fild12', saveMap => 'morocc'},
        {lvlMin => 12, lvlMax => 25, lockMap => 'pay_fild08', saveMap => 'payon'},
        {lvlMin => 26, lvlMax => 40, lockMap => 'pay_dun00',  saveMap => 'payon'},
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

