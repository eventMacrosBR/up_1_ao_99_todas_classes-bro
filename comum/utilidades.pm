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

automacro checkSeEstaNaQuestEden {
    exclusive 1
    QuestInactive 7128
    QuestInactive 7129
    QuestInactive 7130
    QuestInactive 7131
    QuestInactive 7138
    QuestInactive 7139
    QuestInactive 7140
    QuestInactive 7132
    QuestInactive 7141
    QuestInactive 7147
    QuestInactive 7148
    QuestInactive 7149
    QuestInactive 7150
    QuestInactive 7151
    QuestInactive 7214
    QuestInactive 7215
    QuestInactive 7216
    QuestInactive 7217
    QuestInactive 7218
    ConfigKey quest_eden em_curso
    call {
        [
        do warning ===================================
        do warning = estranho, não tenho nenhuma quest eden
        do warning = ativa, mas a eventMacro acha que tem
        do warning = consertando isso
        do warning ===================================
        ]
        do conf quest_eden none
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
        if ($.storageopen) {
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
    if ($.storageopen) {

        @listaDeItems = criarListaDeItens("sell") #cria a array listaDeItems
        if ($listaDeItems[0] = erro) stop
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
        return \@lista;
    } else {
        warning "não foi encontrado items para vender no items_control.txt";
        return "erro";
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

automacro reativarStorageAuto_maiorQuelvlSeis {
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

macro equiparSePossivel {
    $slot = $.param[0]
    $idDoEquip = $.param[1]
    $indice = pegarIndiceDoEquipamentoPeloId($slot, $idDoEquip)
    if ($indice != -1) do eq $indice
    log Sucesso.
}

sub pegarIndiceDoEquipamentoPeloId {
    my ($slotDoEquipamento, $id) = @_;
    message "Tentanto equipar '$items_lut{$id}' ($id)... ";
    my $item = $char->inventory->getByNameID($id);
    if ($item eq "" ) {
        if ( exists $items_lut{$id} ) {
            warning "Voce nao possui esse equipamento\n";
        } else {
            warning "A ID do item esta incorreta\n";
        }
        return -1;
    }
    my $indiceDoEquip = $item->{binID};
    if (exists $char->{equipment}{$slotDoEquipamento}) {
        my $equipamento = $char->{equipment}{$slotDoEquipamento};
        if ($equipamento->{nameID} == $id) {
            warning "Isso já está equipado.\n";
            return -1;
        } else {
            return $indiceDoEquip;
        }
    } else {
        return $indiceDoEquip;
    }
}

sub checarSlot {
    my ($slotDoEquipamento) = @_;
    if (exists $char->{equipment}{$slotDoEquipamento}) {
        return "tem equip";
    } else {
        return "ta vazio";
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

sub pegarNomeDoItemEquipado {
    my ($slotDoEquipamento) = @_;
    use strict;
    if (exists $char->{equipment}{$slotDoEquipamento}) {
        my $equipamento = $char->{equipment}{$slotDoEquipamento};
        return $equipamento->{name};
    } else {
        return 0;
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
        log = yuno_in01
        log = yuno_in02
        log = yuno_in05
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
    
    if ($.zeny = 1285000) {
        log = tenho o zeny exato necessário pra rebornar
    } elsif (($.zeny = 0 && $.map ~ yuno_in_02, yuno_in_05 ) || ($.zeny = 0 && &questStatus(1000))) {
        log = já paguei a taxa pro livro
    } else {
        [
        log ===================================
        log = não estou com a quantidade certa de zenys
        log = impossivel rebornar desse jeito
        log ===================================
        ]
        stop
    }
    log ==========================
        
    #se chegou até aqui é porque está tudo certinho
    do conf -f questRenascer_estagio 1
}

automacro mostrarAjuda {
    timeout 600 #10 minutos
    BaseLevel > 0
    exclusive 1
    priority 9999999 #menor prioridade
    call ajuda
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
        warning ===========================================
        warning Informações uteis para reportar um problema
        warning -------------------------------------------
        warning versão: &config(versao_eventmacro_up_todas_as_classes_bro)
        warning Level: $.lvl/$.joblvl
        warning JobID: $jobID
        warning O que estava fazendo: &config(o_que_estou_fazendo)
        warning Mapa: $.map $.pos
        warning Ultima automacro: $.caller
        warning ==========================================
    ]
}

sub desequipar {
    my $tipo = shift;
    if (exists $char->{equipment}{$tipo}) {
        $char->{equipment}{$tipo}->unequip();
    } else {
        message "Não tem nada equipado em $type\n";
    }
}

