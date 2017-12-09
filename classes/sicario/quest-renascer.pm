sub initParamsQuestClasseRenascer {
    my %paramsQuestClasseRenascer = (
        renascer => 'nao',
        amigo => ''
    );
    my $eventMacro = $eventMacro::Data::eventMacro;
    $eventMacro->set_full_hash('paramsQuestClasseRenascer', \%paramsQuestClasseRenascer);
}
