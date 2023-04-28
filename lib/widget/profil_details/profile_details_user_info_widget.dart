import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vk_exmaple/widget/profil_details/profile_details_model.dart';


class UserInfoWidget extends StatelessWidget {
  const UserInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model =  context.watch<UserDetailsModel>();
    final user = model.data;

    return Container(
      decoration:BoxDecoration(
        color:Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      width: double.infinity,
      height: MediaQuery.of(context).size.height / 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 15,),
          if(user.userInfoData.avatarPath !=null)
            Container(
              // height: MediaQuery.of(context).size.height,
              child: Stack(
                children:[ CircleAvatar(
                  radius: 64.0,
                  backgroundColor: Colors.blue,
                  child: CircleAvatar(
                    radius: 60.0,
                    backgroundImage: NetworkImage(
                        user.userInfoData.avatarPath!),
                  ),
                ),
                  Positioned(
                    top: 110,
                    left: 90,
                    child: Icon(
                      Icons.circle,
                      size: 15,
                      color: user.userInfoData.online == 1 ?  Colors.green : Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          const SizedBox(height: 15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(user.firstName),
              const SizedBox(width: 5,),
              Text(user.lastName),
            ],
          ),
          const SizedBox(height: 15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.location_on_outlined),
              Text(user.userInfoData.cityTitle),
            ],
          ),
          const SizedBox(height: 15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {},
                  child: Row(children: [
                    const Icon(Icons.messenger_outline),
                    const SizedBox(width: 5,),
                    const Text('Сообщение'),
                  ],
                  )
              ),
              const SizedBox(width: 5,),
              ElevatedButton(onPressed: () {}, child:Icon(Icons.call)),
              const SizedBox(width: 5,),
              ElevatedButton(onPressed: () {}, child:Icon(Icons.person_add)),
              const SizedBox(width: 5,),
              ElevatedButton(onPressed: () {}, child:Icon(Icons.more_horiz_outlined)),
            ],),
        ],
      ),
    );
  }
}