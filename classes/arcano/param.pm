sub initParamsQuestEden{
    my %paramsClasses = (
        idC1 => 2,
        idC2 => 9,
        idC1T => 0,
        idC2T => 0,
        idC3 => 0
    );
    my $eventMacro = $eventMacro::Data::eventMacro;
    $eventMacro->set_full_hash('paramsClasses', \%paramsClasses);
}

