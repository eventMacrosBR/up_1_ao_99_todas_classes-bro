macro initParamsQuestClasse2 {
    #Flor qualquer. Pode ser: Aloés(704), Hinalle(703), Flor das Ilusões(710), Izidor(709), Menta(708), Flor Cantante(629), Rosa de Gelo(749), Rosa Eterna(748)
    my $flor = 704;
    do iconf $flor 1 1 0 
    do iconf 938 1 1 0 #Muco Pegajoso
    do iconf 1024 1 1 0 #Tinta de Polvo
    
    do conf -f questc2_implementada false
}

