import 'package:collection/collection.dart';
import 'package:concert_list_app/domain/model/concert.dart';
import 'package:concert_list_app/domain/model/concert_detail.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveService {
  final String boxName = 'archived';
  Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter<ConcertDetail>(ConcertDetailImplAdapter());
    await Hive.openBox<ConcertDetail>(boxName);
  }

  Future<void> openBox() async {
    Hive.openBox<ConcertDetail>(boxName);
  }

  Future<List<ConcertDetail>> getArchivedConcertList() async {
    return Hive.box<ConcertDetail>(boxName).values.toList();
  }

  Future<void> addArchivedConcert({required ConcertDetail concertDetail}) async {
    await Hive.box<ConcertDetail>(boxName).add(concertDetail);
  }

  Future<void> deleteArchivedConcert({required ConcertDetail concertDetail}) async {
    final index = Hive.box<ConcertDetail>(boxName).values.toList().indexWhere((element) => element.id == concertDetail.id);
    await Hive.box<ConcertDetail>(boxName).deleteAt(index);
  }

  bool isStillContain({required ConcertDetail concertDetail}) {
    final thisConcertDetail = Hive.box<ConcertDetail>(boxName).values.firstWhereOrNull((element) => element.id == concertDetail.id);

    if (thisConcertDetail == null) return false;
    if (thisConcertDetail.id == concertDetail.id) return true;
    return false;
  }
}