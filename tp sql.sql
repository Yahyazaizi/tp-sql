CREATE TABLE session (codeSess int primary key,nomSess varchar(50),Datedebut date,Datefin date ,codeform int,  FOREIGN KEY (codeform ) REFERENCES FORMATION(codeform ));
INSERT INTO SESSION (codeSess, nomSess, Datedebut, Datefin, codeform)
VALUES
(1101, 'Session1101', '2022-01-02', '2022-01-14', 11),
(1102, 'Session 1102', '2022-02-03', '2022-02-15', 11),
(1201, 'Session 1201', '2022-03-04', '2022-03-18', 12),
(1202, 'Session 1202', '2022-04-05', '2022-04-19', 12),
(1301, 'Session 1301', '2022-01-06', '2022-01-21', 13),
(1302, 'Session 1302', '2022-05-07', '2022-05-22', 13),
(1303, 'Session 1303', '2022-06-08', '2022-06-23', 13),
(1401, 'Session 1401', '2022-09-01', '2022-09-11', 14),
(1402, 'Session 1402', '2022-08-08', '2022-08-18', 14),
(1501, 'Session 1501', '2022-11-11', '2022-12-01', 15),
(1502, 'Session 1502', '2022-09-12', '2022-10-02', 15),
(1601, 'Session 1601', '2022-09-13', '2022-09-25', 16),
(1602, 'Session 1602', '2022-10-14', '2022-10-26', 16),
(1104, 'Session 1104', '2022-10-15', '2022-10-27', 11),
(1203, 'Session 1203', '2022-11-16', '2022-11-30', 12),
(1204, 'Session 1204', '2022-12-17', '2022-12-31', 12);
CREATE TABLE INSCRIPTION  (codeSess int ,numCINEtu varchar(50),TypeCours varchar(50),  FOREIGN KEY (codeSess) REFERENCES  SESSION(codeSess ));
alter table INSCRIPTION drop primary key ;
INSERT INTO INSCRIPTION (codeSess, numCINEtu, TypeCours)
VALUES
(1101, 'AB234567', 'Distanciel'),
(1101, 'G5346789', 'Distanciel'),
(1101, 'C0987265', 'Distanciel'),
(1101, 'D2356903', 'Distanciel'),
(1101, 'Y1234987', 'Distanciel'),
(1101, 'J3578902', 'Distanciel'),
(1101, 'F9827363', 'Distanciel'),
(1201, 'AB234567', 'Présentiel'),
(1201, 'G5346789', 'Présentiel'),
(1201, 'C0987265', 'Présentiel'),
(1201, 'D2356903', 'Présentiel'),
(1201, 'Y1234987', 'Présentiel'),
(1201, 'J3578902', 'Présentiel'),
(1302, 'AB234567', 'Présentiel'),
(1302, 'G5346789', 'Distanciel'),
(1302, 'C0987265', 'Présentiel'),
(1302, 'D2356903', 'Présentiel'),
(1302, 'Y1234987', 'Présentiel'),
(1401, 'G5346789', 'Distanciel'),
(1401, 'C0987265', 'Distanciel'),
(1401, 'D2356903', 'Distanciel'),
(1401, 'Y1234987', 'Distanciel'),
(1401, 'J3578902', 'Distanciel'),
(1401, 'F9827363', 'Distanciel'),
(1501, 'AB234567', 'Distanciel'),
(1501, 'G5346789', 'Présentiel'),
(1501, 'C0987265', 'Distanciel'),
(1501, 'D2356903', 'Présentiel'),
(1501, 'Y1234987', 'Présentiel'),
(1501, 'J3578902', 'Présentiel'),
(1501, 'F9827363', 'Presenciel');

INSERT INTO SPECIALITE (codeSpec, nomSpec, descSpec, Active)
VALUES
(101, 'GL', 'Genie logiciel et developpement', 1),
(102, 'Data', 'Data engineering', 1),
(103, 'Langues', 'Anglais, Français', 1),
(104, 'Communication', 'Communication', 1),
(105, 'Securite', 'Reseaux et securite', 0);
CREATE TABLE CATALOGUE  (CodeSpec INT ,codeForm INT 
);
INSERT INTO CATALOGUE (CodeSpec, codeForm)
VALUES
(101, 11),
(101, 12),
(102, 15),
(101, 15),
(103, 13),
(104, 13),
(104, 14),
(104, 16);
UPDATE FORMATION
SET titreform = 'développement Java'
WHERE codeform = 11;
ALTER TABLE INSCRIPTION
ADD COLUMN numInscription VARCHAR(255);

UPDATE INSCRIPTION
SET numInscription = CONCAT(codeSess, numCINEtu);
  
INSERT INTO ETUDIANT (numCINEtu, nomEtu, dateNaissance, villeEtu)
VALUES ('AB2345674','Alami', '1987-01-02', 'Kenitra');
UPDATE INSCRIPTION
SET TypeCours = 'distanciel'
WHERE numCINEtu IN (SELECT numCINEtu FROM ETUDIANT WHERE nomEtu = 'Aicha');
UPDATE INSCRIPTION 
SET TypeCours = 'distanciel'
WHERE numCINEtu = "G5346789";
SELECT * FROM ETUDIANT;
SELECT * FROM FORMATION;
SELECT * FROM SESSION ;
SELECT * FROM INSCRIPTION;

SELECT * FROM FORMATION WHERE prixform  > 3000;

SELECT titreform, prixform / dureeform AS prix_journalier FROM FORMATION;

SELECT * FROM SESSION WHERE codeForm = 11 AND statutSession = 'ouvert';

SELECT numCINEtu FROM INSCRIPTION WHERE codeSess = 1302 ORDER BY numCINEtu ASC;

SELECT * FROM SPECIALITE WHERE statut = 'actif';
