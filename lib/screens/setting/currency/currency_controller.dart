import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:translation/api/currencyapi.dart';

class CurrencyController extends GetxController {
  
  RxString selectedCurrency = ' '.obs;
  RxBool isLoading = false.obs;
  final apiService = ApiService();
  final box = GetStorage();

  Future<void> updateSelectedCurrency(String current) async {
    
     
    selectedCurrency.value = current;
    isLoading.value = true;

    try {
      final response = await ApiService().storeCurrency(current, box);

      print(response.data);
      isLoading.value = false;
      // update(selectedCurrency as List<Object>?);
    } on Exception catch (error) {
      isLoading.value = false;
    }
  }
}
