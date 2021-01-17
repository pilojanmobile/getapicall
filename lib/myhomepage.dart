import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxflutterapicall/controller/appcontroller.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var controller = Get.put(AppController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: Obx(() {
            return controller.postloading.value
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemCount: controller.getposts.length,
                    itemBuilder: (context, index) {
                      var item = controller.getposts[index];
                      return Card(
                        child: ListTile(
                          title: Text(item.title),
                          subtitle: Text(item.body),
                          leading: Text(item.id.toString()),
                        ),
                      );
                    });
          }))
        ],
      ),
    );
  }
}
