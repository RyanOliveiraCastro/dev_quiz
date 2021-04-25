import 'dart:convert';

import 'package:devquiz/shared/models/question_model.dart';

enum Level { facil, medio, dificil, perito }

extension LevelStringExt on String {
  Level get parse => {
    "facil": Level.facil,
    "medio": Level.medio,
    "dificil": Level.dificil,
    "perito": Level.perito
  }[this]!;
}

extension LevelExt on Level {
  String get parse => {
    Level.facil: "facil",
    Level.medio: "medio",
    Level.dificil: "dificil",
    Level.perito: "perito"
  }[this]!;
}

class QuizModel {
  final String title;
  final List<QuestionModel> questions;
  final int questionAnswered;
  final String imagem;
  final Level level;

  QuizModel({
    required this.title,
    required this.questions,
    this.questionAnswered = 0,
    required this.imagem,
    required this.level,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'imagem': imagem,
      'level': level.parse,
      'questionAnswered': questionAnswered,
      'questions': questions.map((x) => x.toMap()).toList(),
    };
  }

  factory QuizModel.fromMap(Map<String, dynamic> map) {
    return QuizModel(
      title: map['title'],
      imagem: map['imagem'],
      level: map['level'].toString().parse,
      questionAnswered: map['questionAnswered'],
      questions: List<QuestionModel>.from(
          map['questions']?.map((x) => QuestionModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory QuizModel.fromJson(String source) =>
      QuizModel.fromMap(json.decode(source));
}