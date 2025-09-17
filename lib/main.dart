import 'package:flutter/material.dart';

void main() {
  runApp(const MBTIApp());
}

class MBTIApp extends StatelessWidget {
  const MBTIApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MBTI Go',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const MBTIHomePage(),
    );
  }
}

class MBTIHomePage extends StatefulWidget {
  const MBTIHomePage({super.key});

  @override
  State<MBTIHomePage> createState() => _MBTIHomePageState();
}

class _MBTIHomePageState extends State<MBTIHomePage> {
  final List<Map<String, String>> mbtiTypes = [
    {'type': 'ENFJ', 'name': 'Protagonist', 'image': 'assets/ENFJ_Protagonist.jpg'},
    {'type': 'ENFP', 'name': 'Campaigner', 'image': 'assets/ENFP_Campaigner.jpg'},
    {'type': 'ENTJ', 'name': 'Commander', 'image': 'assets/ENTJ_Commander.jpg'},
    {'type': 'ENTP', 'name': 'Debater', 'image': 'assets/ENTP_Debater.jpg'},
    {'type': 'ESFJ', 'name': 'Consul', 'image': 'assets/ESFJ_Consul.jpg'},
    {'type': 'ESFP', 'name': 'Entertainer', 'image': 'assets/ESFP_Entertainer.jpg'},
    {'type': 'ESTJ', 'name': 'Executive', 'image': 'assets/ESTJ_Executive.jpg'},
    {'type': 'ESTP', 'name': 'Entrepreneur', 'image': 'assets/ESTP_Entrepreneur.jpg'},
    {'type': 'INFJ', 'name': 'Advocate', 'image': 'assets/INFJ_Advocate.jpg'},
    {'type': 'INFP', 'name': 'Mediator', 'image': 'assets/INFP_Mediator.jpg'},
    {'type': 'INTJ', 'name': 'Architect', 'image': 'assets/INTJ_Architect.jpg'},
    {'type': 'INTP', 'name': 'Thinker', 'image': 'assets/INTP_Thinker.jpg'},
    {'type': 'ISFJ', 'name': 'Protector', 'image': 'assets/ISFJ_Protector.jpg'},
    {'type': 'ISFP', 'name': 'Adventurer', 'image': 'assets/ISFP_Adventurer.jpg'},
    {'type': 'ISTJ', 'name': 'Logistician', 'image': 'assets/ISTJ_Logistician.jpg'},
    {'type': 'ISTP', 'name': 'Virtuoso', 'image': 'assets/ISTP_Virtuoso.jpg'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MBTI Personality Types'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.85,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemCount: mbtiTypes.length,
          itemBuilder: (context, index) {
            final mbtiType = mbtiTypes[index];
            return Card(
              elevation: 4,
              clipBehavior: Clip.antiAlias,
              child: InkWell(
                onTap: () {
                  _showMBTIDetail(context, mbtiType);
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Image.asset(
                        mbtiType['image']!,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: Colors.grey[300],
                            child: const Icon(
                              Icons.person,
                              size: 50,
                              color: Colors.grey,
                            ),
                          );
                        },
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              mbtiType['type']!,
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              mbtiType['name']!,
                              style: Theme.of(context).textTheme.bodySmall,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _showMBTIDetail(BuildContext context, Map<String, String> mbtiType) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('${mbtiType['type']} - ${mbtiType['name']}'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  mbtiType['image']!,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 200,
                      color: Colors.grey[300],
                      child: const Icon(
                        Icons.person,
                        size: 80,
                        color: Colors.grey,
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),
              Text(
                '${mbtiType['type']} personality type, also known as "${mbtiType['name']}"',
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }
}