AnimatedOpacity(
  opacity: _showSuccessMessage ? 1.0 : 0.0,
  duration: Duration(seconds: 1),
  child: Text(
    'Transaction Successful!',
    style: TextStyle(fontSize: 20, color: Colors.green),
  ),
)
