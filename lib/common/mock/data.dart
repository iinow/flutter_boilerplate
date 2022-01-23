import 'package:faker/faker.dart';

var faker = Faker();

String name() {
  return faker.person.name();
}
