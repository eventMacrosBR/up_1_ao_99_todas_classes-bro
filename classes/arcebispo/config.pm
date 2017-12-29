sub configurarBuild {
    my %configsBuild = (
        skillsAprendiz => 'NV_BASIC 9',
        skillsClasse1 => 'AL_HEAL 10, AL_INCAGI 10, AL_DP 3, AL_BLESSING 10, AL_ANGELUS 10, AL_DP 3, AL_RUWACH 1, AL_HOLYWATER 1, AL_PNEUMA 1',
        skillsClasse2 => '',
        skillsClasse1T => '',
        skillsClasse2T => '',
        skillsClasse3 => '',
        statsPadrao => '10 vit, 20 int, 15 dex, 20 vit, 25 dex, 30 int, 30 vit, 35 dex, 40 int, 40 vit, 50 int, 40 dex, 60 int'
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

