sub initParamsQuestEden {
    my %paramsClasses = (
        idC1 => 5,
        idC2 => 18,
        idC1T => 4006,
        idC2T => 4019,
        idC3 => 4071
    );
    my $eventMacro = $eventMacro::Data::eventMacro;
    $eventMacro->set_full_hash('paramsClasses', \%paramsClasses);
}

