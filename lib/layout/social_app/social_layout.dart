import 'package:flutter/material.dart';
import 'package:flutter_app/components/components.dart';
import 'package:flutter_app/layout/social_app/cubit/cubit.dart';
import 'package:flutter_app/layout/social_app/cubit/states.dart';
import 'package:flutter_app/modules/social_app/new_post/new_post_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SocialLayout extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
        listener: (context, state)
        {
          if(state is SocialNewPostState)
            {
              navigateTo(context, NewPostScreen(),);
            }
        },
        builder: (context, state)
        {
          var cubit = SocialCubit.get(context);

          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.grey[50],
              title: Text(

                  cubit.titles[cubit.currentIndex],
                  style: TextStyle(color: Colors.black),
              ),
              actions:
              [
                IconButton(
                    onPressed: () {},
                    icon: Icon( Icons.notifications),
                  color: Colors.black,

                ),
                IconButton(onPressed: () {},
                    icon: Icon( Icons.search),
                  color: Colors.black,
                ),

              ],
            ),
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              unselectedItemColor: Colors.grey[400],
              selectedItemColor: Colors.blue,
              currentIndex: cubit.currentIndex,
              onTap: (index) 
              {
                cubit.changeBottomNav(index);
              },
              items:
              [
                BottomNavigationBarItem(
                  backgroundColor: Colors.white,
                  icon: Icon(
                    Icons.home_outlined,
                  ),
                      label: 'home'
                ),
                BottomNavigationBarItem(
                    icon: Icon(
                        Icons.chat_outlined
                    ),
                  label: 'chats'
                ),
                BottomNavigationBarItem(
                    icon: Icon(
                        Icons.note_add_outlined
                    ),
                    label: 'Post'
                ),
                BottomNavigationBarItem(
                    icon: Icon(
                        Icons.location_history_outlined
                    ),
                  label: 'users'
                ),
                BottomNavigationBarItem(
                    icon: Icon(
                        Icons.settings_outlined
                    ),
                  label: 'settings'
                ),

              ],
            ),
          );
        }
    );
  }
}
