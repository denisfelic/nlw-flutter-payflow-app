import 'package:flutter/material.dart';
import 'package:payflow/modules/barcode_scanner/barcode_scanner_controller.dart';
import 'package:payflow/modules/barcode_scanner/barcode_scanner_status.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/themes/appcolors.dart';
import 'package:payflow/shared/widgets/bottom_sheeet_widget/bottom_sheet_widget.dart';
import 'package:payflow/shared/widgets/set_label_buttons/set_label_buttons.dart';

class BarcodeScannerPage extends StatefulWidget {
  const BarcodeScannerPage({Key? key}) : super(key: key);

  @override
  _BarcodeScannerPageState createState() => _BarcodeScannerPageState();
}

class _BarcodeScannerPageState extends State<BarcodeScannerPage> {
  final controller = BarcodeScannerController();

  @override
  void initState() {
    controller.getAvailableCameras();
    controller.statusNotifier.addListener(() {
      if (controller.status.hasBarcode) {
        Navigator.pushReplacementNamed(context, "/insert_boleto");
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      right: true,
      bottom: true,
      left: true,
      child: Stack(
        children: [
          ValueListenableBuilder<BarcodeScannerStatus>(
              valueListenable: controller.statusNotifier,
              builder: (_, status, __) {
                if (status.showCamera) {
                  return Container(
                    color: Colors.blue,
                    child: controller.cameraController!.buildPreview(),
                  );
                } else {
                  return Container();
                }
              }),
          RotatedBox(
            quarterTurns: 1,
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                backgroundColor: Colors.black,
                centerTitle: true,
                title: Text(
                  "Escaneie o c??digo de barras do boleto",
                  style: AppTextStyles.buttonBackground,
                ),
                leading: BackButton(
                  color: AppColors.background,
                ),
              ),
              body: Column(
                children: [
                  Expanded(
                    child: Container(color: Colors.black38),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(color: Colors.transparent),
                  ),
                  Expanded(
                    child: Container(color: Colors.black38),
                  ),
                ],
              ),
              bottomNavigationBar: ValueListenableBuilder<BarcodeScannerStatus>(
                  valueListenable: controller.statusNotifier,
                  builder: (_, status, __) {
                    if (status.hasError) {
                      return this.getBottomSheetWidget();
                    } else {
                      return getSetLabelsButtons(context);
                    }
                  }),
            ),
          ),
        ],
      ),
    );
  }

  BottomSheetWidget getBottomSheetWidget() {
    return BottomSheetWidget(
      title: "N??o foi poss??vel identificar um c??digo de barras.",
      subtitle: "Tente escanear novamente ou digite o c??digo do seu boleto.",
      setLabelButtons: SetLabelButtons(
          primaryColor: true,
          primaryLabel: "Escanear novamente",
          primaryOnTap: () {
            controller.getAvailableCameras();
          },
          secondaryLabel: "Digitar c??digo",
          secondaryOnTap: () {}),
    );
  }

  SetLabelButtons getSetLabelsButtons(BuildContext context) {
    return SetLabelButtons(
      primaryLabel: "Inserir c??digo do boleto",
      primaryOnTap: () {},
      secondaryLabel: "Adicionar da galeria",
      secondaryOnTap: () {},
    );
  }
}
