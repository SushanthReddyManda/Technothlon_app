import 'package:flutter/material.dart';
import 'package:flutter_app_technothlon/MAINS/Mains.dart';
//import 'package:flutter_app_technothlon/ContactUs/components/know_your_reps.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'ChatWithUs/chat_with_us.dart';
import 'LED/LED.dart';
import 'ContactUs/contact_us.dart';
import 'LogicQ.dart';
import 'Notifications/notifications.dart';
import 'QuickLinks/quick_links.dart';

import 'Updates/updates.dart';

import 'package:flutter_app_technothlon/Updates/updates.dart';
import 'AboutUs/about_us.dart';
import 'Technopedia/technopedia.dart';
import 'Solutions/solutions.dart';

Color fb_blue = Color.fromRGBO(66, 103, 178, 1);

Color primaryGreen = Color(0xff416d6d);
List<BoxShadow> shadowList = [
  BoxShadow(color: Colors.grey[300], blurRadius: 30, offset: Offset(0, 10))
];

List<Map> categories = [
  {'name': 'AboutUs', 'iconPath': 'images/AboutUs.png', 'page': AboutUs()},
  {'name': 'LED', 'iconPath': 'images/LED.png', 'page': LED()},
  {
    'name': 'Mains',
    'iconPath': 'images/circle-cropped (1).png',
    'page': main_event(),
  },
  {'name': 'Pedia', 'iconPath': 'images/Pedia.png', 'page': Technopedia()},
];
List<Map> slider = [
  {
    'text': '',
    'iconpath':
        'gs://technothlon-8632e.appspot.com/Coudeil_images/coupdoeil1.png'
  },
  {
    'text': '',
    'iconpath':
        'gs://technothlon-8632e.appspot.com/Coudeil_images/coupdoeil2.png'
  },
  {
    'text': '',
    'iconpath':
        'gs://technothlon-8632e.appspot.com/Coudeil_images/coupdoeil3.png'
  },
  {
    'text': '',
    'iconpath':
        'gs://technothlon-8632e.appspot.com/Coudeil_images/coupdoeil4.png'
  },
  {
    'text': '',
    'iconpath':
        'gs://technothlon-8632e.appspot.com/Coudeil_images/coupdoeil5.png'
  }
];
List<Map> experiment = [
  {'iconpath': 'gs://technothlon-8632e.appspot.com/Led_images/Experiment1.png'},
  {'iconpath': 'gs://technothlon-8632e.appspot.com/Led_images/Experiment2.png'},
  {'iconpath': 'gs://technothlon-8632e.appspot.com/Led_images/Experiment3.png'},
  {'iconpath': 'gs://technothlon-8632e.appspot.com/Led_images/Experiment4.png'},
  {'iconpath': 'gs://technothlon-8632e.appspot.com/Led_images/Experiment5.png'},
  {'iconpath': 'gs://technothlon-8632e.appspot.com/Led_images/Experiment6.png'},
  {'iconpath': 'gs://technothlon-8632e.appspot.com/Led_images/Experiment7.png'},
  {'iconpath': 'gs://technothlon-8632e.appspot.com/Led_images/Experiment8.png'},
  {'iconpath': 'gs://technothlon-8632e.appspot.com/Led_images/Experiment9.png'},
  {
    'iconpath': 'gs://technothlon-8632e.appspot.com/Led_images/Experiment10.png'
  },
];

List<Map> drawerItems = [
  {'icon': Icons.person, 'title': 'About Us', 'page': AboutUs()},
  {'icon': Icons.computer, 'title': 'Technopedia', 'page': Technopedia()},
  {'icon': Icons.book, 'title': "Past Years's", 'page': Solutions()},
//  {
//    'icon': Icons.lightbulb_outline,
//    'title' : 'LogicQ',
//    'page':LogicQ()
//  },

  {'icon': Icons.update, 'title': 'Updates', 'page': Updates()},
  {'icon': Icons.link, 'title': 'Quick Links', 'page': QuickLinks()},
  {'icon': Icons.chat, 'title': 'Chat With Us', 'page': ChatWithUs()},
  {'icon': Icons.contacts, 'title': 'Contact Us', 'page': ContactUs()},
];

