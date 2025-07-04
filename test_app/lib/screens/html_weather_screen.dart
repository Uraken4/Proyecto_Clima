// Ejemplo de pantalla Flutter para mostrar el HTML y pasar variables de entorno de forma segura

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_html/flutter_html.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HtmlWeatherScreen extends StatefulWidget {
  const HtmlWeatherScreen({Key? key}) : super(key: key);

  @override
  State<HtmlWeatherScreen> createState() => _HtmlWeatherScreenState();
}

class _HtmlWeatherScreenState extends State<HtmlWeatherScreen> {
  late final WebViewController _controller;
  String? htmlContent;

  @override
  void initState() {
    super.initState();
    if (kIsWeb) {
      // Para Flutter Web: carga el HTML como string
      rootBundle.loadString('assets/pronostico.html').then((value) {
        setState(() {
          htmlContent = value;
        });
      });
    } else {
      // Para plataformas nativas: usa WebView
      final apiKey = dotenv.env['API_KEY'] ?? '';
      final apiUrl = dotenv.env['API_URL'] ?? '';
      _controller = WebViewController()
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..loadFlutterAsset('assets/pronostico.html');
      Future.delayed(const Duration(milliseconds: 500), () {
        _controller.runJavaScript('''
          window.API_KEY = "$apiKey";
          window.API_URL = "$apiUrl";
          if (typeof obtenerClima === "function") obtenerClima();
        ''');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pronóstico HTML')),
      body: kIsWeb
          ? (htmlContent == null
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(child: Html(data: htmlContent)))
          : WebViewWidget(controller: _controller),
    );
  }
}