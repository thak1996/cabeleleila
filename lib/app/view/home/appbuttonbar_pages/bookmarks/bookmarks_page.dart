import 'package:cabeleleila/app/locator.dart';
import 'package:cabeleleila/app/view/home/appbuttonbar_pages/bookmarks/bookmarks_controller.dart';
import 'package:cabeleleila/app/common/constants/app_colors.dart';
import 'package:cabeleleila/app/common/constants/app_text_styles.dart';
import 'package:cabeleleila/app/common/widget/appbar_custom.dart';
import 'package:cabeleleila/app/common/widget/eleveted_button_custon.dart';
import 'package:cabeleleila/app/common/widget/mult_text.dart';
import 'package:flutter/material.dart';

class BookmarksPage extends StatefulWidget {
  const BookmarksPage({super.key});

  @override
  State<BookmarksPage> createState() => _BookmarksPageState();
}

class _BookmarksPageState extends State<BookmarksPage>
    with AutomaticKeepAliveClientMixin<BookmarksPage> {
  final _controller = locator<BookmarksController>();

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

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: appBarCalendarPage(),
      body: Center(
        child: _bodyButton(),
      ),
    );
  }
}
