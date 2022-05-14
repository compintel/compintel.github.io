---
latexEquation: true
title: "Machine learning pré-requistos: Álgebra linear"
header:
  teaser: "/assets/img/capas/machine_learning_a1.png"
excerpt: "Machine learning pré-requistos: Álgebra linear. Neste post serão abordados os conceitos básicos em relação a álgebra linear para se iniciar em Machine Learning"
categories:
  - Conceitos
tags:
  - Machine learning
  - Algebra linear
  - Prerequisitos
  - Matrizes
  - Vetores
---

# Introdução
Olá, hoje vamo começar uma série nova aqui no blog para discutir os pré-requisitos para se iniciar na área de machine learning/inteligência artificial/deep learning. A ideia é introduzir os conceitos básicos que formarão a base necessária para iniciar na área. E para começar, o primeiro post da série será sobre **álgebra linear**.

Eu sei que muitos tem traumas de álgebra (principalmente quem já cursou em alguma graduação na área de exatas). Porém, um bom entendimento da disciplina é necessário para aprender _machine learning_. Portanto, aqui vamos discutir diversos conceitos básicos, mas caso queira se aprofundar, sugiro que procure um livro ou algum curso dedicado. Infelizemente, a maioria dos materiais estão em inglês (eis a razão de existência deste blog!) mas você encontra alguns [cursos como este](https://www.youtube.com/watch?v=TP2o31y5_GU&list=PLO3hBdfBc4pFef1zn1oZyYXLomL9MiX-C) no YouTube.


# Escalares, vetores e matrizes
Os 3 principais tipos de dados da álgebra linear são descritos a seguir:
- **Escalares**: um escalar é apenas um número (as vezes conhecido como crisp). Normalmente este número pertence a um conjunto, como os números reais ou naturais. A notação utilizada para um escalar é uma letra minúscula. Um exemplo de escalar pode ser descrito por $$ x \in \mathbb{R}$$, ou seja, $$ x $$ é um escalar que pertence aos números reais, logo, ele pode assumir valores como $$ 4.2 $$, $$ 10.0 $$, $$ 8 $$ etc.

- **Vetores**: um vetor é uma coleção de números escalares. Logo, esse objeto é um conjunto de números identificados por um índice. Um vetor pode conter $$ n $$ elementos de algum conjunto de números, por exemplo, os números reais. A notação padrão para um vetor é uma letra mínuscula em negrito, por exemplo $$ \mathbf{x} $$. No caso, $$ x_1 $$ é o primeiro elemento deste vetor. Uma outra maneira de representar um vetor é explicitando seus dados, por exemplo, $$ \mathbf{x} = \{x_1, x_2, \cdots  x_n \}$$. Neste caso dizemos que $$ \mathbf{x} \in \mathbb{R}^n$$, ou seja, todos os elementos do vetor são números reais.


- **Matrizes**: uma matriz é uma conjunto de dados de 2 ou mais dimensões, na qual cada elemento é identificado por dois ou mais índices. A notação padrão de uma matriz é uma letra maiúscula em negrito, por exempplo, $$ \mathbf{X} $$. Tomando como exemplo uma matriz de duas dimensões, ela pode conter $$ m \times n$$ elementos. Neste caso, dizemos que $$ \mathbf{X} \in \mathbb{R}^{m \times n}$$, ou seja, todos os elementos da matriz são números reais com $$m$$ linhas e $$n$$ colunas. Uma maneira de representar essa matriz é descrita da seguinte maneira:

$$
\mathbf{X} = 
\begin{bmatrix}
x_{11}& \cdots & x_{1n} \\
\vdots & \ddots & \vdots \\
x_{m1}& \cdots & x_{mn}
\end{bmatrix}
\tag{1}
$$

Observe que matrizes é um conceito que engloba vetores e escalares. Podemos dizer que um vetor é uma matriz com apenas uma linha ou coluna. Da mesma maneira, podemos dizer que um escalar é uma matriz ou um vetor com apenas um elemento, por exemplo, $$ [a_{11}] $$

# Operações com matrizes, vetores e escalares
Podemos realizar algumas operações com matrizes. Nesta seção vamos abordar transposição, soma, subtração e multiplicação por escalar, produto escalar e _broadcasting_. Todas essas operações são bem simples de serem executadas.

## Tranposição
Transpor uma matriz nada mais é do que trocar suas linhas por suas colunas, ou vice-versa. Tomando como exemplo a equação 1, todos os elementos de $$ x_{11} $$ até $$ x_{mn} $$ são chamados de **diagonal principal**. A transposição espelha todos os elementos da matriz em torno dessa diagnonal. De maneira formal, a transposição é descrita por:

$$
A^T_{ij} = A_{ji}
\tag{2}
$$

Um exemplo pode ser descrito na equação 2 a seguir. Observe que a diagonal principal se mantém. Uma regra simples para transposição é pensar: o que é linha vira coluna e o que é coluna vira linha. Sempre funcionar!

$$

A = \begin{bmatrix}
1 & 2 & 3\\
4 & 5 & 6 \\
7 & 8 & 9
\end{bmatrix}
\qquad
A^T = \begin{bmatrix}
1 & 4 & 7\\
2 & 5 & 8 \\
3 & 6 & 9
\end{bmatrix}

\tag{2}

$$

Vetores também podem ser transpostos. Caso ele seja uma linha, ele vira coluna e vice versa, como mostra o exemplo na equação 3. No caso de um escalar, a transposta dele é ele mesmo, ou seja, $$ y^T = y $$.

$$

\mathbf{x} = \begin{bmatrix}
1\\
2\\
3
\end{bmatrix}
\qquad
\mathbf{x}^T = \begin{bmatrix}
1 & 2 & 3
\end{bmatrix}

\tag{3}

$$

## Soma e subtração
Duas matrizes podem ser somadas quando as mesmas possuem a mesma ordem, ou seja, o mesmo número de linhas e colunas. A soma é realizada simplemente somando cada elemento de cada posição, como descrito na equação 4 e exemplificado na 5. Os vetores funcionam da mesma maneira, com a diferença que estaremos somando uma linha ou coluna apenas. 

$$
C = A + B \rightarrow C_{ij} = A_{ij} + B_{ij}

\tag{4}
$$


$$
\begin{bmatrix}
1 & 2\\
3 & 4
\end{bmatrix}
+
\begin{bmatrix}
5 & 6 \\
7 & 8
\end{bmatrix}
=
\begin{bmatrix}
6 & 8 \\
10 & 12
\end{bmatrix}

\tag{5}
$$

A subtração funciona da mesma maneira basta apenas trocar o sinal.

## Multiplicação por escalares
Também podemos multiplicar matrizes e vetores por escalares. A operação é bem simples e é descrita pela equação 6 e exemplificada pela 7. Em resumo, basta realizar a multiplicação do escalar por todos os elementos do vetor ou matriz.

$$
C = A \times a
\tag{6}
$$

$$
\begin{bmatrix}
1 & 2\\
3 & 4
\end{bmatrix}
\times
2
=
\begin{bmatrix}
2 & 4\\
6 & 8
\end{bmatrix}
\tag{7}
$$

## Produto escalar (dot product)
O produto escalar (ou dot product) entre dois vetores de mesma dimensão é definido por:

$$
\mathbf{a} \cdot \mathbf{b} = \sum_{i=0}^n a_ib_i = a_1b_1 \cdots a_nb_n

$$

Observe que o produto escalar retorna um escalar. 

## Norma de um vetor
A norma de um vetor é representada por $$ || \mathbf{x} || $$ é informalmente conhecida como o "tamanho" de um vetor. Existem diversas normas e de maneira geral para uma função $$ f $$ ser considerada uma norma, ela precisa satisfazer as seguintes condições:
- Não negatividade: $$ \forall \mathbf{x} \in \mathbb{R}^n \rightarrow f(\mathbf{x}) \geq 0 $$
- $$ f(\mathbf{x}) = 0 $$ se e somente se $$ \mathbf{x} = 0$$
- Homegeniedade: $$ \forall \mathbf{x} \in \mathbb{R}^n, t \in \mathbb{R} \rightarrow f(t \mathbf{x}) =  t f(\mathbf{x})$$
- Inequação triangular: $$ \forall \mathbf{x},\mathbf{y} \in \mathbb{R}^n \rightarrow f(\mathbf{x} + \mathbf{y}) \leq f(\mathbf{x}) + f(\mathbf{y}) $$

Alguns exemplos de normas são:
- Norma L1: 
$$ || \mathbf{x} || = \sum_{i=1}^n | x_i | $$

- Norma L2: 
$$ || \mathbf{x} ||_2 = \sqrt{ \sum_{i=1}^n  x_i^2  }$$

- Norma $$ \infty  $$:
$$ || \mathbf{x} ||_{\infty} = max_i |x_i|$$

- Norma $$ p $$:
$$ || \mathbf{x} ||_p = \left ( \sum_{i=1}^n  x_i^p \right )^{\frac{1}{p}} $$

Perceba que a norma $$ p $$ é uma generalização das demais. Tenha em mente também que existem outras diversas normas, basta satisfazer a condições descritas acima. 

A norma $$p$$ é muito utilizada em _machine learning_ e de maneira intuitiva, a norma mede a distância de um vetor para com a origem. No caso, a norma L2 é tão utilizada que por vezes é omitido o número 2 e é denotado apenas $$ \parallel  \mathbf{x} \parallel  $$. 

É muito comum medir o tamanho de um vetor elevando essa norma ao quadrado, que é **facilmente calculada fazendo** $$ \mathbf{x}^T \mathbf{x} $$. Isso é importante para facilitar o cálculo de derivadas. Como ainda vamos ver, atualmente, os algoritmos de minimização utilizados em ML são baseados em derivadas. Sendo assim, a derivada do quadrado da norma L2 com respeito a um elemento de $$ \mathbf{x} $$ depende apenas do elemento, enquanto da L2 depende de todo o vetor. 

Por fim, o produto escalar entre dois vetores pode ser escrito em termos da norma: $$ \underline{ \mathbf{x}^T \mathbf{y} = {\parallel  \mathbf{x} \parallel}_2 {\parallel  \mathbf{y} \parallel}_2 \cos \theta } $$, onde $$ \theta $$ é o ângulo entre os dois vetores.



## Broadcasting
Em computação é comum encontramos a operação de _broadcasting_ (normalmente não existe uma tradução pra essa palavra). Essa operação simplifica a notação e a computação. Python possui um pacote de computação númerica, chamada [NumPy](https://www.numpy.org/), que da suporte a _broadcasting_. Ela será muito utilizada neste curso. 

Explicando o _broadcasting_ por meio de um exemplo, imagine que desejamos somar uma matriz $$ A_{m \times n} $$ a um vetor $$ \mathbf{b}_{m \times 1} $$. Bom, sabemos que isso não é possível, uma vez que para a soma ocorrer, ambos devem ter a mesma ordem. Porém, podemos repetir os valores a linha do vetor $$ n $$ vezes e ai sim realizar essa soma. Para evitar escrever tudo isso, apenas dizemos que $$ C = A + \mathbf{b} $$. Como já está convencionado o _broadcasting_, seja $$ A = \begin{bmatrix}
1 & 2\\
3 & 4
\end{bmatrix} $$ e $$ \mathbf{b} = [5, 6] $$, sabemos que essa operação significar fazer:

$$
\begin{bmatrix}
1 & 2\\
3 & 4
\end{bmatrix}
+
\begin{bmatrix}
5 & 6 \\
5 & 6
\end{bmatrix}
=
\begin{bmatrix}
6 & 8\\
8 & 10
\end{bmatrix}

\tag{8}
$$

# Multiplicação de matrizes
A multiplicação de matrizes é uma das operações mais importantes envolvendo matrizes. A regra de ouro aqui é que o número de linhas de uma matriz deve ser o mesmo de colunas da matrizes na qual deseja-se multiplicar. Isso é descrito na equação 9.

$$
C = A \times B \rightarrow C_{m \times p} = A_{m \times \underline{n}} \times C_{\underline{n} \times p}

\tag{9}
$$

A multiplicação de matrizes não como a soma que basta multiplicar todos os elementos de uma matriz pelos os de mesmo índice da matriz subsequente. Essa operação de multiplicar elemento por elemento é conhecida como _element-wise product_ e tem um símbolo especiar, no caso $$ A \odot B $$. A multiplicação de fato é definida da sequinte maneira:

$$
C_{ij} = \sum_k A_{ik} \times B_{kj}
\tag{10}
$$

Para exemplificar:

$$
\begin{bmatrix}
1 & 2\\
3 & 4
\end{bmatrix}
\times
\begin{bmatrix}
5 & 6 \\
7 & 8
\end{bmatrix}
=
\begin{bmatrix}
1 \times 5 + 2 \times 7 & 1 \times 6 + 2 \times 8 \\
3 \times 5 + 4 \times 7 & 3 \times 6 + 4 \times 8
\end{bmatrix}
=
\begin{bmatrix}
19 & 22 \\
43 & 50
\end{bmatrix}

\tag{11}
$$

Se observamos a multiplicação acima, percebemos que nada mais é do que um produto escalar esntre as linhas das matrizes. É comum representar o produto escalar como sendo $$ \mathbf{a}^T \cdot \mathbf{b}$$.

## Propriedades
A multiplicação de matrizes possuem algumas propriedades que podem ser úteis em alguns casos. Destacamos as seguintes propriedades:
- _Distributiva_: $$ A(B+C) = AB + AC$$
- _Associativa_: $$ A(BC) = (AB)C $$

Porém a multiplicação não é comutativa, isto é $$ AB \neq BC $$. Porém, o producto escalar é, i.e., $$ \mathbf{a}^T\mathbf{b} = \mathbf{b}^T\mathbf{a} $$.

Além disso, a transposta de uma matriz possui a seguinte propriedade: $$ (AB)^T = A^TB^T$$.

Existem diversas outras propriedas, mas isso aqui é apenas uma introdução então não vamos adentrar nelas e nem nas provas teóricas.

## Um simples sistema linear
Com os conceitos explorados até aqui, podemos montar um simples sistema linear da seguinte forma:

$$
A \mathbf{x} = \mathbf{b}

\tag{12}
$$

Onde $$ A \in \mathbb{R}^{m \times n} $$, $$ \mathbf{b} \in \mathbb{R}^{m} $$ e $$ \mathbf{x} \in \mathbb{R}^{n} $$. Neste caso a variável $$ \mathbf{x} $$ é valor desconhecido que desejamos descobri. Cada elemento $$ x_i $$ é um elemento desconhecido a ser descorberto. Utilizando os conhecimentos adquiridos até aqui você pode aferir facilmente que a primeira linha desta equação linear será $$ a_{11}x_1 + a_{12}x_2 + \cdots + a_{1_n}x_n = b_1 $$. Como exercício, tente expandir as demais linhas! Essa **modelagem matricial é de extrema importância** para os algoritmos de _machine learning_ uma vez que basicamente tudo é modelado assim.


**Nota:** perceba que não existe divisão de matrizes. Você pode realizar a operação por elemento (_element-wise_), mas a divisão em si não existe.

# Inversão de matriz
Para solucionar o sistema linear apresentado na equação 12 vamos precisar uma outra operação matricial chamada de inversão. Mas antes, precisamos definir o conceito de matriz identidade. Uma matriz identidade $$ I_n \in \mathbb{R}^{n \times n} $$ é definida como a matriz que multiplicada por vetor não o modifica. Formalmente:

$$
I_n \mathbf{x} = \mathbf{x} ; \forall \mathbf{x} \in \mathbb{R}^n
\tag{13}
$$ 

Como pode ser observado, uma matriz identidade é obrigatoriamente quadrada, ou seja, o número de linhas é igual ao número de colunas, sua diagnoal principal é composta por uns e o resante de seus indices por zeros. Um exemplo de matriz identidade de ordem 3 é mostrado na equação 14:

$$
I_3 = 
\begin{bmatrix}
1 & 0 & 0 \\
0 & 1 & 0 \\
0 & 0 & 1
\end{bmatrix}

\tag{14}
$$

Bom, agora podemos definir a matriz inversa. Essa matriz, denotada por $$ A^{-1} $$ é definida como a matriz que multiplicada por $$ A $$ retorna a identidade. Formalmente:

$$
A^{-1}A = I_n

\tag{15}
$$

Com essa definição é possível solucionar o sistema linear da equação 12 da seguinte maneira:

$$
\begin{split}
A \mathbf{x}  = \mathbf{b} \\
A^{-1} A \mathbf{x}  = A^{-1} \mathbf{b} \\
I_n \mathbf{x}  = A^{-1} \mathbf{b} \\
\underline{\mathbf{x}  = A^{-1} \mathbf{b}}

\end{split}
\tag{16}
$$

Observe que foi adicionado $$ A^{-1} $$ em ambos os lados da equação para que ela fosse solucionada. Para essa equação ser válida a inversa da matriz $$ A $$ deve ser válida. Acontece que nem sempre a matriz possui uma inversa. Neste caso, quando ela possui uma inversa, dizemos que a matriz é **inversível** ou **não-singular**. Caso contrário, dizemos que a matriz é **não-inversível** ou **singular**. Vamos discutir isso na próxima seção.

## Propriedades
Considerando $$ A,B \in \mathbb{R}^{n \times n}$$ matrizes não singulares, podemos definir as seguintes propriedades para a matriz inversa:
- A inversa da inversa $$A$$ é igual a $$A$$: $$ \underline{(A^{-1})^{-1} = A} $$
- A inversa de $$AB$$ é igual a multiplicação de suas respectivas inversas: $$ \underline{(AB)^{-1} = B^{-1}A^{-1}} $$
- A transposta da inversa de $$A$$ é igual a inversa da transposta: $$ \underline{(A^{-1})^{T} = (A^T)^{-1}} $$

# Dependência linear, _span_ e posto
Para que a inversa de $$ A{-1} $$ exista é necessário que o sistema linear da equação 12 tenha **apenas umas solução** para cada valor de $$ \mathbf{b} $$. Como você deve lembrar do seu ensino médio (eu espero que lembre), esse tipo de sistema pode ter nenhuma, uma ou várias soluções. Neste caso, se $$ \mathbf{x} $$ e $$ \mathbf{y} $$ são soluções, então:

$$
\mathbf{z} = \alpha \mathbf{x} + (1-\alpha) \mathbf{x}
\tag{17}
$$

também é uma solução para qualquer valor de $$ \alpha $$. Uma maneira de determinar quantas soluções a equação possui é imaginar cada coluna de $$ A $$ como um vetor e quantificar quantas vezes esse vetor, saindo da origem, gera o vetor $$ \mathbf{b} $$. Desta maneira, cada elemento de $$ \mathbf{x} $$ especifica o quando o devemos afastar da origem, sendo $$ x_i $$ o quanto se afasta em direção a coluna $$ i $$ da matriz:

$$
A \mathbf{z} = \sum_i x_i A_{:,i}
\tag{18}
$$

Essa operação nada mais é do que uma **combinação linear**. Formalmente, uma combinação linear de um vetor $$ \mathbf{u} = \{u_1, u_2, \cdots, u_n \}$$ é dada pela soma da multiplicação de cada elemento deste vetor por um escalar:

$$

\hat{\mathbf{u}} =  \sum_{i=1}^n \alpha u_i
\tag{19}
$$

Dessa forma, o **_span_** de um conjunto de vetores é o conjunto de todos os pontos obtidos através de combinações lineares dos vetores originais. Sendo assim, imagine um conjunto de vetores $$ U =  \{\mathbf{u}_1, \mathbf{u}_2, \cdots, \mathbf{u}_n \} $$. Esse conjunto de vetores é considerado **linearmente independente (LI)** se nenhum ventor pertencente a $$ U $$ pode ser presentado como combinação linear dos demais. Caso isso ocorra, esse conjunto é considerado **linearmente dependente (LD)**. Caso não tenha entendido, é simples. Considere a seguinte situação: se $$ \mathbf{u}_1 $$ pode ser obtido através uma combinação linear, de acordo com a equação 19, dos vetores $$ \mathbf{u}_2, \cdots, \mathbf{u}_n $$, logo, esse conjunto é LD, caso contrário, LI.

De maneira formal, para determinar se a equação 12 possui uma solução, precisamos saber se $$ \mathbf{b} $$ está no **_span_** das colunas de $$ A $$. Esse **_span_**, em particular, é conhecido como **espaço das colunas** ou **intervalo** de $$ A $$. Perceba que encontrar todas as combinações lineares de um conjunto de vetores não é algo trivial. Logo, existem algumas condições que precisam ser respeitadas para que a solução exista.

Tomando $$ \mathbf{b} \in \mathbb{R}^m $$, é necessário que o **espaço de colunas** de $$ A $$ esteja todo em $$ \mathbb{R}^m $$. Isso implica que $$ A $$ deve ter pelo menos $$ m $$ colunas com $$ n \ge m $$. Todavia, isso é apenas uma condição necessária, mas não suficiente, pois algumas colunas podem ser redundantes. Essa redundância nada mais é do que um **dependência linear**. Para verificar essa dependência introduzimos o conceito de **posto** (ou _rank_).

Considerando o conjunto de colunas (ou linhas) de uma matriz $$ A $$, o posto $$ A $$ é igual ao maior número elementos deste conjunto que são **linearmente independentes**. Esse conjunto pode ser tanto de colunas ou linhas pois ambos os valores de ambos postos são obrigatoriamente iguais. Uma propriedade importante é que posto($$ A $$) $$ \le $$ min($$m,n$$). Se posto($$ A $$) $$ = $$ min($$m,n$$), $$ A $$ é chamada de **matriz de posto completo** (ou _full rank_). De maneira didática, se $$ A $$ é uma matriz $$ 5 \times 4 $$ e o posto($$A$$) = 5, logo, $$ A $$ é posto completo.

Mas por que o posto é importante? Bom, para garantir que o sistema da equação 12 tenha apenas uma solução, devemos verificar se $$ A $$ é posto completo. Isso é **condição necessária e suficiente** para o que desejamos. Perceba que se juntarmos a condição necessária e a necessária e sufciente apresentadas até aqui, isso significa que a matriz $$ A $$ necessáriamente deve ser **quadrada**, ou seja, $$m = n$$ e com todas as colunas linearmente independentes. Caso uma matriz quadrada possua alguma coluna linearmente dependente, ela é chamada de **singular**. E se você se recorda da seção anterior, matrizes singulares não são inversíves. Portanto, após todos esses conceitos, o resultado final é: **para uma matriz ser inversível ela deve ser posto completo!**

# Determinante de uma matriz
O determinante de uma matriz é uma função que associa uma **matriz quadrada** a um **escalar**. Este valor pode ser interpretado como uma **medida de singularidade da matriz**. De maneira formal, o determinante de uma matriz quadrada $$ A \in \mathbb{R}^{n\times n} $$ é a função det: $$\mathbb{R}^{n\times n} \rightarrow \mathbb{R} $$ e é denotado por det$$A$$ ou $$ \mid A \mid $$.

A formula geral para calcular o determinate de uma matriz não é trivial de se entender. Por isso (se você se lembrar do ensino médio), temos regras especificas para matrizes $$ 2 \times 2 $$ e $$ 3 \times 3 $$. De qualquer forma, para a matriz $$ A $$ definida anteriormente, definimos a a submatriz $$ \breve{A} $$ que será o resultado da exclusão da $$i$$-ésima linha e a $$j$$-ésima coluna de $$ A $$. De maneira formal, temos $$ \breve{A}_{\mid i, \mid j} \in \mathbb{R}^{(n-1) \times (n-1)} $$. 

## Matriz diagonal
Uma matriz diagonal é toda composta por zeros, exceto pela diagonal principal. Formalmente, $$ D $$ é uma matriz diagonal se $$ D_{ij} == 0 $$ para todo $$ i \ne j$$. Um exemplo de matriz diagonal é a identidade, descrita na equação 14. 

Um matriz diagonal quadrada composta por elementos de $$ \mathbf{v} $$ é descrita como diag($$ \mathbf{v} $$). Utilizar esse tipo de matriz é interessante pois a mesma é computacionalmente eficiente. Para calcular diag($$ \mathbf{v} $$) $$ \mathbf{x} $$ basta escalar cada elemento de $$ x_i $$ por $$ v_i $$. Em outras palavras, diag($$ \mathbf{v} $$) $$ \mathbf{x} = \mathbf{v} \times \mathbf{x}$$. 

Além disso, calcular a inversa de uma matriz diagonal é bastante eficiente. Caso a diagonal seja não zero, diag$$(\mathbf{v})^{-1} $$ = diag$$ \left ( \left [ \frac{1}{v_1}, \cdots, \frac{1}{v_n}  \right ]^T \right )$$. Essa matriz também é conhecida com **matriz de cofatores**. Dessa forma, o determinante de $$ A $$ é calculado da seguinte forma:

$$
\mid A \mid = 
\begin{matrix}
\sum_{i=1}^{n} (-1)^{i+j} \mid \breve{A}_{\mid i, \mid j} \mid  & \textrm{for any } j \in 1, \cdots, m \\
\sum_{j=1}^{n} (-1)^{i+j} \mid \breve{A}_{\mid i, \mid j} \mid  & \textrm{for any } i \in 1, \cdots, m \\
\end{matrix}
\tag{20}
$$

Perceba que a formula é recursiva e bastante trabalhosa. Por conta disso, é difícil encotrar a expansão da mesma para matrizes de ordem superior a $$ 3 \times 3 $$. A seguir, é apresentado a expansão da equação 20 para $$ A_{3 \times 3} $$. Caso queira conferir a fórmula, sinta-se a vontade:

$$
\begin{matrix}
\left | \begin{bmatrix}
 a_{11}& a_{12} & a_{13} \\ 
a_{21} & a_{22} & a_{23} \\ 
a_{31} & a_{32} & a_{33}
\end{bmatrix} \right | =  & a_{11}a_{22}a_{33} + a_{12}a_{23}a_{31} + a_{13}a_{21}a_{32} - \\
 & - a_{11}a_{23}a_{32} - a_{12}a_{21}a_{33} - a_{13}a_{22}a_{31}

\end{matrix}
\tag{21}
$$


O determinante possui algums propriedades interessantes e muito importantes:
- Para $$ A \in \mathbb{R}^{n \times n} $$: $$ \mid A \mid = \mid A^T \mid $$
- Para $$ A,B \in \mathbb{R}^{n \times n} $$: $$ \mid AB \mid = \mid A \mid \mid B \mid $$
- Para $$ A \in \mathbb{R}^{n \times n} $$: $$ \mid A \mid = 0 $$ **se e somente se** $$ A $$ **é singular**
- Para $$ A \in \mathbb{R}^{n \times n} $$ e $$ \mid A \mid \neq 0 $$: $$ \mid A \mid^{-1} = \frac{1}{\mid A \mid} $$

Se você voltar ao início dessa seção, definimos que o determinante é uma medida de singularidade e isso é descrito na terceira propriedade anterior. Essa propriedade é muito importante e se você conectou os pontos ela diz, em outras palavras que: **para uma matriz ser inversível, obrigatóriamente seu determinante deve ser diferente de zero!**. Convenhamos que isso é muito mais fácil do que determinar todoas as combinações lineares das colunas da matriz.

Por fim, a partir da definição e das propriedades de determinante, surge a definição da **matriz adjunta**:

$$
\textrm{adj}(A) = (-1)^{i+j} \mid A_{\mid i, \mid j} \mid
\tag{22}
$$

A partir desta matriz adjunta é possível calcular a inversa de $$ A $$ da seguinte forma:

$$
A^{-1} = \frac{1}{\mid A \mid} \textrm{adj}(A)
\tag{23}
$$

Todavia, apesar dessa formula ser explícita, ela é computacionalmente custosa de ser computada.

# Traço de uma matriz
O traço (ou _trace_) de uma matriz quadrada nada mais é do que a soma da sua diagonal principal. Dessa forma, seja $$ A \in \mathbb{R}^{n \times n}$$, o seu traço tr($$A$$) é definido como:

$$
\textrm(tr)(A) = \sum_{i=1}^n A_{ii}
\tag{24}
$$

Algumas das propriedades do traço de $$ A $$ são descritas a seguir:
- Para $$ A \in \mathbb{R}^{n \times n} $$: tr($$A$$) = tr($$A^T$$)
- Para $$ A,B \in \mathbb{R}^{n \times n} $$: tr($$A + B$$) = tr($$A$$) + tr($$B$$)
- Para $$ A \in \mathbb{R}^{n \times n} $$ e $$ t \in \mathbb{R} $$: tr($$tA$$) = $$t$$tr($$A^T$$)
- Para $$ A,B \in \mathbb{R}^{n \times n} $$ em que $$AB$$ é uma matriz quadrada: tr($$AB$$) = tr($$BA$$)

Vamos utilizar esse conceito mais para frente.

# Tipos especiais de matrizes e vetores
Algumas matrizes e vetores são bastantes úteis. Nesta seção serão apresentadas algumas:

## Matriz simétrica
Uma matriz simétrica é definida como $$ A_{ij} = A_{ji}. Ou seja, os valores acima da diagonal é igual aos abaixo. Isso ocorre, quando calculamos, por exemplo, uma matriz de covariância (não se preocupe, chegaremos lá). Um exemplo de matriz simétrica é descrito a seguir:

$$
A = 
\begin{bmatrix}
3 & 5 & 6 \\
5 & 2 & 4 \\
6 & 4 & 8
\end{bmatrix}
\tag{25}
$$

Uma propriedade interessante deste tipo de matriz é que ela é igual a sua transposta, ou seja,  $$ A = A^T $$.

## Vetor normal, ortogonal e ortonormal
Um vetor $$ \mathbf{x} $$ é considerado normal (ou unitário) se sua norma L2 é unitária:

$$
{\parallel \mathbf{x} \parallel}_2 = 1
\tag{26}
$$

Um detalhe importante é que qualquer vetor com norma maior do que zero pode ser normalizado, basta dividir o mesmo por sua norma, ou seja, se $$ {\parallel \mathbf{x} \parallel}_2 > 0 $$ então $$ \frac{\mathbf{x}}{ {\parallel \mathbf{x} \parallel}_2} = 1 $$.

Dois vetores $$ \mathbf{x} $$ e $$ \mathbf{y} $$ são ortogonais entre si se o produto escalar entre eles for igual a zero, ou seja:

$$ 
\mathbf{x}^T \mathbf{y} = 0 
\tag{27}
$$

Se a norma de ambos os vetores for diferente de zero, isso significa que o ângulo formado entre os vetores é igual a 90°. Além disso, se os vetores são ortogonais e ambos possuem normas unitárias, eles recebem o nome de **ortonormal**


## Matriz ortogonal
Uma matriz ortogonal é uma matriz quadrada na qual suas linhas e colunas são mutualmente ortonormais entre si, respectivamente (**importante**: é linha com linha e coluna com coluna). Caso isso ocorra, a seguinte propriedade é observada:

$$
A^T A = A A^T = I
\tag{28}
$$

O que implica em outra **propriedade muito importante**:

$$
A ^{-1} = A ^T
\tag{29}
$$

Isso significa que a inversa desse tipo de matriz possui um custo computacional **muito baixo** e por isso ela é interessante. Por fim, uma última propriedade importante deste tipo de matriz é: **o produto entre matrizes ortogonais resulta em outra matriz ortogonal**.

# Autovalores e Autovetores
Muitos conceitos matemáticos podem ser melhores compreendidos se formos capazes de quebrá-los em partes menores ou encontrando propriedades úteis. Como por exemplo, um número inteiro pode ser decomposto pelos seus fatores. Considere o número $$12$$. Podemos escrevê-lo da seguinte forma: $$ 12 = 2 \times 2 \times 3 $$. A partir dessa decomposição podemos concluir que $$ 12 $$ não é divisível por $$ 5 $$ e que qualquer múltiplo dele também é divisível por $$ 3 $$. Desejamos utilizar esse conceito demostrado neste simples exemplo para matrizes. E uma forma de alcançar isso é utilizando os **autovalores** e **autovetores**. Este conceito é bem importante e muito utilizados em alguns algoritmos de _machine learning_. Por conta disso, vamos dar uma atenção especial a ele.

## Definição e exemplos
Vamos começar definindo o que é um autovalor e autovetor de um operador linear. Seja $$ T $$ um operador linear tal que $$ T: \mathbb{V} \rightarrow \mathbb{V} $$, um vetor $$ \mathbf{v} \in \mathbb{V}$$ tal que $$ \mathbf{v} \neq 0 $$, é chamado de **autovetor** de $$ T $$ se existe um número real $$ \lambda $$ tal que:

$$
T(\mathbf{v}) = \lambda \mathbf{v}
\tag{30}
$$

Neste caso, $$ \lambda $$ é denominado **autovalor** de $$ T $$ associado ao autovetor $$ \mathbf{v} $$. Pela definição é possível perceber que geometricamente $$ \mathbf{v} $$ é um vetor que não muda de direção quando aplicamos o operador $$ T $$. Em outras palavras, um autovetor é um vetor que é levado em um múltiplo de si próprio. 

Para entendermos melhor, vamos a dois exemplos:

**Exemplo 1:**
Considere o operador linear $$ T: \mathbb{R}^2 \rightarrow \mathbb{R}^2 $$ tal que $$ T(x,y) = (4x + 5y, 2x + y) $$. Agora considere o vetor $$ \mathbf{v} = (5,2) $$. Aplicando $$ T(\mathbf(v)) $$ temos:

$$
T(5,2) = (30,12) = 6 \times (5,2)
\tag{31}
$$

Neste caso, $$ 6 $$ é um autovalor associado ao autovetor $$ (5,2) $$ do operador $$ T $$.

**Exemplo 2:**
Considere o operador linear $$ T: \mathbb{R}^3 \rightarrow \mathbb{R}^3 $$ tal que $$ T(x,y, z) = (x, y, 0) $$. Neste caso, observe que a seguinte equação é valida:

$$
T(x, y, 0) = 1 \times (x, y, 0)
\tag{32}
$$

Neste caso, qualquer vetor $$ (x, y, 0) $$ é um autovetor de $$ T $$ com autovalor igual a $$ 1 $$. Este exemplo mostra que um mesmo autovalor pode ser associando a vários autovetores.

## Determinando autovalores e autovetores
Vamos entender o conceito através de um exemplo simples. Considere o operador linear $$ T: \mathbb{R}^2 \rightarrow \mathbb{R}^2 $$ descrito por $$ T(x,y) = (ax + by, cx + dy) $$. Determinar os autovalores e autovetores é a mesma coisa que: encontrar $$ \lambda \in \mathbb{R} $$ tal que exista $$ (x, y) \neq (0, 0) $$ e $$ T(x,y) = \lambda \times (x,y)$$ .

Isso é o mesmo que encontrar:

$$
\left\{\begin{matrix}
ax + by = \lambda x \\
cx + dy = \lambda y
\end{matrix}\right.
\Rightarrow 
\left\{\begin{matrix}
(a-\lambda)x + by = 0 \\
cx + (d-\lambda)y = 0
\end{matrix}\right.
\tag{33}
$$

na qual $$ (x, y) \neq (0, 0) $$. A título de curiosidade, o polinômio $$ p(\lambda) $$ obtido por esta equação é chamado de polinômio característico.

Coincidentemente (só que não), caímos em um sistema linear igual ao da equação 12. Se ainda está por dentro deste post, você vai se lembrar que esse sistema possui uma solução não-nula se e somente se:

$$
\textrm{det}\begin{bmatrix}
(a-\lambda) & b \\
c & (d-\lambda)
\end{bmatrix}
= 0 
\tag{34}
$$

Portanto, o **autovalores** de $$ T $$ são encontrados através da equação 34, se existirem. Por sua vez, os **autovetores** associados a cada autovalor $$ \lambda $$ são as soluções não nulas da equação 33. 

## Decomposição matricial por autovalores e autovetores
Para realizar uma decomposição matricial utilizando autovalores e autovetores temos que calculá-los para uma dada matriz. Todavia, já fizemos isso nas subseções anteriores e só vamos "substituir" o operador linear $$ T $$ pela matriz. Portanto, dado uma matriz $$ A \in \mathbb{R}^n $$, os autovalores e autovetores são obtidos da seguinte forma:

$$
A \mathbf{v} = \lambda \mathbf{v}
\tag{35}
$$

Se você observar as equações 33 e 34 vai perceber que estamos fazendo exatamente a mesma coisa mas com uma notação diferente. Logo, para determinar seus autovalores e autovetores, vamos reescrever a equação 34 da seguinte forma:

$$
\textrm{det}(A - \lambda I_n) = 0
\tag{36}
$$

Portanto, $$ \mathbf{v} $$ é um autovetor de $$ A $$ associado a um autovalor $$ \lambda $$ se e somente se ambos satisfazem a equação 36. Caso queira um exemplo numérico, [neste artigo da Wikipedia](https://en.wikipedia.org/wiki/Eigenvalues_and_eigenvectors#Matrix_examples) você encontra um excelente exemplo inclusive com uma ilustração bem legal do significado geométrico.

Dado a definição, agora temos que adentrar para a decomposição de fato. Porém, é necessário um teorema, que é descrito a seguir:
  - Se $$ \mathbf{v}_1, \cdots, \mathbf{v}_n $$ são autovetores de uma matriz $$ A $$ com **diferentes** autovalores $$ \lambda_1, \cdots, \lambda_n$$ associados, então o conjunto de autovetores $$ \mathbf{v} $$ é **linearmente independente**

Tendo em vista o teorema acima, considere a matriz $$ A \in \mathbb{R}^n $$. Se essa matriz possui $$ n $$ autovalores linearmente independentes, ou seja, basta aplicar o teorema acima, podemos decompor ela de acordo com os seguintes passos:

  1. Construir uma matriz $$ V $$ composta pelos $$ n $$ autovalores, um por coluna: $$ V = [ \mathbf{v}_1, \cdots, \mathbf{v}_n] $$
  2. Da mesma maneira, construir um vetor de autovalores: $$ \boldsymbol{\lambda} = [\lambda_1, \cdots, \lambda_n]^T $$

A partir dos passos acima, a decomposição é obtida da seguinte forma:

$$
A = V \textrm{diag}(\boldsymbol{\lambda}) V^{-1}
\tag{37}
$$

Com já foi dito, essa decomposição é bastante útil para analisar algumas propriedades da matriz. Esses conceitos serão melhor abordados quando estivermos estudandando os algoritmos Análise de Componentes Principais (PCA) e Decomposição de Valores Singulares (SDV). 


# Considerações finais
Eu sei que esse post é bastante teórico e muita gente pode achar ela chata. Mas se você pretende de fato aprender os algoritmos de _machine learning_ para além de uma simples chamada de função em uma biblioteca, é importante saber a teoria por trás deles. Portanto, este começo a assim mesmo, mas acredite em mim, você ainda será capaz de fazer bastante coisa interessante usando esse conhecimento. Até a próxima.


# Principais referências
- _Deep learning_ - Ian Goodfellow, Yoshua Bengio e Aaron Courville [link](https://www.deeplearningbook.org/)

- _Linear algebra review and reference_ - Zico Kolter [link](http://www.cs.cmu.edu/~zkolter/course/15-884/linalg-review.pdf)

- Autovetor e Autovalor de um Operador Linear - Luis Crocco [link](http://www.ufjf.br/luis_crocco/files/2011/09/2014_auto_valores.pdf)