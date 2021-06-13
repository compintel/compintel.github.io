---
latexEquation: true
title: "Introdução ao Scikit learn - Parte 1"
header:
  teaser: "/assets/img/posts/sklearn/sklearn_logo.png"
excerpt: "TODO"
categories:
  - Outros
tags:
  - Scikit learn
  - Sklearn
  - Data Science
  - Python
  - Machine learning
---

# Introdução
Se você chegou até este post então você provavelmente já sabe que a [Scikit-learn](https://scikit-learn.org/stable/) é uma biblioteca *open source* de *machine learning* para Python. Atualmente, é seguro dizer, que ela é maior e mais utilizada na área. Existem vários motivos para isso, listando alguns:
- Utilização fácil, intuitiva e replicável
- Documentação excelente
- Fácil integração com outros pacotes do Python como [Pandas](https://pandas.pydata.org/), [Matplotlib](https://matplotlib.org/), [Numpy](https://numpy.org/), etc
- Manutenção em dia
- Código aberto com licença BSD
- etc

Dado a sua importância e relevância, nada mais justo do que termos uma série de posts neste blog para introduzir o uso da biblioteca. A ideia inicial é apresentar o conteúdo em **5 partes** e de maneira bem mão na massa.

(NO FUTURO LINKAR AS PARTES AQUI)

Os conceitos e informações disponíveis aqui são retirados da [documentação oficial da biblioteca](https://scikit-learn.org/stable/user_guide.html), do livro [Hands-On Machine Learning with Scikit-Learn](https://www.amazon.com.br/Hands-Machine-Learning-Scikit-Learn-TensorFlow/dp/1492032646/ref=asc_df_1492032646/?tag=googleshopp00-20&linkCode=df0&hvadid=379733272930&hvpos=&hvnetw=g&hvrand=7615561669283143903&hvpone=&hvptwo=&hvqmt=&hvdev=c&hvdvcmdl=&hvlocint=&hvlocphy=1001549&hvtargid=pla-523968811896&psc=1), e do projeto do [calmcode.io](https://github.com/koaning/calm-notebooks). Aliás, caso você queira conferir, eles fizerem um [mini-curso de sklearn](https://youtu.be/0B5eIE_1vpU) no canal do [FreeCodeCamp](https://www.youtube.com/channel/UC8butISFwT-Wl7EV0hUK0BQ). Porém, está em inglês, como quase tudo nessa área. 

Outro ponto relevante é que **eu já espero que você entenda os conceitos básicos de machine learning** e saiba o **básico de programação em Python** para de fato entender o que a biblioteca faz. Por isso, listo alguns posts relevantes deste blog que acredito que você deveria dar uma olhada caso não tenha domínio no assunto:
- [Curso de Python](/curso-python/)
- [O que é Machine Learning?]({% post_url 2021-03-11-o-que-e-machine-learning %})
- [Classificação de dados]({% post_url 2016-11-04-classificacao-de-dados %})
- [Medida de desempenho de classificadores]({% post_url 2018-03-31-medidas-classificadores-1 %})
- [O problema de otimização]({% post_url 2015-04-08-o-problema-de-otimizacao %})

Por fim, antes de iniciar, todos os códigos exemplificados nessa série estão disponíveis neste [repositório do Github](). Nele, você encontra informações sobre instalação, dependências, etc. Agora, sem mais delongas, vamos iniciar o *payload* da nossa série!

# Visão geral da biblioteca
Seguindo a documentação da oficial da biblioteca, para termos uma visão geral da mesma, podemos dividí-la em cinco módulos:
- Estimadores básicos
- Pre-processamento e transformadores
- Pipelines
- Avaliação de modelos
- Busca automática de parâmetros

Na sequência, vamos discutir a função de cada um dos módulos.

## Estimadores básicos
A Scikit-learn possui vários algoritmos e modelos de *machine learning*. Na biblioteca eles são nomeados de estimadores (*estimators*). Um estimador pode ser, por exemplo, uma rede neural artificial que executar uma classificação de dados. O que é legal na biblioteca é que os estimadores, não importa o algoritmo (rede neural, KNN, árvore de decisão, etc), segue um mesmo padrão utilização que vai incluir uma função para treinamento chamada `fit()` e para realizar predições, a `predict()`.

Vamos utilizar como exemplo uma rede neural para realizar classificação. Na biblioteca ela é chamada de MLP (*multilayer perceptron*) e fica dentro do sub pacote de `neural_network`. Para utilizá-la, basta fazer:

```python
from sklearn.neural_network import MLPClassifier
mlp = MLPClassifier()
def andre(x, y=10):
  class aaaa:
    def __init__(self):
      pass
  c = aaaa()
  c.x = 10
  c = "Andre"
  x = 'andre'
  a = x + y
  b = 10 + 11 # this is acomment
  return a + b
```

Em resumo, criamos um objeto da classe `MLPClassifier` utilizando todos os parâmetros como *default*. Não se preocupe com isso agora, vamos abordar isso mais para frente. A intenção aqui é ter uma visão geral. Existem vários métodos e atributos relacionados ao objeto `mlp`. Mas desejamos explorar aqui apenas o `fit()` e o `predict()`. 

O `fit()` é utilizado para treinar a nossa rede neural. Como nesse caso vamos lidar com um problema de classificação de dados e ele é um problema de aprendizado supervisionado, precisamos de dados de entrada e saída. 







