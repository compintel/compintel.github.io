---
latexEquation: true
title: "Modelo de predição linear - Parte 1"
header:
  teaser: "/assets/img/posts/GA/populacoes.png"
excerpt: "O algoritmo genético é um método evolutivo de otimização que se inspira nos princípios da teoria da seleção natural, proposta por Charles Darwin, na qual somente os indivíduos mais aptos sobrevivem para uma próxima geração."
categories:
  - Algoritmos
  - Tutorial
tags:
  - Machine learning
  - Python
---

# Introdução

Hoje assunto será o modelo de predição linear. Este modelo é bem antigo e vem sendo utilizado na estatística por mais de 30 anos. Como o próprio nome sugere, o modelo linear parte do princípio que o seu problema pode ser aproximado linearmente, ou seja, se ele for um modelo 2D, ele deve ser aproximado por uma reta. Daí você pode estar se perguntando: mas a maioria dos problemas do mundo são não lineares. Pra que aprender isso? Bom, é verdade que aproximações lineares são raras. Porém, o modelo linear pode ser utilizado em alguns problemas. Mas o mais importante é que esse modelo é uma excelente iniciação na área de *machine learning* , uma vez que podemos trabalhar conceitos importantes mas de maneira simples, pois o problema é mais simples. Sendo assim, acho muito interessante esse ponto e por isso estou escrecendo este post.

<figure style="width: 700px;" class="align-center">
  
  <img src="{{ site.url }}{{ site.baseurl }}/assets/img/posts/modelo-linear/ex-reg-linear.png" alt="">

  <figcaption style="text-align: center;">
    Figura 1: Exemplo de uma regressão linear retirado de [[1]](#fukunaga)
  </figcaption>

</figure> 

Para melhor trabalhar o tema, ele foi divido em dois posts e esta é a parte 1. Nela vamos discutir a natureza matemática do problema e já apresentar a primeira solução para ele. Já aviso que será um post que vai misturar estatística, matemática e programação, ou seja, vamos discutir o modelo teórico e vamos implementá-lo em Python. Sem mais delongas, vamos iniciar!

# O modelo linear
Vamos iniciar a descrição do nosso modelo linear com um pequeno exemplo. Imagine que você precisa desenvolver um modelo para estimar a idade de uma pessoa tendo como informação apenas a altura e o peso da mesma. Bom, provavelmente isso seja impossível, é necessário mais dados, mas vamos fingir que isso é o suficiente. Neste caso, temos uma variável $$ X $$ de duas dimensões assumindo os valores de altura ($$ x_1 $$) e peso ($$ x_2 $$). Por outro lado, temos uma variável de saída $$ y $$ que será o resultado, no caso a idade da pessoa. Vamos supor que já sabemos como resolver esse problema e para descobrir a idade temos que aplicar a seguinte função linear:

$$
y(x_1, x_2) = 3.11 + 8.8x_1 + 0.1x_2
\tag{1}
$$

Sendo assim, segundo nossa equação, uma pessoa com 90kg e 1.90m de altura, terá por volta de 28 anos (mais uma vez, isso é apenas uma ilustração).

$$
y(1.9, 90) = 3.11 + 8.8 \times 1.9 + 0.1 \times 90 = 28.83
\tag{2}
$$

O ponto aqui é que as variáveis chaves da nossa equação 2 são valores $$ 3.11, 8.8 $$ e $$ 0.1 $$. **A pergunta que temos que fazer aqui é: como descobrir esses valores?** Até porque são eles que vão regir o modelo. Para começar. precisamos generalizar o nosso problema. Primeiramente, podemos utilizar a seguinte generalização:

$$
y(x_1, x_2) = a + bx_1 + cx_2
\tag{3}
$$

Agora fica claro que desejamos encontrar os valores de $$a, b $$ e $$ c $$. Porém, essa generalização não é suficiente. Ela assume que o problema será sempre de duas dimensões, ou seja, teremos sempre $$ x_1 $$ e $$ x_2 $$. Portanto, para uma geralização completa, asssumimos uma entrada  $$ X = (X_1, X_2, \cdots, X_p) $$, na qual $$ p $$ será a dimensão do problema, e uma saída $$ \hat{Y} $$. Com isso, nosso problema, finalmente, será representado por:

$$
\hat{Y}(X) = W_0 + \sum_{j=1}^p X_jW_j
\tag{4}
$$

Sendo que o objetivo aqui é determinar o valor de $$ W_0 $$ e os valores de $$ W_j $$, nossos antigos $$a, b $$ e $$ c $$. A variável $$ \hat{Y} $$ ganhou um "chapéu" pois ela representa um valor estimado, ou seja, é uma aproximação do mundo real, mas pode não ser a realidade. Se voltarmos ao nosso exemplo de estimar a idade da pessoa, segundo nossa equação 4, a variável $$ X $$ armazenaria dados de $$ N $$ pessoas com dimensão $$ p $$. Como uma pessoa, neste problema, é presentada por duas variáveis (altura e peso), se tivermos 10 pessoas, $$ X $$ seria uma matriz $$ N \times p $$, na qual cada linha contém uma pessoa. Por sua vez, $$ Y $$ seria um array com $$ N $$ idades, uma para cada pessoa da matriz $$ X $$.

## Um truque matemático

Para facilitar a manipulação matemática e a implementação do modelo linear, é utilizado a forma matricial 

# Referências
<a name="intro">[1]</a> James, Gareth, Daniela Witten, Trevor Hastie, and Robert Tibshirani. An introduction to statistical learning. Vol. 112. New York: springer, 2013.