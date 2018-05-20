sub inicializarParametrosQuestEden {
    my %parametrosQuestEden = (
        armaLevel26e40 => '',
        armaLevel60 => '',
        IDarmaIniciante => 0,
        IDarmaIntermediario => 0,
        IDarmaEden => 0
    );
    my $eventMacro = $eventMacro::Data::eventMacro;
    $eventMacro->set_full_hash('parametrosQuestEden', \%parametrosQuestEden);
}

