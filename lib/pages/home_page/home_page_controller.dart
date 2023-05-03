import 'package:atmosfer/models/job_model.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  final List<Job> jobs = [];

  @override
  void onInit() {
    jobs.addAll(
      [
        Job(id: 1, title: "İletişim Danışmanı"),
        Job(id: 2, title: "Kasa Sorumlusu"),
        Job(id: 3, title: "Mağaza Müdürü"),
      ],
    );
    super.onInit();
  }
}
