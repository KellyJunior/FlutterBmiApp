import 'package:bmi_calculator/result_Page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'ReusableCard.dart';
import 'ReusableCardChild.dart';
import 'constants.dart';
import 'result_Page.dart';
import 'calculation_button.dart';
import 'bmi_Brain.dart';


enum Gender{
  male,
  female,
}
class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height =180;
  int weight =60;
  int age = 10;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      onPress:(){
                        setState(() {
                          selectedGender=Gender.male;
                        });
                      },
                      colour: selectedGender==Gender.male ? kActiveCardColor : kInactiveCardColor,
                      cardChild: ReusableCardChild(
                        content: 'MALE',
                        iconValue: FontAwesomeIcons.mars,
                      ),
                    ),
                  ),
                  Expanded(child: ReusableCard(
                    onPress:(){
                      setState(() {
                        selectedGender=Gender.female;
                      });
                    },
                    colour: selectedGender==Gender.female ? kActiveCardColor : kInactiveCardColor,
                    cardChild: ReusableCardChild(
                      content: 'FEMALE',
                      iconValue: FontAwesomeIcons.venus,
                      ),
                    ),
                  ),
                ],
              ),
          ),
          Expanded(child: ReusableCard(
            colour: kActiveCardColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('HEIGHT'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    Text(
                      height.toString(),
                        style:kNumberStyle,
                    ),
                    Text(
                      'cm',
                      style: kContentTextStyle,
                    ),

                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    thumbColor: Color(0xFFEB1555),
                    activeTrackColor: Colors.white,
                    overlayColor: Color(0x29EB1555),
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 20.0),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 40.0),
                  ),
                  child: Slider(
                    value: height.toDouble(),
                    min: 120,
                    max: 220,
                    inactiveColor: Color(0xFF8D8E98),
                    onChanged: (double newValue){
                      setState(() {
                        height=newValue.round();
                      });

                    },
                  ),
                ),
              ],
            ),
          ),
          ),
          Expanded(
            child: Row(
            children: <Widget>[
              Expanded(child: ReusableCard(
                colour: kActiveCardColor,
                cardChild: Column(

                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('WEIGHT',style: kContentTextStyle,
                    ),
                    Text(
                      weight.toString(),
                      style: kNumberStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                       RoundIconButton(icon: FontAwesomeIcons.plus,
                       onPressed: (){
                         setState(() {
                           weight++;
                         });
                       },),
                        SizedBox(width: 15.0,),
                        RoundIconButton(icon: FontAwesomeIcons.minus,
                        onPressed: (){
                          setState(() {
                            weight--;
                          });
                        },),
                      ],

                    ),

                  ],
                ),
              ),
              ),
              Expanded(child: ReusableCard(
                colour: kActiveCardColor,
                cardChild: Column(

                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('AGE',style: kContentTextStyle,
                    ),
                    Text(
                      age.toString(),
                      style: kNumberStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RoundIconButton(icon: FontAwesomeIcons.plus,
                          onPressed: (){
                            setState(() {
                              age++;
                            });
                          },),
                        SizedBox(width: 15.0,),
                        RoundIconButton(icon: FontAwesomeIcons.minus,
                          onPressed: (){
                            setState(() {
                              age--;
                            });
                          },),
                      ],

                    ),

                  ],
                ),
              ),
              ),
            ],
          ),
          ),
          CalculateButton(
            buttonTitle: 'CALCULATE',
            onTap:() {
              BmiBrain calc = BmiBrain(height: height, weight: weight);

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context)=>ResultsPage(
                        bmiResult: calc.calculateBMI(),
                        resultText: calc.getResult(),
                        interpretation: calc.getInterpretation(),
                      ),

            ),
            );
            },
          ),
        ],
      ),
    );
  }
}


class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.icon,this.onPressed});
  final IconData icon;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon) ,
      onPressed: onPressed,
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape:CircleBorder() ,
      fillColor:Color(0xFF4C4F5E),
    );
  }
}



