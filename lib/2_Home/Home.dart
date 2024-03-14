import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mustafa/API/Api.dart';
import 'package:mustafa/API/Links.dart';
import 'package:mustafa/My_pro.dart';
import 'package:mustafa/SherdRefrance/shared_preferences.dart';

import '../3_Assets/Pages/MainAssets.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController name_deat = TextEditingController();
  TextEditingController c = TextEditingController();
  bool fouesMale = false;
  bool fouesFamale = false;
  int sex = 3;
  String sexstring = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
        width: full,
        child: SingleChildScrollView(
          child: Column(
            children: [
              myApper(),
              Text_Field(name_deat, TextInputType.name, "أسم المتوفي", 1),
              Container(
                width: full,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                        onTap: () {
                          setState(() {
                            sex = 1;
                            fouesMale = true;
                            fouesFamale = false;
                          });
                        },
                        child: Row(
                          children: [
                            txt("ذكر", co1, fouesMale == false ? 25 : 35, true),
                            Container(
                              padding: EdgeInsets.all(8),
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(200),
                                  border:
                                      Border.all(color: Colors.black, width: 2),
                                  color: sex == 1 ? co1 : Colors.white),
                            ),
                          ],
                        )),
                    const SizedBox(
                      width: 40,
                    ),
                    InkWell(
                        onTap: () {
                          setState(() {
                            sex = 0;
                            fouesMale = false;
                            fouesFamale = true;
                          });
                        },
                        child: Row(
                          children: [
                            txt("أنثئ", co1, fouesFamale == false ? 25 : 35,
                                true),
                            Container(
                              padding: EdgeInsets.all(8),
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(200),
                                  border:
                                      Border.all(color: Colors.black, width: 2),
                                  color: sex == 0 ? co1 : Colors.white),
                            ),
                          ],
                        )),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Text_Field(c, TextInputType.name, "حصر وراثي", 5),
              const SizedBox(
                height: 30,
              ),
              btn("التالي", co2, 25, true, () async {
                if (name_deat.text != "" && sex != 3) {
                  var ruslt = await Api.postData(
                      LinkApp.Death, {"name": name_deat.text, "sex": '$sex'});
                  if (ruslt["status"] == "true") {
                    shared.setData(shared.key_Name, name_deat.text);
                    Get.off(MainAssts(name_Death: name_deat.text));
                  }
                } else {
                  Get.snackbar("تنبيه", "أدخل البيانات اولآ",
                      backgroundColor: Colors.grey, colorText: co2);
                }
              })
            ],
          ),
        ),
      )),
    );
  }
}
