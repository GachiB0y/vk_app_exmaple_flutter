import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vk_exmaple/widget/profil_details/profile_details_friends_panel_widget.dart';
import 'package:vk_exmaple/widget/profil_details/profile_details_model.dart';
import 'package:vk_exmaple/widget/profil_details/profile_details_photo_panel_widget.dart';
import 'package:vk_exmaple/widget/profil_details/profile_details_user_info_widget.dart';
import 'package:vk_exmaple/widget/profil_details/profile_details_wall_records_widget.dart';



class ProfilDetailsWidget extends StatefulWidget {
  const ProfilDetailsWidget({
     Key? key,
   }) : super(key: key);

  @override
  State<ProfilDetailsWidget> createState() => _ProfilDetailsWidgetState();
}

class _ProfilDetailsWidgetState extends State<ProfilDetailsWidget> {

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Future.microtask(() {
      context.read<UserDetailsModel>().setupLocale(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar:AppBar(
          title:_TitleWidget(),
        ) ,
        body:_BodyWidget(),
        );
  }
}

class _BodyWidget extends StatelessWidget {
  const _BodyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model =  context.watch<UserDetailsModel>();
    final isLoading = model.data.isLoading;
    if (isLoading){
      return const Center(child: CircularProgressIndicator(),);
    }
    return  ListView(
      children: [
        const UserInfoWidget(),
        const SizedBox(height: 10,),
        const FriendsPanelWidget(),
        const SizedBox(height: 10,),
        const PhotoPanelWidget(),
        const SizedBox(height: 10,),
        const WallOfRecordsWidgeet(),
      ],
    );
  }
}


class _TitleWidget extends StatelessWidget {
  const _TitleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firsName = context.select((UserDetailsModel model) => model.data.firstName);
    final lastName = context.select((UserDetailsModel model) => model.data.lastName);
    return Row(
      children: [
        Text(firsName  ?? 'Loading...'),
        const SizedBox(width: 5,),
        Text(lastName ?? ''),
      ],
    );
  }
}





