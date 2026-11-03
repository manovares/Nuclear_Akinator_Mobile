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

