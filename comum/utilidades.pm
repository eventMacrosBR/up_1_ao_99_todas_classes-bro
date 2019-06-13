automacro utilidades_configEstaErrada {
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
        warning ===================================
        warning = estranho, não tenho nenhuma quest eden
        warning = ativa, mas a eventMacro acha que tem
        warning = consertando isso
        warning ===================================
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
    BaseLevel != 99
    ConfigKeyNot quest_eden em_curso
    ConfigKeyNot quest_eden terminando
    ConfigKeyNot naSequenciaDeSalvamento true
    ConfigKeyNot virarClasse2 true
    ConfigKeyNot virarClasse2T true
    ConfigKeyNot virarClasse3 true
    ConfigKeyNot quest_skill true
    ConfigKeyNot esperarFazerQuest true
    ConfigKeyNot lockMap $mapa{lockMap}
    ConfigKey aeroplano1 none
    ConfigKey aeroplano2 none
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
        call irNaKafraEAbrirStorage
        if (!$.storageopen) stop
        do storage get &storage($item) $quantidade
        do storage close
        
    } else {
        [
        log ===================================
        log = Não tenho pegarNomePeloIdDoItem($item) no armazen
        log ===================================
        ]
    }
}

macro pegarDoStorageEVender {
    set exclusive 1
    $continuarLoop = 1
    while ($continuarLoop) {
        do ai manual
        @listaDeItems = criarListaDeItens("sell") #cria a array listaDeItems
        if (&config(itemsCheckWeight) != 1) do conf -f itemsCheckWeight 1
        call irNaKafraEAbrirStorage
        if (!$.storageopen) stop
        pause 2
        $temItem = 0
        if ($listaDeItems[0] = erro) stop

        $index = 0
        set macro_delay 0.3
        while ($index < @listaDeItems && $.weightpercent < 85) {
            $temItem = 1
            $qtdDoItemAtual = &storamount($listaDeItems[$index])
            do storage get &storage($listaDeItems[$index]) if ( $qtdDoItemAtual > 0)
            $index++
        }
        do storage close
        pause 1
        set macro_delay 1
        do ai on
        do autosell
        if (! $temItem) {
            [
            log ===================================
            log = Acredito que vendi todos os itens
            log = que estavam no storage mas estavam marcados
            log = pra ser vendido no npc
            log ===================================
            ]
            $continuarLoop = 0
        }
    }
    log FIM
}

# essa macro serve para tentar abrir o storage
# na kafra que está salva na config storageAuto_npc
# em caso de erro, vai tentar abrir mais duas vezes
# na terceira vez mostra um erro e para oq tava fazendo
macro irNaKafraEAbrirStorage {
    $tentativa = 0
    while ($continuarLoop || $tentativa >= 3) {
        
        $localKafra = &config(storageAuto_npc)
        do move $localKafra &rand(4,7)
        
        if (&config(master) =~ /Valhalla/ ) {
            do talknpc &arg("$localKafra", 2) &arg("$localKafra", 3) r1 r0
        } else  {
            do talknpc &arg("$localKafra", 2) &arg("$localKafra", 3) r1
        }
        
        if (!$.storageopen) {
            $tentativa++
            
            if ($tentativa >= 3) {
                [
                error ===================================
                error = acabei de executar os comandos para
                error = abrir o storage, porém o mesmo não está aberto
                error = vou parar tudo que estou fazendo
                error ===================================
                ]
                stop
            } else {
                [
                warning ===================================
                warning = tentativa $tentativa de 3 de abrir o storage
                warning = tentando denovo
                warning ===================================
                ]
            }
        } else {
            #objetivo cumprido: abrir storage
            #podemos parar o loop
            $continuarLoop = 0
        }
    }
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
}

sub pegarIndiceDoEquipamentoPeloId {
    my ($slotDoEquipamento, $id) = @_;
    message "Tentanto equipar '$items_lut{$id}' ($id)... ";

    #associar o item no inventário a uma variável
    my $item = $char->inventory->getByNameID($id);

    #checar se o item não existe no inventário
    if ($item eq "" ) {
        #checando se a id passada é uma id válida
        if ( exists $items_lut{$id} ) {
            warning "Voce nao possui esse equipamento\n";
        } else {
            error "A ID do item esta incorreta\n";
            error "ID apresentada: '$id'\n";
            error "Entre em contato com os desenvolvedores da eventMacro\n"
        }
        return -1;
    }
    #atribuindo o indice do item a uma variavel
    my $indiceDoEquip = $item->{binID};

    #checa se tem algo equipado no slot
    if (exists $char->{equipment}{$slotDoEquipamento}) {
        my $equipamento = $char->{equipment}{$slotDoEquipamento};

        #checa se o que está equipado é igual ao que estamos tentando equipar
        #o único problema desse código é que se vc tiver uma arma normal, e outra com carta
        #ele vai achar que são iguais e não vai equipar
        #mas não vai afetar essa eventMacro porque por enquanto só ta sendo usada em equips eden
        if ($equipamento->{nameID} == $id) {
            warning "Isso já está equipado.\n";
            return -1;
        
        #se o que tiver equipado for diferente do equip, então vamos equipar o que queremos
        } else {
            return $indiceDoEquip;
        }

    #Se não tiver nada equipado, significa que pode equipar
    } else {
        return $indiceDoEquip;
    }
}

#sub checarSlot(String $slotDoEquipamento)
#
#   checa se no slot especificado já tem algum item equipado ou não
#
#se tiver algo equipado, retorna "tem equip"
#senão, retorna "ta vazio"
sub checarSlot {
    my ($slotDoEquipamento) = @_;
    if (exists $char->{equipment}{$slotDoEquipamento}) {
        return "tem equip";
    } else {
        return "ta vazio";
    }
}

