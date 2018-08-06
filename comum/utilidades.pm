automacro utilidades_configEstaErrada {
    exclusive 1
    overrideAI 1
    priority -5
    ConfigKey questRenascer_estagio none
    ConfigKeyNot autoTalkCont 1
    call {
        log Tem uma config que está errada
        log A config é $.ConfigKeyNotLastKey
        log O valor que quero é $.ConfigKeyNotLastWantedValue
        log Mas o valor atual é $.ConfigKeyNotLastKeyValue
        log Mudando valor da config $.ConfigKeyNotLastKey de $.ConfigKeyNotLastKeyValue para $.ConfigKeyNotLastWantedValue
        do conf $.ConfigKeyNotLastKey $.ConfigKeyNotLastWantedValue
    }
}

macro pararDeAtacar {
    [
    do conf route_randomWalk 0
    do conf attackAuto 1
    ]
}

automacro reloadPortals {
    exclusive 1
    timeout 300
    ConfigKey questRenascer_estagio none
    JobIDNot 0 #Aprendiz
    JobIDNot 4023 #Baby Aprendiz
    call {
        do reload portals
    }
}

macro pararDeAtacarApenasCorrer {
    [
    do conf route_randomWalk 0
    do conf attackAuto -1
    ]
}

macro voltarAtacar {
    [
    do conf route_randomWalk 1
    do conf attackAuto 2
    ]
}

#coloque esse if dentro da macro que tiver checando o item
#substitua item pelo item que quer, e o número 5 pela quantidade que precisa
#   if (&storamount(ITEM) > 0 && &invamount(ITEM) < 5) {
#       log tenho que ir no armazem pegar
#       call checarSeArmazenJaFoiAberto
#       call pegarItemDoArmazenSeTiver "NOME" "5"
#   }

macro checarSeArmazenJaFoiAberto {

    $armazemJaFoiAberto = armazemJaFoiAberto()
    if ($armazemJaFoiAberto = nao) {
        log armazém ainda não foi inicializado, indo lá!
        do autostorage
    } else {
        log armazém já foi aberto uma vez nessa sessão, então tá de boas
    }
}

macro pegarItemDoArmazenSeTiver {
    $item = $.param[0]
    $quantidade = $.param[1]
    
    #Verificar se armazenamento já foi aberto antes de começar
    call checarSeArmazenJaFoiAberto

    #checando duas vezes se tem o item mesmo no storage
    if (&storamount($item) > 0) {
        $localDaKafra = &config(storageAuto_npc)
        do move $localDaKafra &rand(3,8)
        do talknpc &arg("$localDaKafra", 2) &arg("$localDaKafra", 3) r1
        if ($.storageopen = 1) {
            do storage get &storage($item) $quantidade
            do storage close
        } else {
            log o storage deveria estar aberto agora, mas não está
            muita treta vixi
        }
    } else {
        [
        log ===================================
        log = Não tenho o item :/
        log ===================================
        ]
    }
}

macro pegarDoStorageEVender {
    set exclusive 1
    do ai manual
    if (&config(itemsCheckWeight) != 1) do conf -f itemsCheckWeight 1
    $localKafra = &config(storageAuto_npc)
    do move $localKafra &rand(4,7)
    do talknpc &arg("$localKafra", 2) &arg("$localKafra", 3) r1
    pause 2
    if ($.storageopen = 1) {

        criarListaDeItens("sell") #cria a array listaDeItems        
        $cont = 0
        while ($cont < @listaDeItems  && $.weightpercent < 85) {
            $qtdDoItemAtual = &storamount($listaDeItems[$cont])
            do storage get &storage($listaDeItems[$cont]) if ( $qtdDoItemAtual > 0) 
            $cont++
        }
        do storage close
        pause 1
        ai on
        do autosell
    } else {
        log o strorage deveria estar aberto agora, mas não está
        log muita treta vish
    }
    log FIM
}

sub criarListaDeItens {
    my ($option) = @_; 
    my @lista;
    #warning "option is $option\n";
    foreach $key ( keys %items_control ) {
        if ($items_control{$key}{$option}) {
            #warning "da pra vender $key\n";
            push @lista, $key;
        }
    }

    if (@lista) {    
        my $eventMacro = $eventMacro::Data::eventMacro;
        $eventMacro->set_full_array('listaDeItems', \@lista);
    } else {
        warning "não foi encontrado items para vender no items_control.txt"
    }
}

sub armazemJaFoiAberto {
    return $char->storage->wasOpenedThisSession() ? "sim" : "nao";
}

automacro desativarStorageAuto_lvlAbaixodeSeis {
    SkillLevel NV_BASIC < 6
    exclusive 1
    JobID 4001 #aprendiz trans
    ConfigKeyNot storageAuto 0
    call {
        log =============================
        log = desativando storageAuto, porque
        log = nem posso usar ainda, lvl baixo demais
        log =============================
        do conf storageAuto 0
    }
}

automacro reativarStorageAuto_maisQuelvlSeis {
    exclusive 1
    SkillLevel NV_BASIC >= 6
    ConfigKeyNot storageAuto 1
    JobID 4001 #aprendiz trans
    call {
        log ================================
        log = reativando storageAuto, já posso usar
        log ================================
        do conf storageAuto 1
    }
}

sub pegarID {
    return $char->{jobID};
}

sub checarSeExisteNoConfig {
    my ($key) = @_;
    if (exists $config{$key}) {
        return "sim";
    } else {
        return "nao";
    }
}

sub pegarConfigItemsControl {
    my ($item, $info) = @_;
    if ($items_control{$item}{$info}) {
        return $items_control{$item}{$info};
    } else {
        return -1;
    }
}

