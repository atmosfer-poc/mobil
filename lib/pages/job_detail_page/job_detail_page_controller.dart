import 'package:atmosfer/models/job_detail_model.dart';
import 'package:atmosfer/models/job_model.dart';
import 'package:get/get.dart';

class JobDetailPageController extends GetxController {
  JobDetailModel jobDetailModel;
  Job job;
  JobDetailPageController({
    required this.job,
    required this.jobDetailModel,
  });
}
