
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:missin_app/screens/auth/forget_password.dart';
import 'package:missin_app/screens/auth/signup.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with TickerProviderStateMixin{
  late AnimationController _animationController;
  late Animation<double> _animation;
  TextEditingController _emailTextController =TextEditingController();
  TextEditingController _passTextController = TextEditingController();
  bool _obscureText = true;
  final _formKey = GlobalKey<FormState>();
  FocusNode _emailFNode =FocusNode();
  FocusNode _passFNode =FocusNode();

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
    _emailFNode.dispose();
    _passFNode.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  void submitFromOnLogin(){
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if(isValid){
      print('Form is valid');
    }else{
      print('Form is not valid');
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
                Text('Login',style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0
                ),),
                SizedBox(height: 9,),
                RichText(text: TextSpan(
                  children: [
                    TextSpan(text: 'Don\'t have an account?',style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16
                    )),
                    TextSpan(text:'  '),
                    TextSpan(text: 'Sign Up',
                        recognizer: TapGestureRecognizer()..onTap = ()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignUpScreen())),
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
                          if(value!.isEmpty || !value.contains('@') || !value.contains('.') || value.length < 8){
                            return 'please enter valid a email';
                          }
                          return null;
                        },
                        focusNode: _emailFNode,
                        textInputAction: TextInputAction.next,
                        onEditingComplete:()=> FocusScope.of(context).requestFocus(_passFNode),
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
                      SizedBox(height: 12.0,),
                      TextFormField(
                        validator: (value){
                          if(value!.isEmpty || value.length<7){
                            return 'please enter valid a password';
                          }
                          return null;
                        },
                        focusNode: _passFNode,
                        textInputAction: TextInputAction.go,
                        onEditingComplete: submitFromOnLogin,
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
                    ],
                  ),
                ),

                SizedBox(height: size.height * 0.01,),
                Align(
                  alignment: Alignment.bottomRight,
                  child: TextButton(onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgetPassword())),
                      child: Text('Forget Password',style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontStyle: FontStyle.italic,
                        decoration: TextDecoration.underline
                      ),)),
                ),
                SizedBox(height: size.height * 0.07,),

                MaterialButton(onPressed: submitFromOnLogin,
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
                    Icon(Icons.login,color: Colors.white,)
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
