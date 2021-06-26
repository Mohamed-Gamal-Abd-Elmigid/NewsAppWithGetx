import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:newsappgetx/core/model/ArticleModel.dart';

class NetworkProvider {
  final URL =
      "https://api.nytimes.com/svc/topstories/v2/home.json?api-key=3mh2JkNo6RqrYZxAnNmdyvLdFnKBMfh9";

  Future<List<Result>> getResults() async {
    Uri uri = Uri.parse(URL);

    http.Response response = await http.get(
      uri,
    );

    if (response.statusCode == 200) {
      var body = json.decode(response.body);
      var jsonArticle = body['results'];
      List<Result> results = [];
      for (var item in jsonArticle) {
        results.add(Result.fromJson(item));
      }
      print(results.length);
      return results;
    } else {
      print("Error");
    }
  }
}
