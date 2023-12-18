import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';
import 'package:silktech_users/config/themes/colors.dart';
import 'package:silktech_users/config/themes/styles.dart';
import 'package:silktech_users/features/users/domain/entities/user.dart';

class UsersListItem extends StatelessWidget {
  const UsersListItem({
    super.key,
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Routemaster.of(context).push('/profile/${user.id}'),
      child: Card(
        color: AppColors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            leading: SizedBox(
              width: 64,
              height: 64,
              child: CachedNetworkImage(
                imageUrl: user.picture,
                imageBuilder: (context, imageProvider) => Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(
                        16,
                      ),
                    ),
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
            title: Text(
              user.fullName,
              style: AppStyles.caption1,
            ),
            subtitle: Row(
              children: [
                const Icon(
                  Icons.email,
                  color: AppColors.gray,
                  size: 20,
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Text(
                    user.email,
                    style: AppStyles.caption2,
                  ),
                ),
              ],
            ),
            trailing: const Icon(
              Icons.arrow_right_outlined,
              color: AppColors.lightPrimary,
            ),
          ),
        ),
      ),
    );
  }
}
