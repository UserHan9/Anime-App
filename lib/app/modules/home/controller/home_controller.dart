import 'package:get/get.dart';
import '../../../data/model/anime.dart';
import '../../../service/api_service.dart';

class HomeController extends GetxController {
  final ApiService _apiService = ApiService();

  final isLoading = false.obs;
  final animeList = <Anime>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchTopAnime();
  }

  Future<void> fetchTopAnime() async {
    try {
      isLoading.value = true;
      final response = await _apiService.getTopAnime();
      animeList.assignAll(response.data);
    } catch (_) {
      Get.snackbar('Error', 'Failed to load anime');
    } finally {
      isLoading.value = false;
    }
  }
}
