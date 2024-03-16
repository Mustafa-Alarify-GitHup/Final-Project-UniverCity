import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mustafa/6_Proposals/Proposals.dart';
import 'package:mustafa/7_Check_Items/Check_Items.dart';
import 'package:mustafa/My_pro.dart';
import 'Card_Ruselt.dart';
import 'Result_Controller.dart';


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
        backgroundColor: Colors.grey[200],
        body: Column(
          children: [
            const Text(
              "تقرير القسمه",
              style: TextStyle(fontSize: 35),
            ),
            Expanded(
                child: GetBuilder(
                    init: Result_Controller(),
                    builder: (con) {
                      return Container(
                        width: full,
                        child: controller.lodding
                            ? const Center(
                                child: CircularProgressIndicator(),
                              )
                            : ListView.builder(
                                itemCount: controller.data_in.length,
                                itemBuilder: (context, index) {
                                  return  Card_Ruslt(
                                        name: controller.data_in[index]['Inh_name'],
                                        price: controller.data_in[index]['price'].toString().substring(0,3),
                                        type: controller.data_in[index]['type'],
                                        N: ((100/controller.mony)*double.parse(controller.data_in[index]['price'])).toString().substring(0,4)
                                  );
                                }),
                      );
                    })),
            btn("اصدار مقترح للقسمه", co2, 22, true, () {
              Get.to(() => Proposals());
            }),
            btn("أختيار يدوي للموروث", co2, 22, true, () {Get.to(() => Check_Items());}),
          ],
        ));
  }
}
