// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

double? mWidth;
double? mHeight;
String? stringResponse;
Map? mapProgramResponse;
Map? mapLessonResponse;
Map? dataProgramResponse;
Map? dataLessonResponse;
List? listProgramResponse;
List? listLessonResponse;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future apicallP() async {
    http.Response response;
    response = await http.get(
        Uri.parse("https://632017e19f82827dcf24a655.mockapi.io/api/programs"));
    if (response.statusCode == 200) {
      setState(() {
        // stringResponse = response.body;
        mapProgramResponse = json.decode(response.body);
        listProgramResponse = mapProgramResponse!['items'];
      });
    }
  }

  Future apicallL() async {
    http.Response responsel;
    responsel = await http.get(
        Uri.parse("https://632017e19f82827dcf24a655.mockapi.io/api/lessons"));
    if (responsel.statusCode == 200) {
      setState(() {
        // stringResponse = response.body;
        mapLessonResponse = json.decode(responsel.body);
        listLessonResponse = mapLessonResponse!['items'];
      });
    }
  }

  @override
  void initState() {
    apicallP();
    apicallL();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    mWidth = MediaQuery.of(context).size.width;
    mHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      // backgroundColor: ,
      appBar: AppBar(
        leading: const Icon(
          Icons.short_text,
          color: Colors.grey,
        ),
        actions: const [
          Icon(
            Icons.forum_outlined,
            color: Colors.grey,
          ),
          SizedBox(width: 5),
          Icon(
            Icons.notifications_outlined,
            color: Colors.grey,
          ),
        ],
        // title: Text('home'),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                //         title: Text("Home Page"),
                width: mWidth,
                color: Theme.of(context).colorScheme.primary,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(top: 0),
                      child: const Text(
                        "Hello, Priya!",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: const Text(
                        "What do you wanna learn today?",
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: mWidth,
                color: Theme.of(context).colorScheme.primary,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: Container(
                            width: mWidth! * 0.47,
                            // padding: EdgeInsets.only(top: 8),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.blue),
                            ),
                            child: ListTile(
                              leading: const Icon(Icons.collections_bookmark,
                                  color: Colors.blue),
                              title: const Text(
                                'Programs',
                                style:
                                    TextStyle(color: Colors.blue, fontSize: 14),
                              ),
                              onTap: () {},
                            ),
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: Container(
                            width: mWidth! * 0.47,
                            // padding: EdgeInsets.only(top: 8),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.blue),
                            ),
                            child: ListTile(
                              leading:
                                  const Icon(Icons.help, color: Colors.blue),
                              title: const Text(
                                'Get help',
                                style:
                                    TextStyle(color: Colors.blue, fontSize: 14),
                              ),
                              onTap: () {},
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: Container(
                            width: mWidth! * 0.47,
                            // padding: EdgeInsets.only(top: 8),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.blue),
                            ),
                            child: ListTile(
                              leading: const Icon(Icons.import_contacts,
                                  color: Colors.blue),
                              title: const Text(
                                'Learn',
                                style:
                                    TextStyle(color: Colors.blue, fontSize: 14),
                              ),
                              onTap: () {},
                            ),
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: Container(
                            width: mWidth! * 0.47,
                            // padding: EdgeInsets.only(top: 8),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.blue),
                            ),
                            child: ListTile(
                              leading: const Icon(Icons.bar_chart,
                                  color: Colors.blue),
                              title: const Text(
                                'DD Tracker',
                                style:
                                    TextStyle(color: Colors.blue, fontSize: 14),
                              ),
                              onTap: () {},
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: mWidth! * 0.5,
                    child: const Text(
                      "Programs for you",
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    width: mWidth! * 0.36,
                    child: ListTile(
                      trailing:
                          const Icon(Icons.trending_flat, color: Colors.grey),
                      title: const Text(
                        'View all',
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                      onTap: () {},
                    ),
                  ),
                ],
              ),
              // programs
              Container(
                height: 265,
                // width: 250,
                //  child: ListView.builder(
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, _) => const SizedBox(width: 12),
                  itemBuilder: (context, index) {
                    return Container(
                      width: 250,
                      height: 265,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 10,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              // child: listResponse == null
                              //     ? const Text("Data is loading")
                              //     : Text(
                              //         listResponse![index]['name'].toString()),
                              child: Image.asset(
                                "assets/baby.jpg",
                                height: 140,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                listProgramResponse![index]['category']
                                    .toString(),
                                style: const TextStyle(
                                  color: Colors.blue,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                listProgramResponse![index]['name'].toString(),
                                // "A complete guide for your new born baby",
                                style: const TextStyle(
                                  // color: Colors.blue,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            Text(
                              // "16 lessons",
                              ("${listProgramResponse![index]['lesson']} lessons")
                                  .toString(),
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: listProgramResponse == null
                      ? 0
                      : listProgramResponse!.length,
                ),
              ),
// Events and experiences
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: mWidth! * 0.5,
                    child: const Text(
                      "Events and experiences",
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    width: mWidth! * 0.36,
                    child: ListTile(
                      trailing:
                          const Icon(Icons.trending_flat, color: Colors.grey),
                      title: const Text(
                        'View all',
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                      onTap: () {},
                    ),
                  ),
                ],
              ),
              Container(
                height: 265,
                // width: 250,
                //  child: ListView.builder(
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, _) => const SizedBox(width: 12),
                  itemBuilder: (context, index) {
                    return Container(
                      width: 250,
                      height: 265,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 10,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Image.asset(
                                "assets/babicare.jpg",
                                height: 140,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                listLessonResponse![index]['category']
                                    .toString(),
                                // "BABYCARE",
                                style: const TextStyle(
                                  color: Colors.blue,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                child: FittedBox(
                                  fit: BoxFit.contain,
                                  child: Text(
                                    listLessonResponse![index]['name']
                                        .toString(),
                                    // "Understanding of human bebaviour",
                                    style: const TextStyle(
                                      // color: Colors.blue,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  DateFormat.yMEd().add_jms().format(
                                      DateTime.parse(listLessonResponse![index]
                                          ['createdAt'])),
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {},
                                  style: ButtonStyle(
                                    foregroundColor:
                                        MaterialStateProperty.all(Colors.blue),
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.white),
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        side: const BorderSide(
                                            color: Colors.blue),
                                      ),
                                    ),
                                  ),
                                  child: const Text(
                                    "Book",
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: listLessonResponse == null
                      ? 0
                      : listLessonResponse!.length,
                ),
              ),

              const SizedBox(height: 20),
              // Lessons for you
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: mWidth! * 0.5,
                    child: const Text(
                      "Lessons for you",
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    width: mWidth! * 0.36,
                    child: ListTile(
                      trailing:
                          const Icon(Icons.trending_flat, color: Colors.grey),
                      title: const Text(
                        'View all',
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                      onTap: () {},
                    ),
                  ),
                ],
              ),
              Container(
                height: 265,
                // width: 250,
                //  child: ListView.builder(
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, _) => const SizedBox(width: 12),
                  itemBuilder: (context, index) {
                    return Container(
                      width: 250,
                      height: 265,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 10,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Image.asset(
                                "assets/babicare.jpg",
                                height: 140,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                listLessonResponse![index]['category']
                                    .toString(),
                                // "BABYCARE",
                                style: const TextStyle(
                                  color: Colors.blue,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                child: FittedBox(
                                  fit: BoxFit.cover,
                                  child: Text(
                                    listLessonResponse![index]['name']
                                        .toString(),
                                    // "Understanding of human bebaviou",
                                    style: const TextStyle(
                                      // color: Colors.blue,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  ("${listLessonResponse![index]['duration']} min")
                                      .toString(),
                                  // "3 min",
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Icon(
                                  Icons.lock_outline,
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: listLessonResponse == null
                      ? 0
                      : listLessonResponse!.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
