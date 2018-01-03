-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 13, 2017 at 05:08 PM
-- Server version: 10.1.16-MariaDB
-- PHP Version: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shopping`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `creationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationDate` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `creationDate`, `updationDate`) VALUES
(1, 'admin', '5c428d8875d2948607f3e3fe134d71b4', '2017-01-24 16:21:18', '25-01-2017 12:05:43 AM');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `categoryName` varchar(255) NOT NULL,
  `categoryDescription` longtext NOT NULL,
  `creationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationDate` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `categoryName`, `categoryDescription`, `creationDate`, `updationDate`) VALUES
(9, 'RICE', 'Rise is the main agricultural product in this county so.', '2017-11-06 00:11:26', '06-11-2017 05:43:40 AM'),
(10, 'FRUIT', 'The second product fruit is valuable product.', '2017-11-06 00:12:40', ''),
(11, 'VEGETABLE', 'vegetable product goes under this.', '2017-11-06 00:13:20', '');

-- --------------------------------------------------------

--
-- Table structure for table `desease`
--

CREATE TABLE `desease` (
  `id` int(11) NOT NULL,
  `DeseaseName` varchar(255) NOT NULL,
  `category_id` int(11) NOT NULL,
  `sub_cat_id` int(11) NOT NULL,
  `DeseaseshortDescription` text NOT NULL,
  `DeseaselongDescription` text NOT NULL,
  `Deseaseremedy` text NOT NULL,
  `Deseaseimage1` varchar(255) NOT NULL,
  `Deseaseimage2` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `desease`
--

INSERT INTO `desease` (`id`, `DeseaseName`, `category_id`, `sub_cat_id`, `DeseaseshortDescription`, `DeseaselongDescription`, `Deseaseremedy`, `Deseaseimage1`, `Deseaseimage2`) VALUES
(9, 'Bacteria', 11, 29, 'demo<br>', 'demo                                                    ', 'demo                                                    ', 'bbdscctgrtia.jpg', 'bacterial-a.jpg'),
(10, 'Fungi', 9, 19, 'demo<br>', 'demo                                                    ', 'demo                                                    ', '54-CropProtection Fig7B.jpg', 'Fig01_Gib_Corn.jpg'),
(11, 'Abhide', 9, 15, 'Plant diseases have caused severe losses to humans in several ways', 'Plant diseases have caused severe losses to humans in several ways. \r\nStarvation and uprooting of families resulted from the Irish famine \r\ncaused by potato late blight (caused by <i>Phytophthora infestans</i>). A valued resource was lost with the virtual elimination of the American chestnut by chestnut blight (caused by <i>Cryphonectria parasitica</i>).\r\n And direct economic loss such as the estimated one billion dollars lost\r\n in one year to American corn growers from southern corn leaf blight \r\n(caused by <i>Cochliobolus maydis</i>, anamorph <i>Bipolaris maydis</i>).\r\n Many plant diseases cause less dramatic losses annually throughout the \r\nworld but collectively constitute sizable losses to farmers and can \r\nreduce the aesthetic values of landscape plants and home gardens.                                                    ', '<p>Plant diseases have caused severe losses to humans in several ways. \r\nStarvation and uprooting of families resulted from the Irish famine \r\ncaused by potato late blight (caused by <i>Phytophthora infestans</i>). A valued resource was lost with the virtual elimination of the American chestnut by chestnut blight (caused by <i>Cryphonectria parasitica</i>).\r\n And direct economic loss such as the estimated one billion dollars lost\r\n in one year to American corn growers from southern corn leaf blight \r\n(caused by <i>Cochliobolus maydis</i>, anamorph <i>Bipolaris maydis</i>).\r\n Many plant diseases cause less dramatic losses annually throughout the \r\nworld but collectively constitute sizable losses to farmers and can \r\nreduce the aesthetic values of landscape plants and home gardens.</p>\r\n<p>The goal of plant disease management is to reduce the economic and \r\naesthetic damage caused by plant diseases. Traditionally, this has been \r\ncalled plant disease control, but current social and environmental \r\nvalues deem â€œcontrolâ€ as being absolute and the term too rigid. More \r\nmultifaceted approaches to disease management, and integrated disease \r\nmanagement, have resulted from this shift in attitude, however. Single, \r\noften severe, measures, such as pesticide applications, soil fumigation \r\nor burning are no longer in common use. Further, disease management \r\nprocedures are frequently determined by disease forecasting or disease \r\nmodeling rather than on either a calendar or prescription basis. Disease\r\n management might be viewed as proactive whereas disease control is \r\nreactive, although it is often difficult to distinquish between the two \r\nconcepts, especially in the application of specific measures.</p>                                                    ', 'Aphid.jpg', 'cabbage.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `productId` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `orderDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `paymentMethod` varchar(50) DEFAULT NULL,
  `orderStatus` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `userId`, `productId`, `quantity`, `orderDate`, `paymentMethod`, `orderStatus`) VALUES
