import 'package:flutter/material.dart';
import 'package:flutter95/flutter95.dart';
import 'package:google98/comps/text_button.dart';
import 'package:google98/utils/utils.dart';
import 'package:google98/vos/custom_colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Google\'98',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        buttonTheme: ButtonThemeData(minWidth: 20.0, height: 10.0,),
      ),
      home: MyHomePage(title: 'Google\'98'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  TextEditingController _searchInput;
  FocusNode _searchFocus;
  TextEditingController _subscriptionInput;
  FocusNode _subscriptionFocus;
  String subscriptionPlaceholder = 'your e-mail';

  List<Widget> _specialSearches;
  List<Widget> _links;
  List<Widget> _subscription;

  @override
  void initState() {
    _searchInput = TextEditingController();
    _searchFocus = FocusNode();
    _subscriptionInput = TextEditingController();
    _subscriptionFocus = FocusNode();
    _subscriptionInput.text = subscriptionPlaceholder;


    _specialSearches = [
      Text('Special Searches', style: Flutter95.textStyle, textAlign: TextAlign.center,),
      TextButton('Stanford Search', 'https://www.google.com/search?q=Stanford'),
      TextButton('Linux Search', 'https://www.google.com/search?q=Linux'),
    ];

    _links = [
      TextButton('Help!', 'https://web.archive.org/web/19990221212930/http://www.google.com/help.html', 12.0),
      TextButton('About Google!', 'https://about.google/', 12.0),
      TextButton('Company Info', 'https://web.archive.org/web/19990221202430/http://www.google.com/company.html', 12.0),
      TextButton('Google! Logos', 'https://web.archive.org/web/19990224043535/http://www.google.com/stickers.html', 12.0),
    ];

    _subscription = [
      Text(' Get Google! \nupdates monthly:', style: Flutter95.textStyle, textAlign: TextAlign.center,),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            flex: 1,
            child: Container(),
          ),
          Flexible(
            flex: 4,
            child: TextField95(controller: _subscriptionInput,),
          ),
          Flexible(
            flex: 1,
            child: Container(),
          ),
        ],
      ),
      SizedBox(height: 5),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Button95(
            onTap: () async {
              if(_subscriptionInput.text.isNotEmpty && _subscriptionInput.text != subscriptionPlaceholder) {
                await Utils.launchInBrowser('https://www.google.com/search?q=${_subscriptionInput.text}');
              } else {
                // focus is not supported yet by TextFiled95
                //FocusScope.of(context).requestFocus(_subscriptionFocus);
              }
            },
            child: Text('Subscribe', style: Flutter95.textStyle,),
          ),
          SizedBox(width: 5),
          TextButton('Archive', 'https://web.archive.org/web/19991128055025/http://www.egroups.com/group/google-friends/', 12.0),
        ],
      ),
    ];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('images/Google1998BetaSmall.png'),
              Container(
                color: CustomColors.grey,
                width: MediaQuery.of(context).size.width*0.9,
                //constraints: BoxConstraints(minWidth: 400),
                padding: EdgeInsets.fromLTRB(20, 5, 20, 25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Search the web using Google!', style: Flutter95.textStyle,),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          flex: 1,
                          child: Container(),
                        ),
                        SizedBox(
                          width: 330,
                          child: TextField95(controller: _searchInput,),
                        ),
                        Flexible(
                          flex: 1,
                          child: Container(),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Button95(
                          onTap: () async {
                            if(_searchInput.text.isNotEmpty) {
                              await Utils.launchInBrowser('https://www.google.com/search?q=${_searchInput.text}');
                            } else {
                              // focus is not supported yet by TextFiled95
                              // FocusScope.of(context).requestFocus(_searchFocus);
                            }
                          },
                          child: Text('Google Search', style: Flutter95.textStyle,),
                        ),
                        SizedBox(width: 5),
                        Button95(
                          onTap: () async {
                            await Utils.launchInBrowser('https://www.google.com/doodles/');
                          },
                          child: Text('I\'m feeling lucky', style: Flutter95.textStyle,),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5),
              MediaQuery.of(context).size.width < 600?
              Container(
                padding: EdgeInsets.all(0),
                width: MediaQuery.of(context).size.width*0.9,
                child: Column(
                  children: [
                    Container(
                      height: 120,
                      width: MediaQuery.of(context).size.width*0.9,
                      padding: EdgeInsets.all(5),
                      color: CustomColors.cyanLight,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: _specialSearches,
                      ),
                    ),
                    SizedBox(height: 5),
                    Container(
                      height: 120,
                      width: MediaQuery.of(context).size.width*0.9,
                      padding: EdgeInsets.all(5),
                      color: CustomColors.cyan,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: _links,
                      ),
                    ),
                    SizedBox(height: 5),
                    Container(
                      height: 120,
                      width: MediaQuery.of(context).size.width*0.9,
                      padding: EdgeInsets.all(5),
                      color: CustomColors.cyanDark,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: _subscription,
                      ),
                    ),
                  ],
                ),
              )
              :Container(
                padding: EdgeInsets.all(0),
                width: MediaQuery.of(context).size.width*0.9,
                height: 120,
                child: Row(
                  children: [
                    Flexible(
                      flex: 4,
                      fit: FlexFit.tight,
                      child: Container(
                        constraints: BoxConstraints.expand(),
                        padding: EdgeInsets.all(5),
                        color: CustomColors.cyanLight,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: _specialSearches,
                        ),
                      ),
                    ),
                    SizedBox(width: 5),
                    Flexible(
                      flex: 3,
                      fit: FlexFit.tight,
                      child: Container(
                        constraints: BoxConstraints.expand(),
                        padding: EdgeInsets.all(5),
                        color: CustomColors.cyan,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: _links
                        ),
                      ),
                    ),
                    SizedBox(width: 5),
                    Flexible(
                      flex: 5,
                      fit: FlexFit.tight,
                      child: Container(
                        constraints: BoxConstraints.expand(),
                        padding: EdgeInsets.all(5),
                        color: CustomColors.cyanDark,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: _subscription,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25),
              Text('Copyright © 1998 Google Inc.', style: Flutter95.textStyle,),
              SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _searchInput.dispose();
    _searchFocus.dispose();
    _subscriptionInput.dispose();
    _subscriptionFocus.dispose();
    super.dispose();
  }
}
