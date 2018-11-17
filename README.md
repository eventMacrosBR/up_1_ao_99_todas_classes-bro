[![GitHub license](https://img.shields.io/github/license/eventMacrosBR/up_1_ao_99_todas_classes-bro.svg)](https://github.com/eventMacrosBR/up_1_ao_99_todas_classes-bro/blob/master/LICENSE)
[![Travis CI Build Status](https://travis-ci.org/eventMacrosBR/up_1_ao_99_todas_classes-bro.svg?branch=master)](https://travis-ci.org/eventMacrosBR/up_1_ao_99_todas_classes-bro)
[![GitHub issues](https://img.shields.io/github/issues/eventMacrosBR/up_1_ao_99_todas_classes-bro.svg)](https://github.com/eventMacrosBR/up_1_ao_99_todas_classes-bro/issues)
[![GitHub forks](https://img.shields.io/github/forks/eventMacrosBR/up_1_ao_99_todas_classes-bro.svg)](https://github.com/eventMacrosBR/up_1_ao_99_todas_classes-bro/network)
[![GitHub stars](https://img.shields.io/github/stars/eventMacrosBR/up_1_ao_99_todas_classes-bro.svg)](https://github.com/eventMacrosBR/up_1_ao_99_todas_classes-bro/stargazers)
[![Github All Releases](https://img.shields.io/github/downloads/eventMacrosBR/up_1_ao_99_todas_classes-bro/total.svg)](https://github.com/eventMacrosBR/up_1_ao_99_todas_classes-bro/releases)

---

**Para informações de como contribuir com o projeto visite nossa [Wiki](https://github.com/eventMacrosBR/up_1_ao_99_todas_classes-bro/wiki)**

## Índice
-----------------
- [Referências](#referências)
- [Link de Download](#link-de-download)
- [Instruções de Instalação](#instruções-de-instalação)
- [Configurações Personalizadas](#configurações-personalizadas)
- [Mantendo modificações de builds entre updates](#mantendo-modificações-de-builds-entre-updates)
- [Agradecimentos](#agradecimentos)
- [Funcionalidades](#funcionalidades)


## Referências
Documentação e links uteis para trabalhar com o projeto e eventMacros em geral acesse nossa [Wiki](https://github.com/eventMacrosBR/up_1_ao_99_todas_classes-bro/wiki)

Caso queria tirar dúvidas com os criadores da eventMacro ou reportar um erro, temos um grupo no discord: [Clique aqui](https://discord.gg/dYGG2sN)

## Link de Download
O repositório já disponibiliza o eventMacros.txt de todas as classes montados em: 
[Releases ![](https://png.icons8.com/metro/16/000000/download.png)](https://github.com/eventMacrosBR/up_1_ao_99_todas_classes-bro/releases)

## Instruções de Instalação
1. Clique no link de download [(Ou aqui, dá no mesmo)](https://github.com/eventMacrosBR/up_1_ao_99_todas_classes-bro/releases)
2. Lá terá uma lista com um link para a eventMacro de cada classe. Escolha a classe desejada e clique nela.
3. Após baixar, descompacte-o. Mova o arquivo **eventMacros.txt** para dentro da pasta control de seu bot.
4. Se a macro solicitar algum plugin você pode encontrá-los em [PluginParaUpTodasAsClasse](https://github.com/eventMacrosBR/PluginsParaUpTodasAsClasses/releases) basta colocá-los na pasta plugins que a macro instala e configura
5. Seja Feliz :D

Obs: Colocamos o nome da classe mais alta para definir a linha de evolução a seguir pela macro

## Configurações Personalizadas

- Caso esteja utilizando o windows 8 ou superior você pode configurar sua build e parametros para quest de renascer utilizando o `gerador-eventmacros-windows.bat`.
- Quest de Renascimento: por padrão a quest de renascimento vem desativada, você pode ativá-la no arquivo `classes/<classe-3>/config.pm`. Obs: É necessário informar o nome de um personagem para que o bot consiga passar os zennys extras para conseguir renascer.
- Customizando skills e itens utilizaveis: Você pode modificar os itens e skills que seu bot vai utilizar para caçar criando blocos de automacro em `classes/<classe-3>/skills-e-itens.pm`

## Mantendo modificações de builds entre updates

1. Clone o projeto `git clone https://github.com/eventMacrosBR/up_1_ao_99_todas_classes-bro`
2. Faça suas modificações em `classes/classe-desejada/config.pm`
3. Utilize o `gerador-eventmacros-windows.bat`(Windows 7 ou superior) ou `gerador-eventmacros-lin-osx.sh`(Linux / OsX) para gerar sua macro
4. **Linux ou Mac**: Quando sair uma atualização da macro execute os seguintes comandos:
  - `git stash save` Este comando salva suas modificações
  - `git pull --rebase` Este comando atualiza os arquivos da macro
  - `git stash pop` Este comando restaura suas modificações
4. **Windows**: O gerador perguntará se deseja atualizar e fará a preservação das suas personalizações
5. Utilize o gerador novamente para gerar sua nova macro atualizada com suas configurações já aplicadas

## Agradecimentos
- @nipodemos: Criação do script [up1-99_completo_para_arruaceiros](https://github.com/Nipodemos/up1-99_completo_para_arrauceiros) no qual este script é baseado (Créditos dos scripts que ele utilizou como base em seu próprio repositório)
- Todos os [contribuidores](https://github.com/eventMacrosBR/up_1_ao_99_todas_classes-bro/graphs/contributors) que fizeram essa macro acontecer
- Todos os usuários que utilizam as macros e reportam no forum do openkorebrasil.org

## Funcionalidades:
Veja a lista de todas funcionalidades em: [Funcionalidades](https://github.com/eventMacrosBR/up_1_ao_99_todas_classes-bro/wiki/Funcionalidades)
