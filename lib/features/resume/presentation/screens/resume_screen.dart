import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:portfolio/features/resume/data/datadsources/datasources.dart';
import 'package:portfolio/features/resume/presentation/bloc/resume_bloc.dart';

class ResumeScreen extends StatefulWidget {
  const ResumeScreen({super.key});

  @override
  State<ResumeScreen> createState() => _ResumeScreenState();
}

class _ResumeScreenState extends State<ResumeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ResumeBloc>().add(GetResume());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Resume'),
          centerTitle: true,
        ),
        body: BlocBuilder<ResumeBloc, ResumeState>(builder: (context, state) {
          if (state is ResumeLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is ResumeLoaded) {
            final pdfUrl = state.resData.resumeUrl;
            return const PDF(
              autoSpacing: false,
            ).cachedFromUrl(
              '$pdfUrl',
              placeholder: (double progress) =>
                  Center(child: Text('$progress %')),
              errorWidget: (dynamic error) =>
                  Center(child: Text(error.toString())),
            );
          }
          return const SizedBox();
        }));
  }
}
