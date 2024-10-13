import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:med_reminder/core/theming/colors.dart';
import 'package:med_reminder/core/theming/text_styel.dart';

class MedicineCard extends StatelessWidget {
  const MedicineCard({super.key});

  @override
  Widget build(BuildContext context) {
    // تأكد من أنك قمت بتهيئة ScreenUtil في النقطة الأساسية للتطبيق
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.r), // استخدام ScreenUtil
      ),
      elevation: 5,
      child: Padding(
        padding: EdgeInsets.all(16.w), // استخدام ScreenUtil
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "Multivitamin",
                  style: TextStyles.font20PrimaryBold,
                ),
                const Spacer(),
                Icon(
                  Icons.notifications,
                  color: Colors.blueAccent,
                  size: 24.sp, // استخدام ScreenUtil
                ),
              ],
            ),
            SizedBox(height: 10.h), // استخدام ScreenUtil
            Row(
              children: [
                Text(
                  "Frequency: ",
                  style: TextStyle(
                    fontSize: 16.sp, // استخدام ScreenUtil
                    color: Colors.grey[700],
                  ),
                ),
                Text(
                  "EveryDay",
                  style: TextStyle(
                    fontSize: 16.sp, // استخدام ScreenUtil
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h), // استخدام ScreenUtil
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Schedule: ",
                  style: TextStyle(
                    fontSize: 16.sp, // استخدام ScreenUtil
                    color: Colors.grey[700],
                  ),
                ),
                Wrap(
                  spacing: 5.w, // استخدام ScreenUtil
                  runSpacing: 4.h, // استخدام ScreenUtil
                  children: [
                    _buildChip("after breakfast"),
                    _buildChip("after lunch"),
                    _buildChip("after dinner"),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10.h), // استخدام ScreenUtil
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Notification Time: ",
                  style: TextStyle(
                    fontSize: 16.sp, // استخدام ScreenUtil
                    color: Colors.grey[700],
                  ),
                ),
                Wrap(
                  spacing: 8.w, // استخدام ScreenUtil
                  runSpacing: 4.h, // استخدام ScreenUtil
                  children: [
                    _buildTimeChip("07:00"),
                    _buildTimeChip("12:00"),
                    _buildTimeChip("19:00"),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChip(String label) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: 8.w, vertical: 4.h), // استخدام ScreenUtil لتحديد الحواف
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8.r), // استخدام ScreenUtil للحواف
        border: Border.all(
          color: ColorsManager.grey, // لون البوردر
          width: 1.w, // سمك البوردر باستخدام ScreenUtil
        ),
      ),
      child: Text(
        label,
        style: TextStyle(fontSize: 10.sp), // استخدام ScreenUtil لحجم الخط
      ),
    );
  }

  Widget _buildTimeChip(String time) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: 8.w, vertical: 4.h), // استخدام ScreenUtil لتحديد الحواف
      decoration: BoxDecoration(
        color: Colors.blue[100],
        borderRadius: BorderRadius.circular(8.r), // استخدام ScreenUtil للحواف
        border: Border.all(
          color: Colors.blueAccent, // لون البوردر
          width: 1.w, // سمك البوردر باستخدام ScreenUtil
        ),
      ),
      child: Text(
        time,
        style: TextStyle(fontSize: 10.sp), // استخدام ScreenUtil لحجم الخط
      ),
    );
  }
}
