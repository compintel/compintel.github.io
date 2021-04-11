---
latexEquation: true
title: "K vizinhos mais próximos - KNN"
header:
  teaser: "/assets/img/posts/knn/knn.jpg"
excerpt: "O KNN foi proposto por Fukunaga e Narendra em 1975. É um dos classificadores mais simples de ser implementado, de fácil compreensão e ainda hoje pode obter bons resultados dependendo de sua aplicação"
categories:
  - Algoritmos
tags:
  - Classificação de dados
  - Machine learning
  - KNN
  - Python
---

# Introdução

Após um pequeno hiato no blog, hoje vamos falar um pouco sobre um dos classificadores clássicos mais conhecidos, o K vizinhos mais próximos (do inglês:*K nearest neighboors* – KNN). O KNN foi proposto por Fukunaga e Narendra em 1975 [[1]](#fukunaga). É um dos classificadores mais simples de ser implementado, de fácil compreensão e ainda hoje pode obter bons resultados dependendo de sua aplicação. Antes de iniciar, caso você não tenha afinidade com o problema de classificação, sugiro que leia nosso post sobre [classificação de dados]({% post_url 2016-11-04-classificacao-de-dados %}). Agora, sem mais delongas, vamos ao que interessa.

# Funcionamento do KNN

A ideia principal do KNN é determinar o rótulo de classificação de uma amostra baseado nas amostras vizinhas advindas de um conjunto de treinamento. Nada melhor do que um exemplo para explicar o fucionamento do algoritmo como o da Figura 1, na qual temos um problema de classificação com dois rótulos de classe e com $$k = 7$$. No exemplo, são aferidas as distâncias de uma nova amostra, representada por uma estrela, às demais amostras de treinamento, representadas pelas bolinhas azuis e amarelas. A variável $$ k $$ representa a quatidade de vizinhos mais próximos que serão utilizados para averiguar de qual classe a nova amostra pertence. Com isso, das sete amostras de treinamento mais próximas da nova amostra, 4 são do rótulo $$ A $$ e 3 do rótulo $$ B $$. Portanto, como existem mais vizinhos do rótulo $$ A $$, a nova amostra receberá o mesmo rótulo deles, ou seja, $$ A $$.

<figure style="width: 390px; height: 400px;" class="align-center">
  
  <img src="{{ site.url }}{{ site.baseurl }}/assets/img/posts/knn/knn.jpg" alt="">

  <figcaption style="text-align: center;">
    Figura 1: exemplo de classificação do KNN com dois rótulos de classe e k = 7
  </figcaption>

</figure>

Dois pontos chaves que devem ser determinados para aplicação do KNN são: a métrica de distância e o valor de $$ k $$. Portanto, vamos discutir cada uma delas.

## Cálculo da distância

Calcular a distância é fundamental para o KNN. Existem diversas métricas de distância, e a escolha de qual usar varia de acordo com o problema. A mais utilizada é a distância Euclidiana, descrita pela equação 1. 

$$
D_E(p,q) = \sqrt{(p_1 - q_1)^2 + \cdots + (p_n - q_n)^2} = \sqrt{\sum_{i=1}^n (p_i - q_i)^2}
\tag{1}
$$

Outros exemplos de distância, é a de Minkowsky:

$$
D_M(p,q) = \begin{pmatrix} \sum_{i=1}^n |p_i-q_i|^r \end{pmatrix}^\frac{1}{r}
\tag{2}
$$

E também, a distância de Chebyshev:

$$
D_C(p,q) = max_i(|p_i, q_i|)
\tag{3}
$$

Em todos os casos, $$ p = (p_1, \cdots, p_n) $$ e $$ q = (q_1, \cdots, q_n) $$ são dois pontos $$ n $$-dimensionais e na equação 2, $$ r $$ é uma constante que deve ser escolhida. No exemplo da Figura 1, essas distâncias seriam calculadas entre as bolinhas (azuis e laranjas) e a estrela (a nova entrada). Como o exemplo é 2D, cada uma cada ponto teria seu valor em $$ x $$ e em $$ y $$. Para problemas com dimensões maiores a abordagem é a exatamente a mesma, porém, a visualização das amostras no espaço é mais complicada.

## A escolha de K

Em relação a escolha do valor $$ k $$, não existe um valor único para a constante, a mesma varia de acordo com a base de dados. É recomendável sempre utilizar valores ímpares/primos, mas o valor ótimo varia de acordo com a base de dados. Dependendo do seu problema, você pode utilizar um [algoritmo de otimização]({% post_url 2015-04-08-o-problema-de-otimizacao %}) ([PSO]({% post_url 2016-04-09-otimizacao-por-enxame-de-particulas %}), [GA]({% post_url 2017-04-12-o-algoritmo-genetico %}), [DE]({% post_url 2015-07-07-o-algoritmo-evolucao-diferencial %}) etc) para encontrar o melhor valor para o seu problema. Todavia, você pode deixar o desempenho geral do modelo bem lento na etapa de seleção de $$ k $$. Outra maneira e simplesmente testar um conjunto de valores e encontrar o valor de $$ k $$ empiricamente.


## Pseudocódigo

Para melhor compreensão do algoritmo, apresento também o pseudocódigo do mesmo. 

<figure style="width: 490px; height: 300px;" class="align-center">
  
  <img src="{{ site.url }}{{ site.baseurl }}/assets/img/posts/knn/alg.jpg" alt="">

</figure>


# Código do KNN em Python
Resumidamente, a grande vantagem do KNN é sua abordagem simples de ser compreendida e implementada. Todavia, calcular distância é tarefa custosa e caso o problema possua grande número de amostras o algoritmo pode consumir muito tempo computacional. Além disso, o método é sensível à escolha do $$ k $$. Por fim, deixo linkado uma implementação do KNN em Python. No repositório existe bases de dados comuns da literatura, como Iris e Australian Credit. Todavia, você pode utilizar o código para qualquer que seja a base. Bom proveito!

[Implementação do KNN em Python](https://github.com/paaatcha/KNN)


# Referências
<a name="fukunaga">[1]</a> Fukunaga, K.; Narendra, P. M. A branch and bound algorithm for computing k-nearest neighbors. IEEE Transactions on Computers, v. 100, n. 7, p. 750–753, 1975.