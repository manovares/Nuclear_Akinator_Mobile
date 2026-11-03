import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(const NuclearAkinatorApp());

const navy = Color(0xFF111C3A);
const pink = Color(0xFFFF2D75);
const cream = Color(0xFFF5F3EF);
const ink = Color(0xFF202536);
const muted = Color(0xFF747B8D);
const green = Color(0xFF16845B);

class GameItem {
  final String name;
  final String category;
  final String emoji;
  final Map<String, bool> traits;
  final String nuclearTitle;
  final String nuclearText;
  final String learning;
  final String relation; // yes, no, conditional

  const GameItem({
    required this.name,
    required this.category,
    required this.emoji,
    required this.traits,
    required this.nuclearTitle,
    required this.nuclearText,
    required this.learning,
    required this.relation,
  });
}

const items = <GameItem>[
  GameItem(
    name: 'Banana', category: 'Alimento', emoji: '🍌',
    traits: {'É uma fruta?': true, 'É doce?': true, 'Tem a casca amarela?': true, 'É vermelho por fora?': false, 'Cresce embaixo da terra?': false, 'Tem casca dura?': false, 'Costuma ser comido cru?': true, 'É laranja?': false, 'Precisa ser cozido para comer?': false, 'É um grão?': false},
    nuclearTitle: 'Radioatividade natural',
    nuclearText: 'Sim! A banana contém potássio. Uma pequena fração desse elemento é o isótopo potássio-40, que é radioativo.',
    learning: 'A radioatividade natural está presente no ambiente e em alimentos. A quantidade encontrada em uma banana é muito pequena e não representa risco relevante no consumo habitual.',
    relation: 'yes',
  ),
  GameItem(
    name: 'Castanha-do-pará', category: 'Alimento', emoji: '🌰',
    traits: {'É uma fruta?': false, 'É doce?': false, 'Tem a casca amarela?': false, 'É vermelho por fora?': false, 'Cresce embaixo da terra?': false, 'Tem casca dura?': true, 'Costuma ser comido cru?': true, 'É laranja?': false, 'Precisa ser cozido para comer?': false, 'É um grão?': false},
    nuclearTitle: 'Elementos radioativos naturais',
    nuclearText: 'Sim! A castanha-do-pará pode conter radionuclídeos naturais, como o rádio, absorvidos do solo pelas raízes.',
    learning: 'É um exemplo de como elementos radioativos naturais estão presentes no ambiente. A presença natural não significa automaticamente perigo.',
    relation: 'yes',
  ),
  GameItem(
    name: 'Maçã', category: 'Alimento', emoji: '🍎',
    traits: {'É uma fruta?': true, 'É doce?': true, 'Tem a casca amarela?': false, 'É vermelho por fora?': true, 'Cresce embaixo da terra?': false, 'Tem casca dura?': false, 'Costuma ser comido cru?': true, 'É laranja?': false, 'Precisa ser cozido para comer?': false, 'É um grão?': false},
    nuclearTitle: 'Potássio natural',
    nuclearText: 'A maçã contém potássio, como muitos alimentos. O potássio natural inclui uma pequena parcela do isótopo radioativo potássio-40.',
    learning: 'A quantidade é muito baixa. O ponto educativo é entender que existe radioatividade natural em diversos elementos do cotidiano.',
    relation: 'yes',
  ),
  GameItem(
    name: 'Celular', category: 'Objeto', emoji: '📱',
    traits: {'É eletrônico?': true, 'Funciona com bateria?': true, 'Fica na cozinha?': false, 'É usado na medicina?': false, 'É usado no pulso?': false, 'Serve para a segurança da casa?': false, 'Esquenta comida?': false, 'É feito de pedra?': false, 'Cabe no bolso?': true, 'Fica preso no teto?': false},
    nuclearTitle: 'Radiação não ionizante',
    nuclearText: 'O celular transmite e recebe ondas de radiofrequência, que são uma forma de radiação não ionizante. Ele não é radioativo por si só.',
    learning: 'Nem toda radiação é igual. Radiofrequência não é a mesma coisa que radiação ionizante emitida por raios X ou por materiais radioativos.',
    relation: 'no',
  ),
  GameItem(
    name: 'Aparelho de raio-X', category: 'Objeto', emoji: '🩻',
    traits: {'É eletrônico?': true, 'Funciona com bateria?': false, 'Fica na cozinha?': false, 'É usado na medicina?': true, 'É usado no pulso?': false, 'Serve para a segurança da casa?': false, 'Esquenta comida?': false, 'É feito de pedra?': false, 'Cabe no bolso?': false, 'Fica preso no teto?': false},
    nuclearTitle: 'Radiação ionizante na medicina',
    nuclearText: 'Sim! O aparelho produz raios X quando está em funcionamento, permitindo visualizar estruturas internas do corpo.',
    learning: 'O aparelho convencional não precisa conter material radioativo para produzir raios X: a radiação é gerada durante o funcionamento.',
    relation: 'yes',
  ),
  GameItem(
    name: 'Detector de fumaça', category: 'Objeto', emoji: '🚨',
    traits: {'É eletrônico?': true, 'Funciona com bateria?': true, 'Fica na cozinha?': false, 'É usado na medicina?': false, 'É usado no pulso?': false, 'Serve para a segurança da casa?': true, 'Esquenta comida?': false, 'É feito de pedra?': false, 'Cabe no bolso?': false, 'Fica preso no teto?': true},
    nuclearTitle: 'Depende do modelo',
    nuclearText: 'Alguns detectores de fumaça por ionização utilizam uma pequena quantidade de amerício-241, um material radioativo. Modelos fotoelétricos funcionam de outra maneira.',
    learning: 'É importante identificar o tipo de detector. Não se deve abrir ou desmontar o equipamento; siga as orientações do fabricante.',
    relation: 'conditional',
  ),
  GameItem(
    name: 'Relógio antigo luminoso', category: 'Objeto', emoji: '⌚',
    traits: {'É eletrônico?': false, 'Funciona com bateria?': false, 'Fica na cozinha?': false, 'É usado na medicina?': false, 'É usado no pulso?': true, 'Serve para a segurança da casa?': false, 'Esquenta comida?': false, 'É feito de pedra?': false, 'Fica preso no teto?': false},
    nuclearTitle: 'Depende da época e do material',
    nuclearText: 'Alguns relógios antigos usavam materiais luminosos com substâncias radioativas, como o rádio. Muitos relógios atuais usam tecnologias diferentes.',
    learning: 'A idade e a composição do objeto importam. Não tente abrir ou raspar tintas luminosas antigas.',
    relation: 'conditional',
  ),
  GameItem(
    name: 'Batata', category: 'Alimento', emoji: '🥔',
    traits: {'É uma fruta?': false, 'É doce?': false, 'Tem a casca amarela?': false, 'É vermelho por fora?': false, 'Cresce embaixo da terra?': true, 'Tem casca dura?': false, 'Costuma ser comido cru?': false, 'É laranja?': false, 'Precisa ser cozido para comer?': true, 'É um grão?': false},
    nuclearTitle: 'Potássio-40 na natureza',
    nuclearText: 'A batata contém potássio, e uma pequena parcela do potássio natural é o isótopo radioativo potássio-40.',
    learning: 'A radioatividade natural ocorre em muitos alimentos. Isso não significa que eles sejam perigosos no consumo normal.',
    relation: 'yes',
  ),
  GameItem(
    name: 'Cenoura', category: 'Alimento', emoji: '🥕',
    traits: {'É uma fruta?': false, 'Tem a casca amarela?': false, 'É vermelho por fora?': false, 'Cresce embaixo da terra?': true, 'Tem casca dura?': false, 'Costuma ser comido cru?': true, 'É laranja?': true, 'Precisa ser cozido para comer?': false, 'É um grão?': false},
    nuclearTitle: 'Potássio-40 na natureza',
    nuclearText: 'A cenoura, como a maioria dos vegetais, contém potássio. Uma pequena parcela do potássio natural é o isótopo radioativo potássio-40.',
    learning: 'O nosso próprio corpo também contém potássio-40. É uma radioatividade natural, presente em níveis muito baixos.',
    relation: 'yes',
  ),
  GameItem(
    name: 'Feijão', category: 'Alimento', emoji: '🫘',
    traits: {'É uma fruta?': false, 'É doce?': false, 'Tem a casca amarela?': false, 'É vermelho por fora?': false, 'Cresce embaixo da terra?': false, 'Costuma ser comido cru?': false, 'É laranja?': false, 'Precisa ser cozido para comer?': true, 'É um grão?': true},
    nuclearTitle: 'Rico em potássio',
    nuclearText: 'O feijão é um dos alimentos mais ricos em potássio e, por isso, contém um pouco de potássio-40, um isótopo radioativo natural.',
    learning: 'Alimentos ricos em potássio têm um pouco mais de potássio-40, mas a dose recebida na alimentação é muito pequena e faz parte da radiação natural do dia a dia.',
    relation: 'yes',
  ),
  GameItem(
    name: 'Micro-ondas', category: 'Objeto', emoji: '♨️',
    traits: {'É eletrônico?': true, 'Funciona com bateria?': false, 'Fica na cozinha?': true, 'É usado na medicina?': false, 'É usado no pulso?': false, 'Serve para a segurança da casa?': false, 'Esquenta comida?': true, 'É feito de pedra?': false, 'Cabe no bolso?': false, 'Fica preso no teto?': false},
    nuclearTitle: 'Radiação não ionizante',
    nuclearText: 'O micro-ondas usa ondas eletromagnéticas para agitar as moléculas de água e aquecer a comida. É uma radiação não ionizante.',
    learning: 'A comida aquecida no micro-ondas não fica radioativa. Aquecer com ondas não é o mesmo que expor algo a um material radioativo.',
    relation: 'no',
  ),
  GameItem(
    name: 'Bancada de granito', category: 'Objeto', emoji: '🪨',
    traits: {'É eletrônico?': false, 'Funciona com bateria?': false, 'Fica na cozinha?': true, 'É usado na medicina?': false, 'É usado no pulso?': false, 'Serve para a segurança da casa?': false, 'Esquenta comida?': false, 'É feito de pedra?': true, 'Cabe no bolso?': false, 'Fica preso no teto?': false},
    nuclearTitle: 'Radioatividade natural das rochas',
    nuclearText: 'Rochas como o granito podem conter pequenas quantidades de urânio, tório e potássio-40, elementos que existem naturalmente na crosta terrestre.',
    learning: 'Na maioria das bancadas os níveis são muito baixos. Isso mostra que a radioatividade natural também está nas rochas e nos materiais de construção.',
    relation: 'yes',
  ),
];

