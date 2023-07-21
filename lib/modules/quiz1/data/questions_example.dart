

import '../model/question_model.dart';

List<QuestionModel> questions = [
  QuestionModel(
    " أختر الجملة التي تبدأ بحرف الالف",
    {
      "بطه": false,
      "قطه": false,
      "حطب": false,
      "أسد": true,
    },
  ),
  QuestionModel("أختر الجملة التي تبدأ بحرف العين", {
    "كلب": false,
    "قطه": false,
    "عين": true,
    "كل ما سبق": false,
  }),
  QuestionModel("أختر الجملة التي تبدأ بحرف الحاء", {
    "حروف": true,
    "جمل": false,
    "خروف": false,
    "لا توجد كلمات": false,
  }),
  QuestionModel("أختر الجملة التي تبدأ بحرف الواو", {
    "ولد": true,
    "سيارة": false,
    "طائرة": false,
    "لا توجد كلمات": false,
  }),
  QuestionModel("أختر الجملة التي تبدأ بحرف الياء", {
    "مسمار": false,
    "منضاد": false,
    "قلم": false,
    "يخت": true,
  }),

];
