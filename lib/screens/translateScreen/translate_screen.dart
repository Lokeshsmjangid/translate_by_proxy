import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:provider/provider.dart';
import 'package:translate_interview/model/language_model.dart';
import 'package:translate_interview/resources/app_button.dart';
import 'package:translate_interview/resources/app_colors.dart';
import 'package:translate_interview/resources/text_utility.dart';
import 'package:translate_interview/screens/translateScreen/translate_controller.dart';
import 'package:get/get.dart';

class TranslateScreen extends StatelessWidget {
  const TranslateScreen({super.key});


  @override
  Widget build(BuildContext context) {
    final languageModel = Provider.of<LanguageModel>(context);
    final selectedLocal = Provider.of<Map<String, String>>(context);
    // final translateModel = Provider.of<TranslateController>(context);

    return  Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: addText500(selectedLocal['title'] ?? "Translation Demo",
                 color: AppColors.blackColor, fontSize: 20),

              ),
              body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: DropdownButtonFormField<LangListData>(
                              decoration: InputDecoration(
                                // labelText: 'Select an option',
                                border: OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(Radius.circular(10)) , // Rounded corners (optional)
                                  borderSide: BorderSide(
                                    color: AppColors.greyColor,
                                  ),
                                ),
                                enabledBorder: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(10)) , // Rounded corners (optional)
                                  borderSide: BorderSide(
                                    color: AppColors.greyColor,
                                    width: 2,
                                  ),
                                ) ,
                                focusedBorder: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(15)),
                                  borderSide: BorderSide(
                                    color: AppColors.greyColor , // Border color when focused
                                    width: 2, // Border width
                                  ),
                                ),
                                suffixIcon: Container(
                                  margin: const EdgeInsets.only(left: 10),
                                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                  child: Icon(Icons.keyboard_arrow_down)
                                ),
                                contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 18),
                              ),
                            
                              hint: const Text(
                                "English",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: AppColors.blackColor,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              iconSize: 0,
                              value: null, // Initial selected value
                              items: languageModel.langData
                                  .map((item) {
                                return DropdownMenuItem<LangListData>(
                                  value: item,
                                  child: Text("${item.name}"),
                                );
                              }).toList(),
                              onChanged: (newValue) {
                                languageModel.selectedLocalLang = newValue!.locale ;
                                // languageModel.notifyListeners();
                                // contt.selectedLang = newValue!.language.toString() ;
                                // contt.selectedLangId = newValue.id.toString() ;
                                // contt.update();
                              },
                            ),
                ),


                SizedBox(height: 150,),



                addText500(selectedLocal['greeting'] ?? 'Hello, welcome to the app!',
                 color: AppColors.blackColor, fontSize: 20),
                
                const SizedBox(height: 20),

                 Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 30),
                   child: AppButton( onButtonTap: () {
                          languageModel.switchLanguage(languageModel.selectedLocalLang); // Update state
                      languageModel.selectedLang(languageModel.locale);
                    } , buttonText: selectedLocal['switch_language'] ?? 'Switch Language',  ),
                 ),
               
              ],
            ),
           ) 
          );
    
   
  }
}