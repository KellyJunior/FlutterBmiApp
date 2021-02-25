import 'dart:math';
class BmiBrain{
  BmiBrain({this.height, this.weight});
  final height;
  final weight;
  double _bmi;
  String calculateBMI(){
     _bmi= weight/pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }
  String getResult(){
    if(_bmi>=25){
      return 'OVERWEIGHT';
    }else if(_bmi>18.5){
      return 'NORMAL';
    }else{
      return 'UNDERWEIGHT';
    }
  }

  String getInterpretation(){
    if(_bmi>=25){
      return 'Your BMI is Higher. Try to exercise more';
    }else if(_bmi>18.5){
    return 'Your BMI is Normal. Keep it up';
    }else{
    return 'Your BMI is Low. You have to eat more';
    }
  }
}