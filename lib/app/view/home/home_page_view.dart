import 'package:cabeleleila/app/common/constants/app_colors.dart';
import 'package:cabeleleila/app/common/widget/custom_bottom_app_bar.dart';
import 'package:cabeleleila/app/locator.dart';
import 'package:cabeleleila/app/view/home/appbuttonbar_pages/bookmarks/bookmarks_page.dart';
import 'package:cabeleleila/app/view/home/appbuttonbar_pages/profile/profile_page.dart';
import 'package:cabeleleila/app/view/home/appbuttonbar_pages/schedule/schedule_page.dart';
import 'package:cabeleleila/app/view/home/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:developer';

import 'appbuttonbar_pages/schedule/schedule_controller.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  final pageController = PageController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _controller = locator.get<ScheduleController>();

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      log(pageController.page.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: const [
          HomePage(),
          SchedulePage(),
          BookmarksPage(),
          ProfilePage(),
        ],
      ),
      bottomNavigationBar: CustomBottomAppBar(
        selectedItemColor: AppColors.pinkOne,
        children: [
          CustomBottomAppBarItem(
            label: 'home',
            primaryIcon: Icons.home,
            secondaryIcon: Icons.home_outlined,
            onPressed: () {
              pageController.jumpToPage(0);
              _controller.getClouds(id: _auth.currentUser!.uid);
            },
          ),
          CustomBottomAppBarItem(
            label: 'draw',
            primaryIcon: Icons.list_alt,
            secondaryIcon: Icons.list_alt_outlined,
            onPressed: () {
              pageController.jumpToPage(1);
              _controller.getClouds(id: _auth.currentUser!.uid);
            },
          ),
          CustomBottomAppBarItem(
            label: 'write',
            primaryIcon: Icons.draw,
            secondaryIcon: Icons.draw_outlined,
            onPressed: () {
              pageController.jumpToPage(2);
              _controller.getClouds(id: _auth.currentUser!.uid);
            },
          ),
          CustomBottomAppBarItem(
            label: 'profile',
            primaryIcon: Icons.person,
            secondaryIcon: Icons.person_outline,
            onPressed: () {
              pageController.jumpToPage(3);
              _controller.getClouds(id: _auth.currentUser!.uid);
            },
          ),
        ],
      ),
    );
  }
}
