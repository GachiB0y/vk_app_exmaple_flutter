import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vk_exmaple/widget/profil_details/profile_details_model.dart';


class WallOfRecordsWidgeet extends StatefulWidget {
  const WallOfRecordsWidgeet({Key? key}) : super(key: key);

  @override
  State<WallOfRecordsWidgeet> createState() => _WallOfRecordsWidgeetState();
}

class _WallOfRecordsWidgeetState extends State<WallOfRecordsWidgeet> {
  @override
  Widget build(BuildContext context) {
    final model =  context.watch<UserDetailsModel>();
    final walls =model.dataWall.userWall?.response?.items;
    final user = model.data;
    final avatarPath = user.userInfoData.avatarPath200;
    final isProcessing = model.isProcessing;

    if (walls == null){
      return const Center(child: CircularProgressIndicator(),);
    }

    return ListView.separated(
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(height: 6);
      },
        itemCount: walls.length,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: ScrollPhysics(),
        itemBuilder: (BuildContext context, int index){
          if (walls[index].attachments == null){
            return const Center(child: CircularProgressIndicator(),);
          }
          else if (walls[index].attachments?.isEmpty == true ) {
            return SizedBox.shrink();
          }
          if (walls[index].copyHistory?[0].attachments?[0].type?.isNotEmpty == true) {
            return SizedBox.shrink();
          }
          return
            Container(
                padding:EdgeInsets.only(
                  top:15,
                  left:15,
                  right:15,
                ),
                decoration:BoxDecoration(
                  color:Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                // color: Colors.white,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Row(
                        children: [
                          avatarPath != null ?  Container(
                            // height: MediaQuery.of(context).size.height,
                            child:  CircleAvatar(
                              radius: 20,
                              backgroundImage: NetworkImage(
                                  avatarPath),
                            ),
                          )
                              : const SizedBox.shrink(),
                          Padding(
                            padding: const EdgeInsets.only(left: 4),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(children: [
                                  const SizedBox(width: 5,),
                                  Text(user.firstName),
                                  const SizedBox(width: 5,),
                                  Text(user.lastName),
                                ],),
                              Text(model.parseDate(walls[index].date!),
                                style: TextStyle(color: Colors.grey),
                              ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    // const SizedBox(height: 15,),
                    if(walls[index].text?.isEmpty != true)
                      Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(walls[index].text ?? ''),
                    ),
                    walls[index].attachments?[0].type == 'video' ?
                    Image(
                    image: NetworkImage(walls[index].attachments?[0].video?.image?[3].url as String)
                   )
                  : SizedBox.shrink(),
                    Row(
                      children: [
                        IconButton(
                          onPressed:!isProcessing ? () {
                           model.toggleLike(context,index);
                          } : null,
                           icon: Icon( walls[index].likes?.canLike == 0 ? Icons.favorite : Icons.favorite_outline ),
                        ),
                        Text(walls[index].likes?.count?.toString() ?? '0'),
                      ],
                    ),
                  ],
                )
            );
    },
    );

  }
}