sub configurarBuild {
    my %configsBuild = (
        skillsAprendiz => 'NV_BASIC 9',
        skillsClasse1 => 'AC_OWL 10, AC_VULTURE 10, AC_CONCENTRATION 10, AC_DOUBLE 10, AC_SHOWER 9',
        skillsClasse2 => 'HT_BEASTBANE 10, HT_FALCON 1, HT_BLITZBEAT 5, HT_STEELCROW 10',
        skillsClasse1T => 'AC_OWL 10, AC_VULTURE 10, AC_CONCENTRATION 10, AC_DOUBLE 10, AC_SHOWER 9',
        skillsClasse2T => 'HT_BEASTBANE 10, HT_FALCON 1, SN_SIGHT 10, SN_WINDWALK 10, HT_BLITZBEAT 5, HT_STEELCROW 6, HT_SKIDTRAP 1, HT_FLASHER 1, HT_FREEZINGTRAP 5, HT_SANDMAN 5, HT_BLASTMINE 1, HT_CLAYMORETRAP 5, HT_ANKLESNARE 5, HT_SHOCKWAVE 1, HT_LANDMINE 1, HT_REMOVETRAP 1, HT_TALKIEBOX 1',
        skillsClasse3 => 'RA_AIMEDBOLT 5, RA_ARROWSTORM 10,RA_RANGERMAIN 1, RA_CAMOUFLAGE 5, RA_FEARBREEZE 5, RA_UNLIMIT 5, RA_WUGMASTERY 1, RA_TOOTHOFWUG 10, RA_WUGRIDER 3, RA_WUGDASH 1, RA_WUGSTRIKE 1, RA_SENSITIVEKEEN 2, RA_WUGBITE 5',
        statsPadrao => '30 dex, 50 agi, 40 dex, 20 luk, 60 agi, 20 vit, 80 agi, 80 dex, 90 agi, 49 vit, 92 dex',
        statsPadraoTransclasse => '30 dex, 50 agi, 40 dex, 20 luk, 60 agi, 20 vit, 80 agi, 80 dex, 90 agi, 49 vit, 92 dex',
        statsPadraoClasse3 => '120 dex, 110 agi, 120 luk, 71 vit'
    );    #https://pt.ragnaplace.com/Sentinela-Critico-Tio-Pedrao

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
        # AQUI SÃO OS MAPAS DE UP ATÉ 99, ANTES DE REBORNAR
            [
            {lvlMin => 1 , lvlMax => 11, lockMap => 'pay_fild01', saveMap => 'payon'},
            {lvlMin => 12, lvlMax => 25, lockMap => 'pay_fild08', saveMap => 'payon'},
            {lvlMin => 26, lvlMax => 40, lockMap => 'pay_dun00',  saveMap => 'payon'},
            {lvlMin => 41, lvlMax => 45, lockMap => 'pay_fild09', saveMap => 'payon'},
            {lvlMin => 46, lvlMax => 53, lockMap => 'iz_dun00',   saveMap => 'izlude'},
            {lvlMin => 54, lvlMax => 59, lockMap => 'iz_dun02',   saveMap => 'izlude'},
            {lvlMin => 60, lvlMax => 70, lockMap => 'moc_fild17', saveMap => 'morocc'},
            {lvlMin => 71, lvlMax => 79, lockMap => 'mjolnir_11', saveMap => 'prontera'},
            {lvlMin => 80, lvlMax => 98, lockMap => 'gef_fild06', saveMap => 'geffen'}
        ];
    } else {
        $variaveisDeUp =
        # AQUI SÃO OS MAPAS DE UP ATÉ 99, DEPOIS DE REBORNAR
            [
            {lvlMin => 1 , lvlMax => 11, lockMap => 'pay_fild01', saveMap => 'payon'},
            {lvlMin => 12, lvlMax => 25, lockMap => 'pay_fild08', saveMap => 'payon'},
            {lvlMin => 26, lvlMax => 40, lockMap => 'pay_dun00',  saveMap => 'payon'},
            {lvlMin => 41, lvlMax => 45, lockMap => 'pay_fild09', saveMap => 'payon'},
            {lvlMin => 46, lvlMax => 53, lockMap => 'iz_dun00',   saveMap => 'izlude'},
            {lvlMin => 54, lvlMax => 59, lockMap => 'iz_dun02',   saveMap => 'izlude'},
            {lvlMin => 60, lvlMax => 70, lockMap => 'moc_fild17', saveMap => 'morocc'},
            {lvlMin => 71, lvlMax => 79, lockMap => 'mjolnir_11', saveMap => 'prontera'},
            {lvlMin => 80, lvlMax => 98, lockMap => 'gef_fild06', saveMap => 'geffen'}
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
    my %parametrosQuestClasseRenascer = (
        renascer => 'nao',
        amigo => '',
        #observação sobre o ponto de encontro:
        #só poderá ser as coordenadas, não coloque nome de cidade aqui, senão é treta
        #a cidade sempre será obrigatoriamente em juno, já que o reborn se passa por lá
        #altere a coordenada a seu prazer, fique a vontade
        pontoDeEncontro => '146 116'
    );
    return \%parametrosQuestClasseRenascer;
}

