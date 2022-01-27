USE instrumentavler;

#Indsætning af filialer
CALL tilføjFilial('Viborg', 'H.C Andersensvej 1', 1, 0);
CALL tilføjFilial('Løvel', 'Havrisvej 33', 1, 100);
CALL tilføjFilial('Hald ege', 'Egeskovvej 13', 2, 20000);
CALL tilføjFilial('Finderup', 'Hellerupvej 5', 1, 0);
CALL tilføjFilial('Ravnstrup', 'Nybrovej 20', 1, 0);
CALL tilføjFilial('Stoholm', 'Lånumvej 11', 1, 2000);
CALL tilføjFilial('Foulum', 'Burrehøjvej 107', 1, -1000);
CALL tilføjFilial('Birgittelyst', 'Tostrupvej 12', 1, 2000);
CALL tilføjFilial('Sparkær', 'Langgade 91', 1, 0);
CALL tilføjFilial('Overlund', 'Randersvej 3', 1, 0);

#Indsætning af ansatte
CALL tilføjAnsat('Knud', '11223333', 1);
CALL tilføjAnsat('Veronica', '22223333', 2);
CALL tilføjAnsat('Jonas', '32312333', 3);
CALL tilføjAnsat('Daniel', '', 4);
CALL tilføjAnsat('Esther', '53143221', 5);
CALL tilføjAnsat('Anna', '87645371', 6);
CALL tilføjAnsat('Ludvig', '42768644', 7);
CALL tilføjAnsat('Linus', '87634237', 8);
CALL tilføjAnsat('Katrine', '57672373', 9);
CALL tilføjAnsat('Adam', '87763543', 10);
CALL tilføjAnsat('Sophie', '45679812', 3);

#Indsætning af varer
CALL tilføjVare('Trommesæt', 9000, 1, 2, 1);
CALL tilføjVare('Triangel', 100, 1, 4, 2);
CALL tilføjVare('Guitar', 1000, 3, 17, 3);
CALL tilføjVare('Bass', 2500, 0, 20, 4);
CALL tilføjVare('Trumpet', 500, 1, 9, 5);
CALL tilføjVare('Mikrofon', 1500, 1, 19, 6);
CALL tilføjVare('Klaver', 6000, 1, 19, 7);
CALL tilføjVare('Violin', 2000, 1, 9, 8);
CALL tilføjVare('Saxofon', 2500, 2, 8, 9);
CALL tilføjVare('Banjo', 1500, 0, 5, 10);

#Indsætning af transaktioner
CALL tilføjTransaktion('2021-04-08', 9000, 1);
CALL tilføjTransaktion('2021-04-08', 100, 2);
CALL tilføjTransaktion('2021-04-08', 2000, 3);
CALL tilføjTransaktion('2021-04-08', 1000, 3);
CALL tilføjTransaktion('2021-04-08', 500, 5);
CALL tilføjTransaktion('2021-04-08', 1500, 6);
CALL tilføjTransaktion('2021-04-08', 6000, 7);
CALL tilføjTransaktion('2021-04-08', 2000, 8);
CALL tilføjTransaktion('2021-04-08', 2500, 9);
CALL tilføjTransaktion('2021-04-08', 2500, 9);
