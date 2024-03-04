import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:locallog_client_reviw/src/modules/review/review_controller.dart';
import 'package:locallog_client_reviw/src/theme/app_theme.dart';

class ReviewPage extends StatefulWidget {
  @override
  _ReviewPageState createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  final ReviewController _reviewcontroller = ReviewController();
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    bool isMobile = ScreenUtil().screenWidth < 600;

    return isMobile
        ? Scaffold(
            appBar: AppBar(
              title: Center(child: Text('Avaliação')),
            ),
            body: _buildContent(),
          )
        : _buildModal(context);
  }

  Widget _buildContent() {
    String nome = "Roberta";
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, left: 12.0, right: 12.0),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Avalie sua experiência',
              style: AppTheme.textStyles.reviewText,
            ),
            SizedBox(height: 12),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Quão satisfeito você ficou com a entrega de ',
                    style: AppTheme.textStyles.reviewText2,
                  ),
                  TextSpan(
                    text: nome,
                    style: AppTheme.textStyles.reviewText2Name,
                  ),
                  TextSpan(
                    text: '?',
                    style: AppTheme.textStyles.reviewText2,
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            _buildRatingStars(),
            SizedBox(height: 16),
            _buildRatingOptions(),
            SizedBox(height: 16),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3.0),
                  ),
                ),
                child: Text('Enviar'),
              ),
            ),
          ]),
    );
  }

  Widget _buildModal(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.all(0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Container(
          width: 400,
          height: 400,
          padding: EdgeInsets.all(16.0),
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: closeModal,
                    child: Icon(
                      Icons.close,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildContent(),
                  SizedBox(height: 16),
                  // _buildRatingOptions(),
                  // SizedBox(height: 16),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRatingStars() {
    const int maxRating = 5;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: List.generate(maxRating, (index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              _reviewcontroller.setRating(index + 1.0);
            });
          },
          child: Icon(
            Icons.star,
            color: _reviewcontroller.rating >= index + 1
                ? Color(0XFF0057FF)
                : Colors.grey[300],
            size: 40,
          ),
        );
      }),
    );
  }

  Widget _buildRatingOptions() {
    if (_reviewcontroller.rating != 0) {
      String question = _reviewcontroller.rating == 5
          ? "O que mais gostou?"
          : "O que podemos melhorar?";

      List<String> options = _reviewcontroller.rating == 5
          ? [
              "Plataforma fácil",
              "Valor da entrega",
              "Praticidade",
              "Suporte para problemas",
            ]
          : [
              "Formas de pagamento",
              "Atrasos",
              "Falhas/Bugs na plataforma",
            ];

      return _buildOptions(question, options);
    }

    return SizedBox.shrink();
  }

  Widget _buildOptions(String question, List<String> options) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          question,
          style: AppTheme.textStyles.reviewText,
        ),
        SizedBox(height: 8),
        Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          children: options.map((option) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  _reviewcontroller.toggleOption(option);
                });
              },
              child: Container(
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: _reviewcontroller.selectedOptions.contains(option)
                      ? Colors.blue
                      : Colors.grey[300],
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Text(
                  option,
                  style: TextStyle(
                    color: _reviewcontroller.selectedOptions.contains(option)
                        ? Colors.white
                        : Colors.black,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  void closeModal() {
    Navigator.of(context).pop();
  }
}
