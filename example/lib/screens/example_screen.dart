import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:loomi_ui_flutter/utils/custom_icons.dart';
import 'package:loomi_ui_flutter/widgets/widgets.dart';

class ExampleScreen extends StatefulWidget {
  const ExampleScreen({super.key});

  @override
  State<ExampleScreen> createState() => _ExampleScreenState();
}

class _ExampleScreenState extends State<ExampleScreen> {
  String? dropDownValue;

  bool check = false;

  final ScrollController controller = ScrollController();

  int counter = 0;

  bool selector = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Example title"),
        ),
        body: SingleChildScrollView(
          controller: controller,
          child: Column(
            children: [
              CustomTabItems(
                selectedTextColor: Colors.blue,
                unselectedTextColor: Colors.black.withOpacity(0.3),
                backgroundDecoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  border: Border(
                    bottom: BorderSide(
                      width: 1,
                      color: Colors.black.withOpacity(0.1),
                    ),
                    top: const BorderSide(
                      width: 1,
                      color: Colors.white,
                    ),
                  ),
                ),
                items: const [
                  "Diário",
                  "Semanal",
                  "Mensal",
                  "Anual",
                  "Outro",
                ],
                onIndexChanged: (int idx) {
                  log('INDEX CHANGED $idx');
                },
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomButton(
                  backgroundColor: Colors.black,
                  expanded: true,
                  onTap: () {},
                  text: "Pegar imagem",
                  buttonTextStyle:
                      Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Colors.white,
                          ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomButton(
                  backgroundColor: Colors.blue,
                  expanded: false,
                  onTap: () {
                    showLoomiToast(
                      context: context,
                      counterRadius: 16,
                      text: 'texto do toast aqui',
                      overlappingColor: Colors.red,
                    );
                  },
                  // isLoading: true,
                  text: "Teste de botão!",
                  borderRadius: 16,
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 50,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomTextFormField(
                  onChanged: (value) {},
                  keyboardType: TextInputType.number,
                  borderRadius: 12,
                  hintText: "Texto",
                  labelText: "Label aqui",
                  hintTextStyle: Theme.of(context).textTheme.labelLarge,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: CustomSelect(
                  value: dropDownValue,
                  onChanged: (value) {
                    setState(() {
                      dropDownValue = value;
                    });
                  },
                  list: ["RN", "SP", "RJ"]
                      .map(
                        (e) => DropdownMenuItem(
                          value: e,
                          child: Text(
                            e,
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                        ),
                      )
                      .toList(),
                  border: Border.all(
                    width: 1,
                    color: Colors.teal,
                  ),
                  hintText: "Hint",
                  textStyle: Theme.of(context).textTheme.labelLarge,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: NumberCounter(
                  counter: counter,
                  border: Border.all(color: Colors.grey, width: 2),
                  borderRadius: BorderRadius.circular(20),
                  subIconSize: const Size(25, 25),
                  addIconSize: const Size(25, 25),
                  addIconColor: Colors.grey.withOpacity(.5),
                  onChanged: (value) {
                    setState(() {
                      counter = value;
                    });
                  },
                  subIconColor:
                      counter > 0 ? Colors.grey.withOpacity(.5) : Colors.grey,
                  counterTextStyle:
                      Theme.of(context).textTheme.headlineSmall!.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                          ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: GetIcon(CustomIcons.arrowBackOulined),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: RadioSelector(
                  selectedCheckColor: Colors.red,
                  showSelectedGradient: true,
                  showShadow: false,
                  backgroundColor: Colors.green,
                  leading: GetIcon(
                    CustomIcons.bellFilled,
                    color:
                        selector ? Colors.white : Colors.teal.withOpacity(.5),
                  ),
                  selected: selector,
                  onTap: () {
                    setState(() {
                      selector = !selector;
                    });
                  },
                  text: "Label",
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8),
                child: LoomiCustomLabel(
                  text: "Label",
                  height: 30,
                  backgroundColor: Colors.teal,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: CustomCheckbox(
                  check,
                  uncheckedBackgroundColor: Colors.white,
                  checkColor: Colors.teal,
                  uncheckedOuterBorder:
                      Border.all(color: Colors.teal, width: 3),
                  label: "Label",
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  pushToCameraScreen(
                    context: context,
                    onFileAdded: (file) {
                      log("Caminho do arquivo:$file");
                    },
                  );
                },
                child: const Text("Abrir câmera"),
              ),
              const SizedBox(height: 5),
              ElevatedButton(
                onPressed: () {
                  pushToPlayerScreen(
                    context: context,
                    movieUrl:
                        "https://github.com/GeekyAnts/flick-video-player-demo-videos/blob/master/example/9th_may_compressed.mp4?raw=true",
                    onExit: () {},
                    onBackground: () {},
                    seekOnInit: const Duration(seconds: 15),
                    secondaryColor: Colors.green,
                    primaryColor: Colors.yellow,
                    playerHeader: Container(
                      width: 60,
                      height: 60,
                      color: Colors.transparent,
                    ),
                  );
                },
                child: const Text("Abrir player"),
              ),
              const SizedBox(height: 10),
              SafeArea(
                child: CustomFilePicker(
                  label: "Arquivos",
                  onAdd: (file) {},
                  limitOfFiles: 10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
