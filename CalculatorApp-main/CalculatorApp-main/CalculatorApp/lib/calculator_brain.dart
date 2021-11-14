class CalculatorBrain {
  CalculatorBrain({this.height, this.weight,this.weight2,this.width});

  final int height;
  final int weight;
  final int weight2;
  final int width;
  //final int age;

  double sgpa;

  String calculateBMI() {
    //double credits=(height+weight)/2;
    sgpa =(weight2/weight)*(height+width);
    return sgpa.toStringAsFixed(1);
  }

  String getResult() {
    if (sgpa >=3.5) {
      return 'Brilliant Gpa';
    } else if (sgpa >=2.5 ) {
      return 'Normal Gpa';
    } else {
      return 'Bad Gpa';
    }
  }

  String getInterpretation() {
    if (sgpa >=3.5) {
      return 'You are a good Student Keep it Up.';
    } else if (sgpa >= 2.5) {
      return 'You are Average Student!';
    } else {
      return 'You Are Failed.';
    }
  }
}
