/* import 'package:flutter/material.dart';
import 'package:flutter_course/pages/home.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GoogleSignIn googleSignIn=new GoogleSignIn();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  SharedPreferences preferences;
  bool loading = false;          //load when user is logging in
  bool isLogedIn = false;
  
  void initState(){
    super.initState();
    isSignedIn();           //when login page execeute method

  }

  void isSignedIn() async{        //something that is going to come in future but while we are w8ing do something else
    setState(() {
     loading =true;    
    });

    preferences=await SharedPreferences.getInstance();  //insta loading //wait for omwthing comig from future
    isLogedIn=await googleSignIn.isSignedIn();  //IMP

    if(isLogedIn==true){   
      Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=>HomePage()));   //no back button on page
    }

    setState((){         //update
      loading=false;
    });
 
 }

  Future handleSignIn() async{
    preferences = await SharedPreferences.getInstance();          //await datat type for future type

    setState((){
     loading=true;
    
  });
GoogleSignInAccount googleUser = await googleSignIn.signIn();   //sign user in
GoogleSignInAuthentication googleSignInAuthentication = await googleUser.authentication;   //authnticate user
AuthCredential credential = GoogleAuthProvider.getCredential(
    idToken: googleSignInAuthentication.idToken, 
    accessToken: googleSignInAuthentication.accessToken);
FirebaseUser firebaseUser = await firebaseAuth.signInWithCredential(credential);
 // print("signed in " + firebaseUser.displayName);
 //   return firebaseUser;

 if(firebaseUser!=null){
   final QuerySnapshot result =await Firestore.instance.collection("users").where("id",isEqualTo:firebaseUser.uid).getDocuments();
   final List<DocumentSnapshot> documents = result.documents;

   if(documents.length == 0){
     //insert the user to our collection
     Firestore.instance.collection("users").document(firebaseUser.uid).setData({
       "id":firebaseUser.uid,
       "username:":firebaseUser.displayName,
       "profilePicture":firebaseUser.photoUrl
       });
       await preferences.setString("id",firebaseUser.uid);
       await preferences.setString("username",firebaseUser.displayName);
       await preferences.setString("photoUrl",firebaseUser.photoUrl);
 
 }else{
        await preferences.setString("id",documents[0]['id']);
       await preferences.setString("username",documents[0]['username']);
       await preferences.setString("photoUrl",documents[0]['photoUrl']);
 }

  Fluttertoast.showToast(msg:"Login was successful");
  setState(() {
   loading=false; 
  });


 }else{
   Fluttertoast.showToast(msg:"Login failed");
 }
}
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      appBar:AppBar(backgroundColor:Colors.white ,
         centerTitle:true,
         title:new Text("Login",style:TextStyle(color:Colors.red.shade900),),
         elevation:0.1,

      ),
      body:Stack(children: <Widget>[
        Center(
          child: FlatButton(
            color:Colors.red.shade900,
            onPressed:(){
             handleSignIn();
            },
            child: Text("sign in /sign up with google",style:TextStyle(color:Colors.white),)),
            ),

        Visibility(
          visible:loading??true,
          child:Center(
            child: Container(
              alignment: Alignment.center,
              color:Colors.white.withOpacity(0.9),
              child:CircularProgressIndicator(
                valueColor:AlwaysStoppedAnimation<Color>(Colors.red)
                
              ),
            ),
           )
          )
      ],)
      
    );
  }
}  

 */