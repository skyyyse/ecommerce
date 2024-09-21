import 'package:flutter/material.dart';

class confirm_order extends StatelessWidget {
  const confirm_order({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Color(0XFFe5e5e5),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text("Confirm Order"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        height: 60,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("Deliery methods :"),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 1),
                        child: Container(
                          height: 60,
                          color: Colors.white,
                          child: ListTile(
                            leading: Icon(Icons.store),
                            title: Text('Pick up at store'),
                            trailing: Icon(Icons.add_outlined),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 1),
                        child: Container(
                          height: 60,
                          color: Colors.white,
                          child: ListTile(
                            leading: Icon(Icons.delivery_dining_sharp),
                            title: Text('Delivery to Door'),
                            trailing: Icon(Icons.add_outlined),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        height: 60,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("Delivery address:"),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 1),
                        child: Container(
                          height: 60,
                          color: Colors.white,
                          child: ListTile(
                            leading: Icon(Icons.location_on_outlined),
                            title: Text('Click to add Shopping Address'),
                            trailing: Icon(Icons.arrow_forward_ios_sharp),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        height: 60,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("Payment method"),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 1),
                        child: Container(
                          height: 60,
                          color: Colors.white,
                          child: Column(
                            children: [
                              ListTile(
                                leading: Icon(Icons.location_on_outlined),
                                title: Text('Click to add Shopping Address'),
                                trailing: Icon(Icons.arrow_forward_ios_sharp),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 1),
                        child: Container(
                          height: 60,
                          color: Colors.white,
                          child: Column(
                            children: [
                              ListTile(
                                leading: Icon(Icons.local_convenience_store_rounded),
                                title: Text('Pay at ths Store'),
                                trailing: Icon(Icons.arrow_forward_ios_sharp),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        height: 60,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("Item is pick"),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 1),
                        child: Container(
                          height: 60,
                          color: Colors.white,
                          child: Column(
                            children: [
                              ListTile(
                                leading: Icon(Icons.location_on_outlined),
                                title: Text('Click to add Shopping Address'),
                                trailing: Icon(Icons.arrow_forward_ios_sharp),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 1),
                        child: Container(
                          height: 60,
                          color: Colors.white,
                          child: Column(
                            children: [
                              ListTile(
                                leading: Icon(Icons.local_convenience_store_rounded),
                                title: Text('Pay at ths Store'),
                                trailing: Icon(Icons.arrow_forward_ios_sharp),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        height: 60,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("Item is pick"),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 1),
                        child: Container(
                          height: 60,
                          color: Colors.white,
                          child: Column(
                            children: [
                              ListTile(
                                title: Text('Subtotal:'),
                                trailing: Text("\$1000"),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 1),
                        child: Container(
                          height: 60,
                          color: Colors.white,
                          child: Column(
                            children: [
                              ListTile(
                                title: Text('Delivery Fee'),
                                trailing: Text("\$1"),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
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
