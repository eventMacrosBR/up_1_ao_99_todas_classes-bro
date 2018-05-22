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

