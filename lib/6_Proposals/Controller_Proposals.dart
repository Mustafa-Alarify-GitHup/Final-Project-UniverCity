import 'package:get/get.dart';
import 'package:mustafa/API/Api.dart';
import 'package:mustafa/API/Links.dart';
import 'package:mustafa/SherdRefrance/shared_preferences.dart';

class Controller_Proposals extends GetxController {
  bool lodding = true;
  List data_In = [];
  List data_Items = [];

  Get_Items() async {
    var id = await shared.getData(shared.key_ID);
    var res = await Api.postData(LinkApp.get_Items, {"name": "$id"});

    data_Items.addAll(res["data"]);
    print(data_Items);
    lodding=false;
    update();
  }



  Get_Data_Inheritance() async {
    var id = await shared.getData(shared.key_ID);
    data_In.clear();
    var res = await Api.postData(LinkApp.get_Data_Inheritance, {"id": '$id'});

    if (res["status"] == "true") {
      data_In.addAll(res["data"]);
      print("===============");
      print(data_In);
      print("===============");    print("===============");
    }
  }



}
