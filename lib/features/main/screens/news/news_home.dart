import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_project_hochiminh_museum/common/widgets/appbar/appbar.dart';
import 'package:ui_project_hochiminh_museum/common/widgets/loading/custom_loading.dart';
import 'package:ui_project_hochiminh_museum/features/main/screens/news/models/news_model.dart';
import 'package:ui_project_hochiminh_museum/features/main/screens/news/news_description.dart';
import 'package:ui_project_hochiminh_museum/features/main/screens/news/widgets/news_home/innotice_news.dart';
import 'package:ui_project_hochiminh_museum/repository/news_repository/news_repository.dart';
import 'package:ui_project_hochiminh_museum/utils/constants/category_subcategory.dart';
import 'package:ui_project_hochiminh_museum/utils/constants/sizes.dart';

// ignore: must_be_immutable
class NewsScreen extends StatelessWidget {
  NewsScreen({
    super.key,
    required this.category,
    required this.subCategory,
  });

  final controller = Get.put(NewsRepository());

  final String category;
  final String subCategory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text(
          TCategorySubCategoryConstanst.getSubNewsCategoryName(
            TCategorySubCategoryConstanst.getNewsCategoryName(category),
            subCategory,
          ),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: TSizes.defaultSpace,
            right: TSizes.defaultSpace,
            bottom: TSizes.defaultSpace,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              FutureBuilder(
                future: controller.getAllNews(category, subCategory),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      List<NewsModel> newsList =
                          snapshot.data as List<NewsModel>;
                      if (newsList.isNotEmpty) {
                        return ListView.builder(
                          itemCount: newsList.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (_, index) => InnoticeNews(
                            date: newsList[index].date,
                            isNetworkImage: true,
                            onPressed: () {
                              Get.to(
                                NewsDescriptionScreen(
                                    newsContent: newsList[index].newsContent),
                              );
                            },
                            thumbnailUrl: newsList[index].thumbnailUrl,
                            title: newsList[index].title,
                          ),
                        );
                      }
                    }
                  }
                  return const Center(child: CustomLoading());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
