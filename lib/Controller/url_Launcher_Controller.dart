import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLauncherController extends GetxController{
  void urlLauncher(String url){
    final Uri uri = Uri.parse(url);
    launchUrl(uri);
  }
}