sub pegarIndiceDoEquipamentoPeloId {
    my ($slotDoEquipamento, $id) = @_;
    my $item = $char->inventory->getByNameID($id);
    if ($item eq "" ) {
        warning "Erro: ou a ID do item está incorreta, ou você não possui esse equipamento.\n";
        return -1;
    }
    my $indiceDoEquip = $item->{binID};
    if (exists $char->{equipment}{$slotDoEquipamento}) {
        my $equipamento = $char->{equipment}{$slotDoEquipamento};
        if ($equipamento->{nameID} == $id) {
            warning "Erro: Esse equip já está equipado.\n";
            return -1;
        } else {
            return $indiceDoEquip;
        }
    } else {
        return $indiceDoEquip;
    }
}

sub checarSeEquipEstaEquipado {
    my ($slotDoEquipamento, $id) = @_;
    my $item = $char->inventory->getByNameID($id);
    if ($item eq "" ) {
        warning "Erro: você não possui esse equipamento.\n";
        return "não existe";
    }
     my $indiceDoEquip = $item->{binID};
    if (exists $char->{equipment}{$slotDoEquipamento}) {
        my $equipamento = $char->{equipment}{$slotDoEquipamento};
        if ($equipamento->{nameID} == $id) {
            return "sim";
        } else {
            return "não equipado";
        }
    } else {
        return "não equipado";
    }
}


sub pegarNomePeloIdDoItem {
    my $name = $items_lut{$_[0]};
    return $name;
}

sub proximoMapa {
    my $map = $_[0];
    if ($map =~ /^new_(\d)-(\d)$/) {
    return "new_".$1."-".($2+1);
    } else {
        return 0;
    }
}

macro termineiQuestEdenManualmente {
    do conf quest_eden none
}

macro termineiQuestSkillManualmente {
    do conf quest_skill none
}

macro termineiQuestClasse2Manualmente {
    do conf virarClasse2 none
}

macro termineiQuestClasse2TManualmente {
    do conf virarClasse2T none
}

macro rebornarAgora {
    log ==========================
    log =Preparar para renascer
    log =Checando algumas coisas
    
    if ($.weight < 1) {
        log = peso zero, correto
    } else {
        [
        log ===================================
        log = ainda não está com zero de peso
        log = impossível começar a rebornar
        log = peso: $.weight
        log = parando macro
        log ===================================
        ]
        stop
    }
    
    if ($.map =~ /yuno/) {
        log = mapa $.map, correto
    } else {
        [
        log ===================================
        log = tenho que estar em um dos seguintes mapas:
        log = yuno
        log = yuno_in_01
        log = yuno_in_02
        log = yuno_in_05
        log = mas estou em $.map...
        log = impossível começar a rebornar
        log = parando macro
        log ===================================
        ]
        stop
    }
    
    if ($.lvl = 99) {
        log = lvl de base 99, correto
    } else {
        [
        log ===================================
        log = ainda nao estou no lvl 99 de base
        log = impossível começar a rebornar
        log = lvl de base que estou: $.lvl
        log = parando macro
        log ===================================
        ]
        stop
    }
    
    if ($.joblvl = 50) {
        log = lvl de classe 50, correto
    } else {
        [
        log ===================================
        log = ainda não estou no lvl 50 de classe
        log = impossível começar a rebornar
        log = lvl de classe que estou: $.joblvl
        log = parando a macro
        log ===================================
        ]
        stop
    }
    log ==========================
        
    #se chegou até aqui é porque está tudo certinho
    do conf -f questRenascer_estagio 1
}

macro ajuda {
    [
    log ==========================
    log Menu de ajuda da Macro
    log ==========================
    log Comandos em caso de bug em alguma quest:
    log     eventMacro termineiQuestEdenManualmente
    log     eventMacro termineiQuestSkillManualmente
    log     eventMacro termineiQuestClasse2Manualmente
    log     eventMacro termineiQuestClasse2TManualmente
    log Comando para controlar o modo de ataque do bot
    log     eventMacro pararDeAtacar
    log     eventMacro pararDeAtacarApenasCorrer
    log     eventMacro voltarAtacar
    log Comandos para utilizar o Aeroplano
    log     eventMacro aeroplano_junoPara izlude OU rachel OU hugel OU lighthalzen OU einbroch
    log     eventMacro aeroplano_einbrochPara izlude OU rachel OU hugel OU lighthalzen OU juno
    log     eventMacro aeroplano_junoPara izlude OU hugel OU lighthalzen OU juno OU einbroch
    log Comando para pegar do storage itens que deveria vender no npc, e vender
    log     eventMacro pegarDoStorageEVender
    log     Obs: Lembrando que ele só vende items que estiver marcado pra vender no items_control
    log Comando para debug
    log     eventMacro status
    log     eventMacro informacoes
    ]
}

macro informacoes {
    $jobID = pegarID()
    [
        log ===========================================
        log Informações uteis para reportar um problema
        log -------------------------------------------
        log versão: &config(versao_eventmacro_up_todas_as_classes_bro)
        log Level: $.lvl/$.joblvl
        log JobID: $jobID
        log O que estava fazendo: &config(o_que_estou_fazendo)
        log Mapa: $.map $.pos
        log Ultima automacro: $.caller
        log ==========================================
    ]
}

automacro sairDeMocFild20 {
    InMap moc_fild20
    exclusive 1
    call {
        do move 38 183 &rand(2,4)
        do talknpc 38 183 r2
    }
}

sub desequipar {
    my $tipo = shift;
    if (exists $char->{equipment}{$tipo}) {
        $char->{equipment}{$tipo}->unequip();
    } else {
        message "Não tem nada equipado em $type\n";
    }
}

