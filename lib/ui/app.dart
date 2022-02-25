import 'package:notfiguured/app/breakpoints.dart';
import 'package:notfiguured/l10n/generated/l10n.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_offline/flutter_offline.dart';

import 'theme/theme.dart';
import 'views/splash/splash_view.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      theme: const CupertinoThemeData(brightness: Brightness.light),
      debugShowCheckedModeBanner: false,
      supportedLocales: Strings.delegate.supportedLocales,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        Strings.delegate
      ],
      navigatorObservers: [
        FirebaseAnalyticsObserver(analytics: FirebaseAnalytics()),
      ],
      builder: (context, child) {
        child = OfflineBuilder(
          connectivityBuilder: (context, connectivity, child) {
            final bool connected = connectivity != ConnectivityResult.none;
            if (connected) return child;
            return Column(
              children: [
                Container(
                  color: AppColors.error,
                  alignment: Alignment.center,
                  child: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Интернет недоступен.\nПроверьте подключение к сети.',
                        style: [AppStylesSmall.body3Medium, AppStylesBig.body3Medium]
                            .byHeight
                            .copyWith(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                Expanded(child: child),
              ],
            );
          },
          child: child,
        );

        if (BreakPoints.overrided != true) return child;
        return MediaQuery(
          data: MediaQueryData(size: BreakPoints.size),
          child: SizedBox(
            width: BreakPoints.size.width,
            height: BreakPoints.size.height,
            child: child,
          ),
        );
      },
      home: const SplashScreen(),
    );
  }
}
