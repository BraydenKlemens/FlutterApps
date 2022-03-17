import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SurveyTool extends StatefulWidget {
  const SurveyTool({ Key? key, required this.survey_url}) : super(key: key);
  final String survey_url;
  @override
  _SurveyToolState createState() => _SurveyToolState();
}

class _SurveyToolState extends State<SurveyTool> {
  late WebViewController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UofG Survey Tool', style: TextStyle(fontSize: 20)),
        backgroundColor: const Color.fromARGB(255, 26, 25, 25),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => controller.reload(),
          )
        ],
      ),
      body: WebView(
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl: 'https://uoguelph.eu.qualtrics.com/jfe/form/SV_0dYKo3NuYi1oVpk',
        onWebViewCreated: (controller) {
          this.controller = controller;
        },
      )
    );
  }
}