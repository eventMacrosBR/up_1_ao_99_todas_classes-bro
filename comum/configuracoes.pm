automacro definirVariaveis{
	timeout 300 #che e atualiza as variáveis a cada 5 minutos
	priority -999 #pioridade altíssmia, sempre vai ser a primeira a executar
	exclusive 1
	call {
        # Configurações de Ids de classe
        $IDClasse1 = getIdC1()
        $IDClasse2 = getIdC2()
        $IDClasse1T = getIdC1T()
        $IDClasse2T = getIdC2T()
        $IDClasse3 = getIdC3()

        # Configurações Gerais de Build
        $skillsAprendiz = NV_BASIC 9 #Essa é padrão independente da classe
        $skillsClasse1 = getConfiguracoesSkillsClasse1()
        $skillsClasse2 = getConfiguracoesSkillsClasse2()
        $skillsClasse1T = getConfiguracoesSkillsClasse1T()
        $skillsClasse2T = getConfiguracoesSkillsClasse2T()
        $skillsClasse3 = getConfiguracoesSkillsClasse3()
        $statsPadrao = getConfiguracoesStats()

        # Configurações Eden
        $eden26e40Arma = getIdArmaEden26e40()
        $eden60Arma = getIdArmaEden60()
        
        # Configurações Quest Classe 1 
        $virarClasse1Mapa = getMapaQuest()
        $virarClasse1CoodenadaNPC = getNPCQuest()
        $virarClasse1PrecisaMover = precisaMover()
        $IDequipIniciante = getIdEquipeIniciante()
        $classe1Desejada = getNomeClasse1()

        #Configurações Quest Classe 2
        configurarItensQuestClasse2()

    }
}