class UserProfile {
  final int id;
  final String firstName;
  final String lastName;
  final String maidenName;
  final int age;
  final String gender;
  final String email;
  final String phone;
  final String username;
  final String birthDate;
  final String image;
  final String eyeColor;
  final UserProfileAddress address;

  UserProfile({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.maidenName,
    required this.age,
    required this.gender,
    required this.email,
    required this.phone,
    required this.username,
    required this.birthDate,
    required this.image,
    required this.eyeColor,
    required this.address,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      maidenName: json['maidenName'],
      age: json['age'],
      gender: json['gender'],
      email: json['email'],
      phone: json['phone'],
      username: json['username'],
      birthDate: json['birthDate'],
      image: json['image'],
      eyeColor: json['eyeColor'],
      address: UserProfileAddress.fromJson(json['address']),
    );
  }
}

class UserProfileAddress {
  final String address;
  final String city;
  final String state;
  final String stateCode;
  final String postalCode;
  final UserProfileCoordinates coordinates;
  final String country;

  UserProfileAddress({
    required this.address,
    required this.city,
    required this.state,
    required this.stateCode,
    required this.postalCode,
    required this.coordinates,
    required this.country,
  });

  factory UserProfileAddress.fromJson(Map<String, dynamic> json) {
    return UserProfileAddress(
      address: json['address'],
      city: json['city'],
      state: json['state'],
      stateCode: json['stateCode'],
      postalCode: json['postalCode'],
      coordinates: UserProfileCoordinates.fromJson(json['coordinates']),
      country: json['country'],
    );
  }
}

class UserProfileCoordinates {
  final double lat;
  final double lng;

  UserProfileCoordinates({required this.lat, required this.lng});

  factory UserProfileCoordinates.fromJson(Map<String, dynamic> json) {
    return UserProfileCoordinates(
      lat: json['lat'].toDouble(),
      lng: json['lng'].toDouble(),
    );
  }
}
