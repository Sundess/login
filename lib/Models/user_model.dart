class User {
  final String id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? address;
  final String countryCode;
  final String? phone;
  final String? image;
  final String? imageBlurHash;
  final String? dob;
  final String role;

  User(
      {required this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.address,
      required this.countryCode,
      this.phone,
      this.image,
      this.imageBlurHash,
      this.dob,
      required this.role});

  static User anonymous = User(
    id: '',
    firstName: 'anonymous',
    lastName: 'user',
    email: '',
    address: '',
    countryCode: '',
    phone: '',
    image: '',
    imageBlurHash: '',
    dob: '',
    role: '',
  );

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      firstName: json['f_name'],
      lastName: json['l_name'],
      email: json['email'],
      address: json['address'],
      countryCode: json['country_code'],
      phone: json['phone'],
      image: json['image'],
      imageBlurHash: json['image_blurhash'],
      dob: json['dob'],
      role: json['role'],
    );
  }
}
