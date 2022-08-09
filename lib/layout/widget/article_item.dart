import 'package:flutter/material.dart';
import 'package:news_app/modules/article_screen.dart';

class ArticleItem extends StatelessWidget {
  ArticleItem({Key? key, required this.article}) : super(key: key);
  Map? article;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ArticleScreen(
                        url: article!['url'],
                      )));
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(
                    article!['urlToImage'] ??
                        "https://www.aepint.nl/wp-content/uploads/2014/12/No_image_available.jpg",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              width: 10.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    article!['title'] ?? " ",
                    style: Theme.of(context).textTheme.bodyText1,
                    maxLines: 3,
                    textDirection: TextDirection.rtl,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    "${article!['publishedAt'].toString().substring(11, 16)} ${article!['publishedAt'].toString().substring(0, 10)}",
                    style: const TextStyle(fontSize: 16, color: Colors.grey),
                    textDirection: TextDirection.rtl,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
