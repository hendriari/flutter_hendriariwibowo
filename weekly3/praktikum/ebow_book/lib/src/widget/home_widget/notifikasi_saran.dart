import 'package:ebow_book/src/utils/color.dart';
import 'package:ebow_book/src/view_model/account_view_model/account_view_model.dart';
import 'package:ebow_book/src/widget/widget/dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NotifikasiSaran extends StatelessWidget {
  const NotifikasiSaran({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sizeHeight = MediaQuery.of(context).size.height;
    final sizeWidth = MediaQuery.of(context).size.width;
    return Container(
      height: sizeHeight,
      width: sizeWidth,
      color: MyColor.white,
      child: Consumer<AccountViewModel>(
        builder: (context, value, child) {
          if (value.notifications.isNotEmpty) {
            final notif = value.notifications;

            ///builder
            return ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: notif.length,
                itemBuilder: (context, index) {
                  /// on tap show dialog
                  return InkWell(
                    onTap: () {
                      showDialogWidget(
                        context,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Saran : ',
                              style: Theme.of(context).textTheme.bodyText2!,
                            ),
                            Text(
                              notif[index].saran!,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(color: MyColor.errorColor),
                              maxLines: 50,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              'Developer akan segera menindak lanjuti saran yang Anda berikan',
                              textAlign: TextAlign.start,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(color: MyColor.gray),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            Text(
                              'Dikirim oleh email ${notif[index].email}',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(color: MyColor.gray),
                            )
                          ],
                        ),
                        Text(
                          'Terimakasih ${notif[index].namaDepan} ${notif[index].namaBelakang} !',
                          style: Theme.of(context).textTheme.headline6,
                          textAlign: TextAlign.start,
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10, left: 10),

                      /// konten
                      child: Card(
                        color: MyColor.border,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Berhasil Mengirim Saran !',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(color: MyColor.errorColor),
                              ),
                              Text(
                                'Terimakasih atas saran yang Anda berikan, Developer akan segera menindak lanjuti saran Anda!',
                                maxLines: 5,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(color: MyColor.gray),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                });
          }
          return Center(
            child: Text('Belum Ada Notifikasi',
                style: Theme.of(context).textTheme.headline6),
          );
        },
      ),
    );
  }
}
