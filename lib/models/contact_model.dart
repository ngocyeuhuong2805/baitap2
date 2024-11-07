class ContactModel {
  final dynamic id;
  final String? name;
  final String image;
  final String numberPhone;
  final String address;
  ContactModel({
    required this.id,
     this.name,
    required this.image,
    required this.numberPhone,
    required this.address,
});
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'numberPhone': numberPhone,
      'address': address,
    };
  }

  factory ContactModel.fromJson(Map<String, dynamic> json) {
    return ContactModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      numberPhone: json['numberPhone'],
      address: json['address'],
    );
  }
}