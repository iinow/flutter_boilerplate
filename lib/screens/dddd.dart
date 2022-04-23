import 'dart:convert';
import 'dart:io';

import 'package:flutter_example/common/mock/data.dart';

main() async {
  var s = faker.person.name();
  print(s);
  var data = await HttpClient().getUrl(Uri.parse('https://yesno.wtf/api'));
  var response = await data.close();
  var stringData = await response.transform(utf8.decoder).join();
  var map = jsonDecode(stringData);
  var obj = Person.fromJson(map);

  print('person obj: ${obj.answer}');

  data = await HttpClient()
      .getUrl(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
  response = await data.close();
  stringData = await response.transform(utf8.decoder).join();

  Iterable map2 = jsonDecode(stringData);
  var obj2 = List<Photo>.from(map2.map((e) => Photo.fromJson(e)));

  var ss = '';
  print('person obj: ${obj2.length}');
}

class Person {
  String answer;
  String image;
  bool forced;

  Person(this.answer, this.image, this.forced);

  Person.fromJson(Map<String, dynamic> json)
      : answer = json['answer'],
        image = json['image'],
        forced = json['forced'];
}

class Photo {
  num albumId;
  num id;
  String title;
  String url;
  String thumbnailUrl;

  Photo(this.albumId, this.id, this.title, this.url, this.thumbnailUrl);

  Photo.fromJson(Map<String, dynamic> json)
      : albumId = json['albumId'],
        id = json['id'],
        title = json['title'],
        url = json['url'],
        thumbnailUrl = json['thumbnailUrl'];
}
