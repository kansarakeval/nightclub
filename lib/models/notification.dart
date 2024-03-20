class cNotification {
  final String title;
  final String content;

  cNotification({required this.title, required this.content});

  factory cNotification.fromJson(Map<String, dynamic> json) {
    return cNotification(
      title: json['n_title'],
      content: json['n_conten'],
    );
  }
}
