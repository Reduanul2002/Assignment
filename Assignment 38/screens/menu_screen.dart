import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/user_provider.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    // মেনু আইটেমগুলোর ডামি ডাটা লিস্ট
    final List<Map<String, dynamic>> menuItems = [
      {'icon': Icons.home_outlined, 'title': 'Home'},
      {'icon': Icons.assignment_outlined, 'title': 'Statements'},
      {'icon': Icons.gavel_outlined, 'title': 'Limit'},
      {'icon': Icons.headset_mic_outlined, 'title': 'Customer Service'},
      {'icon': Icons.map_outlined, 'title': 'bKash Map'},
      {'icon': Icons.info_outline, 'title': 'Information Update'},
      {'icon': Icons.people_outline, 'title': 'Nominee Update'},
      {'icon': Icons.star_border, 'title': 'Discover bKash', 'trailing': 'New'},
      {'icon': Icons.phone_android_outlined, 'title': 'Refer bKash App'},
      {'icon': Icons.logout, 'title': 'Log out'},
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('bKash Menu', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFFE2125B), // bKash Pink Color
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.close, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ), // 👈 এখানে ক্লোজিং ব্র্যাকেট এবং কমা ( ), ) মিসিং ছিল, যা ফিক্স করা হয়েছে।

      body: ListView(
        children: [
          // ব্যবহারকারীর সংক্ষিপ্ত তথ্য কার্ড
          Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundImage: NetworkImage(userProvider.profileImageUrl),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userProvider.userName,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      userProvider.userPhone,
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // মেনু অপশন সমূহের লিস্ট
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: menuItems.length,
            separatorBuilder: (context, index) => const Divider(height: 1),
            itemBuilder: (context, index) {
              final item = menuItems[index];
              return ListTile(
                leading: Icon(item['icon'], color: const Color(0xFFE2125B)),
                title: Text(item['title'], style: const TextStyle(fontSize: 14)),
                trailing: item.containsKey('trailing')
                    ? Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE2125B),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    item['trailing'],
                    style: const TextStyle(color: Colors.white, fontSize: 10),
                  ),
                )
                    : const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
                onTap: () {
                  // মেনু ক্লিকের লजিক (প্রয়োজন হলে)
                },
              );
            },
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Center(child: Text('Version 2.1.2', style: TextStyle(color: Colors.grey, fontSize: 12))),
          )
        ],
      ),
    );
  }
}