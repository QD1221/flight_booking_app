import 'package:flight_booking_app/model/flight_ticket.dart';
import 'package:flight_booking_app/ui/qr_scan_page.dart';
import 'package:flight_booking_app/ui/ticket_separator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TicketPage extends StatefulWidget {
  const TicketPage({Key? key}) : super(key: key);

  @override
  _TicketPageState createState() => _TicketPageState();
}

class _TicketPageState extends State<TicketPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned(
            top: 200,
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(36),
                  topLeft: Radius.circular(36),
                ),
              ),
            ),
          ),
          Positioned(
            top: 48,
            left: 16,
            right: 16,
            bottom: 48,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Itineraries',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.settings),
                      color: Colors.white,
                    )
                  ],
                ),
                Container(
                  height: 58,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Center(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search',
                        hintStyle: TextStyle(fontSize: 20),
                        icon: Icon(Icons.search),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: ticketItems.length,
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        FlightTicket _ticket = ticketItems[index];
                        bool _isRunning = _ticket.isRunning ?? false;
                        return GestureDetector(
                          onTap: () => Get.to(() => QrScanPage(
                                flightTicket: _ticket,
                              )),
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${_ticket.title ?? 'UNKNOWN'}',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 12),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '${_ticket.fromDate ?? 'UNKNOWN'}',
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 12,
                                          ),
                                        ),
                                        Text(
                                          '${_ticket.arriveDate ?? 'UNKNOWN'}',
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 48,
                                    width: double.infinity,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          _ticket.origin ?? 'UNKNOWN',
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8),
                                            child: Stack(
                                              children: [
                                                Positioned(
                                                  top: 0,
                                                  right: 0,
                                                  left: 0,
                                                  bottom: 0,
                                                  child: TicketSeparator(
                                                    height: 2,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                                AnimatedPositioned(
                                                  top: 0,
                                                  right: 0,
                                                  left: 0,
                                                  bottom: 0,
                                                  duration: Duration(
                                                      milliseconds: 150),
                                                  child: RotatedBox(
                                                    quarterTurns: 1,
                                                    child: Icon(
                                                      Icons.flight,
                                                      color: _isRunning
                                                          ? Colors.purpleAccent
                                                          : Colors.black,
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                  top: 0,
                                                  left: 0,
                                                  bottom: 0,
                                                  child: CircleAvatar(
                                                    radius: 8,
                                                    backgroundColor:
                                                        Colors.black,
                                                  ),
                                                ),
                                                Positioned(
                                                  top: 0,
                                                  right: 0,
                                                  bottom: 0,
                                                  child: CircleAvatar(
                                                    radius: 8,
                                                    backgroundColor:
                                                        Colors.purpleAccent,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Text(
                                          _ticket.destination ?? 'UNKNOWN',
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '${_ticket.fromTime ?? 'UNKNOWN'}',
                                        style: TextStyle(
                                          fontSize: 12,
                                        ),
                                      ),
                                      Text(
                                        '${_ticket.elapsedTime ?? 'UNKNOWN'}',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12,
                                        ),
                                      ),
                                      Text(
                                        '${_ticket.arriveTime ?? 'UNKNOWN'}',
                                        style: TextStyle(
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                )
              ],
            ),
          ),
          Positioned(
            left: 8,
            right: 8,
            bottom: 8,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.home_outlined),
                  color: Colors.grey,
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.list_alt_outlined),
                  color: Colors.grey,
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.location_on_outlined),
                  color: Colors.grey,
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.home_outlined),
                  color: Colors.grey,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
