-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        5.5.32 - MySQL Community Server (GPL)
-- 서버 OS:                        Win32
-- HeidiSQL 버전:                  8.0.0.4396
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- pbproject 의 데이터베이스 구조 덤핑
CREATE DATABASE IF NOT EXISTS `pbproject` /*!40100 DEFAULT CHARACTER SET euckr */;
USE `pbproject`;


-- 테이블 pbproject의 구조를 덤프합니다. join_member
CREATE TABLE IF NOT EXISTS `join_member` (
  `pb_studentnumber` int(10) NOT NULL AUTO_INCREMENT,
  `pb_id` varchar(50) NOT NULL,
  `pb_pw` varchar(50) NOT NULL,
  `pb_level` varchar(50) NOT NULL,
  `pb_name` varchar(50) NOT NULL,
  `pb_address` varchar(50) NOT NULL,
  `pb_email` varchar(50) NOT NULL,
  `pb_date` varchar(50) NOT NULL,
  PRIMARY KEY (`pb_studentnumber`)
) ENGINE=InnoDB DEFAULT CHARSET=euckr;

-- 내보낼 데이터가 선택되어 있지 않습니다.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
