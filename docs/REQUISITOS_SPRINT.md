# Checklist oficial — Mobile Application Development / Sprint 1

Baseado no documento da disciplina enviado pela equipe.

## 1. Navegação entre telas — 25 pontos

Exigência: mínimo de cinco telas reais, conectadas, fluxo coerente, avanço/retorno quando aplicável e passagem de parâmetros quando necessário.

**Implementação:** sete telas: Início → Categoria → Perguntas → Palpite → (Correção, se necessário) → Pergunta nuclear → Resultado. O projeto usa `Navigator` e `MaterialPageRoute`.

## 2. Protótipo visual funcional — 30 pontos

Exigência: estrutura visual em todas as telas, organização coerente, identidade visual consistente e uso de widgets trabalhados em aula, como `Scaffold`, `AppBar`, `Column`, `Row`, `Container`, `Padding`, `SizedBox`, `Card`, `Image`, `Icon`, `ListView` e `GridView`, quando aplicáveis.

**Implementação:** tema consistente, cores centralizadas, cartões, ícones, botões, indicador de progresso, `Scaffold`, `AppBar`, `Column`, `Row`, `Container`, `Padding`, `SizedBox`, `Icon` e `ListView`. Alguns componentes da lista oficial são exemplos “quando aplicável”; não é necessário forçar widgets sem função no projeto.

## 3. Gerenciamento de estado — 20 pontos

Exigência: pelo menos uma funcionalidade com `StatefulWidget` e `setState()`, em que a ação do usuário atualize a interface.

**Implementação:** categoria selecionada, respostas, índice/progresso das perguntas, escolha do formulário e resposta nuclear são estados locais que atualizam a tela.

## 4. Formulário e validação — 15 pontos

Exigência: formulário com campos adequados, entrada do usuário, `TextField` ou `TextFormField`/componente equivalente, validação, envio e resposta visual com `SnackBar` ou `Dialog`.

**Implementação:** formulário de correção com `Form`, `GlobalKey<FormState>` e `DropdownButtonFormField`. A validação exige escolher um item antes de avançar. O app apresenta `SnackBar` após o envio.

## 5. Demonstração em vídeo — 10 pontos

Exigência: vídeo narrado por um ou mais integrantes, máximo de cinco minutos, demonstrando execução, todas as telas, navegação, formulário, validação, gerenciamento de estado e interação. Deve ser executado em emulador Android ou dispositivo físico; navegador sozinho não é aceito.

**Situação:** pendente de gravação pela equipe. Ver `ROTEIRO_VIDEO.md`.

## 6. Formato de entrega

- Entregar o projeto Flutter pelo repositório do GitHub Classroom indicado pela disciplina.
- Incluir README com nome, integrantes, descrição, parceiro, instruções, tecnologias e link do vídeo.
- Publicar o vídeo no YouTube como não listado.

## 7. Histórico Git

O documento espera commits incrementais que demonstrem evolução real. Evitar enviar todo o projeto em um único commit final. Exemplos de mensagens estão no README.

## Penalidades mencionadas no documento

- Não entregar via GitHub Classroom: -20 pontos.
- Ausência do README: -10 pontos.
- Aplicativo fora do escopo das aulas: -60 pontos.
- Vídeo ausente, sem narração ou sem os requisitos obrigatórios: -20 pontos.
- Histórico Git incoerente ou confuso: -50 pontos.

**Atenção:** o código e a documentação não substituem a gravação, a execução real em Android nem o envio no GitHub Classroom. Esses passos precisam ser realizados pela equipe.
