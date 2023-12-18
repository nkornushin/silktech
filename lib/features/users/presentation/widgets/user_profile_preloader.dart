import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class UserProfilePreloader extends StatelessWidget {
  const UserProfilePreloader({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 128,
                height: 128,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Container(
                height: 24,
                width: MediaQuery.of(context).size.width * .5,
                color: Colors.white,
              ),
              const SizedBox(
                height: 6,
              ),
              Container(
                height: 18,
                width: MediaQuery.of(context).size.width * .3,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
