import 'package:flutter/material.dart';
import 'package:ui_project_hochiminh_museum/common/models/news.dart';
import 'package:ui_project_hochiminh_museum/common/widgets/texts/news_full_title.dart';
import 'package:ui_project_hochiminh_museum/features/main/screens/news/widgets/news_home/innotice_news.dart';
import 'package:ui_project_hochiminh_museum/features/main/screens/news/widgets/news_home/notice_news.dart';

import 'package:ui_project_hochiminh_museum/utils/constants/colors.dart';
import 'package:ui_project_hochiminh_museum/utils/constants/image_strings.dart';
import 'package:ui_project_hochiminh_museum/utils/constants/sizes.dart';

class GroupNews extends StatelessWidget {
  const GroupNews({
    super.key,
  });

  // List<News> news;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: EdgeInsets.only(top: TSizes.defaultSpace),
        child: Text(
          "MUSUEM ACTIVITIES",
          style: TextStyle(
              color: TColors.primary,
              fontWeight: FontWeight.bold,
              fontSize: TSizes.fontSizeLg),
        ),
      ),
      SizedBox(
        height: TSizes.spaceBtwItems,
      ),
      ProminentNews(
        title: "Bảo tàng Hồ Chí Minh và bộ Tư Lệnh Cảnh vệ tổ quốc",
        isNotice: true,
        imageUrl: TImages.thumbnail1,
        date: "03/11/2023",
        view: 137,
        content:
            "​Ngày 21/10/2023, nhân chuyến thăm và làm việc tại tỉnh Cao Bằng, đoàn công tác Ban Tuyên giáo Trung ương long trọng tổ chức nghi lễ dâng hương, dâng hoa Chủ tịch Hồ Chí Minh tại Khu di tích Quốc gia đặc biệt Pác Bó (Hà Quảng, Cao Bằng).",
      ),
      ListView.builder(
          itemCount: 4,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (_, index) => InnoticeNews(
                imageUrl: TImages.thumbnail2,
                title:
                    "Đoàn Cơ sở Bảo tàng Hồ Chí Minh triển khai Chương trình “Đưa đoàn viên đến với các địa điểm văn hóa”",
              ))
    ]);
  }
}