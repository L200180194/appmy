import 'package:flutter/material.dart';
import 'package:myintern/pages/home/home_page.dart';
import 'package:myintern/pages/home/information_page.dart';
import 'package:myintern/pages/home/profile_page.dart';
import 'package:myintern/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int curIndex = 0;
  @override
  Widget build(BuildContext context) {
    Widget btmnav() {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(5)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 1.0), //(x,y)
              blurRadius: 6.0,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: BottomNavigationBar(
            selectedLabelStyle: primaryTextStyle.copyWith(color: primaryColor),
            unselectedLabelStyle: primaryTextStyle.copyWith(color: Colors.grey),
            currentIndex: curIndex,
            onTap: (value) {
              print(value);
              setState(() {
                curIndex = value;
              });
            },
            iconSize:
                (MediaQuery.of(context).orientation == Orientation.portrait)
                    ? 27.sp
                    : 24,
            items: [
              BottomNavigationBarItem(
                icon: Container(
                    margin: EdgeInsets.only(
                      top: 5.h,
                    ),
                    child: Icon(Icons.home_outlined)),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                  icon: Container(
                      margin: EdgeInsets.only(
                        top: 5.h,
                      ),
                      child: Icon(Icons.article_outlined)),
                  label: 'Information'),
              BottomNavigationBarItem(
                  icon: Container(
                      margin: EdgeInsets.only(
                        top: 5.h,
                      ),
                      child: Icon(Icons.person_outline_rounded)),
                  label: 'Profile')
            ],
            elevation: 20,
          ),
        ),
      );
    }

    Widget bdy() {
      switch (curIndex) {
        case 0:
          return HomePage();
          break;
        case 1:
          return InformationPage();
          break;
        case 2:
          return ProfilePage();
          break;
        default:
          return HomePage();
      }
    }

    return (MediaQuery.of(context).orientation == Orientation.portrait)
        ? Scaffold(
            bottomNavigationBar: btmnav(),
            appBar: AppBar(
              toolbarHeight: 48.h,
              elevation: (curIndex == 2) ? 0 : 5,
              shape: (curIndex == 2)
                  ? RoundedRectangleBorder()
                  : RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(5),
                    )),
              leading: SizedBox(),
              title: Center(
                child: Text(
                  'MyIntern',
                  style: primaryTextStyle.copyWith(
                      color: Colors.white, fontWeight: bold, fontSize: 24.sp),
                ),
              ),
              actions: [
                Container(
                  margin: EdgeInsets.only(right: 15.w),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/search');
                      print('aaaa');
                    },
                    icon: Icon(Icons.search_rounded),
                    iconSize: 30.sp,
                  ),
                )
              ],
              backgroundColor: primaryColor,
            ),
            body: bdy(),
          )
        : Scaffold(
            bottomNavigationBar: btmnav(),
            appBar: AppBar(
              toolbarHeight: 80.h,
              elevation: (curIndex == 2) ? 0 : 5,
              shape: (curIndex == 2)
                  ? RoundedRectangleBorder()
                  : RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(5),
                    )),
              leading: SizedBox(),
              title: Center(
                child: (curIndex == 2)
                    ? Text(
                        'Profile',
                        style: primaryTextStyle.copyWith(
                            color: Colors.white,
                            fontWeight: bold,
                            fontSize: 35.sp),
                      )
                    : Text(
                        'MyIntern',
                        style: primaryTextStyle.copyWith(
                            color: Colors.white,
                            fontWeight: bold,
                            fontSize: 35.sp),
                      ),
              ),
              actions: [
                Container(
                  margin: EdgeInsets.only(right: 15.w),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/search');
                      print('aaaa');
                    },
                    icon: Icon(Icons.search_rounded),
                    iconSize: 40.sp,
                  ),
                )
              ],
              backgroundColor: primaryColor,
            ),
            body: bdy(),
          );
  }
}
