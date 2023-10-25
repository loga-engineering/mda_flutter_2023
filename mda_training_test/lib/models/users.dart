import "package:uuid/uuid.dart";

class User {
  String id;
  String email;
  String fullName;
  String phone;
  String address;
  String photoUrl;

  User({
    required this.id,
    required this.email,
    required this.fullName,
    required this.phone,
    required this.address,
    required this.photoUrl
  });
}

final currentUser = User(
  id: Uuid().v4(),
  email: 'amadou.konate@gmail.com',
  fullName: 'Amadou Konate',
  phone: '+223 00 20 00 20',
  address: 'Bamako ACI 2000',
  photoUrl: 'user-image.jpeg',
);