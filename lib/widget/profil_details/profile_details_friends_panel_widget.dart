import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vk_exmaple/widget/profil_details/profile_details_model.dart';

class FriendsPanelWidget extends StatelessWidget {
  const FriendsPanelWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model =  context.watch<UserDetailsModel>();
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        onTap: () {},
        child:
        Container(
          padding:EdgeInsets.symmetric(
            horizontal:15,
            vertical:15,
          ),
          // color: Colors.white,
          width: double.infinity,
          child:Row(children: [
            Expanded(child: Text('${(model.friends.length) ?? '0'} друга',style: TextStyle(fontWeight: FontWeight.bold),)),
            SizedBox(
              height: 60,
              width: 140,
              child: AvatarFriendsWidget(),
            ),
          ],
          ),
        ),
      ),
    );
  }
}

class AvatarFriendsWidget extends StatelessWidget {
  const AvatarFriendsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? image(int index) {
     return context.select((UserDetailsModel model) => model.friends[index].photo_50);
    }
    final model =  context.watch<UserDetailsModel>();
    final friends = model.friends ;
    if (friends == null || friends.isEmpty){
      return SizedBox.shrink();
    }
    return Stack(
        children: List.generate(
            growable: true,
            3, ( int index) {
          return Positioned(
            left: index * 40,
            top: 0,
            child: CircleAvatar(
              backgroundImage:NetworkImage(image(index) ?? ''),
              radius: 30,
            ),
          );
        }
        )
    );
  }
}
