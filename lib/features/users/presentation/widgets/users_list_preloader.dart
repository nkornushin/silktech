import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:silktech_users/config/themes/colors.dart';

class UsersListPreloader extends StatelessWidget {
  const UsersListPreloader({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 10,
        itemBuilder: (context, index) => const SizedBox(
          height: 100,
          child: Card(
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}
