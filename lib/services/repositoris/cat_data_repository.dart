import '../../models/cat_data_model.dart';
import '../apis/cat_api.dart';

class CatDataRepository {
  Future<List<CatData>> getCatData() async {
    final response = await CatAPI().getData();
    List<CatData> listCat = (response as List<dynamic>)
        .map((e) => CatData.fromMap(e as Map<String, dynamic>))
        .toList();

    return listCat;
  }
}
