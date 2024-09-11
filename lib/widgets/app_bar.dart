import 'package:flutter/material.dart';

class XAppBar extends StatelessWidget {
  const XAppBar({
    super.key,
    required this.title,
    this.icon,
    this.action,
  });

  final String title;
  final Icon? icon;
  final Function()? action;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.blueGrey,
      ),
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 12,
          ),
          child: Row(
            children: [
              if (icon != null)
                GestureDetector(
                  onTap: action,
                  child: icon,
                ),
              Expanded(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        height: 1.5,
                        letterSpacing: -0.75,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: icon?.size ?? 0,
              )
            ],
          ),
        ),
      ),
    );
  }
}
