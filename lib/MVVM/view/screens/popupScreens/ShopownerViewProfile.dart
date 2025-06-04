import 'package:flutter/material.dart';
import 'package:grocery_app_admin5/MVVM/utils/colors.dart';

class ShopownerviewprofileDrawer extends StatelessWidget {
  final String? name;
  final String? shopname;
  final String? shoptime;
  final String? email;
  final String? phone;
  final String? location;
  final String? address;
  final String? shopPhotoUrl;

  const ShopownerviewprofileDrawer({
    super.key,
    required this.name,
    required this.shopname,
    required this.shoptime,
    required this.email,
    required this.phone,
    required this.location,
    required this.address,
    this.shopPhotoUrl,
  });

  Widget infoCard(String label, IconData icon) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      child: ListTile(
        leading: Icon(icon, color: toggle3color, size: 24),
        title: Text(
          label,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      
      child: Container(
        width: 260, // Reduced width for modern narrow drawer look
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: 160,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: shopPhotoUrl != null
                          ? DecorationImage(
                              image: NetworkImage(shopPhotoUrl!),
                              fit: BoxFit.cover,
                            )
                          : null,
                      color: Colors.grey.shade200,
                    ),
                    child: shopPhotoUrl == null
                        ? Center(
                            child: Icon(
                              Icons.storefront_outlined,
                              size: 70,
                              color: toggle2color.withOpacity(0.7),
                            ),
                          )
                        : null,
                  ),
                  Positioned(
                    bottom: -40,
                    child: CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.white,
                      backgroundImage:
                          const AssetImage("assets/dummy profile photo.jpg"),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),
              Text(
                name ?? "Unknown Owner",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 4),
              Text(
                shopname ?? '',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade700,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                "Open: ${shoptime ?? 'N/A'}",
                style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
              ),
              const SizedBox(height: 20),
      
              // Info cards
              if (phone != null && phone!.isNotEmpty)
                infoCard(phone!, Icons.phone),
              if (location != null && location!.isNotEmpty)
                infoCard(location!, Icons.location_city),
              if (email != null && email!.isNotEmpty)
                infoCard(email!, Icons.email),
              if (address != null && address!.isNotEmpty)
                infoCard(address!, Icons.map),
      
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
