-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- 主機： localhost
-- 產生時間： 2021 年 09 月 21 日 20:36
-- 伺服器版本： 10.4.19-MariaDB
-- PHP 版本： 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫: `project1`
--

-- --------------------------------------------------------

--
-- 資料表結構 `category`
--

CREATE TABLE `category` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_name` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `category`
--

INSERT INTO `category` (`id`, `category_name`) VALUES
(1, '折扣卷'),
(2, '體驗卷');

-- --------------------------------------------------------

--
-- 資料表結構 `coupon_master`
--

CREATE TABLE `coupon_master` (
  `id` int(11) NOT NULL,
  `coupon_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon_name` varchar(50) NOT NULL,
  `coupon_value` int(20) NOT NULL,
  `category` int(1) DEFAULT NULL,
  `cart_min_value` int(20) NOT NULL,
  `duration_in_month` int(3) NOT NULL,
  `valid` int(2) UNSIGNED NOT NULL DEFAULT 1,
  `create_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `coupon_master`
--

INSERT INTO `coupon_master` (`id`, `coupon_code`, `coupon_name`, `coupon_value`, `category`, `cart_min_value`, `duration_in_month`, `valid`, `create_time`) VALUES
(1, 'YH_20210721_LOo7M', '5%off', 5, NULL, 500, 3, 1, '2021-07-21 01:00:00'),
(2, 'YH_20210721_lUWVs', '10%off', 10, NULL, 3000, 3, 1, '2021-07-21 02:00:00'),
(3, 'YH_20210721_kPvnE', '12%off', 12, NULL, 4000, 3, 1, '2021-07-21 03:00:00'),
(4, 'YH_20210721_xOq37', '15%off', 15, NULL, 15000, 4, 1, '2021-07-21 23:40:49'),
(5, 'YH_20210721_0UKOW', '18%off', 18, NULL, 18000, 5, 1, '2021-07-21 23:41:21'),
(6, 'YH_20210722_WdGt1', '90%', 90, NULL, 870000000, 24, 0, '2021-07-22 08:59:19'),
(7, 'YH_20210722_su2ro', '90%off', 90, NULL, 87000000, 2, 0, '2021-07-22 09:37:23');

-- --------------------------------------------------------

--
-- 資料表結構 `coupon_user`
--

