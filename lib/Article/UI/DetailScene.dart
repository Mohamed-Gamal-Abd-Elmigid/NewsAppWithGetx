import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:newsappgetx/core/model/ArticleModel.dart';

class DetailScene extends StatelessWidget {
  Result item;
  DetailScene(this.item);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${item.title}"),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Card(
                elevation: 2,
                child: Container(
                  height: 400,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                            item.multimedia[0].url,
                          ))),
                ),
              ),
              space(20),
              drawRow("Title :", item.title),
              space(20),
              drawRow("Abstract", item.resultAbstract),
              space(20),
              drawRow("Created Date",
                  DateFormat('yyyy/MM/dd').format(item.createdDate)),
              space(20),
              drawRow(
                "Published Date",
                DateFormat('yyyy/MM/dd').format(item.publishedDate),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget drawRow(String hint, String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(hint),
        SizedBox(
          width: 10,
        ),
        Flexible(
          child: Text(text),
        ),
      ],
    );
  }

  Widget space(double space) {
    return SizedBox(
      height: space,
    );
  }
}
