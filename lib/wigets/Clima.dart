import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WeatherScreen(),
    );
  }
}

class WeatherScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Número de pestañas
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              // Acción para el botón de regreso
              Navigator.pop(context);
            },
          ),
          title: SizedBox.shrink(), // Para evitar que el AppBar tenga un título
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Texto genérico en lugar de la fecha
              Text(
                'August 8',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              SizedBox(height: 4),
              // Nombre de la ciudad
              Text(
                'London',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              // Temperatura actual en dorado
              Text(
                '21°C',
                style: TextStyle(
                  fontSize: 48,
                  color: Color.fromARGB(255, 255, 238, 0),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              // TabBar (debajo de la temperatura y ciudad)
              TabBar(
                labelColor: Colors.black,
                indicatorColor: Color.fromARGB(255, 252, 231, 5),
                tabs: [
                  Tab(text: 'Today'),
                  Tab(text: 'This Week'),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    // Pestaña Today
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 16),
                          Text(
                            'Temperatures',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 8),
                          // Fila de temperaturas con íconos de nubes
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Icon(Icons.cloud, size: 32, color: Colors.blue),
                                  SizedBox(height: 4),
                                  Text('8 PM: 21°C'),
                                ],
                              ),
                              Column(
                                children: [
                                  Icon(Icons.cloud, size: 32, color: Colors.blue),
                                  SizedBox(height: 4),
                                  Text('11 PM: 22°C'),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 16),
                          Text(
                            'Details',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 8),
                          // Detalles con encabezados y datos en negrita
                          Container(
                            padding: const EdgeInsets.only(bottom: 16.0),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.grey[300]!,
                                  width: 1.0,
                                ),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: DetailRow(label: 'Min', value: '21°C'),
                                ),
                                Expanded(
                                  child: DetailRow(label: 'Max', value: '22°C'),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 16),
                          Container(
                            padding: const EdgeInsets.only(bottom: 16.0),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.grey[300]!,
                                  width: 1.0,
                                ),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: DetailRow(label: 'Pressure', value: '1010 Pa'),
                                ),
                                Expanded(
                                  child: DetailRow(label: 'Humidity', value: '41%'),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Pestaña This Week
                    Center(
                      child: Text(
                        'Weekly forecast coming soon!',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DetailRow extends StatelessWidget {
  final String label;
  final String value;

  DetailRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$label:',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(width: 8),
        Text(
          value,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}