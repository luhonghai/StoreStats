-- phpMyAdmin SQL Dump
-- version 4.1.6
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 18, 2015 at 01:28 PM
-- Server version: 5.6.16
-- PHP Version: 5.6.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `store_stats`
--

-- --------------------------------------------------------

--
-- Table structure for table `App_Android`
--

CREATE TABLE IF NOT EXISTS `App_Android` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `User_Id` int(11) NOT NULL,
  `ArtworkUrl` text,
  `Title` text,
  `Creator` text,
  `CreatorId` text,
  `AppId` text,
  `PackageName` text,
  `Price` text,
  `Rating` text,
  `RatingCount` text,
  `Version` text,
  `Description` text,
  `DownloadCount` text,
  `PromotionText` text,
  `Category` text,
  `AppType` text,
  `ScreenShot1` text,
  `ScreenShot2` text,
  `ScreenShot3` text,
  `ScreenShot4` text,
  `ScreenShot5` text,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `App_Android`
--

INSERT INTO `App_Android` (`Id`, `User_Id`, `ArtworkUrl`, `Title`, `Creator`, `CreatorId`, `AppId`, `PackageName`, `Price`, `Rating`, `RatingCount`, `Version`, `Description`, `DownloadCount`, `PromotionText`, `Category`, `AppType`, `ScreenShot1`, `ScreenShot2`, `ScreenShot3`, `ScreenShot4`, `ScreenShot5`) VALUES
(1, 1, 'https://lh4.ggpht.com/UesIRnI54BMQYiNBzoQeHs6irqkj1NwJL-H6ztAAW0Atr5oM2Epe15xndIgYqQtq6Ns=w300', 'Avea Online ??lemler', 'Avea Iletisim Hizmetleri A.S.', '"Avea Iletisim Hizmetleri A.S."', 'v2:com.tmob.AveaOIM:1:13', 'com.tmob.AveaOIM', '', '3.7', '27426', '2.3.3', 'Avea Online ??lemler Art?k Her Yerde Yan?n?zda! \n\nÜstelik Avea hatt?n?z ile, uygulamay? ba?lant? ücreti ödemeden kullanabilirsiniz.\n\nUygulamay? indirerek: \n•	Fatura detaylar?  ve güncel kullan?m bilgileri görüntüleme\n•	Kredi kart? ile fatura ödeme ve Lira yükleme\n•	Konu?ma, Mesajla?ma ve Internet Paketi sat?n alma\n•	Tarife de?i?tirme\n•	Uluslararas? kullan?ma açma – kapama\n•	Öneri ve taleplerinizi iletme\ngibi hatt?n?zla ilgili bir çok ürün ve hizmetimizden; her an, her yerde kolayl?kla yararlanabilirsiniz.\n\n“Avea Online ??lemler” uygulamas?n? indirdikten sonra i?lem yapmak istedi?iniz telefon numaras? ve Jet?ifre’nizi girerek i?lem yapabilirsiniz. Jet?ifre’nizi telefonunuzdan *952#’yi tu?lad?ktan sonra aramaya basarak alabilirsiniz.\n\nRecent changes:\n- Güvenli ?nternet Hizmeti Seçenekleri menüsü eklendi.\n - Gizli Numara engelleme servisi eklendi.\n - Arayan? Bil Servisi yenilendi.\n\nContent rating: Low Maturity', '>250,000', 'Avea Online ??lemler Parma??n?z?n Ucunda!', 'Productivity', 'APPLICATION', 'https://lh5.ggpht.com/jzluX1FpsDOXfpKN3eZOTXGO9jzniy1qOJmijA9HaJR5ZqtsvX3O0o08Ks_DhJW_FxE=h310', 'https://lh6.ggpht.com/m32tsYKZM1URI8aBn8ZBz6qx_OJkaU-pfWNwFJSDsWrRiUAaQYmRoCWOcsaK5ALtLg=h310', 'https://lh4.ggpht.com/oAJmBDvgYJDGrTwMG4yJNNezQt0XKmtaDjlUNBj6NoeQqrWFtEEdWZTrjnNNLISyuQ=h310', 'https://lh5.ggpht.com/ZUbftt66FrYCBQOq7izZtn2sxWNiV15Eg04EshV3Q_14W8u7TajzCydACYKpW3fphcU=h310', NULL),
(2, 1, 'https://lh5.ggpht.com/P7dN99jPTFC2o4jJZ_zMd-zsk1qLqw4WO_ZJk5TJZ576B0Uqy0KpM4ftkVBmoilZtIc=w300', 'Boom Beach', 'Supercell', 'Supercell', 'v2:com.supercell.boombeach:1:20046', 'com.supercell.boombeach', '', '4.3', '2341420', '20.46', 'Welcome to Boom Beach: come with a plan or leave in defeat!\n\nFight the evil Blackguard with brains and brawn in this epic combat strategy game. Attack enemy bases to free enslaved islanders and unlock the secrets of this tropical paradise. Create a Task Force with players around the world to take on the enemy together. Scout, plan, then BOOM THE BEACH!\n\nPLEASE NOTE! Boom Beach is free to download and play. However, some game items can also be purchased for real money. If you do not want to use this feature, please set up password protection for purchases in the settings of your Google Play Store app.\n\nFEATURES\n- Play with millions of other players, raid hundreds of enemy bases for loot\n- Battle for control of precious resources to upgrade your base against enemy attacks\n- Explore a huge tropical archipelago and discover the mysterious power of the Life Crystals\n- Face fearsome Blackguard Bosses and uncover their evil plans\n- Join other players to form an unstoppable Task Force to take on co-op missions\n\nUnder our Terms of Services and Privacy Policy, Boom Beach is allowed for download and play only for persons 13 years or over of age without parental consent.\n\nNote: A network connection is required to play\n\nParent''s guide:\nhttp://www.supercell.net/parents\n\nPrivacy Policy:\nhttp://www.supercell.net/privacy-policy/\n\nTerms of Service:\nhttp://www.supercell.net/terms-of-service/\n\nRecent changes:\nNEW TROOP\n- The Torcher is a massive armored unit that burns everything in sight!\n\nNEW STUFF\n- Find new wildlife on your island, and female villagers!\n- New Power Base tactical note system for Task Forces\n- See information about your attacker’s statues\n- Several new Power Base layouts\n\nIMPROVEMENTS\n- The Grenadier now throws faster and further\n- Cannons, Boom Cannons and Boom Mines no longer deal double damage to Tanks\n- Tanks do more damage and train faster, but have less health\n\nContent rating: Low Maturity', '>250,000', 'Storm the beach and win the day!', 'Strategy', 'GAME', 'https://lh5.ggpht.com/xNeafAgxoO4n6X2KAmTGHge1ThZZrVx_A7_SdvvoJjI3xKOAu5aivL_jmSpQuK8ejmU=h310', 'https://lh6.ggpht.com/dN1mowxwRqENqaVGM9XHGSoIj3evrPx7eGAfGV4CLu1qpnQ_ecAE6mo403T_0rj-g_E=h310', 'https://lh4.ggpht.com/iBGItliUSmJZ9yNS4p9Mnae_7MTbrrBOy2ymm_vm_ykRzEizkHkPf0KWLfmiPrAeCH8=h310', 'https://lh3.ggpht.com/5HQrNgGSyXrV5LNJv4irGSyUheU0PNQHkAzSiQUpxuY4MuAXHaurmlB_OiF7OWn0n7k=h310', 'https://lh5.ggpht.com/zaRa7DoJU2wikx0fEvOkXCp5Nc8_1fZbZECayH89WrPQAH8i1Bb6m9vbrZybUzPc8y0=h310'),
(3, 1, 'https://lh4.ggpht.com/qn2hFM_K22JNOPZMt525VI97YXbyuNUpFNAhwnD1dtVam5fY4dPp6o2ULfws0tNT1EMQ=w300', 'Boom Man Classic | Boom Free', 'ET - AppsGames Hot', '"ET - AppsGames Hot"', 'v2:com.boomman.bomber.classic:1:2', 'com.boomman.bomber.classic', '', '3.9', '1093', '1.1', 'The game Boom Man Classic | Boom Free has simple gameplay, addictive. Boom match award playing time\nlabor and time free time, game designers should play according to the game screen will more attractive. Each game level is a challenge, to pass the screen, you are provided support the extremely useful items, each item has its own function, so when you play so depending improvise to destroy the monster.\n\nMain features of game Boom Man Classic | Boom Free:\n+ Full HD interface\n+ Sounds fun\n+ Supports multiple screen size and low profile phone\n+ There are more screens\n+ There are many types of monsters with very smart AI\n+ You can switch the type of control (control Support 2 style)\n+ There are 2 characters: You can change to suit personal preferences\n+ Shop System has many items\n+ Good little RAM\n+ Good performance\n+ Multiplay: Support for 2 people to play through Bluetooth or Wi-Fi connection (this feature\nwill update in next version)\n\nHow to play of game Boom Man Classic | Boom Free: Move the character to follow the path is not blocked, if it meets the block box\nboom set to blow up the box, kill monsters and find the key. Each screen you need\nto destroy all monsters and collect all the coins required, you will be rewarded.\nThe coin in the game will support you purchase the items, please use your coins properly\nconsolidation. Let''s go find a clever way, placing bombs correctly.\n\nGood people will have leisure time fun with Boom Man Classic | Boom HD.\n\nRecent changes:\n- Boom Man Classic | Boom Free a famous PC game now available on android market, with beautiful graphics, FULL HD interface, vivid sound.\n - With 24 challenges from easy to difficult, not easy to win\n - With two categories characters: male and female, suitable for all genders, all ages\n\nContent rating: Everyone', '50,000-250,000', 'Boom Man Classic | Boom Free with HD graphics, vivid sound and new gameplay', 'Action', 'GAME', 'https://lh5.ggpht.com/qZnuvFvUzxeHTmX3wLZuC9khc3e5JBTVpqcBbhT3fVUhrxqsu3TBdlWfcM_7JQl0sX7j=h310', 'https://lh3.ggpht.com/FnkWbRatbyaENICa_FtR87rqXgr7wQDAOUbYE_arDuezUaifUuiu_d6NacgmLYEf2Yra=h310', 'https://lh4.ggpht.com/I8xUhGg418x0-0WSZdsZoSWQPmpQGqOuw6DblRdE4PNy6-7jvdXVGnHszLnjhT1FHag=h310', 'https://lh4.ggpht.com/DKtZemmOWCuM7CR0-hlQf5qxUtbxWm-Y5Zqs-6CebrULZ3sejTqhIIVVi0sl6RRQ0w=h310', 'https://lh5.ggpht.com/Z6XvQVp7XMtvc5f-fP-l9NqLNuJk7OdRZ-oDKS3OSQED2cjz9jAzylgDMCZ23lmhculJ=h310');