#sub checarSeEquipEstaEquipado(String $slotDoEquipamento, int $id)
#
#   checa se o item da id especificada está equipado no slot especificado
#
#se o item não existir no seu inventário, retorna "não existe"
#se o item existir e ele já estiver equipado, retorna "sim"
#se o item existir, mas não estiver equipado, ou não tiver nenhum equip no slot especificado, retorna "não equipado"
sub checarSeEquipEstaEquipado {
    my ($slotDoEquipamento, $id) = @_;
    my $item = $char->inventory->getByNameID($id);

    #se o item não existir no seu inventário, retorna "não existe"
    if ($item eq "" ) {
        warning "Erro: você não possui esse equipamento.\n";
        return "não existe";
    }
    my $indiceDoEquip = $item->{binID};
    if (exists $char->{equipment}{$slotDoEquipamento}) {
        my $equipamento = $char->{equipment}{$slotDoEquipamento};

        #se o item existir e ele já estiver equipado, retorna "sim"
        if ($equipamento->{nameID} == $id) {
            return "sim";
        
        #se o item existir, mas não estiver equipado, retorna "não equipado"
        } else {
            return "não equipado";
        }

    #se o item existir, mas não tiver nenhum equip no slot especificado, retorna "não equipado"
    } else {
        return "não equipado";
    }
}

#sub pegarNomeDoItemEquipado(String $slotDoEquipamento)
#
#   serve simplesmente para pegar o nome do equipamento equipado no slot especificado
#
#se tiver algo equipado no slot especificado, retorna o nome do item
#senão, retorna 0 (talvez fosse melhor retornar undef? sei lá)
sub pegarNomeDoItemEquipado {
    my ($slotDoEquipamento) = @_;
    use strict;
    if (exists $char->{equipment}{$slotDoEquipamento}) {
        return $char->{equipment}{$slotDoEquipamento}{name};
    } else {
        return 0;
    }
}

#sub pegarNomePeloIdDoItem
#
#   consegue o nome do item com a id especificada
#Se a ID existir no items.txt, retorna o nome do item
#Senão, retorna a ID de volta pra pelo menos ter algo pra mostrar
sub pegarNomePeloIdDoItem {
    my ($id) = @_;
    if (exists $items_lut{$id}) {
        return $items_lut{$id};
    } else {
        return $id;
    }
}

#sub proximoMapa 
#
#   usado para descobrir qual é o próximo mapa a se teleportar no campo de aprendiz
#   existe 5 cópias do campo de aprendiz, e cada um tem seu próprio código
#   exemplo, existe o new_1-1, e o new_2-1, que são mapas exatamente iguais
#   essa é a forma mais fácil de ir para o próximo mapa
#   se o mapa for new_5-1, aí vai para o mapa new_5-2
#   poise, é meio confuso mesmo, demorei pra entender
#
#se o mapa especificado bater com a regex, então retorna o novo mapa correto pra se teleportar
#senão, retorna 0
#note que a única forma de retornar 0 é por inadimplência do programador, então tomem cuidado
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
        error ===================================
        error = ainda não está com zero de peso
        error = impossível começar a rebornar
        error = peso: $.weight
        error = parando macro
        error ===================================
        ]
        stop
    }
    
    if ($.map =~ /yuno/) {
        log = mapa $.map, correto
    } else {
        [
        error ===================================
        error = tenho que estar em um dos seguintes mapas:
        error = yuno
        error = yuno_in01
        error = yuno_in02
        error = yuno_in05
        error = mas estou em $.map...
        error = impossível começar a rebornar
        error = parando macro
        error ===================================
        ]
        stop
    }
    
    if ($.lvl = 99) {
        log = lvl de base 99, correto
    } else {
        [
        error ===================================
        error = ainda nao estou no lvl 99 de base
        error = impossível começar a rebornar
        error = lvl de base que estou: $.lvl
        error = parando macro
        error ===================================
        ]
        stop
    }
    
    if ($.joblvl = 50) {
        log = lvl de classe 50, correto
    } else {
        [
        error ===================================
        error = ainda não estou no lvl 50 de classe
        error = impossível começar a rebornar
        error = lvl de classe que estou: $.joblvl
        error = parando a macro
        error ===================================
        ]
        stop
    }
    
    if ($.zeny = 1285000) {
        log = tenho o zeny exato necessário pra rebornar
    } elsif (($.zeny = 0 && $.map ~ yuno_in_02, yuno_in_05 ) || ($.zeny = 0 && &questStatus(1000))) {
        log = já paguei a taxa pro livro
    } else {
        [
        error ===================================
        error = não estou com a quantidade certa de zenys
        error = impossivel rebornar desse jeito
        error = quanto que tenho: $.zeny zenys
        error ===================================
        ]
        stop
    }
    log = Tudo certo :-D
    log ==========================
        
    #se chegou até aqui é porque está tudo certinho
    do conf -f questRenascer_estagio 1
}

automacro mostrarAjuda {
    ConfigKeyNot quest_eden em_curso
    ConfigKeyNot quest_eden terminando
    ConfigKeyNot naSequenciaDeSalvamento true
    ConfigKeyNot virarClasse2 true
    ConfigKeyNot virarClasse2T true
    ConfigKeyNot virarClasse3 true
    ConfigKeyNot quest_skill true
    ConfigKeyNot esperarFazerQuest true
    ConfigKey aeroplano1 none
    ConfigKey aeroplano2 none
    ConfigKey questRenascer_estagio none
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

