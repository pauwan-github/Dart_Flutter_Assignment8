class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButton({Key? key, required this.text, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(text),
      style: ElevatedButton.styleFrom(
        primary: Colors.blue, // Background color
        onPrimary: Colors.white, // Text color
        padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
      ),
    );
  }
}
