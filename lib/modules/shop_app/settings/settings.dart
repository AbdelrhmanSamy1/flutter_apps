import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/components/components.dart';
import 'package:flutter_app/layout/shop_app/cubit/cubit.dart';
import 'package:flutter_app/layout/shop_app/cubit/states.dart';
import 'package:flutter_app/shared/components/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsScreen extends StatelessWidget {
  final nameController=TextEditingController();
  final phoneController=TextEditingController();
  final emailController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopStates>(
      listener: (context,state)
      {
      },
      builder: (context,state){
        var model = ShopCubit.get(context).userModel;
        var formKey=GlobalKey<FormState>();
        nameController.text = model.data.name;
        emailController.text = model.data.email;
        phoneController.text = model.data.phone;
        return  ConditionalBuilder(
          condition: ShopCubit.get(context).userModel !=null,
          builder:(context)=>  Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    if(state is ShopLoadingUpdateUserState)
                      LinearProgressIndicator(),
                    SizedBox(
                      height: 20.0,
                    ),
                    defaultFormField(
                      controller: nameController,
                      type: TextInputType.name,
                      validate: (value)
                      {
                        if(value.isEmpty)
                        {
                          return'name must not be empty';
                        }
                        return null;
                      },
                      label:  'Name',
                      prefix: Icons.person,
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    defaultFormField(
                      controller: emailController,
                      type: TextInputType.emailAddress,
                      validate: (value)
                      {
                        if(value.isEmpty)
                        {
                          return'name must not be empty';
                        }
                        return null;
                      },
                      label:  'Email Address',
                      prefix: Icons.email,
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    defaultFormField(
                      controller: phoneController,
                      type: TextInputType.phone,
                      validate: (value)
                      {
                        if(value.isEmpty)
                        {
                          return'name must not be empty';
                        }
                        return null;
                      },
                      label:  'Phone',
                      prefix: Icons.phone,
                    ),
                    SizedBox(
                      height: 15.0,
                    ),

                    defaultButton(text: 'UPDATE',
                      function:(){
                        if(formKey.currentState.validate())
                        {
                          ShopCubit.get(context).updateUserData(
                            name:nameController.text,
                            email: emailController.text,
                            phone: phoneController.text,
                          );
                        }
                      },
                    ),
                    SizedBox(
                      height: 15.0,
                    ),

                    defaultButton(text: 'logout',
                      function:(){
                        signOut(context);
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
          fallback: (context)=>Center(child: CircularProgressIndicator(),),

        );
      },
    );
  }
}