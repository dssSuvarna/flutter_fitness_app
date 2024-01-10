import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MusicProviderScreen extends ConsumerStatefulWidget {
  const MusicProviderScreen({super.key});

  @override
  ConsumerState<MusicProviderScreen> createState() =>
      _MusicProviderScreenState();
}

class _MusicProviderScreenState extends ConsumerState<MusicProviderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Music Provider',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              children: [
                const Text(
                  'Select your Music Provider',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  textAlign: TextAlign.center,
                  'Listrn to your favoritr music while exercising.The best music streaming services include access to millions of songs.',
                ),
                const SizedBox(
                  height: 20,
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Spotify'),
                              Icon(
                                Icons.arrow_forward_ios_outlined,
                                color: Colors.grey,
                                size: 20,
                              )
                            ],
                          ),
                        ),
                        const Divider(
                          height: 30,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Apple Music'),
                            Icon(
                              Icons.arrow_forward_ios_outlined,
                              color: Colors.grey,
                              size: 20,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
