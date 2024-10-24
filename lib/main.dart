import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:med_reminder/core/routing/app_router.dart';
import 'package:med_reminder/features/home/view/home.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// void main() async {
//   //WidgetsFlutterBinding.ensureInitialized();
//   //await NotificationService.init();
// //  tz.initializeTimeZones();

//   runApp(const MyApp());
// }
void main() {
  runApp(const ProviderScope(child: MedReminder()));
}
// void main() => runApp(
//       DevicePreview(
//         enabled: true,
//         builder: (context) => const MedReminder(), // Wrap your app
//       ),
//     );

class MedReminder extends StatelessWidget {
  const MedReminder({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScreenUtilInit(
      designSize: Size(393, 852), // for figma
      minTextAdapt: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Home(),
        onGenerateRoute: AppRouter.generateRoute,
      ),
    );
  }
}

// class Homee extends StatefulWidget {
//   const Homee({super.key});

//   @override
//   State<Homee> createState() => _HomeState();
// }

// class _HomeState extends State<Homee> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ElevatedButton(
//               onPressed: () {
//                 NotificationService.showInstantNotification(
//                     "Instant Notification",
//                     "This shows an instant notifications");
//               },
//               child: const Text('Show Notification'),
//             ),
//             const SizedBox(height: 12),
//             ElevatedButton(
//               onPressed: () {
//                 DateTime scheduledDate =
//                     DateTime.now().add(const Duration(seconds: 5));
//                 NotificationService.scheduleNotification(
//                   0,
//                   "Scheduled Notification",
//                   "This notification is scheduled to appear after 5 seconds",
//                   scheduledDate,
//                 );
//               },
//               child: const Text('Schedule Notification'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
