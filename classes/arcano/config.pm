
sub configurarBuild {
    my %configsBuild = (
        skillsAprendiz => 'NV_BASIC 9',
        skillsClasse1 => 'MG_FIREBOLT 3, MG_LIGHTNINGBOLT 3, MG_COLDBOLT 3, MG_NAPALMBEAT 5, MG_SOULSTRIKE 5, MG_LIGHTNINGBOLT 5, MG_FIREBOLT 5, MG_COLDBOLT 5, MG_SRECOVERY 5, MG_FIREBOLT 7, MG_COLDBOLT 7, MG_FIREBOLT 10, MG_COLDBOLT 10, MG_SOULSTRIKE 10, MG_STONECURSE 1, MG_SIGHT 1, MG_FROSTDIVER 1, MG_THUNDERSTORM 1',
        skillsClasse2 => 'WZ_ICEWALL 5, WZ_FROSTNOVA 10, WZ_WATERBALL 5, WZ_STORMGUST 1, WZ_JUPITEL 1, WZ_VERMILION 1, WZ_EARTHSPIKE 5, WZ_EARTHSPIKE 1, WZ_QUAGMIRE 5, WZ_SIGHTRASHER 2, WZ_METEOR 9',
        skillsClasse1T => 'MG_LIGHTNINGBOLT 4, MG_COLDBOLT 10, MG_SRECOVERY 7, MG_NAPALMBEAT 7, MG_SOULSTRIKE 7, MG_SAFETYWALL 10, MG_STONECURSE 1, MG_SIGHT 1, MG_FROSTDIVER 1, MG_THUNDERSTORM 1',
        skillsClasse2T => 'HW_MAGICPOWER 10, HW_SOULDRAIN 10, WZ_ESTIMATION 1, WZ_ICEWALL 5, WZ_FROSTNOVA 10, WZ_WATERBALL 5, WZ_STORMGUST 10, WZ_JUPITEL 5, WZ_VERMILION 1, WZ_EARTHSPIKE 3, WZ_HEAVENDRIVE 1, WZ_QUAGMIRE 5, WZ_SIGHTRASHER 2, WZ_METEOR 1',
        skillsClasse3 => 'WL_RADIUS 3, WL_READING_SB 1, WL_RELEASE 2, WL_STASIS 1, WL_WHITEIMPRISON 1, WL_RECOGNIZEDSPELL 1, WL_SUMMONFB 1, WL_SUMMONWB 1, WL_SUMMONBL 1, WL_FROSTMISTY 2, WL_JACKFROST 5, WL_CRIMSONROCK 5, WL_HELLINFERNO 5, WL_CHAINLIGHTNING 5, WL_DRAINLIFE 2, WL_SOULEXPANSION 5, WL_TELEKINESIS_INTENSE 5, WL_SIENNAEXECRATE 2, WL_EARTHSTRAIN 5, WL_TETRAVORTEX 5',
        statsPadrao => '20 dex, 40 int, 10 vit, 20 luk, 40 dex, 70 int, 40 luk, 70 dex, 60 luk, 99 int',
        statsPadraoTransclasse => '15 dex, 15 int, 15 vit, 30 dex, 30 int, 25 vit, 60 int, 60 dex, 90 int, 90 dex, 99 int, 99 dex',
        statsPadraoClasse3 => '120 dex, 120 int, 90 vit, 100 agi'
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
            {lvlMin => 1 , lvlMax => 18, lockMap => 'gef_fild04',  saveMap => 'geffen'},
            {lvlMin => 19, lvlMax => 25, lockMap => 'pay_fild08',  saveMap => 'payon'},
            {lvlMin => 26, lvlMax => 40, lockMap => 'pay_fild07',   saveMap => 'payon'},
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
            {lvlMin => 1 , lvlMax => 18, lockMap => 'gef_fild04',  saveMap => 'geffen'},
            {lvlMin => 19, lvlMax => 25, lockMap => 'pay_fild08',  saveMap => 'payon'},
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

