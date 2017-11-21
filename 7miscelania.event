automacro parandoDePegarPotDeAprendiz {
	InInventoryID 569 < 1
	InStorageID 569 < 1
	ConfigKey getAuto_0 Poção de Aprendiz
	exclusive 1
	call {
		log as poções de aprendiz acabaram, removendo o getAuto
		do conf getAuto_0 none
		do conf sitAuto_hp_upper 95
	}
}

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

macro voltarAtacar {
	[
	do conf route_randomWalk 1
	do conf attackAuto 2
	]
}

automacro checarNoInicio {
	BaseLevel > 0
	priority -50 #muito alta
	run-once 1
	exclusive 1
	call {
		xConfConfiguratedOrNot()
	}
}

sub xConfConfiguratedOrNot {
	my $path = "plugins/xconf.pl";
	my $estaNoSys;
	my $obsoletoRemovido;

	if (-e $path ) {
		unlink $path; #deletando arquivo xconf, que está obsoleto
		message "Removendo xconf obsoleto.\n";
		$obsoletoRemovido = 1;
	}
	my $controlfile = Settings::getControlFilename('sys.txt');
	open(FILE, '<:encoding(UTF-8)', $controlfile);
	my @lines = <FILE>;
	close(FILE);
	chomp @lines;
	foreach my $line (@lines) {
		next if $line =~ /^$/ || $line =~ /^#/;
		if ($line =~ /xconf/ ) {
			$estaNoSys = 1 ;
			last;
		}
	}
	if ( !$estaNoSys ) {
		foreach my $line (@lines) {
			next if $line =~ /^$/ || $line =~ /^#/;
			if ($line =~ /loadPlugins_list\s(.*)/ ) {
				$line = 'loadPlugins_list '.join (',',$1,"xconf");
				last;
			}
		}
		open(WRITE, '>:encoding(UTF-8)', $controlfile);
		print WRITE join ("\n", @lines);
		close(WRITE);
		$estaNoSys = 0;
	}
	if ($obsoletoRemovido && $estaNoSys) {
		#precisamos recarregar o plugin, pra ele perceber que o arquivo nao existe mais
		Commands::run("plugin reload xconf");
		message "Atualizando plugin xConf...\n";
		Commands::run("plugin load plugins/needs-review/xconf/trunk/xconf.pl");
		message "plugin atualizado.\n"
	} elsif ($obsoletoRemovido && !$estaNoSys) {
		message "Ativando plugin xConf...\n";
		Commands::run("plugin load plugins/needs-review/xconf/trunk/xconf.pl");
		message "xConf ativado.\n"
	}
	if ($estaNoSys) {
	 	message "Checando algumas coisas...\nTudo certo.\n";
	} else {
	 	message "Ativando xConf...\n";
		Commands::run("plugin load plugins/needs-review/xconf/trunk/xconf.pl");
		message "xConf ativado.\n;"
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
