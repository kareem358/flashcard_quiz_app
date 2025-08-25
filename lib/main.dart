

  runApp(
    const MyApp(),// creating MyApp below
  );
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});// any one line can be okay


  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),// creating  this in a separate folder for different screen
    );
  }
}
