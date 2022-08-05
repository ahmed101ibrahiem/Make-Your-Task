
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';


class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> with TickerProviderStateMixin{
  late AnimationController _animationController;
  late Animation _animation;
  TextEditingController _forgetPassController = TextEditingController();

  @override
  void initState() {
    _animationController = AnimationController(vsync: this,duration: Duration(seconds: 20));
    _animation = CurvedAnimation(parent: _animationController, curve: Curves.ease)..addListener(() {setState(() {

    });})..addStatusListener((status) {
      if(status == AnimationStatus.completed){
        _animationController.reset();
        _animationController.forward();
      }
    });
    _animationController.forward();
    // TODO: implement initState
    super.initState();
  }
  @override
  void dispose() {
    _animationController.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  void _forgetPasswordFCT(){
    print('con${_forgetPassController.text}');
  }
  @override
  Widget build(BuildContext context) {
   Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          CachedNetworkImage(
            imageUrl:
            "https://media.istockphoto.com/photos/businesswoman-using-computer-in-dark-office-picture-id557608443?k=6&m=557608443&s=612x612&w=0&h=fWWESl6nk7T6ufo4sRjRBSeSiaiVYAzVrY-CLlfMptM=",
            placeholder: (context, url) => Image.asset('assets/images/wallpaper.jpg',fit: BoxFit.cover,),
            errorWidget: (context, url, error) => Icon(Icons.error),
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
            alignment: FractionalOffset(_animation.value,0),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ListView(
              children: [
                SizedBox(height: size.height * 0.1,),
                Text('Forget Password',style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0
                ),),
                SizedBox(height: 16,),
                Text('Email address',style: TextStyle(
                  color: Colors.white70,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  fontSize: 18
                ),),
                SizedBox(height: 12,),
                TextField(
                  controller: _forgetPassController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    //enabled: true,
                    filled: true,
                    fillColor: Colors.white,
                    border: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.grey,)
                    ),
                    errorBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.red,),
                    ),
                    enabledBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.grey,)
                    ),
                    focusedBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.grey,width: 1)
                    )

                  ),
                ),
                SizedBox(height: 16,),
                MaterialButton(
                  elevation: 10,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                  color: Colors.pink.shade700,
                  onPressed: _forgetPasswordFCT,child:
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Text('Reset password',style: TextStyle(
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold
                  ),),
                ),)
              ],
            ),
          )
        ],
      ),
    );
  }
}
