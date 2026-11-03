# Nuclear Akinator — Aplicativo Mobile (Sprint 1)

> **Challenge CTMSP — Marinha do Brasil | FIAP — Análise e Desenvolvimento de Sistemas**  
> **Disciplina:** Mobile Application Development  
> **Versão:** 1.0.0 — protótipo funcional da Sprint 1

## 1. Integrantes

| Integrante | RM |
|---|---:|
| Matheus Tavares | 566844 |
| Guilherme Eustaquio | 566784 |
| Caio Cantini Couto | 563452 |

## 2. Empresa/parceiro

**Centro Tecnológico da Marinha em São Paulo (CTMSP)**, parceiro do Challenge. O projeto está relacionado ao desafio de aproximar a sociedade da ciência e da tecnologia nuclear, apresentando suas aplicações e benefícios de maneira acessível, educativa e envolvente.

## 3. Descrição da solução

O **Nuclear Akinator** é um jogo educativo para dispositivos móveis inspirado em jogos de adivinhação. O usuário escolhe mentalmente um alimento ou objeto do cotidiano e responde a perguntas com **Sim**, **Não** ou **Não sei**. Com base nas respostas, o aplicativo apresenta um palpite. Se o palpite estiver incorreto, o usuário pode corrigir o item em um formulário; assim, a explicação educativa será sempre associada ao item confirmado pelo próprio usuário.

Na etapa final, o aplicativo pergunta se o item tem relação com radiação e apresenta uma explicação científica, uma curiosidade e um aprendizado. O conteúdo diferencia radioatividade natural, radiação ionizante e radiação não ionizante, evitando tratar toda radiação como se fosse a mesma coisa.

### Objetivo

Desmistificar a tecnologia nuclear e mostrar que fenômenos relacionados à radiação podem estar presentes em alimentos, objetos, saúde e outras situações cotidianas. A experiência usa gamificação para transformar uma informação científica em uma descoberta simples e interativa.

## 4. Como funciona

1. **Início:** apresenta a proposta e o botão para começar.
2. **Categoria:** o usuário escolhe entre alimentos e objetos.
3. **Perguntas:** responde a oito perguntas usando Sim, Não ou Não sei. A barra de progresso acompanha a partida.
4. **Palpite:** o aplicativo apresenta o item que melhor corresponde às respostas registradas e pergunta se acertou.
5. **Correção do palpite:** se o palpite estiver errado, o usuário seleciona o item que realmente escolheu em um formulário validado.
6. **Pergunta nuclear:** o usuário responde se acredita que o item tem relação com radiação.
7. **Resultado:** o aplicativo revela a explicação científica e o principal aprendizado sobre o item.

**Proteção contra respostas inconsistentes ou brincadeiras:** as respostas não são tratadas como uma prova de identidade. O palpite é uma tentativa baseada nas características cadastradas. Quando o usuário informa que o palpite está errado, o formulário de correção confirma qual item deve alimentar a etapa educativa. Portanto, uma resposta contraditória não faz o aplicativo apresentar deliberadamente uma explicação sobre um item diferente do escolhido. Nesta Sprint, o mecanismo é local e baseado em regras/dados mockados; não existe integração com IA generativa ou serviço externo.

## 5. Telas implementadas

| Tela | Responsabilidade |
|---|---|
| Início | Apresentar o jogo e iniciar a experiência. |
| Escolha de categoria | Selecionar alimentos ou objetos. |
| Perguntas | Registrar respostas e atualizar o progresso. |
| Palpite | Exibir a tentativa de adivinhação e pedir confirmação. |
| Correção do palpite | Permitir selecionar o item correto com validação. |
| Pergunta nuclear | Registrar a opinião Sim/Não sobre a relação com radiação. |
| Resultado | Mostrar explicação científica e aprendizado. |

O aplicativo possui **7 telas**, acima do mínimo de 5 solicitado no documento da Sprint.

## 6. Requisitos da Sprint 1 e atendimento

| Critério oficial | Pontuação | Como o projeto atende |
|---|---:|---|
| Navegação entre telas | 25 | Fluxo conectado de 7 telas usando `Navigator` e `MaterialPageRoute`, com passagem de parâmetros e retorno pela navegação do Flutter. |
| Protótipo visual funcional | 30 | Identidade visual consistente, com cores, tipografia, cartões, ícones, botões, indicadores e widgets Material. |
| Gerenciamento de estado | 20 | `StatefulWidget` e `setState()` atualizam categoria, respostas, progresso, seleção do formulário e resposta nuclear. |
| Formulário e validação | 15 | `Form`, `GlobalKey<FormState>` e `DropdownButtonFormField`; não permite confirmar sem selecionar um item e apresenta retorno com `SnackBar`. |

