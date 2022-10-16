import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:fwc_album_app/app/core/rest/custom_dio.dart';
import 'package:fwc_album_app/app/models/groups_stickers.dart';
import 'package:fwc_album_app/app/repositories/stickers/stickers_repository.dart';

class StickersRepositoryImpl implements StickersRepository {
  final CustomDio dio;

  StickersRepositoryImpl({
    required this.dio,
  });

  @override
  Future<List<GroupsStickers>> getMyAlbum() async {
    try {
      final result = await dio.auth().get('/api/countries');
      return result.data
          .map<GroupsStickers>((group) => GroupsStickers.fromMap(group))
          .toList();
    } on DioError catch (e, s) {
      log('Erro ao buscar album do usuário', error: e, stackTrace: s);
      throw ('Erro ao buscar album do usuário');
    }
  }
}
