import 'package:flutter/material.dart';
import 'package:islami_app/providers/app_config_provider.dart';
import 'package:islami_app/utilities/mytheme.dart';
import 'package:provider/provider.dart';

class ContentCard extends StatelessWidget {
  final String name;
  final int? itemCount;
  final Widget? Function(BuildContext, int) itemBuilder;

  const ContentCard(
      {super.key,
      required this.name,
      required this.itemCount,
      required this.itemBuilder});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return Container(
      padding: const EdgeInsets.all(5),
      margin: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.06,
        vertical: MediaQuery.of(context).size.height * 0.04,
      ),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(25)),
        gradient: LinearGradient(
          colors: provider.isDarkMode(provider.appMode)
              ? [const Color(0x00141A2E), const Color(0xff141A2E)]
              : [Colors.white, Colors.white38],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
      child: Column(children: [
        Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.width * 0.06,
          ),
          child: Row(
            textDirection: TextDirection.ltr,
            children: [
              const Spacer(),
              Expanded(
                flex: 2,
                child: Text(
                  name,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              Expanded(
                  child: IconButton(
                iconSize: 40,
                onPressed: () {},
                icon: const ImageIcon(
                  AssetImage("assets/images/Icon awesome-play-circle.png"),
                ),
              ))
            ],
          ),
        ),
        Divider(
          thickness: 3,
          color: MyTheme.primaryLightColor,
          endIndent: MediaQuery.of(context).size.width * 0.08,
          indent: MediaQuery.of(context).size.width * 0.08,
        ),
        Expanded(
            child: ListView.builder(
          itemCount: itemCount,
          itemBuilder: itemBuilder,
        ))
      ]),
    );
  }
}