### Widgets e recursos utilizados

`MaterialApp`, `Scaffold`, `AppBar`, `SafeArea`, `Column`, `Row`, `Container`, `Padding`, `SizedBox`, `Card`/cartões construídos com `Container`, `Icon`, `ListView`, `LinearProgressIndicator`, `FilledButton`, `OutlinedButton`, `TextButton`, `Form`, `GlobalKey<FormState>`, `DropdownButtonFormField`, `SnackBar`, `StatefulWidget`, `setState()`, `Navigator` e `MaterialPageRoute`.

## 7. Estrutura do projeto

```text
Nuclear_Akinator_Mobile/
├── lib/
│   └── main.dart              # Aplicativo, dados, telas e regras do jogo
├── test/
│   └── widget_test.dart       # Testes básicos da tela inicial e navegação
├── pubspec.yaml               # Configuração e dependências Flutter
├── .gitignore
└── README.md
```

## 8. Tecnologias utilizadas

- **Flutter:** framework para construção do aplicativo mobile.
- **Dart:** linguagem de programação do projeto.
- **Material 3:** componentes e identidade visual da interface.
- **Navigator / MaterialPageRoute:** navegação entre telas.
- **StatefulWidget / setState():** gerenciamento de estado local.
- **Form / GlobalKey<FormState>:** formulário e validação.
- **Dados mockados:** itens, características e textos educativos ficam definidos localmente no código.

Não há backend, banco de dados, autenticação ou API externa nesta Sprint, conforme permitido no documento da disciplina.

## 9. Como executar

### Pré-requisitos

1. Instalar o [Flutter SDK](https://docs.flutter.dev/get-started/install).
2. Instalar e configurar o Android Studio com Android SDK e um emulador, ou conectar um dispositivo Android com depuração USB habilitada.
3. Verificar a instalação executando `flutter doctor` no terminal.

### Executar o aplicativo

O repositório guarda apenas o código Dart (`lib/`, `test/` e `pubspec.yaml`). Na primeira execução, gere as pastas de plataforma do Android e depois rode o app. Na raiz do repositório, execute:

```bash
flutter create . --platforms=android
flutter pub get
flutter run
```

Para listar os dispositivos disponíveis:

```bash
flutter devices
```

Para executar os testes automatizados:

```bash
flutter test
```

Para verificar problemas estáticos:

```bash
flutter analyze
```

## 10. Testes manuais recomendados

- [ ] Abrir o aplicativo e iniciar uma partida.
- [ ] Selecionar Alimentos e concluir as perguntas.
- [ ] Repetir selecionando Objetos.
- [ ] Responder usando Sim, Não e Não sei.
- [ ] Confirmar um palpite correto.
- [ ] Corrigir um palpite e verificar que a tela final mostra o item selecionado no formulário.
- [ ] Tentar enviar o formulário sem selecionar um item e confirmar que a validação impede o avanço.
- [ ] Responder Sim e Não na pergunta nuclear e verificar que ambas as respostas permitem visualizar a explicação.
- [ ] Reiniciar o jogo.
- [ ] Executar em emulador Android ou aparelho físico.

## 11. Entrega

O documento da disciplina previa a entrega pelo GitHub Classroom, mas o serviço foi desativado pelo GitHub em 28 de agosto de 2026. Por isso, o projeto está disponível neste repositório público: https://github.com/manovares/Nuclear_Akinator_Mobile

## 12. Escopo e limitações desta versão

- O banco de itens é pequeno e fixo, apenas para demonstrar o fluxo da Sprint 1.
- A lógica de adivinhação usa características cadastradas e regras locais; não é uma IA treinada nem um modelo generativo.
- O aplicativo não consulta internet e não salva partidas após fechar.
- Os textos educativos são explicações introdutórias; não substituem orientação técnica, médica ou de segurança radiológica.

## 13. Próximas evoluções possíveis

- Ampliar o catálogo de alimentos e objetos com revisão científica das informações.
- Melhorar a estratégia de perguntas para reduzir ambiguidades e palpites repetidos.
- Adicionar imagens e animações do personagem.
- Criar níveis, pontuação e conquistas educativas.
- Em uma Sprint futura, avaliar persistência de progresso e painel de conteúdo.

---

**Projeto acadêmico — Challenge CTMSP / FIAP.**
