import 'package:flutter/material.dart';

import '../../../data/breed.dart';
import '../../../navigator.dart';

class BreedListItem extends StatelessWidget {
  const BreedListItem({
    super.key,
    required this.breed,
  });

  final Breed breed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        XNavigator.goToBreedDetails(context, breed: breed);
      },
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        margin: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: Text(
                breed.name.toUpperCase(),
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  letterSpacing: -0.3,
                ),
              ),
            ),
            const SizedBox(width: 8),
            const Icon(
              Icons.arrow_forward_ios,
              size: 22,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
