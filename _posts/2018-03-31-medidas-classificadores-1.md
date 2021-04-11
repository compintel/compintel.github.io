---
latexEquation: true
title: "Medida de desempenho de classificadores - Parte 1"
excerpt: "O desempenho de classificadores de dados pode te enganar dependendo da métrica que você utiliza. Neste post vamos abordar este assunto e mostrar como não ser enganado pelo classificado."
categories:
  - Conceitos
tags:
  - Classificação de dados
---

# Introdução

Imagine que você possui um classificador atuando em uma determinada base de dados e necessita avaliar o seu desempenho. Como você faria? A primeira resposta, e a mais óbvia, seria: ora, basta verificar quantas amostras ele consegue acertar! De fato essa é uma métrica. Todavia, pode ser que somente ela não seja suficiente para identificar os pontos fortes e fracos do seu classificador. Por isso, neste post vamos discutir outras métricas para avaliar o desempenho de classificadores. Caso não esteja familiarizado com o tema, sugiro o nosso post anterior que define o [problema de classificação de dados]({% post_url 2015-04-08-o-problema-de-otimizacao %})

Para tornar nossa discusão mais didática e compreensível, vamos utilizar como exemplo o <a href="http://archive.ics.uci.edu/ml/datasets/Breast+Cancer" target="_blank" rel="noopener"><em>Breast Cancer Data Set</em></a>, um benchmark clássico em classificação de dados. Esta base de dados possui 9 atributos descrevendo 286 mulheres que sobreviveram as câncer de mama e se após 5 anos a doença retornou. Logo, esse é um problema de classificação binária, na qual o classificador deve responder se o câncer voltou ou não. Das 286 mulheres, em 85 o câncer retornou e em 201 não. Portanto, essa base será nosso ponto de partida.

Antes de iniciar, este post será dividido em duas partes. Nessa primeira vamos introduzir os conceitos básicos e na segunda vamos explorar um pouco mais esses conceitos.

# Acurácia de classificação
Como já mencionado, a primeira métrica a se utilizar é a acurácia de classificação. Ela é bem simples de ser calculada, basta verificar a porcentagem de acerto do classificador. Por exemplo, se das 286 amostras da base de cancer, o classificador acertou 230, teremos uma acurácia final de (230/286) x 100 = 80,42%. Agora uma pergunta: baseado nessa acurácia, este classificador é bom ou ruim? Acredito que a melhor resposta até então seria <em>não sei</em>. Temos que analisar melhor esse resultado e entender o que é importante para o problema em questão. Apenas saber o valor da acurácia não é suficiente para declarar a qualidade deste classificador.

Para justificar essa afirmativa, vamos pensar um pouco em relação a base de dados em questão. Queremos saber se o câncer retornou em uma mulher ou não, certo? Logo, se for para o classificador errar, a situação "<em>menos pior"</em> é dizer que **o câncer de uma mulher retornou mas na verdade ele não retornou**. Neste caso, temos um erro de classificação, mas não é o mais grave porque, em uma situação imaginária, a mulher retornaria para o hospital, realizaria alguns exames e identificaria que o câncer na verdade não retornou e assim poderia ser liberada. Sendo assim, o pior cenário para este classificador e dizer que **o câncer não retornou na mulher quando na verdade ele retornou.** Este é o pior caso possívei, pois, na mesma situação imaginária, a mulher poderia estar em casa imaginando não estar com câncer quando na verdade o mesmo retornou. Portanto, precisamos de uma métrica para identificar esse tipo de situação.

# Matriz de confusão
A matriz de confusão nada mais é do que uma tabela que permite visualizar o desempenho de um classificador. Cada linha da matriz representa a classe das amostras que o classificador retornou e cada coluna representa a classe real. Para facilitar a compreensão, vamos construir uma matriz de confusão fictícia para o problema da base de câncer:


|            | Sim | Não |  Total |
|-----------|-----|-----|--------|
| **Sim**   | **60**  | 25  | 85     |
| **Não**   | 11  | **190** | 201    |
| **Total** | 71  | 225 | **286**    |

