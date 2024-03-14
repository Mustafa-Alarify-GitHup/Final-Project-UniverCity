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

  Map All_items_ = {};
  Map M_items = {};

  var random = Random();

  Loop_Items(data_Items, price) {
    Map map_data = {};

    for (int i = 0; i < data_Items.length; i++) {
      if (double.parse(data_Items[i]['item_price']) <= price) {
        map_data["$i"] = {
          "name": "${data_Items[i]['item_name']}",
          "price": "${data_Items[i]['item_price']}",
        };
      }
    }
    return map_data;
  }

  Get_one_items(price, index) {
    Map map_data = Loop_Items(data_Items, price);

    // print("==============HHHHHH=======================");
    print(map_data);
    print("=====================================");

    for (int i = 0; i < map_data.length; i++) {
      var index_Random = random.nextInt(map_data.length);

      All_items_['$i'] = map_data['$index_Random'];

      price -= double.parse(All_items_['price']);
      map_data = Loop_Items(data_Items, price);

      print("==============\t$i\t=======================");
      print(map_data['$index_Random']);
      print(price);
      print("=====================================");
    }
    print("ZZZZZZZZZZZZZZZZZZZZZZZZZ");
    print(All_items_);
    print("ZZZZZZZZZZZZZZZZZZZZZZZZZ");

    print(map_data);
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
