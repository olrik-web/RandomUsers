class User {
  final String name, email, picture, city, country, phone;

  User(
      {this.name,
      this.email,
      this.picture,
      this.city,
      this.country,
      this.phone});

  factory User.fromJson(Map<String, dynamic> jsonData) {
    var name =
        '${jsonData['name']['title']} ${jsonData['name']['first']} ${jsonData['name']['last']}';
    var email = jsonData['email'];
    var picture = jsonData['picture']['large'];
    var city = jsonData['location']['city'];
    var country = jsonData['location']['country'];
    var phone = jsonData['phone'];

    return User(
      name: name,
      email: email,
      picture: picture,
      city: city,
      country: country,
      phone: phone,
    );
  }
}
