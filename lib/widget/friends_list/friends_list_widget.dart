import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vk_exmaple/domain/blocs/friend_list_bloc.dart';
import 'package:vk_exmaple/ui/naviagtion/main_navigation_route_names.dart';


class FriendsListWidget extends StatefulWidget {
  const FriendsListWidget({Key? key,}) :super(key:key);

  @override
  State<FriendsListWidget> createState() => _FriendsListWidgetState();
}

class _FriendsListWidgetState extends State<FriendsListWidget> {


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
   context.read<FriendsListViewBloc>().add(FriendListEventLoad());
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const _FriendListWidget(),
        _SearchWidget(),
      ],
    );
  }
}

class _SearchWidget extends StatefulWidget {

   _SearchWidget({Key? key}) : super(key: key);

  @override
  State<_SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<_SearchWidget> {
  Timer? searchDebounce;

  @override
  Widget build(BuildContext context) {
    // final bloc = context.read<FriendsListViewBloc>();
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          TextField(
            onChanged: (text){
              searchDebounce?.cancel();
              searchDebounce = Timer(const Duration(milliseconds: 500), () {
                context
                    .read<FriendsListViewBloc>()
                    .add(FriendListEventSearch(text));
              });
              // bloc.add(FriendListEventSearch(text));
            },
            // onChanged: ,
            decoration:InputDecoration(
              prefixIcon: const Icon(Icons.search),
              hintText: 'Введите имя и фамилию',
              filled: true,
              fillColor: Colors.white.withAlpha(235),
              border: OutlineInputBorder(),
            ) ,
          ),
        ],
      ),
    );
  }
}



class _FriendListWidget extends StatelessWidget {
  const _FriendListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<FriendsListViewBloc>();
    return ListView.builder(
      padding: EdgeInsets.only(top: 74),
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      itemCount:  model.state.friendContainer.friends.length,// model.friends.length,
      itemExtent: 60,
      itemBuilder: (BuildContext context, int index) {
        return _FriendListRowWidget(index: index,);
      },
    );
  }
}


class _FriendListRowWidget extends StatelessWidget {
  final int index;
  const _FriendListRowWidget({Key? key,required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.read<FriendsListViewBloc>();
    final friend=  model.state.friendContainer.friends[index];
    final photoPath = friend.photoPath;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6,),
      child: Stack(
        children: [
          Row(
            children: [
              photoPath != null ?  Container(
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 35.0,
                      backgroundImage: NetworkImage(
                          photoPath),
                    ),
                    Positioned(
                      top: 37,
                      left: 48,
                      child: Icon(
                        Icons.circle,
                        size: 11,
                        color: friend.online == 1 ?  Colors.green : Colors.grey,
                      ),
                    ),
                  ],
                ),
              )
                  : SizedBox.shrink(),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text(
                          friend.first_name,
                          style: TextStyle(fontSize: 16, color: Colors.black),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          friend.last_name,
                          style: TextStyle(fontSize: 16, color: Colors.black),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Row(
                      children: [
                        Text(
                          model.userAge(friend.bdate)  ?? '',
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),

                        const SizedBox(width: 3,),
                        Text(
                          friend.city ?? '',
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const Icon(
                Icons.phone,
                color: Colors.blue,
              ),
              const SizedBox(
                width: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child:const Icon(
                  Icons.messenger_outline_outlined,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                final id = friend.id;
               Navigator.of(context).pushNamed(MainNavigationRouteNames.profileDetails, arguments:  id,);
               // Navigator.of(context).pushNamed(MainNavigationRouteNames.profileDetails, arguments:  id,);
              } //model.onFriendsTap(context,index),
            ),
          ),
        ],
      ),
    );
  }
}

