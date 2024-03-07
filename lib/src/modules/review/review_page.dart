import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'review_controller.dart';
import '../../theme/app_theme.dart';

class ReviewPage extends StatefulWidget {
  const ReviewPage({super.key});

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
              title: const Center(child: Text('Avaliação')),
              automaticallyImplyLeading: false,
              actions: [
                GestureDetector(
                  onTap: () {
                    closeModal();
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.close),
                  ),
                ),
              ],
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
            if (ScreenUtil().screenWidth < 600)
              Divider(
                height: 20,
                color: Colors.grey[300],
                thickness: 2,
              ),
            Text(
              'Avalie sua experiência',
              style: AppTheme.textStyles.reviewText,
            ),
            const SizedBox(height: 10),
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
            const SizedBox(height: 12),
            _buildRatingStars(),
            const SizedBox(height: 10),
            _buildRatingOptions(),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: const Color(0XFF0057FF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3.0),
                  ),
                ),
                child: const Text('Enviar'),
              ),
            ),
          ]),
    );
  }

  Widget _buildModal(BuildContext context) {
    return Dialog(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Container(
          width: 400,
          height: 400,
          padding: const EdgeInsets.all(16.0),
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
                    child: const Icon(
                      Icons.close,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildContent(),
                  const SizedBox(height: 16),
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
            (_reviewcontroller.rating >= index + 1)
                ? Icons.star
                : Icons.star_border_outlined,
            color: _reviewcontroller.rating >= index + 1
                ? const Color(0XFF0057FF)
                : Colors.black,
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
              "Qualidade dos entregadores",
              "Outros"
            ]
          : [
              "Formas de pagamento",
              "Valor da entrega",
              "Atrasos",
              "Falhas/Bugs na plataforma",
              "Entregadores",
              "Novas funcionalidades",
              "Outros"
            ];

      return _buildOptions(question, options);
    }

    return const SizedBox.shrink();
  }

  Widget _buildOptions(String question, List<String> options) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(
          height: 20,
          color: Colors.grey[300],
          thickness: 1,
        ),
        const SizedBox(height: 5),
        Text(
          question,
          style: AppTheme.textStyles.reviewTextExperience,
        ),
        const SizedBox(height: 8),
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
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: _reviewcontroller.selectedOptions.contains(option)
                      ? const Color(0XFF0057FF)
                      : Colors.grey[300],
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Text(option,
                    style: _reviewcontroller.selectedOptions.contains(option)
                        ? AppTheme.textStyles.selectedOptionsEnable
                        : AppTheme.textStyles.selectedOptionsDisable),
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
