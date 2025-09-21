import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ko.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ko'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'MBTI Go'**
  String get appTitle;

  /// No description provided for @mbtiQuickTest.
  ///
  /// In en, this message translates to:
  /// **'MBTI Quick Test'**
  String get mbtiQuickTest;

  /// No description provided for @mbtiFullTest.
  ///
  /// In en, this message translates to:
  /// **'MBTI Full Test'**
  String get mbtiFullTest;

  /// No description provided for @startTest.
  ///
  /// In en, this message translates to:
  /// **'Start Test'**
  String get startTest;

  /// No description provided for @homeTitle.
  ///
  /// In en, this message translates to:
  /// **'Personality Explorer'**
  String get homeTitle;

  /// No description provided for @homeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Explore the 16 MBTI personality types'**
  String get homeSubtitle;

  /// No description provided for @homeSubtitleOld.
  ///
  /// In en, this message translates to:
  /// **'Discover Your Personality Type'**
  String get homeSubtitleOld;

  /// No description provided for @startAssessment.
  ///
  /// In en, this message translates to:
  /// **'Start MBTI Assessment'**
  String get startAssessment;

  /// No description provided for @takeTest.
  ///
  /// In en, this message translates to:
  /// **'Take Test'**
  String get takeTest;

  /// No description provided for @exploreTypesDescription.
  ///
  /// In en, this message translates to:
  /// **'Explore the 16 personality types below or\\ntake the assessment to discover your type'**
  String get exploreTypesDescription;

  /// No description provided for @question.
  ///
  /// In en, this message translates to:
  /// **'Question'**
  String get question;

  /// No description provided for @ofSeparator.
  ///
  /// In en, this message translates to:
  /// **'of'**
  String get ofSeparator;

  /// No description provided for @progress.
  ///
  /// In en, this message translates to:
  /// **'Progress'**
  String get progress;

  /// No description provided for @completelyA.
  ///
  /// In en, this message translates to:
  /// **'Completely A'**
  String get completelyA;

  /// No description provided for @mostlyA.
  ///
  /// In en, this message translates to:
  /// **'Mostly A'**
  String get mostlyA;

  /// No description provided for @neutral.
  ///
  /// In en, this message translates to:
  /// **'Neutral'**
  String get neutral;

  /// No description provided for @mostlyB.
  ///
  /// In en, this message translates to:
  /// **'Mostly B'**
  String get mostlyB;

  /// No description provided for @completelyB.
  ///
  /// In en, this message translates to:
  /// **'Completely B'**
  String get completelyB;

  /// No description provided for @previous.
  ///
  /// In en, this message translates to:
  /// **'Previous'**
  String get previous;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @complete.
  ///
  /// In en, this message translates to:
  /// **'Complete'**
  String get complete;

  /// No description provided for @results.
  ///
  /// In en, this message translates to:
  /// **'Results'**
  String get results;

  /// No description provided for @yourType.
  ///
  /// In en, this message translates to:
  /// **'Your Type'**
  String get yourType;

  /// No description provided for @reliability.
  ///
  /// In en, this message translates to:
  /// **'Reliability'**
  String get reliability;

  /// No description provided for @shareResults.
  ///
  /// In en, this message translates to:
  /// **'Share Results'**
  String get shareResults;

  /// No description provided for @retakeTest.
  ///
  /// In en, this message translates to:
  /// **'Retake Test'**
  String get retakeTest;

  /// No description provided for @backToHome.
  ///
  /// In en, this message translates to:
  /// **'Back to Home'**
  String get backToHome;

  /// No description provided for @typeDetails.
  ///
  /// In en, this message translates to:
  /// **'Type Details'**
  String get typeDetails;

  /// No description provided for @strengths.
  ///
  /// In en, this message translates to:
  /// **'Strengths'**
  String get strengths;

  /// No description provided for @weaknesses.
  ///
  /// In en, this message translates to:
  /// **'Weaknesses'**
  String get weaknesses;

  /// No description provided for @careers.
  ///
  /// In en, this message translates to:
  /// **'Careers'**
  String get careers;

  /// No description provided for @compatibility.
  ///
  /// In en, this message translates to:
  /// **'Compatibility'**
  String get compatibility;

  /// No description provided for @description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get description;

  /// No description provided for @characteristics.
  ///
  /// In en, this message translates to:
  /// **'Characteristics'**
  String get characteristics;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @korean.
  ///
  /// In en, this message translates to:
  /// **'한국어'**
  String get korean;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @koreanShort.
  ///
  /// In en, this message translates to:
  /// **'KO'**
  String get koreanShort;

  /// No description provided for @englishShort.
  ///
  /// In en, this message translates to:
  /// **'EN'**
  String get englishShort;

  /// No description provided for @question1.
  ///
  /// In en, this message translates to:
  /// **'A. I gain energy from talking with many people at parties or large gatherings\nVS\nB. I gain energy from deep conversations with a few close friends'**
  String get question1;

  /// No description provided for @question2.
  ///
  /// In en, this message translates to:
  /// **'A. When problems arise, I immediately discuss with others to find solutions\nVS\nB. When problems arise, I think thoroughly alone before reaching conclusions'**
  String get question2;

  /// No description provided for @question3.
  ///
  /// In en, this message translates to:
  /// **'A. In new environments, I approach others first and start conversations\nVS\nB. In new environments, I observe the situation and wait for others to approach me'**
  String get question3;

  /// No description provided for @question4.
  ///
  /// In en, this message translates to:
  /// **'A. When something is urgent, I immediately call and talk directly\nVS\nB. Even when something is urgent, I prefer texting or emailing after thinking it through'**
  String get question4;

  /// No description provided for @question5.
  ///
  /// In en, this message translates to:
  /// **'A. When stressed, I meet friends and talk to relieve stress\nVS\nB. When stressed, I have alone time to recharge my energy'**
  String get question5;

  /// No description provided for @question6.
  ///
  /// In en, this message translates to:
  /// **'A. I value concrete, detailed facts and data\nVS\nB. I\'m more interested in the big picture, concepts, and possibilities'**
  String get question6;

  /// No description provided for @question7.
  ///
  /// In en, this message translates to:
  /// **'A. When planning work, I create detailed and specific step-by-step plans\nVS\nB. When planning work, I set a general direction and proceed flexibly'**
  String get question7;

  /// No description provided for @question8.
  ///
  /// In en, this message translates to:
  /// **'A. When hearing new ideas, I first think about practical applicability\nVS\nB. When hearing new ideas, I\'m more excited about future possibilities'**
  String get question8;

  /// No description provided for @question9.
  ///
  /// In en, this message translates to:
  /// **'A. I focus more on past experiences and present reality\nVS\nB. I\'m more interested in future possibilities and new changes'**
  String get question9;

  /// No description provided for @question10.
  ///
  /// In en, this message translates to:
  /// **'A. I prefer experiential learning through practice and experience\nVS\nB. I prefer abstract learning through theories and concepts'**
  String get question10;

  /// No description provided for @question11.
  ///
  /// In en, this message translates to:
  /// **'A. When making decisions, I prioritize logical analysis and objective facts\nVS\nB. When making decisions, I consider people\'s emotions, values, and relationships more'**
  String get question11;

  /// No description provided for @question12.
  ///
  /// In en, this message translates to:
  /// **'A. In conflict situations, I resolve fairly according to principles and rules\nVS\nB. In conflict situations, I resolve harmoniously considering emotions and relationships'**
  String get question12;

  /// No description provided for @question13.
  ///
  /// In en, this message translates to:
  /// **'A. When receiving criticism, I objectively analyze whether it\'s logically correct\nVS\nB. When receiving criticism, I consider the intent and impact on relationships'**
  String get question13;

  /// No description provided for @question14.
  ///
  /// In en, this message translates to:
  /// **'A. When evaluating others, I prioritize abilities, performance, and objective results\nVS\nB. When evaluating others, I consider character, effort, and personal circumstances more'**
  String get question14;

  /// No description provided for @question15.
  ///
  /// In en, this message translates to:
  /// **'A. In team projects, I focus on efficiency and goal achievement\nVS\nB. In team projects, I prioritize team atmosphere and member satisfaction more'**
  String get question15;

  /// No description provided for @question16.
  ///
  /// In en, this message translates to:
  /// **'A. When planning trips, I complete all detailed schedules and reservations in advance\nVS\nB. When planning trips, I make rough plans and decide spontaneously'**
  String get question16;

  /// No description provided for @question17.
  ///
  /// In en, this message translates to:
  /// **'A. For work with deadlines, I prepare in advance and complete with time to spare\nVS\nB. For work with deadlines, I concentrate and complete as the deadline approaches'**
  String get question17;

  /// No description provided for @question18.
  ///
  /// In en, this message translates to:
  /// **'A. I prefer predictable and stable environments\nVS\nB. I prefer environments with change and new stimuli'**
  String get question18;

  /// No description provided for @question19.
  ///
  /// In en, this message translates to:
  /// **'A. In daily life, I prefer regular and systematic routines\nVS\nB. In daily life, I prefer flexible and free routines'**
  String get question19;

  /// No description provided for @question20.
  ///
  /// In en, this message translates to:
  /// **'A. When new opportunities arise, I carefully review before deciding\nVS\nB. When new opportunities arise, I make quick intuitive decisions and execute'**
  String get question20;

  /// No description provided for @enfj_name.
  ///
  /// In en, this message translates to:
  /// **'Mentor'**
  String get enfj_name;

  /// No description provided for @enfj_description.
  ///
  /// In en, this message translates to:
  /// **'Charismatic Leader'**
  String get enfj_description;

  /// No description provided for @enfj_detailed.
  ///
  /// In en, this message translates to:
  /// **'You are a charismatic mentor who inspires others to reach their full potential. With exceptional empathy and natural leadership, you create meaningful connections and guide people toward positive transformation with genuine care and passion.'**
  String get enfj_detailed;

  /// No description provided for @enfp_name.
  ///
  /// In en, this message translates to:
  /// **'Campaigner'**
  String get enfp_name;

  /// No description provided for @enfp_description.
  ///
  /// In en, this message translates to:
  /// **'Passionate Free Spirit'**
  String get enfp_description;

  /// No description provided for @enfp_detailed.
  ///
  /// In en, this message translates to:
  /// **'You are an enthusiastic dreamer who sees endless possibilities in every situation. Your infectious optimism and creative spirit inspire others to embrace change and pursue their dreams with boundless energy and authentic passion.'**
  String get enfp_detailed;

  /// No description provided for @entj_name.
  ///
  /// In en, this message translates to:
  /// **'Commander'**
  String get entj_name;

  /// No description provided for @entj_description.
  ///
  /// In en, this message translates to:
  /// **'Strong-Willed Leader'**
  String get entj_description;

  /// No description provided for @entj_detailed.
  ///
  /// In en, this message translates to:
  /// **'You are a natural-born leader who turns ambitious visions into reality. With strategic thinking and unwavering determination, you efficiently organize resources and people to achieve remarkable goals through confident and decisive action.'**
  String get entj_detailed;

  /// No description provided for @entp_name.
  ///
  /// In en, this message translates to:
  /// **'Debater'**
  String get entp_name;

  /// No description provided for @entp_description.
  ///
  /// In en, this message translates to:
  /// **'Curious Thinker'**
  String get entp_description;

  /// No description provided for @entp_detailed.
  ///
  /// In en, this message translates to:
  /// **'You are an innovative thinker who thrives on intellectual challenges and creative problem-solving. Your quick wit and love for debate spark new ideas, pushing boundaries and inspiring others to think differently about the world.'**
  String get entp_detailed;

  /// No description provided for @esfj_name.
  ///
  /// In en, this message translates to:
  /// **'Consul'**
  String get esfj_name;

  /// No description provided for @esfj_description.
  ///
  /// In en, this message translates to:
  /// **'Social Popular Person'**
  String get esfj_description;

  /// No description provided for @esfj_detailed.
  ///
  /// In en, this message translates to:
  /// **'You are a warm-hearted caregiver who creates harmony wherever you go. Your natural ability to understand others\' needs and provide support makes you a beloved friend who brings people together through kindness and genuine concern.'**
  String get esfj_detailed;

  /// No description provided for @esfp_name.
  ///
  /// In en, this message translates to:
  /// **'Entertainer'**
  String get esfp_name;

  /// No description provided for @esfp_description.
  ///
  /// In en, this message translates to:
  /// **'Passionate Artist'**
  String get esfp_description;

  /// No description provided for @esfp_detailed.
  ///
  /// In en, this message translates to:
  /// **'You are a vibrant soul who brings joy and excitement to every moment. Your spontaneous nature and zest for life inspire others to embrace the present, creating memorable experiences filled with laughter and genuine human connection.'**
  String get esfp_detailed;

  /// No description provided for @estj_name.
  ///
  /// In en, this message translates to:
  /// **'Executive'**
  String get estj_name;

  /// No description provided for @estj_description.
  ///
  /// In en, this message translates to:
  /// **'Excellent Manager'**
  String get estj_description;

  /// No description provided for @estj_detailed.
  ///
  /// In en, this message translates to:
  /// **'You are a reliable leader who builds strong foundations for success. Your systematic approach and dedication to excellence create order from chaos, while your practical wisdom guides others toward achieving meaningful and lasting results.'**
  String get estj_detailed;

  /// No description provided for @estp_name.
  ///
  /// In en, this message translates to:
  /// **'Entrepreneur'**
  String get estp_name;

  /// No description provided for @estp_description.
  ///
  /// In en, this message translates to:
  /// **'Energetic Challenger'**
  String get estp_description;

  /// No description provided for @estp_detailed.
  ///
  /// In en, this message translates to:
  /// **'You are an adaptable problem-solver who thrives in dynamic environments. Your quick thinking and hands-on approach help you navigate challenges with confidence, while your energetic presence motivates others to take bold action.'**
  String get estp_detailed;

  /// No description provided for @infj_name.
  ///
  /// In en, this message translates to:
  /// **'Advocate'**
  String get infj_name;

  /// No description provided for @infj_description.
  ///
  /// In en, this message translates to:
  /// **'Mysterious Idealist'**
  String get infj_description;

  /// No description provided for @infj_detailed.
  ///
  /// In en, this message translates to:
  /// **'You are a visionary idealist with deep insight into human nature. Your quiet strength and unwavering compassion drive you to create meaningful change, turning profound understanding into actions that heal and inspire the world around you.'**
  String get infj_detailed;

  /// No description provided for @infp_name.
  ///
  /// In en, this message translates to:
  /// **'Mediator'**
  String get infp_name;

  /// No description provided for @infp_description.
  ///
  /// In en, this message translates to:
  /// **'Kind Idealist'**
  String get infp_description;

  /// No description provided for @infp_detailed.
  ///
  /// In en, this message translates to:
  /// **'You are an authentic soul who lives by deeply held values and beliefs. Your quiet passion and creative spirit inspire others to discover their true selves, creating ripples of positive change through genuine self-expression and empathy.'**
  String get infp_detailed;

  /// No description provided for @intj_name.
  ///
  /// In en, this message translates to:
  /// **'Architect'**
  String get intj_name;

  /// No description provided for @intj_description.
  ///
  /// In en, this message translates to:
  /// **'Strategic Thinking Architect'**
  String get intj_description;

  /// No description provided for @intj_detailed.
  ///
  /// In en, this message translates to:
  /// **'You are a strategic mastermind who transforms complex ideas into elegant solutions. Your independent thinking and long-term vision enable you to see patterns others miss, creating innovative pathways to achieve ambitious goals with precision and purpose.'**
  String get intj_detailed;

  /// No description provided for @intp_name.
  ///
  /// In en, this message translates to:
  /// **'Thinker'**
  String get intp_name;

  /// No description provided for @intp_description.
  ///
  /// In en, this message translates to:
  /// **'Innovative Inventor'**
  String get intp_description;

  /// No description provided for @intp_detailed.
  ///
  /// In en, this message translates to:
  /// **'You are a curious explorer of ideas who seeks to understand the fundamental principles of everything. Your innovative thinking and logical analysis uncover hidden connections, leading to breakthrough insights that advance human knowledge and understanding.'**
  String get intp_detailed;

  /// No description provided for @isfj_name.
  ///
  /// In en, this message translates to:
  /// **'Protector'**
  String get isfj_name;

  /// No description provided for @isfj_description.
  ///
  /// In en, this message translates to:
  /// **'Warm Protector'**
  String get isfj_description;

  /// No description provided for @isfj_detailed.
  ///
  /// In en, this message translates to:
  /// **'You are a devoted guardian who quietly nurtures and protects those you care about. Your selfless dedication and attention to detail create safe havens where others can flourish, embodying compassion through consistent and thoughtful actions.'**
  String get isfj_detailed;

  /// No description provided for @isfp_name.
  ///
  /// In en, this message translates to:
  /// **'Adventurer'**
  String get isfp_name;

  /// No description provided for @isfp_description.
  ///
  /// In en, this message translates to:
  /// **'Charming Artist'**
  String get isfp_description;

  /// No description provided for @isfp_detailed.
  ///
  /// In en, this message translates to:
  /// **'You are a gentle artist who expresses beauty and meaning through creative pursuits. Your sensitive nature and strong values guide you to live authentically, inspiring others through your unique perspective and quiet acts of kindness.'**
  String get isfp_detailed;

  /// No description provided for @istj_name.
  ///
  /// In en, this message translates to:
  /// **'Logistician'**
  String get istj_name;

  /// No description provided for @istj_description.
  ///
  /// In en, this message translates to:
  /// **'Reliable Realist'**
  String get istj_description;

  /// No description provided for @istj_detailed.
  ///
  /// In en, this message translates to:
  /// **'You are a dependable foundation upon which others can build their dreams. Your methodical approach and unwavering reliability create stability and trust, while your practical wisdom ensures that important tasks are completed with excellence and integrity.'**
  String get istj_detailed;

  /// No description provided for @istp_name.
  ///
  /// In en, this message translates to:
  /// **'Virtuoso'**
  String get istp_name;

  /// No description provided for @istp_description.
  ///
  /// In en, this message translates to:
  /// **'Practical Problem Solver'**
  String get istp_description;

  /// No description provided for @istp_detailed.
  ///
  /// In en, this message translates to:
  /// **'You are a skilled craftsperson who masters tools and techniques with natural ease. Your practical intelligence and calm problem-solving approach enable you to fix, build, and improve the world around you through hands-on expertise and innovation.'**
  String get istp_detailed;

  /// No description provided for @goBackHome.
  ///
  /// In en, this message translates to:
  /// **'Back to Home'**
  String get goBackHome;

  /// No description provided for @goBack.
  ///
  /// In en, this message translates to:
  /// **'Go Back'**
  String get goBack;

  /// No description provided for @categoryAnalysts.
  ///
  /// In en, this message translates to:
  /// **'Analysts'**
  String get categoryAnalysts;

  /// No description provided for @categoryDiplomats.
  ///
  /// In en, this message translates to:
  /// **'Diplomats'**
  String get categoryDiplomats;

  /// No description provided for @categorySentinels.
  ///
  /// In en, this message translates to:
  /// **'Sentinels'**
  String get categorySentinels;

  /// No description provided for @categoryExplorers.
  ///
  /// In en, this message translates to:
  /// **'Explorers'**
  String get categoryExplorers;

  /// No description provided for @compatibilityInfo.
  ///
  /// In en, this message translates to:
  /// **'Compatibility Information'**
  String get compatibilityInfo;

  /// No description provided for @compatibilityFeatureComingSoon.
  ///
  /// In en, this message translates to:
  /// **'If you want to learn about personality types that match well with {typeName} type, please look forward to the upcoming compatibility analysis feature!'**
  String compatibilityFeatureComingSoon(String typeName);

  /// No description provided for @compatibilityFeatureNote.
  ///
  /// In en, this message translates to:
  /// **'Detailed compatibility analysis feature will be added soon'**
  String get compatibilityFeatureNote;

  /// No description provided for @testResult.
  ///
  /// In en, this message translates to:
  /// **'Test Result'**
  String get testResult;

  /// No description provided for @checkYourPersonalityType.
  ///
  /// In en, this message translates to:
  /// **'Check your personality type'**
  String get checkYourPersonalityType;

  /// No description provided for @viewDetails.
  ///
  /// In en, this message translates to:
  /// **'View Details'**
  String get viewDetails;

  /// No description provided for @mbtiQuickAssessment.
  ///
  /// In en, this message translates to:
  /// **'MBTI Quick Assessment'**
  String get mbtiQuickAssessment;

  /// No description provided for @pleaseSelectAnswer.
  ///
  /// In en, this message translates to:
  /// **'Please select an answer'**
  String get pleaseSelectAnswer;

  /// No description provided for @progressLabel.
  ///
  /// In en, this message translates to:
  /// **'Progress'**
  String get progressLabel;

  /// No description provided for @completelyOptionA.
  ///
  /// In en, this message translates to:
  /// **'Completely\nA'**
  String get completelyOptionA;

  /// No description provided for @middle.
  ///
  /// In en, this message translates to:
  /// **'Middle'**
  String get middle;

  /// No description provided for @completelyOptionB.
  ///
  /// In en, this message translates to:
  /// **'Completely\nB'**
  String get completelyOptionB;

  /// No description provided for @reliabilityPercentage.
  ///
  /// In en, this message translates to:
  /// **'Reliability {percentage}%'**
  String reliabilityPercentage(int percentage);

  /// No description provided for @yourStory.
  ///
  /// In en, this message translates to:
  /// **'Your Story'**
  String get yourStory;

  /// No description provided for @recommendedCareers.
  ///
  /// In en, this message translates to:
  /// **'Recommended Careers'**
  String get recommendedCareers;

  /// No description provided for @personalityTraits.
  ///
  /// In en, this message translates to:
  /// **'Personality Traits'**
  String get personalityTraits;

  /// No description provided for @extroversionVsIntroversion.
  ///
  /// In en, this message translates to:
  /// **'Extroversion vs Introversion'**
  String get extroversionVsIntroversion;

  /// No description provided for @sensingVsIntuition.
  ///
  /// In en, this message translates to:
  /// **'Sensing vs Intuition'**
  String get sensingVsIntuition;

  /// No description provided for @thinkingVsFeeling.
  ///
  /// In en, this message translates to:
  /// **'Thinking vs Feeling'**
  String get thinkingVsFeeling;

  /// No description provided for @judgingVsPerceiving.
  ///
  /// In en, this message translates to:
  /// **'Judging vs Perceiving'**
  String get judgingVsPerceiving;

  /// No description provided for @extrovertedDescription.
  ///
  /// In en, this message translates to:
  /// **'Gains energy from social interaction'**
  String get extrovertedDescription;

  /// No description provided for @introvertedDescription.
  ///
  /// In en, this message translates to:
  /// **'Gains energy from quiet reflection'**
  String get introvertedDescription;

  /// No description provided for @sensingDescription.
  ///
  /// In en, this message translates to:
  /// **'Focuses on concrete facts and details'**
  String get sensingDescription;

  /// No description provided for @intuitiveDescription.
  ///
  /// In en, this message translates to:
  /// **'Focuses on patterns and possibilities'**
  String get intuitiveDescription;

  /// No description provided for @thinkingDescription.
  ///
  /// In en, this message translates to:
  /// **'Makes decisions based on logic'**
  String get thinkingDescription;

  /// No description provided for @feelingDescription.
  ///
  /// In en, this message translates to:
  /// **'Makes decisions based on values'**
  String get feelingDescription;

  /// No description provided for @judgingDescription.
  ///
  /// In en, this message translates to:
  /// **'Prefers structure and closure'**
  String get judgingDescription;

  /// No description provided for @perceivingDescription.
  ///
  /// In en, this message translates to:
  /// **'Prefers flexibility and openness'**
  String get perceivingDescription;

  /// No description provided for @improvementAreas.
  ///
  /// In en, this message translates to:
  /// **'Areas for\nGrowth'**
  String get improvementAreas;

  /// No description provided for @intj_strengths.
  ///
  /// In en, this message translates to:
  /// **'Strategic thinking|Independence|Determination|Focus|Creativity'**
  String get intj_strengths;

  /// No description provided for @intj_weaknesses.
  ///
  /// In en, this message translates to:
  /// **'Overly critical|Lack of social skills|Difficulty expressing emotions|Perfectionism'**
  String get intj_weaknesses;

  /// No description provided for @intj_careers.
  ///
  /// In en, this message translates to:
  /// **'Scientist|Engineer|Architect|Researcher|Strategic planner'**
  String get intj_careers;

  /// No description provided for @intp_strengths.
  ///
  /// In en, this message translates to:
  /// **'Logical thinking|Creativity|Objectivity|Adaptability|Analytical skills'**
  String get intp_strengths;

  /// No description provided for @intp_weaknesses.
  ///
  /// In en, this message translates to:
  /// **'Indecisiveness|Lack of focus|Ignoring emotions|Unrealistic'**
  String get intp_weaknesses;

  /// No description provided for @intp_careers.
  ///
  /// In en, this message translates to:
  /// **'Researcher|Software developer|Analyst|Professor|Inventor'**
  String get intp_careers;

  /// No description provided for @entj_strengths.
  ///
  /// In en, this message translates to:
  /// **'Natural leadership|Strategic vision|Efficiency|Confidence|Goal-oriented'**
  String get entj_strengths;

  /// No description provided for @entj_weaknesses.
  ///
  /// In en, this message translates to:
  /// **'Impatience|Stubbornness|Intolerance|Aggressive|Workaholic'**
  String get entj_weaknesses;

  /// No description provided for @entj_careers.
  ///
  /// In en, this message translates to:
  /// **'CEO|Manager|Consultant|Lawyer|Entrepreneur'**
  String get entj_careers;

  /// No description provided for @entp_strengths.
  ///
  /// In en, this message translates to:
  /// **'Innovation|Enthusiasm|Versatility|Quick thinking|Charisma'**
  String get entp_strengths;

  /// No description provided for @entp_weaknesses.
  ///
  /// In en, this message translates to:
  /// **'Procrastination|Inconsistency|Argumentative|Scattered focus'**
  String get entp_weaknesses;

  /// No description provided for @entp_careers.
  ///
  /// In en, this message translates to:
  /// **'Entrepreneur|Consultant|Journalist|Inventor|Marketing specialist'**
  String get entp_careers;

  /// No description provided for @infj_strengths.
  ///
  /// In en, this message translates to:
  /// **'Insight|Empathy|Dedication|Creativity|Integrity'**
  String get infj_strengths;

  /// No description provided for @infj_weaknesses.
  ///
  /// In en, this message translates to:
  /// **'Perfectionism|Sensitivity|Burnout|Stubbornness'**
  String get infj_weaknesses;

  /// No description provided for @infj_careers.
  ///
  /// In en, this message translates to:
  /// **'Counselor|Writer|Teacher|Psychologist|Social worker'**
  String get infj_careers;

  /// No description provided for @infp_strengths.
  ///
  /// In en, this message translates to:
  /// **'Authenticity|Empathy|Creativity|Flexibility|Idealism'**
  String get infp_strengths;

  /// No description provided for @infp_weaknesses.
  ///
  /// In en, this message translates to:
  /// **'Oversensitivity|Procrastination|Self-criticism|Conflict avoidance'**
  String get infp_weaknesses;

  /// No description provided for @infp_careers.
  ///
  /// In en, this message translates to:
  /// **'Writer|Artist|Counselor|Social worker|Designer'**
  String get infp_careers;

  /// No description provided for @enfj_strengths.
  ///
  /// In en, this message translates to:
  /// **'Charisma|Empathy|Leadership|Communication|Motivation'**
  String get enfj_strengths;

  /// No description provided for @enfj_weaknesses.
  ///
  /// In en, this message translates to:
  /// **'Overprotective|Self-sacrifice|Sensitivity|Idealistic'**
  String get enfj_weaknesses;

  /// No description provided for @enfj_careers.
  ///
  /// In en, this message translates to:
  /// **'Teacher|Counselor|Manager|Coach|Social worker'**
  String get enfj_careers;

  /// No description provided for @enfp_strengths.
  ///
  /// In en, this message translates to:
  /// **'Enthusiasm|Creativity|Social skills|Adaptability|Optimism'**
  String get enfp_strengths;

  /// No description provided for @enfp_weaknesses.
  ///
  /// In en, this message translates to:
  /// **'Procrastination|Overthinking|Difficulty with details|Emotional volatility'**
  String get enfp_weaknesses;

  /// No description provided for @enfp_careers.
  ///
  /// In en, this message translates to:
  /// **'Marketing specialist|Journalist|Teacher|Consultant|Artist'**
  String get enfp_careers;

  /// No description provided for @istj_strengths.
  ///
  /// In en, this message translates to:
  /// **'Reliability|Practicality|Organization|Responsibility|Dedication'**
  String get istj_strengths;

  /// No description provided for @istj_weaknesses.
  ///
  /// In en, this message translates to:
  /// **'Stubbornness|Resistance to change|Judgmental|Workaholic'**
  String get istj_weaknesses;

  /// No description provided for @istj_careers.
  ///
  /// In en, this message translates to:
  /// **'Accountant|Manager|Administrator|Engineer|Auditor'**
  String get istj_careers;

  /// No description provided for @isfj_strengths.
  ///
  /// In en, this message translates to:
  /// **'Compassion|Reliability|Attention to detail|Loyalty|Supportiveness'**
  String get isfj_strengths;

  /// No description provided for @isfj_weaknesses.
  ///
  /// In en, this message translates to:
  /// **'Self-neglect|Oversensitivity|Resistance to change|Reluctance to ask for help'**
  String get isfj_weaknesses;

  /// No description provided for @isfj_careers.
  ///
  /// In en, this message translates to:
  /// **'Nurse|Teacher|Social worker|Administrator|Counselor'**
  String get isfj_careers;

  /// No description provided for @estj_strengths.
  ///
  /// In en, this message translates to:
  /// **'Leadership|Organization|Efficiency|Reliability|Dedication'**
  String get estj_strengths;

  /// No description provided for @estj_weaknesses.
  ///
  /// In en, this message translates to:
  /// **'Stubbornness|Impatience|Difficulty with emotions|Judgmental'**
  String get estj_weaknesses;

  /// No description provided for @estj_careers.
  ///
  /// In en, this message translates to:
  /// **'Manager|Administrator|Military officer|Judge|Business executive'**
  String get estj_careers;

  /// No description provided for @esfj_strengths.
  ///
  /// In en, this message translates to:
  /// **'Social skills|Empathy|Organization|Loyalty|Helpfulness'**
  String get esfj_strengths;

  /// No description provided for @esfj_weaknesses.
  ///
  /// In en, this message translates to:
  /// **'Need for approval|Sensitivity to criticism|Difficulty saying no|Stress under conflict'**
  String get esfj_weaknesses;

  /// No description provided for @esfj_careers.
  ///
  /// In en, this message translates to:
  /// **'Teacher|Nurse|Administrator|Social worker|Event planner'**
  String get esfj_careers;

  /// No description provided for @istp_strengths.
  ///
  /// In en, this message translates to:
  /// **'Practicality|Adaptability|Problem-solving|Independence|Efficiency'**
  String get istp_strengths;

  /// No description provided for @istp_weaknesses.
  ///
  /// In en, this message translates to:
  /// **'Reserved|Insensitive|Risk-taking|Difficulty with emotions'**
  String get istp_weaknesses;

  /// No description provided for @istp_careers.
  ///
  /// In en, this message translates to:
  /// **'Engineer|Mechanic|Pilot|Detective|Computer programmer'**
  String get istp_careers;

  /// No description provided for @isfp_strengths.
  ///
  /// In en, this message translates to:
  /// **'Creativity|Empathy|Flexibility|Loyalty|Authenticity'**
  String get isfp_strengths;

  /// No description provided for @isfp_weaknesses.
  ///
  /// In en, this message translates to:
  /// **'Sensitivity|Procrastination|Difficulty with criticism|Conflict avoidance'**
  String get isfp_weaknesses;

  /// No description provided for @isfp_careers.
  ///
  /// In en, this message translates to:
  /// **'Artist|Designer|Counselor|Teacher|Photographer'**
  String get isfp_careers;

  /// No description provided for @estp_strengths.
  ///
  /// In en, this message translates to:
  /// **'Adaptability|Practical skills|Energy|Social skills|Problem-solving'**
  String get estp_strengths;

  /// No description provided for @estp_weaknesses.
  ///
  /// In en, this message translates to:
  /// **'Impatience|Risk-taking|Difficulty with long-term planning|Insensitive'**
  String get estp_weaknesses;

  /// No description provided for @estp_careers.
  ///
  /// In en, this message translates to:
  /// **'Sales representative|Entrepreneur|Police officer|Paramedic|Sports coach'**
  String get estp_careers;

  /// No description provided for @esfp_strengths.
  ///
  /// In en, this message translates to:
  /// **'Enthusiasm|People skills|Creativity|Adaptability|Optimism'**
  String get esfp_strengths;

  /// No description provided for @esfp_weaknesses.
  ///
  /// In en, this message translates to:
  /// **'Easily bored|Procrastination|Difficulty with criticism|Conflict avoidance'**
  String get esfp_weaknesses;

  /// No description provided for @esfp_careers.
  ///
  /// In en, this message translates to:
  /// **'Teacher|Entertainer|Sales representative|Social worker|Event planner'**
  String get esfp_careers;

  /// No description provided for @intj_brief.
  ///
  /// In en, this message translates to:
  /// **'Strategic visionary who creates innovative solutions through independent thinking.'**
  String get intj_brief;

  /// No description provided for @intp_brief.
  ///
  /// In en, this message translates to:
  /// **'Curious intellectual who explores ideas and seeks deep understanding.'**
  String get intp_brief;

  /// No description provided for @entj_brief.
  ///
  /// In en, this message translates to:
  /// **'Natural leader who turns ambitious visions into remarkable achievements.'**
  String get entj_brief;

  /// No description provided for @entp_brief.
  ///
  /// In en, this message translates to:
  /// **'Creative innovator who thrives on intellectual challenges and debate.'**
  String get entp_brief;

  /// No description provided for @infj_brief.
  ///
  /// In en, this message translates to:
  /// **'Insightful idealist who creates meaningful change through compassion.'**
  String get infj_brief;

  /// No description provided for @infp_brief.
  ///
  /// In en, this message translates to:
  /// **'Authentic soul who inspires others through genuine self-expression.'**
  String get infp_brief;

  /// No description provided for @enfj_brief.
  ///
  /// In en, this message translates to:
  /// **'Charismatic mentor who guides others toward their full potential.'**
  String get enfj_brief;

  /// No description provided for @enfp_brief.
  ///
  /// In en, this message translates to:
  /// **'Enthusiastic dreamer who sees endless possibilities everywhere.'**
  String get enfp_brief;

  /// No description provided for @istj_brief.
  ///
  /// In en, this message translates to:
  /// **'Dependable foundation who ensures excellence through reliability.'**
  String get istj_brief;

  /// No description provided for @isfj_brief.
  ///
  /// In en, this message translates to:
  /// **'Devoted guardian who nurtures and protects those they cherish.'**
  String get isfj_brief;

  /// No description provided for @estj_brief.
  ///
  /// In en, this message translates to:
  /// **'Reliable leader who builds strong foundations for lasting success.'**
  String get estj_brief;

  /// No description provided for @esfj_brief.
  ///
  /// In en, this message translates to:
  /// **'Warm caregiver who creates harmony through kindness and support.'**
  String get esfj_brief;

  /// No description provided for @istp_brief.
  ///
  /// In en, this message translates to:
  /// **'Skilled craftsperson who masters tools with practical intelligence.'**
  String get istp_brief;

  /// No description provided for @isfp_brief.
  ///
  /// In en, this message translates to:
  /// **'Gentle artist who expresses beauty through creative authenticity.'**
  String get isfp_brief;

  /// No description provided for @estp_brief.
  ///
  /// In en, this message translates to:
  /// **'Adaptable problem-solver who thrives in dynamic environments.'**
  String get estp_brief;

  /// No description provided for @esfp_brief.
  ///
  /// In en, this message translates to:
  /// **'Vibrant soul who brings joy and excitement to every moment.'**
  String get esfp_brief;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'ko'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'ko':
      return AppLocalizationsKo();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
