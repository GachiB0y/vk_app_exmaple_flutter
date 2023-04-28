import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vk_exmaple/domain/data-provider/session_data_provider.dart';
import 'package:vk_exmaple/ui/naviagtion/main_navigation.actions.dart';
import 'package:vk_exmaple/ui/naviagtion/main_navigation.dart';

class MainScreenWidget extends StatefulWidget {
  final ScreenFactory screenFactory;
  final MainNavigationAction mainNavigationAction;
  final SessionDataProvdier sessionDataProvdier;

  const MainScreenWidget({Key? key, required this.screenFactory, required this.mainNavigationAction, required this.sessionDataProvdier}) : super(key: key);

  @override
   State<MainScreenWidget> createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
  int _selectedPageIndex = 0;

void onSelectTab( int index) {
  if(_selectedPageIndex == index)return;
  setState(() {
    _selectedPageIndex = index;
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title: Text('VK'),
        actions: [
           IconButton(
              onPressed: ()  {
                widget.sessionDataProvdier.deleteSessionId();
                widget.mainNavigationAction.resetNavigation(context);
                // MainNavigation.resetNavigation(context);
              },
              icon:const Icon(Icons.exit_to_app)
          ),
        ],
      ) ,
        body: IndexedStack(
          index: _selectedPageIndex,
          children: [
            widget.screenFactory.makeFriendList(),
            const Text(
              'Группы',
            ),
            const Text(
              'Мессенджер',
            ),
            const Text(
              'Мой профиль',
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Друзья',
          ),
            BottomNavigationBarItem(
              icon: Icon(Icons.groups),
              label: 'Группы',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.messenger),
              label: 'Мессенджер',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_pin),
              label: 'Мой профиль',
            ),

          ],
            currentIndex:_selectedPageIndex,
            selectedItemColor: Colors.blue[400],
            onTap:onSelectTab ,
        )
    );
  }
}
