import 'package:flutter/material.dart';
import 'package:toonflix/models/webtoon_episode_model.dart';
import 'package:url_launcher/url_launcher.dart';

class Episode extends StatelessWidget {
  const Episode({Key? key, required this.episode, required this.webtoonId})
      : super(key: key);

  final String webtoonId;
  final WebtoonEpisodeModel episode;
  static const String webtoonBaseUri =
      "https://comic.naver.com/webtoon/detail"; //?titleId=717481&no=222&weekday=wed"

  Future<void> _lauchUrl() async {
    if (!await launchUrl(
        Uri.parse('$webtoonBaseUri?titleId=$webtoonId&no=${episode.id}'))) {
      throw 'Could not launch';
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _lauchUrl,
      child: Container(
        margin: const EdgeInsets.only(
          bottom: 10,
        ),
        decoration: BoxDecoration(
          color: Colors.green.shade400,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Row(
            children: [
              Text(
                episode.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                overflow: TextOverflow.fade,
              ),
              const Icon(
                Icons.chevron_right_rounded,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
