import 'package:auto_route/auto_route.dart';
import 'package:eduorizen_app/core/common/enums/enums.dart';
import 'package:eduorizen_app/core/common/extension/sizer_extension.dart';
import 'package:eduorizen_app/core/common/widgets/bookmark_widget.dart';
import 'package:eduorizen_app/core/common/widgets/container/custom_boarder_container_with_shadow.dart';
import 'package:eduorizen_app/core/managers/responsive_manager/responsive_package/src/sizer.dart';
import 'package:eduorizen_app/core/managers/route_manager/route_manager.gr.dart';
import 'package:eduorizen_app/core/managers/service_locator/injection.dart';
import 'package:eduorizen_app/feature/bookmarks/presentation/cubit/bookmark_cubit.dart';
import 'package:eduorizen_app/feature/toture/presentation/bloc/tutor_bloc/tutor_bloc.dart';
import 'package:eduorizen_app/feature/toture/presentation/widgets/tutor_list_widgets/tutor_bio.dart';
import 'package:eduorizen_app/feature/toture/presentation/widgets/tutor_list_widgets/tutor_details.dart';
import 'package:eduorizen_app/feature/toture/presentation/widgets/tutor_list_widgets/tutor_image.dart';
import 'package:eduorizen_app/feature/toture/presentation/widgets/tutor_list_widgets/tutor_personal_info.dart';
import 'package:eduorizon_shared/entities/tutor_entities/tutor_info_entity.dart';
import 'package:eduorizon_shared/enums/enums.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TutorCard extends StatefulWidget {
  const TutorCard({
    super.key,
    required this.sizer,
    required this.user,
    this.bookmarkRemove,
    this.isBookmarked = false,
    required this.bloc,
    required this.index,
    this.onChangeBookmark,
  });

  final Sizer sizer;
  final TutorInfoEntity user;
  final bool isBookmarked;
  final void Function(String)? bookmarkRemove;
  final TutorBloc bloc;
  final Function? onChangeBookmark;
  final int index;

  @override
  State<TutorCard> createState() => _TutorCardState();
}

