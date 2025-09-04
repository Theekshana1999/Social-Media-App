import 'package:flutter/material.dart';
import '../models/person.dart';

class PersonDetailPager extends StatefulWidget {
  final List<Person> persons;
  final int initialIndex;

  const PersonDetailPager({
    super.key,
    required this.persons,
    required this.initialIndex,
  });

  @override
  State<PersonDetailPager> createState() => _PersonDetailPagerState();
}

class _PersonDetailPagerState extends State<PersonDetailPager> {
  late PageController _controller;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    _controller = PageController(initialPage: widget.initialIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.persons[_currentIndex].name)),
      body: PageView.builder(
        controller: _controller,
        itemCount: widget.persons.length,
        onPageChanged: (index) {
          setState(() => _currentIndex = index);
        },
        itemBuilder: (context, index) {
          final person = widget.persons[index];

          return SingleChildScrollView(
            child: Center(
              child: Container(
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,

                  children: [
                    // Text(
                    //   "${person.name}",
                    //   style:
                    //       TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    // ),
                    // const SizedBox(height: 12),

                    /// Profile image + arrows
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          person.imageAsset,
                          width: double.infinity,
                          height: 320,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    /// Details list
                    _buildDetail(Icons.person, "Name", person.name),
                    _buildDetail(Icons.female, "Gender", person.gender),
                    _buildDetail(Icons.cake, "Age", "${person.age} years old"),
                    _buildDetail(Icons.home, "District", person.district),
                    _buildDetail(Icons.location_on, "Current living", "Japan"),
                    _buildDetail(
                      Icons.favorite,
                      "Marriage Status",
                      person.maritalStatus,
                    ),
                    _buildDetail(Icons.school, "Education", "Diploma"),
                    _buildDetail(Icons.work, "Job Status", "Doctor"),
                    _buildDetail(
                      Icons.attach_money,
                      "Monthly Income",
                      "One Lakh per month",
                    ),
                    _buildDetail(Icons.height, "Height", "176 cm"),
                    _buildDetail(Icons.monitor_weight, "Weight", "57 kg"),
                    _buildDetail(
                      Icons.info,
                      "Other Details",
                      "I want honest, caring, loving partner, who can understand me. I like to travel, watch movies, reading books and cooking. ",
                    ),
                    const Divider(),

                    /// Bottom actions
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.chat, color: Colors.grey),
                            const SizedBox(width: 4),
                            Text("Message"),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(Icons.favorite, color: Colors.red),
                            const SizedBox(width: 4),
                            Text("${person.likes} Likes"),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(Icons.access_time, color: Colors.grey),
                            const SizedBox(width: 4),
                            Text(person.timeAgo),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildDetail(IconData icon, String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Colors.black54),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              "$title : $value",
              style: const TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
