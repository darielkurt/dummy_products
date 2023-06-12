import 'package:flutter/material.dart';

class ImagesSection extends StatelessWidget {
  final List imageUrls;
  const ImagesSection({required this.imageUrls, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemCount: imageUrls.length,
        itemBuilder: (ctx, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: NetworkImage(imageUrls[index]),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
