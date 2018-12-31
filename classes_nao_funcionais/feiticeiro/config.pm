
sub configurarBuild {
    my %configsBuild = (
        skillsAprendiz => 'NV_BASIC 9',
        skillsClasse1 => 'MG_SRECOVERY 1, MG_FIREBOLT 3, MG_LIGHTNINGBOLT 3, MG_COLDBOLT 3, MG_NAPALMBEAT 4, MG_SOULSTRIKE 7, MG_COLDBOLT 5, MG_FIREBOLT 8, MG_LIGHTNINGBOLT 5, MG_SOULSTRIKE 10, MG_COLDBOLT 10, MG_LIGHTNINGBOLT 10, MG_FIREBOLT 10, MG_SIGHT 1',
        skillsClasse2 => 'SA_ADVANCEDBOOK 2, SA_CASTCANCEL 1, SA_FREECAST 4, SA_SEISMICWEAPON 5, WZ_EARTHSPIKE 5, SA_MAGICROD 3, SA_SPELLBREAKER 3, SA_DISPELL 5, SA_FROSTWEAPON 5, SA_LIGHTNINGLOADER 4, SA_FLAMELAUNCHER 5, SA_DELUGE 3, SA_VIOLENTGALE 3, SA_VOLCANO 3, SA_LANDPROTECTOR 2',
        skillsClasse1T => 'MG_FIREBOLT 1, MG_COLDBOLT 5, MG_SRECOVERY 8, MG_LIGHTNINGBOLT 1, MG_NAPALMBEAT 7, MG_SOULSTRIKE 5, MG_FROSTDIVER 1, MG_SIGHT 1, MG_STONECURSE 10, MG_SAFETYWALL 10',
        skillsClasse2T => 'SA_ADVANCEDBOOK 9, SA_DRAGONOLOGY 4, SA_CASTCANCEL 1, SA_FREECAST 1, SA_SEISMICWEAPON 5, WZ_EARTHSPIKE 5, SA_MAGICROD 3, SA_SPELLBREAKER 3, SA_DISPELL 5, SA_FROSTWEAPON 5, SA_LIGHTNINGLOADER 4, SA_FLAMELAUNCHER 5, SA_DELUGE 3, SA_VIOLENTGALE 3, SA_VOLCANO 3, PF_FOGWALL 1, SA_LANDPROTECTOR 2, PF_SPIDERWEB 1, PF_SOULCHANGE 1, PF_HPCONVERSION 5',
        skillsClasse3 => '-1',
        statsPadrao => '70 int, 50 agi, 80 agi, 80 int, 99 agi, 99 int',
        statsPadraoTransclasse => '60 int, 60 dex, 40 vit, 20 luk, 80 int, 80 dex, 94 int, 92 dex, 43 vit, 2 str',
        statsPadraoClasse3 => '60 int, 60 dex, 40 vit, 20 luk, 80 int, 80 dex, 100 int, 100 dex, 70 vit, 20 str, 45 luk, 100 vit, 120 int, 120 vit, 85 luk'
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
        # AQUI SÃO OS MAPAS DE UP ATÉ 99, ANTES DE REBORNAR
        [
        {lvlMin => 1 , lvlMax => 15, lockMap => 'gef_fild04',  saveMap => 'geffen'},
        {lvlMin => 16, lvlMax => 25, lockMap => 'pay_fild08',  saveMap => 'payon'}, #matar esporo one hit, tenho que lembrar de não castar em rabo de verme
        {lvlMin => 26, lvlMax => 40, lockMap => 'pay_dun01',  saveMap => 'payon'}, #já vai ter napalm beat, dá pra matar bem
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
            {lvlMin => 1 , lvlMax => 15, lockMap => 'gef_fild04',  saveMap => 'geffen'},
            {lvlMin => 16, lvlMax => 25, lockMap => 'pay_fild08',  saveMap => 'payon'}, #matar esporo one hit, tenho que lembrar de não castar em rabo de verme
            {lvlMin => 26, lvlMax => 40, lockMap => 'pay_dun01',  saveMap => 'payon'}, #já vai ter napalm beat, dá pra matar bem
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

