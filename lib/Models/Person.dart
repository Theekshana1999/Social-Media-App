class Person {
  final String name;
  final String gender;
  final int age;
  final String district;
  final String maritalStatus;
  final int likes;
  final String imageAsset; // e.g., 'assets/images/Chathuri.png'
  final String timeAgo;    // e.g., '5 min ago'

  const Person({
    required this.name,
    required this.gender,
    required this.age,
    required this.district,
    required this.maritalStatus,
    required this.likes,
    required this.imageAsset,
    required this.timeAgo,
  });
}