List<Map> headlist = [
  {
    'tag': 'bhushan',
    'name': 'Bhushan Kad',
    'iconPath': 'gs://technothlon-8632e.appspot.com/Heads_images/bhushan.jpeg',
    'details': 'North Zone',
    'email': 'bhushan@techniche.org',
    'number': '+91 9595965968',
  },
  {
    'tag': 'yatharth',
    'name': 'Yatharth Singh',
    'iconPath': 'gs://technothlon-8632e.appspot.com/Heads_images/yatharth.jpeg',
    'details': 'West Zone',
    'email': 'yatharth@techniche.org',
    'number': '+91 9462656908',
  },
  {
    'tag': 'shrushti',
    'name': 'Shrushti Jain',
    'iconPath': 'gs://technothlon-8632e.appspot.com/Heads_images/shrushti.jpeg',
    'details': 'Central Zone',
    'email': 'shrushti@techniche.org',
    'number': '+91 7869853284',
  },
  {
    'tag': 'prathamesh',
    'name': 'Prathamesh Muley',
    'iconPath':
        'gs://technothlon-8632e.appspot.com/Heads_images/prathmesh.jpeg',
    'details': 'East Zone',
    'email': 'muley@techniche.org',
    'number': '+91 9158901133',
  },
  {
    'tag': 'navya',
    'name': 'Navya Sri M', // Manchikatla
    'iconPath': 'gs://technothlon-8632e.appspot.com/Heads_images/navya.jpeg',
    'details': 'South Zone',
    'email': 'navya@techniche.org',
    'number': '+91 8876048805'
  },
  {
    'tag': 'sushanth',
    'name': 'Sushanth Reddy M',
    'iconPath': 'gs://technothlon-8632e.appspot.com/Heads_images/sushanth.png',
    'details': 'South Zone',
    'email': 'sushanth@techniche.org',
    'number': '+91 9515422810',
  }
];

