import 'package:flutter/material.dart';

class CardWidget extends StatefulWidget {
  const CardWidget({super.key});

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  get index => 0;

  @override
  Widget build(BuildContext context) {
    return allJob('title', 'subtitle', '50000');
  }
  //  List<Widget> buildLastJobs() {
  //   List<Widget> list = [];
  //   for (var i = jobs.length - 1; i > -1; i--) {
  //     list.add(buildLastJob(jobs[i]));
  //   }
  //   return list;
  // }

  Widget allJob( String ?title,String ?subtitle,String ?salary) {
    return GestureDetector(
      onTap: () {
       // Navigator.push(
         // context,
        //  MaterialPageRoute(builder: (context) => JobDetail(job: job)
        //),
      //  );
      },
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(bottom: 16),
        child: Row(
          children: [
            Container(
              height: 45,
              width: 45,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ9-kRlr_ZTOhvdY37NclCEoOLYVZFXWZsWDg&usqp=CAU'),
                  // image: AssetImage(job.logo),
                  fit: BoxFit.fitWidth,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title.toString(),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    subtitle.toString(),
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            )),
            Text(
               salary.toString()  ,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}