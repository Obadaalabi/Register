import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:register/src/register/presentation/controllers/trans_provider_manager.dart';
import 'package:resize/resize.dart';

List<String> items = [
  'Home page',
  'Services',
  'About us ',
  'Contact',
  'Registration',
];

Widget listTabbar(BuildContext context) {
  return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: items.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (ctx, index) {
        return Consumer(
            // 2. specify the builder and obtain a WidgetRef
            builder: (_, WidgetRef ref, __) {
          return GestureDetector(
              onTap: () {
                ref.read(currentTabProvider.notifier).state = index;
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 10),
                margin: const EdgeInsets.all(5),
                width: 7.vw,
                height: 4.vh,
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            color: ref.watch(currentTabProvider) == index
                                ? const Color(0xffEE9CDA)
                                : Colors.white,
                            width: 0.3.vw))),
                child: Center(
                  child: Text(
                    items[index],
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 4.sp),
                  ),
                ),
              ));
        });
      });
}
