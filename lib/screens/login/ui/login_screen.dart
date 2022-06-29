

import 'package:fixnit/common_widget/custom_text_button.dart';
import 'package:fixnit/common_widget/custom_text_field.dart';
import 'package:fixnit/screens/login/bloc/login_cubit.dart';
import 'package:fixnit/screens/login/bloc/login_state.dart';
import 'package:fixnit/utils/resolve.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class LoginScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:      Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(begin: Alignment.topCenter,colors: [
                          Colors.orange[900]!,
                          Colors.orange[800]!,
                          Colors.orange[400]!,
                        ])
                      ),
                      child:
                            Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 80,),
                              Padding(
                                padding: EdgeInsets.all(20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Login",style: TextStyle(color: Colors.white,fontSize:40),),
                                    SizedBox(height: 10,),
                                    Text('Welcome Back',style: TextStyle(color: Colors.white,fontSize: 18),)
                                  ],
                                ),
                              ),
                              SizedBox(height: 20,),
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(topLeft: Radius.circular(60),topRight: Radius.circular(60)),

                                  ),
                                  child: SingleChildScrollView(
                                    child: Padding(
                                      padding: EdgeInsets.all(30),
                                      child: Column(
                                        children: [
                                          SizedBox(height: 60,),
                                          Container(decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(10),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Color.fromRGBO(225, 95, 27, 3),
                                                blurRadius: 20,
                                                offset: Offset(0,10)
                                              )
                                            ]
                                          ),
                                          child:
                                        Column(
                                                children: [
                                          BlocBuilder<LoginCubit, LoginState>(
        builder: (contexts,state) {
        return   CustomTextFieldWidget(
                                                  hintText: 'Email',
                                                  onChanged: (email) => contexts.read<LoginCubit>().emailChanged(email!),
                                                  keyboardType: TextInputType.emailAddress,
                                                );}),
                                                /*  CustomTextFieldWidget(
                                                    hintText: 'Password',
                                                    onChanged: (email) => contexts.read<LoginCubit>().emailChanged(email!),
                                                    keyboardType: TextInputType.text,
                                                  ),*/
                                                  CustomTextButton(onPressed: (){

                                                  })
                                                ],

                                          )

                                      ),
                                    ]),
                                  ),
                                ),
                              )


                          )]))));



            }


}