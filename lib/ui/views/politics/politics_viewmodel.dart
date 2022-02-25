import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:native_pdf_renderer/native_pdf_renderer.dart';
import 'package:stacked/stacked.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import 'politics_view.dart';

class PoliticsViewModel extends BaseViewModel {
  NavigatorState navigator;

  PoliticsViewModel(BuildContext context) {
    navigator = Navigator.of(context);
    final dep = context.read<PoliticsRouteDependency>();
    needAccept = dep?.withAccept ?? true;
  }

  bool needAccept;
  PdfDocument politics;
  List<Uint8List> politicsPages = [];


  void onReady() {
    gettingPoltics();
  }

  Future gettingPoltics() async {
    setBusy(true);
    politicsPages = [];
    final data = await http
        .get('https://some.ru/Content/Files/politika_konfidentsialnosti.pdf');
    final bytes = data.bodyBytes;
    politics = await PdfDocument.openData(bytes);

    for (int i = 1; i <= politics.pagesCount; i++) {
      final page = await politics.getPage(i);
      final pageImage = await page.render(
          width: page.width * 3,
          height: page.height * 3,
          backgroundColor: '#FFFFFF');
      politicsPages.add(pageImage.bytes);
      await page.close();
    }
    setBusy(false);
    notifyListeners();
  }

  void done() => navigator.pop(true);
}