class NuclearAkinatorApp extends StatelessWidget {
  const NuclearAkinatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nuclear Akinator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: cream,
        colorScheme: ColorScheme.fromSeed(seedColor: pink, primary: navy, surface: cream),
        fontFamily: 'Roboto',
        appBarTheme: const AppBarTheme(
          backgroundColor: cream, foregroundColor: navy, elevation: 0,
          centerTitle: false, titleTextStyle: TextStyle(color: navy, fontSize: 18, fontWeight: FontWeight.w800),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

const foodQuestions = [
  'É uma fruta?',
  'É doce?',
  'Tem a casca amarela?',
  'É vermelho por fora?',
  'Cresce embaixo da terra?',
  'Tem casca dura?',
  'Costuma ser comido cru?',
  'É laranja?',
  'Precisa ser cozido para comer?',
  'É um grão?',
];

const objectQuestions = [
  'É eletrônico?',
  'Funciona com bateria?',
  'Fica na cozinha?',
  'É usado na medicina?',
  'É usado no pulso?',
  'Serve para a segurança da casa?',
  'Esquenta comida?',
  'É feito de pedra?',
  'Cabe no bolso?',
  'Fica preso no teto?',
];

/// Controla uma partida: escolhe a próxima pergunta com base nas respostas
/// anteriores e calcula qual item combina melhor com elas.
class GameSession {
  static const maxQuestions = 6;
  static const minQuestions = 3;

  final String category;
  final Map<String, bool?> answers = {};
  final Random _random = Random();
  String? currentQuestion;

  GameSession(this.category) {
    currentQuestion = _nextQuestion();
  }

  List<GameItem> get pool => items.where((i) => i.category == category).toList();
  List<String> get questions => category == 'Alimento' ? foodQuestions : objectQuestions;
  int get answeredCount => answers.length;
  bool get finished => currentQuestion == null;

  /// Pontuação do item: +1 para cada resposta que combina e -2 para cada uma
  /// que contradiz. "Não sei" e características não cadastradas não contam.
  /// Assim, uma resposta errada não elimina o item de vez.
  int score(GameItem item) {
    var total = 0;
    answers.forEach((question, answer) {
      final trait = item.traits[question];
      if (answer == null || trait == null) return;
      total += trait == answer ? 1 : -2;
    });
    return total;
  }

  /// Itens empatados com a maior pontuação.
  List<GameItem> get leaders {
    final all = pool;
    final best = all.map(score).reduce(max);
    return all.where((i) => score(i) == best).toList();
  }

  /// Escolhe a pergunta que melhor divide os itens que ainda estão na frente.
  String? _nextQuestion() {
    if (answeredCount >= maxQuestions) return null;
    final top = leaders;
    if (top.length == 1 && answeredCount >= minQuestions) return null;
    final group = top.length > 1 ? top : pool;

    String? bestQuestion;
    var bestSplit = 0;
    for (final question in questions) {
      if (answers.containsKey(question)) continue;
      final yes = group.where((i) => i.traits[question] == true).length;
      final no = group.where((i) => i.traits[question] == false).length;
      final split = min(yes, no);
      if (split > bestSplit) {
        bestSplit = split;
        bestQuestion = question;
      }
    }
    return bestQuestion;
  }

  void answer(bool? value) {
    answers[currentQuestion!] = value;
    currentQuestion = _nextQuestion();
  }

  /// Palpite: o item com maior pontuação; em caso de empate, sorteia um deles.
  GameItem chooseGuess() {
    final top = leaders;
    return top[_random.nextInt(top.length)];
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 22, 24, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(children: [
                const Icon(Icons.auto_awesome, color: pink, size: 27),
                const SizedBox(width: 8),
                const Text('NUCLEAR', style: TextStyle(color: navy, fontWeight: FontWeight.w900, letterSpacing: 2)),
                const Text(' AKINATOR', style: TextStyle(color: pink, fontWeight: FontWeight.w900, letterSpacing: 1)),
              ]),
              const Spacer(),
              Center(
                child: Container(
                  width: 190, height: 190,
                  decoration: BoxDecoration(color: navy, borderRadius: BorderRadius.circular(48)),
                  child: const Center(child: Text('🧑‍🚀', style: TextStyle(fontSize: 112))),
                ),
              ),
              const SizedBox(height: 30),
              const Text('Pense em um objeto.\nDescubra algo\nsurpreendente.', style: TextStyle(fontSize: 31, height: 1.12, fontWeight: FontWeight.w900, color: navy)),
              const SizedBox(height: 14),
              const Text('Um jogo de adivinhação que revela como a radiação e a tecnologia nuclear aparecem no nosso cotidiano.', style: TextStyle(fontSize: 15, height: 1.5, color: muted)),
              const Spacer(),
              SizedBox(width: double.infinity, height: 56, child: FilledButton(
                style: FilledButton.styleFrom(backgroundColor: pink, foregroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const CategoryScreen())),
                child: const Text('COMEÇAR JOGO', style: TextStyle(fontWeight: FontWeight.w900, letterSpacing: 1)),
              )),
              const SizedBox(height: 12),
              const Center(child: Text('Aprender pode ser uma descoberta.', style: TextStyle(color: muted, fontSize: 12))),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});
  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  String selected = 'Alimento';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Escolha seu desafio')),
      body: Padding(
        padding: const EdgeInsets.all(22),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text('O que você escolheu?', style: TextStyle(fontSize: 27, fontWeight: FontWeight.w900, color: navy)),
          const SizedBox(height: 8),
          const Text('Pense em um item da categoria selecionada. Não conte para o nosso personagem!', style: TextStyle(color: muted, height: 1.4)),
          const SizedBox(height: 26),
          _CategoryCard(title: 'Alimentos', subtitle: 'Frutas, castanhas e outros alimentos', emoji: '🍌', selected: selected == 'Alimento', onTap: () => setState(() => selected = 'Alimento')),
          const SizedBox(height: 14),
          _CategoryCard(title: 'Objetos', subtitle: 'Itens e tecnologias do cotidiano', emoji: '📱', selected: selected == 'Objeto', onTap: () => setState(() => selected = 'Objeto')),
          const SizedBox(height: 22),
          const Text('ESCOLHA UM DESTES', style: TextStyle(color: pink, fontWeight: FontWeight.w900, fontSize: 12, letterSpacing: 1)),
          const SizedBox(height: 10),
          // Mostra os itens da categoria para o jogador escolher um mentalmente.
          Wrap(spacing: 8, runSpacing: 8, children: items.where((i) => i.category == selected).map((i) => Chip(
            avatar: Text(i.emoji),
            label: Text(i.name, style: const TextStyle(color: navy, fontWeight: FontWeight.w700)),
            backgroundColor: Colors.white,
            side: const BorderSide(color: Colors.black12),
          )).toList()),
          const Spacer(),
          SizedBox(width: double.infinity, height: 54, child: FilledButton(
            style: FilledButton.styleFrom(backgroundColor: pink, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => QuestionsScreen(category: selected))),
            child: const Text('PENSAR NO MEU ITEM', style: TextStyle(fontWeight: FontWeight.w900)),
          )),
        ]),
      ),
    );
  }
}

