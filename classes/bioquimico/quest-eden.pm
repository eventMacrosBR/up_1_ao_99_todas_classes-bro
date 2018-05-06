sub inicializarParametrosQuestEden {
    my %parametrosQuestEden = (
        armaLevel26e40 => 'sabre|espada',
        armaLevel60 => 'sabre|espada',
        IDarmaIniciante => 13423, # Sabre Valhalla Iniciante
        IDarmaIntermediario => 13424, # Sabre Valhalla Intermediário
        IDarmaEden => 1391 # Machado de 2 Mãos I do Éden
    );
    my $eventMacro = $eventMacro::Data::eventMacro;
    $eventMacro->set_full_hash('parametrosQuestEden', \%parametrosQuestEden);
}

