class UserModel {
   String? name;
   String? email;
   String? phone;
   String? image;
   String? bio;
   String? cover;
   String? uId;
   bool? isEmailVerified;


  UserModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.uId,
    required this.image,
    required this.cover,
    required this.bio,
    required this.isEmailVerified,

  });

  UserModel.fromJson(Map<String ,dynamic > json){

    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    uId = json['uId'];
    image = json['image'];
    bio = json['bio'];
    cover = json['cover'];
    isEmailVerified = json['isEmailVerified'];

  }

  Map<String, dynamic>  toMap (){

    return {
      'name' : name,
      'email' : email,
      'phone' : phone,
      'uId' : uId,
      'image':image,
      'bio':bio,
      'cover':cover,
      'isEmailVerified':isEmailVerified,
    };

  }
}
