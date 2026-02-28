import '../../service/api_url.dart';
import '../../utils/app_images/app_images.dart';

class ImageHandler{
  static String imagesHandle(String? url) {
    if (url == null || url.isEmpty) {
      return AppImages.vectorImage;
    }

    if (url.startsWith('http')) {
      return url; // If the URL starts with 'http', return as is
    } else {
      return ApiUrl.imageUrl + url;
    }
  }
}