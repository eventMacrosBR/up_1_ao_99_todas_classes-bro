
sub configurarBuild {
    my %configsBuild = (
        skillsAprendiz => 'NV_BASIC 9',
        skillsClasse1 => 'MG_LIGHTNINGBOLT 5, MG_FIREBOLT 5, MG_COLDBOLT 5, MG_SRECOVERY 5, MG_FIREBOLT 7, MG_COLDBOLT 7, MG_FIREBOLT 10, MG_COLDBOLT 10, MG_NAPALMBEAT 5, MG_SOULSTRIKE 10, MG_STONECURSE 1, MG_SIGHT 1, MG_FROSTDIVER 1, MG_THUNDERSTORM 1',
        skillsClasse2 => 'WZ_ICEWALL 5, WZ_FROSTNOVA 10, WZ_WATERBALL 5, WZ_STORMGUST 1, WZ_JUPITEL 1, WZ_VERMILION 1, WZ_EARTHSPIKE 5, WZ_EARTHSPIKE 1, WZ_QUAGMIRE 5, WZ_SIGHTRASHER 2, WZ_METEOR 9',
        skillsClasse1T => 'MG_LIGHTNINGBOLT 4, MG_COLDBOLT 10, MG_SRECOVERY 7, MG_NAPALMBEAT 7, MG_SOULSTRIKE 7, MG_SAFETYWALL 10, MG_STONECURSE 1, MG_SIGHT 1, MG_FROSTDIVER 1, MG_THUNDERSTORM 1',
        skillsClasse2T => 'HW_MAGICPOWER 10, HW_SOULDRAIN 10, WZ_ESTIMATION 1, WZ_ICEWALL 5, WZ_FROSTNOVA 10, WZ_WATERBALL 5, WZ_STORMGUST 10, WZ_JUPITEL 5, WZ_VERMILION 1, WZ_EARTHSPIKE 3, WZ_HEAVENDRIVE 1, WZ_QUAGMIRE 5, WZ_SIGHTRASHER 2, WZ_METEOR 1'
        skillsClasse3 => '',
        statsPadrao => 'str 10,  agi 10, vit 10, int 30, dex 15, luk 15, str 11, 20 agi, 60 int, 30 dex, 30 luk, 26 agi, 20 vit, 80 int, 60 dex, 60 luk, 90 int, 70 dex',
        statsPadraoTransclasse => 'vit 15, int 15, dex 15, vit 25, int 30, dex 30, int 60, dex 60, int 90, dex 90, int 99, dex 99',
        statsPadraoClasse3 => ''
    );
    my $eventMacro = $eventMacro::Data::eventMacro;
    $eventMacro->set_full_hash('configsBuild', \%configsBuild);
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
            {lvlMin => 1 , lvlMax => 11, lockMap => 'gef_fild04',  saveMap => 'geffen'},
            {lvlMin => 12, lvlMax => 25, lockMap => 'pay_fild08',  saveMap => 'payon'},
            {lvlMin => 26, lvlMax => 40, lockMap => 'pay_dun00',   saveMap => 'payon'},
            {lvlMin => 41, lvlMax => 45, lockMap => 'moc_fild03',  saveMap => 'payon'},
            {lvlMin => 46, lvlMax => 60, lockMap => 'cmd_fild01',  saveMap => 'comodo'},
            {lvlMin => 60, lvlMax => 70, lockMap => 'moc_fild17',  saveMap => 'morocc'},
            {lvlMin => 71, lvlMax => 79, lockMap => 'yuno_fild09', saveMap => 'aldebaran'},
            {lvlMin => 80, lvlMax => 98, lockMap => 'ein_fild09',  saveMap => 'einbroch'}
        ];
	} else {
        $variaveisDeUp =
		# AQUI SÃO OS MAPAS DE UP ATÉ 99, DEPOIS DE REBORNAR
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

