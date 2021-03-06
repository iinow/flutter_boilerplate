import 'package:flutter_example/common/config/environment.dart';
import 'package:flutter_example/models/room.dart';
import 'package:flutter_example/service/i_room_service.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: IRoomService, env: [Profile.local, Profile.dev, Profile.prod])
class RoomService implements IRoomService {
  @override
  List<Room> findRooms() => [Room(name: 'room1'), Room(name: 'room2')];
}
