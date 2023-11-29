import 'package:flutter/material.dart';
import 'package:nesma/core/common/widgets/glass_effect_widget.dart';
import 'package:nesma/core/extension/formatter.dart';
import 'package:nesma/core/extension/string_extension.dart';
import 'package:nesma/core/managers/colors/color_manager.dart';
import 'package:nesma/core/managers/size_manager/font_size_manager.dart';
import 'package:nesma/core/managers/theme_manager/text_theme.dart';
import 'package:nesma/features/help_center/presentation/mock/tickets.dart';
import 'package:sizer/sizer.dart';

class TicketItem extends StatelessWidget {
  const TicketItem({super.key, required this.ticket});

  final TicketMockModel ticket;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      child: GlassEffect(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(
                  MediaQuery.of(context).size.width * 0.01,
                  0,
                  MediaQuery.of(context).size.width * 0.01,
                  0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      ticket.id,
                      style: TextManager.cardLightFont,
                    ),
                    Container(
                      width: 20.w,
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: getStatusColor(ticket.status),
                      ),
                      child: Center(
                        child: Text(
                          ticket.status.toString().split('.').last.capitalize(),
                          style: TextManager.label1.copyWith(
                            fontWeight: FontWeight.w100,
                            fontSize: FontSizeManager.s10,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: 1,
                indent: MediaQuery.of(context).size.width * 0.05,
                endIndent: MediaQuery.of(context).size.width * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text.rich(TextSpan(
                          text: '${'issue'.tr}: ',
                          style: TextManager.label1.copyWith(
                            fontWeight: FontWeight.w400,
                            fontSize: FontSizeManager.s14,
                          ),
                          children: [
                            TextSpan(
                              text: ticket.issue,
                              style: TextManager.label1.copyWith(
                                fontWeight: FontWeight.w100,
                                fontSize: FontSizeManager.s14,
                              ),
                            )
                          ])),
                      const SizedBox(
                        height: 5,
                      ),
                      Text.rich(TextSpan(
                          text: '${'createdAt'.tr}: ',
                          style: TextManager.label1.copyWith(
                            fontWeight: FontWeight.w400,
                            fontSize: FontSizeManager.s14,
                          ),
                          children: [
                            TextSpan(
                              text: ticket.creatdAt,
                              style: TextManager.label1.copyWith(
                                fontWeight: FontWeight.w100,
                                fontSize: FontSizeManager.s14,
                              ),
                            )
                          ]))
                    ],
                  ),
                  InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            width: 100,
                            height: 32,
                            decoration: BoxDecoration(
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0x40000000),
                                  offset: Offset(0, 4),
                                  blurRadius: 4.0,
                                  spreadRadius: 0.0,
                                ),
                              ],
                              color: ColorManager.white.withOpacity(0.8),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                                child: Text(
                              '${'details'.tr}: ',
                              style: TextManager.cardTitle.copyWith(
                                fontWeight: FontWeight.w100,
                                fontSize: FontSizeManager.s12,
                              ),
                            ))),
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
