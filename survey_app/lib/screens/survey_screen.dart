import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SurveyTool extends StatefulWidget {
  const SurveyTool({ Key? key, required this.surveyUrl}) : super(key: key);
  final String surveyUrl;
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
        initialUrl: widget.surveyUrl,
        onWebViewCreated: (controller) {
          this.controller = controller;
        },
        onPageFinished: (String currentPage){
          //This means the survey has finished and we can update the state
          if(widget.surveyUrl == currentPage){
            //update providers
          }
        },
      )
    );
  }
}