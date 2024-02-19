class User {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String address;

  User(
      {required this.id,
      required this.name,
      required this.email,
      required this.phone,
      required this.address});
}

User dummyUser = User(
    id: '1',
    name: 'Shon Morfi',
    email: 'shon@gmail.com',
    phone: '0591234567',
    address: 'Palestine Ramallah');
