import 'package:flutter_example/models/room.dart';
import 'package:injectable/injectable.dart';

abstract class IRoomService {
  List<Room> findRooms();
}
