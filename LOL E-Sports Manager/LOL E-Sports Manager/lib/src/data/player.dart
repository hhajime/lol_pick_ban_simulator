import 'package:flutter_application_1/src/data/list.dart';

class lck_players {
  //게임횟수 30 이상, 판수 순서로 정렬
  //닉네임.이름,국적,팀,생년월일,라인,오버롤,스킬샷,무빙,포지셔닝,포커싱,라인관리,맵리딩,와딩
  //적극성,소통능력,리더쉽,결정력,전술이해력,팀워크,명성
  //반응속도,회복력

  static List deft = [
    'deft',
    'south korea',
    'Hanwha Life',
    '1996-10-23',
    'ADC',
    77,
    20, //공격성
    16, //안정성
    16, //골드수급
    6, //와딩
    18, //캐리력
    8, //적극성
    16, //팀워크
    17, //경험
    17, //반응속도
    17, //회복력
  ];
  static List faker = [
    'faker',
    'south korea',
    'T1',
    '1996-05-07',
    'mid',
    77,
    18, //공격성
    17, //안정성
    15, //골드수급
    6, //와딩
    16, //캐리력
    8, //적극성
    17, //팀워크
    20, //경험
    17, //반응속도
    17, //회복력
  ];
  static List ruler = [
    'ruler',
    'south korea',
    'Gen.G',
    '1998-12-29',
    'ADC',
    75,
    19, //공격성
    16, //안정성
    16, //골드수급
    6, //와딩
    16, //캐리력
    9, //적극성
    17, //팀워크
    27, //경험
    19, //반응속도
    19, //회복력
  ];
}

const LCK_PLAYER_DATA = [
  {
    "nickname": "Faker",
    "name": "Lee Sang-hyeok",
    "country": "South Korea",
    "position": "MID",
    "team": "T1",
    "total_point": 77,
    "aggression": 18,
    "stability": 17,
    "csd": 15,
    "vision": 6,
    "cp": 16,
    "positiveness": 8,
    "teamwork": 17,
    "experience": 20,
    "relation": 17,
    "resilience": 17,
    "player_card": "assets/images/player/card/player_gold.png",
    "player_image": "assets/images/test/faker.png",
    "country_image": "assets/images/test/faker.png",
    "team_image": "assets/images/league_picture/lck/T1.png"
  }
];