CREATE TABLE `coupon_user` (
  `id` int(8) UNSIGNED NOT NULL,
  `user_id` int(8) UNSIGNED NOT NULL,
  `coupon_id` int(8) UNSIGNED NOT NULL,
  `amount` int(8) UNSIGNED DEFAULT 1,
  `duration` date NOT NULL,
  `order_id` int(8) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `coupon_user`
--

INSERT INTO `coupon_user` (`id`, `user_id`, `coupon_id`, `amount`, `duration`, `order_id`) VALUES
(1, 1, 1, 1, '2021-07-13', NULL),
(2, 1, 2, 1, '2021-07-13', NULL),
(3, 1, 3, 1, '2021-07-13', NULL),
(4, 1, 4, 1, '2021-07-13', NULL);

-- --------------------------------------------------------

--
-- 資料表結構 `emp_info`
--

CREATE TABLE `emp_info` (
  `e_id` int(10) UNSIGNED NOT NULL,
  `e_name` varchar(20) NOT NULL,
  `e_dept` varchar(20) NOT NULL,
  `date_of_birth` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `date_of_entry` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 傾印資料表的資料 `emp_info`
--

INSERT INTO `emp_info` (`e_id`, `e_name`, `e_dept`, `date_of_birth`, `date_of_entry`) VALUES
(1, '黃怡勇', '行銷部', '2008-04-03 05:33:00', '2014-09-22 09:53:00'),
(2, '楊佳堯', '行銷部', '2019-05-31 11:57:58', '2013-10-24 09:53:00'),
(3, '李智凱', '銷售部', '2008-04-03 05:33:00', '2015-04-21 05:33:00'),
(4, '王正琪', '銷售部', '2008-04-03 05:33:00', '2015-03-20 09:54:00'),
(5, '林丹義', '技術部', '2019-05-31 11:58:23', '2014-09-22 09:53:00'),
(6, '楊玉婷', '銷售部', '2008-04-03 05:33:00', '2014-09-22 09:53:00'),
(7, '毛冠傑', '技術部', '2008-04-03 05:33:00', '2013-10-24 09:53:00'),
(8, '王倩一', '技術部', '2019-05-31 11:58:29', '2015-04-21 05:33:00'),
(10, '吳玟潔', '行政部', '2019-05-31 11:58:10', '2014-09-22 09:53:00'),
(11, '郭維倫', '行政部', '2019-05-31 11:58:42', '2015-04-21 05:33:00'),
(14, '許哲文', '銷售部', '2019-05-22 14:25:00', '2019-05-30 14:25:00');

-- --------------------------------------------------------

--
-- 資料表結構 `forum_article`
--

CREATE TABLE `forum_article` (
  `id` int(5) UNSIGNED NOT NULL,
  `game_name` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `game_forum_id` int(5) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `article_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `article_content` varchar(5000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `picture` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valid` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `forum_article`
--

INSERT INTO `forum_article` (`id`, `game_name`, `game_forum_id`, `create_time`, `article_title`, `article_content`, `picture`, `valid`) VALUES
(1, '卡卡頌2.0', 1, '2021-07-09 11:02:15', '遊戲介紹', '卡卡頌(Carcassonne)是一款容易上手又好玩的桌遊，屬於經典之作，也出了許多擴充版本，本文是介紹最基本的版本。玩家會輪流抽地圖板塊放到桌面上，並選擇要不要擺放自己手上的【米寶】(棋子)到剛剛出的板塊上。根據米寶擺放的位置不同，會有4種職業，不同職業獲得的分數不一樣。當玩家完成板塊上的建築後，就可以取回米寶並獲得分數。透過反覆擺放板塊和米寶，卡卡頌地圖會不斷擴張，玩家也會累積自己的積分，遊戲最後是分數最高的玩家獲勝。卡卡頌領地會因為擺放的方式不同而長得不一樣，因此每次玩都會有新的樂趣。', '卡卡頌2.0.png', 1),
(2, '卡卡頌2.0', 1, '2021-07-09 11:02:15', '遊戲玩法', '遊戲過程中以紙牌建構出中古世紀的地景，而玩家扮演諸侯的角色，用7位隨從佔地以獲得分數。基本版的遊戲包含72張紙牌，其中一張為開始牌。遊戲開始先將開始牌放置在桌子的中央，其餘71張洗好背面朝上，玩家在遊戲的過程中依序抽牌、放置於適當的位置。在每一張紙牌上可能包含下列幾種元素：草原、道路、城市、修道院。玩家必須將手上牌的地形銜接於地圖上的相同地形。也就是說，草原必須銜接草原，道路必須銜接道路，城市必須銜接城市。\n\n而在每一回拼上手中的紙牌之後，玩家可以考慮派出一個隨從佔領土地。佔領草原的是農夫、佔領道路的是強盜、佔領城市的是騎士、佔領修道院的是僧侶。但是要注意的是，如果相連的地形裡已有任一玩家的隨從（包括自己的），則不可以佔領。\n\n然而，同一地形上還是可能同時有兩名隨從，這是因為原本各自佔領的地形後來被接起來了。\n\n卡卡頌簡明的步驟如下：\n\n輪到你，你抽牌。\n放牌，但萬一無地方可放則再抽一張。\n決定是否放隨從在這張牌上。\n若有地形完成，把上面的米寶都歸回玩家，並移動記分板上的米寶（參見遊戲記分）。\n以順時鐘方向換下一個人。\n依據上述流程，當手上無米寶，就算放牌後可收回米寶，也不能將收回的米寶放在此張牌的另一地形上。\n\n當最後一塊紙牌被放下之後，則遊戲結束。分數最高分者獲勝。', '卡卡頌2.0.png', 1),
(3, '四季物語', 1, '2021-07-09 11:08:09', '遊戲介紹', '四季物語是一個經典的卡牌與骰子相結合遊戲，玩家在這個遊戲裡需要召喚各式各樣的強大魔法牌來讓他們為你工作，通過他們獲得最多的水晶，成為新的大魔法師。遊戲過程中分為兩個階段，輪抽階段和回合階段，輪抽階段會通過輪抽（每位玩家抽取9張卡牌，然後從中選擇一張將剩餘的卡牌傳遞給下一個玩家，以此循環直到每個人手裡有新的九張牌）的方式決定玩家各自的起始手牌和藏書（新的一年開始時獲得的卡牌）。之後就是正式的遊戲環節了，由一號位玩家開始，每個玩家先選擇一個骰子，獲取上面的資源（元素，分數，召喚上限，又或是牌）然後開始自己的回合，打出各種強力的魔法牌！', '四季物語.png', 1),
(4, '四季物語', 1, '2021-07-09 11:08:09', '遊戲玩法', '在每局遊戲開始前，玩家們會先用輪抽（傳遞式選牌）的方式，構築好自己的起始牌庫，並把它們規劃分成三組，當年份發生轉換時即可加入手牌。在遊戲過程中，每回合又用到了擲骰的機制，當前回合進行到什麼季節，就投擲對應季節的骰子。玩家透過選擇骰子，決定本回合能獲得的行動效果。\r\n骰子的行動效果共有五種，這里大略展開講述一下：\r\n\r\nA.獲得能量元素\r\n遊戲共有4種能量元素（風火水土），骰子上畫有什麼元素符號，就可以獲得對應的元素標誌，存放在自己的儲備區。\r\n能量元素是召喚魔法牌的重要前提，同時也能用於轉化成水晶（分數）。不過注意不同季節的骰子，產出能量元素的種類比重是不同的。\r\n\r\nB.提升召喚等級\r\n骰子上的星星符號，代表能提升召喚等級。召喚等級決定了該玩家最多可以同時召喚多少張魔法牌進場。此數值顯示在玩家個人的魔法師面板上。\r\n\r\nC.獲得水晶\r\n骰子上的數字，表示玩家可以獲得的水晶數量。水晶是分數的一部分，也是召喚或激活某些魔法牌的前提。玩家的水晶數量會記錄在公共水晶池中。\r\n\r\nD.獲得轉化能力\r\n骰子上的圓圈圖案，表示玩家可以將自己儲備區的一枚或多枚能量元素轉化為水晶，這是把元素變成水晶（分數）的重要方式。\r\n不過注意不同季節各元素的轉化比例是不同的，具體參考轉化譜，簡單來說該季節越不好產出的元素能轉化的水晶就越多。\r\n\r\nE.抓一張魔法牌\r\n骰子上的長方形圖案，表示玩家可以獲得自己起始牌庫之外的一張魔法牌，玩家可以選擇保留或者棄掉該牌。會選擇棄掉是因為遊戲結束時玩家要盡可能的把手牌全部召喚出來，如果無法打出，每剩一張手牌會扣5分。\r\n\r\n這些就是骰子的主要效果，在執行完骰子效果後，玩家便能召喚手中的魔法牌，以及使用已召喚出的卡牌技能。\r\n玩家只要能支付召喚費用，以及具備足夠的召喚等級，每回合是可以召喚多張魔法牌入場的。\r\n魔法牌的作用一是給玩家帶來聲望分數，更重要的是能產生強大的技能效果，從而形成Combo連鎖，讓玩家越刷越快。\r\n卡牌效果根據使用時機又分成了三種（見卡牌左下角）：一次性，持續性，激活使用。\r\n\r\n另外遊戲還有一種徽章行動，在整局遊戲中，每位玩家最多可以使用3次，這些徽章可以給玩家提供額外的效果，但在遊戲結束時，根據使用次數會失去一些分數。\r\n以上就是玩家主要能做的行動，雖然內容較多，但熟悉規則之後並不復雜。\r\n\r\n簡單來說本遊戲的核心玩法就是：擲骰→獲得資源→召喚卡牌→形成連鎖技能→盡情的刷分。', '四季物語.png', 1),
(5, '屠龍矮人', 1, '2021-07-09 11:39:09', '遊戲介紹', '遊戲人數：2人(BDG論壇有多人的變體規則)\n遊戲時間：30分鐘\n「屠龍矮人(Drako)」遊戲為2011年由Adam Kaluza所設計的主題遊戲，並入圍2011年金畸獎最佳兩人桌上遊戲獎項。遊戲中玩家分別扮演令當地居民聞風色變的紅色巨龍及欲將此紅色巨龍消滅殆盡的三個矮人，雙方並進行一場驚天動地的生死決鬥。', '屠龍矮人.png', 1),
(6, '屠龍矮人', 1, '2021-07-09 11:39:09', '遊戲玩法', '起始玩家為巨龍，每位玩家輪流進行他的回合\r\n在第一回合中，巨龍只可以執行一個行動，在之後的所有回合中，每位玩家可以執行兩個行動。\r\n可以執行的行動分別為：\r\n1. 抽兩張卡\r\n2. 使用一張卡\r\n玩家可以自行組合行動順序，例如：玩家可以抽兩張卡後使用一張卡、使用一張卡後抽兩張卡、使用兩張卡、或是抽四張卡。玩家必須執行兩個行動，不可以跳過。 \r\n唯一可能發生的例外是在遊戲即將結束時，如果矮人玩家仍有牌但巨龍玩家沒有牌時，則巨龍玩家跳過他的行動並等待對手執行他的行動及結果。\r\n \r\n抽兩張卡：\r\n玩家從自己的牌堆抽兩張卡放到手上，手牌上限為6，如果玩家在抽完兩張牌後手牌超過6張時，必須棄牌到剩6張。\r\n \r\n使用一張卡：\r\n玩家從手上出一張牌並使用這張牌上的一項功能，每張牌上的功能都以特定符號標示在左上角。\r\n使用過的卡片棄掉並移出遊戲\r\n \r\n \r\n卡片符號的移動跟攻擊規則：\r\n移動：\r\n若使用一張牌來移動，玩家可以讓他的一個(或有可能是多個)戰棋移動最多等同於卡上的移動點數(符號旁的數字)。移動點數不必全部用完，若完全不移動也可以(但所使用的卡片仍然必須棄掉)。\r\n \r\n攻擊：\r\n若使用一張牌來攻擊，玩家可以讓他的一個(或有可能是多個)戰棋以卡牌上的傷害值進行攻擊(符號旁的數字)。\r\n如果玩家使用一張卡來進行攻擊，另一名玩家可以立刻使用一張有防禦符號的卡片來反制，讓這次攻擊無效(這不算在玩家每回合可以執行的兩個行動中，並將雙方所使用的兩張牌都棄掉)。\r\n \r\n如果攻擊成功(沒被防禦)，則被攻擊的目標會受到傷害：將等同於傷害值的傷害指示物放到該名玩家的玩家面板上。\r\n如果是矮人受到攻擊，傷害指示物要放到面板上被攻擊的那位矮人圖像處。\r\n如果是巨龍受到攻擊，會先由最上方的四格空間先承受攻擊，這代表巨龍的傷害免疫，四格滿了之後所受到的傷害，由矮人玩家指定放置的位置(不同位置代表不同的能力)，在某項能力所代表的空格都被指示物填滿後，巨龍便不能使用該項能力。\r\n當代表某個戰棋的所有空格都被傷害指示物填滿時，代表已死亡，將該戰棋從地圖上移除。', '屠龍矮人.png', 1),
(7, '三國殺', 2, '2021-07-09 11:49:37', '遊戲介紹', '相信\"三國\"是一個家域戶曉名詞，三國殺是一個以三國時代為背景，集角色扮演、戰鬥、偽裝等要素于一體的多人卡片遊戲。玩家可以通過在遊戲裡扮演不同身份的角色，隱藏自己，尋找同伴，並運用各是不同的技能擊敗敵對勢力，得到最後的勝利，創造一個屬於自己的三國傳奇。', '三國殺.png', 1),
(8, '三國殺', 2, '2021-07-09 11:49:37', '遊戲玩法', '建議人數:2~10人\r\n\r\n遊戲準備:\r\n抽一個身份後，抽到主公的玩家從劉備、孫權、曹操以及隨機抽取兩名武將，其中挑選一名武將翻開。剩下武將洗勻後發給每位玩家三名武將，各玩家從其中挑選一名武將，起手四張卡。 \r\n\r\n遊戲流程:\r\n1.回合開始(依人物角色)\r\n2.判定(依牌說明)\r\n3.摸牌階段(牌堆頂兩張)\r\n4.出牌階段\r\n5.棄牌階段(依體力值)\r\n6.回合結束階段(依人物角色)\r\n互相輪替\r\n\r\n勝利條件:\r\n達成身份勝利條件。\r\n\r\n3人玩法\r\n使用身份卡 1張主公，1張反賊，1張內奸，主公不額外獲得一滴血，其餘遊戲規則與基本規則相同。 \r\n\r\n2人玩法：\r\n1. 三國殺 1V1 的對戰雙方的身份分別為“主公”和“內奸”。雙方以累計消滅 對方 3 名武將為獲勝條件。\r\n2．在一局比賽中，“主公”擁有優先選將權，“內奸”擁有優先行動權。\r\n3. 單局比賽時間為 30 分鐘，從準備階段開始進行計時。若比賽時間到，雙方武 將均存活，則比較雙方備用武將數，備用武將數多的一方獲勝。如果雙方備用武 將數相同，則比較雙方場上武將已損失體力值，已損失體力值少的一方獲勝。如 果以上數值都相同，無法分出勝負時，雙方比點決定勝負。\r\n\r\n比賽流程\r\n一、選將階段\r\n1．雙方進行比點，獲勝的一方優先獲得身份選擇權。如果比賽局數大於 1 局， 則雙數局交換身份選擇權，單數局通過比點決定身份選擇權。\r\n\r\n2．將武將牌洗混後，隨機翻開 12 名武將作為本局比賽的備選武將。\r\n（1）由擁有身份選擇權的一方選擇當局比賽的身份，將相應身份牌正確擺放。\r\n（2）由“主公”開始輪流進行選將。 選將順序：\r\n         步驟 1：“主公”選擇武將 1 名，剩餘可選武將數 11 名；\r\n         步驟 2：“內奸”選擇武將 2 名，剩餘可選武將數 9 名；\r\n         步驟 3：“主公”選擇武將 2 名，剩餘可選武將數 7 名；\r\n         步驟 4：“內奸”選擇武將 2 名，剩餘可選武將數 5 名；\r\n         步驟 5：“主公”選擇武將 2 名，剩餘可選武將數 3 名；\r\n         步驟 6：“內奸”選擇武將 2 名，剩餘可選武將數 1 名；\r\n         步驟 7：“主公”獲得剩餘的 1 名武將。\r\n         注：雙方所選武將須依次展示於本方面前。\r\n（3）雙方確認所選武將。\r\n（4）雙方收起所選武將牌然後選擇 1 名上場武將，將剩餘武將牌置於上場武將 左側，作為本局比賽的備用武將。\r\n\r\n二、比賽階段\r\n1．體力牌及起始手牌 雙方將體力牌放置在出場武將的右側並調整至相應體力，然後摸取等同於自己武 將體力上限張數的卡牌作為起始手牌。\r\n2. 行動順序 由“內奸”首先開始自己的回合，之後雙方輪流交替進行回合直到比賽結束。每 局比賽的第一個回合，摸牌階段摸牌時，少摸一張牌。\r\n3．角色回合 ·共包括以下六個階段：\r\n    （1） 準備階段：可以發動所有需在回合開始階段發動的技能。 包括：洛神，觀星，英魂。 注：在準備階段和判定階段之間可以發動技能神速。\r\n    （2）判定階段：當行動角色的判定區內有需要判定的延時類錦囊時，角色需在 判定階段進行判定。\r\n    （3）摸牌階段：選手摸取兩張手牌。 此階段可以發動的技能為：再起，英姿，突襲，裸衣，雙雄。 注：在摸牌階段和出牌階段之間可以發動技能神速。\r\n    （4）出牌階段：選手在此階段可以使用任意張牌。\r\n      注： 1.出牌時和發動技能時需要正確聲明。\r\n           2.除發動武器和武將技能外，每次出牌階段只可以使用一張【殺】。\r\n    （5）棄牌階段：如果手牌數大於自己角色當前的體力值，須在此階段將手牌數 棄至與自己體力值相等。\r\n    （6）結束階段：在此階段應聲明回合結束。 此階段可以發動的技能為：閉月，據守。 出牌階段，選手每個動作的完成時間為 15 秒，如果超時，默認為出牌階段結束。 其他階段的技能發動時間為 5 秒，選手需在 5 秒內示意對手是否發動技能，如超 時，默認為放棄發動技能。\r\n4．角色陣亡及新角色登場 當一方的場上角色陣亡時，如果該選手陣亡角色總數尚未達到 3 名，則按照以下 順序進行結算：\r\n       A. 角色進入“死亡時”狀態，若有可以在此時發動的武將技能，選手可以聲明 發動。包括：藏機，延禍，然後，棄置陣亡武將區域內的所有遊戲牌並移除武將 牌。當以此法棄置的牌進入棄牌堆時，可以聲明發動技能肅資。\r\n       B. 陣亡角色方從自己的備選武將中選擇一名武將登場，調整體力並獲得等同於 體力上限數量的起始手牌。\r\n       C. 繼續之前未完成的結算。此時，繼續藏機技能的結算，將之前的裝備牌放置 於新登場角色的裝備區。\r\n       D. 角色進入“登場時”狀態，若有可以在此時發動的武將技能，選手可以聲明 發動。包括：虎威，蠻裔，翩儀，驍襲。 E. 武將登場結算完畢。（如果角色在自己的回合內陣亡，則由對方開始新的回 合。）\r\n\r\n三、比賽結束\r\n1．任意一方累計 3 名武將陣亡時，比賽結束，另一方獲勝。\r\n2．比賽時間到且雙方陣亡武將均未達到 3 名，當“主公”行動結束後，比賽結 束。雙方比較剩餘武將總數，剩餘總數多的一方獲勝，如果剩餘武將數相同，比 較雙方場上武將損失體力，損失體力少的一方獲勝。如果以上方式無法決出比賽 勝負，比點決定勝負。\r\n3．任意一方提出認輸，放棄比賽，另一方獲勝。\r\n\r\n【名詞解釋】\r\n1.三國殺 1V1：指三國殺的 2 人競技模式，分為\"主公\"、\"內奸\"兩方進行比 賽。\r\n2.體力：指角色的體力，武將牌左上角陰陽魚數量表示使用該武將時的體力上限。\r\n3.起始手牌：武將上場後所獲得的卡牌，數量與武將的體力上限相同。\r\n4.陣亡：指一名角色死亡，須棄掉其所有手牌、裝備區的牌及判定區的牌。如果 一方累計 3 名武將陣亡，則比賽立即結束。\r\n5.比點(拼點)：由雙方從牌庫中各抽出一張卡牌，亮出後比較卡牌的點數。A 最小，K 最大。點數大的一方獲勝。如果點數相同，重複此過程直到分出勝負為止。\r\n6.離場：一名出場中的武將因死亡等原因退出遊戲的過程。\r\n7.登場：一名武將出場並加入比賽的過程。\r\n8.剩餘武將數：比賽結束時，選手所剩餘的武將總數，包括備用武將和場上武將。\r\n9.已損失體力值：已損失體力值在計算時由武將的體力上限減去武將的當前體力 值得出。只有出場的角色可以計算已損失體力值，陣亡角色不參與計算。', '三國殺.png', 1),
(9, 'UNO', 2, '2021-07-09 12:07:41', '遊戲介紹', '獨一無二UNO擊卡樂，結合了基本的UNO紙牌遊戲，更加上了出人意表且隨機的刺激性！', 'UNO.png', 1),
(10, 'UNO', 2, '2021-07-09 12:08:47', '遊戲玩法', '1. 每位玩家先抽一張牌，抽到牌面最高分數者發牌(其他特別牌不作考慮)\n2. 洗牌\n3. 每位玩家發 7 張牌 將剩下的牌面向下疊起來當作\"牌庫\"\n4. 從發牌者左的玩家開始，出牌順序為順時針方向\n5. 如果第一張牌出現的不是數字牌，而是其他技術牌，便要將它重放於發牌器中，接著再翻開第 1 張牌直至出現數字牌為止\n6. 玩家依發牌器發出的第一張牌的數字，顏色出牌。例如：第一張翻出的牌是綠色\n7. 則你必須出綠牌或其他顏色而數字是 7 的牌。或者，你也可以出其他技術牌 7。如果你沒有任何可出的牌，你就必須按發牌器的按鈕 1 次。如果你抽到可以出的牌即可出牌，否則就輪到下一位玩家出牌。\n8. 在遊戲中，輪到該玩家出牌時，若手上有相同顏色及相同數字的牌或同一系列的技術牌，便可以選擇性全出這些牌，不限數量\n\n9. 當你出倒數第 2 張牌時(出完該牌只剩 1 張牌)，你就要大喊一聲\"UNO\"。如果你在你的下家出牌之前被其他玩家發現你沒有喊，你就必須被罰按\"發牌器\"2 次。反之，如果在你的下一位玩家出牌之前都沒人發現，你就不用受罰。\n10. 最快出完手中牌的人就是該回合的贏家，而其他人手中剩餘牌的點數總和就是他們各自的負分。最後所有回合總計，負最少分數的便是最後大贏家!\n11. 但是，如果最後 1 張牌的是任何技術牌便不可出牌，要按發牌器的按鈕 1 次，反之在情況許可下能夠出牌及是數字牌，便可以完結比賽成為贏家。\n12. 在遊戲當中，玩家要輪流出牌，不可以因為同一顏色同一數字或同一系列的技術牌便中間插牌。\n13. 最後一張牌時不能是技術牌，唯獨是\"萬能攻擊牌\"(WILD ATTACK-ATTACK)，則玩家可以當普通數字牌作結束，但其功用作廢，即下家不會被罰牌。 \n\n遊戲結束\n當你手中剩下一張牌時，必須在倒數第２張牌時叫UNO，如果沒有喊出UNO， 則必須按２次按鈕（在被其他玩家發現的情況下） 或者在其他玩家發現時喊UNO，則不用罰牌。如果玩家放棄使用萬能攻擊牌，在遊戲結束時可以當這張牌做普通牌來用。如果玩家不小心發動了出牌機，則要收進發出來的牌。\n\n遊戲計分表說明：\n1. 號數牌：牌面數字為分數\n2. 20 分 \"罰擊兩次牌\"(HIT 2) \"反轉牌\"(REVERSE) \"阻擋牌\"(SKIP)\n3. 30 分 \"同色全出牌\"(DISCARD ALL)\n4. 50 分 \"萬能攻擊牌\"(WILD ATTACK-ATTACK) \"萬用牌\"(WILD CARD) 當遊戲結束時，勝者為分數最少的玩家 \n\n懲罰：任何給其他玩家提出出牌建議必須按發牌器４次並在那一圈不能出牌。', 'UNO.png', 1),
(11, '翻滾刺蝟', 2, '2021-07-09 16:42:24', '遊戲介紹', '在厚厚的樹冠下，小刺蝟急著趕回自己舒適的家。\n在森林中滾動毛絨絨的刺蝟，收集有魔鬼氈的蘋果、樹葉和蘑菇，這些森林特產讓刺蝟可以沿著林中小徑前進，快快回家。\n每場遊戲開始前，構建好森林小徑，然後選擇競賽模式來一較高下，或是採用合作模式，一同躲避緊追而來的狐狸。\n適合年紀：4y+\n遊戲人數：1-4人\n遊戲時間：20 mins', '翻滾刺蝟.png', 1),
(12, '翻滾刺蝟', 2, '2021-07-09 16:42:24', '遊戲玩法', '有二種遊戲模式，玩家們請於遊戲開始前自行選擇。\r\n競賽模式：\r\n玩家們的刺蝟將彼此競速！滾動絨毛球，讓你的刺蝟儘快到達目的地。在這片森林中，哪知刺蝟能獲得飛毛腿的名號呢？\r\n\r\n合作模式：\r\n所有玩家共同幫助一隻刺蝟，逃離節節逼近的狐狸！你們的目標是讓刺蝟不被狐狸抓到，並安全到家。', '翻滾刺蝟.png', 1),
(13, '誰是牛頭王', 2, '2021-07-09 16:53:25', '遊戲介紹', '誰是牛頭王(Take 6)是一款輕鬆又簡單的小品桌遊。桌遊內容非常簡單，只有104張數字牌。遊戲規則和撲克牌的接龍很類似，要依序將數字牌銜接上去，不過又多了幾個小規則和計分方式，讓遊戲的複雜度稍微提高一點。誰是牛頭王需要一點數學頭腦去算牌，如果認真玩的話，也會稍微燒一點腦力。\n\n遊戲人數：2~10人\n最佳人數：5~6人\n準備時間：10分鐘以內\n遊戲時間：45分鐘\n遊戲類型：紙牌，數字', '誰是牛頭王.png', 1),
(14, '誰是牛頭王', 2, '2021-07-09 16:53:25', '遊戲玩法', '每個玩家選擇一張手牌，牌面朝下放在桌上，接著一起打開這張牌。依照【出牌】規則放牌，或是【拿牌】規則拿牌後再放牌。玩家會反覆進行出牌動作，直到將手上的10張牌出完。\r\n\r\n出牌\r\n從玩家出牌數字由小到大，依序將牌擺放到桌上。放置規則如下：\r\n1. 只能銜接在桌面上的四列牌後面。\r\n2. 每一列的數字只能由左到右漸增。\r\n3. 打出的牌必須銜接在數字最小且最接近的牌後。\r\n\r\n每一列牌的上限是五張。如果發生無法加入新牌的狀況，就要把桌面上的一列牌拿到自己面前，當作自己的廢牌。會有以下兩種狀況發生。\r\n拿牌狀況一：客滿\r\n下圖中加入的64號牌只能放在第二列。因此玩家要把第二列的5張牌拿到自己的廢牌堆後，再將64號牌放到第二列的第一張牌。\r\n\r\n拿牌狀況二：數字太小\r\n下圖要加入8號牌，但最小的數字是18，因此玩家要選擇一列拿到自己的廢牌堆，並把8號牌放到那一列當作起始牌。可以任意選擇要拿的那列，通常會拿牛頭數比較少的那一列，因為牛頭代表扣分。\r\n\r\n結束算分\r\n當玩家都出完手上的10張牌後，計算自己廢牌堆中的牛頭數量，每一個牛頭代表扣一分。\r\n接著用牌堆剩餘的卡牌繼續進行下一回合，直到某位玩家的牛頭數有66個，遊戲就結束，牛頭數最少的玩家獲勝。\r\nP.S.: 遊戲結束的牛頭數量也可以自訂。', '誰是牛頭王.png', 1),
(15, '火車大亨', 3, '2021-07-09 16:58:08', '遊戲介紹', '火車帶來龐大財富利潤，眾多的投資客迫不及待的想加入市場，投資優良的火車頭、採購多種款式的車廂，並用火車帶來的收益開啟下一次的交易，究竟在這錢滾錢的戰場上，誰能成為最大的贏家呢？', '火車大亨.png', 1),
(16, '火車大亨', 3, '2021-07-09 16:58:08', '遊戲玩法', '首先依照人數抽出對應玩家人數的火車頭。\r\n2人遊戲：6張火車頭牌\r\n3人遊戲：9張火車頭牌\r\n4人遊戲：12張火車頭牌\r\n5人遊戲：15張火車頭牌\r\n6人遊戲：全部火車頭牌\r\n每位玩家拿取一個屏風、5000元，以及三張目標卡。\r\n\r\n在第一階段，玩家會競投火車頭，並按投得的火車頭決定玩家順序；在第二階段，則會按順序拿車卡，放到火車頭下（即該輛火車運載的貨物）。\r\n當任何玩家的火車運載著5張車卡，一輪完結，結算玩家得分。\r\n三輪下來，分數最高的玩家勝出。', '火車大亨.png', 1),
(17, '消失的主角', 3, '2021-07-09 17:09:23', '遊戲介紹', '「消失的主角」是一款考驗想像力的遊戲。遊戲中，你必須畫圖，讓其他玩家看圖猜謎，但並不是要畫出「主角」讓大家猜，而是畫出主角周圍的環境、情境，讓其他人猜出你的「主角」是什麼！\n若想贏得勝利，聰明構圖和盡情猜測比做個稱職的畫家來得更重要！', '消失的主角.png', 1),
(18, '消失的主角', 3, '2021-07-09 17:09:23', '遊戲玩法', '所有玩家獲得一個畫冊跟筆。\r\n玩家從牌庫抽取一張題目卡（題目分三種難度，玩家自行選用）\r\n玩家把題目放進自己畫冊透明塑膠下，自行決定題目擺放位置。\r\n所有玩家試著畫出題目周遭環境，不得直接畫出題目或是以文字等方法表示。\r\n在僅剩一名玩家還未畫好題目時倒數１０秒，時間到後繪圖結束ˋ。\r\n玩家依次展示自己的畫冊（抽調題目卡），讓所有玩家猜測題目（沒有順序跟次數限制）。\r\n當有玩家猜對時將題目卡給予該玩家，代表該玩家獲得一分。若最終沒有玩家可以猜出題目，則出題玩家需要棄掉一張獲得的題目（若有獲得的話）。\r\n所有玩家的畫冊都被猜過後結束一輪，重新回到步驟２。玩七輪後比較玩家得分決定贏家。', '消失的主角.png', 1),
(19, '黑白棋', 3, '2021-07-09 17:12:46', '遊戲介紹', '黑白棋在西方和日本是很流行的桌面棋類遊戲。通過相互翻轉對方的棋子，最後以棋盤上誰的棋子多來判斷勝負。\n遊戲規則簡單，因此上手很容易，但它的變化又非常複雜。有一種說法是：只需要幾分鐘學會它，卻需要一生的時間去精通它。\n相傳為19世紀末的英國人發明，用莎士比亞名劇奧賽羅（Othello）為其命名，發展至今成為現在通行的黑白棋。\n奧賽羅是莎士比亞一個名劇的男主角。他是一個黑人，妻子是白人，因受小人挑撥，懷疑妻子不忠一直情海翻波，最終親手把妻子殺死。後來真相大白，奧賽羅懊悔不已，自殺而死。黑白棋就是借用這個黑人白人鬥爭的故事而命名。', '黑白棋.png', 1),
(20, '黑白棋', 3, '2021-07-09 17:12:46', '遊戲玩法', '棋盤共有8行8列共64格。開局時，棋盤正中央的4格先置放黑白相隔的4枚棋子（亦有求變化相鄰放置）。通常黑子先行。雙方輪流落子。只要落子和棋盤上任一枚己方的棋子在一條線上（橫、直、斜線皆可）夾著對方棋子，就能將對方的這些棋子轉變為我己方（翻面即可）。如果在任一位置落子都不能夾住對手的任一顆棋子，就要讓對手下子。當雙方皆不能下子時，遊戲就結束，子多的一方勝。\r\n\r\n因為黑白棋獨特的規則，很容易出現雙方比分的劇烈變化，在遊戲後期可能僅用幾個回合就將大量對方棋子變成己方，從而扭轉局勢。因此，太著眼於比分是沒有必要的，更重要的是占據有利位置。\r\n中間位置的棋子最容易受到夾擊，有橫、直、斜線共四個方向的可能。而邊緣的棋子則只有一個可能被夾擊的方向，四個角落上的位置被占據後，則完全不可能被攻擊。\r\n遊戲的後期是關鍵位置的爭奪，而前期的布局，就是為搶占關鍵位置作準備。例如：若不想讓對方占據棋盤邊緣的有利位置，那麼自己就應避免在靠近邊緣的那一排落子。', '黑白棋.png', 1),
(21, '作弊飛蛾', 1, '2021-07-14 11:52:44', '遊戲介紹', 'ttttfhfrj6516510ggg', '目擊者之夜.png', 1),
(22, '目擊者之夜', 2, '2021-07-13 11:17:28', '遊戲介紹', '今天', '目擊者之夜.png', 1),
(23, '目擊者之夜', 0, '2021-07-13 11:18:53', '遊戲介紹', '今天', '目擊者之夜.png', 1),
(24, '目擊者之夜', 0, '2021-07-13 11:21:20', '遊戲介紹', 'dgfaeh', '目擊者之夜.png', 1),
(25, '目擊者之夜', 3, '2021-07-13 12:06:31', '遊戲介紹', '嘿!!!!!', '目擊者之夜.png', 1),
(26, '目擊者之夜', 3, '2021-07-13 13:50:34', '遊戲介紹', 'iofhajf', '目擊者之夜.png', 0),
(27, '目擊者之夜', 2, '2021-07-13 15:16:52', '遊戲介紹', '21654651', '目擊者之夜.png', 0),
(28, '目擊者之夜', 2, '2021-07-13 15:19:25', '遊戲介紹', '52342541', '目擊者之夜.png', 0),
(29, '鈕鈕相扣', 3, '2021-07-14 14:05:54', '遊戲介紹', '87ity964165ikughiufyclmk', '鈕鈕相扣.png', 1),
(30, '打貼紙', 2, '2021-07-14 14:40:29', '遊戲介紹', 'wjutgh;lfm;46846', '打貼紙.jpg', 0),
(31, '電力公司', 1, '2021-07-14 18:07:55', '遊戲介紹', '95+95mjpjomp', '電力公司.png', 1),
(32, '十全十美', 1, '2021-07-15 15:21:34', '遊戲介紹', '6451fjhn;owihnf', '十全十美.png', 1);

-- --------------------------------------------------------

--
-- 資料表結構 `game_choose`
--

CREATE TABLE `game_choose` (
  `id` int(5) UNSIGNED NOT NULL,
  `game` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `game_choose`
--

INSERT INTO `game_choose` (`id`, `game`) VALUES
(1, '卡卡頌2.0'),
(2, '四季物語'),
(3, '屠龍矮人'),
(4, '三國殺'),
(5, 'UNO'),
(6, '翻滾刺蝟'),
(7, '誰是牛頭王'),
(8, '火車大亨'),
(9, '消失的主角'),
(10, '黑白棋');

-- --------------------------------------------------------

--
-- 資料表結構 `game_forum`
--

CREATE TABLE `game_forum` (
  `id` int(5) UNSIGNED NOT NULL,
  `category` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `game_forum`
--

INSERT INTO `game_forum` (`id`, `category`) VALUES
(1, '策略'),
(2, '紙牌'),
(3, '棋盤');

-- --------------------------------------------------------

--
-- 資料表結構 `game_room`
--

CREATE TABLE `game_room` (
  `id` int(5) UNSIGNED NOT NULL,
  `game_room_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `game_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `host_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `number_of_people` int(5) UNSIGNED NOT NULL,
  `game_datetime` datetime NOT NULL,
  `game_teacher` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `full` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valid` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `game_room`
--

INSERT INTO `game_room` (`id`, `game_room_name`, `game_name`, `host_name`, `number_of_people`, `game_datetime`, `game_teacher`, `full`, `valid`) VALUES
(1, 'UNO!', '5', 'Wendy', 4, '2021-07-23 10:00:00', '是', '招募中', 1),
(2, '來用黑白棋對決吧!', '10', 'Jack', 2, '2021-07-30 11:00:00', '否', '已額滿', 1),
(3, '野心三國殺', '4', 'Mike', 8, '2021-07-23 14:00:00', '否', '招募中', 1),
(4, '戰鬥吧!四季物語', '2', 'Ora', 4, '2021-07-24 19:09:00', '否', '招募中', 1),
(5, '拼拼拼卡卡頌', '1', 'Kim', 2, '2021-07-31 15:28:00', '否', '已額滿', 1),
(6, '刺蝟逃跑中', '6', 'Ava', 4, '2021-07-25 11:41:00', '是', '已額滿', 1),
(7, 'TAKE 6!', '7', 'Ray', 6, '2021-07-24 11:41:00', '否', '招募中', 1),
(8, '拼拼拼卡卡頌', '1', 'Ava', 4, '2021-07-23 10:39:00', '是', '招募中', 1),
(9, 'ccccc', '8', 'Emily', 3, '2021-07-22 11:58:00', '是', '招募中', 1),
(10, '妳畫我猜', '9', 'Leo', 3, '2021-07-24 12:23:00', '否', '已額滿', 1),
(11, '野心三國殺', '4', 'Oliver', 6, '2021-07-24 16:13:00', '否', '招募中', 1),
(12, '屠龍矮人', '3', 'Alex', 4, '2021-07-29 18:14:00', '否', '招募中', 1),
(13, '決戰三國殺', '4', 'Tarly', 6, '2021-07-29 20:40:00', '否', '已額滿', 1),
(14, 'WHAT\'S MISSING ?', '9', 'Lane', 5, '2021-07-29 16:39:00', '否', '已額滿', 1),
(15, '我是火車大亨', '8', '小明', 6, '2021-07-28 20:37:00', '否', '招募中', 1);

-- --------------------------------------------------------

--
-- 資料表結構 `member`
--

CREATE TABLE `member` (
  `id` int(6) UNSIGNED NOT NULL,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `valid` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `member`
--

INSERT INTO `member` (`id`, `name`, `phone`, `email`, `account`, `password`, `create_time`, `valid`) VALUES
(1, 'Sarah Hunter', '0948756390', 'shunter@test.com', 'shunter', '', '2021-06-21 17:33:50', 1),
(2, 'Amy Allpress', '0987904725', 'aallpress@test.com', 'aallpress', '', '2021-06-21 17:44:19', 1),
(3, 'Aidan Ollery', '0984736253', 'aollery@test.com', 'aollery', '', '2021-06-21 17:46:08', 1),
(4, 'Holly Homblette', '0985749032', 'hhomblette@test.com', 'hhomblette', '', '2021-06-21 17:50:31', 1),
(5, 'Mat', '0985904837', 'mat@test.com', 'mat', '', '2021-06-21 19:06:11', 1),
(6, 'Savana', '0985904887', 'savana@test.com', 'savana', '', '2021-06-21 19:06:11', 1),
(7, 'Haley', '0985004837', 'haley@test.com', 'haley', '', '2021-06-21 19:06:11', 1),
(8, 'Mark Spencer', '0987653782', 'mspencer@test.com', 'mspencer', '', '2021-06-21 19:31:45', 1),
(9, 'John Lewis', '0987489508', 'jlewis@test.com', 'jlewis', '', '2021-06-21 19:58:04', 1),
(10, 'Adriana Chung', '0984736209', 'achung@test.com', 'achung', '', '2021-06-21 20:45:55', 1),
(11, 'Avex', NULL, 'avex@test.com', 'avex', '827ccb0eea8a706c4c34a16891f84e7b', '2021-06-22 16:56:08', 0),
(12, 'Jason Becker', '0948573629', 'jbecker@test.com', 'jbecker', '', '2021-06-22 17:46:08', 1),
(13, 'Jay', '0948736254', 'jay@test.com', 'jay', '', '2021-06-24 09:58:37', 1),
(14, 'Travis', '09487366854', 'travis@test.com', 'travis', '', '2021-06-24 10:24:05', 1),
(16, 'Chole', '0938290472', 'chole@test.com', 'chole', '12345', '2021-06-25 03:44:12', 1),
(17, 'Victor', '0938736253', 'victor@test.com', 'victor', '12345', '2021-06-25 04:19:21', 1),
(18, 'Sarah Hunter', '0911223344', 'sarah@test.com', 'sarah', '', NULL, 0),
(19, 'aaaapp', '0987654321', 'aaa@test.com', 'aaa', '', '2021-07-05 22:03:11', 1),
(20, '王一一', '0987654321', 'wang@test.com', 'wangyiyi', '', '2021-07-16 14:44:16', 0),
(21, 'TianTian', '0911111111', 'tian@test.com', 'tiantian', '', '2021-07-16 15:02:28', 1),
(22, '李毓芬', '033333333', 'naaaaa@test.com', 'naaaaaa', NULL, '2021-07-20 16:01:11', 1);

-- --------------------------------------------------------

--
-- 資料表結構 `orders`
--

CREATE TABLE `orders` (
  `id` int(5) NOT NULL COMMENT '流水號',
  `OrderNum` int(5) NOT NULL COMMENT '訂單編號',
  `OrderDate` datetime NOT NULL COMMENT '日期',
  `OrderUser` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '訂購人',
  `Coupon` int(5) DEFAULT NULL COMMENT '優惠券',
  `Item` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '購買物品',
  `TotalPrice` int(6) NOT NULL COMMENT '總金額'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 傾印資料表的資料 `orders`
--

INSERT INTO `orders` (`id`, `OrderNum`, `OrderDate`, `OrderUser`, `Coupon`, `Item`, `TotalPrice`) VALUES
(1, 1, '2021-07-12 16:36:36', '許孟哲', NULL, '卡卡頌2.0', 1160),
(2, 2, '2021-07-12 17:54:56', '廖儀睿', NULL, '四季物語', 1650),
(3, 3, '2021-07-17 19:22:08', '吳星清', NULL, '屠龍矮人', 1250),
(4, 4, '2021-07-13 04:50:00', '韓博鈞', NULL, '傳說的碎片', 590),
(5, 5, '2021-07-13 05:24:00', '梁豪英', NULL, '農場大亨', 390),
(6, 6, '2021-07-13 05:24:00', '李怡雯', NULL, '電力公司', 690),
(7, 7, '2021-07-13 05:24:00', '楊玉鳳', NULL, '魔城馬車', 490),
(8, 8, '2021-07-13 05:24:00', '夏碧秋', NULL, 'UNO', 345),
(9, 9, '2021-07-13 05:32:00', '楊智原', NULL, '十全十美', 510),
(10, 10, '2021-07-15 22:16:00', '吳婉玲', NULL, '火車大亨', 765),
(11, 11, '2021-07-15 22:29:00', '高禹惠', NULL, '消失的主角', 830),
(12, 12, '2021-07-15 22:30:00', '李俊季', NULL, '誰是牛頭王', 590),
(13, 13, '2021-07-17 19:36:00', '林志玲', NULL, '堆積木', 450),
(14, 14, '2021-07-13 05:24:00', '蘇良恬', NULL, '鈕鈕相扣', 343),
(15, 15, '2021-07-13 05:24:00', '陳若書', NULL, '黑白棋', 690),
(16, 16, '2021-07-13 05:24:00', '李季柏', NULL, '瘋狂地下城', 351),
(17, 17, '2021-07-13 05:24:00', '陳宏育', NULL, '德國蟑螂', 490),
(18, 18, '2021-07-16 05:41:00', '方淑卿', NULL, '數獨', 413),
(19, 19, '2021-07-14 19:22:19', '吳芝順', NULL, '古墓企鵝', 1160),
(20, 20, '2021-07-13 19:22:22', '傅于枝', NULL, '三國殺', 1599),
(21, 21, '2021-07-11 19:22:26', '曹香維', NULL, '目擊者之夜', 390),
(22, 22, '2021-07-01 19:22:28', '吳雅琳', NULL, '作弊飛蛾', 490),
(23, 222, '2021-07-21 11:04:00', 'dddd', 1, 'dcdcd', 500);

-- --------------------------------------------------------

--
-- 資料表結構 `product`
--

CREATE TABLE `product` (
  `id` int(5) UNSIGNED NOT NULL,
  `game_name` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `game_category` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `intro` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(6) UNSIGNED NOT NULL,
  `picture` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valid` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `product`
--

INSERT INTO `product` (`id`, `game_name`, `game_category`, `intro`, `price`, `picture`, `valid`) VALUES
(1, '卡卡頌2.0', '策略', '卡卡頌(Carcassonne)是一款容易上手又好玩的桌遊，屬於經典之作，也出了許多擴充版本，本文是介紹最基本的版本。玩家會輪流抽地圖板塊放到桌面上，並選擇要不要擺放自己手上的【米寶】(棋子)到剛剛出的板塊上。根據米寶擺放的位置不同，會有4種職業，不同職業獲得的分數不一樣。當玩家完成板塊上的建築後，就可以取回米寶並獲得分數。透過反覆擺放板塊和米寶，卡卡頌地圖會不斷擴張，玩家也會累積自己的積分，遊戲最後是分數最高的玩家獲勝。卡卡頌領地會因為擺放的方式不同而長得不一樣，因此每次玩都會有新的樂趣。', 1160, '卡卡頌2.0.png', 1),
(2, '四季物語', '策略', '四季物語是一個經典的卡牌與骰子相結合遊戲，玩家在這個遊戲裡需要召喚各式各樣的強大魔法牌來讓他們為你工作，通過他們獲得最多的水晶，成為新的大魔法師。遊戲過程中分為兩個階段，輪抽階段和回合階段，輪抽階段會通過輪抽（每位玩家抽取9張卡牌，然後從中選擇一張將剩餘的卡牌傳遞給下一個玩家，以此循環直到每個人手裡有新的九張牌）的方式決定玩家各自的起始手牌和藏書（新的一年開始時獲得的卡牌）。之後就是正式的遊戲環節了，由一號位玩家開始，每個玩家先選擇一個骰子，獲取上面的資源（元素，分數，召喚上限，又或是牌）然後開始自己的回', 1650, '四季物語.png', 1),
(3, '屠龍矮人', '策略', '遊戲人數：2人(BDG論壇有多人的變體規則)\r\n遊戲時間：30分鐘\r\n「屠龍矮人(Drako)」遊戲為2011年由Adam Kaluza所設計的主題遊戲，並入圍2011年金畸獎最佳兩人桌上遊戲獎項。遊戲中玩家分別扮演令當地居民聞風色變的紅色巨龍及欲將此紅色巨龍消滅殆盡的三個矮人，雙方並進行一場驚天動地的生死決鬥。', 1250, '屠龍矮人.png', 1),
(4, '三國殺', '紙牌', '相信\"三國\"是一個家域戶曉名詞，三國殺是一個以三國時代為背景，集角色扮演、戰鬥、偽裝等要素于一體的多人卡片遊戲。玩家可以通過在遊戲裡扮演不同身份的角色，隱藏自己，尋找同伴，並運用各是不同的技能擊敗敵對勢力，得到最後的勝利，創造一個屬於自己的三國傳奇。', 1599, '三國殺.png', 1),
(5, 'UNO', '紙牌', '獨一無二UNO擊卡樂，結合了基本的UNO紙牌遊戲，更加上了出人意表且隨機的刺激性！', 1199, 'UNO.png', 1),
(6, '翻滾刺蝟', '紙牌', '在厚厚的樹冠下，小刺蝟急著趕回自己舒適的家。\r\n在森林中滾動毛絨絨的刺蝟，收集有魔鬼氈的蘋果、樹葉和蘑菇，這些森林特產讓刺蝟可以沿著林中小徑前進，快快回家。\r\n每場遊戲開始前，構建好森林小徑，然後選擇競賽模式來一較高下，或是採用合作模式，一同躲避緊追而來的狐狸。\r\n適合年紀：4y+\r\n遊戲人數：1-4人\r\n遊戲時間：20 mins', 890, '翻滾刺蝟.png', 1),
(7, '誰是牛頭王', '紙牌', '誰是牛頭王(Take 6)是一款輕鬆又簡單的小品桌遊。桌遊內容非常簡單，只有104張數字牌。遊戲規則和撲克牌的接龍很類似，要依序將數字牌銜接上去，不過又多了幾個小規則和計分方式，讓遊戲的複雜度稍微提高一點。誰是牛頭王需要一點數學頭腦去算牌，如果認真玩的話，也會稍微燒一點腦力。\r\n\r\n遊戲人數：2~10人\r\n最佳人數：5~6人\r\n準備時間：10分鐘以內\r\n遊戲時間：45分鐘\r\n遊戲類型：紙牌，數字', 590, '誰是牛頭王.png', 1),
(8, '火車大亨', '棋盤', '火車帶來龐大財富利潤，眾多的投資客迫不及待的想加入市場，投資優良的火車頭、採購多種款式的車廂，並用火車帶來的收益開啟下一次的交易，究竟在這錢滾錢的戰場上，誰能成為最大的贏家呢？', 765, '火車大亨.png', 1),
(9, '消失的主角', '棋盤', '「消失的主角」是一款考驗想像力的遊戲。遊戲中，你必須畫圖，讓其他玩家看圖猜謎，但並不是要畫出「主角」讓大家猜，而是畫出主角周圍的環境、情境，讓其他人猜出你的「主角」是什麼！\r\n若想贏得勝利，聰明構圖和盡情猜測比做個稱職的畫家來得更重要！', 830, '消失的主角.png', 1),
(10, '黑白棋', '棋盤', '黑白棋在西方和日本是很流行的桌面棋類遊戲。通過相互翻轉對方的棋子，最後以棋盤上誰的棋子多來判斷勝負。\r\n遊戲規則簡單，因此上手很容易，但它的變化又非常複雜。有一種說法是：只需要幾分鐘學會它，卻需要一生的時間去精通它。\r\n相傳為19世紀末的英國人發明，用莎士比亞名劇奧賽羅（Othello）為其命名，發展至今成為現在通行的黑白棋。\r\n奧賽羅是莎士比亞一個名劇的男主角。他是一個黑人，妻子是白人，因受小人挑撥，懷疑妻子不忠一直情海翻波，最終親手把妻子殺死。後來真相大白，奧賽羅懊悔不已，自殺而死。黑白棋就是借用這個', 690, '黑白棋.png', 1),
(11, '作弊飛蛾', '策略', '684641651', 690, '作弊飛蛾.png', 1),
(12, '打貼紙', '紙牌', '6469165232020', 590, '打貼紙.jpg', 1),
(13, '鈕鈕相扣', '紙牌', 'rpojgpoaqkmg', 590, '鈕鈕相扣.png', 0),
(14, '作弊飛蛾', '策略', '416103', 590, '作弊飛蛾.png', 0),
(15, '作弊飛蛾', '策略', '1231', 0, '作弊飛蛾.png', 0),
(16, '作弊飛蛾', '紙牌', '536743', 590, '作弊飛蛾.png', 0),
(17, 'aaaaa', '棋盤', 'cdcdcdcd', 17000, '', 1);

-- --------------------------------------------------------

--
-- 資料表結構 `users`
--

CREATE TABLE `users` (
  `id` int(6) UNSIGNED NOT NULL,
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `account` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `coupon` varchar(50) NOT NULL,
  `create_time` datetime NOT NULL,
  `valid` int(2) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `users`
--

INSERT INTO `users` (`id`, `name`, `account`, `password`, `email`, `phone`, `coupon`, `create_time`, `valid`) VALUES
(1, 'joe', 'joe01', 'joe12345', 'joe01@test.com', '09111111111', '15%off,25%off,50%off', '2021-07-12 08:50:44', 1),
(2, 'jack', 'jack02', 'jack12345', 'jack02@test.com', '092222222222', '15%off,25%off,50%off', '2021-07-12 08:50:44', 1),
(3, 'jarry', 'jarry03', 'jarry12345', 'jarry03@test.com', '093333333', '15%off,25%off,50%off', '2021-07-12 08:50:44', 1),
(4, 'kayta', 'kayta04', 'kayta12345', 'kayta04@test.com', '094444444', '15%off,25%off,50%off', '2021-07-12 08:50:44', 1),
(5, 'ytwqw', 'ytwqw05', 'ytwqw12345', 'ytwqw05@test.com', '095555555555', '15%off,25%off,50%off', '2021-07-12 08:50:44', 1),
(6, 'griffen', 'griffen06', 'griffen12345', 'griffen06@test.com', '09666666666', '15%off,25%off,50%off', '2021-07-12 08:50:44', 1),
(7, 'harry', 'harry07', 'harry12345', 'harry07@test.com', '0977777777', '15%off,25%off,50%off', '2021-07-12 08:50:44', 1),
(8, 'haelds', 'haelds08', 'haelds12345', 'haelds08@test.com', '098888888888', '15%off,25%off,50%off', '2021-07-12 08:50:44', 1),
(9, 'qurew', 'qurew09', 'qurew12345', 'qurew09@test.com', '09999999999999', '15%off,25%off,50%off', '2021-07-12 08:50:44', 1),
(10, 'elen', 'elen10', 'elen12345', 'elen10@test.com', '09000000000', '15%off,25%off,50%off', '2021-07-12 08:50:44', 1),
(11, 'tyrew', 'tyrew11', 'tyrew12345', 'tyrew11@test.com', '0910101010', '15%off,25%off,50%off', '2021-07-12 08:50:44', 1),
(12, 'yellow', 'yellow12', 'yellow', 'yellow12@test.com', '0912112121212', '15%off,25%off,50%off', '2021-07-12 08:50:44', 1),
(13, 'buttty', 'buttty13', 'buttty12345', 'buttty13@test.com', '091313131313', '15%off,25%off,50%off', '2021-07-12 08:50:44', 1),
(14, 'varty', 'varty14', 'varty12345', 'varty14@test.com', '09141411414', '15%off,25%off,50%off', '2021-07-12 08:50:44', 1);

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `coupon_master`
--
ALTER TABLE `coupon_master`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `coupon_user`
--
ALTER TABLE `coupon_user`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `emp_info`
--
ALTER TABLE `emp_info`
  ADD PRIMARY KEY (`e_id`);

--
-- 資料表索引 `forum_article`
--
ALTER TABLE `forum_article`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `game_choose`
--
ALTER TABLE `game_choose`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `game_forum`
--
ALTER TABLE `game_forum`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `game_room`
--
ALTER TABLE `game_room`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `category`
--
ALTER TABLE `category`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `coupon_master`
--
ALTER TABLE `coupon_master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `coupon_user`
--
ALTER TABLE `coupon_user`
  MODIFY `id` int(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `emp_info`
--
ALTER TABLE `emp_info`
  MODIFY `e_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `forum_article`
--
ALTER TABLE `forum_article`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `game_choose`
--
ALTER TABLE `game_choose`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `game_forum`
--
ALTER TABLE `game_forum`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `game_room`
--
ALTER TABLE `game_room`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `member`
--
ALTER TABLE `member`
  MODIFY `id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT COMMENT '流水號', AUTO_INCREMENT=24;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `product`
--
ALTER TABLE `product`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `users`
--
ALTER TABLE `users`
  MODIFY `id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;