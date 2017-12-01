sub initParamsQuestEden{
    my %paramsClasses = (
        idC1 => 1,
        idC2 => '7,13',
        idC1T => 0,
        idC2T => 0,
        idC3 => 0
    );
    my $eventMacro = $eventMacro::Data::eventMacro;
    $eventMacro->set_full_hash('paramsClasses', \%paramsClasses);
}

