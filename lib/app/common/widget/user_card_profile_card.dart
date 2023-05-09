import 'package:cabeleleila/app/common/constants/app_colors.dart';
import 'package:cabeleleila/app/common/constants/app_text_styles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  const UserCard({Key? key, required this.user}) : super(key: key);
  String _capitalize(String s) =>
      s.isNotEmpty ? '${s[0].toUpperCase()}${s.substring(1)}' : '';
  final User user;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            user.photoURL != null
                ? CircleAvatar(
                    backgroundImage: NetworkImage(user.photoURL!),
                    radius: 50,
                  )
                : const Material(
                    color: AppColors.lighGrey,
                    shape: CircleBorder(),
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Icon(
                        Icons.person,
                        size: 60,
                        color: AppColors.grey,
                      ),
                    ),
                  ),
            const SizedBox(height: 16.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                user.displayName != null
                    ? Text(
                        "Nome: ${_capitalize(user.displayName!)}",
                        style: AppTextStyles.mediumText20.apply(
                          color: AppColors.darkGrey,
                        ),
                      )
                    : const Text(""),
                const SizedBox(height: 8.0),
                user.email != null
                    ? Text(
                        "E-mail: ${user.email}",
                        style: AppTextStyles.mediumText18.apply(
                          color: AppColors.grey,
                        ),
                      )
                    : const Text(""),
                if (user.phoneNumber != null) const SizedBox(height: 8.0),
                if (user.phoneNumber != null) Text(user.phoneNumber!),
                const SizedBox(height: 8.0),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
