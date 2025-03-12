import 'package:flutter/material.dart';
import 'package:note_sphere/utils/colors.dart';
import 'package:note_sphere/utils/constants.dart';
import 'package:note_sphere/utils/text_styles.dart';

class ProgressCard extends StatefulWidget {
  final int completedTasks;
  final int totalTasks;

  const ProgressCard({
    super.key,
    required this.completedTasks,
    required this.totalTasks,
  });

  @override
  State<ProgressCard> createState() => _ProgressCardState();
}

class _ProgressCardState extends State<ProgressCard> {
  @override
  Widget build(BuildContext context) {
    double completionPercentage = widget.totalTasks != 0
        ? (widget.completedTasks / widget.totalTasks) * 100
        : 0; // H
    return Container(
      padding: EdgeInsets.all(AppConstants.kDefaultPadding),
      decoration: BoxDecoration(
        color: AppColors.kCardColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Today's Progress",
                style: AppTextStyles.appSubtitle,
              ),
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.65,
                child: Text(
                  "You have completed ${widget.completedTasks} out of ${widget.totalTasks} tasks, \nkeep up the progress!",
                  style: AppTextStyles.appDescriptionSmall.copyWith(
                    color: AppColors.kWhiteColor,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            width: 8,
          ),
          Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.17,
                height: MediaQuery.of(context).size.width * 0.17,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    gradient: AppColors().kPrimaryGradient),
              ),
              Positioned.fill(
                child: Center(
                  child: Text(
                    "${completionPercentage.toStringAsFixed(0)}%",
                    style: AppTextStyles.appTitle.copyWith(fontSize: 18),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
