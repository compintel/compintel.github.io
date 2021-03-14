---
latexEquation: false
title: "Análise da final do CBLOL 2019 - 2ª Split"
header:
  teaser: "/assets/img/posts/cblol-19-2/final/logo-final.png"
excerpt: "O que os dados dizem da final do 2ª split do CBLOL 2019? Este post apresenta um complemento da análise anterior, mas agora incluindo os dados somente da final."
toc: true
categories:
  - CoolStuffs
tags:
  - Data Science
  - League of Legends
  - LOL
  - Data analysis
---

# Introdução
Na semana passada ocorreu a final do CBLOL 2019 - 2ª split. INTZ e Flamengo nos entregaram uma série muito disputada e que desta vez o time carioca devolveu a derrota sofrida no primeiro split e conquistou o seu primeiro CBLOL. Como torcedor da INTZ, obviamente, fiquei triste com o resultado, mas o time desempenhou bem e espero que mantenham a _line-up_ para o próximo split.

Antes da final, para conhecer um pouco melhor sobre os finalistas, [INTZ e Flamengo, eu realizei uma análise exploratória dos dados]({% post_url 2019-09-06-analisando-dados-cblol-2019-2 %}) que se você não viu, sugiro dar uma olhada antes de continuar. A ideia deste post é analisar somente os dados da final e realizar algumas comparações com a análise anterior. Além disso, eu apresento alguns gráficos extras que não foram feitos na última análise, como o dano dos jogadores ao longo dos jogos. Então, sem mais delongas, vamos começar!

# Números gerais da final
## Tempo de partida, vitórias e derrotas
Na análise dos dados pré-final em relação a tempo de partida, vitórias e derrotas, de maneira geral, tivemos três conclusões principais: o Flamengo vencia os jogos mais rápidos do que a INTZ, perdia mais devagar e a INTZ teve problemas para vencer jogos no lado vermelho ao longo do split. Será que isso se repetiu na final? Na tabela a seguir temos a resposta:


| Time | V. Vermelho | V. Azul | Tempo médio vitória | Tempo médio derrota |
|------|-------------|---------|---------------------|---------------------|
| INTZ | 2           | 0       | 31 min              | 29 min              |
| FLA  | 1           | 2       | 29 min              | 31 min              |


As primeiras duas conclusões se mantiveram. **As partidas da INTZ duraram em torno de 2 min a mais** do que as do FLA nas vitórias e a menos nas derrotas. Em relação aos lados, uma surpresa. **A INTZ só venceu do lado vermelho**, o seu lado que aparentava ser mais fraco ao longo do split. Obviamente isso depende muito do meta e precisariamos de mais dados para entender mais a fundo, mas o fato é que nesta final o lado vermelho teve 3 vitorias e o azul 2.


## Picks e bans
Seguindo a mesma sequência da análise dos dados pré-final, vamos falar um pouco dos picks e bans. Para começar, apresento os gráficos com a frequência dos picks e bans de cada equipe:

<figure style="width: 800px; height: 300px;" class="align-center">
  
  <img src="{{ site.url }}{{ site.baseurl }}/assets/img/posts/cblol-19-2/final/freq_itz_pick_ban.png" alt="">

  <figcaption style="text-align: center;">
    Figura 1: Frequência de picks e bans por campeão da INTZ durante os 5 jogos da final
  </figcaption>

</figure>


<figure style="width: 800px; height: 300px;" class="align-center">
  
  <img src="{{ site.url }}{{ site.baseurl }}/assets/img/posts/cblol-19-2/final/freq_fla_pick_ban.png" alt="">

  <figcaption style="text-align: center;">
    Figura 2: Frequência de picks e bans por campeão do Flamengo durante os 5 jogos da final
  </figcaption>

</figure>

