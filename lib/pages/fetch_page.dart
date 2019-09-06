import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

class FetchPageHeader implements SliverPersistentHeaderDelegate {
  FetchPageHeader({
    this.minExtent,
    @required this.maxExtent,
  });
  final double maxExtent;
  final double minExtent;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          'assets/ronnie-mayo-361348-unsplash.jpg',
          fit: BoxFit.cover,
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.transparent,
                Colors.black54,
              ],
              stops: [0.5, 1.0],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              tileMode: TileMode.repeated,
            ),
          ),
        ),
        Positioned(
          left: 16.0,
          right: 16.0,
          bottom: 16.0,
          child: Text(
            'Lorem ipsum',
            style: TextStyle(
              fontSize: 32.0,
              color:
                  Colors.white /*.withOpacity(1.0 - shrinkOffset / maxExtent)*/,
            ),
          ),
        ),
      ],
    );
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  @override
  FloatingHeaderSnapConfiguration get snapConfiguration => null;
}

class FetchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _scrollView(context),
    );
  }

  Widget _scrollView(BuildContext context) {
    // Use LayoutBuilder to get the hero header size while keeping the image aspect-ratio
    return Container(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverPersistentHeader(
            pinned: true,
            delegate: FetchPageHeader(
              minExtent: 150.0,
              maxExtent: 250.0,
            ),
          ),
          FetchContent(),
          // SliverFillRemaining(
          //   child: Center(
          //     child: Text(
          //       'No Content',
          //       style: Theme.of(context).textTheme.headline,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}

class FetchContent extends StatefulWidget {
  @override
  _FetchContentState createState() => _FetchContentState();
}

class _FetchContentState extends State<FetchContent> {
  Future<String> _loader;
  bool _shouldFail = false;

  // mock function to load some data or fail after some delay
  Future<String> getData(bool shouldFail) async {
    await Future<void>.delayed(Duration(seconds: 3));
    if (shouldFail) {
      throw PlatformException(code: '404');
    }
    return 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?';
  }

  void _retry() {
    // update loader
    _loader = getData(!_shouldFail);
    setState(() => _shouldFail = !_shouldFail);
  }

  @override
  void initState() {
    super.initState();
    _loader = getData(_shouldFail);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: _loader,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SliverFillRemaining(
            child: Center(child: CircularProgressIndicator()),
          );
        }
        if (snapshot.hasError) {
          return SliverFillRemaining(
            child: TextAndButton(
              content: 'An error occurred',
              buttonText: 'Retry',
              onPressed: _retry,
            ),
          );
        }
        if (snapshot.hasData) {
          return SliverToBoxAdapter(
            child: TextAndButton(
              content: snapshot.data,
              buttonText: 'Reload',
              onPressed: _retry,
            ),
          );
        }
        return SliverFillRemaining(
          child: Center(child: Text('No Content')),
        );
      },
    );
  }
}

class TextAndButton extends StatelessWidget {
  const TextAndButton({Key key, this.content, this.buttonText, this.onPressed})
      : super(key: key);
  final String content;
  final String buttonText;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            content,
            style: Theme.of(context).textTheme.headline,
          ),
          RaisedButton(
            color: Theme.of(context).primaryColor,
            child: Text(buttonText,
                style: Theme.of(context)
                    .textTheme
                    .headline
                    .copyWith(color: Colors.white)),
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}
