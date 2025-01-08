import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:login_page/components/appbar_header.dart';
import 'package:login_page/components/userpageview.dart';
import 'package:login_page/data_server/modal/user_profile.dart';
import 'package:login_page/providers/get_all_users_provider.dart';
import 'package:provider/provider.dart';
import 'dart:ui' as ui;
import 'dart:math' as math;

class NearbyLocation extends StatefulWidget {
  const NearbyLocation({super.key});

  @override
  State<NearbyLocation> createState() => _NearbyLocationState();
}

class _NearbyLocationState extends State<NearbyLocation> {
  late final Future<List<UserProfile>> futureUsers;
  final PageControl = PageController(viewportFraction: 0.9);
  //
  @override
  void initState() {
    super.initState();
    futureUsers = context.read<GetAllUsersProvider>().getAllUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarHeader(title: 'Nearby Location'),
      body: FutureBuilder(
          future: futureUsers,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }
            final userlocation = snapshot.data!;

            return Stack(children: [
              FlutterMap(
                options: const MapOptions(
                  initialCenter: LatLng(6.5244, 3.3792),
                  initialZoom: 5.0,
                ),
                children: [
                  TileLayer(
                    urlTemplate:
                        'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    userAgentPackageName: 'dev.fleaflet.flutter_map.example',
                    // Plenty of other options available!
                  ),
                  MarkerLayer(
                    markers: userlocation
                        .map(
                          (locatuser) => Marker(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            point: LatLng(
                              locatuser.address.coordinates.lat,
                              locatuser.address.coordinates.lng,
                            ),
                            child: Builder(
                              builder: (context) {
                                return GestureDetector(
                                  onTap: () {
                                    var page = 0;
                                    for (var i = 0;
                                        i < userlocation.length;
                                        i++) {
                                      if (locatuser.id == userlocation[i].id) {
                                        page = i;
                                        break;
                                      }
                                    }
                                    PageControl.animateToPage(page,
                                        duration:
                                            const Duration(milliseconds: 1000),
                                        curve: Curves.easeIn);
                                  },
                                  child: Column(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8, vertical: 4),
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                          color: Colors.white30,
                                        ),
                                        child: Text(
                                          locatuser.username,
                                          style: const TextStyle(
                                              color: Colors.black),
                                        ),
                                      ),
                                      // SvgPicture.asset(
                                      //   'assets/svg/location.svg',
                                      //   colorFilter: const ColorFilter.mode(
                                      //       Colors.black, BlendMode.srcIn),
                                      // )
                                      CustomPaint(
                                        painter: MarkupPainter(),
                                        child: Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: ClipPath(
                                            clipper: MarckerClipper(),
                                            child: SizedBox(
                                              width: 45,
                                              height: 65,
                                              child: Image.network(
                                                'https://cdn-icons-png.flaticon.com/512/219/219983.png',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
              Positioned(
                right: 0,
                left: 0,
                bottom: 0,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.27,
                  child: PageView(
                      controller: PageControl,
                      children: userlocation
                          .map(
                            (user) => Userpageview(user: user),
                          )
                          .toList()),
                ),
              ),
            ]);
          }),
    );
  }
}

ui.Path _getPath(size) {
  final path = ui.Path();
  path.moveTo(size.width / 2, size.height);
  path.quadraticBezierTo(-1, (size.height / 2) + 14, 0, size.height / 2);
  // path.lineTo(0, size.height / 2);
  final rect = Rect.fromCenter(
      center: Offset(size.width / 2, size.height / 2),
      width: size.width,
      height: size.height);

  path.arcTo(rect, math.pi, math.pi, true);
  // path.lineTo(size.width / 2, size.height);
  path.quadraticBezierTo(
      size.width + 1, (size.height / 2) + 14, size.width / 2, size.height);

  // canvas.drawOval(Rect.fromLTRB(0, 0, size.width, size.height), paint);

  // canvas.drawCircle(testOffset, 50, paint);
  return path;
}

class MarkupPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // final testOffset = Offset(0, 0);
    final paint = Paint();
    paint.color = Colors.white;
    // paint.style = PaintingStyle.stroke;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 5;

    canvas.drawPath(_getPath(size), paint);
    canvas.drawShadow(_getPath(size), Colors.black87, 6, false);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class MarckerClipper extends CustomClipper<ui.Path> {
  @override
  ui.Path getClip(Size size) {
    return _getPath(size);
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return true;
  }
}
