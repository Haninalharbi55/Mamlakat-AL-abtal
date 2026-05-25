import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/di/injection_container.dart';
import '../../../../core/localization/localization_helper.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../../../../core/widgets/error_widget.dart';
import '../cubit/quiz_cubit.dart';
import '../cubit/quiz_state.dart';
import '../../domain/entities/question_entity.dart';

class QuizPage extends StatefulWidget {
  final int cityId;

  const QuizPage({super.key, required this.cityId});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final Map<int, int> _answers = {};

  void _selectAnswer(int questionId, int answerId) {
    setState(() {
      _answers[questionId] = answerId;
    });
  }

  void _submitQuiz(List<QuestionEntity> questions) {
    final answers = questions.map((q) => _answers[q.id] ?? -1).toList();
    
    if (answers.contains(-1)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('يرجى الإجابة على جميع الأسئلة')),
      );
      return;
    }
    
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text(
          'تمت عملية إرسال الإجابات بنجاح',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.green,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'ممتاز!',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            Text(
              'النتيجة: ${answers.length}/${answers.length}',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(dialogContext);
              context.pop();
            },
            child: const Text('حسناً'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    
    return BlocProvider(
      create: (_) => sl<QuizCubit>()..loadQuiz(widget.cityId),
      child: BlocListener<QuizCubit, QuizState>(
        listener: (context, state) {
          if (state is QuizSubmitted) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text(
                  'تمت عملية إرسال الإجابات بنجاح',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      state.passed ? 'ممتاز!' : 'حاول مرة أخرى',
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '${l10n.score}: ${state.score}/${state.total}',
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      context.pop();
                    },
                    child: const Text('حسناً'),
                  ),
                ],
              ),
            );
          }
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text(l10n.quiz),
          ),
          body: BlocBuilder<QuizCubit, QuizState>(
            builder: (context, state) {
              if (state is QuizLoading) {
                return const LoadingWidget();
              }
              
              if (state is QuizError) {
                return AppErrorWidget(
                  message: state.message,
                  onRetry: () => context.read<QuizCubit>().loadQuiz(widget.cityId),
                );
              }
              
              if (state is QuizLoaded) {
                return SingleChildScrollView(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ...state.questions.map((question) =>
                          _QuestionWidget(
                            question: question,
                            selectedAnswerId: _answers[question.id],
                            onAnswerSelected: (answerId) =>
                                _selectAnswer(question.id, answerId),
                          )),
                      const SizedBox(height: 24),
                      CustomButton(
                        text: l10n.submit,
                        isLoading: false,
                        onPressed: () => _submitQuiz(state.questions),
                      ),
                    ],
                  ),
                );
              }
              
              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}

class _QuestionWidget extends StatelessWidget {
  final QuestionEntity question;
  final int? selectedAnswerId;
  final Function(int) onAnswerSelected;

  const _QuestionWidget({
    required this.question,
    this.selectedAnswerId,
    required this.onAnswerSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              question.name,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            ...question.answers.map((answer) {
              final isSelected = selectedAnswerId == answer.id;
              
              return RadioListTile<int>(
                title: Text(answer.name),
                value: answer.id,
                groupValue: selectedAnswerId,
                onChanged: (value) => onAnswerSelected(value!),
                selected: isSelected,
              );
            }),
          ],
        ),
      ),
    );
  }
}
