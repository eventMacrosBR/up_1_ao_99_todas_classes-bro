sub initParamsQuestEden{
    my %paramsClasses = (
        idC1 => 5,
        idC2 => 18,
        idC1T => 0,
        idC2T => 0,
        idC3 => 0
    )
    my $eventMacro = $eventMacro::Data::eventMacro;
    $eventMacro->set_full_hash('paramsClasses', \%paramsClasses);
}