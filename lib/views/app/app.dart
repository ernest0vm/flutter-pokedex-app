import 'package:flutter/material.dart';
import 'package:pokedex/managers/stream_manager.dart';
import 'package:pokedex/views/routes/app_routes.dart';
import 'package:pokedex/widgets/loader_layer.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) => Directionality(
        textDirection: TextDirection.ltr,
        child: Stack(
          children: [
            MaterialApp(
              title: 'Pokedex',
              debugShowCheckedModeBanner: false,
              initialRoute: AppRoutes.home,
              routes: AppRoutes.routes,
            ),
            StreamBuilder(
              stream: StreamManager.instance.appIsBusyStream,
              initialData: false,
              builder: (context, snapshot) {
                if (snapshot.data!) {
                  return const LoaderLayer();
                }
                return Container();
              },
            )
          ],
        ),
      );
}
