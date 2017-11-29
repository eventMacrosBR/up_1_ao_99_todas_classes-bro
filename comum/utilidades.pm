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

sub pegarID {
    return $char->{jobID};
}

sub xConfConfiguratedOrNot {
	use File::Copy;
	
	my ($estaAtualizado, $estaNaPasta, $estaNoSys);
	my $path_xconf_na_pasta_plugins = "plugins/xconf.pl";
	my $path_xconf_na_pasta_needsreview = "plugins/needs-review/xconf/trunk/xconf.pl";
	
	if (-e $path_xconf_na_pasta_plugins) {
		$estaNaPasta = 1;
		open (my $xconf_na_pasta_plugins, "<:utf8", $path_xconf_na_pasta_plugins);
		
		my @linhas = <$xconf_na_pasta_plugins>;
		close ($xconf_na_pasta_plugins);
		chomp @linhas;
		
		foreach my $linha (@linhas) {
			if ($linha =~ /^use utf8;/) {
				$estaAtualizado = 1;
				last;
			}
		}
	} 
	else {
		#plugin não está na pasta plugins, então é a primeira vez
		message "plugin xconf não foi encontrado, iniciando cópia.\n";
		copy("$path_xconf_na_pasta_needsreview", "plugins") or die "Copia falhou: $!";
		message "xconf.pl foi copiado para a pasta plugins.\n";
		$estaNaPasta = 0;
	}

	if ($estaNaPasta && not $estaAtualizado) {
		message "Plugin xConf foi encontrado, porém está desatualizado.\n";
		message "Removendo xconf obsoleto e Iniciando atualização...\n";
		unlink $path_xconf_na_pasta_plugins;
		copy("$path_xconf_na_pasta_needsreview", "plugins") or die "Copia falhou: $!";
		message "xconf.pl foi copiado para a pasta plugins.\n";
		$estaNaPasta = 0;
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
		}
	}
	if ( $estaNoSys == 0) {
		foreach my $line (@lines) {
			next if $line =~ /^$/ || $line =~ /^#/;
			if ($line =~ /loadPlugins_list\s(.*)/ ) {
				$line = 'loadPlugins_list '.join (',',$1,"xconf");
			}
		}
		open(WRITE, '>:encoding(UTF-8)', $controlfile);
		print WRITE join ("\n", @lines);
		close(WRITE);
		$estaNoSys = 0;
	}
	debug ("esta na pasta: ". ($estaNaPasta ? "sim\n" : "nao\n"));
	debug ("esta atualizado: ". ($estaAtualizado ? "sim\n" : "nao\n"));
	debug ("esta no sys: ". ($estaNoSys ? "sim\n" : "nao\n"));
	if ($estaNaPasta && $estaNoSys && $estaAtualizado) {
		message "Checando algumas coisas...\nTudo certo.\n";
	}
	else {
		message "Ativando xConf\n";
		Commands::run("plugin load plugins/xconf.pl");
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

