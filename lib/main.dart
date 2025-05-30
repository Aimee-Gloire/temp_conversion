import 'package:flutter/material.dart';

void main() {
  runApp(ConversionApp());
}

class ConversionApp extends StatelessWidget {
  const ConversionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Temp Converter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.teal),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  MainScreenState createState() => MainScreenState();
}

enum ConversionType { cToF, fToC }

class MainScreenState extends State<MainScreen> {
  final TextEditingController _controller = TextEditingController();
  ConversionType _selectedConversion = ConversionType.cToF;
  String _convertedResult = '';
  final List<String> _conversionHistory = [];

  // Function to perform the temperature conversion
  void _convertTemperature() {
    final input = _controller.text;
    // checking if input is empty or not a number
    if (input.isEmpty) {
      _showError("Please enter a temperature value");
      return;
    }
    // Converting input to a number(double)
    final value = double.tryParse(input);

    if (value == null) {
      _showError("Invalid number entered");
      return;
    }

    double result;
    String historyEntry;

    if (_selectedConversion == ConversionType.cToF) {
      result = (value * 9 / 5) + 32;
      historyEntry = "C to F: $value = ${result.toStringAsFixed(2)}";
    } else {
      result = (value - 32) * 5 / 9;
      historyEntry = "F to C: $value = ${result.toStringAsFixed(2)}";
    }

    // Update the state with the conversion result and history

    setState(() {
      _convertedResult = result.toStringAsFixed(2);
      _conversionHistory.insert(0, historyEntry); // shows the newest first
    });

    _controller.clear(); // Clears the input field
  }

  // Show a snackbar message for errors
  void _showError(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    // Responsive layout check
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber[200],
        title: const Text('Temperature Converter'),
        centerTitle: true,
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: isPortrait ? _buildPortraitLayout() : _buildLandscapeLayout(),
        ),
    );
  }

  Widget _buildPortraitLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: _buildSharedWidgets(),
    );
  }

  Widget _buildLandscapeLayout() {
    return Row(
      children: [
        Expanded(child: Column(children: _buildSharedWidgets().sublist(0, 4))),
        Expanded(child: Column(children: _buildSharedWidgets().sublist(4))),
      ],
    );
  }

  // Reusable widgets for portrait/landscape
  List<Widget> _buildSharedWidgets() {
    return [
      SizedBox(height: 16),
      TextField(
        controller: _controller,
        keyboardType: TextInputType.numberWithOptions(decimal: true),
        decoration: InputDecoration(
          labelText: "Enter temperature",
          border: OutlineInputBorder(),
        ),
      ),
      SizedBox(height: 16),
      Column(
        children: [
          SizedBox(height: 8),
          Text(
            'Choose a mode:',
            style: 
            TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          RadioListTile<ConversionType>(
            title: Text("Celsius to Fahrenheit"),
            value: ConversionType.cToF,
            groupValue: _selectedConversion,
            onChanged: (value) => setState(() => _selectedConversion = value!),
          ),
          RadioListTile<ConversionType>(
            title: Text("Fahrenheit to Celsius"),
            value: ConversionType.fToC,
            groupValue: _selectedConversion,
            onChanged: (value) => setState(() => _selectedConversion = value!),
          ),
        ],
      ),
      SizedBox(height: 16),

      ElevatedButton(
        onPressed: _convertTemperature,
        child: const Text('Convert'),
      ),

      SizedBox(height: 20),
      // Display the conversion result that is stored in _convertedResult
      if (_convertedResult.isNotEmpty)
        Text(
          'Result: $_convertedResult°',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      SizedBox(height: 16),
      Divider(height: 32),
      Expanded(
        child:
            _conversionHistory.isEmpty
                ? Center(child: Text("No conversion history yet"))
                : ListView.builder(
                  itemCount: _conversionHistory.length,
                  itemBuilder:
                      (context, index) => ListTile(
                        leading: Icon(Icons.history),
                        title: Text(_conversionHistory[index]),
                      ),
                ),
      ),
    ];
  }
}
