

import 'package:eventa_project/color.dart';
import 'package:eventa_project/controller/postar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final adsProvider = Provider<List<String>>((ref) => [
      'assets/images/test1.webp',
  'assets/images/test2.webp',
  'assets/images/eventa1.jpg',
  'assets/images/test1.webp',
    ]);

class DotsIndicator extends ConsumerWidget {
  const DotsIndicator({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(currentIndexProvider);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(
        ref.watch(adsProvider).length,
        (int index) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            margin: const EdgeInsets.symmetric(horizontal: 4.0),
            height: 8.0,
            width: 8.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: currentIndex == index ? Appcolor.mainColor : Colors.grey,
            ),
          );
        },
      ),
    );
  }
}
class Customveiwposter1 extends ConsumerStatefulWidget {
  const Customveiwposter1({super.key});

  @override
  Customveiwposter createState() => Customveiwposter();
}

class Customveiwposter extends ConsumerState<Customveiwposter1> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ads = ref.watch(adsProvider);
  

    ref.listen<int>(currentIndexProvider, (previous, next) {
      _pageController.animateToPage(
        next,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });

    return Column(
      children: [
        Expanded(
          child: PageView.builder(
            controller: _pageController,
            itemCount: ads.length,
            onPageChanged: (int index) {
              ref.read(currentIndexProvider.notifier);
            },
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 150,
                width: 250,
                margin: const EdgeInsets.symmetric(horizontal: 25.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                    image: AssetImage(ads[index]),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 10),
        const DotsIndicator(),
      ],
    );
  }
}
