import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mustafa/6_Proposals/Widget/Card.dart';
import 'package:mustafa/My_pro.dart';
import 'Controller_Check_Items.dart';

class Check_Items extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Controller_Check_Items controller = Get.put(Controller_Check_Items());
    controller.Get_Data_Inheritance();
    controller.Get_Items();

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
            const Text(
              "مقترح للقسمه",
              style: TextStyle(fontSize: 35),
            ),
            Expanded(
                child: Container(
              child:
                   GetBuilder(
                      init: Controller_Check_Items(),
                      builder: (context) => controller.lodding
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : ListView.builder(
                              itemCount: controller.data_In.length,
                              itemBuilder: (context, index) => Card_Proposals(
                                  name: controller.data_In[index]["Inh_name"],
                                  type: controller.data_In[index]["type"],
                                  price: controller.data_In[index]["price"],
                                  widget: controller.Get_All_Items_C(
                                      double.parse(
                                          controller.data_In[index]["price"]))),
                            ),
                    ),
            )),
            btn("التقارير", co2, 22, true, () {}),
          ],
        ));
  }
}
