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
  int sex = 0;
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
                    txt("ذكر", co1, fouesMale == false ? 25 : 35, true),
                    Radio(
                      value: "male",
                      groupValue: sex,
                      onChanged: (val) {
                        print(val);

                        setState(() {
                          sexstring = val as String;
                          sex = 1;
                          fouesMale = true;
                          fouesFamale = false;
                        });
                      },
                      activeColor: co1,
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    txt("أنثئ", co1, fouesFamale == false ? 25 : 35, true),
                    Radio(
                        activeColor: co1,
                        value: "famale",
                        groupValue: sex,
                        onChanged: (val) {
                          print(val);
                          setState(() {
                            sexstring = val as String;
                            sex = 0;
                            fouesMale = false;
                            fouesFamale = true;
                          });
                        }),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text_Field(c, TextInputType.name, "حصر وراثي", 5),
              SizedBox(
                height: 30,
              ),
              btn("التالي", co2, 25, true, () async {
                if (name_deat.text != "") {
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
