

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:missin_app/screens/auth/login.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<SignUpScreen> with TickerProviderStateMixin{
  late AnimationController _animationController;
  late Animation<double> _animation;
  TextEditingController _emailTextController =TextEditingController();
  TextEditingController _passTextController = TextEditingController();
  TextEditingController _fullNamedTextController = TextEditingController();
  TextEditingController _positionCPTextController = TextEditingController();
  bool _obscureText = true;
  final _formKey = GlobalKey<FormState>();
  FocusNode _emailNode = FocusNode();
  FocusNode _passlNode = FocusNode();
  FocusNode _fullNameNode = FocusNode();
  FocusNode _positionNode = FocusNode();

  @override
  void initState() {
    _animationController = AnimationController(vsync: this,duration: Duration(seconds: 20));
    _animation = CurvedAnimation(parent: _animationController, curve: Curves.linear)..addListener(() {
      setState(() {

      });
    })..addStatusListener((status) {

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
    _emailTextController.dispose();
    _passTextController.dispose();
    _fullNamedTextController.dispose();
    _positionCPTextController.dispose();
    _passlNode.dispose();
    _fullNameNode.dispose();
    _positionNode.dispose();
    _emailNode.dispose();
    // TODO: implement dispose
    super.dispose();
  }


  void _submitFromRegister(){
  final isValid =  _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if(isValid){
      print('succesful Register');
    }
    else{
      print('failled Register');
    }
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
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: ListView(
              children: [
                SizedBox(height: size.height * 0.1,),
                Text('Register',style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0
                ),),
                SizedBox(height: 9,),
                RichText(text: TextSpan(
                    children: [
                      TextSpan(text: 'Already have an account?',style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16
                      )),
                      TextSpan(text:'  '),
                      TextSpan(text: 'Login',
                          recognizer: TapGestureRecognizer()..onTap = ()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen())),
                          style: TextStyle(
                              color: Colors.blue.shade300,
                              fontWeight: FontWeight.bold,
                              fontSize: 16
                          ))
                    ]
                )),
                SizedBox(height: size.height * 0.065,),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (value){
                          if(value!.isEmpty || value.contains('@') || value.contains('.') || value.length < 12 ){
                            return 'please enter valid a named';
                          }
                          return null;
                        },
                        focusNode: _fullNameNode,
                        textInputAction: TextInputAction.next,
                        onEditingComplete: ()=>FocusScope.of(context).requestFocus(_emailNode),
                        controller: _fullNamedTextController,
                        keyboardType: TextInputType.emailAddress,
                        style: TextStyle(color: Colors.white),
                        decoration:InputDecoration(
                          hintText:'Full name',
                          hintStyle: TextStyle(color: Colors.white),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder:  UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.pink.shade900),
                          ),
                          errorBorder:  UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                          ),


                        ) ,
                      ),
                      SizedBox(height: 16,),
                      TextFormField(
                        validator: (value){
                          if(value!.isEmpty || !value.contains('@') || !value.contains('.') || value.length < 8){
                            return 'please enter valid a email';
                          }
                          return null;
                        },
                        focusNode: _emailNode,
                        textInputAction: TextInputAction.next,
                        onEditingComplete: ()=>FocusScope.of(context).requestFocus(_passlNode),
                        controller: _emailTextController,
                        keyboardType: TextInputType.emailAddress,
                        style: TextStyle(color: Colors.white),
                        decoration:InputDecoration(
                          hintText:'Email',
                          hintStyle: TextStyle(color: Colors.white),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder:  UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.pink.shade900),
                          ),
                          errorBorder:  UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                          ),


                        ) ,
                      ),
                      SizedBox(height: 16.0,),
                      TextFormField(
                        validator: (value){
                          if(value!.isEmpty || value.length<7){
                            return 'please enter valid a password';
                          }
                          return null;
                        },
                        focusNode: _passlNode,
                        textInputAction: TextInputAction.next,
                        onEditingComplete: ()=>FocusScope.of(context).requestFocus(_positionNode),
                        controller: _passTextController,
                        keyboardType: TextInputType.visiblePassword,
                        style: TextStyle(color: Colors.white),
                        obscureText: _obscureText,
                        decoration:InputDecoration(
                          suffixIcon: GestureDetector(
                            onTap: (){
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                            child: Icon(_obscureText? Icons.visibility : Icons.visibility_off,color: Colors.white,),
                          ),
                          hintText:'Password',
                          hintStyle: TextStyle(color: Colors.white),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder:  UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.pink.shade900),
                          ),
                          errorBorder:  UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                          ),

                        ) ,
                      ),
                      SizedBox(height: 16.0,),
                      TextFormField(
                        validator: (value){
                          if(value!.isEmpty || value.contains('@') || value.contains('.') || value.length < 8){
                            return 'please enter valid a position';
                          }
                          return null;
                        },
                        focusNode: _positionNode,
                        textInputAction: TextInputAction.done,
                        onEditingComplete: _submitFromRegister,
                        controller: _positionCPTextController,
                        keyboardType: TextInputType.emailAddress,
                        style: TextStyle(color: Colors.white),
                        decoration:InputDecoration(
                          hintText:'Position in the company',
                          hintStyle: TextStyle(color: Colors.white),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder:  UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.pink.shade900),
                          ),
                          errorBorder:  UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                          ),


                        ) ,
                      ),
                    ],
                  ),
                ),

                // SizedBox(height: size.height * 0.01,),
                // Align(
                //   alignment: Alignment.bottomRight,
                //   child: TextButton(onPressed: (){},
                //       child: Text('Forget Password',style: TextStyle(
                //           color: Colors.white,
                //           fontSize: 16,
                //           fontStyle: FontStyle.italic,
                //           decoration: TextDecoration.underline
                //       ),)),
                // ),
                SizedBox(height: size.height * 0.07,),

                MaterialButton(onPressed: _submitFromRegister,
                  color: Colors.pink.shade700,
                  elevation: 10.0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13.0),
                      side: BorderSide.none
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: Text('Login',style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0
                        ),),
                      ),
                      SizedBox(width: 10.0,),
                      Icon(Icons.person_add,color: Colors.white,)
                    ],
                  ),)
              ],
            ),
          )
        ],
      ),
    );
  }
}
