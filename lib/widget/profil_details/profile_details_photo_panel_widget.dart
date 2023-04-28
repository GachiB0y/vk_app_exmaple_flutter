import 'package:flutter/material.dart';
import '../../resourses/app_images.dart';


class PhotoPanelWidget extends StatefulWidget {
  const PhotoPanelWidget({Key? key}) : super(key: key);

  @override
  State<PhotoPanelWidget> createState() => _PhotoPanelWidgetState();
}

class _PhotoPanelWidgetState extends State<PhotoPanelWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding:EdgeInsets.only(
          left:15,
          right:15,
          top:10,
        ),
        decoration:BoxDecoration(
          color:Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        // color: Colors.white,
        width: double.infinity,
        child: Column(
          children: [
            Text('Photo',),
            SizedBox(height: 15,),
            SizedBox(
              height: 100,
              child: Scrollbar(
                child: ListView.builder(
                    itemCount: 20,
                    itemExtent: 100,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                  return Container(
                      height: 100,
                      width: 100,
                      child:Image(
                          image: AssetImage(AppImages.photoImage)
                      )
                  );
                }
                ),
              ),
            ),
            TextButton(onPressed: () {}, child: Text('Показать всё >'))
          ],
        )
    );
  }
}