import 'dart:io';

import 'package:dochome/utils/constants/image_strings.dart';
import 'package:dochome/utils/helpers/enums.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

abstract class CHelperFunctions {
  static void showSnackBar(
      {required context,
      required String message,
      StatusType type = StatusType.failure}) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: type == StatusType.failure ? Colors.red : Colors.green,
      ),
    );
  }

  static void showAlert(String title, String message, context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  static void navigateToScreen(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => screen),
    );
  }

  static String truncateText(String text, int maxLength) {
    if (text.length <= maxLength) {
      return text;
    } else {
      return '${text.substring(0, maxLength)}...';
    }
  }

  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  static double screenHeight(context) {
    return MediaQuery.of(context).size.height;
  }

  static double screenWidth(context) {
    return MediaQuery.of(context).size.width;
  }

  static String getFormattedDate(DateTime date, {String format = 'dd/MM/yyy'}) {
    return DateFormat(format).format(date);
  }

  static List<T> removeDuplicates<T>(List<T> list) {
    return list.toSet().toList();
  }

  static MediaType getMediaType(String file) {
    String extension = file.split(".").last;
    if (['jpg', 'png', 'jpeg', 'gif', 'bmp'].contains(extension)) {
      return MediaType.image;
    } else if (['mp4', 'mkv', 'avi', 'gif'].contains(extension)) {
      return MediaType.video;
    } else if (['mp3', 'wav'].contains(extension)) {
      return MediaType.audio;
    } else if (extension == "pdf") {
      return MediaType.pdf;
    } else {
      return MediaType.other;
    }
  }

  static String getMediaImage(MediaType? fileType) {
    return fileType == MediaType.video
        ? CImages.video
        : fileType == MediaType.audio
            ? CImages.audio
            : fileType == MediaType.pdf
                ? CImages.pdf
                : CImages.file;
  }

  static Future<File?> pickFile() async {
    XFile? file = await ImagePicker().pickMedia();
    return file == null ? null : File(file.path);
  }

  static Future<File?> pickImage() async {
    XFile? file =  await ImagePicker().pickImage(source: ImageSource.gallery);
    return file == null ? null : File(file.path);
  }
}