Como podemos ver pelos gráficos, houve algumas surpresas, como **Urgot, Heimer e Rumble**. Porém, de maneira geral, os times não fugiram muito do que fizeram ao longo do split. Como previsto, o Flamengo focou os bans principalmente no Skarner e Gragas. Este último, ficou aberto no primeiro jogo, e como já apontávemos na última análise, foi o campeão mais utilizado pelo Shini. Já INTZ focou seus bans na Akali e Yuumi. A Sejuani, campeã predileta do Shrimp, foi banida apenas em 2 jogos. 

Agora falando sobre as surpresas, podemos dizer que foi **muito supreendente** os picks de **Urgot, Gangplank, Heimer e Rumble**. Nenhum dos jogadores, no caso, Tay, MicaO e Goku, utilizaram estes campeões durante o split. O Urgot deu tão certo, que puxou 3 bans ao longo da série do lado do Flamengo. Por sua vez, Heimer e Rumble, não tiveram muito impacto nos jogos.

Por outro lado, podemos listar como **surpreendente** a Irelia nas mãos do Robô. **Este era um pick frequente para o FLA mas no mid, não no top**. Além disso, o pick foi o ponto de virada na série. O desempenho do jogador com a campeã foi excelente, o que impulsionou as duas vitórias necessárias para que o Flamengo conquistasse o campeonato. 

Por fim, também podemos mencionar o Sylas do Envy e a Syndra do Goku. Ambos os jogadores _pickaram_ os campeões apenas uma vez ao longo da temporada e os utilizaram na final. De maneira geral, ambos os picks funcionaram, uma vez que no primeiro jogo o Sylas ficou extremamente forte e no segundo a Syndra foi a responsável pela jogada que decidiu a partida.

## Controle de objetivos
Para mostrar como a série foi disputada, a tabela a seguir descreve os principais objetivos ao longo das partidas:

|          | INTZ  |       |   | FLA   |       |
|----------|-------|-------|---|-------|-------|
| Objetivo | Total | Média |   | Total | Média |
| Barão    | 4     | 0.8   |   | 4     | 0.8   |
| Dragão   | 10    | 2.0   |   | 9     | 1.8   |
| Arauto   | 1     | 0.2   |   | 4     | 0.8   |
| Torre    | 27    | 5.4   |   | 32    | 6.4   |
| Inibidor | 5     | 1.0   |   | 5     | 1.0   |




