/*test 2.1*/ SELECT * FROM `VIDEO` WHERE titre LIKE 'star%'
/*test 2.2*/ SELECT * FROM VIDEO,CARACTERISE WHERE titre LIKE '%love%' AND id_genre=3 AND VIDEO.id_video=CARACTERISE.id_video
/*test 2.3*/ CREATE TABLE `GENRE` (
                `id_genre` int(11) NOT NULL,
                `id_supergenre` int(11) NOT NULL,
                `nom_de_genre` text NOT NULL);  

                ALTER TABLE `GENRE`
                ADD PRIMARY KEY (`id_genre`),
                ADD KEY (`id_supergenre`);

                ALTER TABLE `GENRE`
                MODIFY `id_genre` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10; 

                ALTER TABLE `GENRE`
                ADD CONSTRAINT `lien` FOREIGN KEY (`id_supergenre`) REFERENCES `GENRE` (`id_genre`) ON UPDATE CASCADE;
/*test 2.4*/ SELECT COUNT(*) FROM VIDEO
/*test 2.5*/ SELECT VIDEO.id_video,titre FROM VIDEO,CARACTERISE,GENRE WHERE id_supergenre=4 AND GENRE.id_genre!=4 AND VIDEO.id_video=CARACTERISE.id_video AND CARACTERISE.id_genre=GENRE.id_genre ORDER BY titre DESC
/*test 2.6*/ SELECT titre,COUNT(id_visionner) FROM VIDEO,VISIONNER WHERE VIDEO.id_video=VISIONNER.id_video GROUP BY titre HAVING COUNT(id_visionner)>=1
/*test 2.7*/ SELECT * FROM `GENRE` WHERE id_supergenre=1 and id_genre !=1
/*test 2.8*/ SELECT MAX(date_de_sortie) FROM VIDEO,CARACTERISE WHERE id_genre=2 AND VIDEO.id_video=CARACTERISE.id_video