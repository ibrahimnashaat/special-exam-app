

import '../model/question_model.dart';

List<QuestionModel> questions = [
  QuestionModel(
    "الى ماذا يرمز هذا العدد : 1",
    {
      "اثنان": false,
      "اربعة": false,
      "سبعه": false,
      "واحد": true,
    },
  ),
  QuestionModel("الى ماذا يرمز هذا العدد : 6", {
    "خمسة": false,
    "ثلاثة": false,
    "ستة": true,
    "عشرة": false,
  }),
  QuestionModel("الى ماذا يرمز هذا العدد : 13", {
    "ثلاثة عشر": true,
    "خمسة": false,
    "عشرون": false,
    "ثمانية": false,
  }),
  QuestionModel("الى ماذا يرمز هذا العدد : 22", {
    "اثنان وعشرون": true,
    "ثلاثة": false,
    "سبعه وثلاثون": false,
    "اربعه": false,
  }),
  QuestionModel("الى ماذا يرمز هذا العدد : 15", {
    "خمسة عشر":true ,
    "واحد": false,
    "ستة عشر": false,
    "عشرون":false ,
  }),

];
