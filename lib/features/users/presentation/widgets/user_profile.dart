import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:silktech_users/config/themes/styles.dart';
import 'package:silktech_users/features/users/domain/entities/user.dart';
import 'package:url_launcher/url_launcher.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({
    super.key,
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: CircleAvatar(
              radius: 64,
              child: ClipOval(
                child: CachedNetworkImage(
                  imageUrl: user.picture,
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  placeholder: (context, url) => Image.asset(
                    'assets/images/user.png',
                    fit: BoxFit.contain,
                    alignment: Alignment.topCenter,
                  ),
                  errorWidget: (context, error, stackTrace) => Image.asset(
                    'assets/images/user.png',
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Text(
            user.fullName,
            style: AppStyles.headline,
          ),
          const SizedBox(
            height: 6,
          ),
          GestureDetector(
            onTap: () {
              final Uri emailLaunchUri = Uri(
                scheme: 'mailto',
                path: user.email,
              );

              launchUrl(emailLaunchUri);
            },
            child: SizedBox(
              height: 30,
              child: Text(
                user.email,
                style: AppStyles.caption2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
