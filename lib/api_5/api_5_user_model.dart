class Class5 {
  final int id;
  final int postId;
  final String name;
  final String email;
  final String body;

  Class5({
    required this.id,
    required this.postId,
    required this.name,
    required this.email,
    required this.body,
  });

  factory Class5.fromJson(Map<String, dynamic> json) {
    return Class5(id: json['id'], postId: json['postId'], name:json['name'], email: json['email'], body: json['body']);
  }
}
