import 'package:flutter/material.dart';
import 'package:foo_delivery/utils/dimensions.dart';

// ignore: must_be_immutable
class BigText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  //Matn to'lib ketganda .. qo'yish uchun ihslatiladi
  TextOverflow overflow;

  BigText({
    Key? key,
    this.color = const Color(0xFF332d2b),
    required this.text,
    this.size = 0,
    this.overflow = TextOverflow.ellipsis, // widget ichiga siqmay qolsa .. nuqta qo'yib beradi
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1, // Joy tashlab beradi
      overflow: overflow,
      style: TextStyle(
        fontFamily: 'Roboto',
        fontSize: size == 0 ? Dimensions.font20 : size,
        color: color,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
