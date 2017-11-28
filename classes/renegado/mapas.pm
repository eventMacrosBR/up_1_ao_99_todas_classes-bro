sub extrairMapasDeUp {
	my ($lvl) = @_;
	my $variaveisDeUp;
	
	#########################################################################
	#AQUI É DEFINIDO OS MAPAS QUE CADA CLASSE IRÁ UPAR, DE MODO 
	#QUE SEJA EXTREMAMENTE FÁCIL DE ALTERAR A SEU GOSTO
	#A ÚNICA REGRA QUE VC DEVE OBEDECER, É QUE O LVL MAX DE
	#UMA LINHA NAO PODE SER
	#IGUAL AO LVL MIN DE OUTRA LINHA (EM CADA CLASSE)
	#EXEMPLO: 
	#lvlMin => 11 , lvlMax => 22
	#lvlMin => 22 , lvlMax => 30
	#NÃO PODE 
	########################################################################

    $variaveisDeUp = 
    [
        {lvlMin => 1 , lvlMax => 11, lockMap => pay_fild01, saveMap => payon},
        {lvlMin => 12, lvlMax => 25, lockMap => pay_fild08, saveMap => payon},
        {lvlMin => 26, lvlMax => 40, lockMap => pay_dun00,  saveMap => payon},
        {lvlMin => 41, lvlMax => 45, lockMap => pay_fild09, saveMap => payon},
        {lvlMin => 46, lvlMax => 53, lockMap => iz_dun00,   saveMap => izlude},
        {lvlMin => 54, lvlMax => 59, lockMap => iz_dun02,   saveMap => izlude},
        {lvlMin => 60, lvlMax => 70, lockMap => moc_fild17, saveMap => morocc},
        {lvlMin => 71, lvlMax => 79, lockMap => mjolnir_11, saveMap => prontera},
        {lvlMin => 80, lvlMax => 98, lockMap => gef_fild06, saveMap => geffen},
    ]
	
	
	foreach my $configs (@{$variaveisDeUp}) {
		#mensagem para debug
		#warning "lvl min: " . $configs->{lvlMin}.' '. "lvl max: " . $configs->{lvlMax}."\n";
		if ($lvl ~~ [$configs->{lvlMin}..$configs->{lvlMax}]) {  #checa em qual "grupo" (de lvlMin e lvlMax) seu nivel se encaixa
			return $configs->{lockMap} . ':' . $configs->{saveMap};
		}	
	}
	
	return -1;
}