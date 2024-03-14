import 'dart:math';

import 'package:flutter/cupertino.dart';
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
    lodding = false;
    update();
  }

  List All_items_ = [];
  List M_items = [];

  var random = Random();

 Map<String, String> Loop_Items(data_Items, price) {
    Map<String, String> map_data = {};

    for (int i = 0; i < data_Items.length; i++) {

      if (double.parse(data_Items[i]['item_price']) <= price) {

        map_data["${data_Items[i]['item_name']}"] = "${data_Items[i]['item_price']}";
      }
    }
    return map_data;
  }

  Get_one_items(price, index) {
    Map<String, String> map_data = Loop_Items(data_Items, price);

    List list_convert_map = [];
    All_items_.clear();

    list_convert_map = map_data.entries.toList();
    var index_Random = random.nextInt(map_data.length);

    print("================================================");
    print("================================================");
    print(list_convert_map[index_Random]);
    print("================================================");
    print("================================================");
    return Column(
      children: [],
    );

    // if(double.parse(data_Items[index]["item_price"]) < price){
    //   return Row(
    //     children: [
    //       Text("${data_Items[index]["item_price"]}"),
    //       Text("${data_Items[index]["item_name"]}"),
    //     ],
    //   );
    // }
    // return Text("Noooo");
  }

  Get_Data_Inheritance() async {
    var id = await shared.getData(shared.key_ID);
    data_In.clear();
    var res = await Api.postData(LinkApp.get_Data_Inheritance, {"id": '$id'});

    if (res["status"] == "true") {
      data_In.addAll(res["data"]);
      print("===============");
      print(data_In);
      print("===============");
      print("===============");
    }
  }
}