class _CategoryCard extends StatelessWidget {
  final String title, subtitle, emoji;
  final bool selected;
  final VoidCallback onTap;
  const _CategoryCard({required this.title, required this.subtitle, required this.emoji, required this.selected, required this.onTap});
  @override
  Widget build(BuildContext context) => InkWell(
    borderRadius: BorderRadius.circular(20), onTap: onTap,
    child: Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(color: selected ? navy : Colors.white, borderRadius: BorderRadius.circular(20), border: Border.all(color: selected ? pink : Colors.black12, width: selected ? 2 : 1)),
      child: Row(children: [
        Text(emoji, style: const TextStyle(fontSize: 42)),
        const SizedBox(width: 16),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(title, style: TextStyle(color: selected ? Colors.white : navy, fontSize: 18, fontWeight: FontWeight.w800)),
          Text(subtitle, style: TextStyle(color: selected ? Colors.white70 : muted, fontSize: 12)),
        ])),
        Icon(selected ? Icons.check_circle : Icons.circle_outlined, color: selected ? pink : muted),
      ]),
    ),
  );
}

class QuestionsScreen extends StatefulWidget {
  final String category;
  const QuestionsScreen({super.key, required this.category});
  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  late final GameSession game = GameSession(widget.category);
  @override
  Widget build(BuildContext context) {
    // Quando a partida termina, a tela ainda aparece por um instante durante a troca para o palpite.
    final number = min(game.answeredCount + 1, GameSession.maxQuestions);
    final question = game.currentQuestion ?? '';
    return Scaffold(
      appBar: AppBar(title: const Text('Vamos descobrir')),
      body: Padding(
        padding: const EdgeInsets.all(22),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            const Text('PERGUNTA', style: TextStyle(color: pink, fontWeight: FontWeight.w900, letterSpacing: 1)),
            Text('$number de até ${GameSession.maxQuestions}', style: const TextStyle(color: muted, fontWeight: FontWeight.w700)),
          ]),
          const SizedBox(height: 12),
          ClipRRect(borderRadius: BorderRadius.circular(20), child: LinearProgressIndicator(value: number / GameSession.maxQuestions, minHeight: 8, color: pink, backgroundColor: Colors.black12)),
          const Spacer(),
          const Center(child: Text('🤔', style: TextStyle(fontSize: 68))),
          const SizedBox(height: 26),
          Text(question, textAlign: TextAlign.center, style: const TextStyle(fontSize: 28, height: 1.2, fontWeight: FontWeight.w900, color: navy)),
          const SizedBox(height: 10),
          const Center(child: Text('Responda de acordo com o item que você pensou.', textAlign: TextAlign.center, style: TextStyle(color: muted))),
          const Spacer(),
          _AnswerButton(label: 'Sim', icon: Icons.check_circle, onTap: () => _answer(true)),
          const SizedBox(height: 10),
          _AnswerButton(label: 'Não', icon: Icons.cancel, onTap: () => _answer(false), secondary: true),
          const SizedBox(height: 10),
          TextButton.icon(onPressed: () => _answer(null), icon: const Icon(Icons.help_outline), label: const Text('Não sei')),
        ]),
      ),
    );
  }
  void _answer(bool? value) {
    setState(() => game.answer(value));
    if (game.finished) {
      final guess = game.chooseGuess();
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => GuessScreen(item: guess, category: widget.category)));
    }
  }
}

