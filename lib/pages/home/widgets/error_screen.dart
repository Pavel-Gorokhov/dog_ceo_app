import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({
    super.key,
    required this.message,
    this.code,
    required this.onRetry,
  });

  final String message;
  final String? code;
  final Function() onRetry;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  message,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    height: 1.5,
                    letterSpacing: -0.75,
                  ),
                ),
                const SizedBox(height: 36),
                GestureDetector(
                  onTap: onRetry,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 48,
                      vertical: 12,
                    ),
                    child: const Text(
                      'Retry',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        height: 1.5,
                        letterSpacing: -0.75,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (code != null)
            SafeArea(
              top: false,
              child: Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text(
                  code!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.5),
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    height: 1.5,
                    letterSpacing: -0.75,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