A pergunta a ser repondida pelo classificador é: **o câncer da amostra retornou?** Logo, o mesmo classifica em **Sim** ou **Não**. Para não criar uma confusão da matriz de confusão, olhe para a diagonal principal. Das 85 amostras nas quais o câncer retornou, nosso classificador fictício rotulou corretamente 60. Similarmente, das 201 nas quais o câncer não retornou, ele classificou corretamente 190. Essa informação encontra-se na diagonal principal. Perceba que a soma da linha e coluna entitulada 'Total' obrigatoriamente deve ser igual ao número de amostras, no caso, 286. Por fim, é possível perceber que dos 36 erros do classificador, 25 atingem o caso que discutimos anteriormente (dizer que o câncer não retornou, quando na verdade ele retornou).

Existe uma nomenclatura específica para lidar com os acertos e erros de classificadores e vamos utilizar a matriz de confusão para expor melhor essa ideia. As 60 amostras preditas corretamente serão denominadas como **verdadeiros positivos (VP)**, pois o resultado do classificador respondeu a pergunta em questão com <em>Sim </em>(positivo) e ela é correta (verdadeira). As 25 amostras classificadas como <em>Sim</em>, mas na verdade é <em>Não</em>, são denominadas **falsos positivos (FP)**. De maneira similar, na segunda linha da tabela encontramos 11 amostras classficadas como <em>Não</em>, mas que na verdade é <em>Sim</em>. Essas são os **falsos negativos (FN)**. Por fim, as 190 amostras <em>Não </em>classificadas corretamente são os **verdadeiros negativo (VN)**, pois neste caso a resposta do classificador é correta para classe <em>Não</em> em questão (se você se embolou, leia novamente com mais calma que conseguirá entender). Em resumo, nossa tabela, com duas classes, sempre terá essa *cara*:

|            | Verdadeiro | Falso |
|:----------:|:----------:|:-----:|
| **Verdadeiro** |     VP     |   FP  |
|    **Falso**   |     FN     |   VN  |


Entendeu essa nova nomenclatura? Pois bem, a partir dela virão as novas métricas para medir o desempenho dos classificadores.

## *Precision*

A métrica <em>precision</em> tem como objetivo identificar quantas amostras foram classificadas positivamente. Em outras palavras, é uma medida do **quão exato é a classificação para as amostras positivas**, que é exatamente a pergunta que desejamos responder. Por conta disso, a métrica também é conhecida como *valor de predição positiva*. Ela é definida como o número de verdadeiros positivos divido pela soma de verdadeiros positivos mais falsos positivos:

$$
P = \frac{VP}{VP + FP}
\tag{1}
$$
De maneira clara, podemos perceber que **um baixo valor** de $$ P $$, indica **um grande número de falsos positivos** na classificação geral. No nosso exemplo da tabela acima, temos  $$ P = \frac{60}{(60+25)} = 0.7059 $$. Como discutimos acima, essa métrica é a mais importante para este problema, pois queremos ao máximo evitar os falsos positivos, ou seja, dizer que a o câncer não voltou, quando na verdade ele voltou. O valor de $$ P $$ indica que em ~70% das vezes uma pessoa em que o câncer voltou é diagnosticado pelo nosso classificador.

## *Recall*
O <em>recall</em> tem a mesma ideia do <em>precision</em>, porém para as amostras <strong>falsas negativas</strong>. Ela é definida como o número de **verdadeiros positivos** divido pela soma de **verdadeiro positivos** mais **falso negativos**:

$$
R = \frac{VP}{VP + FN}
\tag{2}
$$

O <em>recall</em> pode ser compreendido como uma medida do quão completo é o nosso classificador. Obviamente, um baixo valor de $$ R $$ indica um alto valor de **falsos negativos**. Para o nosso problema, temos  $$ R = \frac{60}{(60+11)} = 0.8451 $$. Este valor de $$ R $$ indica que ~84.51% dos verdadeiros positivos são identificados.

## *F1 Score*
O <em>F1 score</em> é definido como duas vezes a média harmônica entre $$ R $$ e $$ P $$, ou seja, é um 'meio termo' entre as duas métricas anteriores:

$$
F1 = 2 \times \frac{P \times R}{P + R}
\tag{3}
$$

Neste caso, essa métrica busca um modelo que faça um balanço entre <em>recall </em>e <em>precision</em>. Para o nosso exemplo, temos $$ F1 = 2 \times \frac{0.7059 \times 0.8451}{0.7059 + 0.8451} = 0.7693 $$

## Acurácia

Perceba que podemos calcular a acurácia total do nosso classificador da seguinte forma:

$$
A = \frac{VP + VN}{VP + VN + FP + FN}
\tag{4}
$$

