[![Travis CI Build Status](https://travis-ci.org/eventMacrosBR/up_1_ao_99_todas_classes-bro.svg?branch=master)](https://travis-ci.org/eventMacrosBR/up_1_ao_99_todas_classes-bro)
---


Índice
-----------------
- [Referências](#referências)
- [Link de Download](#link-de-download)
- [Instruções de Instalação](#instruções-de-instalação)
- [Configurações Customizadas](#configurações-personalizadas)
- [Plugins](#plugins)
- [Agradecimentos](#agradecimentos)
- [Funcionalidades](#funcionalidades)
- [Para Desenvolvedores](#para-desenvolvedores)
   - [Personalizações](#personalizações)
   - [Estrutura de Arquivos](#estrutura-de-arquivos)
   - [Instruções ao clonar o repositório](#instruções-ao-clonar-o-repositório)


## Referências
- [Openkore](http://openkore.com/index.php/Main_Page)
- [EventMacro](http://openkore.com/index.php/EventMacro)
- [bROWiki](http://browiki.org/wiki/P%C3%A1gina_principal)
- [Grupo de discussão no Gitter](https://gitter.im/eventMacro-up-todas-as-classes/Lobby)

## Link de Download
O repositório já disponibiliza o eventMacros.txt de todas as classes montados em: 
[Releases ![](https://png.icons8.com/metro/16/000000/download.png)](https://github.com/eventMacrosBR/up_1_ao_99_todas_classes-bro/releases)
## Instruções de Instalação
1. Clique no link de download [(Ou aqui, dá no mesmo)](https://github.com/eventMacrosBR/up_1_ao_99_todas_classes-bro/releases)
2. Lá terá uma lista com um link para a eventMacro de cada classe. Escolha a classe desejada e clique nela.
3. Após baixar, descompacte-o. Mova o arquivo **eventMacros.txt** para dentro da pasta control de seu bot.
4. Seja Feliz :D

Obs: Colocamos o nome da classe 3 para definir a linha de evolução a seguir pela macro, porém ela **NÃO UPA CLASSE 3.**

## Configurações Personalizadas

- Quest de Renascimento: por padrão a quest de renascimento vem desativada, você pode ativá-la no arquivo `comum/quest-renascer.pm`. Obs: É necessário informar o nome de um personagem para que o bot consiga passar os zennys extras para conseguir renascer.
- Customizando skills e itens utilizaveis: Você pode modificar os itens e skills que seu bot vai utilizar para caçar criando blocos de automacro em `classes/<classe-3>/skills-e-itens.pm`

## Plugins
Para a macro funcionar corretamente é necessária a instalação dos seguintes plugins: (A macro também instala eles automáticamente caso não queira fazer a instalação manual)
- [BetterShopper](https://github.com/Henrybk/Plugins/tree/master/BetterShopper)

## Agradecimentos
- @nipodemos: Criação do script [up1-99_completo_para_arruaceiros](https://github.com/Nipodemos/up1-99_completo_para_arrauceiros) no qual este script é baseado (Créditos dos scripts que ele utilizou como base em seu próprio repositório)
- Todos os [contribuidores](https://github.com/eventMacrosBR/up_1_ao_99_todas_classes-bro/graphs/contributors) que fizeram essa macro acontecer
- Todos os usuários que utilizam as macros e reportam no forum do openkorebrasil.org
  

## Funcionalidades:

|Icone                                                                              |Funcionalidade      |Estado                    |
|-----------------------------------------------------------------------------------|--------------------|--------------------------|
|![alt treinamento](http://browiki.org/images/9/97/Aprendizespartyicn.png)          |Campo de treinamento|Funcionando               |
|![alt upar](https://static.divine-pride.net/images/mobs/png/1002.png)              |Upar do 1 ao 99     |Funcionando               |
|![alt eden](http://static.divine-pride.net/images/items/item/22508.png)            |Quest Eden          |Funcionando               |
|![alt espadachim](http://browiki.org/images/7/77/Espadachinspartyicn.png)          |Quest Espadachim    |Funcionando               |
|![alt gatuno](http://browiki.org/images/0/01/Gatunospartyicn.png)                  |Quest Gatuno        |Funcionando               |
|![alt mercador](http://browiki.org/images/c/c0/Mercadorespartyicn.png)             |Quest Mercador      |Funcionando               |
|![alt mago](http://browiki.org/images/0/09/Magospartyicn.png)                      |Quest Mago          |Funcionando               |
|![alt novico](http://browiki.org/images/e/e3/Novi%C3%A7ospartyicn.png)             |Quest Noviço        |Funcionando               |
|![alt arqueiro](http://browiki.org/images/5/53/Arqueirospartyicn.png)              |Quest Arqueiro      |Funcionando               |
|![alt alquimista](http://browiki.org/images/1/11/Alquimistaspartyicn.png)          |Quest Alquimista    |Funcionando               |
|![alt arruaceiro](http://browiki.org/images/4/4f/Arruaceirospartyicn.png)          |Quest Arruaceiro    |Funcionando               |
|![alt bardo](http://browiki.org/images/5/5c/Bardospartyicn.png)                    |Quest Bardo         |Aguardando desenvolvimento|
|![alt bruxo](http://browiki.org/images/f/fc/Bruxospartyicn.png)                    |Quest Bruxo         |Em desenvolvimento        |
|![alt caçador](http://browiki.org/images/2/21/Ca%C3%A7adorespartyicn.png)          |Quest Caçador       |Aguardando desenvolvimento|
|![alt cavaleiro](http://browiki.org/images/3/35/Cavaleirospartyicn.png)            |Quest Cavaleiro     |Funcionando               |
|![alt ferreiro](http://browiki.org/images/8/8d/Ferreirospartyicn.png)              |Quest Ferreiro      |Em desenvolvimento        |
|![alt mercenario](http://browiki.org/images/3/3f/Mercen%C3%A1riospartyicn.png)     |Quest Mercenário    |Aguardando desenvolvimento|
|![alt monge](http://browiki.org/images/0/02/Mongespartyicn.png)                    |Quest Monge         |Em desenvolvimento        |
|![alt odalisca](http://browiki.org/images/0/06/Odaliscaspartyicn.png)              |Quest Odalisca      |Aguardando desenvolvimento|
|![alt sabio](http://browiki.org/images/4/46/S%C3%A1biospartyicn.png)               |Quest Sábio         |Aguardando desenvolvimento|
|![alt sacerdote](http://browiki.org/images/1/1f/Sacerdotespartyicn.png)            |Quest Sacerdote     |Funcionando               |
|![alt templario](http://browiki.org/images/8/8e/Templ%C3%A1riospartyicn.png)       |Quest Templário     |Funcionando               |
|![alt renascimento](http://browiki.org/images/c/c7/Bt_quest.png)                   |Quest Renascimento  |Funcionando               |
|![alt espadachim t](http://browiki.org/images/7/77/Espadachinspartyicn.png)        |Quest Espadachim T. |Testando                  |
|![alt gatuno t](http://browiki.org/images/0/01/Gatunospartyicn.png)                |Quest Gatuno T.     |Funcionando                  |
|![alt mercador t](http://browiki.org/images/c/c0/Mercadorespartyicn.png)           |Quest Mercador T.   |Testando                  |
|![alt mago t](http://browiki.org/images/0/09/Magospartyicn.png)                    |Quest Mago T.       |Testando                  |
|![alt novico t](http://browiki.org/images/e/e3/Novi%C3%A7ospartyicn.png)           |Quest Noviço T.     |Testando                  |
|![alt arqueiro t](http://browiki.org/images/5/53/Arqueirospartyicn.png)            |Quest Arqueiro T.   |Testando                  |
|![alt classe 2](http://browiki.org/images/8/8f/Lordespartyicn.png)                 |Quest Classe 2 T.   |Testando                  |
|![alt classe 3](http://browiki.org/images/7/7c/Cavaleiros_R%C3%BAnicospartyicn.png)|Quest Classe 3      |Aguardando desenvolvimento|

# Para Desenvolvedores

### Instruções ao clonar o repositório
1. Execute o script (geradorEventMacros-plataforma, onde plataforma = seu sistema operacional) para gerar o arquivo eventMacros.txt informando a classe desejada*
2. Cole esse arquivo em sua pasta control do openkore
3. Inicie o openkore & have fun!
OBS: Colocamos a classe 3 para definir a linha de evolução a seguir pela macro, mas ela ainda não faz a classe 3

### Personalizações

Você pode gerar o script com algumas configurações customizadas modificando os seguintes arquivos:
- Customizando a build e mapas de up: modifique o arquivo `classes/<classe-3>/config.pm`. Ex: Quero modificar a ordem das skills aprendidas por meu arruaceiro devo modificar o arquivo `classes/renegado/config.pm`

### Estrutura de Arquivos
```
up_1_ao_99_todas_classes
├── README.md                             * Este arquivo
├── LICENSE                               * Licença de distribuição do projeto
├── auxiliarGui.ps1                       * Programa com interface gráfica para windows
├── auxiliarGui.py                        * Programa com interface gráfica para linux ou osx
├── geradorEventMacros-LIN-MAC.sh         * Programa para gerar o script em linux ou osx
├── geradorEventMacros-WIN.bat            * Programa para gerar o script em windows
├── comum                                 * Pasta com os scripts comuns do projeto ( o core do projeto )
│   ├── init.pm                           * Inicializador do projeto, reponsável por subir as variáveis
│   └── up-ate-99.pm                      * Automacro responsável por fazer o personagem upar enquanto não estiver em quests
│   └── campo-de-aprendiz.pm              * Automacros que realizam o campo de treinamento
│   └── quest-1.pm                        * Automacros que realizam a quest da classe 1
│   └── quest-2.pm                        * Automacros que realizam a quest da classe 2
│   └── quest-renascer.pm                 * Automacros e parâmetros que realizam a quest para renascer
│   └── quest-1t.pm                       * Automacros que realizam a quest da classe 1 Transclasse
│   └── quest-2t.pm                       * Automacros que realizam a quest da classe 2 Transclasse
│   └── quest-eden.pm                     * Automacros que realizam as quests de equipamentos do eden
│   └── plugins.pm                        * Subs para instalação e configurações de plugins necessários
│   └── skills-e-itens.pm                 * Subs para adicionar blocos de skills e itens, itens padrões
│   └── setSaveIn.pm                      * Responsável pela função de mudar os mapas de save, hunt, autosell, etc
│   └── usarAeroplano.pm                  * Macros uteis para usar o aeroplano
│   └── utilidades.pm                     * Sub utilitárias
├── classes                               * Pasta com as configurações e parametros únicos de cada classe
│   ├── <classe3>                         * Pasta com todas as configurações da <classe3> e sub classes         
│   │   ├── config.pm                     * Configurações da build e mapas de up ( personalize aqui )
│   │   └── param.pm                      * Parametros de classes necessários para as macros funcionárem
│   │   └── quest-c-1.pm                  * Parametros para quest da classe 1
│   │   └── quest-c-2.pm                  * Parametros para quest da classe 2
│   │   └── quest-c-1T.pm                 * Parametros para quest da classe 1 Transclasse
│   │   └── quest-c-2T.pm                 * Parametros para quest da classe 2 Transclasse
│   │   └── quest-c-3.pm                  * Parametros para quest da classe 3 (Ainda não é utilizado)
│   │   └── quest-eden.pm                 * Parametros para quests do eden
│   │   └── skills-e-itens.pm             * Configurações de itens e skills que serão utilizados durante o up
```
