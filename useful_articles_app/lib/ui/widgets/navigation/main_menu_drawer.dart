import 'package:flutter/material.dart';
import 'package:useful_articles_app/localization/localization.dart';
import 'package:useful_articles_app/services/locator.dart';
import 'package:useful_articles_app/ui/router/app_router.dart';

class MainMenuDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    L10n l10n = L10n.of(context)!;
    AppRouter router = locator<AppRouter>();

    return Drawer(
      child: ListView(
        children: [
          ListTile(
            title: Text(l10n.translate("home")),
            onTap: () => router.replaceNamed("/home")
          ),
          ListTile(
              title: Text(l10n.translate("account")),
              onTap: () => router.replaceNamed("/account")
          ),
        ],
      ),
    );
  }
}