class _TutorCardState extends State<TutorCard> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TutorBloc, TutorState>(
      bloc: widget.bloc,
      buildWhen: (prev, cur) {
        if (cur.runtimeType != prev.runtimeType) {
          if (cur.runtimeType ==
              const TutorState.tutorBookmarkUpdated().runtimeType) {
            if ((cur as TutorBookmarkUpdated).tutorId == widget.user.id) {
              return true;
            }
          }
        }
        return false;
      },
      builder: (context, state) {
        return InkWell(
          onTap: () async {
            final res = await context.router.push(TutorDetailsRoute(
              tutorInfo: widget.user,
            ));
            if (res == null || res != null) {
              widget.bloc.add(
                  TutorEvent.checkTutorBookmark(tutorId: widget.user.id ?? ''));
            }
          },
          child: Padding(
            padding: EdgeInsets.only(
              top: widget.sizer.mobileTabletSwitcher(
                mobile: widget.sizer.h(12),
                tablet: widget.sizer.h(18.7),
              ),
              left: widget.sizer.mobileTabletSwitcher(
                mobile: widget.sizer.w(8.5),
                tablet: widget.sizer.w(20),
              ),
              right: widget.sizer.mobileTabletSwitcher(
                mobile: widget.sizer.w(8.5),
                tablet: widget.sizer.w(20),
              ),
            ),
            child: ShadowContainer(
              innerPadding: EdgeInsets.only(
                top: widget.sizer.mobileTabletSwitcher(
                  mobile: widget.sizer.h(20),
                  tablet: widget.sizer.h(19),
                ),
                bottom: widget.sizer.mobileTabletSwitcher(
                  mobile: widget.sizer.h(17),
                  tablet: widget.sizer.h(15),
                ),
                left: widget.sizer.mobileTabletSwitcher(
                  mobile: widget.sizer.h(13),
                  tablet: widget.sizer.h(19),
                ),
                right: widget.sizer.mobileTabletSwitcher(
                  mobile: widget.sizer.h(13),
                  tablet: widget.sizer.h(19),
                ),
              ),
              width: widget.sizer.mobileTabletSwitcher(
                mobile: widget.sizer.w(360),
                tablet: widget.sizer.w(940),
              ),
              height: widget.sizer.mobileTabletSwitcher(
                mobile: widget.sizer.h(274),
                tablet: widget.sizer.h(291),
              ),
              radius: widget.sizer.fontSize(
                12,
              ),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  if (widget.sizer.isMobile)
                    Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TutorImage(
                              sizer: widget.sizer,
                              imageURL: widget.user.generalInfo.photoUrl,
                              isTopRated: false,
                              verificationType: VerificationType.verified,
                            ),
                            TutorPersonalInfo(
                              subjects: widget.user.subjects,
                              sizer: widget.sizer,
                              fullName: widget.user.generalInfo.name,
                              nationality: widget.user.generalInfo.nationality,
                              rate: widget.user.statistics.rating.toInt(),
                              pricePerHour: widget.user.generalInfo.hourCost,
                              reviewCount:
                                  widget.user.statistics.reviewCount.toInt(),
                            ),
                          ],
                        ),
                        TutorBio(
                          bio: widget.user.generalInfo.about,
                          sizer: widget.sizer,
                        ),
                        TutorDetails(
                          sizer: widget.sizer,
                          totalHourTutoring: widget.user.statistics.hours,
                          answerTime: widget.user.statistics.hours,
                          spokenLanguages: widget.user.generalInfo.languages,
                        ),
                      ],
                    ),
                  if (widget.sizer.isTablet)
                    Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TutorImage(
                              sizer: widget.sizer,
                              imageURL: widget.user.generalInfo.photoUrl,
                              isTopRated: false,
                              verificationType: VerificationType.verified,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TutorPersonalInfo(
                                  subjects: widget.user.subjects,
                                  sizer: widget.sizer,
                                  fullName: widget.user.generalInfo.name,
                                  nationality:
                                      widget.user.generalInfo.nationality,
                                  rate: widget.user.statistics.rating.toInt(),
                                  pricePerHour:
                                      widget.user.generalInfo.hourCost,
                                  reviewCount: widget
                                      .user.statistics.reviewCount
                                      .toInt(),
                                ),
                                TutorBio(
                                  bio: widget.user.generalInfo.about,
                                  sizer: widget.sizer,
                                ),
                                TutorDetails(
                                  sizer: widget.sizer,
                                  totalHourTutoring:
                                      widget.user.statistics.hours,
                                  answerTime: widget.user.statistics.hours,
                                  spokenLanguages:
                                      widget.user.generalInfo.languages,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  Positioned(
                      top: widget.sizer.h(-15),
                      right: 0,
                      child: Align(
                        alignment: Alignment.topRight,
                        child: BlocProvider.value(
                          value: getIt<BookmarkCubit>()
                            ..checkBookmarkStatus(widget.user.id ?? ""),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: BlocBuilder<BookmarkCubit, BookmarkState>(
                                builder: (context, state) {
                              if (state is BookmarkUpdated) {
                                if (!state.isBookmarked) {
                                  widget.bookmarkRemove
                                      ?.call(widget.user.id ?? '');
                                }
                                return buildBookmark(context,
                                    state.isBookmarked, widget.user.id);
                              } else if (state is BookmarkInitial) {
                                return buildBookmark(context,
                                    state.isBookmarked, widget.user.id);
                              } else {
                                return const Offstage();
                              }
                            }),
                          ),
                        ),
                      )),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  buildBookmark(BuildContext context, bool isBookmarked, String? id) {
    return BookmarkWidget(
      id: id,
      type: BookmarkType.tutors,
      bookmarkRemove: widget.bookmarkRemove,
      isBookmarked: isBookmarked,
      stateChanged: (id) {
        getIt<BookmarkCubit>().toggleBookmark(
            type: BookmarkType.tutors,
            id: id ?? "",
            bookmarkId: id ?? "",
            isBookmarked: isBookmarked);
        widget.onChangeBookmark?.call();
      },
    );
  }
}

//Note: this classes will be remove when entity will be created.
class MockTutor extends Equatable {
  final String id;
  final String image;
  final String fullName;
  final String countryCode;
  final int rate;
  final int pricePerHour;
  final String bio;
  final int totalHours;
  final int timeToAnswer;
  final List<MockLanguageSpoken> languageSpoken;
  final List<MockSubject> subjects;

  const MockTutor({
    required this.id,
    required this.image,
    required this.fullName,
    required this.countryCode,
    required this.rate,
    required this.pricePerHour,
    required this.bio,
    required this.totalHours,
    required this.timeToAnswer,
    required this.languageSpoken,
    required this.subjects,
  });

  @override
  List<Object> get props => [
        id,
        image,
        fullName,
        countryCode,
        rate,
        pricePerHour,
        bio,
        totalHours,
        timeToAnswer,
        languageSpoken,
        subjects,
      ];
}

class MockSubject extends Equatable {
  final String id;
  final String name;

  @override
  List<Object> get props => [id, name];

  const MockSubject({
    required this.id,
    required this.name,
  });
}

class MockLanguageSpoken extends Equatable {
  final String id;
  final String name;
  final bool native;

  const MockLanguageSpoken({
    required this.id,
    required this.name,
    required this.native,
  });

  @override
  List<Object> get props => [
        id,
        name,
        native,
      ];
}
