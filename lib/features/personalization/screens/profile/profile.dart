import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ui_project_hochiminh_museum/common/widgets/appbar/appbar.dart';
import 'package:ui_project_hochiminh_museum/common/widgets/images/t_circular_image.dart';
import 'package:ui_project_hochiminh_museum/common/widgets/texts/section_heading.dart';
import 'package:ui_project_hochiminh_museum/utils/constants/image_strings.dart';
import 'package:ui_project_hochiminh_museum/utils/constants/sizes.dart';

import 'widgets/profile_menu.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        title: Text('Profiles'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              //Profile picture
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    const TCircularImage(
                      image: TImages.user,
                      width: 80,
                      height: 80,
                      padding: 0,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text('Change Profile Picture'),
                    ),
                  ],
                ),
              ),

              //Details
              const SizedBox(height: TSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),
              const TSectionHeading(
                title: 'Profile Infomation',
                showActionButton: false,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),

              TProfileMenu(
                onPressed: () {},
                title: 'Name',
                value: 'Tran Duy Khanh',
              ),
              TProfileMenu(
                onPressed: () {},
                title: 'Username',
                value: 'duykhanhxx03',
              ),

              const SizedBox(height: TSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),
              const TSectionHeading(
                title: 'Personal Infomation',
                showActionButton: false,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              TProfileMenu(
                onPressed: () {},
                title: 'User ID',
                value: '29052003',
                icon: Iconsax.copy,
              ),
              TProfileMenu(
                onPressed: () {},
                title: 'Email',
                value: 'duykhanhxx03.work@gmail.com',
              ),
              TProfileMenu(
                onPressed: () {},
                title: 'Phone number',
                value: '0912345678',
              ),
              TProfileMenu(
                onPressed: () {},
                title: 'Gender',
                value: 'Male',
              ),
              TProfileMenu(
                onPressed: () {},
                title: 'Date of birth',
                value: '29 May, 2003',
              ),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),

              Center(
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Close account',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
