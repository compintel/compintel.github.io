---
latexEquation: true
title: "Aula 2 - O que é Machine Learning?"
header:
  teaser: "/assets/img/capas/machine_learning_a1.png"
excerpt: "Aula 2 - O que é Machine Learning - Nessa aula os conceitos basicos de machine learning são definidos. Qual a diferença de machine learning para inteligência artificial? Por que um algoritmo é considerado ser desta categoris? Essas e mais perguntas são respondidas aqui."
categories:
  - CursoML
tags:
  - Machine learning
---

Atualmente, junto com _data science_, o termo _machine learning_ está na moda. Por conta disso, esse termo aparece nos mais diversos lugares, inclusive matérias de jornais. No português brasileiro, ele costuma ser traduzido como aprendizado de máquina. Mas você já se perguntou o que é _machine learning_? Qual a diferença para inteligência artificial, que é outro termo muito popular? Bom, vamos responder essas perguntas aqui.

Primeiramente, gostaria de salientar que este termo já vem sendo utilizado desde a década de 50/60. Ele se tornou mais popular nos últimos 10 anos porque o poder computacional aumentou tanto que diversos problemas difíceis, como classificar objetos em uma imagem, passaram a ser "solucionados" utilizando a técnica. Mas o problema que começou a popularizar a técnica foi o filtro de _spam_ para emails. Isso ocorreu em meados da década de 90. O diferencial, agora, é que problemas muito mais complexos, estão sendo abordados e resultados notáveis estão sendo obtidos. Logo, rápidamentes, o termo e seus algoritmos se tornaram uma tendência.


# O que é Machine Learning?
Existem algumas definições para essa técnica e vou tentar resumi-las com as minhas palavras. De maneira geral um algoritmo é considerado ser da área de _machine learning_ se ele é designado para uma determinada tarefa **sem** utilizar instruções explícitas. O algoritmo se baseia em uma inferência para tomar uma decisão. Em outras palavras, **o algoritmo aprende a solucionar um problema através de dados.**

Tentando exemplificar, imagine que você deseja construir um algoritmo para detectar uma pessoa em uma imagem. Sem utilizar _machine learning_, você vai ter que construir um algoritmo específico pra isso. Logo, você, ser humano, vai passar sua experiência para esse código. Você sabe que uma pessoa tem pernas, braços, cabeça etc. Logo, você vai desenvolver um código capaz de detectar essas **características** na imagem e retornar se existe ou não uma pessoa. Agora, se você for utilizar algum algoritmo de _machine learning_ você não vai passar essa experiência para diretamente para o código. Você vai codificar um conjunto de regras gerais que vai utilizar **diversos exemplos** para realizar a detecção. Logo, você vai ter que coletar centenas/milhares de fotos de pessoas e apresentar para esse algoritmo. A partir daí o algoritimo vai ser **treinado** para aprender a detectar a existência de uma pessoa na imagem. Esse treinamento leva em consideração alguma métrica de desempenho e se ele for bem sucessidido, a deteção será boa. Caso contrário, ruim.

INSERIR IMAGEM EXEMPLO DEU UM ALGORITMO

Portanto, você tem que ter em mente que é **fundamental** você ter **dados** disponíveis para utilizar a técnica. E você pode se perguntar: mas o quanto de dado é suficiente? Bom, essa pergunta é complexa e vamos tentar respondê-la ao longo do curso.


# Por que Machine Learning?
- algoritmo de proposito geral, como utilizam dados, nao são explicitamente programados para uma tarefa
- a pessoa pode mudar de formato, a vezes nao possui pernas, braços etc ML pode ser atualizado