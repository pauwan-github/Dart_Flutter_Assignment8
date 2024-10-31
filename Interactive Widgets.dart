class SendMoneyPage extends StatefulWidget {
  @override
  _SendMoneyPageState createState() => _SendMoneyPageState();
}

class _SendMoneyPageState extends State<SendMoneyPage> {
  final _formKey = GlobalKey<FormState>();
  String recipientName = '';
  double amount = 0.0;
  String? paymentMethod;
  bool isFavorite = false;

  final List<String> paymentMethods = ['Credit Card', 'Debit Card', 'PayPal'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Send Money')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // TextField for recipient name
              TextFormField(
                decoration: InputDecoration(labelText: 'Recipient Name'),
                validator: (value) => value!.isEmpty ? 'Please enter a name' : null,
              ),
              SizedBox(height: 16.0), // Consistent spacing
              // TextField for amount
              TextFormField(
                decoration: InputDecoration(labelText: 'Amount', prefixText: '\$'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty || double.tryParse(value) == null || double.parse(value) <= 0) {
                    return 'Please enter a valid amount';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0), // Consistent spacing
              // Dropdown for payment method
              DropdownButtonFormField<String>(
                decoration: InputDecoration(labelText: 'Payment Method'),
                items: paymentMethods.map((method) {
                  return DropdownMenuItem(value: method, child: Text(method));
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    paymentMethod = value;
                  });
                },
                validator: (value) => value == null ? 'Please select a payment method' : null,
              ),
              SizedBox(height: 16.0), // Consistent spacing
              // Switch for favorite
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Mark as Favorite'),
                  Switch(value: isFavorite, onChanged: (value) => setState(() => isFavorite = value)),
                ],
              ),
              SizedBox(height: 20),
              // Custom button for sending money
              CustomButton(
                text: 'Send Money',
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Handle successful validation
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
