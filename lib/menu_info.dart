import 'package:expensetracker/enum.dart';
import 'package:flutter/foundation.dart';

class MenuInfo extends ChangeNotifier{
  MenuType menuType;
  String title;
  String image;

  MenuInfo(this.menuType,{this.title,this.image});
  updateMenuInfo(MenuInfo menuInfo){
    this.title=menuInfo.title;
    this.image=menuInfo.image;
    this.menuType=menuInfo.menuType;

    notifyListeners();
  }
}