-- --------------------------------------------------------

--
-- Table structure for table `App_iOS`
--

CREATE TABLE IF NOT EXISTS `App_iOS` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `User_id` int(11) NOT NULL,
  `ArtworkUrl` text,
  `SellerName` text,
  `Price` double DEFAULT NULL,
  `Version` text,
  `Description` text,
  `ReleaseDate` text,
  `BundleId` text,
  `TrackId` text,
  `ReleaseNotes` text,
  `TrackContentRating` text,
  `AverageUserRating` text,
  `UserRatingCount` text,
  `TrackName` text,
  `ArtistId` text,
  `ScreenShot1` text,
  `ScreenShot2` text,
  `ScreenShot3` text,
  `ScreenShot4` text,
  `ScreenShot5` text,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `App_iOS`
--

INSERT INTO `App_iOS` (`Id`, `User_id`, `ArtworkUrl`, `SellerName`, `Price`, `Version`, `Description`, `ReleaseDate`, `BundleId`, `TrackId`, `ReleaseNotes`, `TrackContentRating`, `AverageUserRating`, `UserRatingCount`, `TrackName`, `ArtistId`, `ScreenShot1`, `ScreenShot2`, `ScreenShot3`, `ScreenShot4`, `ScreenShot5`) VALUES
(1, 1, 'http://a486.phobos.apple.com/us/r30/Purple1/v4/2d/99/f1/2d99f1a7-d0bd-c997-9782-36bceea22111/mzl.gpeinjwk.png', 'Sonico GmbH', 0, '8.1.2', 'Featured in Apple''s latest TV ad "Chérie''s verse"!\n\niTranslate is an award winning translation tool that helps you break down language barriers. With its state of the art technology you can speak any language in a second.\n\n« ...my favorite by far » - Alex Heath (Cult of Mac)\n« Easier than learning Japanese » - Sonia Gil (NBC Today)\n« ...one of the apps I always keep on my Home screen » - Christian Zibreg (iDownloadBlog)\n« Simpler, cleaner, flatter » - Aldrin Calimlim (App Advice)\n\n90+ LANGUAGES \nWith iTranslate you can translate words, phrases, and text in over 90 languages. \n\nVOICE OUTPUT \nEver wanted to know what an Australian English female sounds like? With iTranslate you can select between lots of different dialects, choose a male or female voice, and even control the speech rate. \n\nVOICE INPUT (Premium) \nSpeak instead of type. No training needed. Just start speaking and we recognize your voice, transform it into text and translate it into another language.\n\nDICTIONARIES \nMost translator apps give you only 1 result per translation. However, if you are translating words and phrases there are often different meanings, depending on the context. iTranslate gives you dictionaries for many languages so you can find the exact solution to your problem. \n\nTODAY WIDGET\nAdd iTranslate as a Today widget to the new iOS 8 Notification Center and easily translate copied text from any app without even opening iTranslate!\n\nROMANIZATION \nRomanization lets you turn "??" into "N? h?o", transforming non-Latin languages into Latin characters. Available for many languages including Chinese, Japanese, Korean, Greek, Hindi, Russian, and Thai. \n\nTYPE FASTER \niTranslate is optimized for fast text input. Get suggestions while you’re typing, turn your phone to the side and use both hands for typing with the bigger landscape keyboard or use our popular swipe gestures for quick copying & pasting.  \n\nSHARE\nSend translations to your friends via Email, SMS, Facebook or Twitter or simply copy a translation and use it in any App you like. \n\nFAVORITES & HISTORY\nBrowse through recent translations or save a translation for later offline access. \n\nUNIVERSAL APP\nThis app is designed for both iPhone and iPad.\n\n\n* iTranslate Premium \niTranslate is free to download and use. iTranslate Premium removes ads and unlocks voice recognition. It is available as one time In App Purchase.\n\niTranslate is available for a wide range of platforms and devices. Visit our website to learn more about iTranslate: http://itranslateapp.com/\n\nPlease note: iTranslate requires an Internet connection.', '2008-10-21T00:15:38Z', 'com.outerspaceapps.itranslate', '288113403', '- Fixed dictation bug\n\nIf you like iTranslate, would you mind taking a moment to write a nice review on the App Store? We''d greatly appreciate it. Thanks for using iTranslate!', '4+', '3.5', '110539', 'iTranslate - translator & dictionary - translate 90+ languages', '288113406', 'http://a5.mzstatic.com/us/r30/Purple3/v4/5c/39/63/5c39632b-bd67-709b-c6b3-1481f70df493/screen1136x1136.jpeg', 'http://a5.mzstatic.com/us/r30/Purple3/v4/5b/d0/82/5bd082c1-b38e-b89f-ee2c-9e5f7c05ee10/screen1136x1136.jpeg', 'http://a1.mzstatic.com/us/r30/Purple3/v4/20/c3/6c/20c36c5c-29c2-c221-161b-1c35e68d4f87/screen1136x1136.jpeg', 'http://a2.mzstatic.com/us/r30/Purple5/v4/b8/b3/4c/b8b34c33-881b-c2fd-f599-ad0f6c88b928/screen1136x1136.jpeg', 'http://a5.mzstatic.com/us/r30/Purple1/v4/b3/e5/92/b3e5927b-60a0-9af7-1d90-981447bc26e4/screen1136x1136.jpeg'),
(3, 1, 'http://a444.phobos.apple.com/us/r30/Purple5/v4/e3/02/5d/e3025d44-43f7-9017-8589-89d6e8e91e3d/pr_source.png?downloadKey=1428684995_df2b9852c70a980c46703c6f6af77244', 'AVEA ILETISIM HIZMETLERI A.S.', 0, '2.3.3', 'Avea Online ??lemler Art?k Her Yerde Yan?n?zda!\n\nUygulamay?  indirerek: \n\n-Fatura detay? görüntüleme ve ödeme \n-Kredi kart? ile lira yükleme\n-Paketlerinizden kalan bilgisini sorgulama \n-Bakiye sorgulama\n-Uluslararas? arama ve dola??ma açma – kapama\n-Tarife de?i?ikli?i \n-Talep, öneri ve ?ikâyet bildirimi gibi hatt?n?zla ilgili birçok ürün ve hizmetimizden; her an, her yerde kolayl?kla yararlanabilirsiniz. Üstelik Uygulamay? Avea hatt?n?z ile ba?lant? ücreti ödemeden kullanabilirsiniz.\n\n“Avea Online ??lemler” uygulamas?n? indirdikten sonra i?lem yapmak istedi?iniz telefon numaras? ve Jet?ifre’nizi girerek i?lem yapabilirsiniz. Jet?ifre’nizi telefonunuzdan *952#’yi tu?lad?ktan sonra aramaya basarak alabilirsiniz. Beni Hat?rla özelli?i ile Avea Online ??lemler uygulamas?n? telefon numaras? ve ?ifre girmeden, çok daha h?zl? ve güvenli bir ?ekilde kullanabilirsiniz.', '2012-02-08T20:30:35Z', 'com.avea.onlineislemler', '496489138', '- Performans iyile?tirmeleri yap?ld?.\n- Güvenli ?nternet Hizmeti Seçenekleri menüsü eklendi.\n- Gizli Numara engelleme servisi eklendi.\n- Arayan? Bil servisi yenilendi.', '4+', '2.0', '29', 'Avea Online ??lemler', '439626197', 'http://a3.mzstatic.com/us/r30/Purple/v4/e1/4c/9a/e14c9ae7-3462-9ff9-e9e1-c7a1ca9e4fe3/screen1136x1136.jpeg', 'http://a2.mzstatic.com/us/r30/Purple4/v4/44/5e/5c/445e5c08-aff6-33df-f447-886ebf2846f6/screen1136x1136.jpeg', 'http://a1.mzstatic.com/us/r30/Purple/v4/eb/37/26/eb372621-4076-c922-9125-66db2963a0e0/screen1136x1136.jpeg', 'http://a5.mzstatic.com/us/r30/Purple4/v4/0b/a2/c8/0ba2c84c-6650-8087-cc64-f19a4cc318a4/screen1136x1136.jpeg', 'http://a5.mzstatic.com/us/r30/Purple4/v4/70/2e/71/702e7111-f4ab-e76f-b4bd-78ee944e1ab7/screen1136x1136.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `Log`
--

CREATE TABLE IF NOT EXISTS `Log` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `User_Id` int(11) DEFAULT NULL,
  `Action_date` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `Review_Android`
--

CREATE TABLE IF NOT EXISTS `Review_Android` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `AppId` text,
  `Rating` text,
  `AuthorName` text,
  `Description` text,
  `CreationTime` text,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `Review_Android_History`
--

CREATE TABLE IF NOT EXISTS `Review_Android_History` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Rating` text,
  `UpdatedDate` date DEFAULT NULL,
  `PackageName` text,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `Review_iOS`
--

CREATE TABLE IF NOT EXISTS `Review_iOS` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `TrackId` text NOT NULL,
  `Title` text,
  `Author` text,
  `Message` text,
  `Rating` text,
  `Version` text,
  `UpdateDate` text,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `Review_iOS_History`
--

CREATE TABLE IF NOT EXISTS `Review_iOS_History` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Rating` text,
  `UpdatedDate` date DEFAULT NULL,
  `TrackId` text,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `Role`
--

CREATE TABLE IF NOT EXISTS `Role` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Title` text NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `Role`
--

INSERT INTO `Role` (`Id`, `Title`) VALUES
(1, 'Admin'),
(2, 'Engineer');

-- --------------------------------------------------------

--
-- Table structure for table `Seller`
--

CREATE TABLE IF NOT EXISTS `Seller` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Customer_Id` int(11) DEFAULT NULL,
  `Name` text,
  `isCompetitor` bit(10) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `User`
--

CREATE TABLE IF NOT EXISTS `User` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Firstname` varchar(100) DEFAULT NULL,
  `Lastname` varchar(100) DEFAULT NULL,
  `Username` varchar(100) DEFAULT NULL,
  `Password` varchar(100) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Role_Id` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `User`
--

INSERT INTO `User` (`Id`, `Firstname`, `Lastname`, `Username`, `Password`, `Email`, `Role_Id`) VALUES
(1, 'Long', 'Nguyen', 'long.nguyen', 'e10adc3949ba59abbe56e057f20f883e', 'long.nd144@gmail.com', 1),
(2, 'Ece', 'Calikus', 'ece.calikus', 'e10adc3949ba59abbe56e057f20f883e', 'ece.calikus@gmail.com', 2);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
