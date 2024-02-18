class User {
  final String id;
  final String name;
  final String email;
  final String address;

  User(
      {required this.id,
      required this.name,
      required this.email,
      required this.address});
}

User dummyUser = User(
    id: '1',
    name: 'Shon Morfi',
    email: 'shon@gmail.com',
    address: 'Palestine Ramallah');
