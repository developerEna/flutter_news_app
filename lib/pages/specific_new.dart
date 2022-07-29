import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';


class SpecificNews extends StatefulWidget {

  String pageUrl;

  SpecificNews({required this.pageUrl});

  @override
  State<SpecificNews> createState() => _SpecificNewsState();
}

class _SpecificNewsState extends State<SpecificNews> {
  
  final Completer<WebViewController> _controller = Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('MY' ,
            style: TextStyle(
              color: Colors.white
            ),
            ),
            SizedBox(width: 2.0,),
            Text('NEWS', style: TextStyle(
              color: Colors.white
            ),
            ),
          ],
        ),
        actions: <Widget>[
          Opacity(
            opacity: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Icon(Icons.save),
            ),
            ),
        ],
        elevation: 0.0,
      ),
      body:  Container(
      child: WebView(
          initialUrl: widget.pageUrl,
          onWebViewCreated: ((WebViewController webViewController){
            _controller.complete(webViewController);
          }),
      ),
    ) ,
    );
  
  }
}