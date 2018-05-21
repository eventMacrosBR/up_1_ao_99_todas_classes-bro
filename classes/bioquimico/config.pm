sub configurarBuild {
    my %configsBuild = (
        skillsAprendiz => 'Habilidades Básicas 9',
        skillsClasse1 => 'Aumentar Capacidade de Carga 10, Desconto 8, Superfaturar 10, Usar Carrinho 10, Comércio 10, Identificar Item 1',
        skillsClasse2 => 'Perícia com Machado 10, Desconto 10, Vaporizar 1, Criar Homunculus 1, Ressuscitar Homunculus 5, Pesquisa de Poções 10, Preparar Poção 10, Arremessar Poção 5, Criar Monstro Planta 5',
        skillsClasse1T => 'Aumentar Capacidade de Carga 10, Desconto 8, Superfaturar 10, Usar Carrinho 10, Comércio 10, Identificar Item 1',
        skillsClasse2T => '',
        skillsClasse3 => '',
        statsPadrao => '10 dex, 15 agi, 20 dex, 25 agi, 20 str, 30 dex, 60 agi, 30 str, 40 dex, 20 vit, 80 agi ,60 dex, 50 str, 90 agi, 70 str, 40 vit',
        statsPadraoTransclasse => '10 dex, 15 agi, 20 dex, 25 agi, 20 str, 30 dex, 60 agi, 30 str, 40 dex, 20 vit, 80 agi ,60 dex, 50 str, 90 agi, 70 str, 40 vit',
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
        {lvlMin => 1 , lvlMax => 11, lockMap => 'pay_fild03', saveMap => 'alberta'},
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

