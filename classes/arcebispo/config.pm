sub configurarBuild {
    my %configsBuild = (
        skillsAprendiz => 'NV_BASIC 9',
        skillsClasse1 => 'AL_HEAL 10, AL_INCAGI 10, AL_DP 3, AL_ANGELUS 5, AL_DP 6, AL_BLESSING 5, AL_ANGELUS 10, AL_BLESSING 10, AL_RUWACH 1, AL_HOLYWATER 1, AL_PNEUMA 1',
        skillsClasse2 => 'PR_KYRIE 4, PR_MAGNIFICAT 5, PR_GLORIA 5, PR_STRECOVERY 1, PR_KYRIE 10, PR_IMPOSITIO 5, PR_SANCTUARY 10, MG_SRECOVERY 4, ALL_RESURRECTION 4, MG_SRECOVERY 9',
        skillsClasse1T => 'AL_HEAL 10, AL_INCAGI 10, AL_DP 3, AL_ANGELUS 5, AL_DP 5, AL_BLESSING 5, AL_ANGELUS 10, AL_BLESSING 10, AL_RUWACH 1, AL_HOLYWATER 1, AL_PNEUMA 1, AL_DECAGI 1',
        skillsClasse2T => 'PR_KYRIE 4, PR_MAGNIFICAT 5, PR_GLORIA 3, PR_STRECOVERY 1, PR_KYRIE 10, PR_IMPOSITIO 3, PR_SANCTUARY 7, MG_SRECOVERY 5, ALL_RESURRECTION 4, PR_LEXDIVINA 5, PR_LEXAETERNA 1, HP_MEDITATIO 10, PR_ASPERSIO 4, MG_SAFETYWALL 8, PR_REDEMPTIO 1',
        skillsClasse3 => 'AB_CHEAL 3, AB_CANTO 3, AB_CLEMENTIA 3, AB_PRAEFATIO 10, AB_RENOVATIO 1, AB_HIGHNESSHEAL 5, AB_OFFERTORIUM 5',
        statsPadrao => '10 vit, 20 int, 15 dex, 20 vit, 25 dex, 30 int, 30 vit, 35 dex, 40 int, 45 vit, 50 int, 40 dex, 60 int, 75 vit, 95 int, 56 dex',
        statsPadraoTransclasse => '10 vit, 20 int, 15 dex, 20 vit, 25 dex, 30 int, 30 vit, 35 dex, 40 int, 45 vit, 50 int, 40 dex, 60 int, 75 vit, 95 int, 56 dex'
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
        {lvlMin => 26, lvlMax => 40, lockMap => 'pay_fild07',  saveMap => 'payon'},
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

