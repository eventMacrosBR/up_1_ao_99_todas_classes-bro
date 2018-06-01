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
        # esse código supostamente não pode acontecer, porque antes de chama essa macro
        # já é tetado se tem o item no storage, e essa checagem é feita denovo só por precaução
        [
        log ===================================
        log = bugs e mais bugs!!!!
        log = essa mensagem nao deveria aparecer
        log = código do erro: eu sei lá, seu openkore é bugado
        log ===================================
        ]
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
    [
    log ==========================
    log =Preparar para renascer
    log =Checando algumas coisas
    log ==========================
    ]
    if ($.weight == 0 && $.map == juno && $.zeny == 1285000 && $.lvl == 99 && $.joblvl == 50 ) {
         do conf -f questRenascer_estagio preparando
    } else {
         log Não tem as condições necessárias para rebornar
    }
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
    log     eventMacro aeroplano_junoPara izlude|rachel|hugel|lighthalzen|einbroch
    log     eventMacro aeroplano_einbrochPara izlude|rachel|hugel|lighthalzen|juno
    log     eventMacro aeroplano_junoPara izlude|hugel|lighthalzen|juno|einbroch
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

