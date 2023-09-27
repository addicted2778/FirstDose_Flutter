import 'package:carousel_slider/carousel_controller.dart';
import 'package:firstdose/app/data/appnavigation.dart';
import 'package:firstdose/app/data/localdata.dart';
import 'package:firstdose/app/models/intromodel.dart';
import 'package:get/get.dart';

class IntroscreenController extends GetxController {
  CarouselController carouselController = CarouselController();
  final appLocalData = AppLocalData();
  RxInt currentIndex = 0.obs;
  List<IntroModel> introdata = [
    IntroModel(
        introimg: 'assets/images/introimg3.png',
        title: '    Your Medicine In Your \nHand. Anytime - Anywhere',
        content:
            '    Order Medicine and get delivery in the \n               fastest time on your door.'),
    IntroModel(
        introimg: 'assets/images/introimg2.png',
        title: '         Get The Fastest \nMedicine Delivery For You',
        content:
            '    Order Medicine and get delivery in the\n                fastest time on your door.')
  ];
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  selectedindex(int index) {
    currentIndex.value = index;
  }

  proceedtonext(int index) {
    if (index == 0) {
      carouselController.animateToPage(1);
    } else {
      appLocalData.saveIntroInfo();

      Appnavigations.gotoLoginFromonBoarding();
    }
  }
}
