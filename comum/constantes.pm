#Essa macro deve inicializar todas as constantes utilizadas pela eventMacro e acabar com boa parte dos MAGIC NUMBERS
sub contantes_inicializar {
    my $eventMacro = $eventMacro::Data::eventMacro;
    

    #Classes
    $eventMacro->set_scalar_var("APRENDIZ", 0 , 0);
    $eventMacro->set_scalar_var("APRENDIZ_T", 4001, 0);
    $eventMacro->set_scalar_var("APRENDIZ_BABY", 4023, 0);

    #Valores
    $eventMacro->set_scalar_var("INDEFINIDO", -1, 0);
    $eventMacro->set_scalar_var("TRUE", 1, 0);
    $eventMacro->set_scalar_var("FALSE", 0, 0);

    #Equipes
    #Aprendiz

    #Eden
}
