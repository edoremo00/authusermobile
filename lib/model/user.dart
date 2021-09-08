class User {
  final String imagePath;
  final String email;
  final String surname;
  final String about;
  final bool isDarkmode;
  final String name;

  const User(
      {required this.imagePath,
      required this.email,
      required this.name,
      required this.surname,
      required this.about,
      required this.isDarkmode});
}
