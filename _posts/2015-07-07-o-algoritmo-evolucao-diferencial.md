---
latexEquation: true
title: "O algoritmo Differential Evolution (DE)"
categories:
  - Algoritmos
tags:
  - otimização
  - inteligência computacional
  - DE
  - Diffential evolution
---

## Introdução
O algoritmo **Differential Evolution** (DE - em português Evolução Diferencial) foi proposto por *Storn e Price, em 1997* [1] e é um método heurístico, que não usa derivadas, e visa solucionar problemas de otimização contínua. 

Desde de sua criação, o DE se apresenta como um simples, mas poderoso algoritmo de otimização numérica para busca da solução ótima global, sendo aplicado com sucesso na solução de vários problemas de otimização difícil. Segundo *Cheng e Hwang* [2], o DE, possui como principais características:
 * É um algoritmo de busca estocástica, originado dos mecanismos de seleção natural;
 * O algoritmo é simples e de fácil entendimento,com poucos parâmetros de controle para conduzir à otimização;
 * É eficaz para solucionar problemas de otimização com função objetivo descontínua, pois não necessita de informações sobre derivadas da mesma;
 * Manipula uma população de soluções que utiliza diferentes regiões no espaço de busca, tornando o algoritmo robusto a mínimos locais;
 * É eficaz mesmo trabalhando com uma população pequena;
 * Permite as variáveis serem otimizadas como números reais, sem processamento extra;

## Conceitos básicos
### População
O primeiro conceito do DE, assim como o de outros algoritmos evolutivos, é o de **população**. Uma população é composta por `N` indivíduos, também chamados de vetores, cobrindo todo espaço de busca, para um problema com `n` variáveis de projeto, ou seja, a dimensão de cada vetor. De maneira geral, a população será simplesmente uma matriz `N x n`, na qual cada linha da matriz representa um indivíduo da população. Um exemplo de uma população com 3 indivíduos de dimensão 5 é descrito na matriz abaixo:

$$
  populacao = 
  \begin{bmatrix}
    1.0 & 2.6 & 3.7 & 3.1 & 7.7\\
    4.4 & 6.2 & 7.4 & 8.8 & 5.1 \\
    3.2 & 8.3 & 9.1 & 7.7 & 6.1 \\
    
  \end{bmatrix}  
$$

Normalmente, a população é criada por uma distribuição de probabilidade uniforme. Caso exista informações prévias sobre o problema, a inicialização pode ser diferente, vai variar para cada caso.

Uma vez criada a população, a mesma é submetida a ação de operadores evolutivos, ou seja, o DE começa a atuar de fato. É importante ressaltar que o número de indivíduos é fixado durante todo o processo de otimização. Portanto, dado uma população, os três operadores a serem executados são: **mutação**, **cruzamento** e **seleção**. Essas três operações serão repetidas até que um critério de parada seja alcançado. Esse critério pode ser convergência da população, um erro mínimo atingido ou um valor pré-definido de iterações. Observe que a ideia é similar a um algoritmo genético! Sendo assim, os operadores do DE se baseiam no princípio da evolução natural cujos os principais objetivos são: 
- Manter a diversidade da população;
- Evitar convergências prematuras;
- Obter a melhor solução para o problema;

Obviamente o algoritmo não garante o ótimo, mas sim soluções muito próximas deles, dependendo do problema, é claro.

## Operações do DE
A seguir são descritos detalhadamente cada uma das operações do algoritmo.

### Mutação

Na operação de mutação são escolhidos, de maneira aleatória, três indivíduos distintos dentre todos os `N` que compões a da população inicial. Para facilitar a compreensão, vamos nomear cada um deles. A população inicial será $pop_O$ (de população original) e seus indivíduos escolhidos aleatoriamente serão:  $X_\alpha, X_\beta$ e $X_\gamma$. 

O indivíduo  $X_\alpha$ sofre uma pertubação resultante da diferença vetorial entre $X_\beta$ e $X_\gamma$. Essa diferenção é multiplica por um fator $F$ conhecido como *fator de mutação*. Esse operador gera uma nova população de indivíduos mutados, que vamos chamar de $pop_M$ (de população mutada). Tudo isso é resumido na seguinte expressão:

$$ popMut = X_\alpha + F X_\beta - X_\gamma $$

Na qual, $\alpha, \beta, \gamma \in (1 , 2 , ..N)$  e $\alpha \neq \beta \neq \gamma$. Vale ressaltar que para garantir as diferenças entre os indivíduos selecionados aleatoriamente, a população deverá ser igual ou superior a 4 indivíduos. Além disso, o fator de mutação $F$, que controla a amplitude da diferença vetorial, deve está no intervalo entre 0.5 e 1 [1]. A Figura 1 ilustra a operação de mutação:


<figure style="width: 350px; height: 500px;" class="align-center">
  
  <img src="{{ site.url }}{{ site.baseurl }}/assets/img/posts/DE/mutacao.jpg" alt="">

  <figcaption>
    Figura 1: Ilustração da operação de mutação
  </figcaption>

</figure> 

Portanto, em resumo, a mutação gera uma nova população, que chamamos de $pop_M$ a, a partir da população originar $pop_O$

### Cruzamento
Com intuito de aumentar a diversidade da população, *Storn e Price* [1] introduziram o operador de cruzamento. Essa operação é usada para gerar um novo indivíduo advindo de um cruzamento entre indivíduos da população original e da população mutada. Para melhor compreensão imagine você e seus pais. Você é um indivíduo que surgiu através do cruzamento dos genes de seu pai e de sua mãe. A ideia é parecida aqui.

Ao fim dessa operação, todos os indivíduos cruzados formarão uma nova população que chamaremos de $pop_C$ (de população de cruzamento) de mesmo tamanho e dimensão das populações obtidas anteriormente.

Para ficar bem didático e fácil de compreender, imagine o primeiro indivíduo da população $pop_C$, vamos chamá-lo de $I_c$. Ele vai ser composto pelo cruzamento, de um indivíduo da $pop_O$, $I_o$, e outro indivíduo da $pop_M$, $I_m$, ambos selecionados de maneira aleatória. Esses indivíduos possuem dimensão `n` (lembre-se da matriz que discutimos no início do post, na qual cada linha é um novo indivíduo, ou seja, um vetor `[1,n]`) e vamos chamar cada uma dessas `n` posições de genes. Por exemplo, se o individuo é um vetor de dimensão 5, `v = [1 2 3 4 5]`, ele possui 5 genes, um pra cada posição de v, entendido?

