import 'package:flutter/material.dart';

abstract class AppButtonStyle {
  static ButtonStyle linkButton = ButtonStyle(
                foregroundColor: MaterialStateProperty.all(const Color(0xFF01B4E4)),
                textStyle: MaterialStateProperty.all(
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.w400)
                ),
                overlayColor: MaterialStateProperty.all(const Color.fromARGB(76, 109, 216, 245)),
                shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7)
                      )
                    ),
              );
}