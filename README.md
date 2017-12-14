# up_1_ao_99_todas_classes-bro
Está macro pretende upar do nível 1 de base até o 99 de todas as classes do ragnarok no servidor Brasileiro

## Referências
- [Openkore](http://openkore.com/index.php/Main_Page)
- [EventMacro](http://openkore.com/index.php/EventMacro)
- [BRoWiki](http://browiki.org/wiki/P%C3%A1gina_principal)
- [Grupo de discussão no Gitter](https://gitter.im/eventMacro-up-todas-as-classes/Lobby)

## Instruções
1. Execute o script (geradorEventMacros-plataforma, onde plataforma = seu sistema operacional) para gerar o arquivo eventMacros.txt informando a classe desejada*
2. Cole esse arquivo em sua pasta control do openkore
3. Inicie o openkore & have fun!
OBS: Colocamos a classe 3 para definir a linha de evolução a seguir pela macro

## Configurações Customizadas
Você pode gerar o script com algumas configurações customizadas modificando os seguintes arquivos:
- Customizando a build e mapas de up: modifique o arquivo `classes/<classe-3>/config.pm`. Ex: Quero modificar a ordem das skills aprendidas por meu arruaceiro devo modificar o arquivo `classes/renegado/config.pm`
- Quest de Renascimento: por padrão a quest de renascimento vem desativada, você pode ativá-la no arquivo `classes/<classe-3>/quest-renascer.pm`. Obs: É necessário informar o nome de um personagem para que o bot consiga passar os zennys extras para conseguir renascer.
- Customizando skills e itens utilizaveis: Você pode modificar os itens e skills que seu bot vai utilizar para caçar criando blocos de automacro em `classes/<classe-3>/skills-e-itens.pm`

### Agradecimentos
- @nipodemos: Criação do script [up1-99_completo_para_arruaceiros](https://github.com/Nipodemos/up1-99_completo_para_arrauceiros) no qual este script é baseado (Créditos dos scripts que ele utilizou como base em seu próprio repositório)
- @vitorsilverio: Parametrização do script que permite a adaptação para todas as classes
- @gabx257: Parâmetros para as classes de Magos
- @lucasbradok: base quests de sacer e monge
  

### Funcionalidades:
|| Funcionalidade | Estado |
|-|----------------|--------|
|![alt treinamento](http://browiki.org/images/9/97/Aprendizespartyicn.png)|Campo de treinamento|Funcionando|
|![alt upar](https://static.divine-pride.net/images/mobs/png/1002.png)|Upar do 1 ao 99|Funcionando|
|![alt eden](http://static.divine-pride.net/images/items/item/22508.png)|Quest Eden|Funcionando|
|![alt espadachim](http://browiki.org/images/7/77/Espadachinspartyicn.png)|Quest Espadachim|Funcionando|
|![alt gatuno](http://browiki.org/images/0/01/Gatunospartyicn.png)|Quest Gatuno|Funcionando|
|![alt mercador](http://browiki.org/images/c/c0/Mercadorespartyicn.png)|Quest Mercador|Funcionando|
|![alt mago](http://browiki.org/images/0/09/Magospartyicn.png)|Quest Mago|Funcionando|
|![alt novico](http://browiki.org/images/e/e3/Novi%C3%A7ospartyicn.png)|Quest Noviço|Funcionando|
|![alt arqueiro](http://browiki.org/images/5/53/Arqueirospartyicn.png)|Quest Arqueiro|Funcionando|
|![alt alquimista](http://browiki.org/images/1/11/Alquimistaspartyicn.png)|Quest Alquimista|Funcionando|
|![alt arruaceiro](http://browiki.org/images/4/4f/Arruaceirospartyicn.png)|Quest Arruaceiro|Funcionando|
|![alt bardo](http://browiki.org/images/5/5c/Bardospartyicn.png)|Quest Bardo|Aguardando desenvolvimento|
|![alt bruxo](http://browiki.org/images/f/fc/Bruxospartyicn.png)|Quest Bruxo|Em desenvolvimento|
|![alt caçador](http://browiki.org/images/2/21/Ca%C3%A7adorespartyicn.png)|Quest Caçador|Aguardando desenvolvimento|
|![alt cavaleiro](http://browiki.org/images/3/35/Cavaleirospartyicn.png)|Quest Cavaleiro|Aguardando desenvolvimento|
|![alt ferreiro](http://browiki.org/images/8/8d/Ferreirospartyicn.png)|Quest Ferreiro|Aguardando desenvolvimento|
|![alt mercenario](http://browiki.org/images/3/3f/Mercen%C3%A1riospartyicn.png)|Quest Mercenário|Aguardando desenvolvimento|
|![alt monge](http://browiki.org/images/0/02/Mongespartyicn.png)|Quest Monge|Em desenvolvimento|
|![alt odalisca](http://browiki.org/images/0/06/Odaliscaspartyicn.png)|Quest Odalisca|Aguardando desenvolvimento|
|![alt sabio](http://browiki.org/images/4/46/S%C3%A1biospartyicn.png)|Quest Sábio|Aguardando desenvolvimento|
|![alt sacerdote](http://browiki.org/images/1/1f/Sacerdotespartyicn.png)|Quest Sacerdote|Em desenvolvimento|
|![alt templario](http://browiki.org/images/8/8e/Templ%C3%A1riospartyicn.png)|Quest Templário|Em desenvolvimento|
|![alt renascimento](http://browiki.org/images/c/c7/Bt_quest.png)|Quest Renascimento|Testando|
|![alt espadachim t](http://browiki.org/images/7/77/Espadachinspartyicn.png)|Quest Espadachim T.|Testando|
|![alt gatuno t](http://browiki.org/images/0/01/Gatunospartyicn.png)|Quest Gatuno T.|Testando|
|![alt mercador t](http://browiki.org/images/c/c0/Mercadorespartyicn.png)|Quest Mercador T.|Testando|
|![alt mago t](http://browiki.org/images/0/09/Magospartyicn.png)|Quest Mago T.|Testando|
|![alt novico t](http://browiki.org/images/e/e3/Novi%C3%A7ospartyicn.png)|Quest Noviço T.|Testando|
|![alt arqueiro t](http://browiki.org/images/5/53/Arqueirospartyicn.png)|Quest Arqueiro T.|Testando|
|![alt classe 2](http://browiki.org/images/8/8f/Lordespartyicn.png)|Quest Classe 2 T.|Testando|
|![alt classe 3](http://browiki.org/images/7/7c/Cavaleiros_R%C3%BAnicospartyicn.png)|Quest Classe 3|Aguardando desenvolvimento|
