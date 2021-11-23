import 'package:a_sync/widgets/custom_button_widget.dart';
import 'package:flutter/material.dart';

import '../controllers/posts_controller.dart';

class OnePage extends StatefulWidget {
  const OnePage({Key? key}) : super(key: key);

  @override
  State<OnePage> createState() => _OnePageState();
}

class _OnePageState extends State<OnePage> {
  final PostsController _controller = PostsController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
                animation:
                    Listenable.merge([_controller.posts, _controller.inLoader]),
                builder: (_, __) => _controller.inLoader.value
                    ? CircularProgressIndicator()
                    : ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: _controller.posts.value.length,
                        itemBuilder: (_, idx) => ListTile(
                            title: Text(_controller.posts.value[idx].title)),
                      )),
            SizedBox(height: 12),
            CustomButtonWidget(
                disable: false,
                titleSize: 18,
                onPressed: () => _controller.callAPI(),
                title: 'Get API'),
          ],
        ),
      )),
    );
  }
}
