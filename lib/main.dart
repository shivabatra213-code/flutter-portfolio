import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const ShivaPortfolioApp());
}

class ShivaPortfolioApp extends StatelessWidget {
  const ShivaPortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shiva // Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFFBF7F0), // var(--bg)
        textTheme: GoogleFonts.interTextTheme(ThemeData.light().textTheme),
      ),
      home: const PortfolioHomePage(),
    );
  }
}

class PortfolioHomePage extends StatefulWidget {
  const PortfolioHomePage({super.key});

  @override
  State<PortfolioHomePage> createState() => _PortfolioHomePageState();
}

class _PortfolioHomePageState extends State<PortfolioHomePage> {
  // Navigation keys
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _journeyKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  void _scrollTo(GlobalKey key) {
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
    );
  }

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      debugPrint('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final bool isMobile = width < 768;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFFBF3).withOpacity(0.95),
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(color: const Color(0xFFEEE3D2), height: 1.0),
        ),
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: isMobile ? 8.0 : 40.0),
          child: RichText(
            text: TextSpan(
              text: 'Shiva',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w800,
                fontSize: 22,
                color: const Color(0xFF262445),
              ),
              children: const [
                TextSpan(
                  text: '.dev',
                  style: TextStyle(color: Color(0xFFEF6A52)),
                ),
              ],
            ),
          ),
        ),
        actions: isMobile
            ? null
            : [
                _navButton('About', () => _scrollTo(_aboutKey)),
                _navButton('Skills', () => _scrollTo(_skillsKey)),
                _navButton('Projects', () => _scrollTo(_projectsKey)),
                _navButton('Journey', () => _scrollTo(_journeyKey)),
                _navButton('Contact', () => _scrollTo(_contactKey)),
                const SizedBox(width: 40),
              ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1080),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 20.0 : 32.0,
                vertical: 20.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ================= HERO =================
                  _buildHero(isMobile),
                  const SizedBox(height: 70),

                  // ================= ABOUT =================
                  Container(key: _aboutKey, child: _buildAbout(isMobile)),
                  const SizedBox(height: 70),

                  // ================= SKILLS =================
                  Container(key: _skillsKey, child: _buildSkills()),
                  const SizedBox(height: 70),

                  // ================= PROJECTS =================
                  Container(key: _projectsKey, child: _buildProjects(isMobile)),
                  const SizedBox(height: 70),

                  // ================= JOURNEY =================
                  Container(key: _journeyKey, child: _buildJourney()),
                  const SizedBox(height: 70),

                  // ================= CONTACT =================
                  Container(key: _contactKey, child: _buildContact()),
                  const SizedBox(height: 50),

                  // ================= FOOTER =================
                  Center(
                    child: Text(
                      'Made with Flutter Web · © 2026 Shiva',
                      style: GoogleFonts.inter(
                        color: const Color(0xFF69648A),
                        fontSize: 13,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _navButton(String title, VoidCallback onTap) {
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
        foregroundColor: const Color(0xFF262445),
        textStyle: GoogleFonts.inter(fontWeight: FontWeight.w600, fontSize: 14),
      ),
      child: Text(title),
    );
  }

  Widget _sectionHeader(String label, String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label.toUpperCase(),
          style: GoogleFonts.poppins(
            color: const Color(0xFF1F9E93),
            fontWeight: FontWeight.w700,
            fontSize: 13,
            letterSpacing: 1.5,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 30,
            fontWeight: FontWeight.w800,
            color: const Color(0xFF262445),
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }

  // HERO SECTION
  Widget _buildHero(bool isMobile) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Flex(
        direction: isMobile ? Axis.vertical : Axis.horizontal,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: isMobile ? 0 : 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF4A93B).withOpacity(0.28),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    '👋 Welcome to my portfolio',
                    style: GoogleFonts.inter(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF8A5410),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                RichText(
                  text: TextSpan(
                    text: "Hi, I'm ",
                    style: GoogleFonts.poppins(
                      fontSize: isMobile ? 32 : 46,
                      fontWeight: FontWeight.w800,
                      color: const Color(0xFF262445),
                      height: 1.2,
                    ),
                    children: const [
                      TextSpan(
                        text: 'Shiva',
                        style: TextStyle(color: Color(0xFFEF6A52)),
                      ),
                      TextSpan(text: '\na '),
                    ],
                  ),
                ),
                SizedBox(
                  height: 48,
                  child: AnimatedTextKit(
                    repeatForever: true,
                    animatedTexts: [
                      TypewriterAnimatedText(
                        'Data Science Student',
                        textStyle: GoogleFonts.poppins(
                          fontSize: isMobile ? 26 : 38,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFF1F9E93),
                        ),
                        speed: const Duration(milliseconds: 70),
                      ),
                      TypewriterAnimatedText(
                        'Flutter & Web Developer',
                        textStyle: GoogleFonts.poppins(
                          fontSize: isMobile ? 26 : 38,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFF1F9E93),
                        ),
                        speed: const Duration(milliseconds: 70),
                      ),
                      TypewriterAnimatedText(
                        'Curious Learner',
                        textStyle: GoogleFonts.poppins(
                          fontSize: isMobile ? 26 : 38,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFF1F9E93),
                        ),
                        speed: const Duration(milliseconds: 70),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  "I've completed 2 semesters so far at DHA Suffa University, learning to build things with code — one small project at a time. This site is one of them!",
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    color: const Color(0xFF69648A),
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 24),
                Wrap(
                  spacing: 14,
                  runSpacing: 12,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFEF6A52),
                        foregroundColor: Colors.white,
                        elevation: 4,
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                      onPressed: () => _scrollTo(_projectsKey),
                      child: Text('See my projects', style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
                    ),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: const Color(0xFF262445),
                        side: const BorderSide(color: Color(0xFF262445), width: 1.5),
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                      onPressed: () => _scrollTo(_contactKey),
                      child: Text('Get in touch', style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
                    ),
                  ],
                ),
              ],
            ),
          ),
          if (isMobile) const SizedBox(height: 40),
          Expanded(
            flex: isMobile ? 0 : 4,
            child: Center(
              child: Container(
                width: 220,
                height: 220,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFFF4A93B), Color(0xFFEF6A52)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Text('🧑‍💻', style: TextStyle(fontSize: 90)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ABOUT SECTION
  Widget _buildAbout(bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionHeader('Get to know me', 'About Me'),
        Flex(
          direction: isMobile ? Axis.vertical : Axis.horizontal,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: isMobile ? 0 : 6,
              child: Text(
                "Hey! I'm Shiva, a BS Data Science student at DHA Suffa University passionate about building applications that live on the internet and mobile devices. I've completed 2 semesters so far, but I love learning by building — this portfolio itself is my playground for exploring modern web and Flutter technologies.\n\nWhen I'm not studying, I enjoy exploring new tools, sharpening my coding fundamentals, and building real-world projects.",
                style: GoogleFonts.inter(
                  fontSize: 15,
                  color: const Color(0xFF69648A),
                  height: 1.6,
                ),
              ),
            ),
            if (isMobile) const SizedBox(height: 24),
            Expanded(
              flex: isMobile ? 0 : 5,
              child: Padding(
                padding: EdgeInsets.only(left: isMobile ? 0 : 30),
                child: Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: [
                    _factCard('2', 'Semesters completed', isMobile),
                    _factCard('4+', 'Mini projects built', isMobile),
                    _factCard('6+', 'Languages/tools learning', isMobile),
                    _factCard('∞', 'Curiosity 🚀', isMobile),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _factCard(String num, String label, bool isMobile) {
    return Container(
      width: isMobile ? double.infinity : 150,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFEEE3D2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            num,
            style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.w800,
              color: const Color(0xFFEF6A52),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: GoogleFonts.inter(fontSize: 12, color: const Color(0xFF69648A)),
          ),
        ],
      ),
    );
  }

  // SKILLS SECTION
  Widget _buildSkills() {
    final List<String> skills = [
      'Dart',
      'Flutter',
      'HTML',
      'CSS',
      'JavaScript',
      'DOM',
      'BOM',
      'AJAX',
      'Java',
      'OOP Concepts',
      'C Language',
      'MS Excel',
      'MS Word',
      'Problem Solving',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionHeader('What I know so far', 'Skills'),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: skills.map((skill) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: const Color(0xFFEEE3D2)),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: Color(0xFF1F9E93),
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    skill,
                    style: GoogleFonts.inter(fontWeight: FontWeight.w600, fontSize: 14),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  // PROJECTS SECTION
  Widget _buildProjects(bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionHeader("Things I've built", 'Projects'),
        LayoutBuilder(builder: (context, constraints) {
          final double cardWidth = isMobile ? constraints.maxWidth : (constraints.maxWidth - 24) / 2;
          return Wrap(
            spacing: 24,
            runSpacing: 24,
            children: [
              _projectCard(
                cardWidth: cardWidth,
                emoji: '🤖',
                headerColor: const Color(0xFFE0F2FE),
                title: 'SupportPulse AI Desk',
                desc: 'An autonomous customer support agent featuring live intent classification, sentiment analysis, dynamic ticket queuing, and operational metrics.',
                tags: ['JavaScript', 'AJAX', 'DOM/BOM', 'n8n Pipeline'],
                liveUrl: 'https://shivabatra213-code.github.io/ai-customer-support-desk/',
                githubUrl: 'https://github.com/shivabatra213-code/ai-customer-support-desk',
              ),
              _projectCard(
                cardWidth: cardWidth,
                emoji: '🚗',
                headerColor: const Color(0xFFDEF4F0),
                title: 'Smart Ride Sharing System',
                desc: 'A ride-sharing system project built to practice Java and object-oriented programming concepts.',
                tags: ['Java', 'OOP'],
                githubUrl: 'https://github.com/shivabatra213-code/SmartRideSharingSystem',
              ),
              _projectCard(
                cardWidth: cardWidth,
                emoji: '📝',
                headerColor: const Color(0xFFFCECD6),
                title: 'To-Do List App',
                desc: 'A to-do list where you can add, complete, and delete daily tasks with clean DOM interactions.',
                tags: ['HTML', 'CSS', 'JS'],
              ),
              _projectCard(
                cardWidth: cardWidth,
                emoji: '🎨',
                headerColor: const Color(0xFFFBE3DA),
                title: 'This Portfolio',
                desc: 'A personal portfolio site rebuilt in Flutter Web with responsive design and interactive animations.',
                tags: ['Flutter', 'Dart', 'Web'],
              ),
            ],
          );
        }),
      ],
    );
  }

  Widget _projectCard({
    required double cardWidth,
    required String emoji,
    required Color headerColor,
    required String title,
    required String desc,
    required List<String> tags,
    String? liveUrl,
    String? githubUrl,
  }) {
    return Container(
      width: cardWidth,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFEEE3D2)),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 100,
            color: headerColor,
            alignment: Alignment.center,
            child: Text(emoji, style: const TextStyle(fontSize: 40)),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.poppins(fontWeight: FontWeight.w700, fontSize: 16),
                ),
                const SizedBox(height: 8),
                Text(
                  desc,
                  style: GoogleFonts.inter(color: const Color(0xFF69648A), fontSize: 13, height: 1.4),
                ),
                const SizedBox(height: 16),
                Wrap(
                  spacing: 6,
                  runSpacing: 6,
                  children: tags.map((t) {
                    return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFBF7F0),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: const Color(0xFFEEE3D2)),
                      ),
                      child: Text(
                        t,
                        style: GoogleFonts.inter(fontSize: 11, color: const Color(0xFF69648A)),
                      ),
                    );
                  }).toList(),
                ),
                if (liveUrl != null || githubUrl != null) ...[
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      if (liveUrl != null)
                        InkWell(
                          onTap: () => _launchUrl(liveUrl),
                          child: Text(
                            'Live Demo ↗',
                            style: GoogleFonts.inter(
                              color: const Color(0xFF1F9E93),
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      if (liveUrl != null && githubUrl != null) const SizedBox(width: 16),
                      if (githubUrl != null)
                        InkWell(
                          onTap: () => _launchUrl(githubUrl),
                          child: Text(
                            'GitHub →',
                            style: GoogleFonts.inter(
                              color: const Color(0xFFEF6A52),
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  // JOURNEY SECTION
  Widget _buildJourney() {
    final journeyList = [
      {
        'title': 'Govt Degree College Kandhkot',
        'badge': '2024',
        'desc': 'Completed intermediate education with a focus on science and analytics.'
      },
      {
        'title': 'Semester 1 - DHA Suffa University',
        'badge': '',
        'desc': 'Started BS Data Science and learned web fundamentals — HTML, CSS, JavaScript, DOM, BOM, and AJAX.'
      },
      {
        'title': 'Semester 2 - DHA Suffa University',
        'badge': '',
        'desc': 'Learned Java & OOP concepts, along with C programming language.'
      },
      {
        'title': "What's Next",
        'badge': '',
        'desc': 'Diving deeper into Flutter cross-platform development, Data Science concepts, and practical AI applications.'
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionHeader('How far I\'ve come', 'My Journey'),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Column(
            children: journeyList.map((item) {
              return IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Container(
                          width: 14,
                          height: 14,
                          decoration: BoxDecoration(
                            color: const Color(0xFF1F9E93),
                            shape: BoxShape.circle,
                            border: Border.all(color: const Color(0xFF1F9E93).withOpacity(0.25), width: 3),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            width: 2,
                            color: const Color(0xFFEEE3D2),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 28.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  item['title']!,
                                  style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w700),
                                ),
                                if (item['badge']!.isNotEmpty) ...[
                                  const SizedBox(width: 8),
                                  Text(
                                    item['badge']!,
                                    style: GoogleFonts.inter(
                                      color: const Color(0xFFEF6A52),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ],
                            ),
                            const SizedBox(height: 4),
                            Text(
                              item['desc']!,
                              style: GoogleFonts.inter(color: const Color(0xFF69648A), fontSize: 13),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  // CONTACT SECTION
  Widget _buildContact() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(36),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFFCEEE6), Color(0xFFE3F5F2)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFEEE3D2)),
      ),
      child: Column(
        children: [
          Text(
            "Let's connect 👋",
            style: GoogleFonts.poppins(
              fontSize: 26,
              fontWeight: FontWeight.w800,
              color: const Color(0xFF262445),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Open to internships, collabs, or just a chat about code.',
            style: GoogleFonts.inter(color: const Color(0xFF69648A), fontSize: 14),
          ),
          const SizedBox(height: 24),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            alignment: WrapAlignment.center,
            children: [
              _contactButton('✉️ Email', 'mailto:Shivabatra213@gmail.com'),
              _contactButton('💻 GitHub', 'https://github.com/shivabatra213-code'),
              _contactButton('🔗 LinkedIn', 'https://www.linkedin.com/in/shiva-batra-467a1a229'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _contactButton(String label, String url) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF262445),
        elevation: 0,
        side: const BorderSide(color: Color(0xFFEEE3D2)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
      ),
      onPressed: () => _launchUrl(url),
      child: Text(
        label,
        style: GoogleFonts.inter(fontWeight: FontWeight.w600, fontSize: 13),
      ),
    );
  }
}