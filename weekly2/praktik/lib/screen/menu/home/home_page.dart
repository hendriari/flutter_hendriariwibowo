import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:praktik/data/list/data_course.dart';
import 'package:praktik/data/model/course_model.dart';
import 'package:praktik/util/color.dart';
import 'package:praktik/widget/icon_button_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double sizeHeight = MediaQuery.of(context).size.height;
    double sizeWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: SizedBox(
            height: sizeHeight,
            width: sizeWidth,
            child: Stack(
              children: [
                Container(
                  padding: EdgeInsets.only(top: sizeHeight * .1, left: 20),
                  height: sizeHeight * .25,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: MyColor.primaryColor,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: IconButtonWidget(
                            onTap: () {},
                            color: MyColor.white.withOpacity(.3),
                            borderColor: MyColor.transparent,
                            heightContainer: 30,
                            widthContainer: 30,
                            icon: CupertinoIcons.bell_fill,
                            iconColor: Colors.amberAccent,
                          ),
                        ),
                      ),
                      Text(
                        'Selamat Datang !',
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                          color: MyColor.white,
                        ),
                      ),
                      Text(
                        'Hendri',
                        style: Theme.of(context)
                            .textTheme
                            .headline4!
                            .copyWith(color: MyColor.white),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: sizeHeight * .23,
                  child: Container(
                    padding: EdgeInsets.only(left: 15, top: 30),
                    width: sizeWidth,
                    decoration: BoxDecoration(
                      color: MyColor.errorColor,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Trending Course',
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        ListView.builder(
                            shrinkWrap: true,
                            itemCount: courseLevel.length,
                            itemBuilder: (context, index) {
                              final CourseModel courseLevels = courseLevel[index];
                              return Text(courseLevels.courseName);
                            })
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
