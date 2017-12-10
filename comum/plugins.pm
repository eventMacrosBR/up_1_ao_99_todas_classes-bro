### Instalação e configuração do xconf
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

#Instalação e configuração do BetterShopper
sub BetterShopperConfiguratedOrNot {
    use File::Fetch;

    my ($estaNaPasta, $estaNoSys);
    my $path_bettershopper_na_pasta_plugins = "plugins/BetterShopper.pl";

    if (-e $path_bettershopper_na_pasta_plugins) {
        $estaNaPasta = 1;
    }
    else { 

        #plugin não está na pasta plugins, então é a primeira vez
		message "plugin xconf não foi encontrado, iniciando cópia.\n";

        my $bsURL = 'https://raw.githubusercontent.com/Henrybk/Plugins/master/BetterShopper/BetterShopper.pl';
        my $ff = File::Fetch->new(uri => $bsURL);
        $ff->fetch( to => 'plugins' ) or die $ff->error;
        message "BetterShopper.pl foi baixado para a pasta plugins.\n";
		$estaNaPasta = 0;
    }

    my $controlfile = Settings::getControlFilename('sys.txt');
	open(FILE, '<:encoding(UTF-8)', $controlfile);
	my @lines = <FILE>;
	close(FILE);
	chomp @lines;
	foreach my $line (@lines) {
		next if $line =~ /^$/ || $line =~ /^#/;
		if ($line =~ /bettershopper/i ) {
			$estaNoSys = 1 ;
		}
	}
	if ( $estaNoSys == 0) {
		foreach my $line (@lines) {
			next if $line =~ /^$/ || $line =~ /^#/;
			if ($line =~ /loadPlugins_list\s(.*)/ ) {
				$line = 'loadPlugins_list '.join (',',$1,"BetterShopper");
			}
		}
		open(WRITE, '>:encoding(UTF-8)', $controlfile);
		print WRITE join ("\n", @lines);
		close(WRITE);
		$estaNoSys = 0;
	}
	debug ("esta na pasta: ". ($estaNaPasta ? "sim\n" : "nao\n"));
	debug ("esta no sys: ". ($estaNoSys ? "sim\n" : "nao\n"));
	if ($estaNaPasta && $estaNoSys) {
		message "Checando algumas coisas...\nTudo certo.\n";
	}
	else {
		message "Ativando BetterShopper\n";
		Commands::run("plugin load plugins/BetterShopper.pl");
	}

}

