
sub configurarBuild {
    my %configsBuild = (
        skillsAprendiz => 'NV_BASIC 9',
        skillsClasse1 => 'SM_RECOVERY 10, SM_PROVOKE 9, SM_BASH 10, SM_ENDURE 10, SM_MAGNUM 10',
        skillsClasse2 => 'CR_TRUST 7, CR_HOLYCROSS 10, AL_CURE 1, KN_RIDING 1, KN_CAVALIERMASTERY 5, KN_SPEARMASTERY 10, AL_DP 3, AL_DEMONBANE 5, CR_TRUST 10, AL_HEAL 5',
        skillsClasse1T => 'SM_RECOVERY 10, SM_PROVOKE 9, SM_BASH 10, SM_ENDURE 10, SM_MAGNUM 10',
        skillsClasse2T => 'KN_RIDING 1, KN_CAVALIERMASTERY 5, KN_SPEARMASTERY 10, CR_SPEARQUICKEN 5, CR_TRUST 7, CR_HOLYCROSS 6, CR_TRUST 10, CR_GRANDCROSS 5, CR_AUTOGUARD 5, CR_SHIELDCHARGE 3, CR_SHIELDBOOMERANG 3, CR_REFLECTSHIELD 5, CR_DEVOTION 3, PA_SACRIFICE 5, CR_DEFENDER 5',
        skillsClasse3 => '-1',
        statsPadrao => '10 dex, 15 agi, 20 dex, 20 agi, 20 str, 30 dex, 30 str, 40 dex, 20 vit, 40 str, 60 dex, 50 str, 20 int, 65 str, 40 int, 70 dex, 40 vit, 50 int, 75 dex, 60 int, 80 dex, 70 int',
        statsPadraoTransclasse => '10 dex, 15 agi, 20 dex, 20 agi, 20 str, 30 dex, 30 str, 40 dex, 20 vit, 40 str, 60 dex, 50 str, 20 int, 65 str, 40 int, 70 dex, 40 vit, 50 int, 75 dex, 60 int, 80 dex, 70 int',
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
            {lvlMin => 1 , lvlMax => 11, lockMap => 'prt_fild08', saveMap => 'izlude'},
            {lvlMin => 12, lvlMax => 25, lockMap => 'pay_fild08', saveMap => 'payon'},
            {lvlMin => 26, lvlMax => 40, lockMap => 'pay_dun00',  saveMap => 'payon'},
            {lvlMin => 41, lvlMax => 45, lockMap => 'pay_fild09', saveMap => 'payon'},
            {lvlMin => 46, lvlMax => 53, lockMap => 'iz_dun00',   saveMap => 'izlude'},
            {lvlMin => 54, lvlMax => 59, lockMap => 'iz_dun02',   saveMap => 'izlude'},
            {lvlMin => 60, lvlMax => 70, lockMap => 'moc_fild17', saveMap => 'morocc'},
            {lvlMin => 71, lvlMax => 74, lockMap => 'mjolnir_11', saveMap => 'prontera'},
            {lvlMin => 75, lvlMax => 98, lockMap => 'gl_church',  saveMap => 'geffen'}
        ];
    } else {
        $variaveisDeUp =
        # AQUI SÃO OS MAPAS DE UP ATÉ 99, DEPOIS DE REBORNAR
            [
            {lvlMin => 1 , lvlMax => 11, lockMap => 'prt_fild08', saveMap => 'izlude'},
            {lvlMin => 12, lvlMax => 25, lockMap => 'pay_fild08', saveMap => 'payon'},
            {lvlMin => 26, lvlMax => 40, lockMap => 'pay_dun00',  saveMap => 'payon'},
            {lvlMin => 41, lvlMax => 45, lockMap => 'pay_fild09', saveMap => 'payon'},
            {lvlMin => 46, lvlMax => 53, lockMap => 'iz_dun00',   saveMap => 'izlude'},
            {lvlMin => 54, lvlMax => 59, lockMap => 'iz_dun02',   saveMap => 'izlude'},
            {lvlMin => 60, lvlMax => 70, lockMap => 'moc_fild17', saveMap => 'morocc'},
            {lvlMin => 71, lvlMax => 74, lockMap => 'mjolnir_11', saveMap => 'prontera'},
            {lvlMin => 75, lvlMax => 98, lockMap => 'gl_church',  saveMap => 'geffen'}
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
        pontoDeEncontroX => '145..147',
        pontoDeEncontroY => '115..117'
    );
    return \%parametrosQuestClasseRenascer;
}

