import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<FootballMatch> _footballmatches = [];
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  // @override
  // void initState() {
  //   super.initState();
  //   _fetchFootballMatches();
  // }
  //
  // Future<void> _fetchFootballMatches() async {
  //   _footballmatches.clear();
  //   QuerySnapshot<Map<String, dynamic>> snapshot = await _firestore
  //       .collection('football')
  //       .get();
  //   for (QueryDocumentSnapshot<Map<String, dynamic>> doc in snapshot.docs) {
  //     _footballmatches.add(FootballMatch.fromJson(doc.data()));
  //   }
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Footbal Live Score')),
      body: StreamBuilder(
        stream: _firestore.collection('football').snapshots(),
        builder: (context, asyncSnapshot) {
          if (asyncSnapshot.connectionState == ConnectionState.waiting) {
            return Center(child: Text('Error: ${asyncSnapshot.error}'));
          }
          if (asyncSnapshot.hasError) {
            return Center(child: Text('Error: ${asyncSnapshot.error}'));
          }
          if (asyncSnapshot.hasData) {
            _footballmatches.clear();
            for (QueryDocumentSnapshot<Map<String, dynamic>> doc
            in asyncSnapshot.data!.docs) {
              _footballmatches.add(FootballMatch.fromJson(doc.data()));
            }
            return _buildListView();
          }
          return SizedBox();
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            onPressed: () {
        //add button
        FootballMatch match = FootballMatch(
        team1Name: 'Uruguay',
        team2Name: 'Brazil',
        team1Score: 7,
        team2Score: 3,
        isRunning: true,
        winnerTeam: '');
    _firestore.collection('football').doc('uruvsbra').set(match.toJason());
  },
    child: Icon(Icons.add),
    ),
    FloatingActionButton(
      onPressed: () {
        //update button
        FootballMatch match = FootballMatch(
            team1Name: 'Uruguay',
            team2Name: 'Brazil',
            team1Score: 1,
            team2Score: 2,
            isRunning: false,
            winnerTeam: '');
        _firestore.collection('football').doc('uruvsbra').update(
            match.toJason());
      },
      child: Icon(Icons.update),
    ),
    ]
      )
    );
    }

  Widget _buildListView() {
    return ListView.separated(
      itemCount: _footballmatches.length,
      itemBuilder: (context, index) {
        final footballmatches = _footballmatches[index];
        return ListTile(
          leading: CircleAvatar(
            radius: 8,
            backgroundColor: footballmatches.isRunning
                ? Colors.green
                : Colors.grey,
          ),
          title: Text(
            '${footballmatches.team1Name} VS ${footballmatches.team2Name}',
          ),
          subtitle: Text('Winner Team: ${footballmatches.winnerTeam}'),
          trailing: Text(
            '${footballmatches.team1Score}:${footballmatches.team2Score}',
            style: TextTheme.of(context).titleLarge,
          ),
        );
      },
      separatorBuilder: (context, index) {
        return Divider();
      },
    );
  }
}

class FootballMatch {
  final String team1Name;
  final String team2Name;
  final int team1Score;
  final int team2Score;
  final bool isRunning;
  final String winnerTeam;

  FootballMatch({
    required this.team1Name,
    required this.team2Name,
    required this.team1Score,
    required this.team2Score,
    required this.isRunning,
    required this.winnerTeam,
  });

  factory FootballMatch.fromJson(Map<String, dynamic> jsonData) {
    return FootballMatch(
      team1Name: jsonData['team1_Name'] ,
      team2Name: jsonData['team2_Name'] ,
      team1Score: jsonData['team1_Score'] ,
      team2Score: jsonData['team2_Score'] ,
      isRunning: jsonData['is_Running'] ,
      winnerTeam: jsonData['winner_Team'] ,
    );
  }
  Map<String, dynamic> toJason(){
    return{
      'team1_Name': team1Name,
      'team2_Name': team2Name,
      'team1_Score': team1Score,
      'team2_Score': team2Score,
      'is_Running': isRunning,
      'winner_Team': winnerTeam,
    };
  }
}
