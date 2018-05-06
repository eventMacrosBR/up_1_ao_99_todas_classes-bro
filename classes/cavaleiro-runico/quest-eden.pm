sub inicializarParametrosQuestEden {
    my %parametrosQuestEden = (
        armaLevel26e40 => 'espada',
        armaLevel60 => 'lança',
        IDarmaIniciante => 1192,
        IDarmaIntermediario => 1193,
        IDarmaEden => 1197
    );
    my $eventMacro = $eventMacro::Data::eventMacro;
    $eventMacro->set_full_hash('parametrosQuestEden', \%parametrosQuestEden);
}

