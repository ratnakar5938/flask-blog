-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 22, 2021 at 05:01 PM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 7.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `techie`
--

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `sno` int(11) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(30) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `msg` text NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`sno`, `name`, `email`, `phone`, `msg`, `date`) VALUES
(1, 'first post', 'rattu5938@gmail.com', '1234566789', '', '2021-06-16 09:18:13'),
(2, 'Ratnakar Sahoo', 'rattu5938@gmail.com', '9178842858', 'this is a sample', '2021-06-16 09:40:20'),
(7, 'rattu', 'bhoot@gmail.com', '9556653317', 'this is another email msg', '2021-06-19 21:24:10');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `sno` int(11) NOT NULL,
  `title` text NOT NULL,
  `slug` varchar(25) NOT NULL,
  `tagline` text NOT NULL,
  `content` text NOT NULL,
  `img_url` varchar(25) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`sno`, `title`, `slug`, `tagline`, `content`, `img_url`, `date`) VALUES
(1, 'Let\'s Learn About Quantum', 'first-post', 'Quantum physics is the study of matter and energy at its most fundamental level', 'In physics, a quantum (plural quanta) is the minimum amount of any physical entity (physical property) involved in an interaction. The fundamental notion that a physical property can be \"quantized\" is referred to as \"the hypothesis of quantization\".[1] This means that the magnitude of the physical property can take on only discrete values consisting of integer multiples of one quantum.\r\n\r\nFor example, a photon is a single quantum of light (or of any other form of electromagnetic radiation). Similarly, the energy of an electron bound within an atom is quantized and can exist only in certain discrete values. (Atoms and matter in general are stable because electrons can exist only at discrete energy levels within an atom.) Quantization is one of the foundations of the much broader physics of quantum mechanics. Quantization of energy and its influence on how energy and matter interact (quantum electrodynamics) is part of the fundamental framework for understanding and describing nature.', 'assets/img/quantum-bg.jpg', '2021-06-19 21:35:49'),
(2, 'More on Nuclear reactor', 'second-post', 'To initiate and control a fission nuclear chain reaction or nuclear fusion reactions', 'A nuclear reactor, formerly known as an atomic pile, is a device used to initiate and control a fission nuclear chain reaction or nuclear fusion reactions. Nuclear reactors are used at nuclear power plants for electricity generation and in nuclear marine propulsion. Heat from nuclear fission is passed to a working fluid (water or gas), which in turn runs through steam turbines. These either drive a ship\'s propellers or turn electrical generators\' shafts. Nuclear generated steam in principle can be used for industrial process heat or for district heating. Some reactors are used to produce isotopes for medical and industrial use, or for production of weapons-grade plutonium. As of early 2019, the IAEA reports there are 454 nuclear power reactors and 226 nuclear research reactors in operation around the world.', 'assets/img/nuclear-bg.jpg', '2021-06-21 20:12:48'),
(3, 'Let\'s know about Black Hole', 'third-post', 'Black holes are some of the strangest and most fascinating objects in outer space', 'A black hole is a region of spacetime where gravity is so strong that nothing—no particles or even electromagnetic radiation such as light—can escape from it.[1] The theory of general relativity predicts that a sufficiently compact mass can deform spacetime to form a black hole.[2][3] The boundary of no escape is called the event horizon. Although it has an enormous effect on the fate and circumstances of an object crossing it, according to general relativity it has no locally detectable features.[4] In many ways, a black hole acts like an ideal black body, as it reflects no light.[5][6] Moreover, quantum field theory in curved spacetime predicts that event horizons emit Hawking radiation, with the same spectrum as a black body of a temperature inversely proportional to its mass. This temperature is on the order of billionths of a kelvin for black holes of stellar mass, making it essentially impossible to observe directly.\r\n\r\nObjects whose gravitational fields are too strong for light to escape were first considered in the 18th century by John Michell and Pierre-Simon Laplace.[7] The first modern solution of general relativity that would characterize a black hole was found by Karl Schwarzschild in 1916, and its interpretation as a region of space from which nothing can escape was first published by David Finkelstein in 1958. Black holes were long considered a mathematical curiosity; it was not until the 1960s that theoretical work showed they were a generic prediction of general relativity. The discovery of neutron stars by Jocelyn Bell Burnell in 1967 sparked interest in gravitationally collapsed compact objects as a possible astrophysical reality. The first black hole known as such was Cygnus X-1, identified by several researchers independently in 1971.', 'assets/img/bhole-bg.jpg', '2021-06-21 22:02:22'),
(4, 'Know more about Dark Matter', 'fourth-post', 'Dark matter makes up about 27%', 'Dark matter is believed to be a form of matter thought to account for approximately 85% of the matter in the universe and about 27% of its total mass–energy density[1] or about 2.241×10−27 kg/m3. Its presence is implied in a variety of astrophysical observations, including gravitational effects that cannot be explained by accepted theories of gravity unless more matter is present than can be seen. For this reason, most experts think that dark matter is abundant in the universe and that it has had a strong influence on its structure and evolution. Dark matter is called dark because it does not appear to interact with the electromagnetic field, which means it does not absorb, reflect or emit electromagnetic radiation, and is therefore difficult to detect.[2]\r\n\r\nPrimary evidence for dark matter comes from calculations showing that many galaxies would fly apart, or that they would not have formed or would not move as they do, if they did not contain a large amount of unseen matter.[3] Other lines of evidence include observations in gravitational lensing[4] and in the cosmic microwave background, along with astronomical observations of the observable universe\'s current structure, the formation and evolution of galaxies, mass location during galactic collisions,[5] and the motion of galaxies within galaxy clusters. In the standard Lambda-CDM model of cosmology, the total mass–energy of the universe contains 5% ordinary matter and energy, 27% dark matter and 68% of a form of energy known as dark energy.[6][7][8][9] Thus, dark matter constitutes 85%[a] of total mass, while dark energy plus dark matter constitute 95% of total mass–energy content.[10][11][12][13]\r\n\r\nBecause dark matter has not yet been observed directly, if it exists, it must barely interact with ordinary baryonic matter and radiation, except through gravity. Most dark matter is thought to be non-baryonic in nature; it may be composed of some as-yet undiscovered subatomic particles.[b] The primary candidate for dark matter is some new kind of elementary particle that has not yet been discovered, in particular, weakly interacting massive particles (WIMPs).[14] Many experiments to directly detect and study dark matter particles are being actively undertaken, but none have yet succeeded.[15] Dark matter is classified as \"cold\", \"warm\", or \"hot\" according to its velocity (more precisely, its free streaming length).', 'assets/img/dark-bg.jpg', '2021-06-22 18:07:45'),
(5, 'Let\'s get started with Cloud computing', 'fifth-post', 'Cloud computing is the delivery of computing services', 'Cloud computing[1] is the on-demand availability of computer system resources, especially data storage (cloud storage) and computing power, without direct active management by the user.[2] The term is generally used to describe data centers available to many users over the Internet.[3] Large clouds, predominant today, often have functions distributed over multiple locations from central servers. If the connection to the user is relatively close, it may be designated an edge server.\r\n\r\nClouds may be limited to a single organization (enterprise clouds[4][5]), or be available to multiple organizations (public cloud).\r\n\r\nCloud computing relies on sharing of resources to achieve coherence and economies of scale.\r\n\r\nAdvocates of public and hybrid clouds note that cloud computing allows companies to avoid or minimize up-front IT infrastructure costs. Proponents also claim that cloud computing allows enterprises to get their applications up and running faster, with improved manageability and less maintenance, and that it enables IT teams to more rapidly adjust resources to meet fluctuating and unpredictable demand,[5][6][7] providing the burst computing capability: high computing power at certain periods of peak demand.[8]\r\n\r\nCloud providers typically use a \"pay-as-you-go\" model, which can lead to unexpected operating expenses if administrators are not familiarized with cloud-pricing models.[9]\r\n\r\nThe availability of high-capacity networks, low-cost computers and storage devices as well as the widespread adoption of hardware virtualization, service-oriented architecture and autonomic and utility computing has led to growth in cloud computing.[10][11][12] As of 2017, most cloud computers run a Linux-based operating system.[13]', 'assets/img/cloud-bg.jpg', '2021-06-21 22:12:45'),
(6, 'Know more on IOT', 'sixth-post', 'The internet of things, or IoT, is a system of interrelated computing devices, mechanical and digital machines', 'The Internet of things (IoT) describes the network of physical objects—a.k.a. \"things\"—that are embedded with sensors, software, and other technologies for the purpose of connecting and exchanging data with other devices and systems over the Internet.[1][2][3][4]\r\n\r\nThings have evolved due to the convergence of multiple technologies, real-time analytics, machine learning, ubiquitous computing, commodity sensors, and embedded systems.[1] Traditional fields of embedded systems, wireless sensor networks, control systems, automation (including home and building automation), and others all contribute to enabling the Internet of things. In the consumer market, IoT technology is most synonymous with products pertaining to the concept of the \"smart home\", including devices and appliances (such as lighting fixtures, thermostats, home security systems and cameras, and other home appliances) that support one or more common ecosystems, and can be controlled via devices associated with that ecosystem, such as smartphones and smart speakers. The IoT can also be used in healthcare systems.[5]\r\n\r\nThere are a number of serious concerns about dangers in the growth of the IoT, especially in the areas of privacy and security, and consequently industry and governmental moves to address these concerns have begun including the development of international standards.', 'assets/img/iot-bg.jpg', '2021-06-21 22:16:46');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`sno`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`sno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