class _AnswerButton extends StatelessWidget {
  final String label; final IconData icon; final VoidCallback onTap; final bool secondary;
  const _AnswerButton({required this.label, required this.icon, required this.onTap, this.secondary = false});
  @override
  Widget build(BuildContext context) => SizedBox(width: double.infinity, height: 52, child: FilledButton.icon(
    onPressed: onTap, icon: Icon(icon), label: Text(label, style: const TextStyle(fontWeight: FontWeight.w800)),
    style: FilledButton.styleFrom(backgroundColor: secondary ? navy : pink, foregroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14))),
  ));
}

class GuessScreen extends StatelessWidget {
  final GameItem item; final String category;
  const GuessScreen({super.key, required this.item, required this.category});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Meu palpite')),
      body: Padding(padding: const EdgeInsets.all(24), child: Column(children: [
        const Spacer(),
        const Text('HMMM... TENHO UMA SUSPEITA!', style: TextStyle(color: pink, fontWeight: FontWeight.w900, letterSpacing: 1, fontSize: 12)),
        const SizedBox(height: 24),
        Text(item.emoji, style: const TextStyle(fontSize: 100)),
        const SizedBox(height: 18),
        const Text('Você pensou em...', style: TextStyle(color: muted, fontSize: 16)),
        Text(item.name, style: const TextStyle(color: navy, fontWeight: FontWeight.w900, fontSize: 34)),
        const SizedBox(height: 12),
        const Text('Acertei?', style: TextStyle(color: ink, fontSize: 19, fontWeight: FontWeight.w700)),
        const Spacer(),
        SizedBox(width: double.infinity, height: 54, child: FilledButton(
          style: FilledButton.styleFrom(backgroundColor: pink, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => NuclearQuestionScreen(item: item))),
          child: const Text('SIM, VOCÊ ACERTOU!', style: TextStyle(fontWeight: FontWeight.w900)),
        )),
        const SizedBox(height: 10),
        SizedBox(width: double.infinity, height: 54, child: OutlinedButton(
          style: OutlinedButton.styleFrom(foregroundColor: navy, side: const BorderSide(color: navy), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => CorrectionScreen(initialItem: item))),
          child: const Text('NÃO, QUERO CORRIGIR', style: TextStyle(fontWeight: FontWeight.w900)),
        )),
        const SizedBox(height: 14),
      ])),
    );
  }
}

