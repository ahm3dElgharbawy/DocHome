import 'package:flutter/material.dart';

class ChatBotTextField extends StatelessWidget {
  const ChatBotTextField(
      {super.key, required this.onSend, required this.controller});
  final VoidCallback onSend;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xff2F2F2F),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: controller,
              cursorColor: const Color(0xffECECEC),
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "Ask a question",
                  hintStyle: TextStyle(color: Color(0xADECECEC))),
              style: const TextStyle(color: Color(0xffECECEC)),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xff676767),
            ),
            height: 35,
            width: 35,
            child: Material(
              color: Colors.transparent,
              shape: CircleBorder(),
              clipBehavior: Clip.hardEdge,
              child: IconButton(
                padding: EdgeInsets.zero,
                splashRadius: 30,
                onPressed: onSend,
                icon: const Icon(
                  Icons.keyboard_arrow_up_rounded,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}