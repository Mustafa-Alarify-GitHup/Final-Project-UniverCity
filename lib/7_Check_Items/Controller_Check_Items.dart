import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mustafa/API/Api.dart';
import 'package:mustafa/API/Links.dart';
import 'package:mustafa/SherdRefrance/shared_preferences.dart';

class Controller_Check_Items extends GetxController {
  List data_Items = [];
  List data_In = [];
  bool lodding = true;

  Get_Items() async {
    var id = await shared.getData(shared.key_ID);
    var res = await Api.postData(LinkApp.get_Items, {"name": "$id"});

    data_Items.addAll(res["data"]);
    lodding = false;
    update();
    print(data_Items);
  }

  Get_Data_Inheritance() async {
    var id = await shared.getData(shared.key_ID);
    data_In.clear();
    var res = await Api.postData(LinkApp.get_Data_Inheritance, {"id": '$id'});

    if (res["status"] == "true") {
      data_In.addAll(res["data"]);
    }
  }

  List item_Name = [];
  List item_Price = [];
  List item_BookedUp = [];

  Get_All_Items_C(price) {
    item_Name.clear();
    item_Price.clear();

    for (int i = 0; i < data_Items.length; i++) {
      if (price >= double.parse(data_Items[i]["item_price"])) {
        item_Name.add(data_Items[i]['item_name']);
        item_Price.add(data_Items[i]['item_price']);
      }
    }

    return Column(
      children: [
        ...List.generate(
            item_Price.length,
            (index) => Column(
                  children: [
                    InkWell(
                      onTap: (){
                            print('${item_Name[index]} => ${item_Price[index]}');
                      },
                      child: Container(
                        child: Row(
                          children: [
                            Expanded(
                                child: Container(
                                    alignment: Alignment.center,
                                    child: Text(item_Name[index]))),
                            Expanded(
                                child: Container(
                                    alignment: Alignment.center,
                                    child: Text(item_Price[index]))),
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
        const Divider(
          indent: 10,
          endIndent: 10,
          height: 10,
          color: Colors.black,
          thickness: 2,
        ),
        Row(
          children: [
            Expanded(
                child: Container(
                    alignment: Alignment.center,
                    child: const Text(
                      "المبلغ المتبقي",
                      style: TextStyle(fontSize: 18),
                    ))),
            Expanded(
                child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      "${price.toString().length > 5 ? price.toString().substring(0, 5) : price}",
                      style: TextStyle(fontSize: 20),
                    ))),
          ],
        )
      ],
    );
  }
}
