class User {
  final String imagePath;
  final String email;
  final String surname;
  final String about;

  String name;

  User({
    required this.imagePath,
    required this.email,
    required this.name,
    required this.surname,
    required this.about,
  });

  Map<String, dynamic> toJson() => {
        //per convertire oggetto utente a json per salvarlo in sharedpreferences
        'imagePath': imagePath,
        'email': email,
        'surname': surname,
        'about': about,
        'name': name
      };

  User copy({
    String? imagePath,
    String? email,
    String? surname,
    String? about,
    String? name,
  }) =>
      User(
          imagePath: imagePath ??
              this.imagePath, //?? significa che se è null uso valore esistente
          email: email ?? this.email,
          name: name ?? this.name,
          surname: surname ?? this.surname,
          about: about ?? this.about);

  static User fromJson(Map<String, dynamic> user) => User(
      about: user['about'],
      email: user['email'],
      imagePath: user['imagePath'],
      name: user['name'],
      surname: user['surname']);
}
