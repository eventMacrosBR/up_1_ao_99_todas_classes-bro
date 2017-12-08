sub initParamsQuestEden {
    my %paramsQuestEden = (
        armaLevel26e40 => 'espada',
        armaLevel60 => 'lança'
        IDarmaIniciante => 1192
		IDarmaIntermediario => 1193
		IDarmaEden => 1197
    );
    my $eventMacro = $eventMacro::Data::eventMacro;
    $eventMacro->set_full_hash('paramsQuestEden', \%paramsQuestEden);
}

