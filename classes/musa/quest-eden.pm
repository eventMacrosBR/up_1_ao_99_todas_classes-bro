sub inicializarParametrosQuestEden {
    my %parametrosQuestEden = (
        armaLevel26e40 => 'arco',
        armaLevel60 => 'chicote',
        IDarmaIniciante => 1747,
        IDarmaIntermediario => 1748,
        IDarmaEden => 1986
    );
    my $eventMacro = $eventMacro::Data::eventMacro;
    $eventMacro->set_full_hash('parametrosQuestEden', \%parametrosQuestEden);
}

