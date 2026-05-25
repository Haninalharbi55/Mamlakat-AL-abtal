import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../features/auth/presentation/cubit/auth_cubit.dart';
import '../../../../features/auth/presentation/cubit/auth_state.dart';
import '../../../../core/localization/localization_helper.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/routing/route_names.dart';
import '../../../../features/auth/domain/entities/user_entity.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  void initState() {
    super.initState();
    // Fetch profile info on page open
    context.read<AuthCubit>().getProfile();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthUnauthenticated) {
          // Navigate to login page on logout
          context.go(RouteNames.login);
        } else if (state is AuthError) {
           ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message), backgroundColor: AppColors.errorRed),
          );
        }
      },
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [AppColors.skyBlue, AppColors.sandBeige],
              stops: [0.7, 0.7],
            ),
          ),
          child: SafeArea(
            child: BlocBuilder<AuthCubit, AuthState>(
              builder: (context, state) {
                return SingleChildScrollView(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        l10n.settings,
                        style: Theme.of(context).textTheme.displaySmall,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 32),
                      
                      if (state is AuthLoading)
                        const Center(child: Padding(
                          padding: EdgeInsets.all(32.0),
                          child: CircularProgressIndicator(),
                        ))
                      else if (state is AuthAuthenticated) ...[
                        _buildProfileCard(context, state.user),
                        const SizedBox(height: 16),
                        _buildPointsCard(context, state.user.points ?? 0),
                      ] else if (state is AuthError)
                        Center(
                          child: Column(
                            children: [
                              Text(state.message, style: const TextStyle(color: AppColors.errorRed)),
                              const SizedBox(height: 16),
                              TextButton(
                                onPressed: () => context.read<AuthCubit>().getProfile(),
                                child: Text(l10n.retry),
                              ),
                            ],
                          ),
                        ),
                      
                      const SizedBox(height: 32),
                      CustomButton(
                        text: l10n.logout,
                        backgroundColor: AppColors.errorRed,
                        onPressed: () {
                          context.read<AuthCubit>().logout();
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfileCard(BuildContext context, UserEntity user) {
    final l10n = context.l10n;
    final isGirl = user.gender == 'female' || user.gender == 'girl';
    
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: isGirl ? AppColors.primaryPink.withOpacity(0.2) : AppColors.primaryBlue.withOpacity(0.2),
                  child: Icon(
                    isGirl ? Icons.face_3 : Icons.face_6,
                    size: 50,
                    color: isGirl ? AppColors.primaryPink : AppColors.primaryBlue,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  user.name,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.textDark,
                      ),
                ),
                Text(
                  user.email,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.grey[600],
                      ),
                ),
                const Divider(height: 32),
                _buildInfoRow(Icons.calendar_today, l10n.birthDate, user.dateOfBirth ?? '---'),
                _buildInfoRow(
                  isGirl ? Icons.female : Icons.male, 
                  l10n.gender, 
                  user.gender == 'male' || user.gender == 'boy' ? l10n.boy : l10n.girl
                ),
              ],
            ),
          ),
          Positioned(
            top: 8,
            left: 8,
            child: IconButton(
              icon: const Icon(Icons.edit, color: AppColors.primaryBlue),
              onPressed: () => _showEditProfileDialog(context, user),
              tooltip: l10n.edit,
            ),
          ),
        ],
      ),
    );
  }

  void _showEditProfileDialog(BuildContext context, UserEntity user) {
    final l10n = context.l10n;
    final nameController = TextEditingController(text: user.name);
    String selectedGender = (user.gender == 'female' || user.gender == 'girl') ? 'female' : 'male';
    DateTime selectedDate = DateTime.tryParse(user.dateOfBirth ?? '') ?? DateTime(2010, 1, 1);
    final dateController = TextEditingController(text: DateFormat('yyyy-MM-dd').format(selectedDate));

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          title: Text(l10n.edit, textAlign: TextAlign.center),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: l10n.name,
                    border: const OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  value: selectedGender,
                  decoration: InputDecoration(
                    labelText: l10n.gender,
                    border: const OutlineInputBorder(),
                  ),
                  items: [
                    DropdownMenuItem(value: 'male', child: Text(l10n.boy)),
                    DropdownMenuItem(value: 'female', child: Text(l10n.girl)),
                  ],
                  onChanged: (value) {
                    if (value != null) setState(() => selectedGender = value);
                  },
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: dateController,
                  readOnly: true,
                  decoration: InputDecoration(
                    labelText: l10n.birthDate,
                    border: const OutlineInputBorder(),
                    suffixIcon: const Icon(Icons.calendar_today),
                  ),
                  onTap: () async {
                    final pickedDate = await showDatePicker(
                      context: context,
                      initialDate: selectedDate,
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                    );
                    if (pickedDate != null) {
                      setState(() {
                        selectedDate = pickedDate;
                        dateController.text = DateFormat('yyyy-MM-dd').format(pickedDate);
                      });
                    }
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(l10n.cancel),
            ),
            ElevatedButton(
              onPressed: () {
                final authCubit = context.read<AuthCubit>();
                authCubit.updateProfile(
                  name: nameController.text,
                  gender: selectedGender,
                  dateOfBirth: dateController.text,
                );
                Navigator.pop(context);
              },
              child: Text(l10n.update),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPointsCard(BuildContext context, int points) {
    final l10n = context.l10n;
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        leading: const Icon(Icons.stars, color: AppColors.primaryYellow, size: 32),
        title: Text(
          l10n.pointsLabel,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        trailing: Text(
          '$points',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: AppColors.primaryOrange,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, size: 20, color: AppColors.primaryBlue),
          const SizedBox(width: 12),
          Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
          const Spacer(),
          Text(value, style: const TextStyle(color: Colors.black87)),
        ],
      ),
    );
  }
}
