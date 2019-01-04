
sub configurarBuild {
    my %configsBuild = (
        skillsAprendiz => 'NV_BASIC 9',
        skillsClasse1 => '-1',
        skillsClasse2 => '-1',
        statsPadrao => '-1',
        lvlClasseParaVirarClasse2 => '50'
    );
    return \%configsBuild;
}


sub extrairMapasDeUp {
    my ($lvl, $souTransclasse) = @_;
    my $variaveisDeUp;
    
    #########################################################################
    #AQUI É DEFINIDO OS MAPAS QUE CADA CLASSE IRÁ UPAR, DE MODO
    #QUE SEJA EXTREMAMENTE FÁCIL DE ALTERAR A SEU GOSTO
    ########################################################################

    if ($souTransclasse eq "nao") {
        $variaveisDeUp =
        # AQUI SÃO OS MAPAS DE UP ATÉ 99
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
    }
    
    
    foreach my $configs (@{$variaveisDeUp}) {
        #mensagem para debug
        #warning "lvl min: " . $configs->{lvlMin}.' '. "lvl max: " . $configs->{lvlMax}."\n";
        if ($configs->{lvlMin} <= $lvl && $lvl <= $configs->{lvlMax}) {  #checa em qual "grupo" (de lvlMin e lvlMax) seu nivel se encaixa
            my %hash = (lockMap => $configs->{lockMap}, saveMap => $configs->{saveMap});
            return \%hash;
        }
    }
}

sub inicializarParametrosQuestClasseRenascer {
   #só de estar vazia é o suficiente para não ocorrer erros
   #espiritualista não reborna
}

