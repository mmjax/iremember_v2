class Users {
  final String name;
  final String? photo;
  final int id;

  Users(this.name, this.id, this.photo);

  Users.fromJson(Map<String, dynamic> json)
    : id = json['id'],
      photo = json['photo'],
      name = json['name'];
}

class Memory {
  final int id;
  final String title;
  final String description;
  final String? photo;
  final String date;

  Memory(
    this.date,
    this.description,
    this.id,
    this.photo,
    this.title,
  );

  Memory.fromJson(Map<String, dynamic> json)
    : id = json['id'],
      description = json['description'],
      date = json['date'],
      photo = json['photo'],
      title = json['title'];
}