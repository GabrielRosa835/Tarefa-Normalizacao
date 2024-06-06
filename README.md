# Atividade individual - Tema: Locação de Automóveis (NORMALIZAÇÃO)

**ALUNO:** </br>
Gabriel Rosa da Silva, RA 237069

**DESCRIÇÃO:** </br>
O exercício consiste em normalizar uma tabela até a 3ª formal normal, documentando os passos pelo caminho. </br>
1ª FN -> Foi-se atomizado o nome dos clientes, separando em dois campos de *nome* e *sobrenome*. </br>
2ª FN -> Foi-se separado atributos não chave para tabelas próprias, criando-se uma específica para as locações, uma para os veículos e outra para os clientes. </br>
3ª FN -> Foi-se retirado o único valor dependente do esquema, o valor final da locação, visto que é apenas uma multiplicação entre o valor da diária e o número total de dias. </br>
Ao fim, foi-se criado os 'insert's com os dados fornecidos e criado a view contendo todos os detalhes das locações, assim como foi a tabela original. </br>

**MODELO LÓGICO:** </br>
![Prt_Modelo_Lógico](https://github.com/GabrielRosa835/Tarefa-Normalizacao/assets/150252238/c6534db4-ffc5-4ebc-82f5-98a4b8de957f)
