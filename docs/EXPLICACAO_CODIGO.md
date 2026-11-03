# Explicação do código — Nuclear Akinator

Este documento explica a organização de `lib/main.dart` para que os integrantes consigam apresentar e manter o aplicativo.

## 1. Ponto de entrada

```dart
void main() => runApp(const NuclearAkinatorApp());
```

O Flutter começa a execução em `main()`. `runApp()` monta o widget raiz `NuclearAkinatorApp`, que configura o tema e abre a tela inicial.

## 2. Identidade visual

No começo do arquivo existem constantes de cores (`navy`, `pink`, `cream`, `ink`, `muted` e `green`). Centralizar as cores facilita manter o mesmo padrão visual em todas as telas. `MaterialApp` configura o título, remove a faixa de debug e define o tema Material 3.

## 3. Modelo `GameItem`

`GameItem` representa cada alimento ou objeto do catálogo. Cada registro guarda:

- `name`, `category` e `emoji`: identificação e apresentação;
- `traits`: mapa de características usado pelas perguntas;
- `nuclearTitle` e `nuclearText`: título e explicação científica;
- `learning`: mensagem educativa;
- `relation`: classificação didática (`yes`, `no` ou `conditional`).

A lista `items` contém os dados mockados da Sprint. Para adicionar um item, inclua um novo `GameItem` nessa lista e informe suas características e conteúdo educativo.

## 4. `GameSession`: estado e regras

A classe mantém a categoria, as respostas, o índice da pergunta e o palpite. O getter `candidates` filtra os itens da categoria e compara as respostas com as características cadastradas. Respostas `Não sei` são armazenadas como `null` e não eliminam candidatos.

`answer()` registra a resposta e avança o índice. `chooseGuess()` seleciona um candidato disponível; se nenhuma característica corresponder, usa um item da categoria como palpite de fallback. Isso é uma estratégia simples de protótipo, não uma inteligência artificial.

## 5. Navegação

As telas são conectadas por `Navigator.push`, `Navigator.pushReplacement` e `MaterialPageRoute`. Os dados necessários são passados pelo construtor das telas, por exemplo `category`, `item` e `initialItem`.

- `push`: abre uma nova tela e mantém a anterior na pilha;
- `pushReplacement`: substitui a tela atual, evitando voltar para uma etapa já concluída;
- `pushAndRemoveUntil`: reinicia o fluxo e limpa as telas anteriores.

## 6. Tela inicial e categoria

`HomeScreen` apresenta a proposta e inicia o jogo. `CategoryScreen` é um `StatefulWidget`: ao tocar em um cartão, `setState()` atualiza a categoria selecionada e a aparência do cartão. Ao continuar, a categoria é passada para `QuestionsScreen`.

## 7. Perguntas e gerenciamento de estado

`QuestionsScreen` mostra uma pergunta por vez. A variável `questionIndex` determina o texto atual e o indicador de progresso. Ao escolher Sim, Não ou Não sei, `_answer()` chama `setState()` e atualiza a interface. Quando todas as perguntas terminam, o jogo calcula o palpite e navega para `GuessScreen`.

Esse fluxo demonstra o requisito de gerenciamento de estado: uma ação do usuário altera dados e provoca atualização visível na tela.

## 8. Palpite e correção

`GuessScreen` exibe o palpite. Se o usuário confirma, o item segue para a pergunta nuclear. Se não confirma, abre `CorrectionScreen`.

A correção é importante para lidar com respostas erradas, ambíguas ou intencionalmente falsas. O usuário escolhe o item correto em uma lista da categoria. Assim, o resultado educativo usa o item confirmado, não insiste em um palpite incorreto.

## 9. Formulário e validação

`CorrectionScreen` cria:

```dart
final _formKey = GlobalKey<FormState>();
```

O `Form` agrupa o campo. `DropdownButtonFormField` recebe as opções do catálogo e seu `validator` impede o envio quando nenhum item foi escolhido. `_submit()` chama `validate()`; somente se o formulário for válido o aplicativo encontra o `GameItem` correspondente, mostra um `SnackBar` e abre a próxima tela.

## 10. Pergunta nuclear e resultado

`NuclearQuestionScreen` guarda a escolha Sim/Não em `response`. O botão de resultado só aparece após uma resposta. `ResultScreen` recebe o item confirmado e apresenta o texto educativo cadastrado nele.

A resposta Sim/Não do usuário serve como interação e não altera a verdade científica do conteúdo: a explicação vem do cadastro do item. Isso evita que uma opinião do jogador mude o fato apresentado.

## 11. Onde alterar o conteúdo

Para adicionar ou revisar um objeto/alimento, edite a lista `items` no início de `main.dart`. Confira especialmente `traits`, `relation`, `nuclearText` e `learning`. As perguntas estão em `GameSession.questions`.

## 12. Limites técnicos

O protótipo usa apenas dados locais. Não há integração com API, banco de dados ou IA externa. Antes da entrega, executem `flutter pub get`, `flutter analyze` e `flutter test`, além de validar o fluxo em emulador Android ou dispositivo físico.
