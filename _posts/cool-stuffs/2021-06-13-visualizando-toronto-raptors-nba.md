---
latexEquation: true
title: "Visualizando os arremessos de quadra do Toronto Raptors nas temporadas 2019-20 e 2020-21"
header:
  teaser: "/assets/img/posts/raps-shotcharts-imgs/2019-20/roster_scatter.png"
author: lucastassis
excerpt: "Visualizando dos arremessos de quadra do Toronto Raptors nas Temporadas de 2019-20 e 2020-21. As visualizações buscam dar um entendimento de como um time que terminou a temporada 2019-20 com 53-19 caiu para 27-45 na temporada 2020-21."
toc: true
categories:
  - CoolStuffs
tags:
  - Data Science
  - Basketball
  - -NBA
  - Toronto Raptors
  - Python
  - Data analysis
---

# Introdução

A temporada regular 2020-21 da NBA terminou faz um tempo, e nós já estamos dentro dos playoffs de 2021. E pela primeira vez em oito anos, o Toronto Raptors estão fora da pós-temporada (pelo menos podemos assistir outros times sofrendo em paz...). E existem diversas razões para isso: a mudança para Tampa, os protocolos de saúde e segurança que desfalcaram o time, lesões, perda de Serge Ibaka e Marc Gasol na *offseason*... podemos continuar por um bom tempo. Porém, nesse artigo, eu tentei fazer algumas visualizações para tentar encontrar algumas razões (particularmente no campo ofensivo) de como um time que terminou a temporada 2019-20 com 53-19 (vitórias e derrotas) caiu para 27-45 na temporada 2020-21.

Existem diversos artigos que foram escritos por pessoas que entendem muito mais que eu... e é bem provável que essas visualizações não vão prover muito entendimento na situação, dado que existiram uma infinidade de razões extra-basquete que não são contabilizadas nesses gráficos... porém, esse é um bom exercício (bem, pelo menos para mim.)

# Os dados