Diferentemente da fase regular, na qual o Flamengo levou vantagem neste quesito (veja os dados no [post anterior]({% post_url 2019-09-06-analisando-dados-cblol-2019-2 %}), nesta série os números foram bem próximos, com apenas o Arauto destoando para o lado do Flamengo. 

Além disso, outro dado interessante que vai ao encontro da última análise, nos 5 jogos da série, quem fez o barão, ganhou o jogo. Não tivemos nenhum _comeback_, o que seria algo legal para uma final.

# Estatísticas relacionadas aos jogadores
Seguindo o mesmo roteiro, vamos analisar o impacto geral de cada jogador considerando os 5 jogos da série. 

## Dano causado por ouro obtido
Primeiro, vamos conferir o _scatter plot_ dos jogadores em relação ao ouro obtido e o dano total causado na partida. Isso mostra o quanto o jogador consegue converter o ouro que é alocado nele em dano no jogo.


<figure style="width: 490px; height: 400px;" class="align-center">
  
  <img src="{{ site.url }}{{ site.baseurl }}/assets/img/posts/cblol-19-2/final/dano_total_ouro_times.png" alt="">

  <figcaption style="text-align: center;">
    Figura 3: Scatter plot do ouro obtido pelo total de dano causado pelos jogadores ao longo dos 5 jogos da série.
  </figcaption>

</figure>


Através deste último gráfico, podemos ver o **quão impactante o Robo foi na série**. Ele está com média de quase **25k de dano a mais** do segundo colocado, no caso, o Tay. Vale a pena mencionar que com menos ouro, Tay foi o segundo a dar mais dano, seguido por brTT e Envy. Por outro lado, MicaO obteve um resultado pior do que sua média durante a fase regular. Observando os números do jogador, o pior jogo em relação a dano foi o de Ezreal, justamente o 5ª jogo. Neste jogo, MicaO **efetuou 91k de dano total e 8.1k de dano a campeões**. Nos outros 4 jogos anteriores, sua média era de **154.6k** e **14.4k**, respectivamente. Por falar em dano a campeões, vamos dar uma olhada no _scatter plot_ do ouro x dano a campeões:

<figure style="width: 490px; height: 400px;" class="align-center">
  
  <img src="{{ site.url }}{{ site.baseurl }}/assets/img/posts/cblol-19-2/final/dano_camp_ouro_times.png" alt="">

  <figcaption style="text-align: center;">
    Figura 4: Scatter plot do ouro obtido pelo total de dano causado causado a campeões pelos jogadores ao longo dos 5 jogos da série.
  </figcaption>

</figure>

Em relação a dano a campeões, Envy e brTT foram os que mais causaram dano, seguidos por MicaO, Robo e Tay. Para ajudar ainda mais nesta análise, a seguir é apresentado o ranking dos jogadores em relação a razão ouro/dano total e ouro/dano a campeões. A razão mostra o quão boa foi a conversão do ouro em dano. Neste caso, quanto maior o valor, melhor.

<figure style="width: 800px; height: 350px;" class="align-center">
  
  <img src="{{ site.url }}{{ site.baseurl }}/assets/img/posts/cblol-19-2/final/ranking_dano.png" alt="">

  <figcaption style="text-align: center;">
    Figura 5: ranking da razão ouro/dano total e da razão ouro/dano a campeões
  </figcaption>

</figure>

De maneira geral, em relação aos dados de ouro x dano, podemos destacar três pontos principais:

1. Apesar do 5ª jogo fraco, MicaO manteve sua característica de converter bastante dano a campeões com um pouco menos recurso do que os demais carregadores. Por outro lado, o mesmo não se refletiu no dano total.
2. A diferença de desempenho entre os _mid laners_ ao longo da série. Tanto no gráfico de ouro x dano total quanto neste último, podemos observar que o Envy teve  muito mais impacto na série do que o Goku. Porém, Goku recebeu muito menos recurso, o que é refletido nos rankings da Figura 5.
3. O surpreendente desempenho negativo do Shrimp que causou **quase a mesma quantidade de dano a campeões do que o Luci** mas com muito mais recurso disponível. Comparando ele com Shini, podemos observar o quão distante ele ficou do caçador adversário. A título de comparação, nesta série, sua média de dano a campeões foi de **5.6k** e ao longo do split a média foi **10.6k**, quase que o dobro! Isso é refletido no ranking da razão ouro/dano a campeões, na qual **Shrimp ficou em último**.

Com intuito de ver a evolução dos danos totais e a campeões ao longo das 5 partidas, é apresentado o gráfico dos danos de todos os jogadores por partida:

<figure style="width: 800px; height: 390px;" class="align-center">
  
  <img src="{{ site.url }}{{ site.baseurl }}/assets/img/posts/cblol-19-2/final/dano_total_ao_longo.png" alt="">

  <figcaption style="text-align: center;">
    Figura 6: dano total causado pelos jogadores ao longo das 5 partidas
  </figcaption>

</figure>

<figure style="width: 800px; height: 390px;" class="align-center">
  
  <img src="{{ site.url }}{{ site.baseurl }}/assets/img/posts/cblol-19-2/final/dano_camp_ao_longo.png" alt="">

  <figcaption style="text-align: center;">
    Figura 7: dano a campeões causado pelos jogadores ao longo das 5 partidas
  </figcaption>

</figure>

De maneira geral, podemos observar que em relação ao dano total o **Robo se manteve bem em todos jogos**, mesmo os que o time perdeu. De maneira oposta, no gráfico de dano a campeões, Shrimp está sempre **muito próximo da curva dos suportes**, o que não é muito bom para uma _role_ que pega recurso como a dele. Por fim, existe uma tendência de queda da INTZ ao longo dos jogos. Destaque para como o MicaO foi caindo no dano total e o Shini despencou no dano a campeões na última partida.


## Divisão de recurso e dano

Em relação a divisão em % de recurso e dano, a final apresentou os seguintes números:


| Jogador     | % ouro | % dano total | % dano a campeões |
|-------------|--------|--------------|-------------------|
| ITZ Tay     | 21.94  | 26.64        | 24.21             |
| ITZ Shini   | 18.89  | 22.71        | 17.11             |
| ITZ Envy    | 24.05  | 24.98        | 25.52             |
| ITZ micaO   | 21.69  | 21.11        | 24.65             |
| ITZ RedBert | 13.41  | 4.51         | 8.47              |
|             |        |              |                   |
| FLA Robo    | 24.82  | 29.64        | 27.11             |
| FLA Shrimp  | 18.31  | 20.13        | 11.59             |
| FLA Goku    | 19.18  | 20.02        | 22.22             |
| FLA brTT    | 23.76  | 25.76        | 28.17             |
| FLA Luci    | 13.90  | 4.45         | 10.88             |


Em comparação com os mesmos dados dos dados pré-final, podemos detacar em ambas as equipes:
- Tay manteve sua % de ouro mas aumentou em cerca de **4% seu dano total** e 3% o dano a campeões
- Envy aumentou sua % de auro em cerca de 3%, o que refletiu na mesma quatia no dano a campeões
- MicaO obteve cerca de -3% de ouro o que refletiu em **-4% de dano total e a campeões**
- Robo obteve cerca de 2.5% de ouro a mais, **causou +6% de dano total** e +2% em campeões
- Goku perdeu cerca de 2% de ouro, causo -2.5% de dano total e -1.5% de dano a campeões
- Shrimp obteve cerca de 1% a menos de ouro, -1% de dano total e **cerca de -6% de dano a campeões**

Esses números mostram que Robô e o Tay foram os que mais cresceram de produção na final. Por fim, o ranking de KDA (ou AMA, como preferir) dos jogadores é apresentado na sequência:


<figure style="width: 490px; height: 400px;" class="align-center">
  
  <img src="{{ site.url }}{{ site.baseurl }}/assets/img/posts/cblol-19-2/final/kda.png" alt="">

  <figcaption style="text-align: center;">
    Figura 6: ranking do KDA dos jogadores considerando os 5 jogos da série
  </figcaption>

</figure>

Primeiramente, o gráfico é muito afetado pela performance do primeiro jogo da INTZ, que terminou 26 a 6 em abates para os intrépidos. De qualquer forma, é interessante ver que mesmo com todo impacto na série, Robo teve o menor KDA dentre todos os jogadores. Isso mostra que nem sempre o KDA é o mais importante.


# Considerações finais
A final do CBLOL 2019 entregou uma série emocionante de 5 jogos. De acordo com os dados, tivemos uma série disputada, principalmente nos 3 primeiros jogos. Nos 2 últimos, o Flamengo conseguiu dominar um pouco mais a partida, como sugere os gráficos apresentados. Em relação aos jogadores,gostaria de destacar o papel dos _top laners_ nesta final. Obviamente, Robo foi o grande destaque, de acordo com os dados apresentados. Porém, Tay também teve um desempenho destacável, tendo um pico de dano no jogo 2 da final. Além disso, mesmo perdendo, Envy teve um desempenho superior ao Goku. E mesmo ganhando, Shrimp ficou atrás do Shini, exceto no último jogo, na qual Shini não apresentou uma boa performance. 

Por fim, devemos destacar que o melhor time venceu a série. Agora é torcer para que o Flamengo represente bem a região no mundial. Mas para isso, o _mid_ e o _jungler_ precisam melhorar seus números.

Obrigado a você que leu esta análise e espero realizar mais uma antes do prêmio CBLOL para identificar os melhores jogadores por _role_ e _rankear-los_ de acordo com os seus números. Até a próxima!