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
    traits: {'É um alimento?': true, 'É uma fruta?': true, 'É amarelo?': true, 'É encontrado em feiras?': true},
    nuclearTitle: 'Radioatividade natural',
    nuclearText: 'Sim! A banana contém potássio. Uma pequena fração desse elemento é o isótopo potássio-40, que é radioativo.',
    learning: 'A radioatividade natural está presente no ambiente e em alimentos. A quantidade encontrada em uma banana é muito pequena e não representa risco relevante no consumo habitual.',
    relation: 'yes',
  ),
  GameItem(
    name: 'Castanha-do-pará', category: 'Alimento', emoji: '🌰',
    traits: {'É um alimento?': true, 'É uma fruta?': false, 'É amarelo?': false, 'É encontrado em feiras?': true},
    nuclearTitle: 'Elementos radioativos naturais',
    nuclearText: 'Sim! A castanha-do-pará pode conter radionuclídeos naturais, como o rádio, absorvidos do solo pelas raízes.',
    learning: 'É um exemplo de como elementos radioativos naturais estão presentes no ambiente. A presença natural não significa automaticamente perigo.',
    relation: 'yes',
  ),
  GameItem(
    name: 'Maçã', category: 'Alimento', emoji: '🍎',
    traits: {'É um alimento?': true, 'É uma fruta?': true, 'É amarelo?': false, 'É encontrado em feiras?': true},
    nuclearTitle: 'Potássio natural',
    nuclearText: 'A maçã contém potássio, como muitos alimentos. O potássio natural inclui uma pequena parcela do isótopo radioativo potássio-40.',
    learning: 'A quantidade é muito baixa. O ponto educativo é entender que existe radioatividade natural em diversos elementos do cotidiano.',
    relation: 'yes',
  ),
  GameItem(
    name: 'Celular', category: 'Objeto', emoji: '📱',
    traits: {'É um alimento?': false, 'É usado no dia a dia?': true, 'Funciona com bateria?': true, 'É eletrônico?': true},
    nuclearTitle: 'Radiação não ionizante',
    nuclearText: 'O celular transmite e recebe ondas de radiofrequência, que são uma forma de radiação não ionizante. Ele não é radioativo por si só.',
    learning: 'Nem toda radiação é igual. Radiofrequência não é a mesma coisa que radiação ionizante emitida por raios X ou por materiais radioativos.',
    relation: 'no',
  ),
  GameItem(
    name: 'Aparelho de raio-X', category: 'Objeto', emoji: '🩻',
    traits: {'É um alimento?': false, 'É usado no dia a dia?': false, 'É usado na medicina?': true, 'É eletrônico?': true},
    nuclearTitle: 'Radiação ionizante na medicina',
    nuclearText: 'Sim! O aparelho produz raios X quando está em funcionamento, permitindo visualizar estruturas internas do corpo.',
    learning: 'O aparelho convencional não precisa conter material radioativo para produzir raios X: a radiação é gerada durante o funcionamento.',
    relation: 'yes',
  ),
  GameItem(
    name: 'Detector de fumaça', category: 'Objeto', emoji: '🚨',
    traits: {'É um alimento?': false, 'É usado no dia a dia?': true, 'Funciona com bateria?': true, 'É eletrônico?': true},
    nuclearTitle: 'Depende do modelo',
    nuclearText: 'Alguns detectores de fumaça por ionização utilizam uma pequena quantidade de amerício-241, um material radioativo. Modelos fotoelétricos funcionam de outra maneira.',
    learning: 'É importante identificar o tipo de detector. Não se deve abrir ou desmontar o equipamento; siga as orientações do fabricante.',
    relation: 'conditional',
  ),
  GameItem(
    name: 'Relógio antigo luminoso', category: 'Objeto', emoji: '⌚',
    traits: {'É um alimento?': false, 'É usado no dia a dia?': true, 'Funciona com bateria?': false, 'É eletrônico?': false},
    nuclearTitle: 'Depende da época e do material',
    nuclearText: 'Alguns relógios antigos usavam materiais luminosos com substâncias radioativas, como o rádio. Muitos relógios atuais usam tecnologias diferentes.',
    learning: 'A idade e a composição do objeto importam. Não tente abrir ou raspar tintas luminosas antigas.',
    relation: 'conditional',
  ),
  GameItem(
    name: 'Batata', category: 'Alimento', emoji: '🥔',
    traits: {'É um alimento?': true, 'É uma fruta?': false, 'É amarelo?': false, 'É encontrado em feiras?': true},
    nuclearTitle: 'Potássio-40 na natureza',
    nuclearText: 'A batata contém potássio, e uma pequena parcela do potássio natural é o isótopo radioativo potássio-40.',
    learning: 'A radioatividade natural ocorre em muitos alimentos. Isso não significa que eles sejam perigosos no consumo normal.',
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

class GameSession extends ChangeNotifier {
  String category = 'Todos';
  final Map<String, bool?> answers = {};
  int questionIndex = 0;
  GameItem? guessedItem;
  GameItem? confirmedItem;
  bool guessConfirmed = false;

  final List<String> questions = const [
    'É um alimento?',
    'É uma fruta?',
    'É amarelo?',
    'É usado no dia a dia?',
    'É usado na medicina?',
    'Funciona com bateria?',
    'É eletrônico?',
    'É encontrado em feiras?',
  ];

  List<GameItem> get candidates {
    return items.where((item) {
      if (category != 'Todos' && item.category != category) return false;
      for (final entry in answers.entries) {
        if (entry.value == null) continue;
        final trait = item.traits[entry.key];
        if (trait != null && trait != entry.value) return false;
      }
      return true;
    }).toList();
  }

  void reset(String selectedCategory) {
    category = selectedCategory;
    answers.clear();
    questionIndex = 0;
    guessedItem = null;
    confirmedItem = null;
    guessConfirmed = false;
  }

  void answer(bool? value) {
    final q = questions[questionIndex];
    answers[q] = value;
    questionIndex++;
  }

  GameItem chooseGuess() {
    final pool = candidates.isNotEmpty ? candidates : items.where((e) => category == 'Todos' || e.category == category).toList();
    guessedItem = pool.first;
    return guessedItem!;
  }

  void confirmGuess() {
    confirmedItem = guessedItem;
    guessConfirmed = true;
  }

  void correctGuess(GameItem item) {
    confirmedItem = item;
    guessConfirmed = false;
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
  final GameSession game = GameSession();
  @override
  void initState() { super.initState(); game.reset(widget.category); }
  @override
  Widget build(BuildContext context) {
    final qIndex = game.questionIndex;
    final question = game.questions[qIndex];
    return Scaffold(
      appBar: AppBar(title: const Text('Vamos descobrir')),
      body: Padding(
        padding: const EdgeInsets.all(22),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            const Text('PERGUNTA', style: TextStyle(color: pink, fontWeight: FontWeight.w900, letterSpacing: 1)),
            Text('${qIndex + 1} de ${game.questions.length}', style: const TextStyle(color: muted, fontWeight: FontWeight.w700)),
          ]),
          const SizedBox(height: 12),
          ClipRRect(borderRadius: BorderRadius.circular(20), child: LinearProgressIndicator(value: (qIndex + 1) / game.questions.length, minHeight: 8, color: pink, backgroundColor: Colors.black12)),
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
    if (game.questionIndex >= game.questions.length) {
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

