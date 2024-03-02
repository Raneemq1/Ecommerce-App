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
      required this.address,
     
      }
      
      );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'address': address,
     
    };
  }

  factory User.fromMap(Map<String, dynamic> map, String id) {
    return User(
        id: id,
        name: map['name'] ?? '',
        email: map['email'] ?? '',
        phone: map['phone'] ?? '',
        address: map['address'] ?? '');
  }
}

User dummyUser = User(
    id: '1',
    name: 'Shon Morfi',
    email: 'shon@gmail.com',
    phone: '0591234567',
    address: 'Palestine Ramallah');
