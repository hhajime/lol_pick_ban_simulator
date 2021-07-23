import 'dart:convert';
import 'package:flutter/material.dart';

ScrollController scrollController;

Color mainColor = Color(0xff060F14);
Color subColor = Color(0xFFC8AA6E);
Color caughtColor = Colors.red;

String champIcon = "assets/images/champion_icon.jpg";
String temp;
String champName;
String banTemp;

int variableSet = 0;
int tempNum;

double width;
double height;
double displayHeight;
double displayWidth;
double displayRatio;

List targetImage = List<String>.filled(10, null, growable: false);
List player = List<String>.filled(5, champIcon, growable: false);
List bluPlayer = List<String>.filled(5, champIcon, growable: false);
List redPlayer = List<String>.filled(5, champIcon, growable: false);
List redTeam = List<String>.filled(5, champIcon, growable: false);
List bluTeam = List<String>.filled(5, champIcon, growable: false);
List topList = Champions.top;
List jugList = Champions.jug;
List midList = Champions.mid;
List botList = Champions.bot;
List supList = Champions.sup;

class Champions {
  Future _listAssets(context) async {
    // Load as String
    final manifestContent =
        await DefaultAssetBundle.of(context).loadString('AssetManifest.json');
    // Decode to Map
    final Map<String, dynamic> manifestMap = json.decode(manifestContent);
    // Filter by path
    final filtered = manifestMap.keys
        .where((path) => path.startsWith('assets/images/champions/SUP/'))
        .toList();
  }

  static List<String> top = [
    "assets/images/champions/TOP/RiotX_ChampionList_aatrox.jpg",
    "assets/images/champions/TOP/RiotX_ChampionList_akali.jpg",
    "assets/images/champions/TOP/RiotX_ChampionList_camille.jpg",
    "assets/images/champions/TOP/RiotX_ChampionList_chogath.jpg",
    "assets/images/champions/TOP/RiotX_ChampionList_darius.jpg",
    "assets/images/champions/TOP/RiotX_ChampionList_drmundo.png",
    "assets/images/champions/TOP/RiotX_ChampionList_fiora.jpg",
    "assets/images/champions/TOP/RiotX_ChampionList_gangplank.jpg",
    "assets/images/champions/TOP/RiotX_ChampionList_garen.jpg",
    "assets/images/champions/TOP/RiotX_ChampionList_gnar.jpg",
    "assets/images/champions/TOP/RiotX_ChampionList_gwen.jpg",
    "assets/images/champions/TOP/RiotX_ChampionList_heimerdinger.jpg",
    "assets/images/champions/TOP/RiotX_ChampionList_illaoi.jpg",
    "assets/images/champions/TOP/RiotX_ChampionList_irelia.jpg",
    "assets/images/champions/TOP/RiotX_ChampionList_jax.jpg",
    "assets/images/champions/TOP/RiotX_ChampionList_jayce.jpg",
    "assets/images/champions/TOP/RiotX_ChampionList_kayle.jpg",
    "assets/images/champions/TOP/RiotX_ChampionList_kennen.jpg",
    "assets/images/champions/TOP/RiotX_ChampionList_kled.jpg",
    "assets/images/champions/TOP/RiotX_ChampionList_malaphite.jpg",
    "assets/images/champions/TOP/RiotX_ChampionList_maokai.jpg",
    "assets/images/champions/TOP/RiotX_ChampionList_monkeyking.jpg",
    "assets/images/champions/TOP/RiotX_ChampionList_mordekaiser.jpg",
    "assets/images/champions/TOP/RiotX_ChampionList_nasus.jpg",
    "assets/images/champions/TOP/RiotX_ChampionList_ornn.jpg",
    "assets/images/champions/TOP/RiotX_ChampionList_poppy.jpg",
    "assets/images/champions/TOP/RiotX_ChampionList_quinn.jpg",
    "assets/images/champions/TOP/RiotX_ChampionList_renekton.jpg",
    "assets/images/champions/TOP/RiotX_ChampionList_rengar.jpg",
    "assets/images/champions/TOP/RiotX_ChampionList_riven.jpg",
    "assets/images/champions/TOP/RiotX_ChampionList_sett.png",
    "assets/images/champions/TOP/RiotX_ChampionList_shen.jpg",
    "assets/images/champions/TOP/RiotX_ChampionList_teemo.jpg",
    "assets/images/champions/TOP/RiotX_ChampionList_tryndamere.jpg",
    "assets/images/champions/TOP/RiotX_ChampionList_urgot.jpg",
    "assets/images/champions/TOP/RiotX_ChampionList_vladimir.jpg",
    "assets/images/champions/TOP/RiotX_ChampionList_volibear.png",
    "assets/images/champions/TOP/RiotX_ChampionList_yorick.jpg",
  ];

