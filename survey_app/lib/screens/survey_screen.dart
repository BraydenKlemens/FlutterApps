import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../modals/survey.dart';
import '../providers/app_provider.dart';

class SurveyTool extends StatefulWidget {
  const SurveyTool({ Key? key, required this.survey, required this.index}) : super(key: key);
  final Survey survey;
  final int index;
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
        initialUrl: widget.survey.url,
        onWebViewCreated: (controller) {
          this.controller = controller;
        },
        onPageFinished: (String currentPage){
          //This means the survey has finished and we can update the state
          if(currentPage == 'https://qemg.uoguelph.ca/thank-you/'){
            Provider.of<AppProvider>(context, listen: false).completeSurvey(widget.index);
          }
        },
      )
    );
  }
}