import 'package:flutter/material.dart';

/// Localization import
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset("assets/images/radio_image.png"),
        Text(
          AppLocalizations.of(context)!.quraan_radio,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Row(
            textDirection: TextDirection.ltr,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {},
                icon: const ImageIcon(
                  AssetImage("assets/images/icon-prev.png"),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const ImageIcon(
                  AssetImage("assets/images/icon-play.png"),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const ImageIcon(
                  AssetImage("assets/images/icon-next.png"),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
