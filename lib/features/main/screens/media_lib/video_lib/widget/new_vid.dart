import 'package:flutter/material.dart';
import 'package:ui_project_hochiminh_museum/features/main/screens/media_lib/video_lib/models/list_vid.dart';
import 'package:ui_project_hochiminh_museum/features/main/screens/media_lib/video_lib/widget/vid_detail_scr.dart';

class NewsVid extends StatelessWidget {
  final ListVideo videoData;

  const NewsVid({Key? key, required this.videoData}) : super(key: key);

  void _navigateToVideoDetail(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => VideoDetailScreen(video: videoData),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              _navigateToVideoDetail(context);
            },
            child: Container(
              width: 120,
              height: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                image: DecorationImage(
                  image: NetworkImage(
                    'https://img.youtube.com/vi/${videoData.vidURL.split("/").last}/hqdefault.jpg',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(width: 8.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  videoData.vidTitle,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  'Ngày đăng: ${videoData.dateSubmitted.day}/${videoData.dateSubmitted.month}/${videoData.dateSubmitted.year}',
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}