class CorrectionScreen extends StatefulWidget {
  final GameItem initialItem;
  const CorrectionScreen({super.key, required this.initialItem});
  @override
  State<CorrectionScreen> createState() => _CorrectionScreenState();
}

class _CorrectionScreenState extends State<CorrectionScreen> {
  final _formKey = GlobalKey<FormState>();
  String? selected;
  @override
  Widget build(BuildContext context) {
    final categoryItems = items.where((i) => i.category == widget.initialItem.category).toList();
    return Scaffold(
      appBar: AppBar(title: const Text('Corrigir meu palpite')),
      body: Padding(padding: const EdgeInsets.all(22), child: Form(
        key: _formKey,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text('Sem problemas! Vamos ajustar.', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900, color: navy)),
          const SizedBox(height: 8),
          const Text('Selecione o item que você realmente escolheu. Assim, a explicação será sobre o objeto certo.', style: TextStyle(color: muted, height: 1.4)),
          const SizedBox(height: 25),
          DropdownButtonFormField<String>(
            value: selected,
            decoration: InputDecoration(labelText: 'Qual era o item?', filled: true, fillColor: Colors.white, border: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide.none)),
            items: categoryItems.map((i) => DropdownMenuItem(value: i.name, child: Text('${i.emoji}  ${i.name}'))).toList(),
            onChanged: (v) => setState(() => selected = v),
            validator: (v) => v == null ? 'Selecione o item para continuar.' : null,
          ),
          const Spacer(),
          SizedBox(width: double.infinity, height: 54, child: FilledButton(
            style: FilledButton.styleFrom(backgroundColor: pink, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
            onPressed: _submit,
            child: const Text('CONFIRMAR ITEM', style: TextStyle(fontWeight: FontWeight.w900)),
          )),
        ]),
      )),
    );
  }
  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    final chosen = items.firstWhere((i) => i.name == selected);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Item corrigido! Vamos à descoberta nuclear.')));
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => NuclearQuestionScreen(item: chosen)));
  }
}