  static List<String> jug = [
    "assets/images/champions/JUG/RiotX_ChampionList_amumu.jpg",
    "assets/images/champions/JUG/RiotX_ChampionList_diana.jpg",
    "assets/images/champions/JUG/RiotX_ChampionList_elise.jpg",
    "assets/images/champions/JUG/RiotX_ChampionList_evelynn.jpg",
    "assets/images/champions/JUG/RiotX_ChampionList_fiddlesticks.jpeg",
    "assets/images/champions/JUG/RiotX_ChampionList_gragas.jpg",
    "assets/images/champions/JUG/RiotX_ChampionList_graves-cigar.jpg",
    "assets/images/champions/JUG/RiotX_ChampionList_hecarim.jpg",
    "assets/images/champions/JUG/RiotX_ChampionList_ivern.jpg",
    "assets/images/champions/JUG/RiotX_ChampionList_jarvaniv.jpg",
    "assets/images/champions/JUG/RiotX_ChampionList_karthus.jpg",
    "assets/images/champions/JUG/RiotX_ChampionList_kayn.jpg",
    "assets/images/champions/JUG/RiotX_ChampionList_khazix.jpg",
    "assets/images/champions/JUG/RiotX_ChampionList_kindred.jpg",
    "assets/images/champions/JUG/RiotX_ChampionList_leesin.jpg",
    "assets/images/champions/JUG/RiotX_ChampionList_lillia.jpg",
    "assets/images/champions/JUG/RiotX_ChampionList_masteryi.jpg",
    "assets/images/champions/JUG/RiotX_ChampionList_nidalee.jpg",
    "assets/images/champions/JUG/RiotX_ChampionList_nunu.jpg",
    "assets/images/champions/JUG/RiotX_ChampionList_olaf.jpg",
    "assets/images/champions/JUG/RiotX_ChampionList_rammus.jpg",
    "assets/images/champions/JUG/RiotX_ChampionList_reksai.jpg",
    "assets/images/champions/JUG/RiotX_ChampionList_rumble.jpg",
    "assets/images/champions/JUG/RiotX_ChampionList_sejuani.jpg",
    "assets/images/champions/JUG/RiotX_ChampionList_shaco.jpg",
    "assets/images/champions/JUG/RiotX_ChampionList_shyvana.jpg",
    "assets/images/champions/JUG/RiotX_ChampionList_skarner.jpg",
    "assets/images/champions/JUG/RiotX_ChampionList_trundle.jpg",
    "assets/images/champions/JUG/RiotX_ChampionList_udyr.jpg",
    "assets/images/champions/JUG/RiotX_ChampionList_vi.jpg",
    "assets/images/champions/JUG/RiotX_ChampionList_viego.jpg",
    "assets/images/champions/JUG/RiotX_ChampionList_warwick.jpg",
    "assets/images/champions/JUG/RiotX_ChampionList_xinzhao.jpg",
    "assets/images/champions/JUG/RiotX_ChampionList_zac.jpg",
  ];

  static List<String> mid = [
    "assets/images/champions/MID/RiotX_ChampionList_ahri.jpg",
    "assets/images/champions/MID/RiotX_ChampionList_anivia.jpg",
    "assets/images/champions/MID/RiotX_ChampionList_annie.jpg",
    "assets/images/champions/MID/RiotX_ChampionList_aurelionsol.jpg",
    "assets/images/champions/MID/RiotX_ChampionList_azir.jpg",
    "assets/images/champions/MID/RiotX_ChampionList_cassiopeia.jpg",
    "assets/images/champions/MID/RiotX_ChampionList_corki.jpg",
    "assets/images/champions/MID/RiotX_ChampionList_ekko.jpg",
    "assets/images/champions/MID/RiotX_ChampionList_fizz.jpg",
    "assets/images/champions/MID/RiotX_ChampionList_galio.jpg",
    "assets/images/champions/MID/RiotX_ChampionList_ialiyah.jpg",
    "assets/images/champions/MID/RiotX_ChampionList_kassadin.jpg",
    "assets/images/champions/MID/RiotX_ChampionList_katarina.jpg",
    "assets/images/champions/MID/RiotX_ChampionList_leblanc.jpg",
    "assets/images/champions/MID/RiotX_ChampionList_lissandra.jpg",
    "assets/images/champions/MID/RiotX_ChampionList_malzahar.jpg",
    "assets/images/champions/MID/RiotX_ChampionList_neeko.jpg",
    "assets/images/champions/MID/RiotX_ChampionList_nocturne.jpg",
    "assets/images/champions/MID/RiotX_ChampionList_orianna.jpg",
    "assets/images/champions/MID/RiotX_ChampionList_pantheon.jpg",
    "assets/images/champions/MID/RiotX_ChampionList_qiyana.jpg",
    "assets/images/champions/MID/RiotX_ChampionList_ryze.jpg",
    "assets/images/champions/MID/RiotX_ChampionList_sylas.jpg",
    "assets/images/champions/MID/RiotX_ChampionList_talon.jpg",
    "assets/images/champions/MID/RiotX_ChampionList_twistedfate.jpg",
    "assets/images/champions/MID/RiotX_ChampionList_veigar.jpg",
    "assets/images/champions/MID/RiotX_ChampionList_viktor.jpg",
    "assets/images/champions/MID/RiotX_ChampionList_xeratth.jpg",
    "assets/images/champions/MID/RiotX_ChampionList_yasuo.jpg",
    "assets/images/champions/MID/RiotX_ChampionList_yone.jpg",
    "assets/images/champions/MID/RiotX_ChampionList_zed.jpg",
    "assets/images/champions/MID/RiotX_ChampionList_zoe.jpg",
  ];

