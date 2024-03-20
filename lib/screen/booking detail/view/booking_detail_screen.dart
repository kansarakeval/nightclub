import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart'; // Import path_provider
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:share/share.dart'; // Import share package
import '../../../models/eticket.dart';
import '../../../services/api_call.dart';

class BookingDetailScreen extends StatefulWidget {
  const BookingDetailScreen({super.key});

  @override
  State<BookingDetailScreen> createState() => _BookingDetailScreenState();
}

class _BookingDetailScreenState extends State<BookingDetailScreen> {
  late String name;
  late String uID;
  late String uContactno;
  late String uEmail;
  final Apicall api = Apicall();
  late Future<List<eticket>> _ticketDetailsFuture;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString('name') ?? '';
      uID = prefs.getString('uID') ?? '';
      uEmail = prefs.getString('uEmail') ?? '';
      uContactno = prefs.getString('uContactno') ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    final bID = ModalRoute.of(context)!.settings.arguments as String;
    _ticketDetailsFuture = api.fetchTicketData(bID);
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.40,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Color(0xFF00B79B),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.95,
                        height: MediaQuery.of(context).size.height * 0.08,
                        decoration: const BoxDecoration(
                          color: Color(0xFF00B79B),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  Navigator.pushReplacementNamed(
                                      context, 'dash');
                                },
                                icon: const Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(width: 10),
                              const Text(
                                "E-Ticket",
                                style: TextStyle(
                                    fontSize: 25, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child: FutureBuilder<List<eticket>>(
                      future: _ticketDetailsFuture,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          return Center(
                              child: Text('Error: ${snapshot.error}'));
                        } else {
                          final List<eticket> ticketDetailsList =
                          snapshot.data!;
                          return SingleChildScrollView(
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              width: MediaQuery.of(context).size.width * 0.95,
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
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Align(
                                    alignment: Alignment.center,
                                    child: Icon(
                                      Icons.qr_code_2_outlined,
                                      size: 200,
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.95,
                                    padding: const EdgeInsets.all(20),
                                    margin: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Colors.grey,
                                          spreadRadius: 0.2,
                                          blurRadius: 2,
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        const Text("Event"),
                                        const SizedBox(height: 5),
                                        Text(
                                          ticketDetailsList.isNotEmpty
                                              ? ticketDetailsList[0].eName
                                              : '',
                                          style: const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(height: 5),
                                        const Text("Date & hour"),
                                        const SizedBox(height: 5),
                                        Text(
                                          "${ticketDetailsList.isNotEmpty ? DateFormat('EEEE, MMMM dd, yyyy').format(DateTime.parse(ticketDetailsList[0].eDate)) : ''}-${ticketDetailsList.isNotEmpty ? DateFormat('hh:mm a').format(DateFormat('HH:mm:ss').parse(ticketDetailsList[0].eTime)) : ''}",
                                          style: const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(height: 5),
                                        const Text("Event Location"),
                                        const SizedBox(height: 5),
                                        Text(
                                          ticketDetailsList.isNotEmpty
                                              ? "${ticketDetailsList[0].location},${ticketDetailsList[0].lAddress}"
                                              : '',
                                          style: const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(height: 5),
                                        const Text("Event Speaker"),
                                        const SizedBox(height: 5),
                                        Text(
                                          ticketDetailsList.isNotEmpty
                                              ? ticketDetailsList[0].eSpeaker
                                              : '',
                                          style: const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.95,
                                    padding: const EdgeInsets.all(20),
                                    margin: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Colors.grey,
                                          spreadRadius: 0.2,
                                          blurRadius: 2,
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text(
                                              "Full Name",
                                              style: TextStyle(fontSize: 15),
                                            ),
                                            Text(
                                              name,
                                              style: const TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text(
                                              "Contact No",
                                              style: TextStyle(fontSize: 15),
                                            ),
                                            Text(
                                              uContactno,
                                              style: const TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text(
                                              "Email",
                                              style: TextStyle(
                                                fontSize: 15,
                                              ),
                                            ),
                                            Text(
                                              uEmail,
                                              style: const TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.95,
                                    padding: const EdgeInsets.all(20),
                                    margin: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Colors.grey,
                                          spreadRadius: 0.2,
                                          blurRadius: 2,
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text(
                                              "seat Price:",
                                              style: TextStyle(fontSize: 15),
                                            ),
                                            Text(
                                              "₹${ticketDetailsList[0].fPrice}",
                                              style: const TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text(
                                              "Booking Seat:",
                                              style: TextStyle(fontSize: 15),
                                            ),
                                            Text(
                                              ticketDetailsList[0].noSeat,
                                              style: const TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(5),
                                          child: Divider(
                                            color: Colors.grey.shade700,
                                            // Darker color
                                            height:
                                            2, // Set the height of the divider
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text(
                                              "Total:",
                                              style: TextStyle(fontSize: 15),
                                            ),
                                            Text(
                                              "₹ ${ticketDetailsList[0].totalPrice}",
                                              style: const TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  ElevatedButton(
                                    onPressed: () {
                                      _downloadTicketAsPDF(ticketDetailsList);
                                    },
                                    child: const Text("Download Ticket as PDF"),
                                  ),
                                  const SizedBox(height: 10),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.95,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.pushReplacementNamed(
                                            context, 'dash');
                                      },
                                      child: const Text("HomeScreen"),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _downloadTicketAsPDF(List<eticket> ticketDetailsList) async {
    final pdf = pw.Document();

    // Generate the QR Code widget
    final qrCodeWidget = pw.BarcodeWidget(
      barcode: pw.Barcode.qrCode(),
      data: 'Your QR Code Data Here', // Provide your QR Code data
      width: 200,
      height: 200,
    );

    // Format date and time
    final formattedDate = DateFormat('EEEE, MMMM dd, yyyy').format(DateTime.parse(ticketDetailsList[0].eDate));
    final formattedTime = DateFormat('hh:mm a').format(DateFormat('HH:mm:ss').parse(ticketDetailsList[0].eTime));

    // Add content to the PDF document
    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.center,
            children: [
              pw.Align(
                alignment: pw.Alignment.center,
                child: qrCodeWidget,
              ),
              pw.SizedBox(height: 20),
              pw.Container(
                width: 400,
                padding: const pw.EdgeInsets.all(20),
                margin: const pw.EdgeInsets.all(10),
                decoration: pw.BoxDecoration(
                  color: PdfColors.white,
                  boxShadow: const [
                    pw.BoxShadow(
                      color: PdfColors.grey,
                      spreadRadius: 0.2,
                      blurRadius: 2,
                    )
                  ],
                  borderRadius: pw.BorderRadius.circular(25),
                ),
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text('Event', style: pw.TextStyle(fontSize: 15, fontWeight: pw.FontWeight.bold)),
                    pw.SizedBox(height: 5),
                    pw.Text(ticketDetailsList.isNotEmpty ? ticketDetailsList[0].eName : ''),
                    pw.SizedBox(height: 5),
                    pw.Text('Date & hour', style: pw.TextStyle(fontSize: 15, fontWeight: pw.FontWeight.bold)),
                    pw.SizedBox(height: 5),
                    pw.Text('$formattedDate - $formattedTime'),
                    pw.SizedBox(height: 5),
                    pw.Text('Event Location', style: pw.TextStyle(fontSize: 15, fontWeight: pw.FontWeight.bold)),
                    pw.SizedBox(height: 5),
                    pw.Text(ticketDetailsList.isNotEmpty ? '${ticketDetailsList[0].location},${ticketDetailsList[0].lAddress}' : ''),
                    pw.SizedBox(height: 5),
                    pw.Text('Event Speaker', style: pw.TextStyle(fontSize: 15, fontWeight: pw.FontWeight.bold)),
                    pw.SizedBox(height: 5),
                    pw.Text(ticketDetailsList.isNotEmpty ? ticketDetailsList[0].eSpeaker : ''),
                  ],
                ),
              ),
              pw.Container(
                width: 400,
                padding: const pw.EdgeInsets.all(20),
                margin: const pw.EdgeInsets.all(10),
                decoration: pw.BoxDecoration(
                  color: PdfColors.white,
                  boxShadow: const [
                    pw.BoxShadow(
                      color: PdfColors.grey,
                      spreadRadius: 0.2,
                      blurRadius: 2,
                    )
                  ],
                  borderRadius: pw.BorderRadius.circular(25),
                ),
                child: pw.Column(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,
                  children: [
                    pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      children: [
                        pw.Text(
                          'Full Name',
                          style: const pw.TextStyle(fontSize: 15),
                        ),
                        pw.Text(
                          name,
                          style: pw.TextStyle(fontSize: 15, fontWeight: pw.FontWeight.bold),
                        ),
                      ],
                    ),
                    pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      children: [
                        pw.Text(
                          'Contact No',
                          style: const pw.TextStyle(fontSize: 15),
                        ),
                        pw.Text(
                          uContactno,
                          style: pw.TextStyle(fontSize: 15, fontWeight: pw.FontWeight.bold),
                        ),
                      ],
                    ),
                    pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      children: [
                        pw.Text(
                          'Email',
                          style: const pw.TextStyle(fontSize: 15),
                        ),
                        pw.Text(
                          uEmail,
                          style: pw.TextStyle(fontSize: 15, fontWeight: pw.FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              pw.Container(
                width: 400,
                padding: const pw.EdgeInsets.all(20),
                margin: const pw.EdgeInsets.all(10),
                decoration: pw.BoxDecoration(
                  color: PdfColors.white,
                  boxShadow: const [
                    pw.BoxShadow(
                      color: PdfColors.grey,
                      spreadRadius: 0.2,
                      blurRadius: 2,
                    )
                  ],
                  borderRadius: pw.BorderRadius.circular(25),
                ),
                child: pw.Column(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,
                  children: [
                    pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      children: [
                        pw.Text(
                          'Seat Price:',
                          style: const pw.TextStyle(fontSize: 15),
                        ),
                        pw.Text(
                          ticketDetailsList.isNotEmpty ? ticketDetailsList[0].fPrice : '',
                          style: pw.TextStyle(fontSize: 15, fontWeight: pw.FontWeight.bold),
                        ),
                      ],
                    ),
                    pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      children: [
                        pw.Text(
                          'Booking Seat:',
                          style: const pw.TextStyle(fontSize: 15),
                        ),
                        pw.Text(
                          ticketDetailsList.isNotEmpty ? ticketDetailsList[0].noSeat : '',
                          style: pw.TextStyle(fontSize: 15, fontWeight: pw.FontWeight.bold),
                        ),
                      ],
                    ),
                    pw.Padding(
                      padding: const pw.EdgeInsets.all(5),
                      child: pw.Divider(
                        color: PdfColors.grey700,
                        height: 2,
                      ),
                    ),
                    pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      children: [
                        pw.Text(
                          'Total:',
                          style: const pw.TextStyle(fontSize: 15),
                        ),
                        pw.Text(
                          ticketDetailsList.isNotEmpty ? ticketDetailsList[0].totalPrice : '',
                          style: pw.TextStyle(fontSize: 15, fontWeight: pw.FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );

    // Save the PDF
    final Uint8List pdfBytes = await pdf.save();

    // Get the temporary directory path
    final tempDir = await getTemporaryDirectory();

    // Generate a unique filename for the PDF
    final fileName = 'ticket_${DateTime.now().millisecondsSinceEpoch}.pdf';

    // Write the PDF to a file in the temporary directory
    final pdfFile = File('${tempDir.path}/$fileName');
    await pdfFile.writeAsBytes(pdfBytes);

    // Share the PDF file
    Share.shareFiles([pdfFile.path], text: 'Share PDF');
  }

  Future<Uint8List> pdfContent(PdfPageFormat format, List<eticket> ticketDetailsList) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Column(
          );
        },
      ),
    );

    return Uint8List.fromList(await pdf.save());
  }

  void sharePdf(String filePath) {
    Share.shareFiles([filePath], text: 'Share PDF');
  }
}
