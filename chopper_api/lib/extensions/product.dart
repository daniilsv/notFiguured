import 'package:chopper_api/api/swagger_api.swagger.dart';

extension DiaryProductExt on DiaryProduct {
  ProductSimpleModel get toSimple {
    return ProductSimpleModel(
      id: productId,
      name: name,
      protein: protein,
      fat: fat,
      carbon: carb,
      calorie: calorie,
      categoryId: categoryId,
      categoryName: categoryName,
      portionSizeId: portionSizeId,
      portionSize: portionWeight*100,
      portionTypeId: portionTypeId,
    );
  }
}
