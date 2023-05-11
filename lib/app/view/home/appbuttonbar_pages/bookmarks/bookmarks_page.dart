import 'package:cabeleleila/app/common/widget/custom_bottom_sheet.dart';
import 'package:cabeleleila/app/common/widget/custom_circular_progress_indicator.dart';
import 'package:cabeleleila/app/common/widget/custom_drop_down_button.dart';
import 'package:cabeleleila/app/locator.dart';
import 'package:cabeleleila/app/view/home/appbuttonbar_pages/bookmarks/bookmarks_controller.dart';
import 'package:cabeleleila/app/common/constants/app_colors.dart';
import 'package:cabeleleila/app/common/constants/app_text_styles.dart';
import 'package:cabeleleila/app/common/widget/appbar_custom.dart';
import 'package:cabeleleila/app/common/widget/eleveted_button_custon.dart';
import 'package:cabeleleila/app/common/widget/mult_text.dart';
import 'package:cabeleleila/app/view/home/appbuttonbar_pages/bookmarks/bookmarks_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class BookmarksPage extends StatefulWidget {
  const BookmarksPage({super.key});

  @override
  State<BookmarksPage> createState() => _BookmarksPageState();
}

class _BookmarksPageState extends State<BookmarksPage>
    with AutomaticKeepAliveClientMixin<BookmarksPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _controller = locator.get<BookmarksController>();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(
      () {
        if (_controller.state is BookmarksStateLoading) {
          showDialog(
            context: context,
            builder: (context) => const CustomCircularProgressIndicator(),
          );
        }
        if (_controller.state is BookmarksStateSucess) {
          Navigator.pop(context);
          customModalBottomSheet(
            context,
            content: 'Agendamento Concluído!',
            buttonText: 'Fechar',
          );
        }
        if (_controller.state is BookmarksStateError) {
          final error = _controller.state as BookmarksStateError;
          Navigator.pop(context);
          customModalBottomSheet(
            context,
            content: error.message,
            buttonText: 'Tentar Novamente',
          );
        }
      },
    );
  }

  @override
  bool get wantKeepAlive => true;

  AppBarCustom appBarCalendarPage() => const AppBarCustom(title: 'Agendamento');

  Column _bodyButton() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomElevatedButton(
              text: 'Selecionar data',
              onPressed: () => _controller.selectDate(context),
            ),
            const SizedBox(width: 10),
            CustomElevatedButton(
              text: 'Selecionar horário',
              onPressed: () => _controller.selectTime(context),
            ),
          ],
        ),
        const SizedBox(height: 4),
        MultText(
          children: [
            ValueListenableBuilder(
              valueListenable: _controller.dateValueNotifier,
              builder: (context, value, child) {
                return Text(
                  'Hora e data selecionada: $value - ',
                  style: AppTextStyles.smallText.apply(
                    color: AppColors.darkGrey,
                  ),
                );
              },
            ),
            ValueListenableBuilder(
              valueListenable: _controller.timeValueNotifier,
              builder: (context, value, child) {
                return Text(
                  value,
                  style: AppTextStyles.smallText.apply(
                    color: AppColors.darkGrey,
                  ),
                );
              },
            ),
          ],
        ),
      ],
    );
  }

  Column _bodyBookmarks() {
    return Column(
      children: [
        const SizedBox(height: 10),
        ValueListenableBuilder(
          valueListenable: _controller.dropValueNotifier,
          builder: (context, value, _) {
            return CustomDropdownButton(
              options: _controller.options,
              selectedOption: _controller.dropValueNotifier.value,
              onChanged: (value) =>
                  _controller.dropValueNotifier.value = value!,
            );
          },
        ),
      ],
    );
  }

  Padding _footerBookmarks() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: CustomElevatedButton(
        text: 'Enviar',
        onPressed: () {
          DateTime value = _controller.formatDateTime(
            _controller.getSelectedDate(),
            _controller.getSelectedTime(),
          );
          _controller.postCloud(
            id: _auth.currentUser!.uid,
            dateTime: value,
            serviceSalon: _controller.dropValueNotifier.value,
            name: _auth.currentUser!.displayName!,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: appBarCalendarPage(),
      body: PageView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _bodyButton(),
              _bodyBookmarks(),
              _footerBookmarks(),
            ],
          ),
        ],
      ),
    );
  }
}
