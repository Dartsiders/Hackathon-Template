import 'package:carousel_slider/carousel_controller.dart';
import 'package:mobx/mobx.dart';
part 'courses_view_model.g.dart';

class CoursesViewModel = _CoursesViewModelBase with _$CoursesViewModel;

abstract class _CoursesViewModelBase with Store {
  @observable
  CarouselController lessonCarouselController = CarouselController();
  @observable
  int lessonCarauselIndex = 0;

  @observable
  CarouselController quiz1CarouselController = CarouselController();
  @observable
  int quiz1CarauselIndex = 0;

  @observable
  int quiz1Puan = 0;
  
}
