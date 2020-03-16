---
latexEquation: true
title: "O que os dados dizem sobre o Coronavirus?"
header:
  teaser: "/assets/img/posts/covid-19/corona.jpg"
excerpt: "O novo Coronavírus (Covid-19) foi declarado como uma pandemia na última quarta-feira dia 11 de março de 2020 pela Organização Mundial de Saúde (OMS). Tento entender melhor o vírus olhando para os dados reportados por vários países no mundo."
toc: true
categories:
  - CoolStuffs
tags:
  - Data Science
  - Coronavirus
  - Covid-19
  - Python
  - Data analysis
---

# Introdução
O novo Coronavírus (Covid-19) foi [declarado como uma pandemia](https://www.who.int/dg/speeches/detail/who-director-general-s-opening-remarks-at-the-media-briefing-on-covid-19---11-march-2020) na última quarta-feira dia 11 de março de 2020 pela Organização Mundial de Saúde (OMS). Neste momento, acredito que não exista pessoa nesse globo terrestre que não ouviu falar da doença (aliás, a julgar pelos últimos acontecimentos, talvez exista). Diversos países afetados, muitas mortes confirmadas, economia fortemente afetada etc. 

<figure style="width: 450px; height: 400px;" class="align-center">
  
  <img src="{{ site.url }}{{ site.baseurl }}/assets/img/posts/covid-19/corona.jpg" alt="">

  <figcaption style="text-align: center;">
    Figura 1: Imagem ilustrativa do coronavírus <a href="https://www.health.harvard.edu/diseases-and-conditions/coronavirus-resource-center">[Fonte]</a>
  </figcaption>

</figure>

Enquanto na China, o foco inicial da pandemia, a situação parece estar controlada, do nosso lado do mundo o problema apenas começou. Pensando no Brasil, tivemos os primeiros casos recentemente e já sabemos que o vírus circula entre nós. Mas será que podemos ter uma ideia do que vai acontecer nos próximos dias olhando para os dados de outros países?

Felizmente, pesquisadores da [Johns Hopkins University](https://www.jhu.edu/) estão mantendo um [repositório de dados](https://github.com/CSSEGISandData/COVID-19), que é atualizado diariamente, com dados sobre o ~~Corongavirus~~ Coronavirus de todo o mundo. Eu decidi analisar esses dados para tentar entender um pouco mais o que pode ocorrer com o Brasil nos próximos dias. Obviamente, prever o futuro é impossível. Mas podemos ter uma ideia ao comparar com o padrão dos dados de outros países.

## Avisos
- Primeiramente, não sou virologista. Estou apenas olhando para os dados e tentando traçar um prognóstico. 

- Não vou nem tentar entrar na área biológica do Corona. Para isso, temos material de sobra com o [@oatila](https://twitter.com/oatila) e meu amigo [@ToffoliPandini](https://twitter.com/ToffoliPandini), que aliás escreveu dois posts no seu blog que eu recomendo fortemente a leitura: 
  - [Coronavírus: além do pânico e da histeria](http://papirosgermesefoguetes.blogspot.com/2020/02/coronavirus-alem-do-panico-e-da-histeria.html)
  - [Coronavírus: atualizações, descobertas e uma lenda envolvendo xadrez](http://papirosgermesefoguetes.blogspot.com/2020/03/com-o-avanco-da-doenca-desde-o-final-de.html)

- O código dessa análise está aberto no meu Github. Caso tenha interesse é só [acessar aqui](https://github.com/paaatcha/covid-19).

- Existem mais análise no [Kaggle](https://www.kaggle.com/sudalairajkumar/novel-corona-virus-2019-dataset). Caso queira, tem um thread de discussão lá.

- Todos os dados dessa análise foram coletados no intervalo do dia 22 de janeiro de 2020 até 14 de Março de 2020. Para mais informações, dê um pulinho no [repositório oficial da Johns Hopkins CSSE](https://github.com/CSSEGISandData/COVID-19)

___


# Um resumo do Coronavírus no mundo

Hoje o Coronavírus já chegou nos 5 continentes. São **142 países/regiões** com pelo menos 1 caso do vírus, 41 com pelo menos 100 casos e 30 com **pelo menos 1 morte** registrada. 

Em todo mundo, são **156.102** casos confirmados e **5.819 mortes**. A taxa de mortalidade está em **3,728%**. Obviamente, podem (e devem) existir muitos casos que não são reportados por conta de falta de teste (ou incompetência do governo do país mesmo).

Esses números levam em consideração a China. Se excluirmos os números da China, são **75.125** pessoas infectadas no mundo com **2.626 mortes**. Neste cenário, a taxa de mortalidade é de **3,496%**.

A distribuição de idade dos pacientes infectados é ilustrada na Figura 2.

 
<figure style="width: 550px; height: 400px;" class="align-center">
  
  <img src="{{ site.url }}{{ site.baseurl }}/assets/img/posts/covid-19/distribuicao_idades.png" alt="">

  <figcaption style="text-align: center;">
    Figura 2: Distribuição de idade das pessoas infectadas com Coronavírus
  </figcaption>

</figure>

Nessa distribuição, a maioria das amostras vem da China. Infelizmente, o repositório não possui muitas amostras de idades para mais localidades. De qualquer forma, é possível perceber que a média da distribuição é de aproximadamente 55 anos.

## Alguns dados interessantes dos países mais afetados

Agora vamos olhar os 10 países com os maiores números de pessoas infectadas no mundo.

| País             | Confirmados |   Mortes | Recuperados | % de mortos | % População |
|:-----------------|------------:|---------:|------------:|------------:|------------:|
| China            |       80977 |     3193 |       65660 |    3.94309  | 0.00581426  |
| Itália           |       21157 |     1441 |        1966 |    6.81098  | 0.03501     |
| Iran             |       12729 |      611 |        2959 |    4.80006  | 0.0155611   |
| Coreia do Sul    |        8086 |       72 |         510 |    0.890428 | 0.0156598   |
| Espanha          |        6391 |      195 |         517 |    3.05117  | 0.0136783   |
| Alemanha         |        4585 |        9 |          46 |    0.196292 | 0.0055289   |
| França           |        4480 |       91 |          12 |    2.03125  | 0.00668784  |
| EUA              |        2727 |       54 |          12 |    1.9802   | 0.000833518 |
| Suíça            |        1359 |       13 |           4 |    0.956586 | 0.0159572   |
| Reino Unido      |        1143 |       21 |          19 |    1.83727  | 0.00171908  |


Obviamente, a China aparece em 1ª. Porém, em % de mortos, a Itália possui **6.81% de taxa de fatalidade**, seguida pelo Iran com **4.80%**. Chamam atenção Coréia do Sul e Alemanha com 0.89% e 0.19% respectivamente. Todavia, pode ser que os países não estejam reportando o número de casos. Isso é o que provalmente ocorre na Itália, uma vez que o sistema de saúde do país está extremamente sobrecarregado e não é possível testar todas as pessoas com suspeita do vírus.

Eu também cruzei os dados de infectados com o número de pessoas que vivem no país. No caso da Itália, o número de infectados representa **0.3% da população**. Esse número parece ser pequeno, mas já é suficiente para causar um impacto gigante na vida das pessoas. Mesmo que o país esteja perdendo caso, e é certo que sim, o número não deixa de chamar atenção.

Outra pergunta que me fiz foi: quantos países com número considerável de casos, no caso considerei mais de 200, não possui nenhuma morte?

| País             | Confirmados |   Mortos | Recuperados | 
|:-----------------|------------:|---------:|------------:|
| Barein           |         210 |        0 |          44 |
| Finlândia        |         225 |        0 |           1 |
| Malásia          |         238 |        0 |          35 |
| Catar            |         337 |        0 |           4 |
| Singapura        |         212 |        0 |         105 |

No caso, apenas 5 países no mundo. Porém, pode ser que os casos sejam recentes e não refletem muito a realidade. Vamos subir a régua para mais de 600 e com até 3 mortos.

| País             | Confirmados |   Mortos | Recuperados |
|:-----------------|------------:|---------:|------------:|
| Austria          |         655 |        1 |           6 |
| Dinamarca        |         836 |        1 |           1 |
| Noruega          |        1090 |        3 |           1 |
| Suécia           |         961 |        2 |           1 |

Chama atenção que dos 4 países que cumprem esse requisito, 3 são nórdicos. É um indicativo que o sistema de saúde tem funcionado, mas não é possível afirmar mais do que isso sem um estudo mais aprofundado.

## Pessoas infectadas ao longo dos dias
Uma manteira de perceber o quão rápido o vírus se espalha é plotar o número de casos confirmados ao longo do tempo. Como era de se esperar, a Figura 3 mostra que o **espalhamento é exponencial**.


<figure style="width: 550px; height: 400px;" class="align-center">
  
  <img src="{{ site.url }}{{ site.baseurl }}/assets/img/posts/covid-19/casos_conf_mundo.png" alt="">

  <figcaption style="text-align: center;">
    Figura 3: Casos cofirmados de Coronavírus no mundo ao longo do tempo
  </figcaption>

</figure>

O mesmo pode ser feito para o número de mortes:

<figure style="width: 550px; height: 400px;" class="align-center">
  
  <img src="{{ site.url }}{{ site.baseurl }}/assets/img/posts/covid-19/mortes_mundo.png" alt="">

  <figcaption style="text-align: center;">
    Figura 4: Número de mortos no mundo ao longo do tempo
  </figcaption>

</figure>

Porém, como a epidemia já teve seu pico na China, os dados de lá distorcem um pouco a realidade do resto do mundo. Portanto, vamos plotar o mesmo gráfico sem o caso da China:


<figure style="width: 550px; height: 400px;" class="align-center">
  
  <img src="{{ site.url }}{{ site.baseurl }}/assets/img/posts/covid-19/casos_conf_mundo_sem_china.png" alt="">

  <figcaption style="text-align: center;">
    Figura 5: Casos cofirmados de Coronavírus no mundo SEM a China ao longo do tempo
  </figcaption>

</figure>

Agora sim percebemos um comportamento bem mais exponencial! Os números ainda estão crescendo! E perceba que o vírus começa a realmente se espalhar no mundo por volta do dia 21 de fevereiro. Isso significa que cerca de 25 dias atrás a situação aparentava estar "controlada".

Fazendo o mesmo para o número de mortos, ou seja, retirando os dados da China, nós temos a seguinte curva:

<figure style="width: 550px; height: 400px;" class="align-center">
  
  <img src="{{ site.url }}{{ site.baseurl }}/assets/img/posts/covid-19/mortes_mundo_sem_china.png" alt="">

  <figcaption style="text-align: center;">
    Figura 6: Número de mortos no mundo SEM a China ao longo do tempo
  </figcaption>

</figure>

Como era de se esperar, o número de mortes também crescem exponencialmente e número de vítimas ainda vai crescer bastante.

## Olhando para os dados da China
O que tem sido reportado é que a China está voltando a vida normal. Portanto, vamos analisar o número de caso e de morte do país asiático. 

<figure style="width: 550px; height: 400px;" class="align-center">
  
  <img src="{{ site.url }}{{ site.baseurl }}/assets/img/posts/covid-19/casos_conf_na_china.png" alt="">

  <figcaption style="text-align: center;">
    Figura 7: Casos cofirmados de Coronavírus apenas na China ao longo do tempo
  </figcaption>

</figure>


Olha que interessante, a China está realmente controlando a contaminação. Perceba que a curva segue uma função [sigmoid](https://en.wikipedia.org/wiki/Sigmoid_function) ($$f(x) = \frac{1}{1 + e^{-ax}}$$). Se você não conhece, essa é curva de uma sigmoid:

<figure style="width: 550px; height: 300px;" class="align-center">
  
  <img src="{{ site.url }}{{ site.baseurl }}/assets/img/posts/covid-19/sigmoid.png" alt="">

  <figcaption style="text-align: center;">
    Figura 8: Curva de uma função sigmoid
  </figcaption>

</figure>


 **Acontece que nenhuma epidemia segue uma exponencial/logaritmo e sim uma sigmoid!** No mundo real o número de pessoas é limitado e eventualmente as pessoas morrem. Se infectar todo mundo, matar todo mundo ou parar de infectar, a curva se achata no topo. Logo, o que o mundo está vivendo é a primeira metade de uma função sigmoid! A China já está na parte final, na qual o número de infectados estabiliza. 

Obviamente, o número de mortos segue a mesma curva:

<figure style="width: 550px; height: 400px;" class="align-center">
  
  <img src="{{ site.url }}{{ site.baseurl }}/assets/img/posts/covid-19/mortes_china.png" alt="">

  <figcaption style="text-align: center;">
    Figura 9: Número de mortos apenas na China ao longo do tempo
  </figcaption>

</figure>

Olha que bela sigmoid! Por mais que muitos queiram negar, a ciência funciona e não é fantasia!

# Analisando alguns países isoladamente
Agora vamos dar uma olhada em alguns países no mundo e buscar um padrão dessa sigmoid. Eu separei os dados de Itália, França, EUA, Alemanha, Coréia do Sul, Iran e Espanha. Não vou entrar em detalhes de todos pois o post ficaria imenso. Mas você encontra todos os [gráficos lá no meu Github](https://github.com/paaatcha/covid-19/blob/master/analysis.ipynb).


Dessa lista de países, Itália e Iran estão em situações caóticas. Começando pelo número de infectados, a curva não da nem sinal de recuperação:

<figure style="width: 550px; height: 800px;" class="align-center">
  
  <img src="{{ site.url }}{{ site.baseurl }}/assets/img/posts/covid-19/casos_conf_italia.png" alt="">
  <img src="{{ site.url }}{{ site.baseurl }}/assets/img/posts/covid-19/casos_conf_iran.png" alt="">

  <figcaption style="text-align: center;">
    Figura 10: Casos cofirmados de Coronavírus na Itália (acima) e Iran (abaixo) ao longo do tempo
  </figcaption>

</figure>

Perceba que do dia 12 de março para o dia 14, o número de casos subiu radicalmente. Chama a atenção pois a Itália entrou em quarentena. Portanto, ou as pessoas não estão cumprindo ou só divulgaram esses dados agora. Vamos ter que aguardar mais tempo para saber mais. 

Como já vimos nas tabelas anteriores, Iran e Itália estão com altos números de mortos:


<figure style="width: 550px; height: 800px;" class="align-center">
  
  <img src="{{ site.url }}{{ site.baseurl }}/assets/img/posts/covid-19/mortes_na_italia.png" alt="">
  <img src="{{ site.url }}{{ site.baseurl }}/assets/img/posts/covid-19/mortes_na_iran.png" alt="">

  <figcaption style="text-align: center;">
    Figura 11: Número de mortos apenas na Itália (acima) e Iran (abaixo) ao longo do tempo
  </figcaption>

</figure>

Perceba que no mesmo período do dia 12 de março para o dia 14, o número de mortos quase dobra na Itália. Pode ser que estão reportando com um pouco de atraso, mas é impressionante de qualquer forma. 


França, EUA, Alemanha e Espanha também estão com curvas bem acentuadas (ver Figura 13) e não vou gastar muito tempo com eles aqui pois quero destacar o caso da Coréia do Sul. Vamos dar uma olhada nos casos confirmados ao longo do tempo:

<figure style="width: 550px; height: 400px;" class="align-center">
  
  <img src="{{ site.url }}{{ site.baseurl }}/assets/img/posts/covid-19/casos_conf_coreia.png" alt="">

  <figcaption style="text-align: center;">
    Figura 12: Casos cofirmados de Coronavírus na Coréia do Sul ao longo do tempo
  </figcaption>

</figure>

Perceba que a Coréia do Sul já atingiu a segunda metade da sigmoid. Isso significa que o país está seguindo a curva da China e começando a superar a epidemia. Dessa lista de países citados acima, ela é a única que a epidemia está diminuindo ao invés de aumentando. Isso é mostrado na próxima figura, na qual todos os gráficos são plotados juntos:

<figure style="width: 550px; height: 400px;" class="align-center">
  
  <img src="{{ site.url }}{{ site.baseurl }}/assets/img/posts/covid-19/casos_confirmados_paises.png" alt="">

  <figcaption style="text-align: center;">
    Figura 13: Comparando a curva de casos confirmados ao longo do tempo entre os países
  </figcaption>

</figure>

Observe como a curva da Coréia do Sul se difere das demais e como Itália e Iran estão bem mais íngreme.


# Analisando como a epidemia começou nos países
Para concluir esse post, quero observar como é a curva de casos no começo da epidemia. Minha intenção é encontrar um padrão e fazer um prognóstico para o Brasil, uma vez que o Corona acabou de chegar por aqui.

Vamos comparar a curva Brasileira com Itália, Iran, França, Espanha e Alemanha. Para mais países, novamente, dê uma olhada no meu [Github](https://github.com/paaatcha/covid-19/blob/master/analysis.ipynb). Para começar, vamos a curva Brasileira:


<figure style="width: 550px; height: 400px;" class="align-center">
  
  <img src="{{ site.url }}{{ site.baseurl }}/assets/img/posts/covid-19/prim_casos_conf_brasil.png" alt="">

  <figcaption style="text-align: center;">
    Figura 14: Casos cofirmados de Coronavírus no Brasil ao longo do tempo
  </figcaption>

</figure>

Perceba que do dia 13 para 14 de março o número se manteve. Isso por que o Ministério da Saúde anunciou que [não vai mais testar todas as pessoas, apenas internados](https://saude.estadao.com.br/noticias/geral,internacao-por-gripe-grave-sera-criterio-para-testar-para-novo-coronavirus,70003226350). Segundo especialistas, isso é preocupante. Prejudica um pouco análise, mas é que temos para hoje!

Vamos observar os gráficos dos demais países no começo da epidemia, ou seja, antes de 1000 infectados:

<figure style="width: 550px; height: 2000px;" class="align-center">
  
  <img src="{{ site.url }}{{ site.baseurl }}/assets/img/posts/covid-19/prim_casos_conf_italia.png" alt="">
  <img src="{{ site.url }}{{ site.baseurl }}/assets/img/posts/covid-19/prim_casos_conf_iran.png" alt="">
  <img src="{{ site.url }}{{ site.baseurl }}/assets/img/posts/covid-19/prim_casos_conf_france.png" alt="">
  <img src="{{ site.url }}{{ site.baseurl }}/assets/img/posts/covid-19/prim_casos_conf_espanha.png" alt="">
  <img src="{{ site.url }}{{ site.baseurl }}/assets/img/posts/covid-19/prim_casos_conf_alemanha.png" alt="">

  <figcaption style="text-align: center;">
    Figura 15: Casos cofirmados de Coronavírus na Itália, Iran, França, Espanha e Alemanha no começo da epidemia
  </figcaption>

</figure>

Observe que se os números corretos fossem divulgados pelo governo Brasileiro para o dia 14 de março, nossa curva estaria muito parecido com as do 5 países acima. Plotando a curva de todos juntos, temos:


<figure style="width: 550px; height: 400px;" class="align-center">
  
  <img src="{{ site.url }}{{ site.baseurl }}/assets/img/posts/covid-19/primeiros_casos_paises.png" alt="">

  <figcaption style="text-align: center;">
    Figura 16: Casos cofirmados de Coronavírus no início da epidemia. Comparação entre os países.
  </figcaption>

</figure>

Neste último gráfico, podemos perceber que o Brasil segue o padrão (exceto pelo último dia) dos demais países. As datas dos dias não estão especificada no gráfico pois os países apresentaram essas curvas em datas diferentes. 

# Conclusão

O Corona vírus acabou de chegar no país e, comparando com outros países no mundo, podemos esperar um crescimento grande nos próximos dias no nosso país. Infelizmente o governo parou de testar as pessoas e muita gente não está respeitando o isolamento. Isso pode agravar muito a nossa situação. Portanto, faça a sua parte! Evite multidões, lave as mãos, não espirre nos coleguinhas, etc. O vírus pode não ser letal para sua faixa etária, mas você pode contaminar e matar outra, principalmente as mais idosas. Então tenha responsabilidade!


Se você encontrou algum erro ou tem alguma sugestão, sinta-se livre para entrar em contato comigo via e-mail ou twitter.

Até a próxima.