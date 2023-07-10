class Class4 {
  final int id;
  final int userId;
  final String title;
  final String Completed;

  Class4({
    required this.id,
    required this.userId,
    required this.title,
    required this.Completed,
  });

  factory Class4.fromJson(Map<String, dynamic> json) {
    return Class4(
        id: json['id'],
        userId: json['userId'],
        title: json['title'],
        Completed: json['completed']);
  }
}
