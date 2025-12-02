import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

///CREAR CLASE

///LISTA DE CLASE
///
final slides = <Slides>[
  Slides(title: 'title', caption: 'dsad', imgPath: 'assets/images/1.png'),
  Slides(title: 'title', caption: 'dasd', imgPath: 'assets/images/2.png'),
  Slides(title: 'title', caption: 'dsad', imgPath: 'assets/images/3.png'),
];

class Slides {
  final String title;
  final String caption;
  final String imgPath;

  Slides({required this.title, required this.caption, required this.imgPath});
}

///

class AppTutorialScreen extends StatefulWidget {
  static const String name = 'tutorial_screen';
  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  final PageController pageViewController = PageController();
  bool hasEnd = false;
  @override
  void initState() {
    super.initState();
    pageViewController.addListener(() {
      final page = pageViewController.page ?? 0;
      if (page >= 1.5) {
        setState(() {
          hasEnd = true;
        });
      }
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            ///Implementar el controlador
            controller: pageViewController,
            physics: BouncingScrollPhysics(),
            children: [
              ...slides.map((element) => SlidesPages(slides: element)),
            ],
          ),
          Align(
            alignment: AlignmentGeometry.topRight,
            child: IconButton(onPressed: context.pop, icon: Icon(Icons.close)),
          ),
          // if ((pageViewController.page ?? 0) >= 1)
          //   TextButton(
          //     onPressed: context.pop,
          //     child: Text('Finalizar tutorial'),
          //   ),
          hasEnd
              ? FadeInRight(
                  delay: Duration(seconds: 1),
                  child: Padding(
                    padding: EdgeInsets.only(
                      bottom: screenHeight * 0.05,
                      right: screenHeight * 0.01,
                    ),
                    child: Align(
                      alignment: AlignmentGeometry.bottomRight,
                      child: FilledButton(
                        onPressed: context.pop,
                        child: Text('Comenzar'),
                      ),
                    ),
                  ),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}

///STELESS CON LAS PAGINAS
class SlidesPages extends StatelessWidget {
  final Slides slides;
  const SlidesPages({super.key, required this.slides});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;
    double screenHeight = MediaQuery.sizeOf(context).height;
    final title = Theme.of(
      context,
    ).textTheme.titleLarge?.copyWith(color: Colors.black);
    final caption = Theme.of(
      context,
    ).textTheme.bodySmall?.copyWith(color: Colors.black);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///Imagenes con asset
            Image(
              image: AssetImage(slides.imgPath),
              width: screenWidth * 0.50,
              height: screenHeight * 0.30,
            ),
            SizedBox(height: 10),

            Text(slides.title, style: title),
            Text(slides.caption, style: caption),
          ],
        ),
      ),
    );
  }
}