class NuclearQuestionScreen extends StatefulWidget {
  final GameItem item;
  const NuclearQuestionScreen({super.key, required this.item});
  @override
  State<NuclearQuestionScreen> createState() => _NuclearQuestionScreenState();
}

class _NuclearQuestionScreenState extends State<NuclearQuestionScreen> {
  bool? response;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('A grande pergunta')),
      body: Padding(padding: const EdgeInsets.all(24), child: Column(children: [
        const Spacer(),
        Text(widget.item.emoji, style: const TextStyle(fontSize: 76)),
        const SizedBox(height: 24),
        const Text('SURPRESA NUCLEAR!', style: TextStyle(color: pink, fontWeight: FontWeight.w900, letterSpacing: 1)),
        const SizedBox(height: 12),
        const Text('Você acha que esse item tem relação com a radiação?', textAlign: TextAlign.center, style: TextStyle(color: navy, fontSize: 26, fontWeight: FontWeight.w900, height: 1.2)),
        const SizedBox(height: 14),
        Text(widget.item.name, style: const TextStyle(color: muted, fontSize: 18)),
        const Spacer(),
        _AnswerButton(label: 'Sim', icon: Icons.check_circle, onTap: () => setState(() => response = true)),
        const SizedBox(height: 10),
        _AnswerButton(label: 'Não', icon: Icons.cancel, onTap: () => setState(() => response = false), secondary: true),
        if (response != null) ...[
          const SizedBox(height: 16),
          SizedBox(width: double.infinity, height: 54, child: FilledButton(
            style: FilledButton.styleFrom(backgroundColor: green, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
            onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => ResultScreen(item: widget.item, answer: response!))),
            child: const Text('VER A DESCOBERTA', style: TextStyle(fontWeight: FontWeight.w900)),
          )),
        ],
        const SizedBox(height: 12),
      ])),
    );
  }
}

