import 'package:flutter/material.dart';
import 'package:flutter_app/page_model.dart';
import 'package:flutter_app/screen/home_screen.dart';
import 'package:page_view_indicator/page_view_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  List<PageModel> model;

  void _addData() {
    model = List();
    model.add(PageModel(
        'assets/images/im1.jpg',
        'Welcome !',
        '1- Welcome to App me bla bla bla bla bla bla bla bla bla bla bla bla bla bla',
        Icons.account_circle_rounded));
    model.add(PageModel(
        'assets/images/im2.jpg',
        'Welcome !',
        '2- Welcome to App me bla bla bla bla bla bla bla bla bla bla bla bla bla bla',
        Icons.add_shopping_cart_outlined));
    model.add(PageModel(
        'assets/images/im3.jpg',
        'Welcome !',
        '3- Welcome to App me bla bla bla bla bla bla bla bla bla bla bla bla bla bla',
        Icons.airport_shuttle_outlined));
    model.add(PageModel(
        'assets/images/im1.jpg',
        'Welcome !',
        '4- Welcome to App me bla bla bla bla bla bla bla bla bla bla bla bla bla bla',
        Icons.approval));
  }

  ValueNotifier<int> _valueNotifier = ValueNotifier(0);

  @override
  void initState() {
    super.initState();
    _addData();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: PageView.builder(
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: ExactAssetImage(
                          model[index].pathImage,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Transform.translate(
                        offset: Offset(0, -100),
                        child: Icon(
                          model[index].iconData,
                          color: Colors.white,
                          size: 150,
                        ),
                      ),
                      Text(
                        model[index].title,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          letterSpacing: 0.5,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 24,
                          right: 24,
                          top: 8,
                        ),
                        child: Text(
                          model[index].discreption,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                            decoration: TextDecoration.none,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
            itemCount: model.length,
            onPageChanged: (index) {
              _valueNotifier.value = index;
            },
          ),
        ),
        Transform.translate(
          offset: Offset(0, 150),
          child: Align(
            alignment: Alignment.center,
            child: _pageViewIndicator(model.length),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 16, right: 16, left: 16),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              height: 40,
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        _updateSeen();
                        return HomeScreen();
                      },
                    ),
                  );
                },
                color: Colors.red.shade600,
                child: Text(
                  'GET START',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    letterSpacing: 1,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _pageViewIndicator(int length) {
    return PageViewIndicator(
      pageIndexNotifier: _valueNotifier,
      length: length,
      normalBuilder: (animationController, index) => Circle(
        size: 8.0,
        color: Colors.grey,
      ),
      highlightedBuilder: (animationController, index) => ScaleTransition(
        scale: CurvedAnimation(
          parent: animationController,
          curve: Curves.ease,
        ),
        child: Circle(
          size: 12.0,
          color: Colors.red,
        ),
      ),
    );
  }

  void _updateSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('seen', true);
  }
}
