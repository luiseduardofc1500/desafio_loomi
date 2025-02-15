import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommentsList extends StatelessWidget {
  final List<Map<String, String>> comments = const [
    {
      'author': 'Eva Mendes',
      'date': '2 weeks ago',
      'text': 'Hey, I was wondering did you guys see that smile?'
    },
    {
      'author': 'Jon Sudano',
      'date': '3 weeks ago',
      'text': 'The storyline is poignant and captivating...'
    },
  ];

  const CommentsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const backgroundColor = Color.fromRGBO(19, 20, 24, 1);

    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.5,
        height: MediaQuery.of(context).size.height,
        color: backgroundColor,
        child: Column(
          children: [
            Container(
              height: kToolbarHeight,
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              color: backgroundColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${comments.length} Comments',
                    style: const TextStyle(fontSize: 12, color: Colors.white),
                  ),
                  IconButton(
                    icon:
                        const Icon(Icons.close, size: 20, color: Colors.white),
                    onPressed: () => Get.back(),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: comments.map((comment) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${comment['author']} • ${comment['date']}',
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            comment['text']!,
                            style: const TextStyle(
                                fontSize: 10, color: Colors.white),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
