sub verificarEInstalarPlugin {
    my ($plugin) = @_;
    if (-e "plugins/$plugin.pl") {

        $estaNoSys = 0;
        
        my $controlfile = Settings::getSysFilename();
        open(FILE, '<:encoding(UTF-8)', $controlfile);
        my @lines = <FILE>;
        close(FILE);
        chomp @lines;
        foreach my $line (@lines) {
            next if $line =~ /^$/ || $line =~ /^#/;
            if ($line =~ /$plugin/i ) {
                $estaNoSys = 1;
            }
        }
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
            message "Checando plugin $plugin...\nTudo certo.\n";
        }
    } else {
        error "Plugin $plugin não está na pasta plugins\n";
        error "Por favor coloque o $plugin.pl na pasta plugins\n";
        Misc::offlineMode();
    }
}


