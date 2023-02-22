BEGIN;

ALTER TABLE "user" DROP CONSTRAINT user_role_id_fkey;

ALTER TABLE "stretch" DROP CONSTRAINT stretch_category_id_fkey;

INSERT INTO "user" ("id", "email", "password", "username", "biography", "role_id") VALUES
    (1, 'marie.e.geneste@gmail.com', 'azerty', 'Stretchy', 'blabla', 1);

INSERT INTO "stretch" ("id", "title", "description_content", "main_image", "description_image", "category_id") VALUES
    (1, 'Trapèze', 'Poser une main sur une épaule afin de la maintenir vers le bas. Incliner la tête du côté opposé et ,tout en gardant l\’inclinaison, pencher la tête en avant.', '', '', 1),
    (2, 'SCOM (Sterno-Cléïdo-Occipito-Mastoïdien)', 'Pour étirer le SCOM droit (par exemple) : Poser les doigts de la main gauche sur la clavicule droite (partie centrale). Basculer la tête en arrière (extension) et tourner la tête à droite.', '', '', 1),
    (3, 'Biceps', 'Tendre le bras devant soi et tendre la main vers le bas. Avec l\’autre main, maintenir les doigts de la main dont le bras est tendu vers le bas.', '', '', 2),
    (4, 'Triceps', 'Lever le bras au dessus de la tête, plier le coude et atteindre, avec la main, l\’épaule opposé en ayant le bras derrière la tête. Poser les doigts de l\’autre main sur le coude du bras en l\’air et tirer vers le haut.', '' ,'' , 2),
    (5, 'Deltoïde','Tendre un bras vers l\’avant et ramenez le vers l\’intérieur. Attraper le coude avec l\’autre main et maintenir une pression qui tire le bras.','','',2),
    (6, 'Épicondyliens','Tendre le bras devant soi et avec l\’autre main maintenir la main tendue vers le bas','','', 3),
    (7, 'Épitrochléens','Tendre le bras devant soi et avec l\’autre main maintenir la main tendue vers le haut.','','', 3),
    (8, 'Pectoraux', 'Étendre son bras vers l\’arrière (mieux si on peut prendre un appui avec la main).', '','', 4),
    (9, 'Abdos','S\’allonger sur le ventre et se redresser sur les mains en étirant le tronc vers le haut.','','', 5),
    (10, 'Obliques','Debout, lever le bras vers le ciel et pencher le tronc du côté opposé.','','', 5),
    (11, 'Grand dorsal','Se mettre dans la posture de l\’enfant (au sol, recroquevillé, les genoux et cuisses en dessous du tronc).Tendre les bras au dessus de la tête, le plus loin possible.','','', 6),
    (12, 'Psoas','Faire une fente avec la jambe arrière assez loin en gardant le dos droit. Mettre une main derrière la hanche de la jambe arrière et mettre une pression pour engager cette hanche vers l\’avant.','','', 7),
    (13, 'Fessiers','Assis au sol, croiser les jambes avec une tendus et l\’autre pliée avec le pied à côté du genou de la jambe tendue. Tourner le tronc du côté de la jambe pliée et poser le coude opposé sur le genou de la jambe pliée.','','', 8),
    (14, 'piriforme','Allongé sur le dos, croiser une jambe sur l’autre : une cheville posée sur le genou de l’autre. Attraper la jambe d’appui en dessous et derrière le genou afin de la faire basculer au dessus du tronc.','','', 8),
    (15, 'Adducteur','Assis au sol, écarter les jambes en papillon. Poser les coudes sur les genoux et abaisser le tronc.','','', 9),
    (16, 'Quadriceps','Plier le genou et agripper la cheville avec la main du même côté, puis tirer doucement en direction du fessier. Le genou doit pointer vers le sol.','','', 9),
    (17, 'Ischio-jambier','Assis sur le sol, tendre une jambe et plier l\’autre. Essayer d\’attraper le pied de la jambe tendue avec la main.','','', 9),
    (18, 'triceps sural','Debout, tendre une jambe et se pencher en avant pour attraper avec la main le pied de la jambe tendue.','','',10),
    (19, 'Inversion','Faire une pointe avec le pied avec les orteils vers l\’intérieur','','', 11 ),
    (20, 'Eversion ','Basculer le pied côté externe en faisant une flexion dorsale (orienté le pied vers l\’extérieur et le haut).','','', 11);


INSERT INTO "category" ("id", "name") VALUES
    (1, 'Cou'),
    (2, 'Bras'),
    (3, 'Avant-bras'),
    (4, 'Poitrine'),
    (5, 'Ventre'),
    (6, 'Dos'),
    (7, 'Hanche'),
    (8, 'Fessier'),
    (9, 'Cuisse'),
    (10, 'Jambe'),
    (11, 'Pied');
    
INSERT INTO "role" ("id", "name") VALUES
(1, 'admin'),
(2, 'user');

INSERT INTO "user_stretch" ("user_id", "stretch_id") VALUES
(1, 1);

ALTER TABLE "user" ADD FOREIGN KEY ("role_id") REFERENCES "role"("id");

ALTER TABLE "stretch" ADD FOREIGN KEY ("category_id") REFERENCES "category"("id");

COMMIT;
