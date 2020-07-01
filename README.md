### MAP3121 - Métodos Numéricos e Aplicações (2020)
## Exercício Programa 2
  
**Instruções de compilação**

 1. Instale o compilador de linguagem C/C++ disponível em [MINGW](https://osdn.net/projects/mingw/downloads/68260/mingw-get-setup.exe/).
 2. No instalador, selecione os seguintes pacotes:

<div align="center">
	 <img width="752" height="458" src="https://i.imgur.com/7jGYs1n.png">
</div>	 

	 
 3. Clique em *Installation* e selecione *Apply Changes*.
 4. Para adicionar o compilador no PATH do Windows, siga as instruções do [link](https://terminaldeinformacao.com/2015/10/08/como-instalar-e-configurar-o-gcc-no-windows-mingw/).
 5. Coloque os seguintes arquivos em um mesmo diretório:
    - main.cpp
    - Tarefa.h
    - Tarefa.cpp

6. Abra a janela de comando no caminho do diretório.
7. Execute o seguinte comando:  

        g++ -O2 -std=c++14 main.cpp Tarefa.cpp -o EP2.exe
---
**Instruções de uso**

O programa recebe a seleção do teste a ser realizado e, nos casos dos testes C e D, pede para que o usuário forneça o valor de N, a discretização do espaço.

Em todos os testes, o programa imprime tanto os coeficiente obtidos, quanto o erro quadrático calculado, no console. Além disso, é gerado um arquivo de saída que mostra o vetor uT de entrada, medido, ao lado do vetor uT recuperado a partir dos coeficientes. Note que, no teste D, o vetor uT medido, já possui ruído.

O nome dos arquivos de saída, no formato *.txt* seguem a seguinte convenção:

    Output + <letra do teste> + <valor de N>