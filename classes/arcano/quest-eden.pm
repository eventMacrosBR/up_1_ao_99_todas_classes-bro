sub initParamsQuestEden{
    my %paramsQuestEden = (
        armaLevel26e40 => 'cajado',
        armaLevel60 => 'cajado'
    );
    my $eventMacro = $eventMacro::Data::eventMacro;
    $eventMacro->set_full_hash('paramsQuestEden', \%paramsQuestEden);
}

