import 'package:faker/faker.dart';
import 'package:flutter_example/models/room.dart';

var faker = Faker();

String name() => faker.person.name();

List<Room> createRooms() => List.generate(
    faker.randomGenerator.integer(10, min: 4),
    (_) => Room(name: faker.company.name()));
