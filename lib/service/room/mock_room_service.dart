import 'package:flutter_example/common/config/environment.dart';
import 'package:flutter_example/common/mock/data.dart';
import 'package:flutter_example/models/room.dart';
import 'package:flutter_example/service/i_room_service.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: IRoomService, env: [Profile.mock])
class MockRoomService implements IRoomService {
  @override
  List<Room> findRooms() => createRooms();
}