(1, 8, '26', 5, '2017-11-06 02:24:46', 'COD', NULL),
(2, 8, '28', 13, '2017-11-06 02:24:46', 'COD', NULL),
(3, 8, '29', 2, '2017-11-06 02:24:46', 'COD', NULL),
(4, 8, '30', 1, '2017-11-06 02:24:46', 'COD', NULL),
(5, 8, '31', 1, '2017-11-06 02:24:46', 'COD', NULL),
(6, 8, '32', 6, '2017-11-06 02:24:46', 'COD', NULL),
(7, 8, '33', 2, '2017-11-06 02:24:46', 'COD', NULL),
(8, 8, '34', 1, '2017-11-06 02:24:46', 'COD', NULL),
(9, 8, '35', 1, '2017-11-06 02:24:46', 'COD', NULL),
(10, 8, '36', 3, '2017-11-06 02:24:46', 'COD', 'Delivered'),
(11, 8, '37', 2, '2017-11-06 02:24:46', 'COD', NULL),
(12, 9, '36', 1, '2017-11-06 14:57:42', 'COD', NULL),
(13, 9, '37', 1, '2017-11-06 14:57:42', 'COD', NULL),
(14, 10, '32', 4, '2017-11-06 18:51:54', 'COD', 'Delivered'),
(15, 10, '37', 1, '2017-11-06 18:51:54', 'COD', NULL),
(16, 10, '26', 1, '2017-11-06 18:56:46', 'COD', NULL),
(17, 8, '35', 1, '2017-11-10 09:22:34', 'COD', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ordertrackhistory`
--

CREATE TABLE `ordertrackhistory` (
  `id` int(11) NOT NULL,
  `orderId` int(11) NOT NULL,
  `status` varchar(255) NOT NULL,
  `remark` mediumtext NOT NULL,
  `postingDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ordertrackhistory`
--

INSERT INTO `ordertrackhistory` (`id`, `orderId`, `status`, `remark`, `postingDate`) VALUES
(1, 10, 'Delivered', 'Delivery successfull', '2017-11-06 15:01:59'),
(2, 14, 'Delivered', 'This is develweredc', '2017-11-06 19:01:21');

-- --------------------------------------------------------

--
-- Table structure for table `productreviews`
--

CREATE TABLE `productreviews` (
  `id` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `quality` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `value` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `summary` varchar(255) NOT NULL,
  `review` longtext NOT NULL,
  `reviewDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `category` int(11) NOT NULL,
  `subCategory` int(11) NOT NULL,
  `productName` varchar(255) NOT NULL,
  `productCompany` varchar(255) NOT NULL,
  `productPrice` int(11) NOT NULL,
  `productPriceBeforeDiscount` int(11) NOT NULL,
  `productDescription` longtext NOT NULL,
  `productImage1` varchar(255) NOT NULL,
  `productImage2` varchar(255) NOT NULL,
  `productImage3` varchar(255) NOT NULL,
  `shippingCharge` int(11) NOT NULL,
  `productAvailability` varchar(255) NOT NULL,
  `postingDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationDate` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category`, `subCategory`, `productName`, `productCompany`, `productPrice`, `productPriceBeforeDiscount`, `productDescription`, `productImage1`, `productImage2`, `productImage3`, `shippingCharge`, `productAvailability`, `postingDate`, `updationDate`) VALUES
(26, 9, 15, 'Bashmoti Rice', 'A/c', 90, 100, '<b>Basmati</b> is a variety of long, slender-grained aromatic <a href="https://en.wikipedia.org/wiki/Rice" title="Rice">rice</a> which is traditionally from the <a href="https://en.wikipedia.org/wiki/Indian_subcontinent" title="Indian subcontinent">Indian subcontinent</a>. As of 2014, India exported 59 percent of the overseas basmati rice \r\nmarket, while Pakistan accounted for the remainder, according to the \r\nstate-run Agricultural and Processed Food Products Export Development \r\nAuthority. However, many countries use domestically grown basmati rice \r\ncrops', 'basmati-a.jpg', 'basmoti-b.jpg', 'basmoti-3.jpg', 40, 'In Stock', '2017-11-06 00:48:19', ''),
(28, 9, 19, 'Kalijira Rice', 'Online Agricultre System Lt.', 90, 100, '<span class="st"><em>Kalijira rice</em> is very special premium long-grain white rice on a miniature scale, like a baby basmati. It is grown in Dinajpur, <em>Bangladesh</em>, and has tiny rice cooks</span>', 'kali-c.jpg', 'kali-d.jpg', 'kali-e.jpg', 40, 'In Stock', '2017-11-06 01:05:25', ''),
(29, 9, 20, 'Chinigura Rice ', 'Online Agricultre System Lt.', 90, 100, '<span class="st"><em>Kalijira rice</em> is very special premium long-grain white rice on a miniature scale, like a baby basmati. It is grown in Dinajpur, <em>Bangladesh</em>, and has tiny rice cooks</span>', 'medium_grain_rice.png', 'white_long_grain_3.png', 'jasmine_rice_2.png', 40, 'In Stock', '2017-11-06 01:07:31', ''),
(30, 9, 16, 'Brri Dhan Rice', 'Online Agricultre System Lt.', 90, 100, '<span class="st"><em>Biri rice</em> is very special premium long-grain white rice on a miniature scale, like a baby basmati. It is grown in Dinajpur, <em>Bangladesh</em>, and has tiny rice cooks</span>', 'medium_grain_rice.png', 'white_long_grain_3-4.png', 'medium_grain_rice.png', 40, 'In Stock', '2017-11-06 01:12:01', ''),
(31, 9, 21, 'Lalam Dhan RIce', 'Online Agricultre System Lt.', 90, 100, '<span class="st"><em>Balam rice</em> is very special premium long-grain white rice on a miniature scale, like a baby basmati. It is grown in Dinajpur, <em>Bangladesh</em>, and has tiny rice cooks</span>', 'medium_grain_rice.png', 'short-grain_rice.jpg', 'white_long_grain_3.png', 40, 'In Stock', '2017-11-06 01:13:24', ''),
(32, 10, 22, 'Mango', 'Online Agricultre System Lt.', 140, 150, 'Description for Mango Himsagar, Aam Himsagar The tropical fruit is called the <span class="st">. It is grown in Dinajpur, <em>Bangladesh</em>, and has tiny rice cooks.</span>', 'index.jpg', 'Mango-tree.jpg', 'nurserylive-mango-plant.jpg', 40, 'In Stock', '2017-11-06 01:17:52', ''),
(33, 10, 23, 'Banana', 'Online Agricultre System Lt.', 90, 150, '<span class="st">The banana is an edible fruit â€“ botanically a berry â€“ \r\nproduced by several kinds of large ...... "Herkunft, DiversitÃ¤t und \r\nZÃ¼chtung der <em>Banane</em> und kultivierter Zitrusarten (Origin, diversity and breeding of banana and cultivated citrus)" (PDF). Journal&nbsp;...</span>', 'banana.jpg', 'banane.jpg', 'b-a.jpg', 40, 'In Stock', '2017-11-06 01:21:02', ''),
(34, 10, 24, 'Jackfruit', 'Online Agricultre System Lt.', 280, 300, 'Jakfruit. Origin: India. One of a very few fruits that contain protein \r\nand can grow up to 70 kilograms. It tastes like sweet candied banana and\r\n pineapple.', 'jackfruits1.jpg', 'jakfruit-800-2.jpg', 'Jackfruit-450w.jpg', 40, 'In Stock', '2017-11-06 01:23:30', ''),
(35, 11, 31, 'Bottle Gourd', 'Online Agricultre System Lt.', 140, 200, '<span class="st" data-hveid="43" data-ved="0ahUKEwjJ_dWh5qjXAhXJOI8KHXMMDfsQ4EUIKzAA">The calabash, <em>bottle gourd</em>, or white-flowered <em>gourd</em>, Lagenaria siceraria (synonym Lagenaria vulgaris Ser.), also known by many other names that include: opo <em>squash</em> (from Tagalog: upo), long melon, suzza melon,</span>', 'tanindo-hybrid-b1.jpg', 'tanindo-bottle-gourd-a.jpg', 'bsgfshy.jpg', 40, 'In Stock', '2017-11-06 01:31:36', ''),
(36, 11, 29, 'Tomato', 'Online Agricultre System Lt.', 140, 150, '<span class="st" data-hveid="43" data-ved="0ahUKEwjJ_dWh5qjXAhXJOI8KHXMMDfsQ4EUIKzAA">The calabash, <em>bottle gourd</em>, or white-flowered <em>gourd</em>, Lagenaria siceraria (synonym Lagenaria vulgaris Ser.), also known by many other names that include: opo <em>squash</em> (from Tagalog: upo), long melon, suzza melon,</span>', 'tomatbbo.jpg', 'tomato-1.jpg', 'tttttmoto.jpg', 40, 'In Stock', '2017-11-06 01:35:20', ''),
(37, 11, 30, 'Brinjal', 'Online Agricultre System Lt.', 140, 150, '<span class="st" data-hveid="43" data-ved="0ahUKEwjJ_dWh5qjXAhXJOI8KHXMMDfsQ4EUIKzAA">The calabash, <em>bottle gourd</em>, or white-flowered <em>gourd</em>, Lagenaria siceraria (synonym Lagenaria vulgaris Ser.), also known by many other names that include: opo <em>squash</em> (from Tagalog: upo), long melon, suzza melon,</span>', 'Fresh-Brinjal.png', 'brinjal_long.jpg', 'bbbnjl.jpg', 40, 'In Stock', '2017-11-06 01:37:10', '');

-- --------------------------------------------------------

--
-- Table structure for table `subcategory`
--

CREATE TABLE `subcategory` (
  `id` int(11) NOT NULL,
  `categoryid` int(11) NOT NULL,
  `subcategory` varchar(255) NOT NULL,
  `creationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationDate` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subcategory`
--

INSERT INTO `subcategory` (`id`, `categoryid`, `subcategory`, `creationDate`, `updationDate`) VALUES
(14, 8, 'demo', '2017-11-05 07:10:03', ''),
(15, 9, 'Bashmoti Rice', '2017-11-06 00:19:46', ''),
(16, 9, 'BINA Dhan', '2017-11-06 00:20:20', ''),
(17, 9, 'BRRI Dhan', '2017-11-06 00:20:39', ''),
(18, 9, 'Binni Rice', '2017-11-06 00:20:55', ''),
(19, 9, 'Kalijira Rice', '2017-11-06 00:21:11', ''),
(20, 9, 'Chinigura Rice', '2017-11-06 00:21:32', ''),
(21, 9, 'Balam Dhan', '2017-11-06 00:22:00', ''),
(22, 10, 'Mango', '2017-11-06 00:23:58', ''),
(23, 10, 'Banana', '2017-11-06 00:24:20', ''),
(24, 10, 'Jackfruit', '2017-11-06 00:24:35', ''),
(25, 10, 'Pineapple', '2017-11-06 00:24:57', ''),
(26, 10, 'Guava', '2017-11-06 00:25:16', ''),
(27, 10, 'Pomelo', '2017-11-06 00:25:40', ''),
(28, 10, 'Papaya', '2017-11-06 00:26:06', ''),
(29, 11, 'Tomato', '2017-11-06 00:26:36', ''),
(30, 11, 'Brinjal', '2017-11-06 00:26:57', '06-11-2017 06:05:34 AM'),
(31, 11, ' Bottle gourd', '2017-11-06 00:27:22', ''),
(32, 11, 'Tomato', '2017-11-06 00:28:22', '');

-- --------------------------------------------------------

--
-- Table structure for table `userlog`
--

CREATE TABLE `userlog` (
  `id` int(11) NOT NULL,
  `userEmail` varchar(255) NOT NULL,
  `userip` binary(16) NOT NULL,
  `loginTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `logout` varchar(255) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userlog`
--

INSERT INTO `userlog` (`id`, `userEmail`, `userip`, `loginTime`, `logout`, `status`) VALUES
(36, 'jk@gmail.com', 0x3132372e302e302e3100000000000000, '2017-11-05 06:19:15', '', 0),
(37, 'j@gmail.com', 0x3132372e302e302e3100000000000000, '2017-11-05 06:20:04', '', 1),
(38, 'j@gmail.com', 0x3132372e302e302e3100000000000000, '2017-11-06 02:24:12', '', 1),
(39, 'abc@gmail.com', 0x3132372e302e302e3100000000000000, '2017-11-06 14:57:16', '06-11-2017 11:32:50 PM', 1),
(40, 'jon@gmail.com', 0x3132372e302e302e3100000000000000, '2017-11-06 18:50:47', '', 1),
(41, 'jk@gmail.com', 0x3132372e302e302e3100000000000000, '2017-11-06 19:38:20', '', 0),
(42, 'j@gmail.com', 0x3132372e302e302e3100000000000000, '2017-11-10 09:22:18', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `contactno` bigint(11) NOT NULL,
  `password` varchar(255) NOT NULL,
  `shippingAddress` longtext NOT NULL,
  `shippingState` varchar(255) NOT NULL,
  `shippingCity` varchar(255) NOT NULL,
  `shippingPincode` int(11) NOT NULL,
  `billingAddress` longtext NOT NULL,
  `billingState` varchar(255) NOT NULL,
  `billingCity` varchar(255) NOT NULL,
  `billingPincode` int(11) NOT NULL,
  `regDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationDate` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `contactno`, `password`, `shippingAddress`, `shippingState`, `shippingCity`, `shippingPincode`, `billingAddress`, `billingState`, `billingCity`, `billingPincode`, `regDate`, `updationDate`) VALUES
(8, 'Jonayed', 'j@gmail.com', 123456, '827ccb0eea8a706c4c34a16891f84e7b', '66/1 raj narayon dhor road, posta , lalbag , dhaka', 'dhakaegrht', 'dhaka', 12343, '66/1 , raj narayon dhro road', 'dhaka', 'dhak', 324, '2017-11-06 02:23:51', ''),
(9, 'Jonayeid', 'abc@gmail.com', 123456, '827ccb0eea8a706c4c34a16891f84e7b', '66/1 raj narayon dhor road, posta , lalbag , dhaka', 'dhaka atac', 'dhaka', 1234, '66/1 , raj narayon dhro road', 'dhak', 'dhakfdh', 2343, '2017-11-06 14:56:56', ''),
(10, 'Jonayed', 'jon@gmail.com', 345678, 'e2fc714c4727ee9395f324cd2e7f331f', '66/1 raj narayon dhor road, posta , lalbag , dhaka', 'dhakaegrht', 'dhaka atac', 8788, '66/1 , raj narayon dhro road', 'dhakfdh', 'dhak', 8757, '2017-11-06 18:50:29', '');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `postingDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `desease`
--
ALTER TABLE `desease`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ordertrackhistory`
--
ALTER TABLE `ordertrackhistory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `productreviews`
--
ALTER TABLE `productreviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subcategory`
--
ALTER TABLE `subcategory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `userlog`
--
ALTER TABLE `userlog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `desease`
--
ALTER TABLE `desease`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `ordertrackhistory`
--
ALTER TABLE `ordertrackhistory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `productreviews`
--
ALTER TABLE `productreviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;
--
-- AUTO_INCREMENT for table `subcategory`
--
ALTER TABLE `subcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT for table `userlog`
--
ALTER TABLE `userlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