List<Map> mains_events = [
  {
    'Name': 'BIT LOGICA\n(HAUTS)',
    'About':
        '''Bit logica If you were to put together a Biggest Hits list of card games, you would probably put Bit Logica at the top of that. Although very few people have played this game, yet it was a big success in Technothlon '18 Mains.Well yes its a card game. And its a card game in which even if you feel that you have got the bad cards, you can still turn the tables.''',
    'Year': '2018',
    'iconpath':
        'gs://technothlon-8632e.appspot.com/Mains_images/2018/2018_bit_logica.jpg'
  },
  {
    'Name': 'WAR OF THE WORLDS\n(HAUTS)',
    'About':
        '''It's the year 2050, Human kind is on the verge of extinction, world population has touched the 12 billion mark. Most countries decimated, entire continents rendered uninhabitable. Technothlon 2018 witnessed “ War of The World” where the students time traveled to year 2050 only to ascertain that the world is in peril. With only 50 surviving nations at war.''', // its in the hand of the leader of the country. a team of two to strive to survive
    'Year': '2018',
    'iconpath':
        'gs://technothlon-8632e.appspot.com/Mains_images/2018/2018_thewarofworlds.jpg'
  },
  {
    'Name': 'DATAVENGERS\n(HAUTS)',
    'About':
        'In God we trust. All others must bring data: The Participants were introduced to the world of Machine Learning and Data Science. They were taught the fundamentals of Data Handling and Machine Learning. They had to predict the Price of houses given their features. What followed was tedious hour-and-a-half data analysis and getting amazing predictions . ', // which got better the more they dwelled over it.
    'Year': '2018',
    'iconpath':
        'gs://technothlon-8632e.appspot.com/Mains_images/2018/2018_datavengers.jpg'
  },
  {
    'Name': 'MATHMAX\n(JUNIORS)',
    'About':
        'MathMax, I guess the name is enough to tell you this involves something related to Maths! But what it does not tell you how much brain it requires to play the game. An event made after Hardwork of more than 10 months, will surely make your heads go crazy. To analyze each move of opponent, and to place a number and operator on a concentric Board may sound easy! ',
    'Year': '2018',
    'iconpath':
        'gs://technothlon-8632e.appspot.com/Mains_images/2018/2018_mathmax.jpg'
  },
  {
    'Name': 'THE BIG SHORT\n',
    'About':
        'After a successful Prelims this year, Technothlon Mains began this year with “The Big Short” Ever wondered how your parents manage their money and resources for your bright future?? Ever thought of becoming a businessman?? Ever thought of making your own superhero?? I know it’s getting interesting This event was all about bringing these thoughts into implementation .', //  processes into implementation where the students were given the opportunity to build their own Superhero
    'Year': '2018',
    'iconpath':
        'gs://technothlon-8632e.appspot.com/Mains_images/2018/2018_thebigshort.jpg'
  },
  {
    'Name': 'BOB THE BUILDER\n(JUNIORS)',
    'About':
        '''Sounds childish and simple well that's not what you think. Inspired by the title in this mechanical based event students had to make a bot that collect small paper balls. Moreover, NO Design specified they had to think the best design to fulfill the objective. THAT'S ALL? NO!! Adding to the difficulty, Its Time to test the bot.''',
    'Year': '2018',
    'iconpath':
        'gs://technothlon-8632e.appspot.com/Mains_images/2018/2018_bob.jpg'
  },
  {
    'Name': 'CHEXPLODE\n(JUNIORS)',
    'About':
        'Players lining up, getting their army together, ready to pit against each other, and devising their strategies, combing up their defences, protecting their king with their utmost might, for if a close acquaintance of the king is kidnapped, thus ends the reign of the mighty ruler- In this Game of CheXplode, you win or you die, there is no middle ground in between. ', // With chaos all around, there is one way out- Blow up the enemy king by capturing its closest and loyal supporters
    'Year': '2018',
    'iconpath':
        'gs://technothlon-8632e.appspot.com/Mains_images/2018/2018_chexplode.jpg'
  },
  {
    'Name': 'HOP & CONQ\n(JUNIORS)',
    'About':
        'After a successful Prelims this year, Technothlon Mains began this year with Hop & Conq. A twist on the classic game of Chinese Checkers, it combines the best parts of checkers and chess, with pieces being given special powers. What followed was a game filled with thrill and suspense, that kept the participants on the edge of their seats, calculating their next move. ',
    'Year': '2017',
    'iconpath':
        'gs://technothlon-8632e.appspot.com/Mains_images/2017/2017_hoqandconq.jpg'
  },
  {
    'Name': 'PRAGYAN\n(JUNIORS)',
    'About':
        '''Pragyan was about building a working hydraulic arm right from scratch using household items, like cardboard, pipes and syringes. The students were free to come up with their own designs for completing the task. The basic principle involved was Pascal's Law. The students came up with some really innovative arm designs and was a sight to behold. ''',
    'Year': '2017',
    'iconpath':
        'gs://technothlon-8632e.appspot.com/Mains_images/2017/2017_pragyan.jpg'
  },
  {
    'Name': 'FLUXO DE ENERGIA\n(JUNIORS)',
    'About':
        '''The students played against each other in real-time, in a quest to make trades and increase their life energy! A player could take up many roles, invest, grow and sell. The ultimate aim was to make the most profit. Being a real-time event, each player's action affected the other, resulting in a very dynamic game which had the participants thinking and planning at all times. ''',
    'Year': '2017',
    'iconpath':
        'gs://technothlon-8632e.appspot.com/Mains_images/2017/2017_fluxo.jpg'
  },
  {
    'Name': 'CONTADOR DE ELECTRONICA\n(JUNIORS)',
    'About':
        ''' The event began with an hour long workshop about breadboards and logical circuits. The students were then given an opportunity to practice their circuit making skills. Following which, their logical skills were put to the test as they were asked to not only design, but also assemble a counter circuit. This electrifying event had the students buzzing for a long time even after its completion!''',
    'Year': '2017',
    'iconpath':
        'gs://technothlon-8632e.appspot.com/Mains_images/2017/2017_contador.jpg'
  },
  {
    'Name': 'THE QUANTUM ESCAPE\n(HAUTS)',
    'About':
        'The event introduced students to the world of Game Development! The students were taught the game developing software Construct 2. A lot of thrill and excitement ensued as the students strategized to get across the maze after finding the optimum route. Once they got through the maze, they had to use the utilities of the software to debug a buggy game.',
    'Year': '2017',
    'iconpath':
        'gs://technothlon-8632e.appspot.com/Mains_images/2017/2017_thequantumescape.jpg'
  },
  {
    'Name': 'MECHAWALK\n(HAUTS)',
    'About':
        '''In this mechanical based event, the students were asked to make a bot that moves in a straight line. Sounds simple? What if you weren't allowed to use any curved surface as a wheel? Or connect the wheels directly to the motor? A set of restrictions were placed so as to get the students to think out of box! And think they did. ''',
    'Year': '2017',
    'iconpath':
        'gs://technothlon-8632e.appspot.com/Mains_images/2017/2017_mechawalk.jpg'
  },
  {
    'Name': '''!CHESS\n(HAUTS)''',
    'About':
        'As the name suggests, it is not chess. With a completely new board setup and a different objective for each player, it was unlike anything they had ever seen. With teams constantly looking to one up each other with their strategies, the players were on the edge of their seats for the entire duration of the game! ',
    'Year': '2017',
    'iconpath':
        'gs://technothlon-8632e.appspot.com/Mains_images/2017/2017_chess.jpg'
  },
  {
    'Name': 'A LITTLE BID\n(HAUTS)',
    'About':
        '''A Little Bid was a one of it's kind event that tested several aspects of the participants such as reasoning ability, mathematical skills, emotional stability, teamwork and ability to take instantaneous decisions. All participants were given virtual money, using which they had to auction for commodities. You not only had to be careful about the amount of money you're investing.''', // but also about when you're investing it
    'Year': '2017',
    'iconpath':
        'gs://technothlon-8632e.appspot.com/Mains_images/2017/2017_little.jpg'
  },
  {
    'Name': 'THE PHOTOHOLICS\n(HAUTS)',
    'About':
        'Objective of the event was to give a glimpse of the world of Robotics to the students. The problem statement was to make a Light-Sensing self driven vehicle. By using LDRs , the students made brilliant prototypes and solved the maze by showing path to their bots. ',
    'Year': '2016',
    'iconpath':
        'gs://technothlon-8632e.appspot.com/Mains_images/2016/2016_photolics.jpg'
  },
  {
    'Name': 'LOXICO CIRCUITOS\n(HAUTS)',
    'About':
        'Objective of the event was to give a glimpse of the world of Robotics to the students. The problem statement was to make a Light-Sensing self driven vehicle. By using LDRs , the students made brilliant prototypes and solved the maze by showing path to their bots. ',
    'Year': '2016',
    'iconpath':
        'gs://technothlon-8632e.appspot.com/Mains_images/2016/2016_circuitos.jpg'
  },
  {
    'Name': 'EN PASANT\n(HAUTS)',
    'About':
        ''' 'Chess - Literally With A Twist' ! The objective of this event was for the students to play a reinvented version of chess in which 2 teams competed against each other. The twist in this event was that the board rotated after every two moves which added a new level of difficulty to this already arduous game. ''',
    'Year': '2016',
    'iconpath':
        'gs://technothlon-8632e.appspot.com/Mains_images/2016/2016_passant.jpg'
  },
  {
    'Name': 'UNO! DOS! TRES!\n(JUNIORS)',
    'About':
        'There is no harm in saying that ‘Out of the box thinking’ and ‘Technothlon’ are synonyms! The last event of Juniors squad required students to brainstorm strategies, co-ordinate and use logical skills well. This event was basically a card game where participants were asked to make a particular configuration of cards through exchanges. The exchanges occur in a particular fashion.',
    'Year': '2016',
    'iconpath':
        'gs://technothlon-8632e.appspot.com/Mains_images/2016/2016_uno.jpg'
  },
  {
    'Name': 'SAIL THE MAZE\n(JUNIORS)',
    'About':
        'Objective of the event was to give students an insight of Naval engineering and the practical problems which was faced during the designing of ships. They were asked to make an RC boat with two motors attached. After making their boat, they were supposed to cover a maze (which was made in an artificial pool) with different check points within shortest time, collecting as many points as they can.',
    'Year': '2016',
    'iconpath':
        'gs://technothlon-8632e.appspot.com/Mains_images/2016/2016_sail.jpg'
  },
  {
    'Name': 'CODEYARD\n(JUNIORS)',
    'About':
        'Adding another into the list, here comes the event which made the students to think before they think.The objective of this event was to introduce the students to the world of programming at a very early stage.Followed by a workshop , the event involved the students to use the deeper part of their brains for the next few hours.To let the students get familiar with codes.', // a simple and easy to understand language was designed.
    'Year': '2016',
    'iconpath':
        'gs://technothlon-8632e.appspot.com/Mains_images/2016/2016_couteyard.jpg'
  },
  {
    'Name': 'BREAKING BAD\n(JUNIORS)',
    'About':
        'The objective of this event was to design a simple vehicle with some braking mechanism. The vehicle starts off from the top of a ramp where it gains sufficient potential energy to move forward and with the use of the braking mechanism, students had to stop their vehicle as close as possible to a fixed line.',
    'Year': '2016',
    'iconpath':
        'gs://technothlon-8632e.appspot.com/Mains_images/2016/2016_braking.jpg'
  },
  {
    'Name': 'BREAK THE BLACK\n(J)',
    'About':
        '''As powerful as it sounds was a mystery breaking process, only that it involved experimentation with electronic circuitry. Stunned in awe with a tinge of fire and adventure in their eyes, the hundred top teds of juniors squad, gushed out their ultra-fast testing and inference capabilities''',
    'Year': '2015',
    'iconpath':
        'gs://technothlon-8632e.appspot.com/Mains_images/2015/2015_break.jpg'
  },
  {
    'Name': 'Poké Quest\n(J)',
    'About':
        ''' The adventure begins with a dream and motivation. There are no ways to escape from the epic battle, that will lead you to become a master! Technothlon gives the juniors their second challenge, this time with a machine programmed to fight with them and bring out the best of them all.''',
    'Year': '2015',
    'iconpath':
        'gs://technothlon-8632e.appspot.com/Mains_images/2015/2015_poke.jpg'
  },
  {
    'Name': 'WATER ESCAPE TO GLORY\n(J)',
    'About':
        ''' As the name suggest, in the first event of Day 2, Technothlon gives the finalist their first experienced to compressed-fluid rockets or the Water Rockets. Get to know the basics of construction and working of a Water Rocket, put in your innovation and create your master piece.''',
    'Year': '2015',
    'iconpath':
        'gs://technothlon-8632e.appspot.com/Mains_images/2015/2015_waterescape.jpg'
  },
  {
    'Name': 'WATER OF METTLES',
    'About':
        ''' The first event for the hauts Techno finale. And let me tell you, it was a war alright! The students bared their fangs of wit and sharpened their swords of logic with much enthusiasm as they looted, plundered, formed alliances, stratergised and slashed their way to victory.''',
    'Year': '2015',
    'iconpath':
        'gs://technothlon-8632e.appspot.com/Mains_images/2015/2015_mettles.jpg'
  },
  {
    'Name': 'AIR CRASH INVESTIGATION',
    'About':
        ''''Once you eliminate the impossible, whatever reimages, however improbable, must be the truth...' In this second event of Hauts squad, the students had to use their \'detective instincts\' to unravel a mystery which led to the crash of a hypothetical aircraft.''',
    'Year': '2015',
    'iconpath':
        'gs://technothlon-8632e.appspot.com/Mains_images/2015/2015_airinvestigation.jpg'
  },
  {
    'Name': '3RINGS\n(H)',
    'About':
        '''The third event for Hauts squad gave the students a hands on experience of basic robotics and circuit design. After an introduction to the world of robotics the students had to assemble their own differential drive bot and navigate through a maze. Two bonus rounds also tested their problem solving skills.''',
    'Year': '2015',
    'iconpath':
        'gs://technothlon-8632e.appspot.com/Mains_images/2015/2015_3rings.jpg'
  },
  {
    'Name': 'FINAL SHOWDOWN\n(H)',
    'About':
        ''' On Day 3, the top five teams from the Hauts squad faced off in the Final Showdown. The winner was decided after three rounds: (i) Each team challenged their participants to a “puzzle-off”(ii) The teams were left stranded on Mars, where they had to shrewdly allocate their resources (iii) In a test of memory, they had to deduce the cards present with the opponents''',
    'Year': '2015',
    'iconpath':
        'gs://technothlon-8632e.appspot.com/Mains_images/2015/2015_final(hauts).jpg'
  },
  {
    'Name': 'FINAL SHOWDOWN\n(J)',
    'About':
        '''After three intriguing and gruelsome events, the top 5 teams of the juniors squad so far, faced each other in never-seen-before challenges called 'Apocalypso - The Final Battle'.''',
    'Year': '2015',
    'iconpath':
        'gs://technothlon-8632e.appspot.com/Mains_images/2015/2015_final(juniors).jpg'
  },
  {
    'Name': 'BATTLE OF HOGWARTS\n(H)',
    'About':
        '''The second release of T'14 Mains Promenade presents you the online hauts event - Battle Of Hogwarts, the enthralling game in which the participants cast various charms on dangerous monsters and each other and hovered their way to victory.''',
    'Year': '2014',
    'iconpath':
        'gs://technothlon-8632e.appspot.com/Mains_images/2014/2014_hogwarts.jpg'
  },
  {
    'Name': 'NIC : Doomsday\n(H)',
    'About':
        'A test of analytical and deductive skills for the Hauts squad, the NIC: Doomsday materialized after days of meticulous planning and extensive plotting. Bringing the teams right into the heart of the Cold War era, the event boasted of never-seen-before concepts.',
    'Year': '2014',
    'iconpath':
        'gs://technothlon-8632e.appspot.com/Mains_images/2014/2014_doomsday.jpg'
  },
  {
    'Name': 'INSTIGRID\n(JUNIORS)',
    'About':
        'In INSTIGRID participants put their brain against their peers on a platform named “Conway’s Game of Life” (cellular automation) where they had to design a board which had both offensive and defensive elements to attack and protect from their opponents.',
    'Year': '2014',
    'iconpath':
        'gs://technothlon-8632e.appspot.com/Mains_images/2014/2014_instigrid.jpg'
  },
  {
    'Name': 'Roboter Saunde\n(JUNIORS)',
    'About':
        '''It was a question of imagination, logic and control for the participants probing the paths of the unseen Martian surface with sensors while the only senses they got to put to use was common sense.The sixth release of T'14 Mains Promenade brings you the enthralling robotics event - Roboter ''',
    'Year': '2014',
    'iconpath':
        'gs://technothlon-8632e.appspot.com/Mains_images/2014/2014_roboter.jpg'
  },
  {
    'Name': 'Technokits\n(Juniors)',
    'About':
        '''Days come and go with every day having in store for us something more enthralling than the former. Only the memories remain behind which we can cherish lifelong. The thrilling journey of Technothlon'14 Mains has been as memorable for us as Organizers as it would have been for you as Participants. ''',
    'Year': '2014',
    'iconpath':
        'gs://technothlon-8632e.appspot.com/Mains_images/2014/2014_promenade.jpg'
  },
  {
    'Name': 'HYDROCALYPSE\n(JUNIORS)',
    'About':
        '''''Ideas come alive when you believe in them.' With constant teamwork and perseverance 'HYDROCALYPSE' which was an 'idea' came alive and we were delighted to witness the same in the participants who implemented many innovative ideas in the event and with hard work and dedication came out with flying colours.''',
    'Year': '2014',
    'iconpath':
        'gs://technothlon-8632e.appspot.com/Mains_images/2014/2014_hydrocalypse.jpg'
  },
  {
    'Name': 'FINAL SHOWDOWN',
    'About':
        'The phrase “Expect the unexpected” perfectly describes the final images event of Technothlon. All the events of the images are nerve-raking enough. Add to that the pressure of the championship decider in a surprise format round where the top 5 teams compete against each other head-on. ',
    'Year': '2014',
    'iconpath':
        'gs://technothlon-8632e.appspot.com/Mains_images/2014/2014_final.jpg'
  },
];