class ResultScreen extends StatelessWidget {
  final GameItem item; final bool answer;
  const ResultScreen({super.key, required this.item, required this.answer});
  @override
  Widget build(BuildContext context) {
    final hasRelation = item.relation == 'yes' || item.relation == 'conditional';
    final headline = item.relation == 'conditional' ? 'DEPENDE DO MODELO!' : (hasRelation ? 'SIM, TEM RELAÇÃO!' : 'NÃO É RADIOATIVO!');
    final feedback = item.relation == 'conditional'
      ? 'A resposta depende da versão e das características desse item.'
      : (hasRelation ? 'Boa descoberta! Veja como isso acontece:' : 'Quase! Existe uma diferença importante para entender:');
    return Scaffold(
      appBar: AppBar(title: const Text('Sua descoberta')),
      body: ListView(padding: const EdgeInsets.all(22), children: [
        Center(child: Text(item.emoji, style: const TextStyle(fontSize: 74))),
        const SizedBox(height: 10),
        Center(child: Text(headline, textAlign: TextAlign.center, style: const TextStyle(color: pink, fontSize: 24, fontWeight: FontWeight.w900))),
        const SizedBox(height: 12),
        Text(feedback, textAlign: TextAlign.center, style: const TextStyle(color: muted, fontSize: 14)),
        const SizedBox(height: 22),
        Container(padding: const EdgeInsets.all(18), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(18)),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(item.name, style: const TextStyle(color: navy, fontSize: 22, fontWeight: FontWeight.w900)),
            const SizedBox(height: 8),
            Text(item.nuclearTitle.toUpperCase(), style: const TextStyle(color: pink, fontWeight: FontWeight.w900, fontSize: 11, letterSpacing: .7)),
            const SizedBox(height: 8),
            Text(item.nuclearText, style: const TextStyle(color: ink, height: 1.5)),
            const SizedBox(height: 16),
            const Text('O QUE VOCÊ APRENDEU?', style: TextStyle(color: navy, fontWeight: FontWeight.w900, fontSize: 12)),
            const SizedBox(height: 7),
            Text(item.learning, style: const TextStyle(color: muted, height: 1.5)),
          ]),
        ),
        const SizedBox(height: 16),
        Container(padding: const EdgeInsets.all(14), decoration: BoxDecoration(color: const Color(0xFFE8F4EE), borderRadius: BorderRadius.circular(14)),
          child: const Text('Lembre-se: radiação, radioatividade e risco não são a mesma coisa. O contexto e o tipo de exposição fazem diferença.', style: TextStyle(color: Color(0xFF176342), height: 1.4, fontWeight: FontWeight.w600)),
        ),
        const SizedBox(height: 22),
        SizedBox(height: 52, child: FilledButton(
          style: FilledButton.styleFrom(backgroundColor: pink, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
          onPressed: () => Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_) => const HomeScreen()), (route) => false),
          child: const Text('JOGAR NOVAMENTE', style: TextStyle(fontWeight: FontWeight.w900)),
        )),
      ]),
    );
  }
}
