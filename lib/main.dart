import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';
import 'package:weather_warning/location.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/bg.png"),
              fit: BoxFit.fill,
            ),
          ),
          child: Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: ((context) => const Home()),
                  ),
                );
              },
              child: const Text(
                "دعنا نبدء",
                style: TextStyle(color: Colors.black, fontSize: 20.0),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor:
              const Color.fromARGB(255, 210, 210, 210).withOpacity(0.5),
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/bg.png"),
              fit: BoxFit.fill,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: ((context) => const FirstOption()),
                      ),
                    );
                  },
                  child: const Text(
                    "اكتشف اقرب زلزال",
                    style: TextStyle(color: Colors.black, fontSize: 20.0),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: ((context) => const SecondOption()),
                      ),
                    );
                  },
                  child: const Text(
                    "اكتشف اقرب حريق",
                    style: TextStyle(color: Colors.black, fontSize: 20.0),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: ((context) => const ThirdOption()),
                      ),
                    );
                  },
                  child: const Text(
                    "اكتشف اقرب امطار",
                    style: TextStyle(color: Colors.black, fontSize: 20.0),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FirstOption extends StatelessWidget {
  const FirstOption({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor:
              const Color.fromARGB(255, 210, 210, 210).withOpacity(0.5),
        ),
        body: Container(
          padding: const EdgeInsets.all(10.0),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/bg.png"),
              fit: BoxFit.fill,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Card(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      textAlign: TextAlign.center,
                      "لا يوجد حاليا زلزال قريب ولكن عند اقتراب زلزال سوف يهتز هاتفك ٣ هزات",
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(15.0),
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: const FreeMap(),
                  ),
                ),
                const SizedBox(height: 20.0),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black.withOpacity(0.7),
                  ),
                  onPressed: () async {
                    await Vibration.vibrate(duration: 1000);
                    await Future.delayed(const Duration(milliseconds: 2000));
                    await Vibration.vibrate(duration: 1000);
                    await Future.delayed(const Duration(milliseconds: 2000));
                    await Vibration.vibrate(duration: 1000);
                  },
                  child: const Text(
                    "تجربة",
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                ),
                const Card(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          textAlign: TextAlign.center,
                          "في حاله احتجت مساعده تواصل معنا",
                          style: TextStyle(fontSize: 20.0),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              textAlign: TextAlign.center,
                              "0127440520",
                              style: TextStyle(fontSize: 20.0),
                            ),
                            Icon(Icons.phone),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SecondOption extends StatelessWidget {
  const SecondOption({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor:
              const Color.fromARGB(255, 210, 210, 210).withOpacity(0.5),
        ),
        body: Container(
          padding: const EdgeInsets.all(10.0),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/bg.png"),
              fit: BoxFit.fill,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Card(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      textAlign: TextAlign.center,
                      "لا يوجد حاليا حريق قريب ولكن عند اقتراب حريق سوف يهتز هاتفك ٢ هزات",
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(15.0),
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: const FreeMap(),
                  ),
                ),
                const SizedBox(height: 20.0),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black.withOpacity(0.7),
                  ),
                  onPressed: () async {
                    await Vibration.vibrate(duration: 1000);
                    await Future.delayed(const Duration(milliseconds: 2000));
                    await Vibration.vibrate(duration: 1000);
                  },
                  child: const Text(
                    "تجربة",
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                ),
                const SizedBox(height: 20.0),
                const Card(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          textAlign: TextAlign.center,
                          "في حاله احتجت مساعده تواصل معنا",
                          style: TextStyle(fontSize: 20.0),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              textAlign: TextAlign.center,
                              "0127440520",
                              style: TextStyle(fontSize: 20.0),
                            ),
                            Icon(Icons.phone),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ThirdOption extends StatelessWidget {
  const ThirdOption({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor:
              const Color.fromARGB(255, 210, 210, 210).withOpacity(0.5),
        ),
        body: Container(
          padding: const EdgeInsets.all(10.0),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/bg.png"),
              fit: BoxFit.fill,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Card(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      textAlign: TextAlign.center,
                      "لا يوجد حاليا امطار قريبه قريب ولكن عند اقتراب زلزال سوف يهتز هاتفك مره",
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(15.0),
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: const FreeMap(),
                  ),
                ),
                const SizedBox(height: 20.0),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black.withOpacity(0.7),
                  ),
                  onPressed: () async {
                    await Vibration.vibrate(duration: 1000);
                  },
                  child: const Text(
                    "تجربة",
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                ),
                const SizedBox(height: 20.0),
                const Card(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          textAlign: TextAlign.center,
                          "في حاله احتجت مساعده تواصل معنا",
                          style: TextStyle(fontSize: 20.0),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              textAlign: TextAlign.center,
                              "0127440520",
                              style: TextStyle(fontSize: 20.0),
                            ),
                            Icon(Icons.phone),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
