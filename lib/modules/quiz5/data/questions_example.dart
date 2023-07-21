

import '../model/question_model.dart';

List<QuestionModel> questions = [
  QuestionModel(
    "4 + 3",
    {
      "6": false,
      "8": false,
      "2": false,
      "7": true,
    },
  ),
  QuestionModel("10 - 7", {
    "2": false,
    "4": false,
    "3": true,
    "17": false,
  }),
  QuestionModel("9 / 3 ", {
    "3": true,
    "12": false,
    "6": false,
    "1": false,
  }),
  QuestionModel("3 + 7", {
    "10": true,
    "12": false,
    "4": false,
    "2": false,
  }),
  QuestionModel("15 - 2", {
    "13":true ,
    "11": false,
    "12": false,
    "10":false ,
  }),

];
