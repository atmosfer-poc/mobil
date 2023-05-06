import 'package:atmosfer/core/api/api_constants.dart';
import 'package:atmosfer/models/job_detail_model.dart';
import 'package:atmosfer/models/job_model.dart';
import 'package:get/get.dart';

class JobDetailPageController extends GetxController {
  Job job;
  JobDetailModel? jobDetailModel;
  bool loading = false;

  JobDetailPageController({
    required this.job,
  });

  @override
  void onInit() {
    loadJobDetail();
    super.onInit();
  }

  Future<void> loadJobDetail() async {
    loading = true;
    update();
    String path = APIConstants.getJobDetailUrl.replaceAll(
      "<id>",
      job.id.toString(),
    );
    loading = false;
    update();
    var response = await APIConstants.sendGet(
      path,
    );

    if (response.statusCode != 200) return;

    jobDetailModel = JobDetailModel.fromMap(response.data);
    update();
  }
}
