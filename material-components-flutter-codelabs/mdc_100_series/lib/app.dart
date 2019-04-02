// Copyright 2018-present the Flutter authors. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:Shrine/backdrop.dart';
import 'package:Shrine/category_menu_page.dart';
import 'package:Shrine/colors.dart';
import 'package:Shrine/model/product.dart';
import 'package:Shrine/supplemental/cut_corners_border.dart';
import 'package:flutter/material.dart';

import 'home.dart';
import 'login.dart';

// DONE: Convert ShrineApp to stateful widget (104)
class ShrineApp extends StatefulWidget {
  @override
  _ShrineAppState createState() => _ShrineAppState();
}

class _ShrineAppState extends State<ShrineApp> {
  Category _currentCategory = Category.all;

  void _onCategoryTap(Category category) {
    setState(() {
      _currentCategory = category;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shrine',
      // DONE: Change home: to a Backdrop with a HomePage frontLayer (104)
      home: Backdrop(
        // DONE: Make currentCategory field take _currentCategory (104)
        currentCategory: _currentCategory,
        // DONE: Pass _currentCategory for frontLayer (104)
        frontLayer: HomePage(category: _currentCategory),
        // DONE: Change backLayer field value to CategoryMenuPage (104)
        backLayer: CategoryMenuPage(
          currentCategory: _currentCategory,
          onCategoryTap: _onCategoryTap,
        ),
        frontTitle: Text('SHRINE'),
        backTitle: Text('MENU'),
      ),
      // TODO: Make currentCategory field take _currentCategory (104)
      // TODO: Pass _currentCategory for frontLayer (104)
      // TODO: Change backLayer field value to CategoryMenuPage (104)
      initialRoute: '/login',
      onGenerateRoute: _getRoute,
      // DONE: Add a theme (103)
      theme: _kShrineTheme,
    );
  }

  Route<dynamic> _getRoute(RouteSettings settings) {
    if (settings.name != '/login') {
      return null;
    }

    return MaterialPageRoute<void>(
      settings: settings,
      builder: (BuildContext context) => LoginPage(),
      fullscreenDialog: true,
    );
  }
}

// DONE: Build a Shrine Theme (103)
final ThemeData _kShrineTheme = _buildShrineTheme();

ThemeData _buildShrineTheme() {
  //Dark Theme
//  final ThemeData base = ThemeData.dark();
//  return base.copyWith(
//    accentColor: kShrineAltDarkGrey,
//    primaryColor: kShrineAltDarkGrey,
//    buttonTheme: base.buttonTheme.copyWith(
//      buttonColor: kShrineAltYellow,
//      textTheme: ButtonTextTheme.normal,
//    ),
//    scaffoldBackgroundColor: kShrineAltDarkGrey,
//    cardColor: kShrineAltDarkGrey,
//    textSelectionColor: kShrinePink100,
//    errorColor: kShrineErrorRed,
//    textTheme: _buildShrineTextTheme(base.textTheme),
//    primaryTextTheme: _buildShrineTextTheme(base.primaryTextTheme),
//    accentTextTheme: _buildShrineTextTheme(base.accentTextTheme),
//    primaryIconTheme: base.iconTheme.copyWith(color: kShrineAltYellow),
//    inputDecorationTheme: InputDecorationTheme(
//      border: CutCornersBorder(),
//    ),
//  );

  //Light Theme
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    accentColor: kShrineBrown900,
    primaryColor: kShrinePink100,
    buttonTheme: base.buttonTheme.copyWith(
      buttonColor: kShrinePink100,
      textTheme: ButtonTextTheme.normal,
    ),
    scaffoldBackgroundColor: kShrineBackgroundWhite,
    cardColor: kShrineBackgroundWhite,
    textSelectionColor: kShrinePink100,
    errorColor: kShrineErrorRed,
    // DONE: Add the text themes (103)
    textTheme: _buildShrineTextTheme(base.textTheme),
    primaryTextTheme: _buildShrineTextTheme(base.primaryTextTheme),
    accentTextTheme: _buildShrineTextTheme(base.accentTextTheme),
    // DONE: Add the icon themes (103)
    primaryIconTheme: base.iconTheme.copyWith(color: kShrineBrown900),
    // DONE: Decorate the inputs (103)
    inputDecorationTheme: InputDecorationTheme(
      border: CutCornersBorder(),
    ),
  );
}

// DONE: Build a Shrine Text Theme (103)
TextTheme _buildShrineTextTheme(TextTheme base) {
  return base
      .copyWith(
        headline: base.headline.copyWith(
          fontWeight: FontWeight.w500,
        ),
        title: base.title.copyWith(fontSize: 18.0),
        caption: base.caption.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 14.0,
        ),

        //Applying the fontFamily in this way applies the changes only to the
        //typography scale values specified in copyWith() (headline, title, caption):

        //Light theme
      )
      .apply(
        fontFamily: 'Rubik',
        displayColor: kShrineBrown900,
        bodyColor: kShrineBrown900,
      );

        //Dark Theme
//      )
//      .apply(
//        fontFamily: 'Rubik',
//        displayColor: kShrineSurfaceWhite,
//        bodyColor: kShrineSurfaceWhite,
//      );
}