  static List<String> bot = [
    "assets/images/champions/BOT/RiotX_ChampionList_aphelios.jpg",
    "assets/images/champions/BOT/RiotX_ChampionList_ashe.jpg",
    "assets/images/champions/BOT/RiotX_ChampionList_caitlyn.jpg",
    "assets/images/champions/BOT/RiotX_ChampionList_draven.jpg",
    "assets/images/champions/BOT/RiotX_ChampionList_ezreal.jpg",
    "assets/images/champions/BOT/RiotX_ChampionList_jhin.jpg",
    "assets/images/champions/BOT/RiotX_ChampionList_jinx.jpg",
    "assets/images/champions/BOT/RiotX_ChampionList_kaisa.jpg",
    "assets/images/champions/BOT/RiotX_ChampionList_kalista.jpg",
    "assets/images/champions/BOT/RiotX_ChampionList_kogmaw.jpg",
    "assets/images/champions/BOT/RiotX_ChampionList_lucian.jpg",
    "assets/images/champions/BOT/RiotX_ChampionList_missfortune.jpg",
    "assets/images/champions/BOT/RiotX_ChampionList_samira.jpg",
    "assets/images/champions/BOT/RiotX_ChampionList_sivir.jpg",
    "assets/images/champions/BOT/RiotX_ChampionList_tristana.jpg",
    "assets/images/champions/BOT/RiotX_ChampionList_twitch.jpg",
    "assets/images/champions/BOT/RiotX_ChampionList_varus.jpg",
    "assets/images/champions/BOT/RiotX_ChampionList_vayne.jpg",
    "assets/images/champions/BOT/RiotX_ChampionList_xayah.jpg",
    "assets/images/champions/BOT/RiotX_ChampionList_ziggs.jpg",
  ];

  static List<String> sup = [
    "assets/images/champions/SUP/RiotX_ChampionList_alistar.jpg",
    "assets/images/champions/SUP/RiotX_ChampionList_bard.jpg",
    "assets/images/champions/SUP/RiotX_ChampionList_blitzcrank.jpg",
    "assets/images/champions/SUP/RiotX_ChampionList_brand.jpg",
    "assets/images/champions/SUP/RiotX_ChampionList_braum.jpg",
    "assets/images/champions/SUP/RiotX_ChampionList_janna.jpg",
    "assets/images/champions/SUP/RiotX_ChampionList_karma.jpg",
    "assets/images/champions/SUP/RiotX_ChampionList_leona.jpg",
    "assets/images/champions/SUP/RiotX_ChampionList_lulu.jpg",
    "assets/images/champions/SUP/RiotX_ChampionList_lux.jpg",
    "assets/images/champions/SUP/RiotX_ChampionList_morgana.jpg",
    "assets/images/champions/SUP/RiotX_ChampionList_nami.jpg",
    "assets/images/champions/SUP/RiotX_ChampionList_nautilus.jpg",
    "assets/images/champions/SUP/RiotX_ChampionList_pyke.jpg",
    "assets/images/champions/SUP/RiotX_ChampionList_rakan.jpg",
    "assets/images/champions/SUP/RiotX_ChampionList_Rell_v2.jpg",
    "assets/images/champions/SUP/RiotX_ChampionList_senna.jpg",
    "assets/images/champions/SUP/RiotX_ChampionList_seraphine.jpg",
    "assets/images/champions/SUP/RiotX_ChampionList_sona.jpg",
    "assets/images/champions/SUP/RiotX_ChampionList_soraka.jpg",
    "assets/images/champions/SUP/RiotX_ChampionList_swain.jpg",
    "assets/images/champions/SUP/RiotX_ChampionList_tahmkench.jpg",
    "assets/images/champions/SUP/RiotX_ChampionList_taric.jpg",
    "assets/images/champions/SUP/RiotX_ChampionList_thresh.jpg",
    "assets/images/champions/SUP/RiotX_ChampionList_velkoz.jpg",
    "assets/images/champions/SUP/RiotX_ChampionList_yuumi.jpg",
    "assets/images/champions/SUP/RiotX_ChampionList_zilean.jpg",
    "assets/images/champions/SUP/RiotX_ChampionList_zyra.jpg",
  ];
}

List<String> lines = [
  'assets/images/lines/top.svg',
  'assets/images/lines/jug.svg',
  'assets/images/lines/mid.svg',
  'assets/images/lines/bot.svg',
  'assets/images/lines/sup.svg'
];
