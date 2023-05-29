class Item {
  final int id;
  final String name;
  final String desc;
  final String photo;
  final String type;
  final String profile;
  final String category;
  final String last_seen;
  final String last_location;
  final String is_done;

  Item({
    required this.id,
    required this.name,
    required this.desc,
    required this.photo,
    required this.type,
    required this.profile,
    required this.category,
    required this.last_seen,
    required this.last_location,
    required this.is_done,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'],
      name: json['name'],
      desc: json['desc'],
      photo: json['photo'],
      type: json['type'],
      profile: json['profile'],
      category: json['category'],
      last_seen: json['last_seen'],
      last_location: json['last_location'],
      is_done: json['is_done'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'desc': desc,
      'photo': photo,
      'type': type,
      'profile': profile,
      'category': category,
      'last_seen': last_seen,
      'last_location': last_location,
      'is_done': is_done,
    };
  }
}