A primeira coisa que fiz foi juntar alguns dados sobre as temporadas 2019-20 e 2020-21. Eu utilizei a [`nba_api`](https://github.com/swar/nba_api) para buscar esses dados. A partir disso, eu tive que decidir qual os dados que iria utilizar (quais jogadores, etc, etc). Acabei decidindo analisar os dados de todo o time nas duas temporadas e também os dados do que eu chamei de *core four*. O *core four* são: Kyle Lowry, Fred VanVleet, Pascal Siakam e OG Anunoby. Norman Powell ficou de fora porque ele não está mais nos Raptors (infelizmente). E Chris Boucher ficou de fora porque na temporada 2019-20 ele não estava tanto na rotação do time como esteve nessa temporada (se eu fizer isso ano que vem, quem sabe ele não ganhe um lugar aqui dado seu crescimento nessa temporada). Outra coisa importante é que na temporada 2020-21 eu não utilizei os dados dos novatos: Malachi Flynn, Jalen Harris e Freddie Gillespie. Infelizmente, a API não achou os dados deles. Eu não acho que fez tanto impacto nos resultados (posso estar errado), mas é bom levar isso em conta enquanto estivermos analisando os dados.

De qualquer forma, os dados consistem das localizações dos jogadores em todos os arremessos de quadra durante as temporadas. Nós também consideramos 7 grande áreas da quadra (sendo 6 mais importantes): Restricted Area (ou seja, dentro da meia lua do garrafão), Paint (garrafão sem contabilizar a restricted area), Mid-range (arremessos de meia distância), Above the break 3 (todos os arremessos de 3 que não são dos cantos), Left Corner 3 (arremessos de 3 do canto esquerdo), Right Corner 3 (arremessos de 3 do canto direito)... e Backcourt (de trás da linha de meio campo, que não é muito importante no todo).

Com essas definições básicas feitas, podemos começar a análise.

# As visualizações

## O time completo

Primeiramente irei começar mostrando os dados do time completo.

<span class="align-center">
<img src="{{ site.url }}{{ site.baseurl }}/assets/img/posts/raps-shotcharts-imgs/2019-20/roster_scatter.png" style="zoom:12.5%;" />
<img src="{{ site.url }}{{ site.baseurl }}/assets/img/posts/raps-shotcharts-imgs/2020-21/roster_scatter.png" style="zoom:12.5%;" /> 
</span>


Essa primeira figura apresenta todos os arremessos feitos pelo Toronto Raptors nas duas temporadas. A cor indica a eficiência (FG%) comparada com a média da liga no seu respectivo ano (quanto mais vermelho, melhor). Analisando essa primeira visualização, nós observamos que a distribuição de arremessos parece bem similar. Porém , existem algumas diferenças quanto à eficiência. Na temporada 2019-20, os Raptors tiveram um FG% maior na região *above the break 3*. Dos cantos, eles foram bem próximos da média da liga nas duas temporadas. Nós também percebemos que os Raptors não são um bom time de *mid-range* (bem, pelo menos pra mim, esse resultado é esperado dado o que é visto assistindo os jogos). Eles também só são OK na *paint* e *restricted area*. Porém, é bem claro que eles arremessaram melhor de 3 na temporada 2019-20, mas o número de arremessos não fica tão claro nesse plot. É por isso que fiz essa próxima figura.

<img src="{{ site.url }}{{ site.baseurl }}/assets/img/posts/raps-shotcharts-imgs/2019-20/roster_freq_per_feet.png" style="zoom: 20%;" class="align-center"/>

<img src="{{ site.url }}{{ site.baseurl }}/assets/img/posts/raps-shotcharts-imgs/2020-21/roster_freq_per_feet.png" style="zoom:20%;" class="align-center" />

Certo, agora nessas figuras nós temos as ilustrações da frequência de arremessos por *feet* (distância). Dessa forma, nós conseguimos observar melhor o número de arremessos feitos em cada área. Agora acredito que temos o nosso primeiro momento "tem algo errado aí". Olhando as bolas de 3, elas parecem bem semelhantes, mas próximo a *paint*... tem uma grande mudança. Bem, no início desse artigo, eu falei algo que possa ter alguma influência nisso: "perda de Serge Ibaka e Marc Gasol na *offseason*". Ibaka e Gasol eram duas peças sólidas que ajudavam o time funcionar bem tanto ofensivamente quanto defensivamente. Eles foram substituídos por Aron Baynes, que não atuou bem pelo time. E não é nada pessoal contra o Baynes, o time só não pareceu ter um entrosamento com ele na quadra (e também, erros de *layups* e *putbacks*). Então aqui a gente pode ter, talvez, as primeiras pistas de algumas coisas que deram errado. Mas novamente, não tem nada de novo... todo mundo no Twitter já falou sobre isso mais de 2000 vezes. Bem... agora é apoiado pelos dados (ou pelo menos parece ser). Mas você pode estar pensando: "Certo... eles arremessaram mais, mas eles acertaram mais?". A resposta pode estar nessa próxima figura.

<img src="{{ site.url }}{{ site.baseurl }}/assets/img/posts/raps-shotcharts-imgs/2019-20/roster_fg_per_feet.png" style="zoom:20%;" class="align-center"/>

<img src="{{ site.url }}{{ site.baseurl }}/assets/img/posts/raps-shotcharts-imgs/2020-21/roster_fg_per_feet.png" style="zoom:20%;" class="align-center"/>

... e a resposta é sim! Eles também arremessaram melhor. De 0 ft (*layup*, *dunk*, e outras coisas) eles tiveram próximo de 80% de acurácia, o que é muito bom quando você está arremessando quase 10% dos seus arremessos de lá. Sim, depois disso é bem semelhante, eu sei. Mas na temporada 2020-21, eles tiveram bem menos arremessos perto da cesta, apesar de ter uma acurácia similar. Dessa forma, eles trocaram bons arremessos por bolas de 3 distantes e *mid-ranges*. Por sinal, o tamanho do círculo representa o número de arremessos por *feet*, então quanto maior, mais arremessos tentados.

Então nós já percebemos algumas diferenças. Elas podem não ser as principais, mas podem indicar algumas coisas. E eu também já sei que várias pessoas tweetaram isso várias vezes, mas como eu disse anteriormente, agora é apoiado pelos dados (eu acho que algumas pessoas no Twitter também falaram coisas apoiadas por dados... mas eu gastei um tempo fazendo isso, então vamos imaginar que não). De qualquer forma, agora a gente vai para o *core four*.

## O *core four*

O *core four* consiste dos principais jogadores dos Raptors, ou pelo menos quem eu considero os principais jogadores. Nós seguiremos de forma similar com o que fiz anteriormente. Então, primeiro, vamos dar uma olhada nos arremessos comparado com a média da liga.

### Fred VanVleet

Nós começamos mostrando os números do Freddy.

<img src="{{ site.url }}{{ site.baseurl }}/assets/img/posts/raps-shotcharts-imgs/2019-20/fredvanvleet.png" style="zoom:12.5%;" />
<img src="{{ site.url }}{{ site.baseurl }}/assets/img/posts/raps-shotcharts-imgs/2020-21/fredvanvleet.png" style="zoom:12.5%;" /> 

Uma coisa que salta a vista é o *mid-range*, *paint* e *restricted area*. Nós já sabemos disso: Fred precisa reforçar seus arremessos de 2 para atingir o próximo nível. Nas bolas de 3 ele também deu um *step back (no pun intended)*. Ele também arremessou bem melhor dos cantos na temporada 2019-20. Mas Fred teve um caminho difícil por conta da COVID... então é muito difícil de realmente tirar alguma coisa desses dados, já que ele jogou vários jogos sem estar 100%, ou como ele próprio disse, "batendo em uma parede". Mesmo com seus arremessos estando pior nesse ano, ele foi muito sólido antes de entrar nos protocolos de saúde e segurança por conta da COVID. 

Eu também plotei a frequência por *feet*.

<img src="{{ site.url }}{{ site.baseurl }}/assets/img/posts/raps-shotcharts-imgs/2019-20/fredvanvleet_fg_per_feet.png" style="zoom: 20%;" class="align-center" />
<img src="{{ site.url }}{{ site.baseurl }}/assets/img/posts/raps-shotcharts-imgs/2020-21/fredvanvleet_fg_per_feet.png" style="zoom: 20%;" class="align-center" />

Nessas figuras, fica mais claro que Fred teve um ano ruim quanto aos arremessos. Ele também arremessou bem mais 3s nesse ano que na temporada 2019-20. Mas, como disso algumas vezes, é bem difícil de avaliar Fred por conta do tempo pós-COVID.

### Kyle Lowry

O próximo é ninguém mais que o melhor Raptor de todos os tempos: Kyle Lowry. Então, vamos dar uma olhada nos gráficos de arremessos do Kyle.

<img src="{{ site.url }}{{ site.baseurl }}/assets/img/posts/raps-shotcharts-imgs/2019-20/kylelowry.png" style="zoom: 12.5%;" />
<img src="{{ site.url }}{{ site.baseurl }}/assets/img/posts/raps-shotcharts-imgs/2020-21/kylelowry.png" style="zoom: 12.5%;" />


Kyle é um veterano do jogo e não aparenta estar desacelerando. Seus arremessos de 3 foram melhores esse ano, especialmente dos cantos (olha aquele lado direito!). Seu jogo de *mid-range* e *paint* também parecem bem similar entre os anos. Vamos ser diretos, Kyle teve uma temporada bem sólida e nós sempre teremos o jogo contra o Lakers... Mas só pra manter a consistência, vamos olhar seu FG% por *feet*.

<img src="{{ site.url }}{{ site.baseurl }}/assets/img/posts/raps-shotcharts-imgs/2019-20/kylelowry_fg_per_feet.png" style="zoom: 20%;" />

<img src="{{ site.url }}{{ site.baseurl }}/assets/img/posts/raps-shotcharts-imgs/2020-21/kylelowry_fg_per_feet.png" style="zoom: 20%;" />

De forma geral ele teve temporadas bem similares, porém, arremessou um pouco melhor nessa temporada.

### Pascal Siakam

Certo, vamos agora para o Spicy P. Como vocês já sabem, começamos com os gráficos de arremesso.

<img src="{{ site.url }}{{ site.baseurl }}/assets/img/posts/raps-shotcharts-imgs/2019-20/pascalsiakam.png" style="zoom: 12.5%;" />
<img src="{{ site.url }}{{ site.baseurl }}/assets/img/posts/raps-shotcharts-imgs/2020-21/pascalsiakam.png" style="zoom: 12.5%;" />


Siakam foi fortemente criticado durante essa temporada, particularmente por errar *game-winners*. Ele, assim como Fred, também passou por protocolos de saúde e segurança, então nós temos que levar isso em conta. Nós nem precisávamos plotar isso para saber: Siakam foi muito inconsistente nos arremessos de 3. Bem, observando o gráfico isso fica claro. Mas uma coisa promissora é que ele arremessou melhor nos *mid-ranges*.

Outra coisa promissora nessa temporada é que a sua habilidade de criar jogadas (*playmaking*) foi muito melhor que na temporada passada. Mas, apesar disso, ele precisa de melhorar sua bola de 3, pelo menos chegando na média. Por sinal eu não vou criticar Pascal por conta de seus erros em *game-winners*, mesmo também tendo ficado com raiva deles. Pascal teve um tempo difícil durante a bolha da NBA, e ficar longe de Toronto nessa temporada provavelmente não ajudou. Então acredito que seja justo esperar sua próxima temporada (se estiver de volta em Toronto) para analisar tudo. Mas, continuando com as visualizações, a próxima é seu FG% por *feet*.

<img src="{{ site.url }}{{ site.baseurl }}/assets/img/posts/raps-shotcharts-imgs/2019-20/pascalsiakam_fg_per_feet.png" style="zoom: 20%;" />

<img src="{{ site.url }}{{ site.baseurl }}/assets/img/posts/raps-shotcharts-imgs/2020-21/pascalsiakam_fg_per_feet.png" style="zoom: 20%;" />

Nessa imagem percebemos que seus arremessos de 2 perto da cesta parecem bem similares, porém ele teve um jogo bem mais sólido nos *mid-ranges*. Mas também é bem claro que seus arremessos de 3 decaíram nessa temporada.

###  OG Anunoby

Por último mas não menos importante: OG. OG teve uma temporada SENSACIONAL (sim, eu estou bem animado) e não temos nenhum motivo para não estarmos animados para sua próxima temporada.

<img src="{{ site.url }}{{ site.baseurl }}/assets/img/posts/raps-shotcharts-imgs/2019-20/oganunoby.png" style="zoom: 12.5%;" />
<img src="{{ site.url }}{{ site.baseurl }}/assets/img/posts/raps-shotcharts-imgs/2020-21/oganunoby.png" style="zoom: 12.5%;" />


Olhem para essa imagem... ele só melhorou. E eu só estou falando de seu jogo ofensivo, porque todo mundo sabe que OG já é um defensor de elite. A única coisa que vou discordar dos dados é que eu tenho CERTEZA que ele não errou nenhum arremesso de *mid-range*... porque todos que eu assisti ele tentar ele acertou. Mas já que os dados estão falando...

De qualquer forma, eu (e os dados) não temos nada de ruim para falar do OG nessa temporada, ele foi verdadeiramente sensacional. Vamos olhar seu próximo gráfico.

<img src="{{ site.url }}{{ site.baseurl }}/assets/img/posts/raps-shotcharts-imgs/2019-20/oganunoby_fg_per_feet.png" style="zoom: 20%;" />

<img src="{{ site.url }}{{ site.baseurl }}/assets/img/posts/raps-shotcharts-imgs/2020-21/oganunoby_fg_per_feet.png" style="zoom: 20%;" />

Novamente, basicamente os mesmos arremessos com a adição de um jogo de *mid-range*. Sim, seu FG% está um pouco (bem pouco) pior, mas ele arremessou muito mais nesse ano que no ano passado. Ou seja, ele teve muito mais toques ofensivamente e basicamente manteve sua eficiência (que já era alta)... parece muito bom pelos meus critérios.

## As tabelas

Eu também vou deixar algumas tabelas para aqueles que gostam de tabelas. Pode ser útil se você quiser analisar mais os gráficos que mostrei.

| Toronto Raptors 2019-20 Shooting Splits |            |               |     FG (%) |               |             |
| :-------------------------------------- | ---------: | ------------: | ---------: | ------------: | ----------: |
|                                         | Kyle Lowry | Fred VanVleet | OG Anunoby | Pascal Siakam | Full Roster |
| Mid-Range                               |      37.66 |         31.15 |      33.33 |         31.37 |       35.77 |
| In The Paint (Non-RA)                   |       40.3 |         22.06 |      29.73 |          37.8 |       38.12 |
| Restricted Area                         |      59.07 |         51.48 |      63.29 |         64.19 |       61.11 |
| Above the Break 3                       |      36.12 |         38.39 |      37.74 |         35.48 |       37.35 |
| Left Corner 3                           |      40.74 |         42.42 |      38.71 |         33.33 |       38.75 |
| Right Corner 3                          |       12.5 |         43.33 |      41.67 |         41.46 |       37.76 |
|                                         |            |               |            |               |             |

| Toronto Raptors 2020-21 Shooting Splits |            |               |     FG (%) |               |             |
| :-------------------------------------- | ---------: | ------------: | ---------: | ------------: | ----------: |
|                                         | Kyle Lowry | Fred VanVleet | OG Anunoby | Pascal Siakam | Full Roster |
| Mid-Range                               |      38.55 |         37.27 |      39.39 |         38.58 |       38.97 |
| In The Paint (Non-RA)                   |       37.5 |         31.73 |       32.2 |         42.48 |       38.62 |
| Restricted Area                         |      63.64 |            50 |      68.26 |         62.73 |       62.48 |
| Above the Break 3                       |      38.94 |         38.33 |      38.35 |         29.57 |       36.74 |
| Left Corner 3                           |         50 |         17.86 |      42.37 |         24.14 |       37.54 |
| Right Corner 3                          |      42.86 |            32 |       40.3 |         36.67 |       38.36 |

#  Conclusão

Eu fiz esse projeto buscando mais experiência com visualizações em basquete e porque eu também queria ver se conseguia achar alguns *insights* nessa temporada caótica. A partir dessas visualizações, nós observamos alguns padrões que podem justificar parte dos problemas, como por exemplo, a falta de um pivô confiável durante grande parte da temporada. Também teve o fato de que vários jogadores passaram por protocolos de saúde e segurança por conta do COVID. E é claro, estarem longe de Toronto. As consequências do COVID e a "parede" que Freddy falou que estavam atigindo depois de jogar um pouco é um grande fator que deve ser levado em conta.

Por conta disso, **caótico** é talvez a palavra que melhor defina essa temporada. E os dados podem não mostrar tudo isso, mas aparentam mostrar alguma coisa.

# Extra

Bem, como eu disse anteriormente, eu fiz esse projeto para aprender e também ter alguma diversão explorando os dados dos Raptors. Eu não sou um especialista em basquete e minhas análises podem sim ter alguns erros em alguns casos. De qualquer forma, se tiver qualquer sugestão, comentários, etc, é só me mandar um email. Espero que vocês tenham gostado desse artigo. Eu sei que utilizei alguns conceitos em inglês, como as regiões da quadra, mas acredito que os mais familiarizados com basquete vão entender bem tranquilamente... e qualquer coisa é só dar uma pesquisada bem rápida que acham.

Para quem quiser ver o artigo original em inglês é só entrar no meu [GitHub](https://github.com/lucastassis/raptors-shotcharts).

Curiosamente, hoje, dia 13 de junho de 2021, fazem exatamente 2 anos que a franquia alcançou seu primeiro campeonato da NBA. Sério... não tive intenção de fazer isso justamente hoje...