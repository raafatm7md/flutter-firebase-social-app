import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:social_app/views/app/social_cubit.dart';
import 'package:social_app/views/social_screens/new_post.dart';

class SocialLayout extends StatelessWidget {
  const SocialLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SocialCubit()..getUserData()..getPosts(),
      child: BlocConsumer<SocialCubit, SocialState>(
        listener: (context, state) {
          if (state is SocialNewPost) {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NewPostScreen(),
                ));
          }
        },
        builder: (context, state) {
          var cubit = SocialCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.notifications_active_outlined)),
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.search_outlined)),
              ],
              title: Text(cubit.titles[cubit.currentIndex]),
            ),
            body: cubit.model != null
                ? cubit.screens[cubit.currentIndex]
                : const Center(
                    child: CircularProgressIndicator(),
                  ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              onTap: (value) {
                cubit.changeBottomNav(value);
              },
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
                BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Post'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person_search), label: 'Users'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings), label: 'Settings'),
              ],
            ),
          );
        },
      ),
    );
  }
}
