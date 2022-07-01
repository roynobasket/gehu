import 'package:flutter/material.dart';
import 'package:pdf_render/pdf_render_widgets.dart';

// class Images extends StatelessWidget {
//   const Images({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return new MaterialApp(
//         home: new Scaffold(
//             appBar: new AppBar(
//               title: const Text('Fee Structure'),
//             ),
//             backgroundColor: Colors.grey,
//             body: PdfViewer.openAsset('assets/fee.pdf')
//         )
//     );
//   }
// }

class Images extends StatefulWidget {
  const Images({Key? key}) : super(key: key);

  @override
  _Images createState() => _Images();
}

class _Images extends State<Images> {
  final controller = PdfViewerController();
  TapDownDetails? _doubleTapDetails;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: ValueListenableBuilder<Matrix4>(
            // The controller is compatible with ValueListenable<Matrix4> and you can receive notifications on scrolling and zooming of the view.
              valueListenable: controller,
              builder: (context, _, child) =>
                  Text(controller.isReady ? 'Page #${controller.currentPageNumber}' : 'Page -')),
        ),
        backgroundColor: Colors.grey,
        body: GestureDetector(
          // Supporting double-tap gesture on the viewer.
          onDoubleTapDown: (details) => _doubleTapDetails = details,
          onDoubleTap: () => controller.ready?.setZoomRatio(
            zoomRatio: controller.zoomRatio * 1.5,
            center: _doubleTapDetails!.localPosition,
          ),
          child: PdfViewer.openAsset(
            'assets/fee.pdf',
            viewerController: controller,
            onError: (err) => print(err),
            params: const PdfViewerParams(
              padding: 10,
              minScale: 1.0,
              // scrollDirection: Axis.horizontal,
            ),
          ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FloatingActionButton(
              child: const Icon(Icons.first_page),
              onPressed: () => controller.ready?.goToPage(pageNumber: 1),
            ),
            FloatingActionButton(
              child: const Icon(Icons.last_page),
              onPressed: () => controller.ready?.goToPage(pageNumber: controller.pageCount),
            ),
          ],
        ),
      ),
    );
  }
}