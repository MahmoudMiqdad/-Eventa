
import 'package:eventa_project/color.dart';
import 'package:eventa_project/view/screen/public_event/own_event/Veiw%20my%20events.dart';
import 'package:flutter/material.dart';


class Custom_choose_event extends StatelessWidget {
  const Custom_choose_event({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
    
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           const Spacer(flex: 5,),
          GestureDetector(
            onTap: (){
               Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>Veiw_mypublicEvents (),
              ),
            );
            },
            child: Container(
              
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                gradient: const LinearGradient(
                  colors: [Appcolor.mainColor, Color.fromARGB(255, 7, 17, 92)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              
              child:
               const Text(
                '  Public   ',
                style: TextStyle(
                    color: Appcolor.white,
                    fontSize: 50,
                    fontWeight: FontWeight.bold),
              ),
              
            ),
          ),
          const Spacer(flex: 1,),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              gradient: const LinearGradient(
                colors: [Appcolor.mainColor, Color.fromARGB(255, 7, 17, 92)],
                begin: Alignment.bottomRight,
                end: Alignment.bottomLeft,
              ),
            ),
            child:  const Text(
              '  Private  ',
              style: TextStyle(
                  color: Appcolor.white,
                  fontSize: 50,
                  fontWeight: FontWeight.bold),
            ),
          ),
           const Spacer(flex: 5,),
        ],
      ),
    );
  }
}
