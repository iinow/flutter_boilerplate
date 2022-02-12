// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../service/i_room_service.dart' as _i3;
import '../../service/room/mock_room_service.dart' as _i5;
import '../../service/room/room_service.dart' as _i4;

const String _local = 'local';
const String _dev = 'dev';
const String _prod = 'prod';
const String _mock = 'mock';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.IRoomService>(() => _i4.RoomService(),
      registerFor: {_local, _dev, _prod});
  gh.factory<_i3.IRoomService>(() => _i5.MockRoomService(),
      registerFor: {_mock});
  return get;
}
