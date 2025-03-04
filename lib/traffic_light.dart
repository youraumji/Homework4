import 'package:flutter/material.dart';

class TrafficLightScreen extends StatefulWidget {
  const TrafficLightScreen({super.key});

  @override
  State<TrafficLightScreen> createState() => _TrafficLightScreenState();
}

class _TrafficLightScreenState extends State<TrafficLightScreen> {
  int _currentLight = 0; // 0 = Red, 1 = Yellow, 2 = Green

  void _changeLight() {
    setState(() {
      _currentLight = (_currentLight + 1) % 3; // วนลูป 0 → 1 → 2 → 0
    });
  }

  double _getOpacity(int lightIndex) {
    return (_currentLight == lightIndex) ? 1.0 : 0.2;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🚦 Traffic Light Animation'),
        centerTitle: true,
        backgroundColor: Colors.black87,
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildTrafficLightBox(),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.cyan,
                foregroundColor: Colors.white,
                elevation: 6,
                shadowColor: Colors.black54,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              onPressed: _changeLight,
              child: const Text(
                'เปลี่ยนไฟ',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTrafficLightBox() {
    return Container(
      width: 120,
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.6),
            blurRadius: 15,
            spreadRadius: 5,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          AnimatedOpacity(
            duration: const Duration(seconds: 1),
            opacity: _getOpacity(0),
            child: _buildLight(Colors.red),
          ),
          const SizedBox(height: 10),
          AnimatedOpacity(
            duration: const Duration(seconds: 1),
            opacity: _getOpacity(1),
            child: _buildLight(Colors.yellow),
          ),
          const SizedBox(height: 10),
          AnimatedOpacity(
            duration: const Duration(seconds: 1),
            opacity: _getOpacity(2),
            child: _buildLight(Colors.green),
          ),
        ],
      ),
    );
  }

  Widget _buildLight(Color color) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color.withOpacity(0.9),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.8),
            blurRadius: 20,
            spreadRadius: 10,
          ),
        ],
        border: Border.all(color: Colors.white30, width: 3),
      ),
    );
  }
}
