import 'package:flutter/material.dart';
import '../models/person.dart';

class ProfileCard extends StatefulWidget {
  final Person person;
  final VoidCallback? onChatTap;
  final VoidCallback? onSeeMore;

  const ProfileCard({
    super.key,
    required this.person,
    this.onChatTap,
    this.onSeeMore,
  });

  @override
  State<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  late int likes;       // keep track of likes
  bool isLiked = false; // toggle state

  @override
  void initState() {
    super.initState();
    likes = widget.person.likes;
  }

  void toggleLike() {
    setState(() {
      if (isLiked) {
        likes--;
      } else {
        likes++;
      }
      isLiked = !isLiked;
    });
  }

  @override
  Widget build(BuildContext context) {
    final person = widget.person;

    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(15),
      ),
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          // Avatar / Photo
          SizedBox(
            height: 175,
            width: 175,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                person.imageAsset,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 10),

          // Details
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: DefaultTextStyle(
                style: Theme.of(context).textTheme.bodyMedium!,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _InfoRow(icon: Icons.person, label: "Name", value: person.name),
                    _InfoRow(icon: Icons.wc, label: "Gender", value: person.gender),
                    _InfoRow(icon: Icons.cake, label: "Age", value: "${person.age}"),
                    _InfoRow(icon: Icons.location_on, label: "District", value: person.district),
                    _InfoRow(icon: Icons.group, label: "Marital Status", value: person.maritalStatus),

                    const SizedBox(height: 10),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // Chat
                        InkWell(
                          onTap: widget.onChatTap,
                          borderRadius: BorderRadius.circular(8),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(Icons.chat),
                          ),
                        ),

                        const SizedBox(width: 6),

                        // Like + count
                        InkWell(
                          onTap: toggleLike,
                          borderRadius: BorderRadius.circular(8),
                          child: Row(
                            children: [
                              Icon(
                                isLiked ? Icons.favorite : Icons.favorite_border,
                                color: isLiked ? Colors.red : Colors.grey,
                              ),
                              const SizedBox(width: 4),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("$likes"),
                                  const Text(
                                    "Likes",
                                    style: TextStyle(fontSize: 10),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        const Spacer(),

                        // Time + See more
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(Icons.access_time, size: 12),
                                const SizedBox(width: 2),
                                Text(person.timeAgo, style: const TextStyle(fontSize: 10)),
                              ],
                            ),
                            const SizedBox(height: 4),
                            GestureDetector(
                              onTap: widget.onSeeMore,
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: const Text(
                                  "See more",
                                  style: TextStyle(fontSize: 10),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        children: [
          Icon(icon, size: 18),
          const SizedBox(width: 6),
          Text("$label : $value"),
        ],
      ),
    );
  }
}
