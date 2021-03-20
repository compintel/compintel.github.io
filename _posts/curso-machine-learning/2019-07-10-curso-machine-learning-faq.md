---
latexEquation: false
title: "Curso Machine Learning - FAQ"
header:
  teaser: "/assets/img/capas/machine_learning_a1.png"
excerpt: "Neste post é discutido basicamente a intenção deste curso, o porque de sua existência, o escopo, pré-requisitos etc. Várias perguntas são respondidas no FAQ"
toc: false
categories:
  - CursoML
tags:
  - Machine learning
---

Seja bem vindo a aula 0 do curso de _machine learning_ do blog! Este post é apenas para introduzir a ideia do curso, pré-requisitos, até onde ele vai etc. Para fazer isso de maneira mais direta e organizada, todas essas informações foram colocadas no FAQ abaixo.

Antes de iniciar, gostaria de deixar claro que a intenção do curso é compartilhar a experiência que adquiri na área ao longo dos anos. Não tenho intenção de ser estritamente formal, caso contrário escreveria um livro. Portanto, assim como já é a ideia do blog, vou continuar usando uma linguagem mais coloquial e de fácil acesso Além disso, tento exemplificar e utilizar figuras ao máximo, para que facilite a compreensão. Obviamente, as vezes é necessário ser formal, mas tentarei ser o mais direto possível.

# FAQ

## Por que você está criando este curso?
Como disse acima, a ideia deste curso é compartilhar o conhecimento que adquiri ao longo dos anos. Toda minha graduação, mestrado e doutorado foi/está sendo custeado pelo governo Brasileiro por meio da universidade pública. Tenho conciência do tamanho do investimento que é realizado para que isso seja possível. **Logo, esta é uma forma de eu retribuir**. Sei que o conhecimento dessa área é valioso e pode ser caro adquirí-lo. Portanto, esse curso é e sempre será gratuito, para que qualquer pessoa de qualquer classe social/renda possa acessá-lo e se introduzir na área.

Todavia, se você acredita que esse curso (ou esse blog de maneira geral) te ajudou de alguma forma, sinta-se livre para me [pagar um café](/cafezinho/). Seria como se você estivesse "comprando" o curso, mas com o diferencial já o ter acesso antes ;)



## Para quem é destinado este curso?
Obviamente qualquer pessoa pode acompanhar o curso. Porém, o público alvo do mesmo são alunos de graduação e pós-gradução que desejam adquirir conhecimento na área. Todavia, _machine learning_ é uma área fortemente báseada em álgebra linear, cálculo e estatística. Ter um conhecimento básico nessas disciplinas é desejável. Todavia, a aula zero deste curso vai abordar os conceitas básicos necessários destas 3 disciplinas para que você possa acompanhar os posts.

## Preciso saber programar para acompanhar este curso?
A resposta mais direta é **sim**. É necessário conhecimento básico de programação. A linguagem quase que padrão para implementar algoritmos em _machine learning_ é **Python**. Obviamente, existem diversos _frameworks_ desenvolvidos em C++, Java, R etc. Porém, os mais utilizados e difundidos estão disponíveis para Python. Esse curso não será puramente teórico. Vários algoritmos serão implementados ao longo dele. Porém, **é esperado que você entenda o básico de programação para acompanhar este curso**. Caso você não tenha, eu sugiro que assista [vídeo aulas no Youtube](https://www.youtube.com/watch?v=S9uPNppGsGo) ou aprenda de alguma [apostila](https://www.dcc.ufrj.br/~fabiom/mab225/pythonbasico.pdf) de professores universitários que disponibilizam em suas páginas pessoais. Quando conceitos mais aprofundados forem necessário, vamos abordá-lo ao longo do post.

## Quais _frameworks_ serão utilizados?
Os _frameworks_/bibliotecas/pacotes que mais vamos utilizar serão:
- NumPy e SciPy
- Pandas
- Matplotlib e Seaborn
- Scikit-learn
- Pytorch

Obviamente, pode ser que seja utilizado outro pacote ao longo do curso. Esses são os principais. Além disso, é desejável o básico de conhecimento nessas ferramentas, mas se você não as conhece, sem problema. Sempre que necessário vou explicar o que está acontecendo. E claro, vou linkar apostilas, tutoriais, vídeos, etc.

## O curso vai ter implementação ou será apenas teórico?
Com certeza vai ser mão na massa! No começo, precisamos de teoria, é óbvio. Mas teremos muita coisa prática. Aliás, o curso tem um repositório no Github com todas as implementações utilizadas ao longo das aulas. [Você pode acessá-lo aqui](https://github.com/paaatcha/curso-ml).

## Qual é o escopo do curso?
Vamos abordar todos os conceitos básicos de _machine learning_ até os principais conceitos de _deep learning_. A ideia é encerrar esse curso com as _generative adversatial networks_ (GANs).

## Por que as vezes você usa o nome em inglês e as vezes em português?
Existem diversos termos que são difíceis de traduzir ou não são popularizados em português. Logo, eu prefiro utilizar o termo em inglês. O próprio nome do curso: _machine learning_. Normalmente é traduzido para aprendizado de máquina, mas não soa muito bem. Além disso, eventualmente você vai se deparar com esses termos em blogs, livros ou aulas na língua inglesa. Logo, é bom já estar familiariza. Todavia, quando o termo é difundido em português, como por exemplo, uma _probability distribution function_ é estabelecida em português como função de distribuição de probabilidade. Nesse caso, mantenho o nome em português e falo como é escrito em inglês. Por fim, existem casos que a tradução é tenebrosa. Por exemplo, existe um algoritmo chamado _simulated annealing_. Alguns livros e artigos em português o chama de recozimento simulado. Me lembro uma vez de ter lido isso e não consegui associar ao nome em inglês. Nesse caso, prefiro manter o nome original.

## De onde vem o conteúdo deste curso?
Bom, muito do que será discutido aqui é o que eu aprendi ao longo do meu mestrado e doutorado em ciência da computação. Portanto, são diversas fontes de livros, artigos, aulas etc. Mas, muito do conteúdo aqui será baseado em alguns livros espcíficos. Para citar alguns:
- _Deep learning_ - Ian Goodfellow, Yoshua Bengio e Aaron Courville [link](https://www.deeplearningbook.org/)

- _Hands-on machine learning with Scikit-Learn and TensorFlow: concepts, tools, and techniques to build intelligent systems_. Géron, Aurélien [link](https://www.amazon.ca/Hands-Machine-Learning-Scikit-Learn-TensorFlow/dp/1491962291)

- _An introduction to statistical learning_. Gareth James, Daniela Witten, Trevor Hastie e Robert Tibshirani [link](http://www-bcf.usc.edu/~gareth/ISL/)

Eu não vou citar a todo momento os livros, mas sempre que houver alguma afirmação bem específica sobre o assunto, vou citar diretamente de onde tirei.

## O curso tem certificado?
Não.

## Qual a frequência que as aulas serão postadas?
Esperamos que 1 ou 2 vezes a cada 15 dias.

____

Caso você tenha alguma sugestão, pergunta, correção ou qualquer algo do tipo, não hesite em entrar em contato via e-mail, twitter, etc.


