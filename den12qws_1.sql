-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Май 13 2022 г., 13:27
-- Версия сервера: 5.7.21-20-beget-5.7.21-20-1-log
-- Версия PHP: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `den12qws_1`
--

-- --------------------------------------------------------

--
-- Структура таблицы `Documents`
--
-- Создание: Май 13 2022 г., 09:20
-- Последнее обновление: Май 13 2022 г., 09:55
--

DROP TABLE IF EXISTS `Documents`;
CREATE TABLE `Documents` (
  `idDannix` int(11) NOT NULL,
  `idNositeli` int(11) NOT NULL,
  `TypeDocumenta` varchar(225) NOT NULL,
  `NameDocumenta` varchar(225) NOT NULL,
  `NomerDocumentaVladelcya` int(225) NOT NULL,
  `CodPodrazdelenya` int(11) NOT NULL,
  `IspolnitelRazrabotchik` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Documents`
--

INSERT INTO `Documents` (`idDannix`, `idNositeli`, `TypeDocumenta`, `NameDocumenta`, `NomerDocumentaVladelcya`, `CodPodrazdelenya`, `IspolnitelRazrabotchik`) VALUES
(1, 1, 'Bymaga', 'Rabotniky', 11, 1, 'Drovinov A.A.'),
(2, 1, 'Bymaga', 'Rabotniky', 21, 11, 'Saverov A.L.'),
(3, 2, 'Electronniy', 'Zarplata', 25, 16, 'Gavrilov A.S.');

-- --------------------------------------------------------

--
-- Структура таблицы `MestonahozdenyeNositelya`
--
-- Создание: Май 13 2022 г., 09:20
-- Последнее обновление: Май 13 2022 г., 09:29
--

DROP TABLE IF EXISTS `MestonahozdenyeNositelya`;
CREATE TABLE `MestonahozdenyeNositelya` (
  `idVidachi` int(11) NOT NULL,
  `idNositelya` int(11) NOT NULL,
  `idPodrazdelenya` int(11) NOT NULL,
  `FamilyaVzyavshego` varchar(225) NOT NULL,
  `DateVzyatya` date NOT NULL,
  `SrokVzyatiya` varchar(225) NOT NULL,
  `DateVozvrata` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `MestonahozdenyeNositelya`
--

INSERT INTO `MestonahozdenyeNositelya` (`idVidachi`, `idNositelya`, `idPodrazdelenya`, `FamilyaVzyavshego`, `DateVzyatya`, `SrokVzyatiya`, `DateVozvrata`) VALUES
(1, 1, 1, 'Ivanov I.I.', '2022-05-01', '7 dney', '2022-05-08');

-- --------------------------------------------------------

--
-- Структура таблицы `Nositeli`
--
-- Создание: Май 13 2022 г., 09:20
-- Последнее обновление: Май 13 2022 г., 10:18
--

DROP TABLE IF EXISTS `Nositeli`;
CREATE TABLE `Nositeli` (
  `idNositeli` int(11) NOT NULL,
  `VidNositelya` varchar(225) NOT NULL,
  `NameNositelya` varchar(225) NOT NULL,
  `DateIzgotovlenya` date NOT NULL,
  `SrokSlyzbi` date NOT NULL,
  `TechnicheskoeSostoyanie` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Nositeli`
--

INSERT INTO `Nositeli` (`idNositeli`, `VidNositelya`, `NameNositelya`, `DateIzgotovlenya`, `SrokSlyzbi`, `TechnicheskoeSostoyanie`) VALUES
(1, 'Bymaga', 'Rabotniky', '2022-04-01', '2025-04-01', '5/5'),
(2, 'Electronniy', 'Zarplata', '2022-05-01', '2023-05-01', '5/5'),
(3, 'Bymaga', 'Knigy', '2019-01-01', '2023-11-25', '4/5');

-- --------------------------------------------------------

--
-- Структура таблицы `Podrazdelenie`
--
-- Создание: Май 13 2022 г., 09:20
-- Последнее обновление: Май 13 2022 г., 09:24
--

DROP TABLE IF EXISTS `Podrazdelenie`;
CREATE TABLE `Podrazdelenie` (
  `idPodrazdelenya` int(11) NOT NULL,
  `NamePodrazdelenya` varchar(225) NOT NULL,
  `Mestonahozdenie` varchar(225) NOT NULL,
  `OtvetstvenniyPodrazdelenya` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Podrazdelenie`
--

INSERT INTO `Podrazdelenie` (`idPodrazdelenya`, `NamePodrazdelenya`, `Mestonahozdenie`, `OtvetstvenniyPodrazdelenya`) VALUES
(1, 'OtdelTechnologov', 'cabinet 10', 'Ivanov I.A.'),
(2, 'OtdelTechnologov', 'cabinet 11', 'Ivanov I.A.'),
(3, 'Byhgalterya', 'cab 15', 'Savelyva N.P.');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `Documents`
--
ALTER TABLE `Documents`
  ADD PRIMARY KEY (`idDannix`),
  ADD KEY `Documents_fk0` (`idNositeli`);

--
-- Индексы таблицы `MestonahozdenyeNositelya`
--
ALTER TABLE `MestonahozdenyeNositelya`
  ADD PRIMARY KEY (`idVidachi`),
  ADD KEY `MestonahozdenyeNositelya_fk0` (`idNositelya`),
  ADD KEY `MestonahozdenyeNositelya_fk1` (`idPodrazdelenya`);

--
-- Индексы таблицы `Nositeli`
--
ALTER TABLE `Nositeli`
  ADD PRIMARY KEY (`idNositeli`);

--
-- Индексы таблицы `Podrazdelenie`
--
ALTER TABLE `Podrazdelenie`
  ADD PRIMARY KEY (`idPodrazdelenya`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `Documents`
--
ALTER TABLE `Documents`
  MODIFY `idDannix` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `MestonahozdenyeNositelya`
--
ALTER TABLE `MestonahozdenyeNositelya`
  MODIFY `idVidachi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `Nositeli`
--
ALTER TABLE `Nositeli`
  MODIFY `idNositeli` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `Podrazdelenie`
--
ALTER TABLE `Podrazdelenie`
  MODIFY `idPodrazdelenya` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `Documents`
--
ALTER TABLE `Documents`
  ADD CONSTRAINT `Documents_fk0` FOREIGN KEY (`idNositeli`) REFERENCES `Nositeli` (`idNositeli`);

--
-- Ограничения внешнего ключа таблицы `MestonahozdenyeNositelya`
--
ALTER TABLE `MestonahozdenyeNositelya`
  ADD CONSTRAINT `MestonahozdenyeNositelya_fk0` FOREIGN KEY (`idNositelya`) REFERENCES `Nositeli` (`idNositeli`),
  ADD CONSTRAINT `MestonahozdenyeNositelya_fk1` FOREIGN KEY (`idPodrazdelenya`) REFERENCES `Podrazdelenie` (`idPodrazdelenya`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
