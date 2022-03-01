class Blog {
  final String content;
  final String id;
  final String title;

  const Blog({
    required this.content,
    required this.id,
    required this.title,
  });

  factory Blog.fromJson(Map<String, dynamic> json) {
    return Blog(
      content: json['content'],
      id: json['id'],
      title: json['title'],
    );
  }
}
