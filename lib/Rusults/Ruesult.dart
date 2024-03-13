import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mustafa/My_pro.dart';
import 'package:mustafa/Rusults/Card_Ruselt.dart';
import 'package:mustafa/Rusults/Result_Controller.dart';

class Result extends StatelessWidget {
  final List data;

  const Result({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    Result_Controller controller = Get.put(Result_Controller());
    controller.Division_Inheritance(data);
    return Scaffold(
        appBar: AppBar(
          title: CircleAvatar(
              radius: 30,
              backgroundColor: Colors.white,
              child: Image.asset("images/icon.png")),
          centerTitle: true,
          backgroundColor: co1,
        ),
        body: Column(
          children: [
            Text(
              "تقرير القسمه",
              style: TextStyle(fontSize: 35),
            ),
            Expanded(
              child: GetBuilder(
                  init: Result_Controller(),
                  builder: (con){return
                Container(
                  width: full,
                  child: controller.lodding
                      ? Center(
                    child: CircularProgressIndicator(),
                  )
                      : ListView.builder(
                      itemCount: controller.data.length,
                      itemBuilder: (context, index) {
                        return Card_Ruslt(
                            name: controller.data[index]['Inh_name'],
                            price: controller.data[index]['price'],
                            type: controller.data[index]['type'],
                            N: "100");
                      }),
                );
              })
            ),
          ],
        ));
  }
}
