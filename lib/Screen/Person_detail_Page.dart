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

  void _goToPrevious() {
    if (_currentIndex > 0) {
      _controller.previousPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut);
    }
  }

  void _goToNext() {
    if (_currentIndex < widget.persons.length - 1) {
      _controller.nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: PageView.builder(
        controller: _controller,
        itemCount: widget.persons.length,
        onPageChanged: (index) {
          setState(() => _currentIndex = index);
        },
        itemBuilder: (context, index) {
          final person = widget.persons[index];

          return Center(
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
                      offset: Offset(0, 4))
                ],
              ),
              child: Column(
                
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
            
                  Text(
                    "${person.name}",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
              
                  /// Profile image + arrows
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(                     
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (_currentIndex > 0)
                          IconButton(
                              icon: const Icon(Icons.arrow_left, size: 40),
                              onPressed: _goToPrevious)
                        else
                          const SizedBox(width: 40),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            person.imageAsset,
                            width: 200,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                        ),
                        if (_currentIndex < widget.persons.length - 1)
                          IconButton(
                              icon: const Icon(Icons.arrow_right, size: 40),
                              onPressed: _goToNext)
                        else
                          const SizedBox(width: 40),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
              
                  /// Details list
                  _buildDetail(Icons.person, "Name", person.name),
                  _buildDetail(Icons.female, "Gender", person.gender),
                  _buildDetail(Icons.cake, "Age", "${person.age} years old"),
                  _buildDetail(Icons.location_on, "District", person.district),
                  _buildDetail(Icons.favorite, "Marriage Status",
                      person.maritalStatus),
                  _buildDetail(Icons.school, "Education", "Diploma"),
                  _buildDetail(Icons.work, "Job Status", "Doctor"),
                  _buildDetail(Icons.attach_money, "Monthly Income",
                      "One Lakh per month"),
                  _buildDetail(Icons.height, "Height", "176 cm"),
                  _buildDetail(Icons.monitor_weight, "Weight", "57 kg"),
                  _buildDetail(Icons.info, "Other Details",
                      "I want honest, caring, loving partner"),
                  const Divider(),
              
                  /// Bottom actions
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: [
                        const Icon(Icons.favorite, color: Colors.red),
                        const SizedBox(width: 4),
                        Text("${person.likes} Likes"),
                      ]),
                      Row(children: [
                        const Icon(Icons.access_time, color: Colors.grey),
                        const SizedBox(width: 4),
                        Text(person.timeAgo),
                      ]),
                    ],
                  ),
                ],
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
