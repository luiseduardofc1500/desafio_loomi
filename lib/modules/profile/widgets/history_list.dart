import 'package:cine_loomi/modules/profile/widgets/banner_widget.dart';
import 'package:flutter/material.dart';

class HistoryList extends StatelessWidget {
  const HistoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        spacing: 8,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'History',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            spacing: 18,
            children: [
              BannerWidget(
                imageUrl:
                    'https://people.com/thmb/XSbzFMxPwK4TjZwQalrxIkJRVbA=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc():focal(659x189:661x191)/Barbie-010323-bb98515881e24793ae33c7fd4f777f0b.jpg',
                texto: 'Barbie',
                year: '2023',
              ),
              BannerWidget(
                imageUrl: 'https://i.ytimg.com/vi/DXT75VBulRI/sddefault.jpg',
                texto: 'Everithing...',
                year: '2022',
              ),
            ],
          ),
        ]);
  }
}
