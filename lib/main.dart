import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class QAModel {
  String question;
  String answer;

  QAModel(
    this.question,
    this.answer,
  );
}

List<QAModel> historyQAs = [
  QAModel(
    "What were the main causes of World War I, and how did it impact global geopolitics?",
    "World War I, also known as the Great War, was primarily caused by militarism, alliances, imperialism, and the assassination of Archduke Franz Ferdinand. The war had a profound impact on global geopolitics, leading to the collapse of empires, redrawing of borders, and the eventual rise of new nations.",
  ),
  QAModel(
    "Explain the significance of the Renaissance in European history and its impact on art, culture, and science.",
    "The Renaissance was a cultural and intellectual movement that emerged in Europe during the 14th to 17th centuries. It marked a rebirth of interest in classical learning, arts, and sciences. The Renaissance had a profound impact on art, culture, and science, fostering innovations in painting, sculpture, literature, and scientific inquiry.",
  ),
  QAModel(
    "Describe the events leading to the American Revolution and the key figures involved in the fight for independence.",
    "The American Revolution was sparked by issues such as taxation without representation, British oppression, and the desire for self-governance. Key figures like George Washington, Thomas Jefferson, and Benjamin Franklin played crucial roles in the fight for independence. The revolution resulted in the formation of the United States of America.",
  ),
  QAModel(
    "Explore the causes and consequences of the Industrial Revolution in the 18th and 19th centuries.",
    "The Industrial Revolution was fueled by technological advancements, urbanization, and changes in economic systems. It led to the mechanization of production, urban migration, and social transformations. While it brought about economic growth, it also led to social inequalities, labor exploitation, and environmental challenges.",
  ),
  QAModel(
    "Discuss the major events and consequences of the Cold War between the United States and the Soviet Union.",
    "The Cold War was a geopolitical tension between the United States and the Soviet Union after World War II. It involved ideological conflicts, nuclear arms race, and proxy wars. The Cold War had significant global consequences, shaping international relations and influencing political and military alliances.",
  ),
];

 // QAModel(
  //   "What were the main factors contributing to the fall of the Roman Empire, and how did it impact subsequent civilizations?",
  //   "The fall of the Roman Empire was influenced by internal decay, economic troubles, military decline, and external invasions. The collapse of the empire had profound consequences on Europe, leading to the onset of the Dark Ages and the emergence of new political and social structures.",
  // ),
  // QAModel(
  //   "Examine the role of women in various historical periods and their contributions to social, political, and cultural developments.",
  //   "Throughout history, women have played pivotal roles in shaping societies, despite often being marginalized. From leaders like Cleopatra and Joan of Arc to suffragettes and modern activists, women have contributed significantly to social, political, and cultural advancements.",
  // ),
  // QAModel(
  //   "Describe the events and consequences of the French Revolution, including the rise of Napoleon Bonaparte.",
  //   "The French Revolution was a period of radical social and political upheaval, marked by the overthrow of the monarchy and the rise of radical ideologies. It led to the Reign of Terror, followed by the rise of Napoleon Bonaparte. While the revolution aimed for liberty and equality, it had complex and far-reaching consequences.",
  // ),
  // QAModel(
  //   "Explore the impact of the Civil Rights Movement in the United States and its role in challenging racial segregation and discrimination.",
  //   "The Civil Rights Movement was a crucial social and political movement in the mid-20th century, aiming to end racial segregation and discrimination against African Americans. Led by figures like Martin Luther King Jr., the movement played a pivotal role in achieving landmark legislation and shaping the struggle for civil rights.",
  // ),
  // QAModel(
  //   "Discuss the origins, events, and outcomes of the Apollo moon landing missions conducted by NASA in the 1960s and 1970s.",
  //   "The Apollo moon landing missions were a series of space exploration efforts by NASA, culminating in the successful landing of astronauts on the moon. These missions, particularly Apollo 11, marked significant achievements in human space exploration and contributed to advancements in science and technology.",
  // ),

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Speech Text",
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  FlutterTts flutterTts = FlutterTts();
  String selectedQuestion = "";
  String selectedAnswer = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Question & Answer App",
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildQuestionButton(historyQAs[0]),
          _buildQuestionButton(historyQAs[1]),
          _buildQuestionButton(historyQAs[2]),
          _buildQuestionButton(historyQAs[3]),
          _buildQuestionButton(historyQAs[4]),
          const SizedBox(height: 20),
          RichText(
            text: TextSpan(
              text: 'Selected Question: ',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              children: [
                TextSpan(
                  text: selectedQuestion,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          RichText(
            text: TextSpan(
              text: 'Answer: ',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              children: [
                TextSpan(
                  text: selectedAnswer,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuestionButton(QAModel qaModel) {
    return ElevatedButton(
      onPressed: () {
        _selectQuestion(qaModel);
      },
      child: Text(qaModel.question),
    );
  }

  void _selectQuestion(QAModel qaModel) {
    setState(() {
      selectedQuestion = qaModel.question;
      selectedAnswer = qaModel.answer;
      _speak(selectedAnswer);
    });
  }

  Future<void> _speak(String text) async {
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.setPitch(1.0);
    await flutterTts.speak(text);
  }
}
