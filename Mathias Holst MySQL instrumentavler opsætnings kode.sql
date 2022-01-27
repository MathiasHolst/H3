DROP DATABASE IF EXISTS instrumentavler;
CREATE DATABASE instrumentavler;
USE instrumentavler;

#CREATE OF TABLES
CREATE TABLE filialer(
    filial_id INT NOT NULL AUTO_INCREMENT,
	lokation VARCHAR(255) NOT NULL,
    vej VARCHAR(255) NOT NULL,
    antal_ansatte INT NOT NULL,
    tjentidag INT,
    PRIMARY KEY (filial_id)
    );
CREATE TABLE ansatte(
 	id INT NOT NULL AUTO_INCREMENT,
    navn VARCHAR(255) NOT NULL,
    telefon_nummer VARCHAR(255),
    afdeling INT,
    PRIMARY KEY (id),
    FOREIGN KEY (afdeling) REFERENCES filialer(filial_id)
    );
CREATE TABLE varer(
    vare_id INT NOT NULL AUTO_INCREMENT,
    navn VARCHAR(255) NOT NULL,
    pris INT,
    solgt INT,
    varebeholdning INT,
    afdeling INT,
    PRIMARY KEY (vare_id),
    FOREIGN KEY (afdeling) REFERENCES filialer(filial_id)
    );
CREATE TABLE transaktioner(
    transaktion_id INT NOT NULL AUTO_INCREMENT,
    tidspunkt DATE NOT NULL,
    beløb INT NOT NULL,
    afdeling INT,
    PRIMARY KEY (transaktion_id),
    FOREIGN KEY (afdeling) REFERENCES filialer(filial_id)
    );
#CREATE OF VIEWS
CREATE VIEW vare_sortiment_solgt_varebeholdning AS
    SELECT navn, solgt, varebeholdning
    FROM varer
    ORDER BY varebeholdning DESC;

CREATE VIEW filial_Indtjening_Idag AS
    SELECT lokation, tjentidag
    FROM filialer
    ORDER BY tjentidag;

CREATE VIEW ansatte_Sorteret_Efter_Lokation AS
    SELECT ansatte.navn, filialer.lokation
    FROM ansatte
    INNER JOIN filialer ON ansatte.afdeling = filialer.filial_id
    ORDER BY filialer.lokation;
CREATE VIEW se_butik_varebeholdning_af_bestemte_varer AS
    SELECT filialer.lokation, varer.navn AS vare, varer.varebeholdning
    FROM varer
    INNER JOIN filialer ON varer.afdeling = filialer.filial_id
    ORDER BY filialer.lokation;
#CREATE OF PROCEDURES
DELIMITER //
CREATE PROCEDURE tilføjAnsat(IN ansat_navn VARCHAR(255), ansat_telefon_nummer VARCHAR(255), ansat_afdeling_id INT) 
    INSERT INTO ansatte (navn, telefon_nummer, afdeling) 
    VALUES (ansat_navn, ansat_telefon_nummer, ansat_afdeling_id) //
CREATE PROCEDURE seAlleAnsatte()
    SELECT ansatte.navn, ansatte.telefon_nummer, filialer.lokation 
    FROM ansatte  
    INNER JOIN filialer ON ansatte.afdeling = filialer.filial_id //
CREATE PROCEDURE opdaterAnsat(IN ansat_navn VARCHAR(255), ansat_telefon_nummer VARCHAR(255))
    UPDATE ansatte
    SET telefon_nummer = ansat_telefon_nummer
    WHERE navn = ansat_navn //
CREATE PROCEDURE opdaterAnsatAfdeling(IN ansat_navn VARCHAR(255), ansat_afdeling_id INT)
    UPDATE ansatte
    SET afdeling = ansat_afdeling_id
    WHERE navn = ansat_navn //
CREATE PROCEDURE fjernAnsat(IN ansat_navn VARCHAR(255))
	DELETE FROM ansatte 
    WHERE navn = ansat_navn //

CREATE PROCEDURE tilføjFilial(IN filial_by VARCHAR(255), filial_vej VARCHAR(255), filial_antal_ansatte INT,filial_tjent_idag INT)
    INSERT INTO filialer (lokation, vej, antal_ansatte, tjentidag) 
    VALUES (filial_by, filial_vej, filial_antal_ansatte, filial_tjent_idag) //
CREATE PROCEDURE seAlleFilialer()
    SELECT lokation, vej, antal_ansatte, tjentidag 
    FROM filialer //
CREATE PROCEDURE opdaterFilial(IN filial_by VARCHAR(255), filial_antal_ansatte INT)
    UPDATE filialer
    SET antal_ansatte = filial_antal_ansatte
    WHERE lokation = filial_by //
CREATE PROCEDURE fjernFilial(IN filial_by VARCHAR(255), filial_vej VARCHAR(255))
    DELETE FROM filialer 
    WHERE lokation = filial_by AND vej = filial_vej //

CREATE PROCEDURE tilføjTransaktion(IN tran_tidspunkt DATE, tran_beløb INT, tran_lager_id INT)
    INSERT INTO transaktioner (tidspunkt, beløb, afdeling) 
    VALUES (tran_tidspunkt, tran_beløb, tran_lager_id) //
CREATE PROCEDURE seAlleTransaktioner()
    SELECT transaktioner.transaktion_id, transaktioner.tidspunkt, transaktioner.beløb, filialer.lokation 
    FROM transaktioner 
    INNER JOIN filialer ON transaktioner.afdeling = filialer.filial_id //
CREATE PROCEDURE opdaterTransaktion(IN tran_id INT, tran_tidspunkt DATE, tran_beløb INT)
    UPDATE transaktioner
    SET tidspunkt = tran_tidspunkt, beløb = tran_beløb
    WHERE transaktion_id = tran_id //
CREATE PROCEDURE opdaterTransaktionLager(IN tran_id INT, tran_lager_id INT)
    UPDATE transaktioner
    SET afdeling = tran_lager_id
    WHERE transaktion_id = tran_id //
CREATE PROCEDURE fjernTransaktion(IN tran_id INT)
    DELETE FROM transaktioner 
    WHERE transaktion_id = tran_id //

CREATE PROCEDURE tilføjVare(IN vare_navn VARCHAR(255), vare_pris INT, vare_solgt INT, vare_varebeholdning INT, vare_lager_id INT)
    INSERT INTO varer (navn, pris, solgt, varebeholdning, afdeling) 
    VALUES (vare_navn, vare_pris, vare_solgt, vare_varebeholdning, vare_lager_id) //
CREATE PROCEDURE seAlleVarer()
    SELECT navn, pris, solgt
    FROM varer //
CREATE PROCEDURE opdaterVare(IN procedure_vare_id INT, vare_navn VARCHAR(255), vare_pris INT, vare_solgt INT, vare_varebeholdning INT)
    UPDATE varer
    SET navn = vare_navn, pris = vare_pris, solgt = vare_solgt, varebeholdning = vare_varebeholdning
    WHERE vare_id = procedure_vare_id //

CREATE PROCEDURE opdaterVareLager(IN procedure_vare_id INT, vare_lager_id INT)
    UPDATE varer
    SET afdeling = vare_lager_id
    WHERE vare_id = procedure_vare_id //

CREATE PROCEDURE fjernVare(IN vare_navn VARCHAR(255))
    DELETE FROM varer 
    WHERE navn = vare_navn //
DELIMITER ;





