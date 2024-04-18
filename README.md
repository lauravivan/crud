# Desenvolvimento de um Aplicativo de Gerenciamento Temporal Multifuncional

Os arquivos aqui apresentados irão compor os exemplos (2. Elaboração de exemplos) junto com o crud (3. Desenvolvimento de um CRUD) utilizando o contexto do trabalho final da disciplina.

## Explicação do tema

> Este tema propõe a implementação de um aplicativo que consiste no gerenciamento de tarefas diárias, humor diário, datas importantes e ações recorrentes, para auxiliar os usuários no gerenciamento eficaz do tempo.
> Segue abaixo imagem do protótipo realizado por mim para elaboração da tarefa:

![Protótipo](images/prototype.png)

## Requisitos

> Por meio dos requisitos foi possível verificar que as entidades compartilhavam muitas propriedades e métodos e portanto foi criada a classe Entity encontrada na pasta abstractClasses (abstract pois essa classe não precisa ser instanciada, ela servirá somente para o uso de herança das demais classes).

- ImportantDate
  - An important date has an id;
  - An important date has a description;
  - An important date must be or not notified (just in that specific day);
  - An important date is important every year;
  - An important date is only important in the current year;
- Task
  - A task has an id;
  - A task has a description;
  - A task must be or not notified (just at the specific start hour);
  - A task has only a start hour (hour and minute) in the day;
  - A task has a start and end hour (hour and minute) in the day;
  - A task has a status defined by:
    - To do
    - In progress
    - On hold
    - Blocked
    - Completed
    - Deferred
    - Cancelled
- RecurringAction
  - A recurring action has an id;
  - A recurring action has a description;
  - A recurring action must notify or not every since a specific amount of time;
  - A recurring action has a date (day, month and year) stating the last time it's been done;
  - A recurring action must inform how much time (years, months, days, hours, minutes and seconds) has been since the last time it's been done;
- Mood
  - A mood has an id;
  - A mood has a description;
  - A mood has a date when it've been registered;
- App
  - An app can register one mood per day;
  - An app can register a history of moods;
  - An app can register multiple tasks per day;
  - An app can register multiple important dates;
  - An app can register multiple recurring actions;
  - An app can register user choices (configuration);

## Modelagem da CLI

![Protótipo CLI](images/cli-prototype.png)

### Task status
> Foi criado um map para registro dos status disponíveis, respectivamente com suas descrições e cores.

### Crud
> Para resolução do crud, foram divididas as operações de interação do usuário para coleta das informações por meio do arquivo crud_input.dart na pasta util e a realização de fato das operações no arquivo crud.dart na mesma pasta.

## Testes

- Foram realizados testes "automatizados" (optei por não utilizar a biblioteca de testes do dart) para as entidades de Date e Time como pode ser visto na pasta utilClasses (classes utilitárias). Os testes foram feitos com valores fixos somente para validação rápida.
- Para as demais, foram realizados testes manuais criando diferentes cenários.

### Date e Time
O usuário fica livre para informar o input que desejar (string).

Date pattern:
- mês/dia/ano
- No caso de length 7 irá verificar se o mês ou dia é válido
  - 1/1/2024: length 6
  - 1/12/2024: length 7
  - 12/1/2024: length 7
  - 12/12/2024: length 8

Time pattern:
- Considerará hora no caso de length 2 e hora válida
- Se por exemplo o usuário informar 59, o retorno será 5:9
  - 1 => length 1
  - 11 => length 2
  - 12:1 => length 3
  - 1:12 => length 3
  - 12:12 => length 4

## O que não foi contemplado
- Notificações
- Configurações do app
- Lista de moods pré-definidos (ficou livre para o usuário criar o seu)
