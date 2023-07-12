import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ListViewPage(),
    );
  }
}

class ListViewPage extends StatefulWidget {
  const ListViewPage({Key? key}) : super(key: key);

  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  List<String> titleList = [
    'Dentist',
    'Pharmacist',
    'School teacher',
    'IT manager',
    'Account',
    'Lawyer',
    'Hairdresser',
    'Physician',
    'Web developer',
    'Medical Secretary'
  ];

  List<String> imageList = [
    "./assets/users/img/user_1.jpg",
    "./assets/users/img/user_1.jpg",
    "./assets/users/img/user_1.jpg",
    "./assets/users/img/user_1.jpg",
    "./assets/users/img/user_1.jpg",
    "./assets/users/img/user_1.jpg",
    "./assets/users/img/user_1.jpg",
    "./assets/users/img/user_1.jpg",
    "./assets/users/img/user_1.jpg",
    "./assets/users/img/user_1.jpg",
  ];

  List<String> description = [
    '1. There are different types of careers you can pursue in your life. Which one will it be?',
    '2. There are different types of careers you can pursue in your life. Which one will it be?',
    '3. There are different types of careers you can pursue in your life. Which one will it be?',
    '4. There are different types of careers you can pursue in your life. Which one will it be?',
    '5. There are different types of careers you can pursue in your life. Which one will it be?',
    '6. There are different types of careers you can pursue in your life. Which one will it be?',
    '7. There are different types of careers you can pursue in your life. Which one will it be?',
    '8. There are different types of careers you can pursue in your life. Which one will it be?',
    '9. There are different types of careers you can pursue in your life. Which one will it be?',
    '10. There are different types of careers you can pursue in your life. Which one will it be?'
  ];

  void addCard() {
    setState(() {
      titleList.add('New Career');
      imageList.add('image/new.png');
      description.add('This is a new career option.');
    });
  }

  void deleteCard(int index) {
    setState(() {
      titleList.removeAt(index);
      imageList.removeAt(index);
      description.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.6;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ListView',
          style: TextStyle(color: Colors.grey),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: titleList.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: Key(titleList[index]),
            direction: DismissDirection.startToEnd,
            onDismissed: (direction) {
              deleteCard(index);
            },
            background: Container(
              alignment: Alignment.centerRight,
              color: Colors.red,
              child: const Padding(
                padding: EdgeInsets.all(16),
                child: Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
              ),
            ),
            child: InkWell(
              child: Card(
                child: Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                        width: 100,
                        height: 100,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            imageList[0],
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Column(
                        children: [
                          Text(
                            titleList[index],
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            width: width,
                            child: Text(
                              description[index],
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey[500],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              addCard();
            },
            child: const Icon(Icons.add),
          ),
          const SizedBox(width: 16),
          FloatingActionButton(
            onPressed: () {
              if (titleList.isNotEmpty) {
                deleteCard(titleList.length - 1);
              }
            },
            child: const Icon(Icons.delete),
          ),
        ],
      ),
    );
  }
}
