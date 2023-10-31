import 'dart:developer';

import 'package:flutter/foundation.dart';
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

  int currentAmount = 2;

  bool _isChecked = false;

  final TextEditingController _controller = TextEditingController(text: "2");

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
                      overlappingColorOpacity: 1,
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
              const CustomTextBadge(
                text: 'Badge aqui',
                color: Colors.red,
              ),
              const Padding(
                padding: EdgeInsets.all(20),
                child: CustomAlertComponent(
                  title: 'Title',
                  content: "We've create your account for bla...",
                  prefixIcon: Icons.check,
                  containerColor: Colors.green,
                  borderRadius: 12.0,
                  borderWidth: 2.0,
                  borderColor: Colors.transparent,
                  iconContainerColor: Colors.white,
                  titleStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                  contentStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 14.0,
                  ),
                  iconColor: Colors.green,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: CustomAlertComponent(
                  content: "We've create your account for bla...",
                  prefixIcon: Icons.warning,
                  containerColor: Colors.yellow[800],
                  borderRadius: 12.0,
                  borderWidth: 2.0,
                  borderColor: Colors.transparent,
                  iconContainerColor: Colors.white,
                  contentStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 14.0,
                  ),
                  iconColor: Colors.yellow[800],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: CustomAlertComponent(
                  title: 'Title',
                  content: "We've create your account for bla...",
                  prefixIcon: Icons.check,
                  containerColor: Colors.green.withOpacity(0.2),
                  borderRadius: 12.0,
                  borderWidth: 2.0,
                  borderColor: Colors.transparent,
                  iconContainerColor: Colors.green,
                  titleStyle: const TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                  contentStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 14.0,
                  ),
                  iconColor: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: CustomQuantitySelector(
                  currentAmount: currentAmount,
                  minimumItems: 1,
                  controller: _controller,
                  onMinus: currentAmount == 2
                      ? () {}
                      : () {
                          setState(
                            () {
                              currentAmount = currentAmount - 1;
                              _controller.text = currentAmount.toString();
                            },
                          );
                        },
                  onChanged: (value) {
                    int? newVal = int.tryParse(value ?? "0");
                    if (newVal == null || newVal == 0 || newVal < (2)) {
                      _controller.text = (2).toString();
                      currentAmount = (2);
                    } else {
                      setState(
                        () {
                          currentAmount = newVal;
                        },
                      );
                    }
                  },
                  onPlus: () {
                    setState(
                      () {
                        currentAmount = currentAmount + 1;
                        _controller.text = currentAmount.toString();
                      },
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: CustomNumberCounter(
                  counter: counter,
                  border: Border.all(color: Colors.green, width: 1),
                  borderRadius: 16,
                  mainBorderRadius: 16,
                  subIconSize: const Size(15, 15),
                  addIconSize: const Size(15, 15),
                  addIconColor: Colors.green,
                  mainColor: Colors.green,
                  onChanged: (value) {
                    setState(() {
                      counter = value;
                    });
                  },
                  subIconColor: Colors.green,
                  counterTextStyle:
                      Theme.of(context).textTheme.headlineSmall!.copyWith(
                            color: Colors.white,
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
              CustomCheckBox(
                isChecked: _isChecked,
                onChanged: (value) {
                  setState(() {
                    _isChecked = value;
                  });
                },
                activeColor: Colors.green,
                inactiveColor: Colors.grey,
                size: 30,
                borderRadius: 32,
                checkType: CheckType.container,
                labelText: 'Aceito os termos e condições',
                labelTextStyle:
                    const TextStyle(color: Colors.black, fontSize: 16),
                inactiveBorderColor: Colors.transparent,
                activeBorderColor: Colors.transparent,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomCheckBox(
                isChecked: _isChecked,
                onChanged: (value) {
                  setState(() {
                    _isChecked = value;
                  });
                },
                activeColor: Colors.green,
                inactiveColor: Colors.grey,
                size: 30,
                borderRadius: 8,
                checkType: CheckType.icon,
                labelText: 'Aceito os termos e condições',
                labelTextStyle:
                    const TextStyle(color: Colors.black, fontSize: 16),
                inactiveBorderColor: Colors.transparent,
                activeBorderColor: Colors.transparent,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomCheckBox(
                isChecked: _isChecked,
                onChanged: (value) {
                  setState(() {
                    _isChecked = value;
                  });
                },
                activeColor: Colors.green,
                inactiveColor: Colors.transparent,
                size: 30,
                borderRadius: 8,
                checkType: CheckType.icon,
                labelText: 'Aceito os termos e condições',
                labelTextStyle:
                    const TextStyle(color: Colors.black, fontSize: 16),
                inactiveBorderColor: Colors.grey,
                activeBorderColor: Colors.transparent,
              ),
              if (!kIsWeb) ...[
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
            ],
          ),
        ),
      ),
    );
  }
}
