---
latexEquation: false
title: "Análisando os dados dos finalistas do CBLOL 20019 - 2ª split"
header:
  teaser: "/assets/img/posts/cblol-19-2/logo-cblol.png"
excerpt: "Neste post eu realizo uma análise exploratória dos dados do CBLOL 2019 - 2ª Split"
toc: true
categories:
  - CoolStuffs
tags:
  - Data Science
---

# Introdução
Desde 2015 eu passei a acompanhar o cenário competitivo de _League of Legends_ no Brasil. Diferentemente do [Gabriel](http://computacaointeligente.com.br/sobre/), que joga LOL desde sua criação e foi [responsável direto](https://www.youtube.com/watch?v=f18hyf2UqSQ) para que um dos maiores jogadores do cenário conhecesse o jogo, o  meu caso foi um pouco diferente. Eu não jogava o MOBA da RIOT. Eu cai nesse universo por uma recomendação de vídeo do YouTube. Bom, pelo visto o algoritmo de recomendação da plataforma funcionou bem e aqui estou eu hoje realizado essa análise pré-final do 2ª split de 2019.

Portanto, neste post eu apresento uma análise exploratória dos dados do 2ª split do CBLOL dos dois finalistas: INTZ e Flamengo. Os dados foram obtidos através de um _crawler_ muito simples no site do [torneio](https://br.lolesports.com/agenda/cblol-2019-etapa-2) na RIOT. Eu ainda vou montar um _dataset_ com os dados de todos os times e disponibilizar para quem quiser brincar com eles. Por hora, coletei dados apenas dos dois finalistas.

Mas por que estou fazendo este post? Primeiramente, eu estava curioso com algumas opiniões em relação aos times. Logo, nada melhor que olhar para os dados para entendê-las. Segundo, essa é uma maneira de praticar conhecimentos e terceiro, sou torcedor da INTZ e estou _hypado_ para a final. Em relação a isso, torcedores do Flamengo, não se preocupe, vou ser 100% imparcial na análise.

# Sobre o dataset e a análise
Como disse anteriormente, eu obtive os dados diretamente do site da RIOT. O que eu tenho hoje são 25 partidas da INTZ (21 da fase regular + 4 da semifinal) e 24 do Flamengo (21 da fase regular + 3 da semifinal). Para a INTZ são 14v e 11d e para o Flamengo são 18v e 5d.

Obviamente, não é possível cravar muitas coisas com uma quantidade de dados pequenas. Portanto, o que eu faço é uma análise exploratória para encontrar _insights_ para a final que vai acontecer amanhã. Primeiro passo por dados gerais e depois tento responder algumas perguntas que vem sendo levantadas ao longo do split. Eu realmente queria analisar muito mais do que vou apresentar aqui, mas por questões de tempo e disponibilidade, é o que temos pra hoje. Lembrando que faço isso nas minhas horas livres e não estou sendo pago ou financiando para isso (mas caso queira pagar, estamos ai Orgs xD)

Caso você nunca tenha acessado este blog (o que é possível, uma vez que ele é bem técnico e de nicho), sinta-se livre para entrar em contato para saber mais sobre os dados. De antemão, informo que vou fazer outra análise após a final. Só não prometo quando. Mas, sem mais delongas, vamos aos dados!

# Estatísticas gerais dos times
## Tempo de partida, vitórias e derrotas
Para começar vamos dar uma olhada no famoso tempo de jogo de cada time. Este que era um critério de desempate importante nas antigas MD2s. Levantei a primeira pergunta: **o lado do mapa afeta o tempo de partida dos times?** Bom, isso me gerou o seguinte _boxplot_:

<figure style="width: 490px; height: 450px;" class="align-center">
  
  <img src="{{ site.url }}{{ site.baseurl }}/assets/img/posts/cblol-19-2/time_per_side.png" alt="">

  <figcaption style="text-align: center;">
    Figura 1: Tempo de partida de cada time considerando os lados do mapa
  </figcaption>

</figure>


Para quem não conhece o _boxplot_ é um diagram que apresenta a distribuição dos dados de acordo com quartis ([clique aqui](https://operdata.com.br/blog/como-interpretar-um-boxplot/) para saber mais). No centro da figura, em cor clara, estão os dados considerando ambos os lados. Na esquerda encontramos o lado azul e na direita o vermelho. De maneira geral, a INTZ tem uma mediana de tempo um pouco superior a do Flamengo. Além disso, Os dados mostram que a INTZ leva mais tempo nos jogos do lado vermelho e menos nos do lado azul. Com o Flamengo é o contrário. O Lado vermelho deles é mais rápido.

Outra pergunta que me fiz: **qual tempo de partida quando time ganha e quando perde?** A resposta está na Figura 2.

<figure style="width: 490px; height: 400px;" class="align-center">
  
  <img src="{{ site.url }}{{ site.baseurl }}/assets/img/posts/cblol-19-2/time_per_victory.png" alt="">

  <figcaption style="text-align: center;">
    Figura 2: Tempo de partida de cada time considerando vitória ou derrota
  </figcaption>

</figure>

Novamente uma diferença. O Flamengo demora menos pra ganhar e mais para perder. O que é algo bem desejável.

Outra pergunta em relação a vitória/derrotas é: **qual o desempenho das equipes em ambos os lados?** A Figura 3 responde essa pergunta.

<figure style="width: 490px; height: 400px;" class="align-center">
  
  <img src="{{ site.url }}{{ site.baseurl }}/assets/img/posts/cblol-19-2/win_lose_per_side.png" alt="">

  <figcaption style="text-align: center;">
    Figura 3: Número de vitórias e derrotas de acordo com o lado das equipes
  </figcaption>

</figure>

Observe que para o Flamengo, não faz tenta diferença, agora para a INTZ é possível observar que time tem 8v do lado azul e 8d do lado vermelho. Logo, o lado vermelho aparenta ser um ponto fraco da equipe ao longo do split.

## Picks e bans

Recentemente, assitindo a LEC, vi os comentaristas dizendo sobre a variação de picks que a G2 possui. Logo, me fiz a seguinte pergunta: **quantos picks diferentes FLA e ITZ utilizaram no CBLOL?**. No gráfico a seguir, é mostrado os picks por rota e o total. É importante ressaltar, que neste caso, é considerado a posição e não os jogadores.


<figure style="width: 490px; height: 400px;" class="align-center">
  
  <img src="{{ site.url }}{{ site.baseurl }}/assets/img/posts/cblol-19-2/champs_variation.png" alt="">

  <figcaption style="text-align: center;">
    Figura 4: Número de picks diferentes por cada equipe e por rota
  </figcaption>

</figure>

No total, o FLA tem 11 picks a mais do que a INTZ. Essa parte é interessante pois, mesmo utilizando mais jogadores no campeonato, a INTZ tem menos picks diferentes. Além disso, o TOP da INTZ é a posição que mais tem campeões diferentes. Ok, mas, **quais são os campeões mais utilizados por cada equipe?** Não se preocupe, eu tenho a resposta (ou melhor, os dados têm):

<figure style="width: 490px; height: 410px;" class="align-center">
  
  <img src="{{ site.url }}{{ site.baseurl }}/assets/img/posts/cblol-19-2/most_common_champs_itz.png" alt="">

  <figcaption style="text-align: center;">
    Figura 5: Os 7 campeões mais pickados da INTZ
  </figcaption>

</figure>

<figure style="width: 490px; height: 400px;" class="align-center">
  
  <img src="{{ site.url }}{{ site.baseurl }}/assets/img/posts/cblol-19-2/most_common_champs_fla.png" alt="">

  <figcaption style="text-align: center;">
    Figura 6: Os 7 campeões mais pickados do FLA
  </figcaption>

</figure>

Do lado da INTZ, destaca-se o famoso Gragas do Shini e o Aatrox, que aparece tanto no top quanto no mid. Já do lado do FLA, o TK é o campeão mais frequente. E sobre os bans? Você já se perguntou **quais são os mais frequentes?** Eu já!

<figure style="width: 490px; height: 400px;" class="align-center">
  
  <img src="{{ site.url }}{{ site.baseurl }}/assets/img/posts/cblol-19-2/most_ban_champs_itz.png" alt="">

  <figcaption style="text-align: center;">
    Figura 8: Os 7 campeões mais banidos pela INTZ
  </figcaption>

</figure>

<figure style="width: 490px; height: 400px;" class="align-center">
  
  <img src="{{ site.url }}{{ site.baseurl }}/assets/img/posts/cblol-19-2/most_ban_champs_fla.png" alt="">

  <figcaption style="text-align: center;">
    Figura 9: Os 7 campeões mais banidos pelo FLA
  </figcaption>

</figure>

Aparentemente, a INTZ não gosta de jogar contra Sejuani (PEGA SEJUANI SHRIMP!) e o FLA contra o Sylas. Menção honronsa para o FLA banindo o famoso "Yasuo do outro time" 6 vezes. Não estão errados, eu também odeio Yasuo (do meu time).

Para finalizar o assunto picks e bans, outra pergunta levantada foi: **quais os campeões mais pickados por cada jogador?** Veja a seguir:


<figure style="width: 490px; height: 400px;" class="align-center">
  
  <img src="{{ site.url }}{{ site.baseurl }}/assets/img/posts/cblol-19-2/most_pick_champ_by_player_itz.png" alt="">

  <figcaption style="text-align: center;">
    Figura 10: Campeões prediletos de cada jogador da INTZ
  </figcaption>

</figure>

<figure style="width: 490px; height: 400px;" class="align-center">
  
  <img src="{{ site.url }}{{ site.baseurl }}/assets/img/posts/cblol-19-2/most_pick_champ_by_player_fla.png" alt="">

  <figcaption style="text-align: center;">
    Figura 11: Campeões prediletos de cada jogador do FLA
  </figcaption>

</figure>

Olha que interessante, o campeão mais jogado do Shrimp é a Sejuani, a mais banida pela INTZ. Será que ela passa na final? Além disso, Luci pickou TK 10 vezes, maior número dentro os 10 players. Neste ponto, eu não inclui Aoshi, Mills e o Flanalista (Reven), pois eles fizeram poucos jogos. 

## Controle de objetivos
Para tentar identificar como foi o controle de objetivos de cada equipe ao longo dos jogos, levantei os dados em relação a barões, dragões, arautos, inibidores e torres e cada equipe:

|          | INTZ  |       |   | FLA   |       |
|----------|-------|-------|---|-------|-------|
| Objetivo | Total | Média |   | Total | Média |
| Barão    | 19    | 0.76  |   | 24    | 1.00  |
| Dragão   | 39    | 1.56  |   | 62    | 2.58  |
| Arauto   | 16    | 0.64  |   | 13    | 0.54  |
| Torre    | 165   | 6.60  |   | 207   | 8.62  |
| Inibidor | 34    | 1.36  |   | 36    | 1.50  |

Observe que o único objetivo que o FLA não leva vantagem é no arauto. Aliás, este indicativo e o número de dragões, apontam para o que todos dizem: o Flamengo joga para o bot. Além disso, eu me perguntei: **o lado do mapa afeta a equipe na consquista de barão, dragão e arauto?**.  Com isso, eu gerei o as porcentagens de cada monstro em cada lado do mapa:


<figure style="width: 490px; height: 400px;" class="align-center">
  
  <img src="{{ site.url }}{{ site.baseurl }}/assets/img/posts/cblol-19-2/objective_per_side.png" alt="">

  <figcaption style="text-align: center;">
    Figura 12: Porcentagem dos monstros épicos em cada lado do mapa para cada equipe
  </figcaption>

</figure>
O dados apontam que o FLA consegue controlar melhor os objetivos do lado azul. Se justarmos essa informação com de que a INTZ perdeu 8 das 11 partidas do lado vermelho. Acredito que isso indica o lado que o FLA vai priorizar na final.

Para finalizar essa parte, sempre ouço dos jogadores da INTZ que eles são resilientes dentro do jogo. Bom, é difícil medir isso, mas tentado se aproximar de algo assim e com os dados que possuo, me fiz duas perguntas: **quantas vezes o time perdeu o primeiro barão e venceu o jogo?** e **quantas vezes o time perdeu o primeiro inibidor e venceu o jogo?** Encontrei esses númeroas para ambas as equipes. Incluir também o número de vitórias quando o  oposto ocorre.

|                     | INTZ |    |   | FLA |   |
|---------------------|------|----|---|-----|---|
| Situação            | V    | D  |   | V   | D |
| Pegou o 1ª barão    | 12   | 1  |   | 18  | 2 |
| Perdeu o 1ª barão   | 2    | 10 |   | 1   | 3 |
| Pegou o 1ª inibidor | 14   | 2  |   | 18  | 2 |
| Perdeu o 1ª inibdor | 0    | 9  |   | 1   | 3 |

Observe que pegar o 1ª barão ou o 1ª inibidor é impacta muito no resultado de vitórias. Quando as equipes conseguem, elas tendem a vencer e quando não, tendem a perder. Obviamente, isso era esperado. No entanto, com esses dados, não possível encontrar uma resiliência em relação a INTZ. Temos que ter mais informações em relação a isso.

# Estatísticas relacionadas aos jogadores
Nessa segunda parte, quero analisar algumas características em relação aos jogadores. Eu tenho _N_ perguntas em relação a isso, mas infelizmente não tenho tempo para analisar todas elas. Vou fazer isso com os dados da final nas próximas semanas. Por hora, vou verificar o impacto geral dos jogadores dentro do jogo, se o Envy realmente foi outro jogador na semi-final e o famoso brTT x MicaO.

Para começar, vamos analizar o gráfico de todos os jogadores em relação ao ouro conquistado e o dano total causado na partida. Os valores apresentados são as médias obtidas ao longo do split.

<figure style="width: 490px; height: 400px;" class="align-center">
  
  <img src="{{ site.url }}{{ site.baseurl }}/assets/img/posts/cblol-19-2/gold_per_total_damage.png" alt="">

  <figcaption style="text-align: center;">
    Figura 13: Scatter plot do ouro conquistado pelo total de dano causado pelos jogadores ao longo do split.
  </figcaption>

</figure>

Como esperado temos os suportes no canto inferior esquerdo, ou seja, eles quase não tem acesso a recurso e contribui pouco para dano na partida. No canto superior direito, estão os atiradores. Muito recurso e muito dano. Um pouco abaixo, os _solo laners_ e na sequência os _junglers_. Esre gráfico, mostra que no dano geral, as equipes são parecidas na distribuição de recurso. Porém, no dano diretamente ligado a campeões, o panorama muda sutilmente:


<figure style="width: 490px; height: 400px;" class="align-center">
  
  <img src="{{ site.url }}{{ site.baseurl }}/assets/img/posts/cblol-19-2/gold_per_total_damage_to_champ.png" alt="">

  <figcaption style="text-align: center;">
    Figura 14: Scatter plot do ouro conquistado pelo total de dano causado a campeões pelos jogadores ao longo do split.
  </figcaption>

</figure>

Podemos observar que no dano causado diretamente a campeões, Micao se destaca entre os jogadores. Ele recebe um pouco menos de recurso do que o brTT e consegue causar mais dano. Do lado do FLA o mesmo acontece com o Robo, porém, ele recebe ainda menos recurso do que os atiradores. Esse gráfico mostra que ambas as equipes colocaram bastante recurso em suas respectivas _bot lanes_, o que vai ao encontro com os números da tabela que mostra a % de ouro, dano total e dano a campeões de cada jogador:

| Jogador     | % ouro | % dano total | % dano a campeões |
|-------------|--------|--------------|-------------------|
| ITZ Tay     | 21.20  | 22.61        | 21.11             |
| ITZ Shini   | 19.28  | 22.37        | 17.03             |
| ITZ Envy    | 21.54  | 24.39        | 21.46             |
| ITZ micaO   | 23.59  | 26.36        | 28.79             |
| ITZ RedBert | 14.36  | 4.25         | 11.58             |
|             |        |              |                   |
| FLA Robo    | 21.33  | 23.88        | 25.04             |
| FLA Shrimp  | 19.64  | 21.64        | 17.38             |
| FLA Goku    | 21.08  | 22.62        | 21.75             |
| FLA brTT    | 23.75  | 27.55        | 23.44             |
| FLA Luci    | 14.17  | 4.28         | 12.36             |


Observe que no dano total, ambos os atiradores são os líderes de dano do do time. Porém, no dano causado diretamente a campeões, o Micao aumenta sua % e brTT cai cerca de 4%, deixando a liderança do seu time para o Robo. Nessa linha, eu investiguei alguns números diretamente relacionados aos atiradores. A gente ouve muita discursão em rede social sobre isso. Portanto, vamos deixar que os números falem. 

## Análise dos atiradores
Primeiramente, eu cálculei a razão de dano _vs_ ouro recebido para cada jogador. Neste caso, quanto maior melhor. Isso significa que você está convertendo o ouro que você recebe em dano. Para dano em campeões a razão do Micao é 1.18 e a do brTT é 1.07. Já para dano total, a razão é 14.34 para Micao e 14.41 para brTT. Portanto, ambos os números são próximos, mas Micao leva vantagem no dano a campeões e brTT no dano total. Isso mostra que Micao não fica tão posicionado assim nas TFs xD.

Agora, vamos comparar os números deles no ao longo do tempo de jogo. Esses números estão divididos de 0 a 10 min, de 10 a 20 min e no geral. Todos os dados são médios e considera apenas as partidas que eles participaram (obviamente).


|           | 0-10   |      |        |   | 10-20  |      |        |   | Geral |       |        |
|-----------|--------|------|--------|---|--------|------|--------|---|-------|-------|--------|
|           | Ouro   | Creep | XP     |   | Ouro   | Creep | XP     |   | KDA   | Visão | Ouro   |
| ITZ micaO | 296.04 | 8.13 | 325.02 |   | 435.13 | 9.98 | 459.91 |   | 6.10  | 41.66 | 13.89k |
| FLA brTT  | 296.92 | 8.41 | 325.83 |   | 453.70 | 9.69 | 472.29 |   | 4.89  | 30.41 | 14.13k |


No _early game_ os números são bem parecidos, o que mostra que ambos tem uma fase de rotas sólida. No _mid game_ brTT leva vantagem no ouro e na XP, mas perde no CS. Achei esse resultado estranho, e busquei explicação. Ao analisar a quantidade de monstros neutros que cada atirador pega na sua própria _jungle_ achei uma explicação justa. Ao longo do jogo a média do brTT é 18.04 monstros farmados na própria _jungle_, enquanto micão é 15.83. Logo, o FLA da um poquinho mais de recurso para o brTT nesse sentido. No geral, o KDA do Micao é melhor e no ouro brTT continua com acesso a mais recurso. Por fim, entra um dado que colabora com os analistas ao chamar Micao de ADC _utility_. Micao tem mais de 10 pontos de visão a mais do que brTT.

Traçando uma conclusão em relação a todos esses dados dos atiradores, é possível perceber que ambos são bem parecidos de acordo com os dados obtidos. Porém, Micao tem a vatangem de converter mais dano a campeões com menos ouro, refletindo no seu KDA, e de contribuir muito mais com visão do que o brTT. Por outro lado, brTT é o carregador do time dele quando o assunto é dano total e está sempre com farm, ouro e XP a frente. No fim das contas, ambos os times estão bem servidos de atiradores.

## A performance do Envy melhorou na semi-final?
Para finalizar esse post e essa análise, gostaria de analisar essa pergunta. Todos falam: o "Envy só joga nos _playoffs_" ou "Envy carregou a INTZ na semifinal" etc. Bom, vamos aos dados. Para analisar essa pergunta, primeiramente eu plotei o _scatter_ plot do jogador ao longo das partidas do split. A sequência de gráficos abaixo descrevem o dano causado a campeões ao longo do split, o total de dano convertido e o ouro recebido. Cada bolinha é um jogo na ordem cronológica. As últimas 4, representam a semifinal contra a KBM. A ideia é verificar se ele saiu do padrão na semifinal.

<figure style="width: 490px; height: 400px;" class="align-center">
  
  <img src="{{ site.url }}{{ site.baseurl }}/assets/img/posts/cblol-19-2/envy_damage_champs_weeks.png" alt="">

  <figcaption style="text-align: center;">
    Figura 15: Scatter plot do dano que Envy causou a campeões ao longo do split.
  </figcaption>

</figure>

<figure style="width: 490px; height: 400px;" class="align-center">
  
  <img src="{{ site.url }}{{ site.baseurl }}/assets/img/posts/cblol-19-2/envy_damage_weeks.png" alt="">

  <figcaption style="text-align: center;">
    Figura 16: Scatter plot do dano total que Envy longo do split.
  </figcaption>

</figure>


<figure style="width: 490px; height: 400px;" class="align-center">
  
  <img src="{{ site.url }}{{ site.baseurl }}/assets/img/posts/cblol-19-2/envy_gold_weeks.png" alt="">

  <figcaption style="text-align: center;">
    Figura 17: Scatter plot do ouro conquistado por Envy do split.
  </figcaption>

</figure>

Como podemos observar a partir desses dados, o desempenho dele parece estar dentro do padrão que ele exerceu ao longo do split. Assim como fiz para os atiradores, gerei a razão de dando _vs_ ouro para o Envy da fase regular e do da semifinal. Para dano causado a campeões, o valor da fase regular foi de 0.98 e do da semifinal 0.88. Já para o dano total, 14.70 e 13.59. Esses números mostram que durante a fase regular ele conseguiu uma razão melhor do que do da semifinal. Por outro lado, o KDA dele subiu de 3.97 para 10, o que pode causar uma impressão de que a melhora foi absurda.

Por fim, calculei as % de ouro, dano total e dano a campeões em relação a equipe. Esses dados mostram que ele contribuiu um pouco mais nos danos, mas também teve mais acesso a recurso.

| Jogador      | % ouro | % dano total | % dano a campeões |
|--------------|--------|--------------|-------------------|
| Fase regular | 21.28  | 23.96        | 21.08             |
| Semifinal    | 22.60  | 25.99        | 22.75             |


Portanto, os dados mostram que Envy melhorou um pouco, mas que ele tambpem teve performances similares na fase regular. Você pode até dizer que ele melhorou a sua _gameplay_, porém não foi um desempenho completamente absudo como muitos dizem. Por outro lado, isso também mostra que o desempenho dele ao longo do split não foi tão baixo como muitos também disse. 


# Considerações finais
Primeiramente, gostaria de agradecer você que chegou até aqui! Foi divertido e trabalhoso fazer essa análise. Eu gostaria de ter checar muito mais coisas, como Shini x Shrimp, Tay x Robo, Goku x Envy, mas não tive tempo. Vai ficar para os dados da final.

Como um resultado geral, podemos dizer que, novamente o FLA vem como favorito para essa final. Mas, como na primeira, existem diversos outros fatores que não são expostos nestes números, por exemplo, o psicológico, que foi muito comentado. De qualquer forma, espero que seja uma ótima final e que o time vencedor nos respresente bem lá fora! 

Caso você encontre algum problema, tenha alguma sugestão ou por qualquer outro motivo, sinta-se livre para entrar em contato! Até a próxima.
