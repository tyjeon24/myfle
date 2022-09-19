import 'package:calculator_frontend/widgets/LargeText.dart';
import 'package:calculator_frontend/widgets/NavigationBox.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DesktopHomepage extends StatefulWidget {
  const DesktopHomepage({Key? key}) : super(key: key);

  @override
  State<DesktopHomepage> createState() => _DesktopHomepageState();
}

class _DesktopHomepageState extends State<DesktopHomepage> {
  ScrollController _scrollController = ScrollController();
  double _scrollPosition = 0;

  _launchUrl() async {
    final Uri login_url = Uri.parse(
        'https://taxai.auth.ap-northeast-2.amazoncognito.com/login?client_id=165n75nfnnvlphe5vlom6lsu9q&response_type=token&scope=aws.cognito.signin.user.admin&redirect_uri=https://taxai.co.kr/callback');
    // 해당 url이 실행가능한지 확인
    if (!await canLaunchUrl(login_url)) {
      throw 'Could not launch $login_url';
    } else {
      launchUrl(login_url);
    }
  }

  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
  }

  @override
  void initState() {
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var widgetSize = MediaQuery.of(context).size;
    var titleColor = 0xff3d889b;

    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      extendBody: true,
      // PreferredSize를 사용하면 AppBar와 같이 user 지정 width나 length 지정 가능
      appBar: PreferredSize(
        preferredSize: Size(widgetSize.width, 200),
        child: Container(
            color: _scrollPosition == 0 ? Colors.white : Colors.transparent,
            padding: EdgeInsets.all(10),
            child: Padding(
              padding: EdgeInsets.only(
                left: (widgetSize.width > 1400)
                    ? widgetSize.width / 20
                    : widgetSize.width / 100,
                right: (widgetSize.width > 1400)
                    ? widgetSize.width / 20
                    : widgetSize.width / 100,
              ),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/images/logo_color_row.svg',
                    color: Color(0xFF80cfd5),
                    fit: BoxFit.contain,
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                              primary: Colors.grey,
                              padding: EdgeInsets.all(20)),
                          child: Text(
                            'TAXIAI 소개',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.w700),
                          )),
                      Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: TextButton(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                                primary: Colors.grey,
                                padding: EdgeInsets.all(20)),
                            child: Text('공지사항',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700))),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: TextButton(
                            onPressed: () {
                              sendInquiryEmail();
                            },
                            style: OutlinedButton.styleFrom(
                                primary: Colors.grey,
                                padding: EdgeInsets.all(20)),
                            child: Text('기술 문의',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700))),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 15, right: 20),
                        child: TextButton(
                            onPressed: () {
                              sendPartnerEmail();
                            },
                            style: OutlinedButton.styleFrom(
                                primary: Colors.grey,
                                padding: EdgeInsets.all(20)),
                            child: Text('제휴 문의',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700))),
                      ),
                      OutlinedButton(
                          onPressed: _launchUrl,
                          style: OutlinedButton.styleFrom(
                              primary: Colors.indigo,
                              backgroundColor: Colors.black54,
                              padding: EdgeInsets.all(20)),
                          child: Text('로그인',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700)))
                    ],
                  )
                ],
              ),
            )),
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [Color(0xffffffff), Color(0xFFe9f4f6)], // 배경
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )),
          child: SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: (widgetSize.width > 1400)
                          ? widgetSize.width / 20
                          : widgetSize.width / 100,
                      right: (widgetSize.width > 1400)
                          ? widgetSize.width / 20
                          : widgetSize.width / 100,
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 140,
                        ),
                        Text(
                          'T A X A I',
                          style: TextStyle(
                              fontSize: 135,
                              fontWeight: FontWeight.w900,
                              color: Color(titleColor),
                              shadows: [
                                Shadow(
                                    offset: Offset(3, 3),
                                    color: Color.fromARGB(60, 0, 0, 0),
                                    blurRadius: 5)
                              ]),
                        ),
                        SizedBox(
                          height: 52,
                          child: FittedBox(
                              fit: BoxFit.fitWidth,
                              child: Text('혁신적인 양도소득세 계산기',
                                  style: TextStyle(
                                      fontSize: 35,
                                      color: Colors.black,
                                      shadows: [
                                        Shadow(
                                            offset: Offset(3, 3),
                                            color: Color.fromARGB(100, 0, 0, 0),
                                            blurRadius: 3)
                                      ]))),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Row(
                          children: [
                            Spacer(),
                            RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                    text:
                                        ' TAXAI는 아파트, 주택, 조합원입주권, 분양권, 오피스텔의  \n 수백 가지의 비과세 유형과 증과 주택수, 감면주택 등의  \n',
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 22),
                                    children: [
                                      TextSpan(
                                          text:
                                              ' 세법 규정을 자동으로 판단해서 계산하는  \n 혁신적인 양도소득세 계산기',
                                          style: TextStyle(
                                            color: Color(titleColor),
                                          )),
                                      TextSpan(text: ' 입니다.  ')
                                    ])),
                            const Spacer(),
                            Image.asset(
                              'assets/images/homepage_image.png',
                              height: 400,
                              width: 600,
                              fit: BoxFit.contain,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        AnimatedOpacity(
                          duration: const Duration(microseconds: 20),
                          opacity: _scrollPosition < 480 ? 0.5 : 1,
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/images/homepage_image2.png',
                                height: 400,
                                width: 500,
                                fit: BoxFit.contain,
                              ),
                              Spacer(),
                              RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                      text:
                                          'TAXAI는 15년간 재산관련 세금컨설팅을 전문적으로 해온\n현직 세무사가 직접 설계한 프로그램으로서\n',
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 22),
                                      children: [
                                        TextSpan(
                                            text:
                                                '최신 법령과 예규, 판례 등을 주기적으로 업데이트하여\n케이스별로 적용 가능한 수많은 절세 규정을 미리 검토',
                                            style: TextStyle(
                                              color: Colors.blueAccent,
                                            )),
                                        TextSpan(text: '할 수 있으며,\n'),
                                        TextSpan(
                                            text:
                                                '조정대상지역 및 공동주택 가격 등을 자동 조회하는 기능을 갖추고 있어\n'),
                                        TextSpan(
                                            text:
                                                '세금신고 관련 오류를 획기적으로 줄여줄 수 있습니다.',
                                            style: TextStyle(
                                              color: Colors.blueAccent,
                                            ))
                                      ])),
                              Spacer()
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 100,
                        ),
                        Center(
                          child: Text(
                            'TAXAI는 추후 미래 세금을 컨설팅 하는 기능도 추가할 예정입니다.',
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.blueAccent),
                          ),
                        ),
                        const SizedBox(
                          height: 80,
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: widgetSize.width / 15,
                      right: widgetSize.width / 15,
                      bottom: 60),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LargeText(
                        text: 'AI 세금 계산',
                        size: 35,
                      ),
                      SizedBox(
                        height: widgetSize.height / 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          NavigationBox(
                              isCalculator: true,
                              imagepath: 'assets/images/calculator_line.png',
                              isMedium: false,
                              pushNamed: '/capgain',
                              title_1: '양도소득세',
                              title_2: 'AI 판단 계산기'),
                          Spacer(),
                          NavigationBox(
                              isCalculator: true,
                              imagepath: 'assets/images/calculator_line.png',
                              isMedium: false,
                              pushNamed: '/holding',
                              title_1: '보유세(종부세, 재산세)',
                              title_2: 'AI 판단 계산기'),
                          Spacer(),
                          Opacity(
                              opacity: 0,
                              child: NavigationBox(
                                  isCalculator: true,
                                  imagepath: '',
                                  isMedium: false,
                                  pushNamed: '',
                                  title_1: '',
                                  title_2: '')),
                          Spacer(),
                          Opacity(
                            opacity: 0,
                            child: NavigationBox(
                                isCalculator: true,
                                imagepath: '',
                                isMedium: false,
                                pushNamed: '',
                                title_1: '',
                                title_2: ''),
                          ),
                          Spacer()
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: widgetSize.width / 15,
                      right: widgetSize.width / 15,
                      bottom: 60),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LargeText(
                        text: 'TAXAI 컨설팅',
                        size: 35,
                      ),
                      SizedBox(
                        height: widgetSize.height / 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          NavigationBox(
                              isCalculator: false,
                              imagepath: 'assets/images/consultant_line.png',
                              isMedium: false,
                              pushNamed: '/',
                              title_1: '양도소득세 AI',
                              title_2: '컨설팅'),
                          Spacer(),
                          NavigationBox(
                              isCalculator: false,
                              imagepath: 'assets/images/consultant_line.png',
                              isMedium: false,
                              pushNamed: '/',
                              title_1: '매도 관련',
                              title_2: 'AI 컨설팅'),
                          Spacer(),
                          NavigationBox(
                              isCalculator: false,
                              imagepath: 'assets/images/consultant_line.png',
                              isMedium: false,
                              pushNamed: '/',
                              title_1: '양도소득세 AI',
                              title_2: '컨설팅'),
                          Spacer(),
                          NavigationBox(
                              isCalculator: false,
                              imagepath: 'assets/images/consultant_line.png',
                              isMedium: false,
                              pushNamed: '/',
                              title_1: '매도 관련',
                              title_2: 'AI 컨설팅'),
                          Spacer()
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(
                      top: 60,
                      left: (widgetSize.width > 1400)
                          ? widgetSize.width / 20
                          : widgetSize.width / 100,
                      right: (widgetSize.width > 1400)
                          ? widgetSize.width / 20
                          : widgetSize.width / 100,
                      bottom: 70),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        'assets/images/logo_color_col.svg',
                        width: 70,
                        height: 70,
                        color: Color(0xFF80cfd5),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                          '(주) NEW EYE CORPORATION | 주소 : 부산광역시 남구 수영로 295, 911호(대연동, 세웅빌딩)'),
                      Row(
                        children: [
                          Text('대표자 김난이 | 사업자 등록번회: 457-86-02417 | 이메일'),
                          TextButton(
                              onPressed: () {
                                sendTAXAIEmail();
                              },
                              child: Text(
                                'admin@taxai.co.kr',
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    decorationThickness: 2),
                              ))
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  sendInquiryEmail() async {
    final Uri inquiry_url = Uri(
      scheme: 'mailto',
      path: 'tech@taxai.co.kr',
      query: 'subject=[TAXAI 문의사항]', //add subject and body here
    );

    if (await canLaunchUrl(inquiry_url)) {
      await launchUrl(inquiry_url);
    } else {
      showAlert('TAXAI 문의사항', 'tech@taxai.co.kr');
      throw 'Could not launch $inquiry_url';
    }
  }

  sendPartnerEmail() async {
    final Uri partner_url = Uri(
      scheme: 'mailto',
      path: 'admin@taxai.co.kr',
      query: 'subject=[TAXAI 제휴문의]', //add subject and body here
    );

    if (await canLaunchUrl(partner_url)) {
      await launchUrl(partner_url);
    } else {
      showAlert('TAXAI 제휴문의', 'admin@taxai.co.kr');
      throw 'Could not launch $partner_url';
    }
  }

  sendTAXAIEmail() async {
    final Uri taxai_url = Uri(
      scheme: 'mailto',
      path: 'admin@taxai.co.kr',
      query: 'subject=[TAXAI]', //add subject and body here
    );

    if (await canLaunchUrl(taxai_url)) {
      await launchUrl(taxai_url);
    } else {
      showAlert('TAXAI', 'admin@taxai.co.kr');
      throw 'Could not launch $taxai_url';
    }
  }

  Future<void> showAlert(String title, String email) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            title: Text(title),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('현재 메일을 바로 보낼 수 없습니다.'),
                Text('아래 이메일로 문의주시면 감사하겠습니다.'),
                Text(
                  email,
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child:
                      Text('확인', style: TextStyle(fontWeight: FontWeight.bold)))
            ],
          );
        });
  }
}
