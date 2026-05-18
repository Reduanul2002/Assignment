import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/user_provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    // প্রোফাইল আইটেমগুলোর ক্যাটাগরি অনুযায়ী ডামি ডাটা লিস্ট
    final List<Map<String, dynamic>> accountSettings = [
      {'icon': Icons.touch_app_outlined, 'title': 'One Tap Transaction'},
      {'icon': Icons.nfc_outlined, 'title': 'bKash NFC'},
      {'icon': Icons.credit_card_outlined, 'title': 'Saved Cards'},
      {'icon': Icons.link, 'title': 'Linked Apps'},
      {'icon': Icons.fingerprint, 'title': 'Touch/Face ID'},
    ];

    final List<Map<String, dynamic>> preferences = [
      {'icon': Icons.palette_outlined, 'title': 'Select Theme'},
      {'icon': Icons.notifications_none_outlined, 'title': 'Notification Management'},
    ];

    final List<Map<String, dynamic>> accountManagement = [
      {'icon': Icons.phone_android_outlined, 'title': 'Update bKash Number'},
      {'icon': Icons.more_horiz, 'title': 'Others'},
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Profile', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFFE2125B),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ), // 👈 এখানে ব্র্যাকেট এবং কমা ( ), ) মিসিং ছিল, যা ফিক্স করা হয়েছে।

      body: ListView(
        children: [
          // প্রোফাইল হেডার (ছবি ও নাম)
          Container(
            color: const Color(0xFFE2125B),
            padding: const EdgeInsets.only(bottom: 24, top: 10),
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    CircleAvatar(
                      radius: 45,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 42,
                        backgroundImage: NetworkImage(userProvider.profileImageUrl),
                      ),
                    ),
                    const CircleAvatar(
                      radius: 14,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.edit, size: 16, color: Color(0xFFE2125B)),
                    )
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  userProvider.userName,
                  style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  userProvider.userPhone,
                  style: const TextStyle(color: Colors.white70, fontSize: 14),
                ),
              ],
            ),
          ),

          // সেকশন ১: Set Your Transaction Feature
          _buildSectionTitle('Set Your Transaction Feature'),
          _buildListSection(accountSettings),

          // সেকশন ২: Select Your Preference
          _buildSectionTitle('Select Your Preference'),
          _buildListSection(preferences),

          // সেকশন ৩: Manage Your Account
          _buildSectionTitle('Manage Your Account'),
          _buildListSection(accountManagement),

          const SizedBox(height: 20),
        ],
      ),
    );
  }

  // সেকশন টাইটেল উইজেট
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 16, bottom: 8),
      child: Text(
        title,
        style: TextStyle(color: Colors.grey.shade600, fontSize: 13, fontWeight: FontWeight.bold),
      ),
    );
  }

  // লিস্ট আইটেম জেনারেটর উইজেট
  Widget _buildListSection(List<Map<String, dynamic>> items) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      separatorBuilder: (context, index) => const Divider(height: 1, indent: 55),
      itemBuilder: (context, index) {
        final item = items[index];
        return ListTile(
          leading: Icon(item['icon'], color: const Color(0xFFE2125B)),
          title: Text(item['title'], style: const TextStyle(fontSize: 14)),
          trailing: const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
          onTap: () {},
        );
      },
    );
  }
}