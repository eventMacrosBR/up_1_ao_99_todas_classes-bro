sub verificarEInstalarPlugin {
    my ($plugin) = @_;
    if (-e "plugins/$plugin.pl" || -e "plugins/$plugin/$plugin.pl") { #primeiro checa se o plugin já está na pasta plugins do opk

        $estaNoSys = 0;
        
        my $controlfile = Settings::getSysFilename();
        open(FILE, '<:encoding(UTF-8)', $controlfile);
        my @lines = <FILE>;
        close(FILE);
        chomp @lines;
        #como ele está na pasta, agora realiza a verificação se ele está ativado no sys.txt
        foreach my $line (@lines) {
            next if $line =~ /^$/ || $line =~ /^#/;
            if ($line =~ /$plugin/i ) {
                $estaNoSys = 1;
            }
        }
        #se não estiver ativado, esse código ativa o plugin no sys.txt automaticamente
        if ( !$estaNoSys ) {
            foreach my $line (@lines) {
                next if $line =~ /^$/ || $line =~ /^#/;
                if ($line =~ /loadPlugins_list\s+(.*)/ ) {
                    $line = 'loadPlugins_list '.join (',',$1,$plugin);
                }
            }
            open(WRITE, '>:encoding(UTF-8)', $controlfile);
            print WRITE join ("\n", @lines);
            close(WRITE);
            message "Ativando $plugin\n";
            Commands::run("plugin load plugins/$plugin.pl");
        } else {
            #essa mensagem aparece quando o plugin está na pasta correta, e está ativado no sys.txt
            message "Checando plugin $plugin...\nTudo certo.\n";
        }
    } else {
        #erro caso a pessoa não tiver instalado o plugin necessário para o funcionamento
        error "Plugin $plugin não está na pasta plugins\n";
        error "Por favor coloque o $plugin.pl na pasta plugins\n";
        Misc::offlineMode(); #interrompe o openkore de continuar, para que a pessoa possa ver o erro
    }
}


