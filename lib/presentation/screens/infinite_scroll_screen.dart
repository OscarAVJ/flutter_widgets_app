import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiniteScrollScreen extends StatefulWidget {
  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {
  List<int> imagesId = [1, 2, 3, 4, 5];
  ScrollController scrollController = ScrollController();
  bool isLoading = false;

  ///Esta variable sirve para verificar que no se realice alguna peticion cuando se salga del widget
  bool isMounted = true;
  @override
  void initState() {
    ///Manejo del scroll
    super.initState();
    scrollController.addListener(() {
      if ((scrollController.position.pixels + 300) >=
          scrollController.position.maxScrollExtent) {
        loadNextPage();
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    isMounted = false;
    super.dispose();
  }

  Future loadNextPage() async {
    if (isLoading) return;
    isLoading = true;
    setState(() {});
    await Future.delayed(Duration(seconds: 2));
    addFiveImages();
    isLoading = false;
    scrollController.animateTo(
      scrollController.position.pixels + 100,
      duration: Duration(milliseconds: 300),
      curve: Curves.bounceInOut,
    );
    if (!isMounted) return;
    setState(() {});
  }

  void addFiveImages() {
    final lasImage = imagesId.last;
    imagesId.addAll([1, 2, 3, 4, 5].map((e) => e + lasImage));
  }

  void goDown() {
    if (!isMounted) return;
    scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      duration: Duration(milliseconds: 300),
      curve: Curves.bounceIn,
    );
  }

  void goUp() {
    if (!isMounted) return;
    scrollController.animateTo(
      (scrollController.position.maxScrollExtent -
              scrollController.position.maxScrollExtent) +
          1,
      duration: Duration(milliseconds: 300),
      curve: Curves.bounceIn,
    );
  }

  Future<void> pullToRefresh() async {
    if (isLoading) return;
    if (!isMounted) return;
    isLoading = true;
    setState(() {});
    final lastId = imagesId.last;
    print('Hola soy 2 $lastId');
    await Future.delayed(Duration(seconds: 3));
    isLoading = false;
    imagesId.clear();
    imagesId.add(lastId + 1);
    addFiveImages();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MediaQuery.removePadding(
        removeTop: true,
        context: context,
        child: RefreshIndicator(
          onRefresh: pullToRefresh,
          child: _ImagesListView(
            scrollController: scrollController,
            imagesId: imagesId,
          ),
        ),
      ),
      floatingActionButton: _FloationActionButtons(
        goUp: goUp,
        goDown: goDown,
        isLoading: isLoading,
      ),
    );
  }
}

class _ImagesListView extends StatelessWidget {
  const _ImagesListView({
    required this.scrollController,
    required this.imagesId,
  });

  final ScrollController scrollController;
  final List<int> imagesId;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: scrollController,
      physics: BouncingScrollPhysics(),
      itemCount: imagesId.length,
      itemBuilder: (context, index) {
        return FadeInImage(
          fit: BoxFit.cover,
          width: double.infinity,
          height: 300,
          placeholder: AssetImage('assets/images/jar-loading.gif'),
          image: NetworkImage(
            'https://picsum.photos/id/${imagesId[index]}/200/300',
          ),
        );
      },
    );
  }
}

// ignore: must_be_immutable
class _FloationActionButtons extends StatelessWidget {
  VoidCallback goUp;
  VoidCallback goDown;
  bool isLoading;
  _FloationActionButtons({
    required this.goUp,
    required this.goDown,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        FloatingActionButton(
          heroTag: null,
          onPressed: goUp,
          child: Icon(Icons.arrow_upward),
        ),
        SizedBox(height: 10),
        FloatingActionButton(
          heroTag: null,
          onPressed: context.pop,
          child: isLoading == true
              ? Spin(infinite: true, child: Icon(Icons.refresh_rounded))
              : FadeIn(child: Icon(Icons.arrow_back)),
        ),
        SizedBox(height: 10),
        FloatingActionButton(
          heroTag: null,
          onPressed: goDown,
          child: Icon(Icons.arrow_downward),
        ),
      ],
    );
  }
}
