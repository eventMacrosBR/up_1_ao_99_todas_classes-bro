sub configurarBuild {
    my %configsBuild = (
        skillsAprendiz => 'NV_BASIC 9',
        skillsClasse1 => 'MC_INCCARRY 10, MC_DISCOUNT 10, MC_PUSHCART 10, MC_OVERCHARGE 9, MC_VENDING 10, MC_IDENTIFY 1,',
        skillsClasse2 => 'BS_HAMMERFALL 5, BS_ADRENALINE 5, BS_OVERTHRUST 5, BS_HILTBINDING 1, BS_WEAPONRESEARCH 2, BS_WEAPONPERFECT 3, BS_MAXIMIZE 5,',
        skillsClasse1T => '-1',
        skillsClasse2T => '-1',
        skillsClasse3 => '-1',
        statsPadrao => '15 agi, 10 str, 10 vit, 10 dex, 20 agi, 20 dex, 20 str, 30 dex, 45 agi, 40 dex, 60 agi, 20 vit, 70 agi, 50 dex, 30 str, 80 agi, 40 str, 90 agi, 50 vit, 50 str, 42 luk',
        statsPadraoTransclasse => '15 agi, 10 str, 10 vit, 10 dex, 5 luk, 25 agi, 20 str, 25 vit, 20 dex, 10 luk, 35 agi, 30 str, 30 dex, 20 luk, 50 str, 50 vit, 45 agi, 75 str, 60 agi, 34 vit, 80 agi',
        statsPadraoClasse3 => '-1',
        lvlClasseParaVirarClasse2 => '50',
        lvlClasseParaVirarClasse2T => '50'
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
    } else {
        $variaveisDeUp =
        # AQUI SÃO OS MAPAS DE UP ATÉ 99, DEPOIS DE REBORNAR
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