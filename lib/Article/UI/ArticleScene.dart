import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:newsappgetx/Article/Controller/ArticleController.dart';
import 'package:newsappgetx/Article/UI/DetailScene.dart';

class ArticleScene extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ArticleCortoller>(
      init: Get.find(),
      builder: (controller) => controller.loading.value
          ? Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : Scaffold(
              appBar: AppBar(
                title: Text("NewsApp"),
                centerTitle: true,
                backgroundColor: Colors.teal,
              ),
              body: Container(
                // color: Colors.grey,
                padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                child: ListView.separated(
                  itemCount: controller.results.length,
                  physics: ClampingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Get.to(
                          DetailScene(controller.results[index]),
                        );
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 250,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: Colors.teal.shade200,
                        ),
                        child: Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Image.network(
                                "${controller.results[index].multimedia[0].url}",
                                fit: BoxFit.fill,
                              ),
                            ),
                            Divider(
                              color: Colors.grey,
                              thickness: 2,
                            ),
                            Divider(
                              height: 5,
                              color: Colors.grey,
                              thickness: 2,
                            ),
                            Center(
                              child: ListTile(
                                trailing: Column(
                                  children: [
                                    Text(
                                      DateFormat('yyyy/MM/dd').format(controller
                                          .results[index].publishedDate),
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      DateFormat('yyyy/MM/dd').format(controller
                                          .results[index].createdDate),
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                title: Text(
                                  '${controller.results[index].title}',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Text(
                                  '${controller.results[index].resultAbstract}',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 10,
                                  ),
                                ),
                                onTap: () {},
                                enabled: true,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider(
                      color: Colors.black,
                    );
                  },
                ),
              ),
            ),
    );
  }
}
