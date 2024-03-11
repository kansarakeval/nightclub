import 'package:flutter/material.dart';

class PayScreen extends StatefulWidget {
  const PayScreen({super.key});

  @override
  State<PayScreen> createState() => _PayScreenState();
}

class _PayScreenState extends State<PayScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: MediaQuery.sizeOf(context).height,
              width: MediaQuery.sizeOf(context).width,
              color: Colors.white,
            ),
            Container(
              height: MediaQuery.sizeOf(context).height * 0.40,
              width: MediaQuery.sizeOf(context).width,
              decoration: const BoxDecoration(
                color: Color(0xFF00B79B),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
            ),
            Column(
              children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        )),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      "Payment Method",
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  width: MediaQuery.sizeOf(context).width * 0.95,
                  height: MediaQuery.sizeOf(context).height * 0.70,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        spreadRadius: 0.2,
                        blurRadius: 2,
                      )
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Selected PaymentMethod",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                      const SizedBox(height: 10,),
                      SingleChildScrollView(scrollDirection: Axis.horizontal,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 80,
                                width: 80,
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),boxShadow: const [
                                  BoxShadow(
                                    color: Colors.grey,
                                    spreadRadius: 0.2,
                                    blurRadius: 2,
                                  )
                                ],),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    "assets/pay/google pay.jpg",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Container(
                                height: 80,
                                width: 80,
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),boxShadow: const [
                                  BoxShadow(
                                    color: Colors.grey,
                                    spreadRadius: 0.2,
                                    blurRadius: 2,
                                  )
                                ],),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    "assets/pay/mastercard.png",fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Container(
                                height: 80,
                                width: 80,
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),boxShadow: const [
                                  BoxShadow(
                                    color: Colors.grey,
                                    spreadRadius: 0.2,
                                    blurRadius: 2,
                                  )
                                ],),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    "assets/pay/visa.png",fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Container(
                                height: 80,
                                width: 80,
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),boxShadow: const [
                                  BoxShadow(
                                    color: Colors.grey,
                                    spreadRadius: 0.2,
                                    blurRadius: 2,
                                  )
                                ],),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    "assets/pay/apple pay.png",fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Container(
                                height: 80,
                                width: 80,
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),boxShadow: const [
                                  BoxShadow(
                                    color: Colors.grey,
                                    spreadRadius: 0.2,
                                    blurRadius: 2,
                                  )
                                ],),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    "assets/pay/paypal.png",fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 10,),
                      const Text("Add Cart",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                      const SizedBox(height: 10,),
                      const TextField(
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(), labelText: "Card Holder Name"),
                      ),
                      const SizedBox(height: 10,),
                      const TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(), labelText: "Card Number"),
                      ),
                      const SizedBox(height: 10,),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 150,
                            child: TextField(
                              keyboardType: TextInputType.datetime,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(), labelText: "Expiry Date"),
                            ),
                          ),
                          SizedBox(
                            width: 150,
                            child: TextField(
                              keyboardType: TextInputType.datetime,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(), labelText: "Security code"),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10,),
                      SizedBox(width: double.infinity,child: ElevatedButton(onPressed: () {
                        // Navigator.popUntil(context, ModalRoute.withName('bookdetail'));
                        Navigator.pushNamed(
                          context,
                          'bookdetail', // Pass event ID as an argument
                        );
                      }, child: const Text("pay Now")))
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
