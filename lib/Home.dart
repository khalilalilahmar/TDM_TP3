import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tpint/ProductDetailsScreen.dart';

import 'main.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>
    with SingleTickerProviderStateMixin, WidgetsBindingObserver, RouteAware {
  AnimationController controller;
  Animation anim;
  final assetsAudioPlayer = AssetsAudioPlayer();

  bool img1 = true;
  bool img2 = true;
  bool img3 = true;

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 5));
    anim = Tween<double>(begin: 0.0, end: 300.0).animate(controller);
    controller.forward();
    assetsAudioPlayer.open(Audio("assets/music.ogg"),
        loopMode: LoopMode.single);
    assetsAudioPlayer.play();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context));
  }

  @override
  void dispose() {
    super.dispose();
    routeObserver.unsubscribe(this);
    WidgetsBinding.instance.removeObserver(this);
    controller.dispose();
  }

  @override
  void didPushNext() {
// Called when a new route has been pushed, and the current route is no longer visible.
    assetsAudioPlayer.pause();
  }

  @override
  void didPopNext() {
    assetsAudioPlayer.play();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.inactive:
        print("Inactive");
        assetsAudioPlayer.pause();
        break;
      case AppLifecycleState.paused:
        print("Paused");
        assetsAudioPlayer.pause();
        break;
      case AppLifecycleState.resumed:
        print("Resumed");
        assetsAudioPlayer.play();
        break;
      case AppLifecycleState.detached:
        print("Suspending");
        assetsAudioPlayer.stop();

        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Products"),
      ),
      body: Builder(
        builder: (context) => SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: anim.value,
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: Card(
                    elevation: 100,
                    child: InkWell(
                        onTap: () {
                          Scaffold.of(context).showSnackBar(SnackBar(
                            duration: Duration(seconds: 1),
                            content: Text("Price : 1200  "),
                          ));
                        },
                        onLongPress: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProductDetailScreen(
                                    img: "assets/1.jpg",
                                    descr:
                                        "The iPhone 12 features a 6.1-inch (15 cm) display with Super Retina XDR OLED technology at a resolution of 2532×1170 pixels and a pixel density of about 460 ppi. The iPhone 12 Mini features a 5.4-inch (14 cm) display with the same technology at a resolution of 2340×1080 pixels and a pixel density of about 476 ppi",
                                    livraison: "WorldWide",
                                    price: "1200",
                                    Warranty: "1 Year",
                                    link:
                                        "https://www.apple.com/shop/buy-iphone/iphone-12"),
                              ));
                        },
                        child: Image.asset(
                          "assets/1.jpg",
                          fit: BoxFit.contain,
                        )),
                  ),
                ),
              ),
              Container(
                height: anim.value,
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: Card(
                    elevation: 100,
                    child: InkWell(
                        onTap: () {
                          Scaffold.of(context).showSnackBar(SnackBar(
                            duration: Duration(seconds: 1),
                            content: Text("Price : 55000 "),
                          ));
                        },
                        onLongPress: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProductDetailScreen(
                                    img: "assets/4.png",
                                    descr:
                                        "The Mercedes-Benz C250 runs on a 1.8L turbo Direct injection four-cylinder engine that delivers 201 horsepower. Numerous technology advancements enable this engine to deliver more torque on less fuel with cleaner emissions. In the mileage department, it impressively delivers 22 mpg city and 31 mpg highway",
                                    livraison: "WorldWide",
                                    price: "55000",
                                    Warranty: "2 Year",
                                    link:
                                        "https://www.carmax.com/cars/mercedes-benz/c250"),
                              ));
                        },
                        child: Image.asset(
                          "assets/4.png",
                          fit: BoxFit.contain,
                        )),
                  ),
                ),
              ),
              Container(
                height: anim.value,
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: Card(
                    elevation: 100,
                    child: InkWell(
                        onTap: () {
                          Scaffold.of(context).showSnackBar(SnackBar(
                            duration: Duration(seconds: 1),
                            content: Text("Price : 1559  "),
                          ));
                        },
                        onLongPress: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProductDetailScreen(
                                    img: "assets/7.png",
                                    descr:
                                        "Gaming computers are specialized personal computers designed for playing video games. Gaming computers typically differ from mainstream computers by using high-performance video cards and high core-count central processing units that sacrifice power efficiency for raw performance",
                                    livraison: "WorldWide",
                                    price: "1559",
                                    Warranty: "2 Year",
                                    link:
                                        "https://www.ibuypower.com/Store/Intel-11th-Gen-Core-i5-Configurator"),
                              ));
                        },
                        child: Image.asset(
                          "assets/7.png",
                          fit: BoxFit.contain,
                        )),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
