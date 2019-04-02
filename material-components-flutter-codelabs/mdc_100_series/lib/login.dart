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

import 'package:Shrine/colors.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // DONE: Add text editing controllers (101)
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            SizedBox(height: 80.0),
            Column(
              children: <Widget>[
                Image.asset('assets/diamond.png',
                 // color: kShrineBackgroundWhite,//Dark theme
                ),
                SizedBox(height: 16.0),
                Text('SHRINE'),
              ],
            ),
            SizedBox(height: 120.0),
            // DONE: Wrap Username with AccentColorOverride (103)
            // DONE: Remove filled: true values (103)
            // DONE: Wrap Password with AccentColorOverride (103)
            // DONE: Add TextField widgets (101)
            // [Name]
            AccentColorOverride(
             // color: kShrineAltYellow,//Dark theme
              color: kShrineBrown900,
              child: TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  //filled: true,
                  labelText: 'Username',
                ),
              ),
            ),
            // (spacer)
            SizedBox(height: 12.0),
            // [Password]
            AccentColorOverride(
             // color: kShrineAltYellow,//Dark theme
              color: kShrineBrown900,
              child: TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  //filled: true,
                  labelText: 'Password',
                ),
                obscureText: true,
              ),
            ),
            // DONE: Add button bar (101)
            ButtonBar(
              // DONE: Add a beveled rectangular border to CANCEL (103)
              children: <Widget>[
                // DONE: Add buttons (101)
                FlatButton(
                  shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(7.0)),
                  ),
                  child: Text("CANCEL"),
                  onPressed: () {
                    // DONE: Clear the text fields (101)
                    _usernameController.clear();
                    _passwordController.clear();
                  },
                ),
                // DONE: Add an elevation to NEXT (103)
                // DONE: Add a beveled rectangular border to NEXT (103)
                RaisedButton(
                  elevation: 8.0,
                  shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(7.0)),
                  ),
                  child: Text("NEXT"),
                  onPressed: () {
                    // DONE: Show the next page (101)
                    Navigator.pop(context);
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// DONE: Add AccentColorOverride (103)
class AccentColorOverride extends StatelessWidget {
  const AccentColorOverride({Key key, this.color, this.child})
      : super(key: key);

  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Theme(
      child: child,
      data: Theme.of(context).copyWith(
        accentColor: color,
        brightness: Brightness.dark,
      ),
    );
  }
}
