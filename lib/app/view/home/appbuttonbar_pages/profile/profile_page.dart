import 'package:cabeleleila/app/common/widget/appbar_custom.dart';
import 'package:cabeleleila/app/common/constants/routes.dart';
import 'package:cabeleleila/app/common/widget/eleveted_button_custon.dart';
import 'package:cabeleleila/app/common/widget/user_card_profile_card.dart';
import 'package:cabeleleila/app/services/secure_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with AutomaticKeepAliveClientMixin<ProfilePage> {
  SecureStorage secureStorage = const SecureStorage();
  final User user = FirebaseAuth.instance.currentUser!;

  @override
  bool get wantKeepAlive => true;

  Center _bodyProfileCustom(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          UserCard(user: user),
          CustomElevatedButton(
            onPressed: () {
              secureStorage.deleteOne(key: "CURRENT_USER").then(
                    (_) => Navigator.popAndPushNamed(
                      context,
                      NamedRoute.initial,
                    ),
                  );
            },
            text: 'Logout',
          ),
        ],
      ),
    );
  }

  AppBarCustom _appBarCustom() =>
      const AppBarCustom(title: 'Perfil do Usuário');

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: _appBarCustom(),
      body: _bodyProfileCustom(context),
    );
  }
}
