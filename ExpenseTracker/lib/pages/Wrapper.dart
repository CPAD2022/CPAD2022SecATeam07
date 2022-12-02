import 'package:budget_tracker_ui/pages/root_app.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../Model/user.dart';
import 'Auth/Authenicate.dart';

class Wrapper extends StatelessWidget {
  Person user;
  Wrapper(Person user){
    this.user=user;
  }

  @override
  Widget build(BuildContext context) {
    if(user==null)
      return Authenticate();
    return RootApp();
  }
}