Essa é a mesma métrica apresentado no início deste post, todavia, agora utilizando a nomenclatura introduzida com a matriz de confusão.

## Observações
O F1 *score* favorece classificadores que possuem *precision* e *recall* semelhantes. Porém, não é sempre que queremos isso. Por exemplo, nosso problema em questão, queremos favorece o *precision*. Já explicamos a razão, mas em resumo, queremos detectar em quem o câncer voltou com maior precisão. Por outro lado, existem uma gama de problemas na qual queremos priorizar o *recall*. Por exemplo, imagine que um classificador detecte pessoas armadas em uma escola. Neste caso queremos um *recall* alto, ou seja, é melhor o classificador identificar um caso como positivo mas na verdade não do que o contrário. O importante aqui é não permitir a entrada de armas.

Infelizmente, em problemas de classificação, ao aumentar o *precision* vamos reduzir o *recall* e vice versa. Este problema é conhecido como *tradeof* entre *precision* e *recall* [[1]](#hands). Este será o tema para a parte II deste post.

# Problemas com multiplos labels
Neste momento você pode estar se pensando: ok, entendi toda essa teoria para o problema exemplo, porém e se o meu problema tiver mais de dois labels, ou seja, labels A, B, C... (não apenas SIM e NÃO), como devo proceder? Bom, não se preocupe o cálculo das métricas continua bem fácil. Vamos considerar um exemplo os três labels A, B e C. Primeiro, vamos calcular a matriz de confusão, como mostrado a seguir:


|   |  A |  B |  C |
|:-:|:--:|:--:|:--:|
| **A** | **30** | 20 | 10 |
| **B** | 50 | **70** | 10 |
| **C** | 20 | 10 | **80** |


A ideia é exatamente a mesma da anterior, porém dessa vez temos 3 classes (mas nada impede de termos mais). Perceba que para este exemplo cada label possui 100 amostras (soma das colunas) e cada label predito (o resultado da classificação) possui 60, 120 e 120 (soma das linhas). Além disso, a diagonal principal da matriz é composta pelos <strong>verdadeiros positivos</strong><strong> (VP)</strong>, ou seja, os valores corretos da predição.

A partir dessas informações podemos calcular todas as métricas já apresentadas. Neste caso, temos que calcular a métrica para cada label. Tomando como exemplo o **label A**, vamos calcular as métricas da seguinte forma: sabemos que  $$ P = \frac{VP}{VP + FP}$$, logo $$ VP = 30 $$ e $$ VP + FP $$ é igual a soma da linha de A, ou seja, $$ 30+20+10=60 $$. Portanto, $$ PA = 0.5 $$. Isso significa, quem 50% do tempo o modelo prever corretamente o valor do label A.

De maneira similar, vamos calcular o <em>recall </em>para o label A. Sabemos que $$ R = \frac{VP}{VP + FN} $$, logo $$ VP = 30 $$ e $$ VP + FN $$ é igual a soma da coluna de A, ou seja, $$ 30+50+20=100 $$. Portanto, $$ RA = 0.3 $$. Isso significa que em 70% dos casos que era pro modelo prever B ou C, o resultado é A, ou seja, só em 30% das vezes o modelo acerta nessa situação (o que é bem ruim).

Bom, para calcular o <em>F1 score</em>, basta duplicar a média harmônica entre $$ P $$ e $$ R $$. De maneira análoga, o mesmo procedimento pode ser realizado para os labels B e C. Daí seria computado PB, RB, PC e RC. Quando computado as métricas para todos os labels, você pode calcular o <em>recall e precision</em> médios simplesmente utilizando a média aritimética dos valores.

Agora, daqui a diante você possui condições de medir melhor o desempenho dos seus modelos de classificação. Para acessar a parte dois deste post, [clique aqui]({% post_url 2018-03-31-medidas-classificadores-2 %}).


# Referências
<a name="hands">[1]</a> Géron, Aurélien. Hands-on machine learning with Scikit-Learn and TensorFlow: concepts, tools, and techniques to build intelligent systems. " O'Reilly Media, Inc.", 2017.

<a name="mlm">[2]</a> Classification Accuracy is Not Enough: More Performance Measures You Can Use - <a href="https://machinelearningmastery.com/classification-accuracy-is-not-enough-more-performance-measures-you-can-use/" target="_blank" rel="noopener">Link</a>


