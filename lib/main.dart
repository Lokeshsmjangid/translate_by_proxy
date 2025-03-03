import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/utils.dart';
import 'package:provider/provider.dart';
import 'package:translate_interview/model/language_model.dart';
import 'package:translate_interview/navigator_class/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () {
        if (FocusManager.instance.primaryFocus!.hasFocus) {
          FocusManager.instance.primaryFocus!.unfocus();
        }
      },
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => LanguageModel()),
        ProxyProvider<LanguageModel, Map<String, String>>(
          create: (context) => Provider.of<LanguageModel>(context, listen: false).allLocal['US']!,
          update: (_, languageModel, previous) {
            languageModel.selectedLang(languageModel.locale); 
            return languageModel.selectedLocal; 
          },
        ),
        // ChangeNotifierProvider(create: (_) => LanguageModel()),
        // ProxyProvider<LanguageModel, Locale>(
        //   update: (_, languageModel, __) {
        //     Get.updateLocale(languageModel.locale); 
        //     return languageModel.locale;
        //   },
        // ),
        // ChangeNotifierProvider(create: (_) => TranslateController()),
      ],
        child: GetMaterialApp(
          title: "Translate App",
          locale: Get.deviceLocale,
          // translations: AppTranslations(),
          fallbackLocale: const Locale('en', 'US'),
          getPages: AppRoutes.getRoute,
          debugShowCheckedModeBanner: false,
          initialRoute: AppRoutes.splashScreen,
          defaultTransition: Transition.noTransition,
          builder: (context, child) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0), 
              child: child!
            );
          },
        ),
      ),
    );
    // return MaterialApp(
    //   title: 'Flutter Demo',
    //   theme: ThemeData(
    //     colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    //     useMaterial3: true,
    //   ),
    //   home: const MyHomePage(title: 'Flutter Demo Home Page'),
    // );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Center(
 
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
