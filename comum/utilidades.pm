automacro ConfigEstáErrada {
    exclusive 1
    overrideAI 1
    priority -5
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
    JobIDNot 0
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

sub GetIndexAndEquipped {
    my ($type, $id) = @_;
    my $Item = $char->inventory->getByNameID($id);
    if ($Item eq "" ) {
        message "Erro: ou a ID do item está incorreta, ou você não possui esse equipamento.\n";
        return -1;
    }
    my $EquipIndex = $Item->{binID};
    if (exists $char->{equipment}{$type}) {
        my $equipItem = $char->{equipment}{$type};
        if ($equipItem->{nameID} == $id) {
            message "Erro: Esse equip já está equipado.\n";
            return -1;
        } else {
            return $EquipIndex;
        }
    } else {
        return $EquipIndex;
    }
}


sub GetNamenyNameID {
    my $name = $items_lut{$_[0]};
    return $name;
}

sub nextMap {
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

macro terminei QuestClasse2TManualmente {
    do conf virarClasse2T none
}

macro rebornarAgora {
    [
    log ==========================
    log Preparar para renascer
    log > Checando algumas coisas
    log ==========================
    ]
    if ($.weight == 0 && $.map == juno && $.zeny == 1285000 && $.lvl == 99 && $.joblvl == 50 ) {
         do conf -f estagio_Reborn preparando
    } else {
         log Não tem as condições necessárias para rebornar
    }
}
