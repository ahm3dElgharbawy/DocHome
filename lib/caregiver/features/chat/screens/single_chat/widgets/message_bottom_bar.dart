import 'dart:math';

import 'package:dochome/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class CMessageBottomBar extends StatelessWidget {
  const CMessageBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    final messageController = TextEditingController();
    return Card(
      color: Colors.grey[200],
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
          IconButton(
            onPressed: () {},
            splashRadius: 22,
            icon: Transform.rotate(
              angle: -pi / 4,
              child: const Icon(
                Icons.attachment_rounded,
                size: 30,
                color: CColors.primary,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: TextField(
                controller: messageController,
                maxLines: 2,
                minLines: 1,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  isDense: true,
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Type a message...",
                  contentPadding: const EdgeInsets.only(
                    right: 16,
                    left: 20,
                    bottom: 10,
                    top: 10,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(color: Color(0xffE7E7E7)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                ),
              ),
            ),
          ),
          IconButton(
            splashRadius: 22,
            onPressed: () {},
            icon: const Icon(
              Icons.send,
              size: 26,
              color: CColors.primary,
            ),
          ),
        ]),
      ),
    );
  }
}
