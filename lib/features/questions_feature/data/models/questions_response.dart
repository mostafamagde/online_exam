import 'package:json_annotation/json_annotation.dart';

part 'questions_response.g.dart';

@JsonSerializable()
class Questions {
  final String answer;

  final String key;

  Questions({required this.answer, required this.key});

  factory Questions.fromJson(Map<String, dynamic> json) =>
      _$QuestionsFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionsToJson(this);
}

@JsonSerializable()
class Subject {
  @JsonKey(name: '_id')
  final String id;
  final String name;
  final String icon;
  final String createdAt;

  Subject({
    required this.id,
    required this.name,
    required this.icon,
    required this.createdAt,
  });

  factory Subject.fromJson(Map<String, dynamic> json) =>
      _$SubjectFromJson(json);

  Map<String, dynamic> toJson() => _$SubjectToJson(this);
}

@JsonSerializable()
class Exam {
  @JsonKey(name: '_id')
  final String id;
  final String title;
  final int duration;
  final String subject;
  final int numberOfQuestions;
  final bool active;
  final DateTime createdAt;

  Exam({
    required this.id,
    required this.title,
    required this.duration,
    required this.subject,
    required this.numberOfQuestions,
    required this.active,
    required this.createdAt,
  });

  factory Exam.fromJson(Map<String, dynamic> json) => _$ExamFromJson(json);

  Map<String, dynamic> toJson() => _$ExamToJson(this);
}

@JsonSerializable()
class Data {
  final List<Questions> answers;
  final String type;
  @JsonKey(name: '_id')
  final String id;
  final String question;
  final String correct;
  final Subject subject;
  final Exam exam;
  final DateTime createdAt;

  Data({
    required this.answers,
    required this.type,
    required this.id,
    required this.question,
    required this.correct,
    required this.subject,
    required this.exam,
    required this.createdAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class QuestionsResponse {
  List<Data> questions;

  QuestionsResponse({required this.questions});

  factory QuestionsResponse.fromJson(Map<String, dynamic> json) =>
      _$QuestionsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionsResponseToJson(this);
}

/*
*   {
            "answers": [
                {
                    "answer": "Hyperlinks and Text Markup Language",
                    "key": "A1"
                },
                {
                    "answer": "Hyper Text Markup Language",
                    "key": "A2"
                },
                {
                    "answer": "Home Tool Markup Language",
                    "key": "A3"
                }
            ],
            "type": "single_choice",
            "_id": "670082800a5849a4aee16294",
            "question": "What does HTML stand for?",
            "correct": "A2",
            "subject": {
                "_id": "670037f6728c92b7fdf434fc",
                "name": "HTML",
                "icon": "https://exam.elevateegy.com/uploads/categories/6751d734cc3deba60dd5bc80-item_1.png",
                "createdAt": "2024-10-04T18:46:14.281Z"
            },
            "exam": {
                "_id": "670070a830a3c3c1944a9c63",
                "title": "HTML Quiz",
                "duration": 25,
                "subject": "670037f6728c92b7fdf434fc",
                "numberOfQuestions": 40,
                "active": true,
                "createdAt": "2024-10-04T22:48:08.842Z"
            },
            "createdAt": "2024-10-05T00:04:16.070Z"
        },*/
