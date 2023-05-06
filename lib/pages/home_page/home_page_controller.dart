import 'package:atmosfer/core/api/api_constants.dart';
import 'package:atmosfer/models/job_model.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  final List<Job> jobs = [];
  bool loading = false;

  @override
  void onInit() {
    loadJobs();
    super.onInit();
  }

  Future<void> loadJobs() async {
    loading = true;
    update();
    var response = await APIConstants.sendGet(
      APIConstants.getJobsUrl,
    );
    loading = false;

    update();
    if (response.statusCode != 200) return;
    if (response.data is! List) return;

    for (var element in response.data) {
      jobs.add(
        Job.fromMap(
          element,
        ),
      );
    }
    update();
  }
}
