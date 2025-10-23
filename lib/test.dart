import 'package:flutter/material.dart';

class testSliver extends StatefulWidget {
  const testSliver({super.key});

  @override
  State<testSliver> createState() => _testSliverState();
}

class _testSliverState extends State<testSliver> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 70,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text(
                  'Test',
                  style: TextStyle(fontSize: 30, color: Colors.black),
                ),
              ),
            ),
            SliverAppBar(
              floating: true,
              expandedHeight: 200,
              flexibleSpace: Container(
                height: 200,
                color: Colors.red,

                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(width: 160, height: 150, color: Colors.blue),
                      Container(width: 180, height: 180, color: Colors.blue),
                    ],
                  ),
                ),
              ),
            ),
            SliverList.builder(
              itemCount: 20,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(height: 100, color: Colors.green),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
