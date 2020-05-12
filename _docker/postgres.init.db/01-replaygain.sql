BEGIN;

UPDATE album
SET new_path = vals.new_path
FROM (
    VALUES
    ('web/bandcamp.com/The Middle Volga Social Club/2016-Give Me the Way', 'bandcamp.com/The Middle Volga Social Club - 2016 - Give Me the Way'),
    ('web/bandcamp.com/El Mashe/2016-El Mashe', 'bandcamp.com/El Mashe - 2016 - El Mashe'),
    ('web/soundcloud.com/Коля Маню/2016-Baadmantown', 'soundcloud.com/Коля Маню - 2016 - Baadmantown'),
    ('cd/what.cd/P.O.D./2003-Payable On Death', 'what.cd/P.O.D. - Payable On Death'),
    ('cd/what.cd/Rancid/2014-Honor Is All We Know', 'what.cd/Rancid - Honor Is All We Know (2014) [FLAC]'),
    ('cd/what.cd/Razika/2015-Ut til de andre', 'what.cd/Razika - Ut til de andre (2015) [flac]'),
    ('cd/waffles.fm/Alison Krauss/1999-Forget About It', 'waffles.fm/Alison Krauss - Forget About It'),
    ('cd/what.cd/DragonForce/2003-2010-Valley of the Damned', 'what.cd/DragonForce - Valley Of The Damned (2010 Remixed & Remastered)'),
    ('cd/what.cd/Senser/1994-Stacked Up', 'what.cd/Senser - 1994 - Stacked Up [Flac]')
) AS vals (old_path, new_path)
WHERE album.path = vals.old_path;

UPDATE track
SET new_path = vals.new_path
FROM (
    VALUES
    ('bandcamp.com/The Middle Volga Social Club - 2016 - Give Me the Way', 1, '01 - Chevy-Niva.flac'),
    ('bandcamp.com/The Middle Volga Social Club - 2016 - Give Me the Way', 2, '02 - Poison.flac'),
    ('bandcamp.com/The Middle Volga Social Club - 2016 - Give Me the Way', 3, '03 - Anastasia Fedorovskaya.flac'),
    ('bandcamp.com/The Middle Volga Social Club - 2016 - Give Me the Way', 4, '04 - Give me the way.flac'),
    ('bandcamp.com/The Middle Volga Social Club - 2016 - Give Me the Way', 5, '05 - Bus paradise.flac'),
    ('bandcamp.com/The Middle Volga Social Club - 2016 - Give Me the Way', 6, '06 - Steve McQueen.flac'),
    ('bandcamp.com/The Middle Volga Social Club - 2016 - Give Me the Way', 7, '07 - Emperor.flac'),
    ('bandcamp.com/The Middle Volga Social Club - 2016 - Give Me the Way', 8, '08 - Jeremy Clarkson.flac'),
    ('bandcamp.com/The Middle Volga Social Club - 2016 - Give Me the Way', 9, '09 - She who runs on the waves.flac'),

    ('bandcamp.com/El Mashe - 2016 - El Mashe', 1, '01 - 8 бит.flac'),
    ('bandcamp.com/El Mashe - 2016 - El Mashe', 2, '02 - Я в падере дунул (feat. Лёня Кравчук).flac'),
    ('bandcamp.com/El Mashe - 2016 - El Mashe', 3, '03 - Монопенисуально.flac'),
    ('bandcamp.com/El Mashe - 2016 - El Mashe', 4, '04 - Распиздяй.flac'),
    ('bandcamp.com/El Mashe - 2016 - El Mashe', 5, '05 - Love Is... (Тыры-пыры).flac'),
    ('bandcamp.com/El Mashe - 2016 - El Mashe', 6, '06 - Из кала (Skit).flac'),
    ('bandcamp.com/El Mashe - 2016 - El Mashe', 7, '07 - Ипотека.flac'),
    ('bandcamp.com/El Mashe - 2016 - El Mashe', 8, '08 - Грей Сашу! (feat. Ритос).flac'),
    ('bandcamp.com/El Mashe - 2016 - El Mashe', 9, '09 - Пацыки-диджики.flac'),
    ('bandcamp.com/El Mashe - 2016 - El Mashe', 10, '10 - Учи ин яз (feat. Лумумба).flac'),
    ('bandcamp.com/El Mashe - 2016 - El Mashe', 11, '11 - Нокия 3310.flac'),
    ('bandcamp.com/El Mashe - 2016 - El Mashe', 12, '12 - Грустная песня рэпера из провинции.flac'),
    ('bandcamp.com/El Mashe - 2016 - El Mashe', 13, '13 - От винта! (Skit).flac'),
    ('bandcamp.com/El Mashe - 2016 - El Mashe', 14, '14 - Фуфлоу (feat. Mr.Gooch).flac'),
    ('bandcamp.com/El Mashe - 2016 - El Mashe', 15, '15 - Безработный.flac'),
    ('bandcamp.com/El Mashe - 2016 - El Mashe', 16, '16 - Навали на вэлум!.flac'),
    ('bandcamp.com/El Mashe - 2016 - El Mashe', 17, '17 - Шекогали (Bonus Track).flac'),

    ('soundcloud.com/Коля Маню - 2016 - Baadmantown', 1, '01 - Каждый день.flac'),
    ('soundcloud.com/Коля Маню - 2016 - Baadmantown', 2, '02 - Солнечный.flac'),
    ('soundcloud.com/Коля Маню - 2016 - Baadmantown', 3, '03 - Больше огня.flac'),
    ('soundcloud.com/Коля Маню - 2016 - Baadmantown', 4, '04 - Всегда готов.flac'),
    ('soundcloud.com/Коля Маню - 2016 - Baadmantown', 5, '05 - Процветай.flac'),
    ('soundcloud.com/Коля Маню - 2016 - Baadmantown', 6, '06 - Раггамаффин славься.flac'),
    ('soundcloud.com/Коля Маню - 2016 - Baadmantown', 7, '07 - Самая самая.flac'),
    ('soundcloud.com/Коля Маню - 2016 - Baadmantown', 8, '08 - Baadmantown.flac'),
    ('soundcloud.com/Коля Маню - 2016 - Baadmantown', 9, '09 - Океан.flac'),
    ('soundcloud.com/Коля Маню - 2016 - Baadmantown', 10, '10 - За мир.flac'),
    ('soundcloud.com/Коля Маню - 2016 - Baadmantown', 11, '11 - Скептик.flac'),
    ('soundcloud.com/Коля Маню - 2016 - Baadmantown', 12, '12 - Танцуй.flac'),
    ('soundcloud.com/Коля Маню - 2016 - Baadmantown', 13, '13 - James Bong.flac'),
    ('soundcloud.com/Коля Маню - 2016 - Baadmantown', 14, '14 - Энергия.flac'),

    ('what.cd/P.O.D. - Payable On Death', 1, '01 - Wildfire.flac'),
    ('what.cd/P.O.D. - Payable On Death', 2, '02 - Will You.flac'),
    ('what.cd/P.O.D. - Payable On Death', 3, '03 - Change The World.flac'),
    ('what.cd/P.O.D. - Payable On Death', 4, '04 - Execute The Sounds.flac'),
    ('what.cd/P.O.D. - Payable On Death', 5, '05 - Find My Way.flac'),
    ('what.cd/P.O.D. - Payable On Death', 6, '06 - Revolution.flac'),
    ('what.cd/P.O.D. - Payable On Death', 7, '07 - The Reasons.flac'),
    ('what.cd/P.O.D. - Payable On Death', 8, '08 - Freedom Fighters.flac'),
    ('what.cd/P.O.D. - Payable On Death', 9, '09 - Waiting On Today.flac'),
    ('what.cd/P.O.D. - Payable On Death', 10, '10 - I And Identify.flac'),
    ('what.cd/P.O.D. - Payable On Death', 11, '11 - Asthma.flac'),
    ('what.cd/P.O.D. - Payable On Death', 12, '12 - Eternal.flac'),

    ('what.cd/Rancid - Honor Is All We Know (2014) [FLAC]', 1, '01 - Back Where I Belong.flac'),
    ('what.cd/Rancid - Honor Is All We Know (2014) [FLAC]', 2, '02 - Raise Your Fist.flac'),
    ('what.cd/Rancid - Honor Is All We Know (2014) [FLAC]', 3, '03 - Collision Course.flac'),
    ('what.cd/Rancid - Honor Is All We Know (2014) [FLAC]', 4, '04 - Evil''s My Friend.flac'),
    ('what.cd/Rancid - Honor Is All We Know (2014) [FLAC]', 5, '05 - Honor Is All We Know.flac'),
    ('what.cd/Rancid - Honor Is All We Know (2014) [FLAC]', 6, '06 - A Power Inside.flac'),
    ('what.cd/Rancid - Honor Is All We Know (2014) [FLAC]', 7, '07 - In The Streets.flac'),
    ('what.cd/Rancid - Honor Is All We Know (2014) [FLAC]', 8, '08 - Face Up.flac'),
    ('what.cd/Rancid - Honor Is All We Know (2014) [FLAC]', 9, '09 - Already Dead.flac'),
    ('what.cd/Rancid - Honor Is All We Know (2014) [FLAC]', 10, '10 - Diabolical.flac'),
    ('what.cd/Rancid - Honor Is All We Know (2014) [FLAC]', 11, '11 - Malfunction.flac'),
    ('what.cd/Rancid - Honor Is All We Know (2014) [FLAC]', 12, '12 - Now We''re Through With You.flac'),
    ('what.cd/Rancid - Honor Is All We Know (2014) [FLAC]', 13, '13 - Everybody''s Sufferin''.flac'),
    ('what.cd/Rancid - Honor Is All We Know (2014) [FLAC]', 14, '14 - Grave Digger.flac'),

    ('what.cd/Razika - Ut til de andre (2015) [flac]', 1, '01 - Faen ta deg.flac'),
    ('what.cd/Razika - Ut til de andre (2015) [flac]', 2, '02 - Første gangen om igjen.flac'),
    ('what.cd/Razika - Ut til de andre (2015) [flac]', 3, '03 - Gutten i dongerijakke.flac'),
    ('what.cd/Razika - Ut til de andre (2015) [flac]', 4, '04 - Mer.flac'),
    ('what.cd/Razika - Ut til de andre (2015) [flac]', 5, '05 - Om igjen.flac'),
    ('what.cd/Razika - Ut til de andre (2015) [flac]', 6, '06 - Før vi sovner.flac'),
    ('what.cd/Razika - Ut til de andre (2015) [flac]', 7, '07 - Gi meg, gi meg, gi meg.flac'),
    ('what.cd/Razika - Ut til de andre (2015) [flac]', 8, '08 - Vi som gråter.flac'),
    ('what.cd/Razika - Ut til de andre (2015) [flac]', 9, '09 - Syndere i sommersol.flac'),
    ('what.cd/Razika - Ut til de andre (2015) [flac]', 10, '10 - Kjedelig.flac'),
    ('what.cd/Razika - Ut til de andre (2015) [flac]', 11, '11 - Det Embla sa.flac'),
    ('what.cd/Razika - Ut til de andre (2015) [flac]', 12, '12 - Når alle sammen går så går du etter.flac'),

    ('waffles.fm/Alison Krauss - Forget About It', 1, '01 - Alison Krauss - Stay.FLAC'),
    ('waffles.fm/Alison Krauss - Forget About It', 2, '02 - Alison Krauss - Forget About It.FLAC'),
    ('waffles.fm/Alison Krauss - Forget About It', 3, '03 - Alison Krauss - It Wouldn''t Have Made Any Difference.FLAC'),
    ('waffles.fm/Alison Krauss - Forget About It', 4, '04 - Alison Krauss - Maybe.FLAC'),
    ('waffles.fm/Alison Krauss - Forget About It', 5, '05 - Alison Krauss - Empty Hearts.FLAC'),
    ('waffles.fm/Alison Krauss - Forget About It', 6, '06 - Alison Krauss - Never Got Off the Ground.FLAC'),
    ('waffles.fm/Alison Krauss - Forget About It', 7, '07 - Alison Krauss - Ghost in This House.FLAC'),
    ('waffles.fm/Alison Krauss - Forget About It', 8, '08 - Alison Krauss - It Don''t Matter Now.FLAC'),
    ('waffles.fm/Alison Krauss - Forget About It', 9, '09 - Alison Krauss - That Kind of Love.FLAC'),
    ('waffles.fm/Alison Krauss - Forget About It', 10, '10 - Alison Krauss - Could You Lie.FLAC'),
    ('waffles.fm/Alison Krauss - Forget About It', 11, '11 - Alison Krauss - Dreaming My Dreams With You.FLAC'),

    ('what.cd/DragonForce - Valley Of The Damned (2010 Remixed & Remastered)', 1, '01. DragonForce - Invocation Of Apocalyptic Evil.Flac'),
    ('what.cd/DragonForce - Valley Of The Damned (2010 Remixed & Remastered)', 2, '02. DragonForce - Valley Of The Damned.Flac'),
    ('what.cd/DragonForce - Valley Of The Damned (2010 Remixed & Remastered)', 3, '03. DragonForce - Black Fire.Flac'),
    ('what.cd/DragonForce - Valley Of The Damned (2010 Remixed & Remastered)', 4, '04. DragonForce - Black Winter Night.Flac'),
    ('what.cd/DragonForce - Valley Of The Damned (2010 Remixed & Remastered)', 5, '05. DragonForce - Starfire.Flac'),
    ('what.cd/DragonForce - Valley Of The Damned (2010 Remixed & Remastered)', 6, '06. DragonForce - Disciples Of Babylon.Flac'),
    ('what.cd/DragonForce - Valley Of The Damned (2010 Remixed & Remastered)', 7, '07. DragonForce - Revelations.Flac'),
    ('what.cd/DragonForce - Valley Of The Damned (2010 Remixed & Remastered)', 8, '08. DragonForce - Evening Star.Flac'),
    ('what.cd/DragonForce - Valley Of The Damned (2010 Remixed & Remastered)', 9, '09. DragonForce - Heart Of A Dragon.Flac'),
    ('what.cd/DragonForce - Valley Of The Damned (2010 Remixed & Remastered)', 10, '10. DragonForce - Where Dragons Rule (Bonus Track).Flac'),

    ('what.cd/Senser - 1994 - Stacked Up [Flac]', 1, '01 - States of Mind.Flac'),
    ('what.cd/Senser - 1994 - Stacked Up [Flac]', 2, '02 - The Key.Flac'),
    ('what.cd/Senser - 1994 - Stacked Up [Flac]', 3, '03 - Switch.Flac'),
    ('what.cd/Senser - 1994 - Stacked Up [Flac]', 4, '04 - Age of Panic.Flac'),
    ('what.cd/Senser - 1994 - Stacked Up [Flac]', 5, '05 - What''s Going On.Flac'),
    ('what.cd/Senser - 1994 - Stacked Up [Flac]', 6, '06 - One Touch One Bounce.Flac'),
    ('what.cd/Senser - 1994 - Stacked Up [Flac]', 7, '07 - Stubborn.Flac'),
    ('what.cd/Senser - 1994 - Stacked Up [Flac]', 8, '08 - Door Game.Flac'),
    ('what.cd/Senser - 1994 - Stacked Up [Flac]', 9, '09 - Peanut Head.Flac'),
    ('what.cd/Senser - 1994 - Stacked Up [Flac]', 10, '10 - Peace.Flac'),
    ('what.cd/Senser - 1994 - Stacked Up [Flac]', 11, '11 - Eject.Flac'),
    ('what.cd/Senser - 1994 - Stacked Up [Flac]', 12, '12 - No Comply.Flac'),
    ('what.cd/Senser - 1994 - Stacked Up [Flac]', 13, '13 - Worth-.Flac')
) AS vals (album_path, track_number, new_path), album
WHERE
album.id = track.album_id
AND album.new_path = vals.album_path
AND track.track_num = vals.track_number;

ALTER TABLE album ALTER COLUMN new_path SET NOT NULL;
ALTER TABLE album RENAME COLUMN path TO old_path;
ALTER TABLE album RENAME COLUMN new_path TO path;

ALTER TABLE track ALTER COLUMN new_path SET NOT NULL;
ALTER TABLE track RENAME COLUMN path TO old_path;
ALTER TABLE track RENAME COLUMN new_path TO path;

CREATE TEMP TABLE album_rg (
    path text NOT NULL,
    rg_gain real NOT NULL,
    rg_peak real NOT NULL
);

CREATE TEMP TABLE track_rg (
    album_path text NOT NULL,
    path text NOT NULL,
    rg_gain real NOT NULL,
    rg_peak real NOT NULL
);

COPY album_rg (
    path, rg_gain, rg_peak
) FROM stdin;
kraytracker.com/Bandits of the Acoustic Revolution - A Call to Arms (FLAC)	-5.680000	0.977264
my/7000$ - 1 CD 10 Live Tracks (2006) {AOR CD 014-07}	-7.470001	0.987915
my/7000$ - ''Ты'' (2003) [FLAC] {С30454}	-8.099998	0.996765
my/7000$ - Хевибаксопопс (2006) {AOR CD 015-07}	-11.879997	1.000000
my/7раса - Иллюзия_ Майя (2006) {IG!CD-012D, 225CD-01D}	-11.940002	0.999969
my/Alai Oli - Satta Massagana (2011)	-8.269997	1.000000
my/Alai Oli - Да, бро (2007)	-7.150002	0.965942
my/Alai Oli - Равновесие_Глубина (2016)	-5.830002	0.999969
my/Alai Oli - Снежная барселона (2008)	-6.090004	0.977722
my/Atakama - Звёзды (2009) {SZCD 6278-09}	-10.449997	0.998810
my/Dilly Dally - Южный берег (2014)	-9.980003	0.999969
my/Distemper - Ska Punk Шпионы (2000) {BRP001}	-9.400002	1.000000
my/Distemper - Внатуре! Алё!! Хорош!!! (1997-2002) {BRP005, DR2002}	-13.050003	0.999725
my/Distemper - Всё или ничего (2009) {SAPCD 201}	-11.059998	1.000000
my/Distemper - Гордость вера любовь (2013) [FLAC] {SAPCD 238D}	-9.800003	1.000000
my/Distemper - Мир создан для тебя (2007)	-8.989998	0.954926
my/Distemper - Получить ответ (2010) {SAPCD 165}	-9.540001	1.000000
my/Dёргать! - В ж...пу телевизор! (2004) {SAPCD 017}	-8.410004	1.000000
my/Dёргать! - Секрет жизни (2007) {SAPCD 102}	-10.449997	0.981903
my/E-Sex-T - Рассуди, обдумай, взвесь (2009)	-11.080002	0.994415
my/F.P.G. - Punk Jazz (2008) {NR 2408 CD}	-6.440002	0.998993
my/F.P.G. - Стихия (2010) {NR 2210 CD}	-10.510002	1.000000
my/Good Times - Как зверь (2016)	-11.410004	0.988739
my/Little Big - Funeral Rave (2015)	-9.050003	0.977264
my/Little Big - With Russia from Love (2014)	-10.709999	1.000000
my/Private Radio - Keep It Always Loud (2007) {SAPCD 140}	-8.699997	0.966309
my/Private Radio - Rock Star (2008) {SAPCD 171}	-9.680000	1.000000
my/Private Radio - Where Is Your Mind (2010) {SAPCD 192}	-9.590004	0.988495
my/Private Radio - Why (2013)	-10.250000	1.000000
my/Sakura - Письмо-исповедь ответа не требует (2007) {CD-M+013-2}	-10.190002	0.999146
my/Shootki - The Skatastrophe (2005) {BRP 039}	-8.959999	0.967987
my/Skafandr - Навстречу солнцу и свету (2002)	-8.690002	1.000000
my/Skafandr - Тяжёлый шар земной (2007)	-12.820000	0.999969
my/Skaльпель - Postcard (2008) {SAPCD 176}	-9.370003	1.000000
my/Suspense Heroes Syndicate - Confident (2010)	-8.769997	1.000000
my/The Poseurs - The Poseurs (2011) {RUF009}	-9.300003	1.000000
my/Truckdrivers - Делай, что должен, и будь, что будет (2016)	-10.970001	0.983215
my/Various Artists - Ska Punk Kids 2 (2005)	-8.010002	1.000000
my/Various Artists - Ska-Punk Universe (2008) {SAPCD 151}	-10.709999	1.000000
my/Various Artists - Take It Easy (2005) {GR-PR-0003}	-8.730003	0.966095
my/Various Artists - Tribute to Distemper (2010) {SAPCD 193}	-11.139999	1.000000
my/Бригадный Подряд - Новый сезон (2015)	-9.309998	1.000000
my/Лампасы - Лампаццирия (2006)	-10.650002	1.000000
my/Лампасы - Марафон (2010)	-6.519997	1.000000
my/Ляпис Трубецкой - Весёлые картинки (2011) {SZCD 7224-11}	-10.690002	1.000000
my/Паразиты - Прости меня (2009)	-11.470001	1.000000
my/Порт (812) - Всё в твоих руках (2006)	-11.099998	1.000000
my/Психея - 10 Years of Greatest Shits	-8.910004	1.000000
my/Психея - Оттенки любви (2014)	-10.550003	1.000000
my/Чёрный обелиск - Стена (1994) {MZ-121-2}	-7.730003	0.981720
my/Элизиум - 13 (2008) {225CD-15}	-11.230003	1.000000
my/Элизиум - Глупый стеб, попса... и никаких революций! (1999) {SAPCD 042}	-9.739998	0.978027
my/Элизиум - Радуга Live (2007)	-7.169998	1.000000
my/Элизиум - Снегири и драконы (2015)	-12.040001	0.983765
redacted.ch/17 Reasons	-7.190002	0.999969
redacted.ch/1975 - A Night At The Opera - MFSL UDCD 568 - 1992	-3.379997	0.967560
redacted.ch/1983 - Labour Of Love	-0.239998	0.964294
redacted.ch/[1989] The Real Thing	-3.769997	0.999969
redacted.ch/[1991] - Sailing the Seas of Cheese	-2.459999	0.995850
redacted.ch/[1992] Automatic For The People (2005 DVD-A 2.0 24-48)	-5.400002	1.000000
redacted.ch/1992 - The Longest Line [EP]	-6.980003	0.984375
redacted.ch/[1992] - White Trash, Two Heebs, And A Bean (FLAC)	-7.620003	0.962341
redacted.ch/1993 - Chaos A.D	-7.900002	0.999969
redacted.ch/1996 - Losing Streak (FLAC)	-11.419998	1.000000
redacted.ch/1998 - 77 Days [FLAC]	-8.000000	0.966125
redacted.ch/[1998] Oceanborn	-10.239998	0.988647
redacted.ch/2003 - 1й круг	-10.660004	0.982269
redacted.ch/2003 Just One More	-10.209999	0.988739
redacted.ch/(2003) Through The Ashes Of Empires	-9.389999	1.000000
redacted.ch/2004 - Once	-9.010002	0.977264
redacted.ch/2004 The Silent Force [FLAC]	-10.190002	1.000000
redacted.ch/[2005] Whatever People Say I Am, That's What I'm Not	-9.239998	0.999451
redacted.ch/2006 - Never Trust A Hippy [EP]	-9.500000	0.977295
redacted.ch/2008 - The Art Of Saying Nothing	-10.669998	1.000000
redacted.ch/2010 - Immersion	-9.930000	1.000000
redacted.ch/[2011] Sunny Side Of The Street	-8.150002	0.977203
redacted.ch/[2013] MC Rises (FLAC)	-6.900002	1.000000
redacted.ch/311 - 311	-7.090004	0.989502
redacted.ch/311 - From Chaos	-7.809998	0.988647
redacted.ch/311 - Grassroots	-5.989998	0.983368
redacted.ch/65daysofstatic - The Fall Of Math	-11.400002	1.000000
redacted.ch/7paca - Kacheli [FLAC]	-11.739998	0.982269
redacted.ch/Abney Park - Lost Horizons (2008)	-7.340004	0.988617
redacted.ch/ Acoustic Ladyland - 2006 - Skinny Grin	-10.070000	0.998901
redacted.ch/Against All Authority - All Fall Down (FLAC)	-10.559998	0.988739
redacted.ch/Agnostic Front -1998- Something's Gotta Give (FLAC)	-9.440002	0.993073
redacted.ch/All That Remains - Overcome (2008) [FLAC]	-9.440002	0.999847
redacted.ch/All That Remains - The Fall Of Ideals - FLAC	-10.650002	0.966766
redacted.ch/Animals As Leaders - Animals As Ledars [2009] [FLAC]	-8.120003	1.000000
redacted.ch/ANTI-FLAG - FOR BLOOD AND EMPIRE [2006][FLAC]	-10.550003	0.998718
redacted.ch/A Perfect Circle - eMOTIVe [2004] [FLAC]	-8.559998	0.999969
redacted.ch/A Perfect Circle - Thirteenth Step [2003] [FLAC]	-7.260002	1.000000
redacted.ch/A Poet's Life	-9.080002	0.998993
redacted.ch/Arcane Roots - Blood & Chemistry (2013) [FLAC]	-10.989998	1.000000
redacted.ch/Asian Dub Foundation - 2005 - Tank (FLAC)	-7.040001	0.980682
redacted.ch/Atari Teenage Riot - Delete Yourself!	-8.260002	0.987579
redacted.ch/Authority Zero - A Passage In Time	-10.730003	0.999969
redacted.ch/Autonomads - 2013 - No Mans Lands	-5.860001	1.000000
redacted.ch/Babyboom - 2007 - Babyboom [FLAC]	-8.370003	0.988525
redacted.ch/Bad Brains	-5.379997	1.000000
redacted.ch/Bad Religion - 2004 - Los Angeles Is Burning [FLAC]	-10.849998	1.000000
redacted.ch/Bad Religion - Stranger Than Fiction (European Release)	-6.370003	0.977234
redacted.ch/Bandits of the Acoustic Revolution - A Call To Arms	-5.680000	0.977264
redacted.ch/Beastie Boys - The In Sound From Way Out! (FLAC)	-5.629997	0.977325
redacted.ch/Beatsteaks - 2002 - Living Targets (FLAC)	-9.449997	1.000000
redacted.ch/Beatsteaks - 2011 - Boombox	-10.150002	0.988739
redacted.ch/Beatsteaks - {2014} Beatsteaks [FLAC]	-9.840004	0.999146
redacted.ch/Beatsteaks - 23 Singles (2015) - FLAC	-9.440002	1.000000
redacted.ch/Beatsteaks - Smack Smash	-8.760002	0.981567
redacted.ch/Billy Talent - Billy Talent II - [2006-FLAC-Lossless]	-10.370003	0.988556
redacted.ch/Black Flag - 1981 - Damaged	-1.150002	0.781616
redacted.ch/Black Sabbath - 1970 - Paranoid  [FLAC]	-2.470001	1.000000
redacted.ch/Bob Marley & The Wailers - Exodus (MFSL Remaster) - FLAC	-1.330002	1.000000
redacted.ch/Bomb The Music Industry Get Warmer FLAC Log	-10.199997	0.990570
redacted.ch/Bomb The Music Industry!-Scrambles FLAC	-11.090004	0.999969
redacted.ch/Buckethead - Colma [1998.FLAC]	-7.949997	0.988617
redacted.ch/Buck_O_Nine-Twenty-Eight_Teeth-1997-LOSSLESS-VLR	-10.680000	0.999023
redacted.ch/Bullet For My Valentine - The Poison [FLAC]	-10.900002	1.000000
redacted.ch/Butthole Surfers - 1996 - Electriclarryland	-10.209999	0.999969
redacted.ch/Capdown - Civil Disobedients (FLAC)	-7.900002	0.999817
redacted.ch/Capdown - Time For Change (FLAC)	-7.150002	1.000000
redacted.ch/Catch 22 - 1998 - Keasbey Nights [FLAC]	-8.110001	0.966095
redacted.ch/Cold - Year Of The Spider (Flac)	-9.790001	0.999969
redacted.ch/Comeback Kid - Wake the Dead (2005) [FLAC]	-9.879997	0.989105
redacted.ch/Crazy Arm - Born To Ruin (2009) - FLAC	-9.769997	0.999969
redacted.ch/Crematory . 2008 . Pray	-10.000000	0.989899
redacted.ch/Daft Punk - Human After All - 2005 (CD - FLAC)	-9.040001	0.945038
redacted.ch/Dance Hall Crashers - 1995 - Lockjaw	-9.070000	1.000000
redacted.ch/Dance Hall Crashers - Purr FLAC	-9.029999	0.945129
redacted.ch/Death By Stereo - Into The Valley Of Death [CD] [FLAC]	-8.660004	0.977264
redacted.ch/Depeche Mode - Enjoy The Silence [FLAC]	-1.720001	1.000000
redacted.ch/Devotchkas - Live Fast... Die Young	-6.480003	1.000000
redacted.ch/Discovery	-5.529999	0.999969
redacted.ch/Distemper - 2001 - Доброе утро [CD]	-8.129997	0.999725
redacted.ch/Distemper - 2008 - My Undeground [CD]	-9.860001	0.977478
redacted.ch/Distemper - Distemper - 2004 (CD - FLAC - Lossless)	-6.690002	0.818909
redacted.ch/Distemper - Podumaj Kto Tvoi Druz'ja (Think Who Your Friends Are) - 2005 (CD - FLAC - Lossless)	-8.970001	1.000000
redacted.ch/Disturbed - Believe (2.0 44.1-24) (DVD-A)	-8.760002	1.000000
redacted.ch/Dolphin - Звезда (2004)	-8.760002	1.000000
redacted.ch/Donots	-9.809998	1.000000
redacted.ch/Downset - Downset	-6.730003	1.000000
redacted.ch/Dream Theater - Images And Words	-4.309998	0.999969
redacted.ch/Dub Incorporation - 2005 - Dans le Décor [FLAC]	-7.510002	1.000000
redacted.ch/Epica - Consign To Oblivion (2005) FLAC (WCD)	-7.099998	0.966064
redacted.ch/E-SEX-T - Время Слона (2007) What.cd	-12.190002	0.961731
redacted.ch/Everything Goes Numb	-8.500000	0.920929
redacted.ch/Exilia - 2006 - Nobody Excluded	-10.410004	0.983856
redacted.ch/Exilia - Unleashed	-10.930000	0.999847
redacted.ch/Faith No More - Angel Dust (1992)[MFSL]	-3.220001	0.994019
redacted.ch/Favourite Worst Nightmare	-9.750000	0.999237
redacted.ch/Fishbone - The Reality Of My Surroundings (1991) [FLAC]	-7.029999	1.000000
redacted.ch/Flobots - 2008 - Fight With Tools	-7.279999	0.999969
redacted.ch/Flogging Molly - Swagger (2000) [FLAC]	-8.540001	0.998016
redacted.ch/Foo Fighters - Everlong (UK CD Single 1)	-8.779999	0.979767
redacted.ch/F.P.G - 2001 - Гонщики	-9.080002	1.000000
redacted.ch/F.P.G. - 2004 - Гавнорок	-10.580002	0.995605
redacted.ch/Friend or FOE	-9.750000	1.000000
redacted.ch/God Is An Astronaut - All Is Violent, All Is Bright	-10.570000	0.999969
redacted.ch/Gogol Bordello - Super Taranta! [FLAC]	-10.239998	0.999969
redacted.ch/Goldfinger - 2000 - Stomping Ground (FLAC)	-9.090004	0.988678
redacted.ch/Goldfinger - 99 Red Balloons [FLAC]	-8.510002	0.988678
redacted.ch/Green Day - Basket Case (CDS)	-4.989998	0.988922
redacted.ch/Guano Apes - Bel Air (2011) - [FLAC]	-10.650002	0.998749
redacted.ch/Guano Apes - Proud Like A God (1997)	-6.389999	0.999969
redacted.ch/(hed)p.e. - 2000 - Broke - FLAC	-10.480003	1.000000
redacted.ch/Hiromi - Alive (2014) [FLAC]	-4.779999	0.975952
redacted.ch/Horrorpops - 2005 - Bring It On!	-10.199997	0.972260
redacted.ch/Horrorpops - Hell Yeah! - lossless	-8.970001	1.000000
redacted.ch/How It Goes	-12.489998	1.000000
redacted.ch/Ignite - Our Darkest Days - 2006 (CD - FLAC - Lossless)	-9.110001	0.988647
redacted.ch/Imperial Leisure - 2012 - Death To The One Trick Pony[FLAC]	-5.989998	0.966217
redacted.ch/Infected Rain - Embrace Eternity (2014)	-10.099998	1.000000
redacted.ch/Inner Circle-Bad Boys [FLAC]	-5.110001	0.972870
redacted.ch/Irie Révoltés - Allez [FLAC] {2013}	-9.699997	0.988129
redacted.ch/Iron Maiden (1986) - Somewhere In Time [FLAC]	-3.320000	1.000000
redacted.ch/Iron Maiden (1992) - Fear Of The Dark [FLAC]	-5.459999	0.931061
redacted.ch/Iron Maiden - Iron Maiden (1980)	-6.550003	0.977234
redacted.ch/Izia - 2011 - So Much Trouble [FLAC]	-10.989998	1.000000
redacted.ch/Jaya The Cat - 2012 - The New International Sound Of Hedonism[FLAC]	-8.570000	1.000000
redacted.ch/Jaya The Cat - More Late Night Transmissions With (2007) [FLAC]	-7.230003	1.000000
redacted.ch/Jefferson Airplane - Surrealistic Pillow	-5.760002	1.000000
redacted.ch/Joe Satriani  - Surfing With The Alien (MFSL - UDCD-751)	-4.070000	1.000000
redacted.ch/King Blues - Save The World, Get The Girl	-10.430000	1.000000
redacted.ch/King Prawn - 2003 - Got The Thirst [FLAC]	-8.629997	0.989319
redacted.ch/Kittie - Brackish (2000) [FLAC] {ATM 668952 2}	-9.160004	0.998718
redacted.ch/KMFDM - Symbols	-8.250000	0.982880
redacted.ch/Korn - Follow The Leader	-7.949997	0.988556
redacted.ch/Lacuna Coil - Karmacode [2006] [FLAC]	-7.510002	0.990387
redacted.ch/Leftover Crack and Citizen Fish - Deadline	-8.519997	0.977081
redacted.ch/Leftover Crack - Fuck World Trade - FLAC	-10.620003	0.991333
redacted.ch/Less Than Jake - In with the out crowd (Flac)	-10.400002	0.998901
redacted.ch/Limbo Messiah	-9.660004	0.999939
redacted.ch/Limp Bizkit - Chocolate Starfish And The Hot Dog Flavored Water	-10.480003	0.999969
redacted.ch/Lindsey Stirling - Lindsey Stirling	-8.489998	1.000000
redacted.ch/Long Beach Dub Allstars - Wonders Of The World - 2001 (CD - FLAC - Lossless)	-10.790001	0.988647
redacted.ch/Los Lobos - Kiko [FLAC] (What.cd)	-4.440002	1.000000
redacted.ch/Machine Head - Burn my eyes [1994] flac	-9.129997	1.000000
redacted.ch/Mad Caddies - Keep It Going [FLAC]	-9.440002	1.000000
redacted.ch/Madness - One Step Beyond (Remaster) [1979]	-10.389999	0.984314
redacted.ch/MAN WITH A MISSION - The World's On Fire (2016) [FLAC]	-11.889999	0.988525
redacted.ch/Megadeth - Countdown To Extinction (Remixed & Remastered) [MFSL] - 1992 [FLAC]	-8.690002	0.988525
redacted.ch/Megadeth - Endgame	-10.129997	0.988708
redacted.ch/Megadeth-Rust_In_Peace-Original-1990-FLAC	-3.739998	0.999969
redacted.ch/Melbourne Ska Orchestra - Melbourne Ska Orchestra (2013) [FLAC]	-4.540001	1.000000
redacted.ch/Messer Chups - Zombie Shopping (2007) [FLAC]	-8.559998	0.960571
redacted.ch/Metallica - Ride The Lightning (1984) - 1989 Vertigo 838 140-2 - FLAC	-4.370003	1.000000
redacted.ch/Mighty Mighty Bosstones, The - 1993 - Ska-Core, The Devil And More	-2.480003	1.000000
redacted.ch/Mighty Mighty Bosstones - The Magic of Youth-2011 (FLAC)	-11.129997	1.000000
redacted.ch/Mindless Self Indulgence (2005) You'll Rebel to Anything [FLAC]	-9.360001	0.999207
redacted.ch/Misfits - Famous Monsters	-9.309998	0.998962
redacted.ch/Misfits - Static Age  (1997) [FLAC]	-6.900002	0.999969
redacted.ch/Modest Mouse - Good News For People Who Love Bad News [FLAC]	-8.989998	0.999969
redacted.ch/Molotov - 1997 - Donde Jugaran Las Ninas	-8.599998	1.000000
redacted.ch/Mouthwash - 1000 Dreams FLAC	-9.900002	0.998871
redacted.ch/Mustard_Plug-Big_Daddy_Multitude-1993-LOSSLESS-VLR	-2.180000	0.999969
redacted.ch/Nevermore - 2005 - This Godless Endeavor [FLAC]	-9.389999	1.000000
redacted.ch/Nirvana - Nevermind MFSL UDCD 666	-3.769997	0.984100
redacted.ch/nobody.one - Does [2012]	-6.160004	0.941864
redacted.ch/nobody.one - Head Moves [2010][FLAC]	-8.989998	1.000000
redacted.ch/Nobody.One - The Wall Eater (2013) FLAC	-6.910004	1.000000
redacted.ch/NoComply - 2002 - Your Life Is Your Direction [FLAC]	-9.760002	0.983154
redacted.ch/NoComply - 2004 - With Windmills Turning Wrong Directions [FLAC]	-11.029999	1.000000
redacted.ch/No Doubt - Tragic Kingdom [1995] - FLAC	-7.699997	0.999969
redacted.ch/NOFX - 1994 - Punk in Drublic	-6.480003	0.996307
redacted.ch/NOFX - Pump Up The Valuum	-9.980003	0.988678
redacted.ch/Oingo Boingo - 1985 - Dead Man's Party	-3.809998	0.911407
redacted.ch/Pepper - 2006 - No Shame (FLAC)	-9.570000	1.000000
redacted.ch/Peter Bjorn and John - Writer's Block (2006) [FLAC]	-8.959999	0.998840
redacted.ch/Placebo - Sleeping With Ghosts FLAC	-9.250000	0.947083
redacted.ch/Play	-6.129997	0.999969
redacted.ch/Portishead - Dummy (1994) [FLAC] {Go! Beat Records 828 553-2}	-7.160004	0.977234
redacted.ch/Raised Fist - Dedication	-10.620003	0.988922
redacted.ch/Raised Fist - Veil Of Ignorance - FLAC	-9.269997	1.000000
redacted.ch/Rancid - Indestructible (2003) FLAC	-12.199997	0.996948
redacted.ch/Razika - Program 91 (2011) - FLAC	-7.669998	0.988037
redacted.ch/!Razika - Ut til de andre (2015) [flac]	-9.370003	0.988708
redacted.ch/Red Hot Chili Peppers - 1989 - Mother's Milk (MFSL)	-3.459999	0.981110
redacted.ch/Red Hot Chili Peppers - By The Way (2002) [FLAC]	-10.019997	0.999969
redacted.ch/Reel Big Fish - 1996 - Turn The Radio Off (FLAC)	-7.080002	0.958984
redacted.ch/Reel Big Fish - 2002 - Cheer Up! [FLAC]	-10.150002	1.000000
redacted.ch/Refused - The Shape Of Punk To Come DVD-Audio 2.0	-5.970001	1.000000
redacted.ch/Rise Against - 2006 - The Sufferer & the Witness	-10.080002	1.000000
redacted.ch/Rise Against - 2011 - Endgame [FLAC]	-10.559998	1.000000
redacted.ch/Rise Against - Revolutions Per Minute (2003) [FLAC]	-10.959999	0.966309
redacted.ch/Rotfront - 2011 - Visafree [FLAC]	-10.459999	0.990967
redacted.ch/Rubblebucket-OmegaLaLa(FLAC)	-7.660004	0.988586
redacted.ch/!Rudiments - Circle Our Empire [FLAC]	-9.949997	0.999542
redacted.ch/!Run Your Pockets (FLAC)	-11.300003	1.000000
redacted.ch/Selah Sue	-9.040001	0.988525
redacted.ch/!Senser - How To Do Battle FLAC (2009)	-11.279999	1.000000
redacted.ch/Sex Pistols - Never Mind the Bollocks, Here's The Sex Pistols (1977) [FLAC]	-3.709999	1.000000
redacted.ch/Siren Song Of The Counter Culture	-9.820000	1.000000
redacted.ch/!Skafandr - 2006 - Убить Голос FLAC	-10.989998	1.000000
redacted.ch/slapstick [1997]	-4.830002	0.999969
redacted.ch/Slightly Stoopid - 2012 - Top Of The World [FLAC]	-8.370003	1.000000
redacted.ch/Slightly Stoopid - Closer To The Sun (2005) [FLAC]	-9.449997	0.999725
redacted.ch/Slightly Stoopid - Everything You Need (2003) [CD FLAC]	-9.419998	0.999420
redacted.ch/Slightly Stoopid - Slightly Not Stoned Enough To Eat Breakfast Yet Stoopid - 2008 (CD - FLAC - Lossless)	-8.669998	1.000000
redacted.ch/Slightly Stoopid - Slighty $toopid (1996) [FLAC]	-6.340004	0.999939
redacted.ch/!Sonic Boom Six - 2005 - Sounds to Consume- Champion Edition[FLAC]	-10.870003	1.000000
redacted.ch/!Sonic Boom Six - 2007 - All In [FLAC]	-10.010002	1.000000
redacted.ch/!Sonic Boom Six - 2008 - Play On - Rare, Rejected & Arcade Perfected [FLAC]	-10.349998	1.000000
redacted.ch/!Sonic Boom Six - 2011 - New Style Rocka [FLAC]	-9.730003	0.977203
redacted.ch/Star Fucking Hipsters - Until We're Dead (2008) [FLAC]	-8.790001	0.988953
redacted.ch/Stick Figure - Burnin' Ocean (2008)	-8.440002	0.998871
redacted.ch/Streetlight Manifesto - The Hands That Thieve (2013) [FLAC] {Victory Records - VR614-CD}	-9.889999	0.991364
redacted.ch/Strike Anywhere - 2006 - Dead FM	-10.199997	0.999298
redacted.ch/Tegan & Sara - So Jealous	-9.290001	0.901428
redacted.ch/!Tequilajazzz - Целлулоид (2009) [FLAC]	-8.199997	0.988922
redacted.ch/The Cat Empire (2003)	-7.820000	1.000000
redacted.ch/The Cranberries - Everybody Else Is Doing It, So Why Can't We (514 156-2) [FLAC]	-2.320000	0.999359
redacted.ch/The Cranberries - No Need To Argue (1994) [FLAC]	-4.930000	0.994232
redacted.ch/The Dirty Heads - Any Port in a Storm (2010) - FLAC	-9.590004	0.999969
redacted.ch/The Distillers - 2002 - Sing Sing Death House [FLAC]	-10.830002	1.000000
redacted.ch/The Flatliners - Cavalcade (2010) [FLAC]	-9.980003	0.999878
redacted.ch/The Flatliners - Dead Language (2013) [FLAC]	-9.930000	1.000000
redacted.ch/The Hot 8 Brass Band - Rock With the Hot 8 (2007) [FLAC] {TRU CD 141}	-10.540001	0.977509
redacted.ch/!The Jam - Sound Affects and All Mod Cons [MFSL]	-4.320000	0.999969
redacted.ch/The Mighty Mighty Bosstones - Let's Face It	-8.879997	1.000000
redacted.ch/The Mighty Mighty Bosstones - Pay Attention (2000) [FLAC]	-10.309998	0.998657
redacted.ch/The Mighty Mighty Bosstones - Pin Points and Gin Joints [FLAC]	-10.750000	0.988647
redacted.ch/The Mighty Mighty BossTones - Question The Answers (1994) - flac	-7.160004	0.988556
redacted.ch/The Offspring - Defy You [FLAC]	-9.849998	1.000000
redacted.ch/Therapy; - 1994 - Troublegum	-7.790001	0.990387
redacted.ch/Therapy - Infernal Love (1995) [FLAC]	-7.599998	0.963287
redacted.ch/The Skatalites - 1997 - Foundation Ska (FLAC)	-6.120003	1.000000
redacted.ch/The Skints - 2009 - Live, Breathe, Build, Believe[FLAC]	-7.599998	0.977722
redacted.ch/The Skints - 2012 - Part & Parcel[FLAC]	-7.430000	0.999969
redacted.ch/The Skints - FM (2015) [FLAC] { Easy Star Records, ES-1046, 15 TRK }	-6.320000	0.976349
redacted.ch/The Specials - 1979 - Specials [FLAC]	-5.330002	0.978058
redacted.ch/The Suicide Machines - 1996 - Destruction by Definition [FLAC]	-10.610001	1.000000
redacted.ch/The Suicide Machines - War Profiteering is Killing Us All (2005) [FLAC]	-11.760002	1.000000
redacted.ch/Time Bomb	-6.769997	0.988678
redacted.ch/Tokyo Ska Paradise Orchestra {1990} Skapara Toujou [FLAC]	-5.050003	1.000000
redacted.ch/Tokyo Ska Paradise Orchestra - Perfect Future	-10.040001	0.995544
redacted.ch/Tool (1996) - Ænima [FLAC]	-7.620003	0.994446
redacted.ch/Tool (2001) - Lateralus [FLAC]	-7.169998	1.000000
redacted.ch/Transplants - Haunted Cities	-9.559998	0.990448
redacted.ch/Transplants - Transplants (Flac)	-10.790001	1.000000
redacted.ch/Two Door Cinema Club - 2010 - Tourist History [FLAC]	-10.570000	1.000000
redacted.ch/Useless ID - 2001 - Bad Story, Happy Ending	-8.660004	0.988556
redacted.ch/VA - Jazz from the USSR (1987) [FLAC] (MFSL)	-2.690002	1.000000
redacted.ch/Various Artists - 2006 - Forever Free- A Sublime Tribute Album {FLAC}	-10.470001	1.000000
redacted.ch/Velcra - Between Force and Fate (2005) [Flac]	-10.360001	1.000000
redacted.ch/Velcra - Consequences of Disobedience (2002) [Flac]	-9.040001	0.988586
redacted.ch/Walk Among Us	-3.370003	0.930878
redacted.ch/White Lies - 2011 - Ritual [FLAC]	-8.669998	0.980682
redacted.ch/White Lies - To Lose My Life	-10.000000	0.999695
redacted.ch/White Zombie - La Sexorcisto; Devil Music Vol. 1	-3.510002	1.000000
redacted.ch/WWIII	-8.340004	0.999969
redacted.ch/Yanka - Sold! (1989) FLAC	-5.410004	0.891235
redacted.ch/Youngblood Brass Band - 2006 - Is That A Riot [FLAC]	-8.529999	0.998993
redacted.ch/ZZ Top - Eliminator (1983)  [FLAC]	-6.680000	0.998352
redacted.ch/ZZ Top - Tres Hombres [FLAC]	-1.889999	0.955017
redacted.ch/Король и шут - 2001 - Герои и Злодеи [FLAC]	-6.680000	0.999969
redacted.ch/Король и Шут - Бунт на корабле (2004) FLAC	-9.790001	0.981750
redacted.ch/Крупский сотоварищи - Чужие песни и несколько своих (1997, flac)	-5.900002	0.935242
redacted.ch/Последние Танки в Париже - 2084 (2004, flac)	-8.260002	0.999176
redacted.ch/Психея - 2004 - Психея (1st Edition) (FLAC)	-11.430000	0.999207
redacted.ch/Психея - Дневники Одиночки (2009) [FLAC]	-9.440002	0.994324
redacted.ch/Химера - 1996 - Zudwa-Dwa [FLAC]	-4.809998	0.999969
redacted.ch/Элизиум - Космос (2003) [FLAC]	-6.779999	0.946106
waffles.fm/1981- Damaged	-1.150002	0.781616
waffles.fm/1992- Vulgar Display of Power	-5.720001	0.972900
waffles.fm/2001 - A Call To Arms	-5.680000	0.977264
waffles.fm/2006 - The Ruff Guide to Genre-Terrorism	-10.230003	1.000000
waffles.fm/Against Me! - New Wave (2007) [FLAC]	-11.209999	0.999969
waffles.fm/American Psycho (FLAC)	-9.029999	0.999969
waffles.fm/Atari Teenage Riot - Delete Yourself!	-8.260002	0.987579
waffles.fm/Babyboom - 2007 - Babyboom [FLAC]	-8.370003	0.988525
waffles.fm/Beastie Boys - Ill Communication	-6.320000	0.977234
waffles.fm/Children_Of_Bodom-Are_You_Dead_Yet-2005-LOSSLESS	-10.419998	0.977234
waffles.fm/Choking Victim - No Gods, No Managers (1999) [FLAC]	-12.330002	1.000000
waffles.fm/Dance Hall Crashers - Lockjaw - 1995 [FLAC]	-9.070000	1.000000
waffles.fm/Disturbed - Indestructable	-10.309998	1.000000
waffles.fm/donots - coma chameleon	-9.919998	0.999969
waffles.fm/Faith No More - Angel Dust {MFSL Gold} [FLAC]	-3.220001	0.994019
waffles.fm/Fear Factory - Archetype	-9.690002	1.000000
waffles.fm/Gogol Bordello - 2010 - Trans-Continental Hustle [88697 45965 2][waffles]	-11.199997	0.998535
waffles.fm/How To Do Battle (2009) -flac-	-11.279999	1.000000
waffles.fm/Joe Satriani - Surfing With The Alien - 1999 - Mobile Fidelity Sound Lab - UDCD-751	-4.070000	1.000000
waffles.fm/L7 - Bricks Are Heavy	-5.879997	1.000000
waffles.fm/Megadeth - Endgame	-10.129997	0.988708
waffles.fm/Miles Davis - Kind Of Blue	-4.160004	0.944153
waffles.fm/Mustard Plug - Evildoers Beware! (FLAC)	-8.830002	0.999969
waffles.fm/Nightwish - 2002 - Century Child	-7.370003	0.988647
waffles.fm/NOFX - 1994 - Punk in Drublic	-6.480003	0.996307
waffles.fm/Papa Roach - Infest	-10.019997	0.999969
waffles.fm/Rage Against The Machine - 1999 - The Battle Of Los Angeles	-8.790001	0.998901
waffles.fm/Raised Fist - 2006 - Sound Of The Republic	-8.739998	0.979340
waffles.fm/Rancid - And Out Come the Wolves (1995) [FLAC]	-9.230003	1.000000
waffles.fm/Random Hand - 2010 - Another Change Of Plan [FLAC]	-11.970001	1.000000
waffles.fm/Save Ferris - Modified	-9.449997	0.998871
waffles.fm/Sex Pistols - Never Mind the Bollocks, Here's The Sex Pistols (1977) [FLAC]	-3.709999	1.000000
waffles.fm/Skindred - Babylon (FLAC 1st issue)	-9.940002	0.998871
waffles.fm/Static-X - Wisconsin Death Trip [FLAC]	-8.830002	0.999969
waffles.fm/Streetlight Manifesto - [2003] Everything Goes Numb [FLAC 100%]	-8.500000	0.920929
waffles.fm/System of a Down - Toxicity	-10.190002	0.988831
waffles.fm/The Cure - Disintegration	-2.550003	0.977203
waffles.fm/The Flatliners - The Great Awake [2007-FLAC-Cue-Log]	-10.029999	0.999878
waffles.fm/The Mighty Mighty Bosstones - Let's Face It	-8.879997	1.000000
waffles.fm/The Mighty Mighty Bosstones - Pin Points and Gin Joints [FLAC]	-10.750000	0.988647
waffles.fm/The Offspring - Smash (1994) [FLAC]	-7.470001	0.946716
waffles.fm/VA - Skank For Brains [FLAC]	-3.730003	1.000000
what.cd/17 Reasons	-7.190002	0.999969
what.cd/1975 - A Night At The Opera - MFSL UDCD 568 - 1992	-3.379997	0.967560
what.cd/1983 - Labour Of Love	-0.239998	0.964294
what.cd/[1989] The Real Thing	-3.769997	0.999969
what.cd/[1991] - Sailing the Seas of Cheese	-2.459999	0.995850
what.cd/[1992] Automatic For The People (2005 DVD-A 2.0 24-48)	-5.400002	1.000000
what.cd/1992 - The Longest Line [EP]	-6.980003	0.984375
what.cd/[1992] - White Trash, Two Heebs, And A Bean (FLAC)	-7.620003	0.962341
what.cd/1993 - Chaos A.D	-7.900002	0.999969
what.cd/[1994] No Need To Argue	-4.930000	0.994232
what.cd/1996 - Losing Streak (FLAC)	-11.419998	1.000000
what.cd/1998 - 77 Days [FLAC]	-8.000000	0.966125
what.cd/[1998] Oceanborn	-10.239998	0.988647
what.cd/2003 - 1й круг	-10.660004	0.982269
what.cd/2003 Just One More	-10.209999	0.988739
what.cd/2003 Souvenirs	-8.220001	1.000000
what.cd/(2003) Through The Ashes Of Empires	-9.389999	1.000000
what.cd/2004 - Once	-9.010002	0.977264
what.cd/2004 The Silent Force [FLAC]	-10.190002	1.000000
what.cd/[2005] Whatever People Say I Am, That's What I'm Not	-9.239998	0.999451
what.cd/2006 - Never Trust A Hippy [EP]	-9.500000	0.977295
what.cd/(2007) - Chronichitis {FLAC}	-8.459999	1.000000
what.cd/2008 - The Art Of Saying Nothing	-10.669998	1.000000
what.cd/2010 - Immersion	-9.930000	1.000000
what.cd/[2011] Sunny Side Of The Street	-8.150002	0.977203
what.cd/[2013] MC Rises (FLAC)	-6.900002	1.000000
what.cd/(2015) - Slightly Stoopid - Meanwhile... Back in the Lab {FLAC}	-9.220001	1.000000
what.cd/311 - 311	-7.090004	0.989502
what.cd/311 - From Chaos	-7.809998	0.988647
what.cd/311 - Grassroots	-5.989998	0.983368
what.cd/65daysofstatic - The Fall Of Math	-11.400002	1.000000
what.cd/7paca - Kacheli [FLAC]	-11.739998	0.982269
what.cd/99sor	-10.150002	0.991455
what.cd/Abney Park - Lost Horizons (2008)	-7.340004	0.988617
what.cd/ Acoustic Ladyland - 2006 - Skinny Grin	-10.070000	0.998901
what.cd/Against All Authority - All Fall Down (FLAC)	-10.559998	0.988739
what.cd/Agnostic Front -1998- Something's Gotta Give (FLAC)	-9.440002	0.993073
what.cd/All That Remains - Overcome (2008) [FLAC]	-9.440002	0.999847
what.cd/All That Remains - The Fall Of Ideals - FLAC	-10.650002	0.966766
what.cd/Animals As Leaders - Animals As Ledars [2009] [FLAC]	-8.120003	1.000000
what.cd/ANTI-FLAG - FOR BLOOD AND EMPIRE [2006][FLAC]	-10.550003	0.998718
what.cd/A Perfect Circle - eMOTIVe [2004] [FLAC]	-8.559998	0.999969
what.cd/A Perfect Circle - Thirteenth Step [2003] [FLAC]	-7.260002	1.000000
what.cd/A Poet's Life	-9.080002	0.998993
what.cd/Asian Dub Foundation - 2005 - Tank (FLAC)	-7.040001	0.980682
what.cd/Atari Teenage Riot - Delete Yourself!	-8.260002	0.987579
what.cd/Authority Zero - A Passage In Time	-10.730003	0.999969
what.cd/Autonomads - 2013 - No Mans Lands	-5.860001	1.000000
what.cd/Babyboom - 2007 - Babyboom [FLAC]	-8.370003	0.988525
what.cd/Bad Brains	-5.379997	1.000000
what.cd/Bad Religion - 2004 - Los Angeles Is Burning [FLAC]	-10.849998	1.000000
what.cd/Bad Religion - Stranger Than Fiction (European Release)	-6.370003	0.977234
what.cd/Bandits of the Acoustic Revolution - A Call To Arms	-5.680000	0.977264
what.cd/Beastie Boys - The In Sound From Way Out! (FLAC)	-5.629997	0.977325
what.cd/Beatsteaks - 2002 - Living Targets (FLAC)	-9.449997	1.000000
what.cd/Beatsteaks - 2011 - Boombox	-10.150002	0.988739
what.cd/Beatsteaks - {2014} Beatsteaks [FLAC]	-9.840004	0.999146
what.cd/Beatsteaks - 23 Singles (2015) - FLAC	-9.440002	1.000000
what.cd/Beatsteaks - Smack Smash	-8.760002	0.981567
what.cd/Billy Talent - Billy Talent II - [2006-FLAC-Lossless]	-10.370003	0.988556
what.cd/Black Flag - 1981 - Damaged	-1.150002	0.781616
what.cd/Black Sabbath - 1970 - Paranoid  [FLAC]	-2.470001	1.000000
what.cd/Bob Marley & The Wailers - Exodus (MFSL Remaster) - FLAC	-1.330002	1.000000
what.cd/Bomb The Music Industry Get Warmer FLAC Log	-10.199997	0.990570
what.cd/Bomb The Music Industry!-Scrambles FLAC	-11.090004	0.999969
what.cd/Buckethead - Colma [1998.FLAC]	-7.949997	0.988617
what.cd/Buck_O_Nine-Twenty-Eight_Teeth-1997-LOSSLESS-VLR	-10.680000	0.999023
what.cd/Bullet For My Valentine - The Poison [FLAC]	-10.900002	1.000000
what.cd/Butthole Surfers - 1996 - Electriclarryland	-10.209999	0.999969
what.cd/Capdown - Civil Disobedients (FLAC)	-7.900002	0.999817
what.cd/Capdown - Time For Change (FLAC)	-7.150002	1.000000
what.cd/Catch 22 - 1998 - Keasbey Nights [FLAC]	-8.110001	0.966095
what.cd/Cat Empire, The (2005) Two Shoes {Aus} [FLAC]	-7.059998	1.000000
what.cd/Cold - Year Of The Spider (Flac)	-9.790001	0.999969
what.cd/Crazy Arm - Born To Ruin (2009) - FLAC	-9.769997	0.999969
what.cd/Crematory . 2008 . Pray	-10.000000	0.989899
what.cd/Daft Punk - Human After All - 2005 (CD - FLAC)	-9.040001	0.945038
what.cd/Dance Hall Crashers - 1995 - Lockjaw	-9.070000	1.000000
what.cd/Dance Hall Crashers - Purr FLAC	-9.029999	0.945129
what.cd/Depeche Mode - Enjoy The Silence [FLAC]	-1.720001	1.000000
what.cd/Devotchkas - Live Fast... Die Young	-6.480003	1.000000
what.cd/Discovery	-5.529999	0.999969
what.cd/Distemper - 2001 - Доброе утро [CD]	-8.129997	0.999725
what.cd/Distemper - 2008 - My Undeground [CD]	-9.860001	0.977478
what.cd/Distemper - Distemper - 2004 (CD - FLAC - Lossless)	-6.690002	0.818909
what.cd/Distemper - Podumaj Kto Tvoi Druz'ja (Think Who Your Friends Are) - 2005 (CD - FLAC - Lossless)	-8.970001	1.000000
what.cd/Distillers - Coral Fang	-9.699997	0.999969
what.cd/Disturbed - Believe (2.0 44.1-24) (DVD-A)	-8.760002	1.000000
what.cd/Dolphin - Звезда (2004)	-8.760002	1.000000
what.cd/Donots	-9.809998	1.000000
what.cd/Downset - Downset	-6.730003	1.000000
what.cd/Dream Theater - Images And Words	-4.309998	0.999969
what.cd/Dub Incorporation - 2005 - Dans le Décor [FLAC]	-7.510002	1.000000
what.cd/Epica - Consign To Oblivion (2005) FLAC (WCD)	-7.099998	0.966064
what.cd/E-SEX-T - Время Слона (2007) What.cd	-12.190002	0.961731
what.cd/Exilia - 2006 - Nobody Excluded	-10.410004	0.983856
what.cd/Exilia - Unleashed	-10.930000	0.999847
what.cd/Faith No More - Angel Dust (1992)[MFSL]	-3.220001	0.994019
what.cd/Favourite Worst Nightmare	-9.750000	0.999237
what.cd/Fishbone - The Reality Of My Surroundings (1991) [FLAC]	-7.029999	1.000000
what.cd/Flobots - 2008 - Fight With Tools	-7.279999	0.999969
what.cd/Flogging Molly - Swagger (2000) [FLAC]	-8.540001	0.998016
what.cd/Foo Fighters - Everlong (UK CD Single 1)	-8.779999	0.979767
what.cd/F.P.G - 2001 - Гонщики	-9.080002	1.000000
what.cd/F.P.G. - 2004 - Гавнорок	-10.580002	0.995605
what.cd/Friend or FOE	-9.750000	1.000000
what.cd/God Is An Astronaut - All Is Violent, All Is Bright	-10.570000	0.999969
what.cd/Gogol Bordello - Super Taranta! [FLAC]	-10.239998	0.999969
what.cd/Goldfinger - 2000 - Stomping Ground (FLAC)	-9.090004	0.988678
what.cd/Goldfinger - 99 Red Balloons [FLAC]	-8.510002	0.988678
what.cd/Green Day - Basket Case (CDS)	-4.989998	0.988922
what.cd/Guano Apes - Bel Air (2011) - [FLAC]	-10.650002	0.998749
what.cd/Guano Apes - Proud Like A God (1997)	-6.389999	0.999969
what.cd/(hed)p.e. - 2000 - Broke - FLAC	-10.480003	1.000000
what.cd/Hiromi - Alive (2014) [FLAC]	-4.779999	0.975952
what.cd/Horrorpops - 2005 - Bring It On!	-10.199997	0.972260
what.cd/Horrorpops - Hell Yeah! - lossless	-8.970001	1.000000
what.cd/How It Goes	-12.489998	1.000000
what.cd/Imperial Leisure - 2012 - Death To The One Trick Pony[FLAC]	-5.989998	0.966217
what.cd/Inner Circle-Bad Boys [FLAC]	-5.110001	0.972870
what.cd/Irie Révoltés - Allez [FLAC] {2013}	-9.699997	0.988129
what.cd/Iron Maiden (1986) - Somewhere In Time [FLAC]	-3.320000	1.000000
what.cd/Iron Maiden (1992) - Fear Of The Dark [FLAC]	-5.459999	0.931061
what.cd/Iron Maiden - Iron Maiden (1980)	-6.550003	0.977234
what.cd/Izia - 2011 - So Much Trouble [FLAC]	-10.989998	1.000000
what.cd/Jaya The Cat - 2012 - The New International Sound Of Hedonism[FLAC]	-8.570000	1.000000
what.cd/Jaya The Cat - More Late Night Transmissions With (2007) [FLAC]	-7.230003	1.000000
what.cd/Jefferson Airplane - Surrealistic Pillow	-5.760002	1.000000
what.cd/Joe Satriani - Flying In A Blue Dream - HDTRACKS - 96-24	-8.680000	0.891239
what.cd/Joe Satriani  - Surfing With The Alien (MFSL - UDCD-751)	-4.070000	1.000000
what.cd/King Blues - Save The World, Get The Girl	-10.430000	1.000000
what.cd/King Prawn - 2003 - Got The Thirst [FLAC]	-8.629997	0.989319
what.cd/Kittie - Brackish (2000) [FLAC] {ATM 668952 2}	-9.160004	0.998718
what.cd/KMFDM - Symbols	-8.250000	0.982880
what.cd/Korn - Follow The Leader	-7.949997	0.988556
what.cd/Lacuna Coil - Karmacode [2006] [FLAC]	-7.510002	0.990387
what.cd/Leftover Crack and Citizen Fish - Deadline	-8.519997	0.977081
what.cd/Leftover Crack - Fuck World Trade - FLAC	-10.620003	0.991333
what.cd/Less Than Jake - In with the out crowd (Flac)	-10.400002	0.998901
what.cd/Limbo Messiah	-9.660004	0.999939
what.cd/Limp Bizkit - Chocolate Starfish And The Hot Dog Flavored Water	-10.480003	0.999969
what.cd/Lindsey Stirling - Lindsey Stirling	-8.489998	1.000000
what.cd/Long Beach Dub Allstars - Wonders Of The World - 2001 (CD - FLAC - Lossless)	-10.790001	0.988647
what.cd/Los Lobos - Kiko [FLAC] (What.cd)	-4.440002	1.000000
what.cd/Machine Head - Burn my eyes [1994] flac	-9.129997	1.000000
what.cd/Mad Caddies - Keep It Going [FLAC]	-9.440002	1.000000
what.cd/Madness - One Step Beyond (Remaster) [1979]	-10.389999	0.984314
what.cd/Megadeth - Countdown To Extinction (Remixed & Remastered) [MFSL] - 1992 [FLAC]	-8.690002	0.988525
what.cd/Megadeth - Endgame	-10.129997	0.988708
what.cd/Megadeth-Rust_In_Peace-Original-1990-FLAC	-3.739998	0.999969
what.cd/Melbourne Ska Orchestra - Melbourne Ska Orchestra (2013) [FLAC]	-4.540001	1.000000
what.cd/Messer Chups - Zombie Shopping (2007) [FLAC]	-8.559998	0.960571
what.cd/Metallica - Ride The Lightning (1984) - 1989 Vertigo 838 140-2 - FLAC	-4.370003	1.000000
what.cd/Mighty Mighty Bosstones, The - 1993 - Ska-Core, The Devil And More	-2.480003	1.000000
what.cd/Mighty Mighty Bosstones - The Magic of Youth-2011 (FLAC)	-11.129997	1.000000
what.cd/Mindless Self Indulgence (2005) You'll Rebel to Anything [FLAC]	-9.360001	0.999207
what.cd/Misfits - Famous Monsters	-9.309998	0.998962
what.cd/Misfits - Static Age  (1997) [FLAC]	-6.900002	0.999969
what.cd/Modest Mouse - Good News For People Who Love Bad News [FLAC]	-8.989998	0.999969
what.cd/Molotov - 1997 - Donde Jugaran Las Ninas	-8.599998	1.000000
what.cd/Mouthwash - 1000 Dreams FLAC	-9.900002	0.998871
what.cd/Mustard_Plug-Big_Daddy_Multitude-1993-LOSSLESS-VLR	-2.180000	0.999969
what.cd/Nevermore - 2005 - This Godless Endeavor [FLAC]	-9.389999	1.000000
what.cd/Nirvana - Nevermind MFSL UDCD 666	-3.769997	0.984100
what.cd/nobody.one - Does [2012]	-6.160004	0.941864
what.cd/nobody.one - Head Moves [2010][FLAC]	-8.989998	1.000000
what.cd/Nobody.One - The Wall Eater (2013) FLAC	-6.910004	1.000000
what.cd/NoComply - 2002 - Your Life Is Your Direction [FLAC]	-9.760002	0.983154
what.cd/NoComply - 2004 - With Windmills Turning Wrong Directions [FLAC]	-11.029999	1.000000
what.cd/No Doubt - Tragic Kingdom [1995] - FLAC	-7.699997	0.999969
what.cd/NOFX - 1994 - Punk in Drublic	-6.480003	0.996307
what.cd/NOFX - Pump Up The Valuum	-9.980003	0.988678
what.cd/Oingo Boingo - 1985 - Dead Man's Party	-3.809998	0.911407
what.cd/Operation Ivy (1990) Energy	-7.930000	0.969727
what.cd/Ornette Coleman - The Shape Of Jazz To Come 24-192	-1.769997	0.991434
what.cd/Our Darkest Days	-9.110001	0.988647
what.cd/Pantera - 1990 - Cowboys From Hell [FLAC]	-4.610001	0.891235
what.cd/Papa Roach - Infest	-10.019997	0.999969
what.cd/Paul Gilbert - Get Out of My Yard (2006) - [FLAC]	-10.279999	0.988586
what.cd/Pepper - 2006 - No Shame (FLAC)	-9.570000	1.000000
what.cd/Peter Bjorn and John - Writer's Block (2006) [FLAC]	-8.959999	0.998840
what.cd/Pink Floyd - Dark Side of the Moon (OMR MFSL 24k Gold Ultradisc II)	0.800003	0.600952
what.cd/Placebo - Sleeping With Ghosts FLAC	-9.250000	0.947083
what.cd/Play	-6.129997	0.999969
what.cd/P.O.D. - Payable On Death	-10.449997	0.988617
what.cd/Porcupine Tree - Fear Of A Blank Planet (DVD-A) [24-48]	-3.989998	0.999724
what.cd/Portishead - Dummy (1994) [FLAC] {Go! Beat Records 828 553-2}	-7.160004	0.977234
what.cd/Post Orgasmic Chill	-8.820000	0.999969
what.cd/Raised Fist - Dedication	-10.620003	0.988922
what.cd/Raised Fist - From The North (2015) [CD FLAC]	-9.900002	1.000000
what.cd/Raised Fist - Veil Of Ignorance - FLAC	-9.269997	1.000000
what.cd/Rancid - Honor Is All We Know (2014) [FLAC]	-10.900002	1.000000
what.cd/Rancid - Indestructible (2003) FLAC	-12.199997	0.996948
what.cd/Random Hand - 2010 - Another Change Of Plan [FLAC]	-11.970001	1.000000
what.cd/Razika - Program 91 (2011) - FLAC	-7.669998	0.988037
what.cd/Razika - Ut til de andre (2015) [flac]	-9.370003	0.988708
what.cd/Rebelution - Courage to Grow (2007) [FLAC]	-6.120003	0.998993
what.cd/Red Hot Chili Peppers - By The Way (2002) [FLAC]	-10.019997	0.999969
what.cd/Red Hot Chili Peppers - Mother's Milk (1989) [MFSL] [FLAC]	-3.459999	0.981110
what.cd/Reel Big Fish - 1996 - Turn The Radio Off (FLAC)	-7.080002	0.958984
what.cd/Reel Big Fish - 2002 - Cheer Up! [FLAC]	-10.150002	1.000000
what.cd/Refused - The Shape Of Punk To Come DVD-Audio 2.0	-5.970001	1.000000
what.cd/Rise Against - 2006 - The Sufferer & the Witness	-10.080002	1.000000
what.cd/Rise Against - 2011 - Endgame [FLAC]	-10.559998	1.000000
what.cd/Rise Against - Revolutions Per Minute (2003) [FLAC]	-10.959999	0.966309
what.cd/Rotfront - VisaFree	-10.459999	0.990967
what.cd/Rubblebucket-OmegaLaLa(FLAC)	-7.660004	0.988586
what.cd/Rudiments - Circle Our Empire [FLAC]	-9.949997	0.999542
what.cd/Run Your Pockets (FLAC)	-11.300003	1.000000
what.cd/RX Bandits - ...And the Battle Begun	-9.470001	0.998901
what.cd/Satellite	-9.330002	0.998962
what.cd/Save Ferris - Modified	-9.449997	0.998871
what.cd/Selah Sue	-9.040001	0.988525
what.cd/Senser - How To Do Battle FLAC (2009)	-11.279999	1.000000
what.cd/Sepultura - Roots (1996) [FLAC]	-8.599998	0.999969
what.cd/Sex Pistols - Never Mind the Bollocks, Here's The Sex Pistols (1977) [FLAC]	-3.709999	1.000000
what.cd/Siren Song Of The Counter Culture	-9.820000	1.000000
what.cd/Skafandr - 2006 - Убить Голос FLAC	-10.989998	1.000000
what.cd/Ska-P (2002) !! Que Corra La Voz !! [FLAC]	-10.699997	1.000000
what.cd/Ska-P - 2008 - Lágrimas Y Gozos [FLAC]	-11.340004	0.989227
what.cd/Skatalites - 1997 - Foundation Ska [FLAC]	-6.120003	1.000000
what.cd/slapstick [1997]	-4.830002	0.999969
what.cd/Slightly Stoopid - 2005 - Closer To The Sun	-9.449997	0.999725
what.cd/Slightly Stoopid -Everything You Need (2003) [FLAC]	-9.419998	0.999420
what.cd/Slightly Stoopid -Top Of The World-2012-(CD-FLAC- Lossless)	-8.370003	1.000000
what.cd/Sonic Boom Six - 2005 - Sounds to Consume- Champion Edition[FLAC]	-10.870003	1.000000
what.cd/Sonic Boom Six - 2006 - The Ruff Guide to Genre-Terrorism	-10.230003	1.000000
what.cd/Sonic Boom Six - 2007 - All In [FLAC]	-10.010002	1.000000
what.cd/Sonic Boom Six - 2007 - Arcade Perfect	-9.750000	0.999908
what.cd/Sonic Boom Six - 2008 - Play On - Rare, Rejected & Arcade Perfected [FLAC]	-10.349998	1.000000
what.cd/Sonic Boom Six - 2009 - City Of Thieves FLAC	-11.800003	0.999969
what.cd/Sonic Boom Six - 2011 - New Style Rocka [FLAC]	-9.730003	0.977203
what.cd/Sonic Boom Six - 2012 - Sonic Boom Six[FLAC]	-11.199997	0.998199
what.cd/Sonic Youth - Goo (MFSL) [FLAC]	-4.050003	1.000000
what.cd/Soulfly - Primitive (Limited Edition) (Lossless)	-9.800003	1.000000
what.cd/Star Fucking Hipsters - Until We're Dead (2008) [FLAC]	-8.790001	0.988953
what.cd/Static-X - Wisconsin Death Trip [FLAC]	-8.830002	0.999969
what.cd/Streetlight Manifesto - 2003 - Everything Goes Numb	-8.500000	0.920929
what.cd/Streetlight Manifesto - Somewhere In The Between (FLAC) [what.cd]	-10.570000	0.991486
what.cd/Streetlight Manifesto - The Hands That Thieve (2013) [FLAC]	-9.889999	0.991364
what.cd/Strung Out - 1998 - Twisted By Design	-6.550003	1.000000
what.cd/Strung Out - Exile in Oblivion - 2004 (CD - FLAC - Lossless)	-10.129997	1.000000
what.cd/Sublime - 1992 - 40 oz. to Freedom [FLAC]	-7.610001	1.000000
what.cd/Sublime - 1994 - Robbin' The Hood	-6.029999	1.000000
what.cd/Sublime - Sublime	-8.239998	1.000000
what.cd/Sublime With Rome - Yours Truly (2011) [FLAC]	-8.980003	0.988647
what.cd/Suicide Machines - Destruction By Definition	-10.610001	1.000000
what.cd/Tegan & Sara - So Jealous	-9.290001	0.901428
what.cd/Tequilajazzz - Целлулоид (2009) [FLAC]	-8.199997	0.988922
what.cd/The Artist in the Ambulance	-10.239998	1.000000
what.cd/The Cat Empire (2003)	-7.820000	1.000000
what.cd/The Coral - 2002 - The Coral [FLAC]	-8.110001	0.999939
what.cd/The Cranberries - Everybody Else Is Doing It, So Why Can't We (514 156-2) [FLAC]	-2.320000	0.999359
what.cd/The Dirty Heads - Any Port in a Storm (2010) - FLAC	-9.590004	0.999969
what.cd/The Distillers - 2002 - Sing Sing Death House [FLAC]	-10.830002	1.000000
what.cd/The Flaming Tsunamis - 2006 - Fear Everything	-10.300003	1.000000
what.cd/The Flatliners-Cavalcade FLAC	-9.980003	0.999878
what.cd/The Flatliners - Dead Language-2013-FLAC	-9.930000	1.000000
what.cd/The Gathering - Disclosure (2012)	-8.660004	0.998718
what.cd/the gathering - if_then_else (2000)	-6.720001	0.999207
what.cd/The Hot 8 Brass Band - 2007 - Rock With the Hot 8 Brass Band	-10.540001	0.977509
what.cd/The Jam - Sound Affects and All Mod Cons [MFSL]	-4.320000	0.999969
what.cd/The Mighty Mighty Bosstones - Let's Face It	-8.879997	1.000000
what.cd/The Mighty Mighty Bosstones - Pay Attention (2000) [FLAC]	-10.309998	0.998657
what.cd/The Mighty Mighty Bosstones - Pin Points and Gin Joints [FLAC]	-10.750000	0.988647
what.cd/The Mighty Mighty BossTones - Question The Answers (1994) - flac	-7.160004	0.988556
what.cd/The Offspring - Americana [FLAC]	-9.300003	0.999969
what.cd/The Offspring - Defy You [FLAC]	-9.849998	1.000000
what.cd/The Offspring - Smash [FLAC]	-7.470001	0.946716
what.cd/The Police - Synchronicity (1983) [FLAC] (MFSL Gold)	-0.440002	0.977234
what.cd/The Reverend Horton Heat - Holy Roller - 24 Hits (1999) [flac]	-7.949997	1.000000
what.cd/The Selecter - Too Much Pressure - 1980 (Remaster)	-7.349998	0.988586
what.cd/The Skints - 2009 - Live, Breathe, Build, Believe[FLAC]	-7.599998	0.977722
what.cd/The Skints - 2012 - Part & Parcel[FLAC]	-7.430000	0.999969
what.cd/The Skints - FM (2015) [FLAC] { Easy Star Records, ES-1046, 15 TRK }	-6.320000	0.976349
what.cd/The Specials - 1979 - Specials [FLAC]	-5.330002	0.978058
what.cd/The Suicide Machines - War Profiteering Is Killing Us All (2005)	-11.760002	1.000000
what.cd/Thrice (2005) Vheissu [FLAC]	-11.180000	1.000000
what.cd/Time Bomb	-6.769997	0.988678
what.cd/Tokyo Ska Paradise Orchestra {1990} Skapara Toujou [FLAC]	-5.050003	1.000000
what.cd/Tokyo Ska Paradise Orchestra - Perfect Future	-10.040001	0.995544
what.cd/Tool (1996) - Ænima [FLAC]	-7.620003	0.994446
what.cd/Tool (2001) - Lateralus [FLAC]	-7.169998	1.000000
what.cd/T.R.A.M. - Lingua Franca	-7.550003	1.000000
what.cd/Transplants - Haunted Cities	-9.559998	0.990448
what.cd/Transplants - Transplants (Flac)	-10.790001	1.000000
what.cd/Two Door Cinema Club - 2010 - Tourist History [FLAC]	-10.570000	1.000000
what.cd/VA - Jazz from the USSR (1987) [FLAC] (MFSL)	-2.690002	1.000000
what.cd/Various Artists - 2006 - Forever Free- A Sublime Tribute Album {FLAC}	-10.470001	1.000000
what.cd/Velcra - Between Force and Fate (2005) [Flac]	-10.360001	1.000000
what.cd/Velcra - Consequences of Disobedience (2002) [Flac]	-9.040001	0.988586
what.cd/Walk Among Us	-3.370003	0.930878
what.cd/White Lies - 2011 - Ritual [FLAC]	-8.669998	0.980682
what.cd/White Lies - To Lose My Life	-10.000000	0.999695
what.cd/White Zombie - La Sexorcisto; Devil Music Vol. 1	-3.510002	1.000000
what.cd/WWIII	-8.340004	0.999969
what.cd/Yanka - Sold! (1989) FLAC	-5.410004	0.891235
what.cd/Youngblood Brass Band - 2006 - Is That A Riot [FLAC]	-8.529999	0.998993
what.cd/ZZ Top - Eliminator (1983)  [FLAC]	-6.680000	0.998352
what.cd/ZZ Top - Tres Hombres [FLAC]	-1.889999	0.955017
what.cd/Король и шут - 2001 - Герои и Злодеи [FLAC]	-6.680000	0.999969
what.cd/Король и Шут - Бунт на корабле (2004) FLAC	-9.790001	0.981750
what.cd/Крупский сотоварищи - Чужие песни и несколько своих (1997, flac)	-5.900002	0.935242
what.cd/Последние Танки в Париже - 2084 (2004, flac)	-8.260002	0.999176
what.cd/Психея - 2004 - Психея (1st Edition) (FLAC)	-11.430000	0.999207
what.cd/Психея - Дневники Одиночки (2009) [FLAC]	-9.440002	0.994324
what.cd/Химера - 1996 - Zudwa-Dwa [FLAC]	-4.809998	0.999969
what.cd/Элизиум - Космос (2003) [FLAC]	-6.779999	0.946106
bandcamp.com/The Middle Volga Social Club - 2016 - Give Me the Way	-7.559998	0.987579
soundcloud.com/Коля Маню - 2016 - Baadmantown	-8.050003	1.000000
bandcamp.com/El Mashe - 2016 - El Mashe	-9.769997	1.000000
\.

COPY track_rg (
    album_path, path, rg_gain, rg_peak
) FROM stdin;
kraytracker.com/Bandits of the Acoustic Revolution - A Call to Arms (FLAC)	01 - This Is A Call To Arms.flac	-4.309998	0.977264
kraytracker.com/Bandits of the Acoustic Revolution - A Call to Arms (FLAC)	02 - Heres To Life.flac	-5.519997	0.977264
kraytracker.com/Bandits of the Acoustic Revolution - A Call to Arms (FLAC)	03 - Dear Sergio.flac	-5.699997	0.977264
kraytracker.com/Bandits of the Acoustic Revolution - A Call to Arms (FLAC)	04 - Its A Wonderful Life.flac	-6.379997	0.977264
kraytracker.com/Bandits of the Acoustic Revolution - A Call to Arms (FLAC)	05 - They Provide The Paint For The Picture Perfect Masterpiece That You Will Paint On The Inside Of Your Eyelids.flac	-5.220001	0.977264
my/7000$ - 1 CD 10 Live Tracks (2006) {AOR CD 014-07}	01 - Вечность.flac	-7.260002	0.956085
my/7000$ - 1 CD 10 Live Tracks (2006) {AOR CD 014-07}	02 - Поздно.flac	-8.860001	0.987915
my/7000$ - 1 CD 10 Live Tracks (2006) {AOR CD 014-07}	03 - Тишина.flac	-6.320000	0.956085
my/7000$ - 1 CD 10 Live Tracks (2006) {AOR CD 014-07}	04 - На нервах.flac	-6.629997	0.956024
my/7000$ - 1 CD 10 Live Tracks (2006) {AOR CD 014-07}	05 - Не увидишь.flac	-7.910004	0.956085
my/7000$ - 1 CD 10 Live Tracks (2006) {AOR CD 014-07}	06 - Еноты.flac	-5.930000	0.956055
my/7000$ - 1 CD 10 Live Tracks (2006) {AOR CD 014-07}	07 - Менталитет.flac	-7.320000	0.956116
my/7000$ - 1 CD 10 Live Tracks (2006) {AOR CD 014-07}	08 - Бля.flac	-5.900002	0.901123
my/7000$ - 1 CD 10 Live Tracks (2006) {AOR CD 014-07}	09 - Тускнею.flac	-8.239998	0.956116
my/7000$ - 1 CD 10 Live Tracks (2006) {AOR CD 014-07}	10 - Дождь.flac	-6.449997	0.956024
my/7000$ - 1 CD 10 Live Tracks (2006) {AOR CD 014-07}	11 - Faith.flac	-6.370003	0.973206
my/7000$ - 1 CD 10 Live Tracks (2006) {AOR CD 014-07}	12 - Кукурузный бисквит.flac	-8.040001	0.983490
my/7000$ - ''Ты'' (2003) [FLAC] {С30454}	01 - Вечность.flac	-8.220001	0.994049
my/7000$ - ''Ты'' (2003) [FLAC] {С30454}	02 - КукуRуzный биzквит.flac	-7.760002	0.988556
my/7000$ - ''Ты'' (2003) [FLAC] {С30454}	03 - Тускнею....flac	-7.529999	0.988556
my/7000$ - ''Ты'' (2003) [FLAC] {С30454}	04 - Панк-рок герл.flac	-5.090004	0.464020
my/7000$ - ''Ты'' (2003) [FLAC] {С30454}	05 - Поздно!!!.flac	-6.150002	0.988739
my/7000$ - ''Ты'' (2003) [FLAC] {С30454}	06 - Про Love.flac	-8.349998	0.991455
my/7000$ - ''Ты'' (2003) [FLAC] {С30454}	07 - Не увидишь.flac	-7.900002	0.988556
my/7000$ - ''Ты'' (2003) [FLAC] {С30454}	08 - Менталитет.flac	-9.160004	0.988556
my/7000$ - ''Ты'' (2003) [FLAC] {С30454}	09 - Типа СКА и всё такое.flac	-8.010002	0.988220
my/7000$ - ''Ты'' (2003) [FLAC] {С30454}	10 - В самом себе.flac	-7.650002	0.988556
my/7000$ - ''Ты'' (2003) [FLAC] {С30454}	11 - Убей.flac	-8.620003	0.988556
my/7000$ - ''Ты'' (2003) [FLAC] {С30454}	12 - Дождь.flac	-8.330002	0.996765
my/7000$ - ''Ты'' (2003) [FLAC] {С30454}	13 - Твой первый день.flac	-7.879997	0.988525
my/7000$ - ''Ты'' (2003) [FLAC] {С30454}	14 - Бля.flac	-7.570000	0.988556
my/7000$ - ''Ты'' (2003) [FLAC] {С30454}	15 - Бля 2.flac	-7.570000	0.988556
my/7000$ - Хевибаксопопс (2006) {AOR CD 015-07}	01 - Intro.flac	-4.840004	0.999023
my/7000$ - Хевибаксопопс (2006) {AOR CD 015-07}	02 - Замутим пати!.flac	-11.930000	1.000000
my/7000$ - Хевибаксопопс (2006) {AOR CD 015-07}	03 - Stereo God,Shit.flac	-12.300003	1.000000
my/7000$ - Хевибаксопопс (2006) {AOR CD 015-07}	04 - Соки жизни.flac	-12.090004	1.000000
my/7000$ - Хевибаксопопс (2006) {AOR CD 015-07}	05 - Бежать!.flac	-11.849998	1.000000
my/7000$ - Хевибаксопопс (2006) {AOR CD 015-07}	06 - Джунгли зовут!.flac	-11.930000	1.000000
my/7000$ - Хевибаксопопс (2006) {AOR CD 015-07}	07 - Горечь.flac	-11.489998	1.000000
my/7000$ - Хевибаксопопс (2006) {AOR CD 015-07}	08 - Исчезай....flac	-10.510002	1.000000
my/7000$ - Хевибаксопопс (2006) {AOR CD 015-07}	09 - Кость в горле.flac	-11.209999	1.000000
my/7000$ - Хевибаксопопс (2006) {AOR CD 015-07}	10 - Ты услышишь....flac	-11.989998	1.000000
my/7000$ - Хевибаксопопс (2006) {AOR CD 015-07}	11 - Что ты медлишь.flac	-12.050003	1.000000
my/7000$ - Хевибаксопопс (2006) {AOR CD 015-07}	12 - Белый флаг.flac	-12.360001	1.000000
my/7000$ - Хевибаксопопс (2006) {AOR CD 015-07}	13 - Крик & Рык.flac	-12.389999	1.000000
my/7000$ - Хевибаксопопс (2006) {AOR CD 015-07}	14 - Outro.flac	-4.900002	0.999023
my/7000$ - Хевибаксопопс (2006) {AOR CD 015-07}	15 - Джунгли зовут! (remix).flac	-5.300003	1.000000
my/7раса - Иллюзия_ Майя (2006) {IG!CD-012D, 225CD-01D}	01 - Помни имя.flac	-11.000000	0.982269
my/7раса - Иллюзия_ Майя (2006) {IG!CD-012D, 225CD-01D}	02 - Māyā.flac	-2.680000	0.943481
my/7раса - Иллюзия_ Майя (2006) {IG!CD-012D, 225CD-01D}	03 - Урод.flac	-10.400002	0.959930
my/7раса - Иллюзия_ Майя (2006) {IG!CD-012D, 225CD-01D}	04 - Родятся дети.flac	-10.779999	0.982269
my/7раса - Иллюзия_ Майя (2006) {IG!CD-012D, 225CD-01D}	05 - На празднике бон.flac	-10.930000	0.982269
my/7раса - Иллюзия_ Майя (2006) {IG!CD-012D, 225CD-01D}	06 - Клетка (хроника одиночного безумия).flac	-9.690002	0.982269
my/7раса - Иллюзия_ Майя (2006) {IG!CD-012D, 225CD-01D}	07 - Все люди равны.flac	-12.660004	0.959930
my/7раса - Иллюзия_ Майя (2006) {IG!CD-012D, 225CD-01D}	08 - Май.flac	-10.779999	0.982269
my/7раса - Иллюзия_ Майя (2006) {IG!CD-012D, 225CD-01D}	09 - Горло города.flac	-11.389999	0.999969
my/7раса - Иллюзия_ Майя (2006) {IG!CD-012D, 225CD-01D}	10 - Из этого дома (Kent).flac	-10.320000	0.982269
my/7раса - Иллюзия_ Майя (2006) {IG!CD-012D, 225CD-01D}	11 - Тепла.flac	-13.459999	0.987915
my/7раса - Иллюзия_ Майя (2006) {IG!CD-012D, 225CD-01D}	12 - Samskāra.flac	-5.459999	0.982269
my/7раса - Иллюзия_ Майя (2006) {IG!CD-012D, 225CD-01D}	13 - Здесь.flac	-13.010002	0.982269
my/7раса - Иллюзия_ Майя (2006) {IG!CD-012D, 225CD-01D}	14 - Корабль бумажный.flac	-8.459999	0.982269
my/7раса - Иллюзия_ Майя (2006) {IG!CD-012D, 225CD-01D}	15 - Снаружи всех измерений.flac	-13.410004	0.865448
my/7раса - Иллюзия_ Майя (2006) {IG!CD-012D, 225CD-01D}	16 - Ты холодна (суп).flac	-11.279999	0.982269
my/Alai Oli - Satta Massagana (2011)	01 - Satta Massagana.flac	-8.440002	1.000000
my/Alai Oli - Satta Massagana (2011)	02 - Кто я.flac	-7.489998	1.000000
my/Alai Oli - Satta Massagana (2011)	03 - Лев умрёт за любовь.flac	-5.480003	1.000000
my/Alai Oli - Satta Massagana (2011)	04 - Дельфины.flac	-8.849998	1.000000
my/Alai Oli - Satta Massagana (2011)	05 - Прячься.flac	-6.840004	1.000000
my/Alai Oli - Satta Massagana (2011)	06 - Журавлики.flac	-7.349998	1.000000
my/Alai Oli - Satta Massagana (2011)	07 - Мексика.flac	-8.980003	1.000000
my/Alai Oli - Satta Massagana (2011)	08 - Постепенно.flac	-9.139999	1.000000
my/Alai Oli - Satta Massagana (2011)	09 - Дышу.flac	-4.949997	1.000000
my/Alai Oli - Satta Massagana (2011)	10 - Фрида.flac	-7.279999	1.000000
my/Alai Oli - Satta Massagana (2011)	11 - Крылья.flac	-8.199997	1.000000
my/Alai Oli - Satta Massagana (2011)	12 - Питерский флоу.flac	-7.919998	1.000000
my/Alai Oli - Satta Massagana (2011)	13 - Хочу остаться.flac	-8.000000	1.000000
my/Alai Oli - Да, бро (2007)	01 - Солнце и луна.flac	-7.230003	0.965820
my/Alai Oli - Да, бро (2007)	02 - Гавана.flac	-7.050003	0.965607
my/Alai Oli - Да, бро (2007)	03 - Джаманы.flac	-7.059998	0.965729
my/Alai Oli - Да, бро (2007)	04 - Natty Dread (feat. DadaDreadlocks).flac	-6.199997	0.965729
my/Alai Oli - Да, бро (2007)	05 - Февраль.flac	-6.849998	0.965637
my/Alai Oli - Да, бро (2007)	06 - Не отпускай тепло.flac	-7.510002	0.965668
my/Alai Oli - Да, бро (2007)	07 - На берегу реки.flac	-7.519997	0.965942
my/Alai Oli - Да, бро (2007)	08 - Греция.flac	-8.320000	0.965759
my/Alai Oli - Да, бро (2007)	09 - Не уходи.flac	-7.129997	0.965668
my/Alai Oli - Да, бро (2007)	10 - Над домами.flac	-4.410004	0.965729
my/Alai Oli - Да, бро (2007)	11 - Не грусти  (feat. Точка Отрыва).flac	-6.550003	0.965637
my/Alai Oli - Да, бро (2007)	12 - Демоны.flac	-2.379997	0.965851
my/Alai Oli - Да, бро (2007)	13 - Не будет войны.flac	-7.540001	0.965576
my/Alai Oli - Равновесие_Глубина (2016)	01 - xxxxx.flac	-5.080002	0.998932
my/Alai Oli - Равновесие_Глубина (2016)	02 - Ладони.flac	-5.989998	0.966095
my/Alai Oli - Равновесие_Глубина (2016)	03 - La la la.flac	-5.059998	0.966095
my/Alai Oli - Равновесие_Глубина (2016)	04 - Мост.flac	-6.379997	0.966095
my/Alai Oli - Равновесие_Глубина (2016)	05 - Поток.flac	-7.000000	0.966095
my/Alai Oli - Равновесие_Глубина (2016)	06 - Щастье.flac	-6.629997	0.966095
my/Alai Oli - Равновесие_Глубина (2016)	07 - Стены.flac	-5.129997	0.999969
my/Alai Oli - Равновесие_Глубина (2016)	08 - Варшава.flac	-6.050003	0.966095
my/Alai Oli - Равновесие_Глубина (2016)	09 - Perfect Day.flac	-4.580002	0.966095
my/Alai Oli - Равновесие_Глубина (2016)	10 - Черный.flac	-5.889999	0.966095
my/Alai Oli - Равновесие_Глубина (2016)	11 - Тлен.flac	-4.230003	0.966217
my/Alai Oli - Равновесие_Глубина (2016)	12 - Последняя песня.flac	-5.050003	0.966095
my/Alai Oli - Равновесие_Глубина (2016)	13 - Durge.flac	-6.239998	0.997864
my/Alai Oli - Снежная барселона (2008)	01 - Солнечный даб.flac	-5.669998	0.977631
my/Alai Oli - Снежная барселона (2008)	02 - Про Ману Чао.flac	-5.830002	0.977570
my/Alai Oli - Снежная барселона (2008)	03 - Я обещаю тебе.flac	-6.739998	0.977570
my/Alai Oli - Снежная барселона (2008)	04 - Ищу тебя.flac	-6.070000	0.977600
my/Alai Oli - Снежная барселона (2008)	05 - Рудбой.flac	-6.620003	0.977722
my/Alai Oli - Снежная барселона (2008)	06 - Каждый мой шаг.flac	-5.580002	0.977509
my/Alai Oli - Снежная барселона (2008)	07 - Спокойной ночи.flac	-5.590004	0.977539
my/Alai Oli - Снежная барселона (2008)	08 - Прости меня.flac	-5.989998	0.977539
my/Alai Oli - Снежная барселона (2008)	09 - Счастье есть.flac	-5.769997	0.977600
my/Alai Oli - Снежная барселона (2008)	10 - Не думать.flac	-5.919998	0.977509
my/Alai Oli - Снежная барселона (2008)	11 - Бог есть любовь.flac	-6.980003	0.977631
my/Alai Oli - Снежная барселона (2008)	12 - Сибирская рагга.flac	-6.540001	0.977600
my/Atakama - Звёзды (2009) {SZCD 6278-09}	01 - Тихо.flac	-10.760002	0.998810
my/Atakama - Звёзды (2009) {SZCD 6278-09}	02 - Ты.flac	-10.760002	0.998810
my/Atakama - Звёзды (2009) {SZCD 6278-09}	03 - Кому ты хочешь верить.flac	-10.419998	0.998810
my/Atakama - Звёзды (2009) {SZCD 6278-09}	04 - Дождь.flac	-10.250000	0.998810
my/Atakama - Звёзды (2009) {SZCD 6278-09}	05 - Весна.flac	-10.430000	0.998810
my/Atakama - Звёзды (2009) {SZCD 6278-09}	06 - Солнечный зайчик.flac	-10.220001	0.998810
my/Atakama - Звёзды (2009) {SZCD 6278-09}	07 - Звёзды.flac	-10.790001	0.998810
my/Atakama - Звёзды (2009) {SZCD 6278-09}	08 - Melody (Instrumental).flac	-9.169998	0.998810
my/Atakama - Звёзды (2009) {SZCD 6278-09}	09 - Я не ухожу.flac	-10.110001	0.998810
my/Atakama - Звёзды (2009) {SZCD 6278-09}	10 - Выбор твой.flac	-10.349998	0.998810
my/Dilly Dally - Южный берег (2014)	01 - Теплая.flac	-11.059998	0.999969
my/Dilly Dally - Южный берег (2014)	02 - Лень.flac	-8.820000	0.999969
my/Dilly Dally - Южный берег (2014)	03 - Камень с берега южного моря.flac	-9.209999	0.999969
my/Distemper - Ska Punk Шпионы (2000) {BRP001}	01 - Шпионы.flac	-8.160004	1.000000
my/Distemper - Ska Punk Шпионы (2000) {BRP001}	02 - День рождения , Троллейбус 27.flac	-9.599998	1.000000
my/Distemper - Ska Punk Шпионы (2000) {BRP001}	03 - Твои большие сиськи.flac	-9.360001	1.000000
my/Distemper - Ska Punk Шпионы (2000) {BRP001}	04 - Кончились наркотики.flac	-8.650002	1.000000
my/Distemper - Ska Punk Шпионы (2000) {BRP001}	05 - Джентельмены удачи 2000.flac	-9.529999	1.000000
my/Distemper - Ska Punk Шпионы (2000) {BRP001}	06 - Мы с Баем.flac	-11.169998	1.000000
my/Distemper - Ska Punk Шпионы (2000) {BRP001}	07 - 33 зуба.flac	-9.070000	1.000000
my/Distemper - Ska Punk Шпионы (2000) {BRP001}	08 - Coca Cola.flac	-9.650002	1.000000
my/Distemper - Ska Punk Шпионы (2000) {BRP001}	09 - 10$.flac	-10.220001	1.000000
my/Distemper - Ska Punk Шпионы (2000) {BRP001}	10 - Спит осторожная трава.flac	-9.260002	1.000000
my/Distemper - Ska Punk Шпионы (2000) {BRP001}	11 - Глаз , Неудачная любовь.flac	-9.800003	1.000000
my/Distemper - Ska Punk Шпионы (2000) {BRP001}	12 - Старый новый день.flac	-6.860001	1.000000
my/Distemper - Внатуре! Алё!! Хорош!!! (1997-2002) {BRP005, DR2002}	01 - Intro.flac	-12.900002	0.999725
my/Distemper - Внатуре! Алё!! Хорош!!! (1997-2002) {BRP005, DR2002}	02 - Громче.flac	-13.870003	0.999725
my/Distemper - Внатуре! Алё!! Хорош!!! (1997-2002) {BRP005, DR2002}	03 - Зловещий мир подъездов.flac	-12.660004	0.999725
my/Distemper - Внатуре! Алё!! Хорош!!! (1997-2002) {BRP005, DR2002}	04 - $10.flac	-12.790001	0.999725
my/Distemper - Внатуре! Алё!! Хорош!!! (1997-2002) {BRP005, DR2002}	05 - Старый новый день.flac	-12.419998	0.999725
my/Distemper - Внатуре! Алё!! Хорош!!! (1997-2002) {BRP005, DR2002}	06 - Банановая мечта.flac	-13.190002	0.999725
my/Distemper - Внатуре! Алё!! Хорош!!! (1997-2002) {BRP005, DR2002}	07 - Факел.flac	-12.500000	0.999725
my/Distemper - Внатуре! Алё!! Хорош!!! (1997-2002) {BRP005, DR2002}	08 - Может быть, ты дура.flac	-13.529999	0.999725
my/Distemper - Внатуре! Алё!! Хорош!!! (1997-2002) {BRP005, DR2002}	09 - День рождения.flac	-13.489998	0.999725
my/Distemper - Внатуре! Алё!! Хорош!!! (1997-2002) {BRP005, DR2002}	10 - Троллейбус №27.flac	-12.989998	0.999725
my/Distemper - Внатуре! Алё!! Хорош!!! (1997-2002) {BRP005, DR2002}	11 - 33 зуба.flac	-12.510002	0.999725
my/Distemper - Всё или ничего (2009) {SAPCD 201}	01 - Выбираем плюс.flac	-10.860001	1.000000
my/Distemper - Всё или ничего (2009) {SAPCD 201}	02 - Всё или ничего.flac	-11.279999	1.000000
my/Distemper - Всё или ничего (2009) {SAPCD 201}	03 - Дайте воздуха.flac	-11.090004	1.000000
my/Distemper - Всё или ничего (2009) {SAPCD 201}	04 - Смести приоритеты.flac	-11.320000	1.000000
my/Distemper - Всё или ничего (2009) {SAPCD 201}	05 - Сигнал.flac	-10.730003	1.000000
my/Distemper - Всё или ничего (2009) {SAPCD 201}	06 - Терять сознание от счастья.flac	-11.199997	1.000000
my/Distemper - Всё или ничего (2009) {SAPCD 201}	07 - Душит мир городов.flac	-11.360001	1.000000
my/Distemper - Всё или ничего (2009) {SAPCD 201}	08 - Когда-нибудь.flac	-10.840004	1.000000
my/Distemper - Всё или ничего (2009) {SAPCD 201}	09 - Руд-бои новой эры.flac	-11.010002	1.000000
my/Distemper - Всё или ничего (2009) {SAPCD 201}	10 - Переломные моменты.flac	-10.769997	1.000000
my/Distemper - Всё или ничего (2009) {SAPCD 201}	11 - Математика.flac	-10.989998	1.000000
my/Distemper - Гордость вера любовь (2013) [FLAC] {SAPCD 238D}	01 - Гордость.flac	-10.230003	1.000000
my/Distemper - Гордость вера любовь (2013) [FLAC] {SAPCD 238D}	02 - Кто ты.flac	-9.400002	1.000000
my/Distemper - Гордость вера любовь (2013) [FLAC] {SAPCD 238D}	03 - За позитивное мировоззрение.flac	-10.059998	1.000000
my/Distemper - Гордость вера любовь (2013) [FLAC] {SAPCD 238D}	04 - Мы ножи не носим.flac	-9.459999	1.000000
my/Distemper - Гордость вера любовь (2013) [FLAC] {SAPCD 238D}	05 - Получить ответ.flac	-9.760002	1.000000
my/Distemper - Гордость вера любовь (2013) [FLAC] {SAPCD 238D}	06 - Потусторонний.flac	-9.230003	1.000000
my/Distemper - Гордость вера любовь (2013) [FLAC] {SAPCD 238D}	07 - Нет нелегальных людей.flac	-9.900002	1.000000
my/Distemper - Гордость вера любовь (2013) [FLAC] {SAPCD 238D}	08 - Я умираю для тебя.flac	-10.160004	1.000000
my/Distemper - Гордость вера любовь (2013) [FLAC] {SAPCD 238D}	09 - Брутальный позитив.flac	-10.169998	1.000000
my/Distemper - Гордость вера любовь (2013) [FLAC] {SAPCD 238D}	10 - Совсем не так как в сказках.flac	-9.779999	1.000000
my/Distemper - Гордость вера любовь (2013) [FLAC] {SAPCD 238D}	11 - Шпионы (часть 2).flac	-9.570000	1.000000
my/Distemper - Гордость вера любовь (2013) [FLAC] {SAPCD 238D}	12 - Я заставлю тебя удивляться.flac	-9.590004	1.000000
my/Distemper - Гордость вера любовь (2013) [FLAC] {SAPCD 238D}	13 - Москва - Берлин.flac	-9.290001	1.000000
my/Distemper - Гордость вера любовь (2013) [FLAC] {SAPCD 238D}	14 - Я верю.flac	-9.980003	1.000000
my/Distemper - Мир создан для тебя (2007)	01 - Мир создан для тебя.flac	-8.239998	0.920959
my/Distemper - Мир создан для тебя (2007)	02 - От себя не убежать.flac	-9.510002	0.856476
my/Distemper - Мир создан для тебя (2007)	03 - Одеяла из крыш.flac	-9.279999	0.920898
my/Distemper - Мир создан для тебя (2007)	04 - Счастья полные карманы.flac	-8.480003	0.920898
my/Distemper - Мир создан для тебя (2007)	05 - Я меняюсь.flac	-9.220001	0.920868
my/Distemper - Мир создан для тебя (2007)	06 - Может всё приснилось.flac	-8.599998	0.920959
my/Distemper - Мир создан для тебя (2007)	07 - Отчего тебе так страшно.flac	-10.269997	0.954926
my/Distemper - Мир создан для тебя (2007)	08 - Пьяницы и дети.flac	-8.910004	0.920929
my/Distemper - Мир создан для тебя (2007)	09 - Город.flac	-8.540001	0.920837
my/Distemper - Мир создан для тебя (2007)	10 - Блеск в глазах.flac	-8.209999	0.920959
my/Distemper - Мир создан для тебя (2007)	11 - Мы обязательно вернёмся.flac	-8.379997	0.920990
my/Distemper - Получить ответ (2010) {SAPCD 165}	01 - Получить ответ.flac	-10.370003	1.000000
my/Distemper - Получить ответ (2010) {SAPCD 165}	02 - Головоломки.flac	-10.199997	1.000000
my/Distemper - Получить ответ (2010) {SAPCD 165}	03 - Получить ответ (инструментал).flac	-9.959999	1.000000
my/Distemper - Получить ответ (2010) {SAPCD 165}	04 - Мир создан для тебя.flac	-8.949997	1.000000
my/Distemper - Получить ответ (2010) {SAPCD 165}	05 - Тайна.flac	-9.750000	1.000000
my/Distemper - Получить ответ (2010) {SAPCD 165}	06 - Город.flac	-8.269997	1.000000
my/Distemper - Получить ответ (2010) {SAPCD 165}	07 - Пьяницы и дети.flac	-8.970001	1.000000
my/Distemper - Получить ответ (2010) {SAPCD 165}	08 - В зеркалах моей надежды.flac	-9.550003	1.000000
my/Distemper - Получить ответ (2010) {SAPCD 165}	09 - До утра гуляет город.flac	-8.919998	1.000000
my/Distemper - Получить ответ (2010) {SAPCD 165}	10 - Счастья полные карманы.flac	-8.180000	1.000000
my/Dёргать! - В ж...пу телевизор! (2004) {SAPCD 017}	01 - Весна.flac	-8.500000	0.981812
my/Dёргать! - В ж...пу телевизор! (2004) {SAPCD 017}	02 - Девки, пиво & панк-рок.flac	-7.769997	0.981812
my/Dёргать! - В ж...пу телевизор! (2004) {SAPCD 017}	03 - MTV.flac	-8.059998	0.987579
my/Dёргать! - В ж...пу телевизор! (2004) {SAPCD 017}	04 - В жопу телевизор.flac	-8.379997	0.981903
my/Dёргать! - В ж...пу телевизор! (2004) {SAPCD 017}	05 - Ботаны.flac	-8.029999	0.981812
my/Dёргать! - В ж...пу телевизор! (2004) {SAPCD 017}	06 - 430 руб. & полпакета травы.flac	-9.389999	0.981812
my/Dёргать! - В ж...пу телевизор! (2004) {SAPCD 017}	07 - Его любовь.flac	-8.650002	0.981812
my/Dёргать! - В ж...пу телевизор! (2004) {SAPCD 017}	08 - Песня №8.flac	-8.190002	0.981812
my/Dёргать! - В ж...пу телевизор! (2004) {SAPCD 017}	09 - Грустная песня.flac	-8.250000	1.000000
my/Dёргать! - В ж...пу телевизор! (2004) {SAPCD 017}	10 - МГУ.flac	-8.000000	0.981812
my/Dёргать! - В ж...пу телевизор! (2004) {SAPCD 017}	11 - Небо.flac	-8.680000	0.981812
my/Dёргать! - В ж...пу телевизор! (2004) {SAPCD 017}	12 - Молоток.flac	-8.790001	0.981903
my/Dёргать! - В ж...пу телевизор! (2004) {SAPCD 017}	13 - Героин.flac	-7.370003	0.981812
my/Dёргать! - В ж...пу телевизор! (2004) {SAPCD 017}	14 - Каждый день.flac	-8.260002	0.981812
my/Dёргать! - В ж...пу телевизор! (2004) {SAPCD 017}	15 - Я выбираю себя.flac	-8.440002	0.981812
my/Dёргать! - В ж...пу телевизор! (2004) {SAPCD 017}	16 - Домой.flac	-8.309998	0.981873
my/Dёргать! - В ж...пу телевизор! (2004) {SAPCD 017}	17 - Панк-рок шоу.flac	-8.699997	0.981934
my/Dёргать! - Секрет жизни (2007) {SAPCD 102}	01 - Ветер.flac	-11.260002	0.981903
my/Dёргать! - Секрет жизни (2007) {SAPCD 102}	02 - Света.flac	-10.449997	0.981903
my/Dёргать! - Секрет жизни (2007) {SAPCD 102}	03 - Я,Не я.flac	-10.580002	0.981903
my/Dёргать! - Секрет жизни (2007) {SAPCD 102}	04 - Sk8board.flac	-10.739998	0.981903
my/Dёргать! - Секрет жизни (2007) {SAPCD 102}	05 - Валентинки.flac	-10.379997	0.981903
my/Dёргать! - Секрет жизни (2007) {SAPCD 102}	06 - Один (среди всех).flac	-10.070000	0.981903
my/Dёргать! - Секрет жизни (2007) {SAPCD 102}	07 - Без мечты.flac	-10.190002	0.981903
my/Dёргать! - Секрет жизни (2007) {SAPCD 102}	08 - Психбольной.flac	-10.209999	0.981903
my/Dёргать! - Секрет жизни (2007) {SAPCD 102}	09 - Наше лето (прошло).flac	-10.870003	0.981903
my/Dёргать! - Секрет жизни (2007) {SAPCD 102}	10 - Тема для тебя, чувак!.flac	-10.250000	0.981903
my/Dёргать! - Секрет жизни (2007) {SAPCD 102}	11 - Секс по телефону.flac	-9.730003	0.981903
my/Dёргать! - Секрет жизни (2007) {SAPCD 102}	12 - Никогда.flac	-9.750000	0.981903
my/E-Sex-T - Рассуди, обдумай, взвесь (2009)	01 - Холод.flac	-11.110001	0.965698
my/E-Sex-T - Рассуди, обдумай, взвесь (2009)	02 - Сны.flac	-10.910004	0.962189
my/E-Sex-T - Рассуди, обдумай, взвесь (2009)	03 - Которых жаль....flac	-11.010002	0.967865
my/E-Sex-T - Рассуди, обдумай, взвесь (2009)	04 - Яма.flac	-10.620003	0.962036
my/E-Sex-T - Рассуди, обдумай, взвесь (2009)	05 - Торнадо.flac	-11.489998	0.961578
my/E-Sex-T - Рассуди, обдумай, взвесь (2009)	06 - С тобой.flac	-11.150002	0.961823
my/E-Sex-T - Рассуди, обдумай, взвесь (2009)	07 - Искры зависти.flac	-11.540001	0.971313
my/E-Sex-T - Рассуди, обдумай, взвесь (2009)	08 - Станем легче.flac	-8.000000	0.961304
my/E-Sex-T - Рассуди, обдумай, взвесь (2009)	09 - Срываясь.flac	-10.879997	0.962311
my/E-Sex-T - Рассуди, обдумай, взвесь (2009)	10 - Что создали.flac	-11.090004	0.994415
my/F.P.G. - Punk Jazz (2008) {NR 2408 CD}	01 - Не отступай.flac	-6.250000	0.998993
my/F.P.G. - Punk Jazz (2008) {NR 2408 CD}	02 - Ботинки.flac	-6.070000	0.998993
my/F.P.G. - Punk Jazz (2008) {NR 2408 CD}	03 - Бунтари.flac	-6.620003	0.998993
my/F.P.G. - Punk Jazz (2008) {NR 2408 CD}	04 - Джи.flac	-6.029999	0.998993
my/F.P.G. - Punk Jazz (2008) {NR 2408 CD}	05 - Жизнь.flac	-5.779999	0.998993
my/F.P.G. - Punk Jazz (2008) {NR 2408 CD}	06 - Сейчас.flac	-6.040001	0.998993
my/F.P.G. - Punk Jazz (2008) {NR 2408 CD}	07 - У.е.баны.flac	-6.779999	0.998993
my/F.P.G. - Punk Jazz (2008) {NR 2408 CD}	08 - Блядь.flac	-5.970001	0.998993
my/F.P.G. - Punk Jazz (2008) {NR 2408 CD}	09 - Хана.flac	-6.889999	0.998993
my/F.P.G. - Punk Jazz (2008) {NR 2408 CD}	10 - Проснулся.flac	-7.250000	0.998993
my/F.P.G. - Punk Jazz (2008) {NR 2408 CD}	11 - Сердце.flac	-6.160004	0.998993
my/F.P.G. - Punk Jazz (2008) {NR 2408 CD}	12 - Думай.flac	-6.199997	0.998993
my/F.P.G. - Стихия (2010) {NR 2210 CD}	01 - Ломай.flac	-10.590004	1.000000
my/F.P.G. - Стихия (2010) {NR 2210 CD}	02 - Я.flac	-10.090004	1.000000
my/F.P.G. - Стихия (2010) {NR 2210 CD}	03 - Рок.flac	-10.309998	1.000000
my/F.P.G. - Стихия (2010) {NR 2210 CD}	04 - Смотрю.flac	-10.480003	1.000000
my/F.P.G. - Стихия (2010) {NR 2210 CD}	05 - Возрождение.flac	-10.480003	1.000000
my/F.P.G. - Стихия (2010) {NR 2210 CD}	06 - Стихия.flac	-10.820000	1.000000
my/F.P.G. - Стихия (2010) {NR 2210 CD}	07 - В пути.flac	-9.769997	1.000000
my/F.P.G. - Стихия (2010) {NR 2210 CD}	08 - Fair Play.flac	-10.300003	1.000000
my/F.P.G. - Стихия (2010) {NR 2210 CD}	09 - Дерзость и молодость.flac	-10.239998	1.000000
my/F.P.G. - Стихия (2010) {NR 2210 CD}	10 - Не одинок.flac	-10.400002	1.000000
my/F.P.G. - Стихия (2010) {NR 2210 CD}	11 - Хана.flac	-10.680000	1.000000
my/F.P.G. - Стихия (2010) {NR 2210 CD}	12 - Конфликт.flac	-10.949997	1.000000
my/F.P.G. - Стихия (2010) {NR 2210 CD}	13 - Скажи им.flac	-11.430000	1.000000
my/F.P.G. - Стихия (2010) {NR 2210 CD}	14 - Легенда.flac	-9.150002	1.000000
my/Good Times - Как зверь (2016)	01 - Intro.flac	-11.970001	0.988678
my/Good Times - Как зверь (2016)	02 - Пой.flac	-11.340004	0.988708
my/Good Times - Как зверь (2016)	03 - Кискино диско.flac	-11.139999	0.988708
my/Good Times - Как зверь (2016)	04 - Части Светы.flac	-8.540001	0.988678
my/Good Times - Как зверь (2016)	05 - Бабунадобить.flac	-12.059998	0.988739
my/Good Times - Как зверь (2016)	06 - Коробок.flac	-11.550003	0.988708
my/Good Times - Как зверь (2016)	07 - Как зверь.flac	-12.269997	0.988739
my/Good Times - Как зверь (2016)	08 - Хорошо.flac	-10.459999	0.988708
my/Good Times - Как зверь (2016)	09 - Отец.flac	-11.809998	0.988739
my/Good Times - Как зверь (2016)	10 - Спасибо, что живой.flac	-10.269997	0.988708
my/Little Big - Funeral Rave (2015)	01 - To Party.flac	-10.059998	0.977264
my/Little Big - Funeral Rave (2015)	02 - Brighton Beach.flac	-7.169998	0.977264
my/Little Big - Funeral Rave (2015)	03 - Give Me Your Money.flac	-8.779999	0.977264
my/Little Big - Funeral Rave (2015)	04 - The Sign.flac	-9.660004	0.977264
my/Little Big - Funeral Rave (2015)	05 - Big Dick.flac	-7.239998	0.977264
my/Little Big - Funeral Rave (2015)	06 - Fucking Asshole.flac	-8.169998	0.977264
my/Little Big - Funeral Rave (2015)	07 - Kind Inside Hard Outside.flac	-9.059998	0.977264
my/Little Big - Funeral Rave (2015)	08 - Dead Unicorn.flac	-9.370003	0.977264
my/Little Big - Funeral Rave (2015)	09 - Hateful Love.flac	-8.349998	0.977264
my/Little Big - Funeral Rave (2015)	10 - Funeral Rave.flac	-9.279999	0.977264
my/Little Big - Funeral Rave (2015)	11 - Polyushko Polye.flac	-7.910004	0.977264
my/Little Big - With Russia from Love (2014)	01 - With Russia from Love.flac	-10.090004	0.988556
my/Little Big - With Russia from Love (2014)	02 - Life in da Trash.flac	-11.290001	1.000000
my/Little Big - With Russia from Love (2014)	03 - Public Enemy.flac	-11.139999	1.000000
my/Little Big - With Russia from Love (2014)	04 - My Way.flac	-9.860001	1.000000
my/Little Big - With Russia from Love (2014)	05 - Pump It.flac	-10.550003	1.000000
my/Little Big - With Russia from Love (2014)	06 - Every Day I'm Drinking.flac	-10.250000	0.988556
my/Little Big - With Russia from Love (2014)	07 - Stoned Monkey.flac	-10.059998	1.000000
my/Little Big - With Russia from Love (2014)	08 - Russian Hooligans.flac	-11.209999	1.000000
my/Little Big - With Russia from Love (2014)	09 - What a Fxxxxxg Day.flac	-10.870003	1.000000
my/Little Big - With Russia from Love (2014)	10 - We Will Push a Button.flac	-10.190002	0.988556
my/Little Big - With Russia from Love (2014)	11 - Freedom.flac	-10.480003	1.000000
my/Little Big - With Russia from Love (2014)	12 - Life in da Trash (Rmx by Dimm).flac	-10.410004	1.000000
my/Private Radio - Keep It Always Loud (2007) {SAPCD 140}	01 - So Many.flac	-7.849998	0.966309
my/Private Radio - Keep It Always Loud (2007) {SAPCD 140}	02 - Время.flac	-9.080002	0.966248
my/Private Radio - Keep It Always Loud (2007) {SAPCD 140}	03 - Take Me Away.flac	-8.500000	0.966278
my/Private Radio - Keep It Always Loud (2007) {SAPCD 140}	04 - In the Eyes of Your Bride.flac	-7.959999	0.966278
my/Private Radio - Keep It Always Loud (2007) {SAPCD 140}	05 - Worker Ballad.flac	-8.340004	0.966278
my/Private Radio - Keep It Always Loud (2007) {SAPCD 140}	06 - Private Radio.flac	-8.269997	0.966248
my/Private Radio - Keep It Always Loud (2007) {SAPCD 140}	07 - No Woman, No Cry.flac	-7.779999	0.966278
my/Private Radio - Keep It Always Loud (2007) {SAPCD 140}	08 - Unite.flac	-7.889999	0.966278
my/Private Radio - Keep It Always Loud (2007) {SAPCD 140}	09 - Intermission.flac	-10.150002	0.966309
my/Private Radio - Keep It Always Loud (2007) {SAPCD 140}	10 - The Last Goodbye.flac	-8.840004	0.966278
my/Private Radio - Keep It Always Loud (2007) {SAPCD 140}	11 - Too Late.flac	-9.199997	0.966248
my/Private Radio - Keep It Always Loud (2007) {SAPCD 140}	12 - My Dreams.flac	-7.489998	0.966248
my/Private Radio - Keep It Always Loud (2007) {SAPCD 140}	13 - The Way I Need You.flac	-9.180000	0.966309
my/Private Radio - Keep It Always Loud (2007) {SAPCD 140}	14 - Drinking Song.flac	-10.620003	0.966278
my/Private Radio - Keep It Always Loud (2007) {SAPCD 140}	15 - Long Way Home.flac	-7.580002	0.966248
my/Private Radio - Keep It Always Loud (2007) {SAPCD 140}	16 - I Walk Alone (Instrumental).flac	-6.110001	0.912354
my/Private Radio - Rock Star (2008) {SAPCD 171}	01 - Rock Star.flac	-9.279999	0.999969
my/Private Radio - Rock Star (2008) {SAPCD 171}	02 - Miss You.flac	-8.650002	1.000000
my/Private Radio - Rock Star (2008) {SAPCD 171}	03 - Leave It All Behind.flac	-9.720001	1.000000
my/Private Radio - Rock Star (2008) {SAPCD 171}	04 - Ты оставишь мне сны.flac	-11.470001	1.000000
my/Private Radio - Rock Star (2008) {SAPCD 171}	05 - My Car.flac	-9.330002	1.000000
my/Private Radio - Rock Star (2008) {SAPCD 171}	06 - Living La Vida Loca.flac	-10.559998	1.000000
my/Private Radio - Rock Star (2008) {SAPCD 171}	07 - Private Radio.flac	-5.699997	0.970184
my/Private Radio - Rock Star (2008) {SAPCD 171}	08 - Take Me Away.flac	-6.910004	0.994751
my/Private Radio - Rock Star (2008) {SAPCD 171}	09 - My Dreams.flac	-5.940002	0.981171
my/Private Radio - Where Is Your Mind (2010) {SAPCD 192}	01 - Where is Your Mind.flac	-9.010002	0.988495
my/Private Radio - Where Is Your Mind (2010) {SAPCD 192}	02 - Tonight.flac	-10.889999	0.988495
my/Private Radio - Where Is Your Mind (2010) {SAPCD 192}	03 - You Know.flac	-8.769997	0.988495
my/Private Radio - Where Is Your Mind (2010) {SAPCD 192}	04 - Just Another Song.flac	-10.949997	0.988495
my/Private Radio - Where Is Your Mind (2010) {SAPCD 192}	05 - Umbrella.flac	-9.419998	0.988495
my/Private Radio - Where Is Your Mind (2010) {SAPCD 192}	06 - Mind (Summer & Winter (Berlin) mix).flac	-8.489998	0.988495
my/Private Radio - Where Is Your Mind (2010) {SAPCD 192}	07 - U know (Summer & Winter (Berlin) mix).flac	-9.279999	0.988495
my/Private Radio - Where Is Your Mind (2010) {SAPCD 192}	08 - Mind (Hopes matter's (Berlin) mix).flac	-8.349998	0.988495
my/Private Radio - Where Is Your Mind (2010) {SAPCD 192}	09 - Mind (Ljoha mix).flac	-5.660004	0.988495
my/Private Radio - Why (2013)	01 - Why.flac	-10.029999	1.000000
my/Private Radio - Why (2013)	02 - Wish You Were Here.flac	-10.480003	1.000000
my/Private Radio - Why (2013)	03 - Goodbye.flac	-10.150002	1.000000
my/Private Radio - Why (2013)	04 - Good Time.flac	-10.590004	1.000000
my/Private Radio - Why (2013)	05 - Self-Destruction.flac	-9.529999	1.000000
my/Sakura - Письмо-исповедь ответа не требует (2007) {CD-M+013-2}	01 - Культура (feat. Захар Май).flac	-6.800003	0.999146
my/Sakura - Письмо-исповедь ответа не требует (2007) {CD-M+013-2}	02 - Письмо-исповедь ответа не требует.flac	-10.470001	0.999146
my/Sakura - Письмо-исповедь ответа не требует (2007) {CD-M+013-2}	03 - Настоящий волшебный.flac	-11.160004	0.999146
my/Sakura - Письмо-исповедь ответа не требует (2007) {CD-M+013-2}	04 - Миру мир.flac	-9.800003	0.999146
my/Sakura - Письмо-исповедь ответа не требует (2007) {CD-M+013-2}	05 - Копай.flac	-6.919998	0.999146
my/Sakura - Письмо-исповедь ответа не требует (2007) {CD-M+013-2}	06 - П-ионт Remix Pro24.flac	-10.000000	0.999146
my/Sakura - Письмо-исповедь ответа не требует (2007) {CD-M+013-2}	07 - 13x2.flac	-10.489998	0.987244
my/Shootki - The Skatastrophe (2005) {BRP 039}	01 - Gadjet.flac	-8.260002	0.965973
my/Shootki - The Skatastrophe (2005) {BRP 039}	02 - Ska.flac	-8.559998	0.966187
my/Shootki - The Skatastrophe (2005) {BRP 039}	03 - Оранжевое солнце.flac	-9.269997	0.966003
my/Shootki - The Skatastrophe (2005) {BRP 039}	04 - Растаман.flac	-9.129997	0.967987
my/Shootki - The Skatastrophe (2005) {BRP 039}	05 - Метро.flac	-9.680000	0.965973
my/Shootki - The Skatastrophe (2005) {BRP 039}	06 - Popcorn.flac	-8.000000	0.966064
my/Shootki - The Skatastrophe (2005) {BRP 039}	07 - Новый год.flac	-9.040001	0.966400
my/Shootki - The Skatastrophe (2005) {BRP 039}	08 - Мозги.flac	-8.139999	0.966614
my/Shootki - The Skatastrophe (2005) {BRP 039}	09 - Улыбайся.flac	-8.629997	0.965973
my/Shootki - The Skatastrophe (2005) {BRP 039}	10 - Надоело.flac	-8.309998	0.966156
my/Shootki - The Skatastrophe (2005) {BRP 039}	11 - Душа.flac	-9.250000	0.966858
my/Shootki - The Skatastrophe (2005) {BRP 039}	12 - The Skatastrophe.flac	-8.970001	0.966522
my/Skafandr - Навстречу солнцу и свету (2002)	01 - АллАх Моб..flac	-8.190002	1.000000
my/Skafandr - Навстречу солнцу и свету (2002)	02 - Б.О. Человек.flac	-7.300003	1.000000
my/Skafandr - Навстречу солнцу и свету (2002)	03 - Объект деятельности.flac	-10.010002	1.000000
my/Skafandr - Навстречу солнцу и свету (2002)	04 - Предметность.flac	-8.620003	1.000000
my/Skafandr - Навстречу солнцу и свету (2002)	05 - Игымихым.flac	-7.150002	1.000000
my/Skafandr - Навстречу солнцу и свету (2002)	06 - Repeat Until.flac	-7.330002	1.000000
my/Skafandr - Навстречу солнцу и свету (2002)	07 - To Press the Button.flac	-8.120003	1.000000
my/Skafandr - Навстречу солнцу и свету (2002)	08 - Береги сознание с молоду.flac	-4.570000	1.000000
my/Skafandr - Навстречу солнцу и свету (2002)	09 - Субъективный Мир.flac	-7.639999	1.000000
my/Skafandr - Навстречу солнцу и свету (2002)	10 - Напряжение трогательно наивно.flac	-8.690002	1.000000
my/Skafandr - Навстречу солнцу и свету (2002)	11 - АллАх Моб. (Remix).flac	-10.190002	1.000000
my/Skafandr - Тяжёлый шар земной (2007)	01 - Отклонение.flac	-13.669998	0.992218
my/Skafandr - Тяжёлый шар земной (2007)	02 - Пределы.flac	-12.919998	0.999969
my/Skafandr - Тяжёлый шар земной (2007)	03 - Тяжёлый шар земной.flac	-12.790001	0.987305
my/Skafandr - Тяжёлый шар земной (2007)	04 - Танец маленьких мёртвых лебедей.flac	-12.959999	0.991058
my/Skafandr - Тяжёлый шар земной (2007)	05 - Пилить черепные коробки.flac	-12.029999	0.989441
my/Skafandr - Тяжёлый шар земной (2007)	06 - Инкубационный период.flac	-10.779999	0.988678
my/Skafandr - Тяжёлый шар земной (2007)	07 - Ебанас крюкас.flac	-12.160004	0.993408
my/Skafandr - Тяжёлый шар земной (2007)	08 - Теория свального греха.flac	-13.010002	0.987671
my/Skafandr - Тяжёлый шар земной (2007)	09 - Зланемерннах.flac	-13.550003	0.996155
my/Skafandr - Тяжёлый шар земной (2007)	10 - Все микробы умрут.flac	-11.099998	0.992218
my/Skafandr - Тяжёлый шар земной (2007)	11 - Великий исход белых бульдозеров.flac	-12.480003	0.999969
my/Skaльпель - Postcard (2008) {SAPCD 176}	01 - Postcard from Kingston to Moscow.flac	-9.980003	1.000000
my/Skaльпель - Postcard (2008) {SAPCD 176}	02 - Believe.flac	-9.580002	0.988586
my/Skaльпель - Postcard (2008) {SAPCD 176}	03 - Дорога на юг.flac	-9.340004	1.000000
my/Skaльпель - Postcard (2008) {SAPCD 176}	04 - Не напрасно.flac	-9.150002	1.000000
my/Skaльпель - Postcard (2008) {SAPCD 176}	05 - 1969.flac	-9.220001	1.000000
my/Skaльпель - Postcard (2008) {SAPCD 176}	06 - Летний вечер.flac	-9.440002	1.000000
my/Skaльпель - Postcard (2008) {SAPCD 176}	07 - Ты один.flac	-9.980003	1.000000
my/Skaльпель - Postcard (2008) {SAPCD 176}	08 - Me & You.flac	-8.459999	1.000000
my/Skaльпель - Postcard (2008) {SAPCD 176}	09 - Восприятие.flac	-8.889999	1.000000
my/Skaльпель - Postcard (2008) {SAPCD 176}	10 - Статистика потерь.flac	-9.239998	1.000000
my/Skaльпель - Postcard (2008) {SAPCD 176}	11 - День и ночь.flac	-9.340004	1.000000
my/Skaльпель - Postcard (2008) {SAPCD 176}	12 - Santeria,Жёлтая пресса.flac	-8.980003	0.988586
my/Suspense Heroes Syndicate - Confident (2010)	01 - I'm Allright Now.flac	-7.779999	1.000000
my/Suspense Heroes Syndicate - Confident (2010)	02 - All My Friends.flac	-9.019997	1.000000
my/Suspense Heroes Syndicate - Confident (2010)	03 - So Serious.flac	-9.620003	1.000000
my/The Poseurs - The Poseurs (2011) {RUF009}	01 - Intro.flac	-8.900002	1.000000
my/The Poseurs - The Poseurs (2011) {RUF009}	02 - С меня хватит.flac	-9.290001	0.966064
my/The Poseurs - The Poseurs (2011) {RUF009}	03 - Shoplifting.flac	-9.470001	0.966095
my/The Poseurs - The Poseurs (2011) {RUF009}	04 - Kill Shithead in Da Pit.flac	-9.410004	0.966064
my/The Poseurs - The Poseurs (2011) {RUF009}	05 - Песня не про ментов.flac	-9.139999	0.966064
my/The Poseurs - The Poseurs (2011) {RUF009}	06 - Что ты будешь делать после.flac	-9.230003	0.966064
my/The Poseurs - The Poseurs (2011) {RUF009}	07 - Subculture Is Li(f)e feat. Kenny ,My Own Religion,.flac	-9.540001	0.966064
my/The Poseurs - The Poseurs (2011) {RUF009}	08 - Я останусь собой.flac	-9.239998	0.966095
my/The Poseurs - The Poseurs (2011) {RUF009}	09 - Идиократия.flac	-9.239998	0.966064
my/The Poseurs - The Poseurs (2011) {RUF009}	10 - Секта feat. Pikila ,Villainz United,.flac	-9.209999	0.966064
my/The Poseurs - The Poseurs (2011) {RUF009}	11 - Песня про тебя.flac	-9.349998	0.966095
my/The Poseurs - The Poseurs (2011) {RUF009}	12 - Not Dead Yet feat. Beng Beng Cocktail.flac	-9.449997	0.966095
my/The Poseurs - The Poseurs (2011) {RUF009}	13 - Балласт.flac	-9.059998	0.999969
my/Truckdrivers - Делай, что должен, и будь, что будет (2016)	01 - Кончилась музыка.flac	-11.019997	0.983215
my/Truckdrivers - Делай, что должен, и будь, что будет (2016)	02 - Дом милый дом.flac	-9.879997	0.977234
my/Truckdrivers - Делай, что должен, и будь, что будет (2016)	03 - Велик.flac	-11.559998	0.977234
my/Truckdrivers - Делай, что должен, и будь, что будет (2016)	04 - В этих местах.flac	-11.029999	0.977234
my/Truckdrivers - Делай, что должен, и будь, что будет (2016)	05 - Безумцы землю ногами крутят.flac	-11.320000	0.977234
my/Truckdrivers - Делай, что должен, и будь, что будет (2016)	06 - Бетонные блоки.flac	-7.730003	0.966064
my/Truckdrivers - Делай, что должен, и будь, что будет (2016)	07 - Сколько раз.flac	-11.529999	0.977234
my/Truckdrivers - Делай, что должен, и будь, что будет (2016)	08 - Футбол.flac	-10.730003	0.977234
my/Truckdrivers - Делай, что должен, и будь, что будет (2016)	09 - Рио.flac	-10.910004	0.977234
my/Truckdrivers - Делай, что должен, и будь, что будет (2016)	10 - Космонавт.flac	-10.750000	0.977234
my/Various Artists - Ska Punk Kids 2 (2005)	01 - Dёргать - Грустная песня.flac	-8.080002	0.999969
my/Various Artists - Ska Punk Kids 2 (2005)	02 - CWT - Тебе 18.flac	-8.410004	0.841370
my/Various Artists - Ska Punk Kids 2 (2005)	03 - Колбас СКА - Солнечное Ska.flac	-7.690002	1.000000
my/Various Artists - Ska Punk Kids 2 (2005)	04 - Распиратор - Я не понимаю.flac	-7.849998	0.638702
my/Various Artists - Ska Punk Kids 2 (2005)	05 - Clinica63 - Праздник.flac	-8.150002	0.595642
my/Various Artists - Ska Punk Kids 2 (2005)	06 - Фаzа - Просто ска.flac	-9.580002	1.000000
my/Various Artists - Ska Punk Kids 2 (2005)	07 - ОНД - Твои SMS.flac	-8.760002	0.977112
my/Various Artists - Ska Punk Kids 2 (2005)	08 - Пингвины - Переставая быть собой.flac	-3.629997	1.000000
my/Various Artists - Ska Punk Kids 2 (2005)	09 - Necondition - Necondition.flac	-7.110001	0.802338
my/Various Artists - Ska Punk Kids 2 (2005)	10 - 13 Этаж - Новые миры.flac	-7.440002	0.798218
my/Various Artists - Ska Punk Kids 2 (2005)	11 - Merry-Making - Д'Артеньгав.flac	-6.260002	1.000000
my/Various Artists - Ska Punk Kids 2 (2005)	12 - Сказка - ПиратSKAя.flac	-7.190002	1.000000
my/Various Artists - Ska Punk Kids 2 (2005)	13 - GSM - Эй, Вы!.flac	-6.650002	1.000000
my/Various Artists - Ska Punk Kids 2 (2005)	14 - Вредные привычки - Душа.flac	-8.400002	0.890991
my/Various Artists - Ska Punk Kids 2 (2005)	15 - Rossomahaar feat. Necondition - Bloodred Utopia.flac	-8.059998	0.833466
my/Various Artists - Ska-Punk Universe (2008) {SAPCD 151}	01 - Private Radio - Private Radio.flac	-8.300003	0.966248
my/Various Artists - Ska-Punk Universe (2008) {SAPCD 151}	02 - Skaльпель - Gotta Go Home.flac	-8.879997	1.000000
my/Various Artists - Ska-Punk Universe (2008) {SAPCD 151}	03 - Мой До Дыр - American Dream.flac	-10.290001	0.977081
my/Various Artists - Ska-Punk Universe (2008) {SAPCD 151}	04 - Male Factors - ШотландSKAя.flac	-8.669998	1.000000
my/Various Artists - Ska-Punk Universe (2008) {SAPCD 151}	05 - Бешенные Огурцы - Туман.flac	-4.269997	1.000000
my/Various Artists - Ska-Punk Universe (2008) {SAPCD 151}	06 - Cumshot - Crushed.flac	-10.840004	1.000000
my/Various Artists - Ska-Punk Universe (2008) {SAPCD 151}	07 - Necondition - Squirrels, Ants and Hooligans.flac	-11.910004	0.965851
my/Various Artists - Ska-Punk Universe (2008) {SAPCD 151}	08 - Los Templos - Self Deniel.flac	-7.769997	1.000000
my/Various Artists - Ska-Punk Universe (2008) {SAPCD 151}	09 - Киоск - Брюс Ли.flac	-4.430000	0.965851
my/Various Artists - Ska-Punk Universe (2008) {SAPCD 151}	10 - 2 Tone Avenue - Танцуй!.flac	-11.779999	1.000000
my/Various Artists - Ska-Punk Universe (2008) {SAPCD 151}	11 - Могучка Band - Повезёт.flac	-12.430000	1.000000
my/Various Artists - Ska-Punk Universe (2008) {SAPCD 151}	12 - Контрабанда - Пиратовская.flac	-11.239998	1.000000
my/Various Artists - Ska-Punk Universe (2008) {SAPCD 151}	13 - Барокко - Флеш - Позитив рулит.flac	-10.199997	0.999969
my/Various Artists - Ska-Punk Universe (2008) {SAPCD 151}	14 - Havana Club - Кулаки.flac	-7.150002	0.640228
my/Various Artists - Ska-Punk Universe (2008) {SAPCD 151}	15 - Diebosh - Бок о бок.flac	-10.000000	1.000000
my/Various Artists - Take It Easy (2005) {GR-PR-0003}	01 - Private Radio - Rudeboy Train.flac	-9.690002	0.966064
my/Various Artists - Take It Easy (2005) {GR-PR-0003}	02 - Private Radio - Harryngton.flac	-8.800003	0.966095
my/Various Artists - Take It Easy (2005) {GR-PR-0003}	03 - Private Radio - You & Me.flac	-6.730003	0.966064
my/Various Artists - Take It Easy (2005) {GR-PR-0003}	04 - Private Radio - Sometimes.flac	-8.349998	0.966064
my/Various Artists - Take It Easy (2005) {GR-PR-0003}	05 - Private Radio - Till I Come Back.flac	-9.160004	0.966064
my/Various Artists - Take It Easy (2005) {GR-PR-0003}	06 - Private Radio - I Walk Alone.flac	-8.559998	0.966095
my/Various Artists - Take It Easy (2005) {GR-PR-0003}	07 - Skarface - Doc Martens Boots.flac	-10.480003	0.966064
my/Various Artists - Take It Easy (2005) {GR-PR-0003}	08 - Skarface - Never Ever Bet.flac	-9.040001	0.966064
my/Various Artists - Take It Easy (2005) {GR-PR-0003}	09 - Skarface - All Systems Fail.flac	-7.620003	0.966064
my/Various Artists - Take It Easy (2005) {GR-PR-0003}	10 - Skarface - Greasy Girls.flac	-8.220001	0.966064
my/Various Artists - Take It Easy (2005) {GR-PR-0003}	11 - Skarface - Sempre.flac	-8.430000	0.966064
my/Various Artists - Take It Easy (2005) {GR-PR-0003}	12 - Skarface - It's Time To Go.flac	-8.169998	0.966095
my/Various Artists - Take It Easy (2005) {GR-PR-0003}	13 - Skarface - Politquement Correct.flac	-10.129997	0.966095
my/Various Artists - Take It Easy (2005) {GR-PR-0003}	14 - Private Radio - Sometimes (Duduk Meets Piano Mix).flac	-7.389999	0.863586
my/Various Artists - Take It Easy (2005) {GR-PR-0003}	15 - Private Radio - Sometimes (Far Breakz Mix).flac	-8.419998	0.866913
my/Various Artists - Tribute to Distemper (2010) {SAPCD 193}	CD1/01 - Angus - Начинаем отдыхать.flac	-9.720001	0.966278
my/Various Artists - Tribute to Distemper (2010) {SAPCD 193}	CD1/02 - НеКомплект - Сoca-Cola.flac	-8.849998	0.989014
my/Various Artists - Tribute to Distemper (2010) {SAPCD 193}	CD1/03 - Все стволы - Подумай кто твои друзья.flac	-10.970001	1.000000
my/Various Artists - Tribute to Distemper (2010) {SAPCD 193}	CD1/04 - Пляж - Мир создан для тебя.flac	-10.959999	0.988708
my/Various Artists - Tribute to Distemper (2010) {SAPCD 193}	CD1/05 - Changes - Слово убивает.flac	-10.660004	1.000000
my/Various Artists - Tribute to Distemper (2010) {SAPCD 193}	CD1/06 - Диета! - Просто погуляем.flac	-9.459999	0.999115
my/Various Artists - Tribute to Distemper (2010) {SAPCD 193}	CD1/07 - Diagens - Face Control.flac	-12.290001	1.000000
my/Various Artists - Tribute to Distemper (2010) {SAPCD 193}	CD1/08 - Battle Toads - Шпионы.flac	-9.930000	1.000000
my/Various Artists - Tribute to Distemper (2010) {SAPCD 193}	CD1/09 - Durdom Band - Подарок медиков.flac	-10.500000	1.000000
my/Various Artists - Tribute to Distemper (2010) {SAPCD 193}	CD1/10 - The Last Train - Продавщица.flac	-10.340004	1.000000
my/Various Artists - Tribute to Distemper (2010) {SAPCD 193}	CD1/11 - Candid 8 - Всем правит случайность.flac	-10.989998	1.000000
my/Various Artists - Tribute to Distemper (2010) {SAPCD 193}	CD1/12 - Uratsakidogi - Троллейбус 27.flac	-10.949997	1.000000
my/Various Artists - Tribute to Distemper (2010) {SAPCD 193}	CD1/13 - Agitators - Мы сегодня с Баем.flac	-10.959999	1.000000
my/Various Artists - Tribute to Distemper (2010) {SAPCD 193}	CD1/14 - Реактивы - Ты настоящий лишь внутри.flac	-10.739998	1.000000
my/Various Artists - Tribute to Distemper (2010) {SAPCD 193}	CD1/15 - Double Fault - Я лечу.flac	-9.860001	0.911377
my/Various Artists - Tribute to Distemper (2010) {SAPCD 193}	CD1/16 - Sanatoriya - Зачем.flac	-11.709999	1.000000
my/Various Artists - Tribute to Distemper (2010) {SAPCD 193}	CD1/17 - Skannibal Schmitt - До утра гуляет город.flac	-10.010002	1.000000
my/Various Artists - Tribute to Distemper (2010) {SAPCD 193}	CD1/18 - Ze Smetana - Дверь в небо.flac	-10.860001	1.000000
my/Various Artists - Tribute to Distemper (2010) {SAPCD 193}	CD1/19 - Offtop - Ураган.flac	-10.110001	1.000000
my/Various Artists - Tribute to Distemper (2010) {SAPCD 193}	CD1/20 - Frozen East - Отчего тебе так страшно.flac	-10.639999	1.000000
my/Various Artists - Tribute to Distemper (2010) {SAPCD 193}	CD1/21 - Волоса - Ну все!.flac	-9.720001	1.000000
my/Various Artists - Tribute to Distemper (2010) {SAPCD 193}	CD1/22 - Витамин роста feat. Колючий - Старым друзьям.flac	-11.110001	1.000000
my/Various Artists - Tribute to Distemper (2010) {SAPCD 193}	CD2/01 - Turbo Lax - Интернет пиздоболы.flac	-9.599998	1.000000
my/Various Artists - Tribute to Distemper (2010) {SAPCD 193}	CD2/02 - Dis-ney - Праздник каждый день.flac	-11.980003	1.000000
my/Various Artists - Tribute to Distemper (2010) {SAPCD 193}	CD2/03 - Der Steinkops - Познание.flac	-9.879997	1.000000
my/Various Artists - Tribute to Distemper (2010) {SAPCD 193}	CD2/04 - MAD Band - Зловещий мир подъездов.flac	-12.090004	1.000000
my/Various Artists - Tribute to Distemper (2010) {SAPCD 193}	CD2/05 - Взвод - Как остаться человеком.flac	-11.419998	1.000000
my/Various Artists - Tribute to Distemper (2010) {SAPCD 193}	CD2/06 - Jet Kids - Начни с себя.flac	-10.900002	1.000000
my/Various Artists - Tribute to Distemper (2010) {SAPCD 193}	CD2/07 - What We Feel - Нет расизма – нет проблем.flac	-9.629997	1.000000
my/Various Artists - Tribute to Distemper (2010) {SAPCD 193}	CD2/08 - Т-34 - Миллениум (линолеум).flac	-10.760002	1.000000
my/Various Artists - Tribute to Distemper (2010) {SAPCD 193}	CD2/09 - Яд - Луна.flac	-7.690002	1.000000
my/Various Artists - Tribute to Distemper (2010) {SAPCD 193}	CD2/10 - Мозгоболы - Слёзы.flac	-11.959999	1.000000
my/Various Artists - Tribute to Distemper (2010) {SAPCD 193}	CD2/11 - Wanted One-Armed Bandits - На рассвете.flac	-11.059998	1.000000
my/Various Artists - Tribute to Distemper (2010) {SAPCD 193}	CD2/12 - SickMind - Ты не знаешь сам, чего хочешь.flac	-11.750000	1.000000
my/Various Artists - Tribute to Distemper (2010) {SAPCD 193}	CD2/13 - SkaЧай - Про собачек.flac	-8.699997	1.000000
my/Various Artists - Tribute to Distemper (2010) {SAPCD 193}	CD2/14 - Zuname - Проваливай домой.flac	-11.139999	0.988708
my/Various Artists - Tribute to Distemper (2010) {SAPCD 193}	CD2/15 - Buzz Fiction - Мой андеграунд.flac	-11.300003	1.000000
my/Various Artists - Tribute to Distemper (2010) {SAPCD 193}	CD2/16 - Старов - Мне легко.flac	-10.690002	0.999695
my/Various Artists - Tribute to Distemper (2010) {SAPCD 193}	CD2/17 - Шлюз - Мечта.flac	-11.940002	1.000000
my/Various Artists - Tribute to Distemper (2010) {SAPCD 193}	CD2/18 - Кок оду - Dog Star.flac	-10.230003	1.000000
my/Various Artists - Tribute to Distemper (2010) {SAPCD 193}	CD2/19 - Best Enemy - Разные люди.flac	-12.550003	1.000000
my/Various Artists - Tribute to Distemper (2010) {SAPCD 193}	CD2/20 - Мой до дыр - Distemper’у.flac	-9.180000	0.988617
my/Various Artists - Tribute to Distemper (2010) {SAPCD 193}	CD2/21 - Тихий шторм - Синяя ночь.flac	-10.110001	1.000000
my/Бригадный Подряд - Новый сезон (2015)	01 - Телефон.flac	-9.489998	0.999969
my/Бригадный Подряд - Новый сезон (2015)	02 - Бубен.flac	-9.330002	1.000000
my/Бригадный Подряд - Новый сезон (2015)	03 - Новый сезон.flac	-9.120003	0.990143
my/Бригадный Подряд - Новый сезон (2015)	04 - Пёс.flac	-9.849998	0.982971
my/Бригадный Подряд - Новый сезон (2015)	05 - Принц и принцесса.flac	-8.360001	0.999969
my/Бригадный Подряд - Новый сезон (2015)	06 - Числа.flac	-9.209999	0.999969
my/Бригадный Подряд - Новый сезон (2015)	07 - Набело.flac	-9.330002	0.996826
my/Бригадный Подряд - Новый сезон (2015)	08 - Точка невозврата.flac	-8.800003	1.000000
my/Бригадный Подряд - Новый сезон (2015)	09 - Жесть.flac	-8.910004	0.999969
my/Бригадный Подряд - Новый сезон (2015)	10 - Лайк.flac	-9.459999	0.999969
my/Лампасы - Лампаццирия (2006)	01 - Интро.flac	-10.879997	1.000000
my/Лампасы - Лампаццирия (2006)	02 - Супер-герой.flac	-10.900002	1.000000
my/Лампасы - Лампаццирия (2006)	03 - Лягушки.flac	-11.650002	1.000000
my/Лампасы - Лампаццирия (2006)	04 - Марш.flac	-8.779999	1.000000
my/Лампасы - Лампаццирия (2006)	05 - Снова без тебя.flac	-10.519997	1.000000
my/Лампасы - Лампаццирия (2006)	06 - Суббота.flac	-11.019997	1.000000
my/Лампасы - Лампаццирия (2006)	07 - Измена.flac	-11.059998	1.000000
my/Лампасы - Лампаццирия (2006)	08 - Хей!.flac	-7.389999	1.000000
my/Лампасы - Лампаццирия (2006)	09 - Реггей.flac	-10.510002	1.000000
my/Лампасы - Лампаццирия (2006)	10 - Альпинист.flac	-10.090004	1.000000
my/Лампасы - Лампаццирия (2006)	11 - Да, я выпил.flac	-10.690002	1.000000
my/Лампасы - Лампаццирия (2006)	12 - Казино.flac	-10.489998	1.000000
my/Лампасы - Лампаццирия (2006)	13 - Бамбалея.flac	-9.949997	1.000000
my/Лампасы - Марафон (2010)	01 - Лампасы.flac	-6.550003	0.715332
my/Лампасы - Марафон (2010)	02 - Моя основа.flac	-5.800003	0.709503
my/Лампасы - Марафон (2010)	03 - Удача.flac	-4.720001	0.682190
my/Лампасы - Марафон (2010)	04 - Крошка Травести.flac	-5.360001	0.652588
my/Лампасы - Марафон (2010)	05 - Я искал.flac	-5.610001	0.727539
my/Лампасы - Марафон (2010)	06 - Марафон.flac	-5.720001	0.701141
my/Лампасы - Марафон (2010)	07 - С новым годом!.flac	-6.870003	0.644409
my/Лампасы - Марафон (2010)	08 - Я не знаю, что мне делать.flac	-6.800003	0.717407
my/Лампасы - Марафон (2010)	09 - Всё как есть.flac	-7.180000	0.763062
my/Лампасы - Марафон (2010)	10 - В тишине (Light Version).flac	-8.090004	1.000000
my/Лампасы - Марафон (2010)	11 - Ангел.flac	-6.110001	0.756226
my/Ляпис Трубецкой - Весёлые картинки (2011) {SZCD 7224-11}	01 - Интро.flac	-5.739998	0.963165
my/Ляпис Трубецкой - Весёлые картинки (2011) {SZCD 7224-11}	02 - Зевс.flac	-10.000000	1.000000
my/Ляпис Трубецкой - Весёлые картинки (2011) {SZCD 7224-11}	03 - Африка.flac	-10.709999	1.000000
my/Ляпис Трубецкой - Весёлые картинки (2011) {SZCD 7224-11}	04 - Нафта.flac	-11.199997	1.000000
my/Ляпис Трубецкой - Весёлые картинки (2011) {SZCD 7224-11}	05 - Я верю.flac	-9.040001	1.000000
my/Ляпис Трубецкой - Весёлые картинки (2011) {SZCD 7224-11}	06 - Принцесса.flac	-11.029999	1.000000
my/Ляпис Трубецкой - Весёлые картинки (2011) {SZCD 7224-11}	07 - Шут.flac	-10.550003	1.000000
my/Ляпис Трубецкой - Весёлые картинки (2011) {SZCD 7224-11}	08 - Зоопарк.flac	-11.360001	1.000000
my/Ляпис Трубецкой - Весёлые картинки (2011) {SZCD 7224-11}	09 - Грай.flac	-10.610001	1.000000
my/Ляпис Трубецкой - Весёлые картинки (2011) {SZCD 7224-11}	10 - Космонавты.flac	-10.580002	1.000000
my/Ляпис Трубецкой - Весёлые картинки (2011) {SZCD 7224-11}	11 - Священный огонь.flac	-10.879997	1.000000
my/Ляпис Трубецкой - Весёлые картинки (2011) {SZCD 7224-11}	12 - Дикий койот.flac	-10.230003	1.000000
my/Паразиты - Прости меня (2009)	01 - Прости меня.flac	-11.160004	1.000000
my/Паразиты - Прости меня (2009)	02 - Ночь у костра.flac	-12.370003	1.000000
my/Паразиты - Прости меня (2009)	03 - Забыть про всё.flac	-11.029999	1.000000
my/Паразиты - Прости меня (2009)	04 - Нет места для любви.flac	-11.690002	1.000000
my/Паразиты - Прости меня (2009)	05 - Боль и кровь.flac	-11.699997	1.000000
my/Паразиты - Прости меня (2009)	06 - Месть.flac	-10.849998	1.000000
my/Паразиты - Прости меня (2009)	07 - Начинай предавать.flac	-10.919998	1.000000
my/Паразиты - Прости меня (2009)	08 - Будь умней.flac	-10.559998	1.000000
my/Паразиты - Прости меня (2009)	09 - Корпорация.flac	-10.290001	1.000000
my/Паразиты - Прости меня (2009)	10 - Море.flac	-10.669998	1.000000
my/Паразиты - Прости меня (2009)	11 - Слеза.flac	-11.209999	1.000000
my/Паразиты - Прости меня (2009)	12 - Не бойся расстаться с огнём.flac	-12.400002	1.000000
my/Порт (812) - Всё в твоих руках (2006)	01 - Login.flac	-10.459999	1.000000
my/Порт (812) - Всё в твоих руках (2006)	02 - Проваливай из снов.flac	-11.809998	1.000000
my/Порт (812) - Всё в твоих руках (2006)	03 - Без тебя-2.flac	-10.190002	1.000000
my/Порт (812) - Всё в твоих руках (2006)	04 - Любовь (убивает меня).flac	-10.980003	1.000000
my/Порт (812) - Всё в твоих руках (2006)	05 - Наших желаний.flac	-11.059998	1.000000
my/Порт (812) - Всё в твоих руках (2006)	06 - Пытаюсь забыть.flac	-10.809998	1.000000
my/Порт (812) - Всё в твоих руках (2006)	07 - Гламур (feat. Шахаш, Бася).flac	-11.720001	1.000000
my/Порт (812) - Всё в твоих руках (2006)	08 - Ты.flac	-11.000000	1.000000
my/Порт (812) - Всё в твоих руках (2006)	09 - Алкоголь.flac	-11.709999	1.000000
my/Порт (812) - Всё в твоих руках (2006)	10 - Рок.flac	-10.260002	1.000000
my/Порт (812) - Всё в твоих руках (2006)	11 - Панк бунт.flac	-11.230003	1.000000
my/Порт (812) - Всё в твоих руках (2006)	12 - Здесь и сейчас.flac	-10.809998	1.000000
my/Порт (812) - Всё в твоих руках (2006)	13 - Контрабас Боба Марли.flac	-7.809998	1.000000
my/Порт (812) - Всё в твоих руках (2006)	14 - Outro.flac	-10.090004	1.000000
my/Психея - 10 Years of Greatest Shits	01 - Sid Spears.flac	-8.900002	1.000000
my/Психея - 10 Years of Greatest Shits	02 - Квази.flac	-9.080002	1.000000
my/Психея - 10 Years of Greatest Shits	03 - Рефлекс Хичкока.flac	-9.440002	1.000000
my/Психея - 10 Years of Greatest Shits	04 - Лезвием сердца.flac	-8.269997	1.000000
my/Психея - 10 Years of Greatest Shits	05 - Миф о розовых деликатесах.flac	-8.510002	1.000000
my/Психея - 10 Years of Greatest Shits	06 - Поколение ты.flac	-9.169998	1.000000
my/Психея - 10 Years of Greatest Shits	07 - Революция себя.flac	-8.279999	1.000000
my/Психея - 10 Years of Greatest Shits	08 - V (Витамин).flac	-8.919998	1.000000
my/Психея - 10 Years of Greatest Shits	09 - Стекла, пленка, стаи.flac	-8.160004	1.000000
my/Психея - 10 Years of Greatest Shits	10 - Бесконечный стук шагов.flac	-8.220001	1.000000
my/Психея - 10 Years of Greatest Shits	11 - Спасусь таблетками.flac	-7.860001	1.000000
my/Психея - 10 Years of Greatest Shits	12 - Столько же стоит твоя свобода.flac	-10.129997	1.000000
my/Психея - 10 Years of Greatest Shits	13 - Wой Wаленький Wир.flac	-9.430000	1.000000
my/Психея - 10 Years of Greatest Shits	14 - От А до Я....flac	-9.370003	1.000000
my/Психея - 10 Years of Greatest Shits	15 - Холодное железное длинное.flac	-0.699997	0.942657
my/Психея - Оттенки любви (2014)	01 - Учи меня.flac	-11.320000	0.999969
my/Психея - Оттенки любви (2014)	02 - Пустая голова.flac	-10.290001	1.000000
my/Психея - Оттенки любви (2014)	03 - 5+2=7 (дети Zx-Spectrum).flac	-10.900002	0.997284
my/Психея - Оттенки любви (2014)	04 - Жжёные спички города.flac	-10.129997	0.999969
my/Психея - Оттенки любви (2014)	05 - НЕSEX.flac	-10.540001	1.000000
my/Психея - Оттенки любви (2014)	06 - Между молотом и наковальней.flac	-10.820000	0.993195
my/Психея - Оттенки любви (2014)	07 - Л. и В..flac	-9.120003	0.999969
my/Психея - Оттенки любви (2014)	08 - Андрогины.flac	-10.980003	1.000000
my/Психея - Оттенки любви (2014)	09 - Реальная жизнь.flac	-10.540001	1.000000
my/Психея - Оттенки любви (2014)	10 - ЭлекIIIчество.flac	-10.529999	0.984467
my/Психея - Оттенки любви (2014)	11 - Песня для двоих.flac	-8.120003	0.969025
my/Чёрный обелиск - Стена (1994) {MZ-121-2}	01 - Стена.flac	-6.860001	0.981720
my/Чёрный обелиск - Стена (1994) {MZ-121-2}	02 - Дом желтого сна.flac	-8.040001	0.981720
my/Чёрный обелиск - Стена (1994) {MZ-121-2}	03 - Аве, цезарь.flac	-8.209999	0.981720
my/Чёрный обелиск - Стена (1994) {MZ-121-2}	04 - Меч.flac	-7.629997	0.981720
my/Чёрный обелиск - Стена (1994) {MZ-121-2}	05 - Серый святой (в рок-н-ролле).flac	-7.400002	0.981720
my/Чёрный обелиск - Стена (1994) {MZ-121-2}	06 - Игрок (акустическая версия).flac	-8.120003	0.981720
my/Чёрный обелиск - Стена (1994) {MZ-121-2}	07 - Болезнь.flac	-7.940002	0.981720
my/Чёрный обелиск - Стена (1994) {MZ-121-2}	08 - Черный обелиск.flac	-8.190002	0.981720
my/Чёрный обелиск - Стена (1994) {MZ-121-2}	09 - Стена (Акустическая версия).flac	-8.430000	0.981720
my/Чёрный обелиск - Стена (1994) {MZ-121-2}	10 - Стена (1991).flac	-7.699997	0.981720
my/Чёрный обелиск - Стена (1994) {MZ-121-2}	11 - We got enought.flac	-6.209999	0.981720
my/Чёрный обелиск - Стена (1994) {MZ-121-2}	12 - Меч (1991).flac	-7.199997	0.981720
my/Чёрный обелиск - Стена (1994) {MZ-121-2}	13 - Игрок (1991).flac	-6.779999	0.981720
my/Элизиум - 13 (2008) {225CD-15}	01 - Ради чего.flac	-10.599998	1.000000
my/Элизиум - 13 (2008) {225CD-15}	02 - Что сделал ты для своей мечты.flac	-10.849998	1.000000
my/Элизиум - 13 (2008) {225CD-15}	03 - Правда-ложь.flac	-11.570000	0.999969
my/Элизиум - 13 (2008) {225CD-15}	04 - И рассыплется в пыль.flac	-11.239998	0.999969
my/Элизиум - 13 (2008) {225CD-15}	05 - Планета Земля.flac	-10.220001	1.000000
my/Элизиум - 13 (2008) {225CD-15}	06 - Мир - а не война!.flac	-10.180000	0.999969
my/Элизиум - 13 (2008) {225CD-15}	07 - О, мой Шекспир.flac	-10.840004	1.000000
my/Элизиум - 13 (2008) {225CD-15}	08 - Дети-мишени , дети-убийцы.flac	-11.489998	1.000000
my/Элизиум - 13 (2008) {225CD-15}	09 - Мир не изменится.flac	-11.400002	1.000000
my/Элизиум - 13 (2008) {225CD-15}	10 - Состояние мира.flac	-11.800003	1.000000
my/Элизиум - 13 (2008) {225CD-15}	11 - Взлётная полоса.flac	-11.209999	0.999969
my/Элизиум - 13 (2008) {225CD-15}	12 - Другие грани понимания свободы.flac	-11.559998	1.000000
my/Элизиум - 13 (2008) {225CD-15}	13 - Улыбайте друг другу лица!.flac	-11.279999	1.000000
my/Элизиум - Глупый стеб, попса... и никаких революций! (1999) {SAPCD 042}	01 - Я иду домой.flac	-10.019997	0.978027
my/Элизиум - Глупый стеб, попса... и никаких революций! (1999) {SAPCD 042}	02 - Альпинист.flac	-9.830002	0.978027
my/Элизиум - Глупый стеб, попса... и никаких революций! (1999) {SAPCD 042}	03 - Про вертолет.flac	-9.019997	0.978027
my/Элизиум - Глупый стеб, попса... и никаких революций! (1999) {SAPCD 042}	04 - Люблю тебя!.flac	-8.260002	0.978027
my/Элизиум - Глупый стеб, попса... и никаких революций! (1999) {SAPCD 042}	05 - Из Нижнего.flac	-10.209999	0.978027
my/Элизиум - Глупый стеб, попса... и никаких революций! (1999) {SAPCD 042}	06 - Как бы.flac	-8.290001	0.978027
my/Элизиум - Глупый стеб, попса... и никаких революций! (1999) {SAPCD 042}	07 - Basket case.flac	-8.639999	0.978027
my/Элизиум - Глупый стеб, попса... и никаких революций! (1999) {SAPCD 042}	08 - Развязочная.flac	-9.010002	0.978027
my/Элизиум - Глупый стеб, попса... и никаких революций! (1999) {SAPCD 042}	09 - Не моя любовь.flac	-8.360001	0.978027
my/Элизиум - Глупый стеб, попса... и никаких революций! (1999) {SAPCD 042}	10 - Круглый год - без забот.flac	-9.400002	0.978027
my/Элизиум - Глупый стеб, попса... и никаких революций! (1999) {SAPCD 042}	11 - The Vengeful Invalid.flac	-7.400002	0.978027
my/Элизиум - Глупый стеб, попса... и никаких революций! (1999) {SAPCD 042}	12 - Острова.flac	-10.389999	0.978027
my/Элизиум - Глупый стеб, попса... и никаких революций! (1999) {SAPCD 042}	13 - Не грусти.flac	-10.989998	0.978027
my/Элизиум - Глупый стеб, попса... и никаких революций! (1999) {SAPCD 042}	14 - Ослепительный мир.flac	-9.059998	0.978027
my/Элизиум - Глупый стеб, попса... и никаких революций! (1999) {SAPCD 042}	15 - Как бы все.flac	-10.870003	0.978027
my/Элизиум - Глупый стеб, попса... и никаких революций! (1999) {SAPCD 042}	16 - Куда теряется мечта.flac	-10.610001	0.978027
my/Элизиум - Радуга Live (2007)	01 - Элизиум - Ярко горят.flac	-6.209999	0.506042
my/Элизиум - Радуга Live (2007)	02 - Элизиум - Море наступает.flac	-6.769997	0.523193
my/Элизиум - Радуга Live (2007)	03 - Элизиум - Радуга.flac	-7.129997	0.571655
my/Элизиум - Радуга Live (2007)	04 - Элизиум feat. Сид - Тараканы! - Как Гоген.flac	-5.790001	0.451660
my/Элизиум - Радуга Live (2007)	05 - Элизиум feat. Сид - Тараканы! - Электричка.flac	-7.459999	0.576050
my/Элизиум - Радуга Live (2007)	06 - Элизиум - Сколько стоишь ты.flac	-6.559998	0.535248
my/Элизиум - Радуга Live (2007)	07 - Элизиум feat. Блондинка Ксю - Дождь.flac	-6.550003	0.505890
my/Элизиум - Радуга Live (2007)	08 - Элизиум feat. Блондинка Ксю - Солнце.flac	-6.160004	0.504395
my/Элизиум - Радуга Live (2007)	09 - Элизиум feat. Андрей Шабаев ''Электроники'' - Оптимизм.flac	-7.099998	0.528198
my/Элизиум - Радуга Live (2007)	10 - Элизиум feat. КежВатов - Spitfire - Алкогольная.flac	-6.669998	0.514313
my/Элизиум - Радуга Live (2007)	11 - Элизиум - Южная.flac	-6.510002	0.580627
my/Элизиум - Радуга Live (2007)	12 - Элизиум - Колесо Сансары.flac	-7.389999	0.699493
my/Элизиум - Радуга Live (2007)	13 - Элизиум feat. Аня Куликова - Слёзы-Зеркала.flac	-6.599998	0.561371
my/Элизиум - Радуга Live (2007)	14 - Элизиум feat. Аня Куликова - Космос.flac	-7.849998	0.570282
my/Элизиум - Радуга Live (2007)	15 - Элизиум - Как бы всё.flac	-6.510002	0.605011
my/Элизиум - Радуга Live (2007)	16 - Элизиум feat. Дацент - Distemper - Волшебные деньги.flac	-8.930000	1.000000
my/Элизиум - Радуга Live (2007)	17 - Элизиум - Я пришёл домой.flac	-6.980003	0.587921
my/Элизиум - Радуга Live (2007)	18 - Элизиум feat. Ваван Улей - На Марс.flac	-9.680000	0.720428
my/Элизиум - Радуга Live (2007)	19 - Элизиум - Эх, дороги.flac	-6.750000	0.558899
my/Элизиум - Радуга Live (2007)	20 - Элизиум feat. Дацент - Distemper - Моё оружие.flac	-6.739998	0.497742
my/Элизиум - Радуга Live (2007)	21 - Элизиум - Не моя Любовь.flac	-7.320000	0.548248
my/Элизиум - Радуга Live (2007)	22 - Элизиум feat. Аня Куликова - Интересно.flac	-7.360001	0.545410
my/Элизиум - Радуга Live (2007)	23 - Элизиум feat. Судзуки - Созвездие - Словно Будда.flac	-7.370003	0.511749
my/Элизиум - Снегири и драконы (2015)	01 - Всё и ничего....flac	-11.760002	0.983734
my/Элизиум - Снегири и драконы (2015)	02 - Где-то сжигают книги (feat. Lou).flac	-12.070000	0.983734
my/Элизиум - Снегири и драконы (2015)	03 - Как мотылёк.flac	-11.800003	0.983734
my/Элизиум - Снегири и драконы (2015)	04 - Снегири и драконы.flac	-11.040001	0.983734
my/Элизиум - Снегири и драконы (2015)	05 - Инопланетяне.flac	-12.250000	0.983734
my/Элизиум - Снегири и драконы (2015)	06 - Чёрное знамя.flac	-12.340004	0.983734
my/Элизиум - Снегири и драконы (2015)	07 - Свобода, равенство и братство.flac	-11.949997	0.983734
my/Элизиум - Снегири и драконы (2015)	08 - Ад наш!.flac	-12.090004	0.983734
my/Элизиум - Снегири и драконы (2015)	09 - Как кошки по крышам.flac	-11.900002	0.983734
my/Элизиум - Снегири и драконы (2015)	10 - В красном платье.flac	-12.279999	0.983734
my/Элизиум - Снегири и драконы (2015)	11 - 100% хит.flac	-11.430000	0.983734
my/Элизиум - Снегири и драконы (2015)	12 - Китайская.flac	-12.150002	0.983734
my/Элизиум - Снегири и драконы (2015)	13 - На танцы!.flac	-12.360001	0.983734
my/Элизиум - Снегири и драконы (2015)	14 - Когда мы были младше.flac	-12.610001	0.983765
my/Элизиум - Снегири и драконы (2015)	15 - ... всё и ничего.flac	-10.059998	0.983734
redacted.ch/17 Reasons	01 - Verbal Kint.flac	-7.959999	0.999939
redacted.ch/17 Reasons	02 - Nothing Left.flac	-6.910004	0.999939
redacted.ch/17 Reasons	03 - Enough.flac	-7.980003	0.999969
redacted.ch/17 Reasons	04 - Pretty Girls.flac	-8.099998	0.999939
redacted.ch/17 Reasons	05 - Jeff Acree.flac	-7.580002	0.999969
redacted.ch/17 Reasons	06 - Screwed.flac	-5.120003	0.999939
redacted.ch/17 Reasons	07 - Termination.flac	-9.529999	0.999969
redacted.ch/17 Reasons	08 - Turn It Around.flac	-9.080002	0.999969
redacted.ch/17 Reasons	09 - What Can I Do .flac	-7.360001	0.999939
redacted.ch/17 Reasons	10 - Up To The Top.flac	-6.900002	0.999969
redacted.ch/17 Reasons	11 - Dime-Store Hoods.flac	-7.410004	0.999939
redacted.ch/17 Reasons	12 - Slap.flac	-6.250000	0.999939
redacted.ch/17 Reasons	13 - Dance Floor.flac	-7.400002	0.999969
redacted.ch/17 Reasons	14 - Looking Back.flac	-6.690002	0.999939
redacted.ch/17 Reasons	15 - Nowhere Fast.flac	-6.629997	0.999969
redacted.ch/17 Reasons	16 - Jennifer's Cafe.flac	-6.930000	0.999939
redacted.ch/17 Reasons	17 - Burning Down.flac	-5.760002	0.999939
redacted.ch/1975 - A Night At The Opera - MFSL UDCD 568 - 1992	01 - Death On Two Legs - Dedicated To....flac	-4.840004	0.836395
redacted.ch/1975 - A Night At The Opera - MFSL UDCD 568 - 1992	02 - Lazing On A Sunday Afternoon.flac	-3.160004	0.919464
redacted.ch/1975 - A Night At The Opera - MFSL UDCD 568 - 1992	03 - I'm In Love With My Car.flac	-3.139999	0.944305
redacted.ch/1975 - A Night At The Opera - MFSL UDCD 568 - 1992	04 - You're My Best Friend.flac	-1.269997	0.711487
redacted.ch/1975 - A Night At The Opera - MFSL UDCD 568 - 1992	05 - '39.flac	-1.430000	0.881378
redacted.ch/1975 - A Night At The Opera - MFSL UDCD 568 - 1992	06 - Sweet Lady.flac	-2.709999	0.953186
redacted.ch/1975 - A Night At The Opera - MFSL UDCD 568 - 1992	07 - Seaside Rendezvous.flac	-5.459999	0.908051
redacted.ch/1975 - A Night At The Opera - MFSL UDCD 568 - 1992	08 - The Prophet's Song.flac	-2.440002	0.967560
redacted.ch/1975 - A Night At The Opera - MFSL UDCD 568 - 1992	09 - Love Of My Life.flac	-4.639999	0.905975
redacted.ch/1975 - A Night At The Opera - MFSL UDCD 568 - 1992	10 - Good Company.flac	-2.120003	0.770081
redacted.ch/1975 - A Night At The Opera - MFSL UDCD 568 - 1992	11 - Bohemian Rhapsody.flac	-2.169998	0.884949
redacted.ch/1975 - A Night At The Opera - MFSL UDCD 568 - 1992	12 - God Save The Queen.flac	1.520000	0.680420
redacted.ch/1983 - Labour Of Love	01 - Cherry Oh Baby.flac	1.150002	0.884216
redacted.ch/1983 - Labour Of Love	02 - Keep On Moving.flac	1.110001	0.582001
redacted.ch/1983 - Labour Of Love	03 - Please Don't Make Me Cry.flac	0.309998	0.752380
redacted.ch/1983 - Labour Of Love	04 - Sweet Sensation.flac	2.029999	0.660187
redacted.ch/1983 - Labour Of Love	05 - Johnny Too Bad.flac	1.739998	0.638214
redacted.ch/1983 - Labour Of Love	06 - Red Red Wine.flac	-0.209999	0.964294
redacted.ch/1983 - Labour Of Love	07 - Guilty.flac	2.720001	0.625336
redacted.ch/1983 - Labour Of Love	08 - She Caught The Train.flac	-2.059998	0.761475
redacted.ch/1983 - Labour Of Love	09 - Version Girl.flac	0.059998	0.960815
redacted.ch/1983 - Labour Of Love	10 - Many Rivers To Cross.flac	-2.169998	0.686371
redacted.ch/[1989] The Real Thing	Faith No More - 01 - From Out Of Nowhere.flac	-4.459999	0.999969
redacted.ch/[1989] The Real Thing	Faith No More - 02 - Epic.flac	-4.360001	0.968903
redacted.ch/[1989] The Real Thing	Faith No More - 03 - Falling To Pieces.flac	-3.750000	0.999969
redacted.ch/[1989] The Real Thing	Faith No More - 04 - Surprise! You're Dead!.flac	-3.029999	0.999969
redacted.ch/[1989] The Real Thing	Faith No More - 05 - Zombie Eaters.flac	-2.599998	0.999969
redacted.ch/[1989] The Real Thing	Faith No More - 06 - The Real Thing.flac	-2.279999	0.999084
redacted.ch/[1989] The Real Thing	Faith No More - 07 - Underwater Love.flac	-3.209999	0.999969
redacted.ch/[1989] The Real Thing	Faith No More - 08 - The Morning After.flac	-2.209999	0.876892
redacted.ch/[1989] The Real Thing	Faith No More - 09 - Woodpecker From Mars.flac	-4.269997	0.996552
redacted.ch/[1989] The Real Thing	Faith No More - 10 - War Pigs.flac	-4.430000	0.999969
redacted.ch/[1989] The Real Thing	Faith No More - 11 - Edge Of The World.flac	-1.209999	0.848633
redacted.ch/[1991] - Sailing the Seas of Cheese	01.  Seas of Cheese.flac	0.950001	0.534668
redacted.ch/[1991] - Sailing the Seas of Cheese	02.  Here Come the Bastards.flac	-2.489998	0.857300
redacted.ch/[1991] - Sailing the Seas of Cheese	03.  Sgt. Baker.flac	-2.790001	0.922028
redacted.ch/[1991] - Sailing the Seas of Cheese	04.  American Life.flac	-1.730003	0.906891
redacted.ch/[1991] - Sailing the Seas of Cheese	05.  Jerry Was a Race Car Driver.flac	-1.699997	0.908417
redacted.ch/[1991] - Sailing the Seas of Cheese	06.  Eleven.flac	-3.709999	0.990662
redacted.ch/[1991] - Sailing the Seas of Cheese	07.  Is It Luck .flac	-2.930000	0.844757
redacted.ch/[1991] - Sailing the Seas of Cheese	08.  Grandad's Little Ditty.flac	5.980000	0.256897
redacted.ch/[1991] - Sailing the Seas of Cheese	09.  Tommy the Cat.flac	-2.970001	0.889771
redacted.ch/[1991] - Sailing the Seas of Cheese	10.  Sathington Waltz.flac	-0.730003	0.972198
redacted.ch/[1991] - Sailing the Seas of Cheese	11.  Those Damned Blue-Collar Tweekers.flac	-1.849998	0.954376
redacted.ch/[1991] - Sailing the Seas of Cheese	12.  Fish On (Fisherman Chronicles, Chapter II).flac	-1.620003	0.995850
redacted.ch/[1991] - Sailing the Seas of Cheese	13.  Los Bastardos.flac	-2.519997	0.881256
redacted.ch/[1992] Automatic For The People (2005 DVD-A 2.0 24-48)	01 - Drive.flac	-4.660004	0.983198
redacted.ch/[1992] Automatic For The People (2005 DVD-A 2.0 24-48)	02 - Try Not To Breathe.flac	-4.150002	0.991129
redacted.ch/[1992] Automatic For The People (2005 DVD-A 2.0 24-48)	03 - The Sidewinder Sleeps Tonite.flac	-5.459999	1.000000
redacted.ch/[1992] Automatic For The People (2005 DVD-A 2.0 24-48)	04 - Everybody Hurts.flac	-4.959999	0.989800
redacted.ch/[1992] Automatic For The People (2005 DVD-A 2.0 24-48)	05 - New Orleans Instrumental No.1.flac	-0.590004	0.982636
redacted.ch/[1992] Automatic For The People (2005 DVD-A 2.0 24-48)	06 - Sweetness Follows.flac	-3.930000	1.000000
redacted.ch/[1992] Automatic For The People (2005 DVD-A 2.0 24-48)	07 - Money Got A Raw Deal.flac	-4.010002	1.000000
redacted.ch/[1992] Automatic For The People (2005 DVD-A 2.0 24-48)	08 - Ignoreland.flac	-6.779999	1.000000
redacted.ch/[1992] Automatic For The People (2005 DVD-A 2.0 24-48)	09 - Star Me Kitten.flac	-3.230003	1.000000
redacted.ch/[1992] Automatic For The People (2005 DVD-A 2.0 24-48)	10 - Man On The Moon.flac	-5.970001	1.000000
redacted.ch/[1992] Automatic For The People (2005 DVD-A 2.0 24-48)	11 - Nightswimming.flac	-4.949997	0.973507
redacted.ch/[1992] Automatic For The People (2005 DVD-A 2.0 24-48)	12 - Find The River.flac	-5.989998	1.000000
redacted.ch/1992 - The Longest Line [EP]	01 - The Death Of John Smith.flac	-5.370003	0.972015
redacted.ch/1992 - The Longest Line [EP]	02 - The Longest Line.flac	-4.090004	0.984344
redacted.ch/1992 - The Longest Line [EP]	03 - Stranded.flac	-6.160004	0.984375
redacted.ch/1992 - The Longest Line [EP]	04 - Remnants.flac	-7.419998	0.984375
redacted.ch/1992 - The Longest Line [EP]	05 - Kill All The White Man.flac	-8.669998	0.984375
redacted.ch/[1992] - White Trash, Two Heebs, And A Bean (FLAC)	01 - Soul Doubt.flac	-8.309998	0.953156
redacted.ch/[1992] - White Trash, Two Heebs, And A Bean (FLAC)	02 - Stickin In My Eye.flac	-7.699997	0.946564
redacted.ch/[1992] - White Trash, Two Heebs, And A Bean (FLAC)	03 - Bob.flac	-8.650002	0.948853
redacted.ch/[1992] - White Trash, Two Heebs, And A Bean (FLAC)	04 - You're Bleeding.flac	-7.910004	0.946564
redacted.ch/[1992] - White Trash, Two Heebs, And A Bean (FLAC)	05 - Straight Edge.flac	-4.090004	0.946564
redacted.ch/[1992] - White Trash, Two Heebs, And A Bean (FLAC)	06 - Liza and Louise.flac	-7.320000	0.953735
redacted.ch/[1992] - White Trash, Two Heebs, And A Bean (FLAC)	07 - The Bag.flac	-7.099998	0.950287
redacted.ch/[1992] - White Trash, Two Heebs, And A Bean (FLAC)	08 - Please Play This Song On The Radio.flac	-6.650002	0.948334
redacted.ch/[1992] - White Trash, Two Heebs, And A Bean (FLAC)	09 - Warm.flac	-7.260002	0.948364
redacted.ch/[1992] - White Trash, Two Heebs, And A Bean (FLAC)	10 - I Wanna Be Your Baby.flac	-7.379997	0.961365
redacted.ch/[1992] - White Trash, Two Heebs, And A Bean (FLAC)	11 - Johnny Appleseed.flac	-5.529999	0.962341
redacted.ch/[1992] - White Trash, Two Heebs, And A Bean (FLAC)	12 - She's Gone.flac	-8.080002	0.954071
redacted.ch/[1992] - White Trash, Two Heebs, And A Bean (FLAC)	13 - Buggley Eyes.flac	-1.239998	0.730927
redacted.ch/1993 - Chaos A.D	01 - Sepultura - Refuse , Resist.flac	-8.360001	0.999969
redacted.ch/1993 - Chaos A.D	02 - Sepultura - Territory.flac	-8.699997	0.999969
redacted.ch/1993 - Chaos A.D	03 - Sepultura - Slave New World.flac	-8.830002	0.999969
redacted.ch/1993 - Chaos A.D	04 - Sepultura - Amen.flac	-7.150002	0.999969
redacted.ch/1993 - Chaos A.D	05 - Sepultura - Kaiowas.flac	-2.739998	0.999969
redacted.ch/1993 - Chaos A.D	06 - Sepultura - Propaganda.flac	-7.730003	0.999969
redacted.ch/1993 - Chaos A.D	07 - Sepultura - Biotech Is Godzilla.flac	-8.260002	0.999969
redacted.ch/1993 - Chaos A.D	08 - Sepultura - Nomad.flac	-7.459999	0.999969
redacted.ch/1993 - Chaos A.D	09 - Sepultura - We Who Are Not As Others.flac	-6.940002	0.999969
redacted.ch/1993 - Chaos A.D	10 - Sepultura - Manifest.flac	-8.389999	0.999969
redacted.ch/1993 - Chaos A.D	11 - Sepultura - The Hunt.flac	-7.279999	0.999969
redacted.ch/1993 - Chaos A.D	12 - Sepultura - Clenched Fist.flac	-7.879997	0.999969
redacted.ch/1993 - Chaos A.D	13 - Sepultura - Talking Shit.flac	-1.080002	0.830963
redacted.ch/1996 - Losing Streak (FLAC)	00 - Less Than Jake - Untitled.flac	-5.199997	0.935944
redacted.ch/1996 - Losing Streak (FLAC)	01 - Less Than Jake - Automatic.flac	-12.379997	0.962860
redacted.ch/1996 - Losing Streak (FLAC)	02 - Less Than Jake - Happyman.flac	-11.150002	0.961823
redacted.ch/1996 - Losing Streak (FLAC)	03 - Less Than Jake - 9th At Pine.flac	-9.760002	0.960510
redacted.ch/1996 - Losing Streak (FLAC)	04 - Less Than Jake - Sugar In Your Gas Tank.flac	-11.699997	0.981964
redacted.ch/1996 - Losing Streak (FLAC)	05 - Less Than Jake - Shindo.flac	-11.070000	1.000000
redacted.ch/1996 - Losing Streak (FLAC)	06 - Less Than Jake - 107.flac	-12.150002	0.957733
redacted.ch/1996 - Losing Streak (FLAC)	07 - Less Than Jake - Johnny Quest Thinks We're Sellouts.flac	-11.900002	0.970459
redacted.ch/1996 - Losing Streak (FLAC)	08 - Less Than Jake - Krazy Glue.flac	-11.169998	0.981842
redacted.ch/1996 - Losing Streak (FLAC)	09 - Less Than Jake - Never Going Back To New Jersey.flac	-10.860001	0.950531
redacted.ch/1996 - Losing Streak (FLAC)	10 - Less Than Jake - How's My Driving Doug Hastings .flac	-12.269997	1.000000
redacted.ch/1996 - Losing Streak (FLAC)	11 - Less Than Jake - Just Like Frank.flac	-10.019997	0.946320
redacted.ch/1996 - Losing Streak (FLAC)	12 - Less Than Jake - Ask The Magic 8 Ball.flac	-10.940002	0.945068
redacted.ch/1996 - Losing Streak (FLAC)	13 - Less Than Jake - Dopeman.flac	-11.269997	0.949738
redacted.ch/1996 - Losing Streak (FLAC)	14 - Less Than Jake - Jen Doesn't Like Me Anymore.flac	-10.650002	0.957123
redacted.ch/1996 - Losing Streak (FLAC)	15 - Less Than Jake - Rock-n-Roll Pizzeria.flac	-11.459999	0.974579
redacted.ch/1996 - Losing Streak (FLAC)	16 - Less Than Jake - Lockdown.flac	-10.980003	0.962769
redacted.ch/1998 - 77 Days [FLAC]	01 - Heart Beat.flac	-7.870003	0.966064
redacted.ch/1998 - 77 Days [FLAC]	02 - PMA (Positive Mental Attitude).flac	-8.230003	0.966095
redacted.ch/1998 - 77 Days [FLAC]	03 - Minimum Wage.flac	-8.300003	0.966064
redacted.ch/1998 - 77 Days [FLAC]	04 - Ohichyo.flac	-8.110001	0.966034
redacted.ch/1998 - 77 Days [FLAC]	05 - Birthday.flac	-8.650002	0.966003
redacted.ch/1998 - 77 Days [FLAC]	06 - Nite Drive.flac	-7.260002	0.966034
redacted.ch/1998 - 77 Days [FLAC]	07 - What Else.flac	-8.090004	0.966064
redacted.ch/1998 - 77 Days [FLAC]	08 - Tiny Square Room.flac	-8.010002	0.966064
redacted.ch/1998 - 77 Days [FLAC]	09 - Lights and Shadows.flac	-7.690002	0.966125
redacted.ch/1998 - 77 Days [FLAC]	10 - Kanasimiyo.flac	-7.610001	0.966064
redacted.ch/1998 - 77 Days [FLAC]	11 - Second Chance.flac	-8.010002	0.966034
redacted.ch/1998 - 77 Days [FLAC]	12 - Father's Mountain.flac	-6.180000	0.966003
redacted.ch/1998 - 77 Days [FLAC]	13 - Secret.flac	-8.209999	0.966034
redacted.ch/1998 - 77 Days [FLAC]	14 - Along The Longest Way.flac	-7.590004	0.966064
redacted.ch/[1998] Oceanborn	Nightwish - 01 - Stargazers.flac	-10.050003	0.988647
redacted.ch/[1998] Oceanborn	Nightwish - 02 - Gethsemane.flac	-10.260002	0.988647
redacted.ch/[1998] Oceanborn	Nightwish - 03 - Devil & The Deep Dark Ocean.flac	-9.930000	0.988647
redacted.ch/[1998] Oceanborn	Nightwish - 04 - Sacrament Of Wilderness.flac	-9.570000	0.982788
redacted.ch/[1998] Oceanborn	Nightwish - 05 - Passion And The Opera.flac	-10.279999	0.982819
redacted.ch/[1998] Oceanborn	Nightwish - 06 - Swanheart.flac	-8.959999	0.982788
redacted.ch/[1998] Oceanborn	Nightwish - 07 - Moondance.flac	-10.970001	0.988647
redacted.ch/[1998] Oceanborn	Nightwish - 08 - The Riddler.flac	-10.180000	0.982819
redacted.ch/[1998] Oceanborn	Nightwish - 09 - The Pharaoh Sails To Orion.flac	-10.370003	0.988586
redacted.ch/[1998] Oceanborn	Nightwish - 10 - Walking In The Air.flac	-10.590004	0.988647
redacted.ch/[1998] Oceanborn	Nightwish - 11 - Sleeping Sun.flac	-8.250000	0.977478
redacted.ch/2003 - 1й круг	01 - 1й круг.flac	-10.419998	0.982269
redacted.ch/2003 - 1й круг	02 - В поисках рая.flac	-11.250000	0.982269
redacted.ch/2003 - 1й круг	03 - Вечное лето.flac	-10.489998	0.982269
redacted.ch/2003 - 1й круг	04 - Чужими глазами.flac	-12.160004	0.982269
redacted.ch/2003 - 1й круг	05 - Рост.flac	-10.629997	0.982269
redacted.ch/2003 - 1й круг	06 - Тоска.flac	-11.290001	0.982269
redacted.ch/2003 - 1й круг	07 - Черная весна.flac	-10.080002	0.982269
redacted.ch/2003 - 1й круг	08 - Право.flac	-10.110001	0.982269
redacted.ch/2003 - 1й круг	09 - Смерть моего тела.flac	-10.230003	0.982269
redacted.ch/2003 - 1й круг	10 - Зеленый дом.flac	-10.800003	0.982269
redacted.ch/2003 - 1й круг	11 - 24 часа.flac	-9.959999	0.982269
redacted.ch/2003 - 1й круг	12 - Тем кто умел летать.flac	-9.519997	0.982269
redacted.ch/2003 - 1й круг	13 - Безнадежен.flac	-10.129997	0.982269
redacted.ch/2003 - 1й круг	14 - Армагеддон.flac	-9.370003	0.982269
redacted.ch/2003 Just One More	01 Drinking For 11.flac	-8.279999	0.988708
redacted.ch/2003 Just One More	02 Contraband.flac	-10.320000	0.988708
redacted.ch/2003 Just One More	03 Villains.flac	-9.540001	0.988739
redacted.ch/2003 Just One More	04 Silence.flac	-10.430000	0.988708
redacted.ch/2003 Just One More	05 Just One More.flac	-9.680000	0.988647
redacted.ch/2003 Just One More	06 Day By Day.flac	-10.779999	0.988708
redacted.ch/2003 Just One More	07 Leavin.flac	-11.010002	0.988708
redacted.ch/2003 Just One More	08 Rockupation.flac	-10.230003	0.988708
redacted.ch/2003 Just One More	09 Last Breath.flac	-9.860001	0.988708
redacted.ch/2003 Just One More	10 Spare Change .flac	-8.220001	0.988708
redacted.ch/2003 Just One More	11 Riot.flac	-9.349998	0.988708
redacted.ch/2003 Just One More	12 10 West.flac	-9.940002	0.988739
redacted.ch/2003 Just One More	13 Good Intentions.flac	-10.690002	0.988739
redacted.ch/2003 Just One More	14 Wet Dog.flac	-10.230003	0.988708
redacted.ch/2003 Just One More	15 Game Show.flac	-10.379997	0.988708
redacted.ch/(2003) Through The Ashes Of Empires	01-Imperium.flac	-8.970001	1.000000
redacted.ch/(2003) Through The Ashes Of Empires	02-Bite The Bullet.flac	-9.970001	0.991333
redacted.ch/(2003) Through The Ashes Of Empires	03-Left Unfinished.flac	-10.010002	0.999969
redacted.ch/(2003) Through The Ashes Of Empires	04-Elegy.flac	-9.590004	0.988708
redacted.ch/(2003) Through The Ashes Of Empires	05-In The Presence Of My Enemies.flac	-8.779999	0.988708
redacted.ch/(2003) Through The Ashes Of Empires	06-Days Turn Blue To Gray.flac	-9.440002	1.000000
redacted.ch/(2003) Through The Ashes Of Empires	07-Vim.flac	-8.629997	0.988708
redacted.ch/(2003) Through The Ashes Of Empires	08-All Falls Down.flac	-9.379997	0.988708
redacted.ch/(2003) Through The Ashes Of Empires	09-Wipe The Tears.flac	-9.239998	0.988708
redacted.ch/(2003) Through The Ashes Of Empires	10-Descend The Shades Of Night.flac	-9.320000	0.988708
redacted.ch/2004 - Once	01 - Dark Chest of Wonders.flac	-8.150002	0.977234
redacted.ch/2004 - Once	02 - Wish I Had an Angel.flac	-8.320000	0.977264
redacted.ch/2004 - Once	03 - Nemo.flac	-8.209999	0.948792
redacted.ch/2004 - Once	04 - Planet Hell.flac	-8.320000	0.977264
redacted.ch/2004 - Once	05 - Creek Mary's Blood.flac	-8.459999	0.962128
redacted.ch/2004 - Once	06 - The Siren.flac	-8.760002	0.961853
redacted.ch/2004 - Once	07 - Dead Gardens.flac	-9.190002	0.977264
redacted.ch/2004 - Once	08 - Romanticide.flac	-9.980003	0.977264
redacted.ch/2004 - Once	09 - Ghost Love Score.flac	-9.440002	0.977264
redacted.ch/2004 - Once	10 - Kuolema Tekee Taiteilijan.flac	-3.360001	0.793579
redacted.ch/2004 - Once	11 - Higher Than Hope.flac	-9.050003	0.912628
redacted.ch/2004 The Silent Force [FLAC]	01 Intro.flac	-8.260002	0.988586
redacted.ch/2004 The Silent Force [FLAC]	02 See Who I Am.flac	-10.050003	1.000000
redacted.ch/2004 The Silent Force [FLAC]	03 Jillian (I'd Give My Heart).flac	-10.410004	0.988678
redacted.ch/2004 The Silent Force [FLAC]	04 Stand My Ground.flac	-10.919998	0.988678
redacted.ch/2004 The Silent Force [FLAC]	05 Pale.flac	-9.500000	0.988678
redacted.ch/2004 The Silent Force [FLAC]	06 Forsaken.flac	-9.849998	0.988678
redacted.ch/2004 The Silent Force [FLAC]	07 Angels.flac	-9.959999	0.988678
redacted.ch/2004 The Silent Force [FLAC]	08 Memories.flac	-9.279999	0.988586
redacted.ch/2004 The Silent Force [FLAC]	09 Aquarius.flac	-11.010002	0.988678
redacted.ch/2004 The Silent Force [FLAC]	10 It's The Fear.flac	-9.800003	0.988678
redacted.ch/2004 The Silent Force [FLAC]	11 Somewhere.flac	-8.220001	0.986053
redacted.ch/[2005] Whatever People Say I Am, That's What I'm Not	01 - Arctic Monkeys - The View From The Afternoon.flac	-9.340004	0.999084
redacted.ch/[2005] Whatever People Say I Am, That's What I'm Not	02 - Arctic Monkeys - I Bet You Look Good On The Dancefloor.flac	-9.220001	0.999084
redacted.ch/[2005] Whatever People Say I Am, That's What I'm Not	03 - Arctic Monkeys - Fake Tales Of San Fransisco.flac	-9.809998	0.999115
redacted.ch/[2005] Whatever People Say I Am, That's What I'm Not	04 - Arctic Monkeys - Dancing Shoes.flac	-9.480003	0.999115
redacted.ch/[2005] Whatever People Say I Am, That's What I'm Not	05 - Arctic Monkeys - You Probably Couldn't See For The Lights But You Were Staring Straight At Me.flac	-8.970001	0.999451
redacted.ch/[2005] Whatever People Say I Am, That's What I'm Not	06 - Arctic Monkeys - Still Take You Home.flac	-9.590004	0.999115
redacted.ch/[2005] Whatever People Say I Am, That's What I'm Not	07 - Arctic Monkeys - Riot Van.flac	-2.199997	0.999054
redacted.ch/[2005] Whatever People Say I Am, That's What I'm Not	08 - Arctic Monkeys - Red Light Indicates Doors Are Secured.flac	-9.400002	0.999115
redacted.ch/[2005] Whatever People Say I Am, That's What I'm Not	09 - Arctic Monkeys - Mardy Bum.flac	-8.599998	0.999146
redacted.ch/[2005] Whatever People Say I Am, That's What I'm Not	10 - Arctic Monkeys - Perhaps Vampires Is a Bit Strong But....flac	-9.260002	0.999146
redacted.ch/[2005] Whatever People Say I Am, That's What I'm Not	11 - Arctic Monkeys - When The Sun Goes Down.flac	-9.480003	0.999115
redacted.ch/[2005] Whatever People Say I Am, That's What I'm Not	12 - Arctic Monkeys - From The Ritz To The Rubble.flac	-9.190002	0.999115
redacted.ch/[2005] Whatever People Say I Am, That's What I'm Not	13 - Arctic Monkeys - A Certain Romance.flac	-8.699997	0.999207
redacted.ch/2006 - Never Trust A Hippy [EP]	01 - Seeing Double At The Triple Rock.flac	-9.739998	0.977264
redacted.ch/2006 - Never Trust A Hippy [EP]	02 - The Marxist Brothers.flac	-8.160004	0.977295
redacted.ch/2006 - Never Trust A Hippy [EP]	03 - Golden Boys.flac	-9.830002	0.977264
redacted.ch/2006 - Never Trust A Hippy [EP]	04 - You're Wrong.flac	-6.029999	0.977264
redacted.ch/2006 - Never Trust A Hippy [EP]	05 - Everything In Moderation (Especially Moderation).flac	-9.010002	0.977264
redacted.ch/2006 - Never Trust A Hippy [EP]	06 - I'm Going To Hell For This One.flac	-9.959999	0.977295
redacted.ch/2008 - The Art Of Saying Nothing	01 - Untouchable.flac	-9.800003	0.996735
redacted.ch/2008 - The Art Of Saying Nothing	02 - Man On The Street.flac	-10.040001	0.999390
redacted.ch/2008 - The Art Of Saying Nothing	03 - In A Letter.flac	-10.050003	0.992676
redacted.ch/2008 - The Art Of Saying Nothing	04 - Jenny.flac	-10.709999	0.991333
redacted.ch/2008 - The Art Of Saying Nothing	05 - The Beast.flac	-11.730003	0.992096
redacted.ch/2008 - The Art Of Saying Nothing	06 - Alperton.flac	-8.209999	0.993134
redacted.ch/2008 - The Art Of Saying Nothing	07 - Beer Belly.flac	-9.809998	0.991821
redacted.ch/2008 - The Art Of Saying Nothing	08 - The Landlord's Daughter.flac	-11.250000	0.993347
redacted.ch/2008 - The Art Of Saying Nothing	09 - Great British Summertime.flac	-11.910004	0.999451
redacted.ch/2008 - The Art Of Saying Nothing	10 - First Past The Pump.flac	-9.940002	0.990997
redacted.ch/2008 - The Art Of Saying Nothing	11 - King Of Kings.flac	-10.660004	0.990692
redacted.ch/2008 - The Art Of Saying Nothing	12 - Sombrero.flac	-8.919998	1.000000
redacted.ch/2010 - Immersion	01 - Genesis.flac	-8.750000	0.957275
redacted.ch/2010 - Immersion	02 - Salt In The Wounds.flac	-9.129997	1.000000
redacted.ch/2010 - Immersion	03 - Watercolour.flac	-8.080002	0.997803
redacted.ch/2010 - Immersion	04 - Set Me On Fire.flac	-7.370003	0.997864
redacted.ch/2010 - Immersion	05 - Crush.flac	-10.150002	0.997894
redacted.ch/2010 - Immersion	06 - Under The Waves.flac	-8.400002	0.997833
redacted.ch/2010 - Immersion	07 - Immunize (feat. Liam H).flac	-9.919998	0.997894
redacted.ch/2010 - Immersion	08 - The Island - Pt. I (Dawn).flac	-8.900002	0.997894
redacted.ch/2010 - Immersion	09 - The Island - Pt. 2 (Dusk).flac	-9.419998	0.997864
redacted.ch/2010 - Immersion	10 - Comprachicos.flac	-10.230003	0.997894
redacted.ch/2010 - Immersion	11 - The Vulture.flac	-10.050003	0.998047
redacted.ch/2010 - Immersion	12 - Witchcraft.flac	-11.279999	1.000000
redacted.ch/2010 - Immersion	13 - Self vs Self (feat. In Flames).flac	-11.349998	0.997925
redacted.ch/2010 - Immersion	14 - The Fountain (feat. Steve Wilson).flac	-10.629997	0.997894
redacted.ch/2010 - Immersion	15 - Encoder.flac	-8.970001	0.997772
redacted.ch/[2011] Sunny Side Of The Street	01 - Sunny Side Of The Street.flac	-7.639999	0.977203
redacted.ch/[2011] Sunny Side Of The Street	02 - Sunny Side Of The Street (Sonic Scribe Remix).flac	-7.309998	0.977203
redacted.ch/[2011] Sunny Side Of The Street	03 - Sunny Side Of The Street (Demo).flac	-9.040001	0.977203
redacted.ch/[2013] MC Rises (FLAC)	01 - MC Rises.flac	-7.300003	1.000000
redacted.ch/[2013] MC Rises (FLAC)	02 - The Devlin Manor of Speech.flac	-5.570000	0.999969
redacted.ch/[2013] MC Rises (FLAC)	03 - Bat Swoops Down.flac	-6.639999	0.997559
redacted.ch/[2013] MC Rises (FLAC)	04 - One Solid Connection.flac	-7.650002	0.999969
redacted.ch/[2013] MC Rises (FLAC)	05 - High Chieftain.flac	-6.269997	1.000000
redacted.ch/[2013] MC Rises (FLAC)	06 - Super Solar Prominence.flac	-7.669998	1.000000
redacted.ch/[2013] MC Rises (FLAC)	07 - Conduct the Madness.flac	-7.620003	1.000000
redacted.ch/[2013] MC Rises (FLAC)	08 - Otras Dimensiones.flac	-8.330002	1.000000
redacted.ch/[2013] MC Rises (FLAC)	09 - Atop an Ice Cap.flac	-6.690002	1.000000
redacted.ch/[2013] MC Rises (FLAC)	10 - Clash of the Staves.flac	-6.669998	0.999969
redacted.ch/[2013] MC Rises (FLAC)	11 - All Men Are Brothers.flac	-6.419998	0.999969
redacted.ch/[2013] MC Rises (FLAC)	12 - A Knight Amidst Chaos.flac	-5.989998	1.000000
redacted.ch/[2013] MC Rises (FLAC)	13 - Ghost Band.flac	-5.590004	0.999908
redacted.ch/311 - 311	01 - Down.flac	-6.519997	0.933258
redacted.ch/311 - 311	02 - Random.flac	-5.040001	0.988556
redacted.ch/311 - 311	03 - Jackolantern's Weather.flac	-5.949997	0.933258
redacted.ch/311 - 311	04 - All Mixed Up.flac	-4.660004	0.988556
redacted.ch/311 - 311	05 - Hive.flac	-7.849998	0.944061
redacted.ch/311 - 311	06 - Guns (Are For Pussies).flac	-6.699997	0.988556
redacted.ch/311 - 311	07 - Misdirected Hostility.flac	-6.930000	0.989502
redacted.ch/311 - 311	08 - Purpose.flac	-5.480003	0.988556
redacted.ch/311 - 311	09 - Loco.flac	-6.669998	0.988556
redacted.ch/311 - 311	10 - Brodels.flac	-6.180000	0.988556
redacted.ch/311 - 311	11 - Don't Stay Home.flac	-7.190002	0.944061
redacted.ch/311 - 311	12 - Dlmd.flac	-6.660004	0.988556
redacted.ch/311 - 311	13 - Sweet.flac	-5.590004	0.988556
redacted.ch/311 - 311	14 - T & P Combo.flac	-9.489998	0.944092
redacted.ch/311 - From Chaos	01 - You Get Worked.flac	-7.220001	0.988647
redacted.ch/311 - From Chaos	02 - Sick Tight.flac	-7.620003	0.988647
redacted.ch/311 - From Chaos	03 - You Wouldn't Believe.flac	-8.620003	0.988647
redacted.ch/311 - From Chaos	04 - Full Ride.flac	-7.129997	0.988647
redacted.ch/311 - From Chaos	05 - From Chaos.flac	-7.629997	0.988647
redacted.ch/311 - From Chaos	06 - I Told Myself.flac	-8.260002	0.988647
redacted.ch/311 - From Chaos	07 - Champagne.flac	-4.650002	0.881165
redacted.ch/311 - From Chaos	08 - Hostile Apostle.flac	-7.840004	0.988647
redacted.ch/311 - From Chaos	09 - Wake Your Mind Up.flac	-8.879997	0.988647
redacted.ch/311 - From Chaos	10 - Amber.flac	-5.959999	0.988647
redacted.ch/311 - From Chaos	11 - Uncalm.flac	-6.989998	0.988647
redacted.ch/311 - From Chaos	12 - I'll Be Here Awhile.flac	-6.340004	0.988647
redacted.ch/311 - Grassroots	01 - Homebrew.flac	-5.150002	0.956543
redacted.ch/311 - Grassroots	02 - Lucky.flac	-4.449997	0.955139
redacted.ch/311 - Grassroots	03 - Nutsymtom.flac	-5.279999	0.950867
redacted.ch/311 - Grassroots	04 - 8-16 AM.flac	-2.550003	0.933594
redacted.ch/311 - Grassroots	05 - Omaha Stylee.flac	-5.620003	0.980804
redacted.ch/311 - Grassroots	06 - Applied Science.flac	-6.449997	0.965668
redacted.ch/311 - Grassroots	07 - Taiyed.flac	-6.120003	0.953491
redacted.ch/311 - Grassroots	08 - Silver.flac	-6.910004	0.980377
redacted.ch/311 - Grassroots	09 - Grassroots.flac	-5.150002	0.969391
redacted.ch/311 - Grassroots	10 - Salsa.flac	-6.739998	0.980164
redacted.ch/311 - Grassroots	11 - Lose.flac	-3.169998	0.979034
redacted.ch/311 - Grassroots	12 - Six.flac	-6.629997	0.983368
redacted.ch/311 - Grassroots	13 - Offbeat Bare Ass.flac	-7.169998	0.972290
redacted.ch/311 - Grassroots	14 - 1,2,3.flac	-5.540001	0.940857
redacted.ch/65daysofstatic - The Fall Of Math	01 - 65daysofstatic - Another Code Against The Gone.flac	-10.239998	0.998993
redacted.ch/65daysofstatic - The Fall Of Math	02 - 65daysofstatic - Install A Beak In The Heart That Clucks Time In Arabic.flac	-9.449997	1.000000
redacted.ch/65daysofstatic - The Fall Of Math	03 - 65daysofstatic - Retreat! Retreat!.flac	-12.340004	1.000000
redacted.ch/65daysofstatic - The Fall Of Math	04 - 65daysofstatic - Default This.flac	-13.430000	0.817505
redacted.ch/65daysofstatic - The Fall Of Math	05 - 65daysofstatic - I Swallowed Hard, Like I Understood.flac	-11.019997	1.000000
redacted.ch/65daysofstatic - The Fall Of Math	06 - 65daysofstatic - The Fall of Math.flac	-11.570000	1.000000
redacted.ch/65daysofstatic - The Fall Of Math	07 - 65daysofstatic - The Cat Is A Landmine.flac	-11.930000	1.000000
redacted.ch/65daysofstatic - The Fall Of Math	08 - 65daysofstatic - The Last Home Recording.flac	-7.230003	0.888153
redacted.ch/65daysofstatic - The Fall Of Math	09 - 65daysofstatic - Hole.flac	-10.949997	1.000000
redacted.ch/65daysofstatic - The Fall Of Math	10 - 65daysofstatic - Fix The Sky A Little.flac	-10.389999	1.000000
redacted.ch/65daysofstatic - The Fall Of Math	11 - 65daysofstatic - Aren't We All Running .flac	-11.449997	1.000000
redacted.ch/7paca - Kacheli [FLAC]	01 - Оставь нам боль.flac	-11.389999	0.982269
redacted.ch/7paca - Kacheli [FLAC]	02 - Качели.flac	-11.209999	0.982269
redacted.ch/7paca - Kacheli [FLAC]	03 - Нечаянно.flac	-11.070000	0.982269
redacted.ch/7paca - Kacheli [FLAC]	04 - Топливо.flac	-11.120003	0.982269
redacted.ch/7paca - Kacheli [FLAC]	05 - Враг культуры.flac	-11.860001	0.982269
redacted.ch/7paca - Kacheli [FLAC]	06 - Ты или Я.flac	-11.160004	0.982269
redacted.ch/7paca - Kacheli [FLAC]	07 - xxx.flac	2.689999	0.819641
redacted.ch/7paca - Kacheli [FLAC]	08 - Е.А..flac	-12.830002	0.982269
redacted.ch/7paca - Kacheli [FLAC]	09 - Подъём.flac	-11.870003	0.982269
redacted.ch/7paca - Kacheli [FLAC]	10 - Солдат.flac	-10.919998	0.982269
redacted.ch/7paca - Kacheli [FLAC]	11 - Люди гибнут за попс.flac	-11.540001	0.982269
redacted.ch/7paca - Kacheli [FLAC]	12 - Нет сомнений.flac	-10.779999	0.982269
redacted.ch/7paca - Kacheli [FLAC]	13 - Три цвета.flac	-9.980003	0.982269
redacted.ch/7paca - Kacheli [FLAC]	14 - Теперь всё будет хорошо.flac	-11.340004	0.982269
redacted.ch/7paca - Kacheli [FLAC]	15 - Революция.flac	-4.639999	0.875458
redacted.ch/Abney Park - Lost Horizons (2008)	01 - Airship Pirate.flac	-9.000000	0.988617
redacted.ch/Abney Park - Lost Horizons (2008)	02 - The Emperor's Wives.flac	-7.580002	0.988617
redacted.ch/Abney Park - Lost Horizons (2008)	03 - Sleep Isabella.flac	-5.120003	0.988617
redacted.ch/Abney Park - Lost Horizons (2008)	04 - She.flac	-7.540001	0.988617
redacted.ch/Abney Park - Lost Horizons (2008)	05 - The Secret Life of Dr Calgori.flac	-5.750000	0.988617
redacted.ch/Abney Park - Lost Horizons (2008)	06 - This Dark and Twisty Road.flac	-7.510002	0.988617
redacted.ch/Abney Park - Lost Horizons (2008)	07 - Herr Drosselmyers Doll.flac	-4.889999	0.988617
redacted.ch/Abney Park - Lost Horizons (2008)	08 - Virus.flac	-5.110001	0.988617
redacted.ch/Abney Park - Lost Horizons (2008)	09 - I am Stretched on Your Grave.flac	-7.260002	0.988617
redacted.ch/Abney Park - Lost Horizons (2008)	10 - Post Apocolapse Punk.flac	-8.580002	0.988617
redacted.ch/Abney Park - Lost Horizons (2008)	11 - Hidden Track.flac	-3.389999	0.988617
redacted.ch/ Acoustic Ladyland - 2006 - Skinny Grin	01 - Road of Bones .flac	-9.599998	0.998901
redacted.ch/ Acoustic Ladyland - 2006 - Skinny Grin	02 - New Me .flac	-11.410004	0.998901
redacted.ch/ Acoustic Ladyland - 2006 - Skinny Grin	03 - Red Sky .flac	-9.099998	0.998901
redacted.ch/ Acoustic Ladyland - 2006 - Skinny Grin	04 - Paris .flac	-11.739998	0.998901
redacted.ch/ Acoustic Ladyland - 2006 - Skinny Grin	05 - Your Shame .flac	-10.059998	0.998901
redacted.ch/ Acoustic Ladyland - 2006 - Skinny Grin	06 - Skinny Grin .flac	-9.709999	0.998901
redacted.ch/ Acoustic Ladyland - 2006 - Skinny Grin	07 - Salt Water (Scott Walker mix) .flac	-9.010002	0.998901
redacted.ch/ Acoustic Ladyland - 2006 - Skinny Grin	08 - Cuts & Lies .flac	-10.830002	0.998901
redacted.ch/ Acoustic Ladyland - 2006 - Skinny Grin	09 - Glass Agenda .flac	-9.750000	0.998901
redacted.ch/ Acoustic Ladyland - 2006 - Skinny Grin	10 - That Night .flac	-9.889999	0.998901
redacted.ch/ Acoustic Ladyland - 2006 - Skinny Grin	11 - The Rise .flac	-8.000000	0.998901
redacted.ch/ Acoustic Ladyland - 2006 - Skinny Grin	12 - The Room .flac	-9.750000	0.998901
redacted.ch/ Acoustic Ladyland - 2006 - Skinny Grin	13 - Hitting Home .flac	-7.980003	0.998901
redacted.ch/Against All Authority - All Fall Down (FLAC)	01 - All Fall Down.flac	-10.650002	0.988556
redacted.ch/Against All Authority - All Fall Down (FLAC)	02 - 12-00 AM.flac	-9.849998	0.988556
redacted.ch/Against All Authority - All Fall Down (FLAC)	03 - Justification.flac	-10.199997	0.988708
redacted.ch/Against All Authority - All Fall Down (FLAC)	04 - Keep Trying.flac	-10.340004	0.988556
redacted.ch/Against All Authority - All Fall Down (FLAC)	05 - At Our Expense.flac	-9.959999	0.988556
redacted.ch/Against All Authority - All Fall Down (FLAC)	06 - Stand in Line.flac	-10.849998	0.988556
redacted.ch/Against All Authority - All Fall Down (FLAC)	07 - Toby.flac	-10.629997	0.988556
redacted.ch/Against All Authority - All Fall Down (FLAC)	08 - We Don't Need You.flac	-10.090004	0.988556
redacted.ch/Against All Authority - All Fall Down (FLAC)	09 - The Mayhem & The Pain.flac	-10.750000	0.988556
redacted.ch/Against All Authority - All Fall Down (FLAC)	10 - Louder Than Words.flac	-10.989998	0.988556
redacted.ch/Against All Authority - All Fall Down (FLAC)	11 - What the Fuck'd You Expect .flac	-10.669998	0.988739
redacted.ch/Against All Authority - All Fall Down (FLAC)	12 - Daddy's Little Girl.flac	-10.430000	0.933685
redacted.ch/Against All Authority - All Fall Down (FLAC)	13 - Sk8 Rock.flac	-11.349998	0.988556
redacted.ch/Against All Authority - All Fall Down (FLAC)	14 - Watered Down & Passive.flac	-9.550003	0.988586
redacted.ch/Against All Authority - All Fall Down (FLAC)	15 - When the Rain Begins to Fall.flac	-10.430000	0.988556
redacted.ch/Agnostic Front -1998- Something's Gotta Give (FLAC)	Agnostic Front -01- Something's Gotta Give.flac	-9.349998	0.993011
redacted.ch/Agnostic Front -1998- Something's Gotta Give (FLAC)	Agnostic Front -02- Believe.flac	-9.879997	0.987396
redacted.ch/Agnostic Front -1998- Something's Gotta Give (FLAC)	Agnostic Front -03- Gotta Go.flac	-10.080002	0.993073
redacted.ch/Agnostic Front -1998- Something's Gotta Give (FLAC)	Agnostic Front -04- Before My Eyes.flac	-9.330002	0.971313
redacted.ch/Agnostic Front -1998- Something's Gotta Give (FLAC)	Agnostic Front -05- No Fear.flac	-9.010002	0.974884
redacted.ch/Agnostic Front -1998- Something's Gotta Give (FLAC)	Agnostic Front -06- Blinded.flac	-9.190002	0.989319
redacted.ch/Agnostic Front -1998- Something's Gotta Give (FLAC)	Agnostic Front -07- Voices.flac	-9.230003	0.980530
redacted.ch/Agnostic Front -1998- Something's Gotta Give (FLAC)	Agnostic Front -08- Do Or Die.flac	-9.900002	0.990967
redacted.ch/Agnostic Front -1998- Something's Gotta Give (FLAC)	Agnostic Front -09- My War.flac	-8.980003	0.992676
redacted.ch/Agnostic Front -1998- Something's Gotta Give (FLAC)	Agnostic Front -10- Bloodsucker.flac	-9.160004	0.992279
redacted.ch/Agnostic Front -1998- Something's Gotta Give (FLAC)	Agnostic Front -11- The Blame.flac	-9.980003	0.990967
redacted.ch/Agnostic Front -1998- Something's Gotta Give (FLAC)	Agnostic Front -12- Today, Tomorrow, Forever.flac	-9.680000	0.977173
redacted.ch/Agnostic Front -1998- Something's Gotta Give (FLAC)	Agnostic Front -13- Rage.flac	-8.559998	0.970062
redacted.ch/Agnostic Front -1998- Something's Gotta Give (FLAC)	Agnostic Front -14- Pauly The Dog.flac	-4.169998	0.613373
redacted.ch/Agnostic Front -1998- Something's Gotta Give (FLAC)	Agnostic Front -15- Crucified.flac	-8.349998	0.973328
redacted.ch/All That Remains - Overcome (2008) [FLAC]	01 - Before the Damned.flac	-10.099998	0.965881
redacted.ch/All That Remains - Overcome (2008) [FLAC]	02 - Two Weeks.flac	-9.830002	0.965881
redacted.ch/All That Remains - Overcome (2008) [FLAC]	03 - Undone.flac	-9.500000	0.965881
redacted.ch/All That Remains - Overcome (2008) [FLAC]	04 - Forever in Your Hands.flac	-9.750000	0.965881
redacted.ch/All That Remains - Overcome (2008) [FLAC]	05 - Chiron.flac	-9.010002	0.965881
redacted.ch/All That Remains - Overcome (2008) [FLAC]	06 - Days Without.flac	-9.010002	0.965881
redacted.ch/All That Remains - Overcome (2008) [FLAC]	07 - A Song for the Hopeless.flac	-9.660004	0.965881
redacted.ch/All That Remains - Overcome (2008) [FLAC]	08 - Do Not Obey.flac	-8.580002	0.999847
redacted.ch/All That Remains - Overcome (2008) [FLAC]	09 - Relinquish.flac	-9.449997	0.965881
redacted.ch/All That Remains - Overcome (2008) [FLAC]	10 - Overcome.flac	-9.099998	0.965881
redacted.ch/All That Remains - Overcome (2008) [FLAC]	11 - Believe in Nothing.flac	-9.230003	0.965881
redacted.ch/All That Remains - The Fall Of Ideals - FLAC	01 This Calling.flac	-10.800003	0.966614
redacted.ch/All That Remains - The Fall Of Ideals - FLAC	02 Not Alone.flac	-10.910004	0.966675
redacted.ch/All That Remains - The Fall Of Ideals - FLAC	03 It Dwells In Me.flac	-10.279999	0.966766
redacted.ch/All That Remains - The Fall Of Ideals - FLAC	04 We Stand.flac	-11.129997	0.966644
redacted.ch/All That Remains - The Fall Of Ideals - FLAC	05 Whispers (I Hear Your).flac	-10.730003	0.966614
redacted.ch/All That Remains - The Fall Of Ideals - FLAC	06 The Weak Willed.flac	-10.070000	0.966766
redacted.ch/All That Remains - The Fall Of Ideals - FLAC	07 Six.flac	-10.550003	0.966583
redacted.ch/All That Remains - The Fall Of Ideals - FLAC	08 Become The Catalyst.flac	-10.510002	0.966614
redacted.ch/All That Remains - The Fall Of Ideals - FLAC	09 The Air That I Breathe.flac	-10.110001	0.966583
redacted.ch/All That Remains - The Fall Of Ideals - FLAC	10 Empty Inside.flac	-10.830002	0.966675
redacted.ch/All That Remains - The Fall Of Ideals - FLAC	11 Indictment.flac	-9.739998	0.966644
redacted.ch/Animals As Leaders - Animals As Ledars [2009] [FLAC]	01 - Tempting Time.flac	-8.690002	1.000000
redacted.ch/Animals As Leaders - Animals As Ledars [2009] [FLAC]	02 - Soraya.flac	-7.480003	1.000000
redacted.ch/Animals As Leaders - Animals As Ledars [2009] [FLAC]	03 - Thoroughly at Home.flac	-7.830002	1.000000
redacted.ch/Animals As Leaders - Animals As Ledars [2009] [FLAC]	04 - On Impulse.flac	-7.949997	1.000000
redacted.ch/Animals As Leaders - Animals As Ledars [2009] [FLAC]	05 - Tessitura.flac	-6.989998	1.000000
redacted.ch/Animals As Leaders - Animals As Ledars [2009] [FLAC]	06 - Behaving Badly.flac	-9.129997	1.000000
redacted.ch/Animals As Leaders - Animals As Ledars [2009] [FLAC]	07 - The Price of Everything and the Value of Nothing.flac	-8.010002	1.000000
redacted.ch/Animals As Leaders - Animals As Ledars [2009] [FLAC]	08 - CAFO.flac	-6.320000	1.000000
redacted.ch/Animals As Leaders - Animals As Ledars [2009] [FLAC]	09 - Inamorata.flac	-7.440002	1.000000
redacted.ch/Animals As Leaders - Animals As Ledars [2009] [FLAC]	10 - Point to Point.flac	-6.769997	1.000000
redacted.ch/Animals As Leaders - Animals As Ledars [2009] [FLAC]	11 - Modern Meat.flac	-3.970001	1.000000
redacted.ch/Animals As Leaders - Animals As Ledars [2009] [FLAC]	12 - Song of Solomon.flac	-8.739998	1.000000
redacted.ch/ANTI-FLAG - FOR BLOOD AND EMPIRE [2006][FLAC]	01. ANTI-FLAG - I'D TELL YOU BUT....flac	-10.209999	0.997711
redacted.ch/ANTI-FLAG - FOR BLOOD AND EMPIRE [2006][FLAC]	02. ANTI-FLAG - THEPRESS CORPSE.flac	-10.300003	0.998596
redacted.ch/ANTI-FLAG - FOR BLOOD AND EMPIRE [2006][FLAC]	03. ANTI-FLAG - EMIGRE.flac	-10.120003	0.998657
redacted.ch/ANTI-FLAG - FOR BLOOD AND EMPIRE [2006][FLAC]	04. ANTI-FLAG - THE PROJECT FOR A NEW AMERICAN CENTURY.flac	-9.750000	0.998657
redacted.ch/ANTI-FLAG - FOR BLOOD AND EMPIRE [2006][FLAC]	05. ANTI-FLAG - HYMN FOR THE DEAD.flac	-9.550003	0.998230
redacted.ch/ANTI-FLAG - FOR BLOOD AND EMPIRE [2006][FLAC]	06. ANTI-FLAG - THIS IS THE END (FOR YOU MY FRIEND).flac	-10.660004	0.997711
redacted.ch/ANTI-FLAG - FOR BLOOD AND EMPIRE [2006][FLAC]	07. ANTI-FLAG - 1 TRILLION DOLLAR$.flac	-10.199997	0.997711
redacted.ch/ANTI-FLAG - FOR BLOOD AND EMPIRE [2006][FLAC]	08. ANTI-FLAG - STATE FUNERAL.flac	-9.529999	0.997711
redacted.ch/ANTI-FLAG - FOR BLOOD AND EMPIRE [2006][FLAC]	09. ANTI-FLAG - CONFESSIONS OF AN ECONOMIC HIT MAN.flac	-10.449997	0.998138
redacted.ch/ANTI-FLAG - FOR BLOOD AND EMPIRE [2006][FLAC]	10. ANTI-FLAG - WAR SUCKS, LET'S PARTY !.flac	-10.080002	0.997711
redacted.ch/ANTI-FLAG - FOR BLOOD AND EMPIRE [2006][FLAC]	11. ANTI-FLAG - THE W.T.O. KILLS FARMERS.flac	-11.040001	0.997711
redacted.ch/ANTI-FLAG - FOR BLOOD AND EMPIRE [2006][FLAC]	12. ANTI-FLAG - CITIES BURN.flac	-10.199997	0.997833
redacted.ch/ANTI-FLAG - FOR BLOOD AND EMPIRE [2006][FLAC]	13. ANTI-FLAG - DEPLETED URANIUM IS A WAR CRIME.flac	-11.610001	0.998718
redacted.ch/A Perfect Circle - eMOTIVe [2004] [FLAC]	01. Annihilation.flac	-2.599998	0.816589
redacted.ch/A Perfect Circle - eMOTIVe [2004] [FLAC]	02. Imagine.flac	-8.459999	0.988556
redacted.ch/A Perfect Circle - eMOTIVe [2004] [FLAC]	03. Peace, Love and Understanding.flac	-6.410004	0.988556
redacted.ch/A Perfect Circle - eMOTIVe [2004] [FLAC]	04. What's Going On.flac	-8.000000	0.988556
redacted.ch/A Perfect Circle - eMOTIVe [2004] [FLAC]	05. Passive.flac	-9.989998	0.988556
redacted.ch/A Perfect Circle - eMOTIVe [2004] [FLAC]	06. Gimmie Gimmie Gimmie.flac	-10.279999	0.988556
redacted.ch/A Perfect Circle - eMOTIVe [2004] [FLAC]	07. People Are People.flac	-8.120003	0.999969
redacted.ch/A Perfect Circle - eMOTIVe [2004] [FLAC]	08. Freedom of Choice.flac	-9.190002	0.988556
redacted.ch/A Perfect Circle - eMOTIVe [2004] [FLAC]	09. Let's Have a War.flac	-7.470001	0.988556
redacted.ch/A Perfect Circle - eMOTIVe [2004] [FLAC]	10. Counting Bodies Like Sheep to the Rhythm of the War Drums.flac	-8.889999	0.988556
redacted.ch/A Perfect Circle - eMOTIVe [2004] [FLAC]	11. When the Levee Breaks.flac	-5.669998	0.988556
redacted.ch/A Perfect Circle - eMOTIVe [2004] [FLAC]	12. Fiddle and the Drum.flac	-0.949997	0.643768
redacted.ch/A Perfect Circle - Thirteenth Step [2003] [FLAC]	01. The Package.flac	-5.500000	0.988678
redacted.ch/A Perfect Circle - Thirteenth Step [2003] [FLAC]	02. Weak And Powerless.flac	-7.389999	0.988678
redacted.ch/A Perfect Circle - Thirteenth Step [2003] [FLAC]	03. The Noose.flac	-7.739998	1.000000
redacted.ch/A Perfect Circle - Thirteenth Step [2003] [FLAC]	04. Blue.flac	-7.080002	0.988678
redacted.ch/A Perfect Circle - Thirteenth Step [2003] [FLAC]	05. Vanishing.flac	-5.019997	0.988647
redacted.ch/A Perfect Circle - Thirteenth Step [2003] [FLAC]	06. A Stranger.flac	-5.160004	0.699921
redacted.ch/A Perfect Circle - Thirteenth Step [2003] [FLAC]	07. The Outsider.flac	-7.949997	0.988647
redacted.ch/A Perfect Circle - Thirteenth Step [2003] [FLAC]	08. Crimes.flac	-1.430000	0.623779
redacted.ch/A Perfect Circle - Thirteenth Step [2003] [FLAC]	09. The Nurse Who Loved Me.flac	-3.559998	0.623779
redacted.ch/A Perfect Circle - Thirteenth Step [2003] [FLAC]	10. Pet.flac	-9.070000	0.988647
redacted.ch/A Perfect Circle - Thirteenth Step [2003] [FLAC]	11. Lullaby.flac	8.250000	0.547546
redacted.ch/A Perfect Circle - Thirteenth Step [2003] [FLAC]	12. Gravity.flac	-6.660004	0.988647
redacted.ch/A Poet's Life	01 - Wake Up.flac	-8.279999	0.998993
redacted.ch/A Poet's Life	02 - Hold On.flac	-9.790001	0.998993
redacted.ch/A Poet's Life	03 - Into Action.flac	-9.900002	0.998993
redacted.ch/A Poet's Life	04 - Translator.flac	-8.900002	0.998993
redacted.ch/A Poet's Life	05 - Take This City.flac	-8.340004	0.998993
redacted.ch/A Poet's Life	06 - Inner City Violence.flac	-8.860001	0.998993
redacted.ch/A Poet's Life	07 - Oh No.flac	-8.750000	0.998993
redacted.ch/A Poet's Life	08 - Lady Demeter.flac	-8.529999	0.998993
redacted.ch/A Poet's Life	09 - Among The Dead.flac	-9.230003	0.998993
redacted.ch/A Poet's Life	10 - Cold Blooded.flac	-8.669998	0.998993
redacted.ch/Arcane Roots - Blood & Chemistry (2013) [FLAC]	01 Energy Is Never Lost, Just Redirected.flac	-10.680000	0.999969
redacted.ch/Arcane Roots - Blood & Chemistry (2013) [FLAC]	02 Resolve.flac	-10.910004	0.999969
redacted.ch/Arcane Roots - Blood & Chemistry (2013) [FLAC]	03 Belief.flac	-11.800003	0.999969
redacted.ch/Arcane Roots - Blood & Chemistry (2013) [FLAC]	04 Sacred Shapes.flac	-10.400002	0.999969
redacted.ch/Arcane Roots - Blood & Chemistry (2013) [FLAC]	05 Hell & High Water.flac	-10.389999	0.999969
redacted.ch/Arcane Roots - Blood & Chemistry (2013) [FLAC]	06 Triptych.flac	-11.629997	0.999969
redacted.ch/Arcane Roots - Blood & Chemistry (2013) [FLAC]	07 Slow.flac	-10.610001	1.000000
redacted.ch/Arcane Roots - Blood & Chemistry (2013) [FLAC]	08 Second Breath.flac	-11.099998	0.999969
redacted.ch/Arcane Roots - Blood & Chemistry (2013) [FLAC]	09 Held Like Kites.flac	-6.889999	0.999939
redacted.ch/Arcane Roots - Blood & Chemistry (2013) [FLAC]	10 You Keep Me Here.flac	-10.940002	0.999969
redacted.ch/Asian Dub Foundation - 2005 - Tank (FLAC)	01 - Flyover.flac	-8.220001	0.980682
redacted.ch/Asian Dub Foundation - 2005 - Tank (FLAC)	02 - Tank.flac	-6.110001	0.980164
redacted.ch/Asian Dub Foundation - 2005 - Tank (FLAC)	03 - Hope.flac	-7.050003	0.980133
redacted.ch/Asian Dub Foundation - 2005 - Tank (FLAC)	04 - Round Up.flac	-7.540001	0.980164
redacted.ch/Asian Dub Foundation - 2005 - Tank (FLAC)	05 - Oil.flac	-6.669998	0.980133
redacted.ch/Asian Dub Foundation - 2005 - Tank (FLAC)	06 - Powerlines.flac	-6.510002	0.980072
redacted.ch/Asian Dub Foundation - 2005 - Tank (FLAC)	07 - Who Runs The Place.flac	-7.680000	0.928223
redacted.ch/Asian Dub Foundation - 2005 - Tank (FLAC)	08 - Take Back The Power.flac	-7.190002	0.980133
redacted.ch/Asian Dub Foundation - 2005 - Tank (FLAC)	09 - Warring Dhol.flac	-6.320000	0.980072
redacted.ch/Asian Dub Foundation - 2005 - Tank (FLAC)	10 - Tomorrow Begins Today.flac	-3.760002	0.875061
redacted.ch/Asian Dub Foundation - 2005 - Tank (FLAC)	11 - Melody 7.flac	-2.209999	0.979736
redacted.ch/Atari Teenage Riot - Delete Yourself!	01 - Start The Riot!.flac	-7.550003	0.982880
redacted.ch/Atari Teenage Riot - Delete Yourself!	02 - Into The Death.flac	-7.680000	0.980560
redacted.ch/Atari Teenage Riot - Delete Yourself!	03 - Raverbashing.flac	-6.510002	0.982758
redacted.ch/Atari Teenage Riot - Delete Yourself!	04 - Speed.flac	-7.480003	0.984497
redacted.ch/Atari Teenage Riot - Delete Yourself!	05 - Sex.flac	-6.220001	0.983673
redacted.ch/Atari Teenage Riot - Delete Yourself!	06 - Midijunkies.flac	-8.419998	0.985016
redacted.ch/Atari Teenage Riot - Delete Yourself!	07 - Delete Yourself! You Got No Chance To Win! (Live In Glasgow 17.10.1993).flac	-7.769997	0.984619
redacted.ch/Atari Teenage Riot - Delete Yourself!	08 - Hetzjagd Auf Nazis! (Live In Berlin 25.2.1994).flac	-5.489998	0.980652
redacted.ch/Atari Teenage Riot - Delete Yourself!	09 - Cyberpunks Are Dead!.flac	-6.110001	0.986633
redacted.ch/Atari Teenage Riot - Delete Yourself!	10 - Kids Are United!.flac	-8.949997	0.983948
redacted.ch/Atari Teenage Riot - Delete Yourself!	11 - Atari Teenage Riot.flac	-6.870003	0.987579
redacted.ch/Atari Teenage Riot - Delete Yourself!	12 - Riot 1995.flac	-9.440002	0.985596
redacted.ch/Authority Zero - A Passage In Time	A Passage In Time.flac	-10.220001	0.999969
redacted.ch/Authority Zero - A Passage In Time	Everyday.flac	-11.099998	0.988770
redacted.ch/Authority Zero - A Passage In Time	Good Ol' Days.flac	-10.680000	0.988708
redacted.ch/Authority Zero - A Passage In Time	Intro- 'Papa'.flac	-4.760002	0.999969
redacted.ch/Authority Zero - A Passage In Time	La Surf.flac	-10.739998	0.988708
redacted.ch/Authority Zero - A Passage In Time	Lying Awake.flac	-11.209999	0.999969
redacted.ch/Authority Zero - A Passage In Time	Mesa Town.flac	-10.870003	0.988708
redacted.ch/Authority Zero - A Passage In Time	Not You.flac	-9.949997	0.988708
redacted.ch/Authority Zero - A Passage In Time	One More Minute.flac	-10.489998	0.988708
redacted.ch/Authority Zero - A Passage In Time	Over Seasons.flac	-11.029999	0.988708
redacted.ch/Authority Zero - A Passage In Time	Sky's The Limit.flac	-10.150002	0.988708
redacted.ch/Authority Zero - A Passage In Time	Some People.flac	-10.529999	0.988708
redacted.ch/Authority Zero - A Passage In Time	Superbxtch.flac	-11.110001	0.988708
redacted.ch/Autonomads - 2013 - No Mans Lands	01 - Great Benefit Cheat.flac	-6.510002	0.986237
redacted.ch/Autonomads - 2013 - No Mans Lands	02 - The Struggle Continues.flac	-5.510002	1.000000
redacted.ch/Autonomads - 2013 - No Mans Lands	03 - G.M.P..flac	-6.639999	1.000000
redacted.ch/Autonomads - 2013 - No Mans Lands	04 - Foot In Mouth.flac	-4.940002	1.000000
redacted.ch/Autonomads - 2013 - No Mans Lands	05 - Super Market Sweep.flac	-5.500000	1.000000
redacted.ch/Autonomads - 2013 - No Mans Lands	06 - Foundations.flac	-4.599998	1.000000
redacted.ch/Autonomads - 2013 - No Mans Lands	07 - Dubbin' Up The Downfall.flac	-4.980003	1.000000
redacted.ch/Autonomads - 2013 - No Mans Lands	08 - Back To The Bark.flac	-5.889999	1.000000
redacted.ch/Autonomads - 2013 - No Mans Lands	09 - Motor Dread.flac	-6.220001	1.000000
redacted.ch/Babyboom - 2007 - Babyboom [FLAC]	01 - Passing Through.flac	-8.150002	0.988525
redacted.ch/Babyboom - 2007 - Babyboom [FLAC]	02 - Sister.flac	-8.230003	0.988525
redacted.ch/Babyboom - 2007 - Babyboom [FLAC]	03 - Scatterbrain.flac	-8.610001	0.988525
redacted.ch/Babyboom - 2007 - Babyboom [FLAC]	04 - Not Yet.flac	-8.349998	0.988525
redacted.ch/Bad Brains	01 - Bad Brains - Sailin' On.flac	-5.489998	0.837433
redacted.ch/Bad Brains	02 - Bad Brains - Don't Need It.flac	-6.510002	0.962372
redacted.ch/Bad Brains	03 - Bad Brains - Attitude.flac	-6.389999	0.880310
redacted.ch/Bad Brains	04 - Bad Brains - The Regulator.flac	-3.639999	0.775238
redacted.ch/Bad Brains	05 - Bad Brains - Banned in D.C..flac	-5.269997	0.867004
redacted.ch/Bad Brains	06 - Bad Brains - Jah Calling.flac	0.449997	0.899231
redacted.ch/Bad Brains	07 - Bad Brains - Supertouch & Shitfit.flac	-4.769997	0.826935
redacted.ch/Bad Brains	08 - Bad Brains - Leaving Babylon.flac	1.000000	0.626221
redacted.ch/Bad Brains	09 - Bad Brains - Fearless Vampire Killers.flac	-4.750000	0.883270
redacted.ch/Bad Brains	10 - Bad Brains - I.flac	-6.300003	0.976685
redacted.ch/Bad Brains	11 - Bad Brains - Big Take Over.flac	-7.080002	1.000000
redacted.ch/Bad Brains	12 - Bad Brains - Pay to Cum.flac	-4.209999	0.885742
redacted.ch/Bad Brains	13 - Bad Brains - Right Brigade.flac	-6.059998	1.000000
redacted.ch/Bad Brains	14 - Bad Brains - I Luv I Jah.flac	1.489998	0.770325
redacted.ch/Bad Brains	15 - Bad Brains - Intro.flac	-2.510002	0.682861
redacted.ch/Bad Brains	16 - Bad Brains - Extro.flac	-1.730003	1.000000
redacted.ch/Bad Religion - 2004 - Los Angeles Is Burning [FLAC]	01 - Los Angeles Is Burning.flac	-10.139999	0.999969
redacted.ch/Bad Religion - 2004 - Los Angeles Is Burning [FLAC]	02 - The Surface Of Me.flac	-11.510002	1.000000
redacted.ch/Bad Religion - 2004 - Los Angeles Is Burning [FLAC]	03 - Let Them Eat War.flac	-10.220001	0.999969
redacted.ch/Bad Religion - Stranger Than Fiction (European Release)	01 - Incomplete.flac	-7.320000	0.977234
redacted.ch/Bad Religion - Stranger Than Fiction (European Release)	02 - Leave Mine To Me.flac	-5.330002	0.977234
redacted.ch/Bad Religion - Stranger Than Fiction (European Release)	03 - Stranger Than Fiction.flac	-6.660004	0.977234
redacted.ch/Bad Religion - Stranger Than Fiction (European Release)	04 - Tiny Voices.flac	-5.889999	0.977234
redacted.ch/Bad Religion - Stranger Than Fiction (European Release)	05 - The Handshake.flac	-5.730003	0.977234
redacted.ch/Bad Religion - Stranger Than Fiction (European Release)	06 - Better Off Dead.flac	-5.940002	0.977234
redacted.ch/Bad Religion - Stranger Than Fiction (European Release)	07 - Infected.flac	-5.940002	0.977234
redacted.ch/Bad Religion - Stranger Than Fiction (European Release)	08 - Television.flac	-5.680000	0.977234
redacted.ch/Bad Religion - Stranger Than Fiction (European Release)	09 - Individual.flac	-5.040001	0.977234
redacted.ch/Bad Religion - Stranger Than Fiction (European Release)	10 - Hooray For Me....flac	-6.169998	0.977234
redacted.ch/Bad Religion - Stranger Than Fiction (European Release)	11 - Slumber.flac	-4.680000	0.977234
redacted.ch/Bad Religion - Stranger Than Fiction (European Release)	12 - Marked.flac	-7.410004	0.977234
redacted.ch/Bad Religion - Stranger Than Fiction (European Release)	13 - Inner Logic.flac	-5.290001	0.977234
redacted.ch/Bad Religion - Stranger Than Fiction (European Release)	14 - What It Is.flac	-3.830002	0.977234
redacted.ch/Bad Religion - Stranger Than Fiction (European Release)	15 - 21st Century (Digital Boy).flac	-4.610001	0.977234
redacted.ch/Bad Religion - Stranger Than Fiction (European Release)	16 - News From The Front.flac	-7.090004	0.977234
redacted.ch/Bad Religion - Stranger Than Fiction (European Release)	17 - Markovian Process.flac	-4.830002	0.977234
redacted.ch/Bandits of the Acoustic Revolution - A Call To Arms	01 - This Is A Call To Arms.flac	-4.309998	0.977264
redacted.ch/Bandits of the Acoustic Revolution - A Call To Arms	02 - Heres To Life.flac	-5.519997	0.977264
redacted.ch/Bandits of the Acoustic Revolution - A Call To Arms	03 - Dear Sergio.flac	-5.699997	0.977264
redacted.ch/Bandits of the Acoustic Revolution - A Call To Arms	04 - Its A Wonderful Life.flac	-6.379997	0.977264
redacted.ch/Bandits of the Acoustic Revolution - A Call To Arms	05 - They Provide The Paint For The Picture Perfect Masterpiece That You Will Paint On The Inside Of Your Eyelids.flac	-5.220001	0.977264
redacted.ch/Beastie Boys - The In Sound From Way Out! (FLAC)	01 - Groove Holmes.flac	-5.389999	0.977325
redacted.ch/Beastie Boys - The In Sound From Way Out! (FLAC)	02 - Sabrosa.flac	-5.449997	0.977325
redacted.ch/Beastie Boys - The In Sound From Way Out! (FLAC)	03 - Namaste.flac	-4.750000	0.977325
redacted.ch/Beastie Boys - The In Sound From Way Out! (FLAC)	04 - Pow.flac	-6.099998	0.977325
redacted.ch/Beastie Boys - The In Sound From Way Out! (FLAC)	05 - Son Of Neckbone.flac	-6.340004	0.977325
redacted.ch/Beastie Boys - The In Sound From Way Out! (FLAC)	06 - In 3's.flac	-8.309998	0.977325
redacted.ch/Beastie Boys - The In Sound From Way Out! (FLAC)	07 - Eugene's Lament.flac	-2.849998	0.977325
redacted.ch/Beastie Boys - The In Sound From Way Out! (FLAC)	08 - Bobo On The Corner.flac	-5.590004	0.977325
redacted.ch/Beastie Boys - The In Sound From Way Out! (FLAC)	09 - Shambala.flac	-3.970001	0.977325
redacted.ch/Beastie Boys - The In Sound From Way Out! (FLAC)	10 - Lighten Up.flac	-4.800003	0.977325
redacted.ch/Beastie Boys - The In Sound From Way Out! (FLAC)	11 - Ricky's Theme.flac	-6.070000	0.977325
redacted.ch/Beastie Boys - The In Sound From Way Out! (FLAC)	12 - Transitions.flac	-1.849998	0.977325
redacted.ch/Beastie Boys - The In Sound From Way Out! (FLAC)	13 - Drinkin'  Wine.flac	-1.900002	0.977325
redacted.ch/Beatsteaks - 2002 - Living Targets (FLAC)	01. Beatsteaks - Not Ready to Rock.flac	-9.169998	0.988617
redacted.ch/Beatsteaks - 2002 - Living Targets (FLAC)	02. Beatsteaks - God Knows.flac	-10.379997	0.988647
redacted.ch/Beatsteaks - 2002 - Living Targets (FLAC)	03. Beatsteaks - Let Me In.flac	-9.050003	0.992889
redacted.ch/Beatsteaks - 2002 - Living Targets (FLAC)	04. Beatsteaks - Soothe Me.flac	-8.730003	0.988617
redacted.ch/Beatsteaks - 2002 - Living Targets (FLAC)	05. Beatsteaks - Above Us.flac	-9.510002	0.999969
redacted.ch/Beatsteaks - 2002 - Living Targets (FLAC)	06. Beatsteaks - This One.flac	-8.489998	0.992889
redacted.ch/Beatsteaks - 2002 - Living Targets (FLAC)	07. Beatsteaks - Disconnected.flac	-7.940002	0.988617
redacted.ch/Beatsteaks - 2002 - Living Targets (FLAC)	08. Beatsteaks - A-Way.flac	-8.889999	0.988617
redacted.ch/Beatsteaks - 2002 - Living Targets (FLAC)	09. Beatsteaks - Mirrored.flac	-8.870003	0.988617
redacted.ch/Beatsteaks - 2002 - Living Targets (FLAC)	10. Beatsteaks - Run Run.flac	-10.330002	0.933319
redacted.ch/Beatsteaks - 2002 - Living Targets (FLAC)	11. Beatsteaks - To Be Strong.flac	-10.010002	1.000000
redacted.ch/Beatsteaks - 2002 - Living Targets (FLAC)	12. Beatsteaks - Summer.flac	-8.330002	0.992889
redacted.ch/Beatsteaks - 2011 - Boombox	01 - Fix It.flac	-10.529999	0.988708
redacted.ch/Beatsteaks - 2011 - Boombox	02 - Milk & Honey.flac	-10.169998	0.988708
redacted.ch/Beatsteaks - 2011 - Boombox	03 - Cheap Comments.flac	-10.989998	0.988739
redacted.ch/Beatsteaks - 2011 - Boombox	04 - Let's See.flac	-8.209999	0.988739
redacted.ch/Beatsteaks - 2011 - Boombox	05 - Bullets From Another Dimension.flac	-9.830002	0.988708
redacted.ch/Beatsteaks - 2011 - Boombox	06 - Under A Clear Blue Sky.flac	-10.370003	0.988739
redacted.ch/Beatsteaks - 2011 - Boombox	07 - Access Adrenalin.flac	-9.980003	0.988739
redacted.ch/Beatsteaks - 2011 - Boombox	08 - Behaviour.flac	-10.510002	0.988708
redacted.ch/Beatsteaks - 2011 - Boombox	09 - Automatic.flac	-7.970001	0.988739
redacted.ch/Beatsteaks - 2011 - Boombox	10 - Alright.flac	-10.010002	0.988739
redacted.ch/Beatsteaks - 2011 - Boombox	11 - Houses On Fire.flac	-10.099998	0.988708
redacted.ch/Beatsteaks - {2014} Beatsteaks [FLAC]	01 - A Real Paradise.flac	-10.370003	0.999054
redacted.ch/Beatsteaks - {2014} Beatsteaks [FLAC]	02 - DNA.flac	-9.879997	0.999084
redacted.ch/Beatsteaks - {2014} Beatsteaks [FLAC]	03 - Be Smart and Breathe.flac	-9.849998	0.999054
redacted.ch/Beatsteaks - {2014} Beatsteaks [FLAC]	04 - Make a Wish.flac	-9.879997	0.943787
redacted.ch/Beatsteaks - {2014} Beatsteaks [FLAC]	05 - Everything Went Black.flac	-8.239998	0.999054
redacted.ch/Beatsteaks - {2014} Beatsteaks [FLAC]	06 - Up On the Roof.flac	-9.610001	0.999054
redacted.ch/Beatsteaks - {2014} Beatsteaks [FLAC]	07 - Pass the Message.flac	-9.970001	0.999146
redacted.ch/Beatsteaks - {2014} Beatsteaks [FLAC]	08 - Gentlemen of the Year.flac	-9.110001	0.999084
redacted.ch/Beatsteaks - {2014} Beatsteaks [FLAC]	09 - Wicked Witch.flac	-10.110001	0.999054
redacted.ch/Beatsteaks - {2014} Beatsteaks [FLAC]	10 - Creep Magnet.flac	-7.570000	0.999054
redacted.ch/Beatsteaks - {2014} Beatsteaks [FLAC]	11 - I Never Was.flac	-10.529999	0.999054
redacted.ch/Beatsteaks - 23 Singles (2015) - FLAC	01 - Summer.flac	-9.050003	0.999176
redacted.ch/Beatsteaks - 23 Singles (2015) - FLAC	02 - Let Me In.flac	-9.220001	0.999115
redacted.ch/Beatsteaks - 23 Singles (2015) - FLAC	03 - Hey Du.flac	-8.379997	0.998993
redacted.ch/Beatsteaks - 23 Singles (2015) - FLAC	04 - Hand In Hand.flac	-8.980003	0.999054
redacted.ch/Beatsteaks - 23 Singles (2015) - FLAC	05 - I Don´t Care As Long As You Sing.flac	-9.239998	0.980347
redacted.ch/Beatsteaks - 23 Singles (2015) - FLAC	06 - Hello Joe.flac	-8.360001	0.999023
redacted.ch/Beatsteaks - 23 Singles (2015) - FLAC	07 - Frieda und die Bomben.flac	-9.610001	0.999084
redacted.ch/Beatsteaks - 23 Singles (2015) - FLAC	08 - Jane Became Insane.flac	-9.910004	0.999054
redacted.ch/Beatsteaks - 23 Singles (2015) - FLAC	09 - Cut Off The Top.flac	-9.269997	0.999084
redacted.ch/Beatsteaks - 23 Singles (2015) - FLAC	10 - Demons Galore.flac	-9.720001	0.999115
redacted.ch/Beatsteaks - 23 Singles (2015) - FLAC	11 - Meantime.flac	-9.830002	0.999054
redacted.ch/Beatsteaks - 23 Singles (2015) - FLAC	12 - Hail To The Freaks.flac	-9.500000	1.000000
redacted.ch/Beatsteaks - 23 Singles (2015) - FLAC	13 - Milk & Honey.flac	-9.480003	0.916168
redacted.ch/Beatsteaks - 23 Singles (2015) - FLAC	14 - Cheap Comments.flac	-9.059998	0.999084
redacted.ch/Beatsteaks - 23 Singles (2015) - FLAC	15 - Automatic.flac	-8.459999	0.879425
redacted.ch/Beatsteaks - 23 Singles (2015) - FLAC	16 - House On Fire.flac	-10.050003	0.999084
redacted.ch/Beatsteaks - 23 Singles (2015) - FLAC	17 - Saysaysay.flac	-8.730003	0.994385
redacted.ch/Beatsteaks - 23 Singles (2015) - FLAC	18 - DNA.flac	-9.830002	0.993042
redacted.ch/Beatsteaks - 23 Singles (2015) - FLAC	19 - Gentleman Of The Year.flac	-9.190002	0.999054
redacted.ch/Beatsteaks - 23 Singles (2015) - FLAC	20 - Make A Wish.flac	-9.900002	0.942688
redacted.ch/Beatsteaks - 23 Singles (2015) - FLAC	21 - Everything Went Black.flac	-8.510002	0.988647
redacted.ch/Beatsteaks - 23 Singles (2015) - FLAC	22 - Ticket.flac	-9.029999	0.988251
redacted.ch/Beatsteaks - 23 Singles (2015) - FLAC	23 - Mad River.flac	-10.400002	0.988586
redacted.ch/Beatsteaks - Smack Smash	01 - Beatsteaks - Big Attack.flac	-8.900002	0.975464
redacted.ch/Beatsteaks - Smack Smash	02 - Beatsteaks - Vision.flac	-8.470001	0.981567
redacted.ch/Beatsteaks - Smack Smash	03 - Beatsteaks - Ain't Complaining.flac	-9.370003	0.981567
redacted.ch/Beatsteaks - Smack Smash	04 - Beatsteaks - Hello Joe.flac	-8.919998	0.981567
redacted.ch/Beatsteaks - Smack Smash	05 - Beatsteaks - Hand In Hand.flac	-8.470001	0.981567
redacted.ch/Beatsteaks - Smack Smash	06 - Beatsteaks - Monster.flac	-8.489998	0.981567
redacted.ch/Beatsteaks - Smack Smash	07 - Beatsteaks - Everything.flac	-8.090004	0.981140
redacted.ch/Beatsteaks - Smack Smash	08 - Beatsteaks - I Don't Care As Long As You Sing.flac	-7.750000	0.981567
redacted.ch/Beatsteaks - Smack Smash	09 - Beatsteaks - Atomic Love.flac	-8.840004	0.977173
redacted.ch/Beatsteaks - Smack Smash	10 - Beatsteaks - Loyal To None.flac	-9.120003	0.970184
redacted.ch/Beatsteaks - Smack Smash	11 - Beatsteaks - What's Coming Over You.flac	-8.040001	0.981567
redacted.ch/Beatsteaks - Smack Smash	12 - Beatsteaks - My Revelation.flac	-8.959999	0.981567
redacted.ch/Billy Talent - Billy Talent II - [2006-FLAC-Lossless]	01 - Billy Talent - Devil In A Midnight Mass.flac	-9.970001	0.988556
redacted.ch/Billy Talent - Billy Talent II - [2006-FLAC-Lossless]	02 - Billy Talent - Red Flag.flac	-10.330002	0.988556
redacted.ch/Billy Talent - Billy Talent II - [2006-FLAC-Lossless]	03 - Billy Talent - This Suffering.flac	-10.610001	0.988556
redacted.ch/Billy Talent - Billy Talent II - [2006-FLAC-Lossless]	04 - Billy Talent - Worker Bess.flac	-10.720001	0.988556
redacted.ch/Billy Talent - Billy Talent II - [2006-FLAC-Lossless]	05 - Billy Talent - Pins And Needles.flac	-10.349998	0.988556
redacted.ch/Billy Talent - Billy Talent II - [2006-FLAC-Lossless]	06 - Billy Talent - Fallen Leaves.flac	-10.180000	0.988556
redacted.ch/Billy Talent - Billy Talent II - [2006-FLAC-Lossless]	07 - Billy Talent - Where Is The Line .flac	-10.669998	0.988556
redacted.ch/Billy Talent - Billy Talent II - [2006-FLAC-Lossless]	08 - Billy Talent - Covered In Cowardice.flac	-9.930000	0.988556
redacted.ch/Billy Talent - Billy Talent II - [2006-FLAC-Lossless]	09 - Billy Talent - Surrender.flac	-10.519997	0.988556
redacted.ch/Billy Talent - Billy Talent II - [2006-FLAC-Lossless]	10 - Billy Talent - The Navy Song.flac	-9.949997	0.988556
redacted.ch/Billy Talent - Billy Talent II - [2006-FLAC-Lossless]	11 - Billy Talent - Perfect World.flac	-10.190002	0.988556
redacted.ch/Billy Talent - Billy Talent II - [2006-FLAC-Lossless]	12 - Billy Talent - Sympathy.flac	-10.790001	0.988556
redacted.ch/Billy Talent - Billy Talent II - [2006-FLAC-Lossless]	13 - Billy Talent - Burn The Evidence.flac	-10.080002	0.988556
redacted.ch/Black Flag - 1981 - Damaged	01 - Rise Above.flac	-1.040001	0.639587
redacted.ch/Black Flag - 1981 - Damaged	02 - Spray Paint.flac	-1.940002	0.672546
redacted.ch/Black Flag - 1981 - Damaged	03 - Six Pack.flac	-0.940002	0.642548
redacted.ch/Black Flag - 1981 - Damaged	04 - What I See.flac	-1.550003	0.781616
redacted.ch/Black Flag - 1981 - Damaged	05 - TV Party.flac	-1.739998	0.696289
redacted.ch/Black Flag - 1981 - Damaged	06 - Thirsty and Miserable.flac	-1.470001	0.633789
redacted.ch/Black Flag - 1981 - Damaged	07 - Police Story.flac	-0.440002	0.616852
redacted.ch/Black Flag - 1981 - Damaged	08 - Gimmie Gimmie Gimmie.flac	-1.879997	0.767975
redacted.ch/Black Flag - 1981 - Damaged	09 - Depression.flac	-0.610001	0.598114
redacted.ch/Black Flag - 1981 - Damaged	10 - Room 13.flac	-0.809998	0.517212
redacted.ch/Black Flag - 1981 - Damaged	11 - Damaged II.flac	-0.480003	0.676544
redacted.ch/Black Flag - 1981 - Damaged	12 - No More.flac	-1.169998	0.669556
redacted.ch/Black Flag - 1981 - Damaged	13 - Padded Cell.flac	-1.510002	0.603333
redacted.ch/Black Flag - 1981 - Damaged	14 - Life of Pain.flac	-0.220001	0.636475
redacted.ch/Black Flag - 1981 - Damaged	15 - Damaged I.flac	0.040001	0.581818
redacted.ch/Black Sabbath - 1970 - Paranoid  [FLAC]	01.War Pigs-Luke's Wall.flac	-1.769997	1.000000
redacted.ch/Black Sabbath - 1970 - Paranoid  [FLAC]	02.Paranoid.flac	-0.019997	0.840912
redacted.ch/Black Sabbath - 1970 - Paranoid  [FLAC]	03.Planet Caravan.flac	6.439999	0.603058
redacted.ch/Black Sabbath - 1970 - Paranoid  [FLAC]	04.Iron Man.flac	-3.910004	1.000000
redacted.ch/Black Sabbath - 1970 - Paranoid  [FLAC]	05.Electric Funeral.flac	-1.320000	0.770447
redacted.ch/Black Sabbath - 1970 - Paranoid  [FLAC]	06.Hand Of Doom.flac	-2.660004	0.906189
redacted.ch/Black Sabbath - 1970 - Paranoid  [FLAC]	07.Rat Salad.flac	1.139999	0.595093
redacted.ch/Black Sabbath - 1970 - Paranoid  [FLAC]	08.Jack The Stripper-Fairies Wear Boots.flac	-2.750000	0.999969
redacted.ch/Bob Marley & The Wailers - Exodus (MFSL Remaster) - FLAC	01 - Natural Mystic.flac	0.099998	0.951263
redacted.ch/Bob Marley & The Wailers - Exodus (MFSL Remaster) - FLAC	02 - So Much Things to Say.flac	-2.090004	0.999969
redacted.ch/Bob Marley & The Wailers - Exodus (MFSL Remaster) - FLAC	03 - Guiltiness.flac	-0.190002	0.942535
redacted.ch/Bob Marley & The Wailers - Exodus (MFSL Remaster) - FLAC	04 - The Heathen.flac	-2.110001	0.846832
redacted.ch/Bob Marley & The Wailers - Exodus (MFSL Remaster) - FLAC	05 - Exodus.flac	-1.559998	0.967255
redacted.ch/Bob Marley & The Wailers - Exodus (MFSL Remaster) - FLAC	06 - Jammin'.flac	-1.790001	0.999969
redacted.ch/Bob Marley & The Wailers - Exodus (MFSL Remaster) - FLAC	07 - Waiting in Vain.flac	-0.550003	0.865265
redacted.ch/Bob Marley & The Wailers - Exodus (MFSL Remaster) - FLAC	08 - Turn Your Lights Down Low.flac	-1.629997	0.873566
redacted.ch/Bob Marley & The Wailers - Exodus (MFSL Remaster) - FLAC	09 - Three Little Birds.flac	-1.459999	0.968689
redacted.ch/Bob Marley & The Wailers - Exodus (MFSL Remaster) - FLAC	10 - One Love,People Get Ready.flac	-1.389999	1.000000
redacted.ch/Bomb The Music Industry Get Warmer FLAC Log	01 Jobs Schmobs.flac	-10.120003	0.988983
redacted.ch/Bomb The Music Industry Get Warmer FLAC Log	02 493 Ruth.flac	-9.629997	0.989014
redacted.ch/Bomb The Music Industry Get Warmer FLAC Log	03 Bike Test 123.flac	-10.139999	0.990570
redacted.ch/Bomb The Music Industry Get Warmer FLAC Log	04 Unlimited Breadsticks, Soup And Salad Days.flac	-10.050003	0.989014
redacted.ch/Bomb The Music Industry Get Warmer FLAC Log	05 No Rest For The Whiny.flac	-8.500000	0.988983
redacted.ch/Bomb The Music Industry Get Warmer FLAC Log	06 25 Hour Goddamn Telethon.flac	-9.250000	0.990295
redacted.ch/Bomb The Music Industry Get Warmer FLAC Log	07 Depression Is No Fun.flac	-9.849998	0.989044
redacted.ch/Bomb The Music Industry Get Warmer FLAC Log	08 I Don't Love You Anymore.flac	-10.510002	0.989075
redacted.ch/Bomb The Music Industry Get Warmer FLAC Log	09 Pizza Claus Is Comin' To Town.flac	-8.959999	0.989014
redacted.ch/Bomb The Music Industry Get Warmer FLAC Log	10 Never Trust A Man Without A Horribly Embarrassing Secret.flac	-10.080002	0.989014
redacted.ch/Bomb The Music Industry Get Warmer FLAC Log	11 Get Warmer.flac	-10.620003	0.989014
redacted.ch/Bomb The Music Industry Get Warmer FLAC Log	12 The Last Party (Foul).flac	-11.760002	0.990265
redacted.ch/Bomb The Music Industry!-Scrambles FLAC	01 - Cold Chillin' Cold Chillin'.flac	2.989998	0.725494
redacted.ch/Bomb The Music Industry!-Scrambles FLAC	02 - Stuff That I Like.flac	-11.400002	0.999969
redacted.ch/Bomb The Music Industry!-Scrambles FLAC	03 - It Shits!!!.flac	-11.449997	0.999969
redacted.ch/Bomb The Music Industry!-Scrambles FLAC	04 - Fresh Attitude, Young Body.flac	-10.590004	0.924683
redacted.ch/Bomb The Music Industry!-Scrambles FLAC	05 - Wednesday Night Drinkball.flac	-8.980003	0.999969
redacted.ch/Bomb The Music Industry!-Scrambles FLAC	06 - 25!!!.flac	-11.000000	0.999969
redacted.ch/Bomb The Music Industry!-Scrambles FLAC	07 - $2,400,000.flac	-11.610001	0.999969
redacted.ch/Bomb The Music Industry!-Scrambles FLAC	08 - Gang of Four Meets the Stooges (But Boring).flac	-10.370003	0.999969
redacted.ch/Bomb The Music Industry!-Scrambles FLAC	09 - 9,11 Fever!!!.flac	-10.709999	0.999969
redacted.ch/Bomb The Music Industry!-Scrambles FLAC	10 - (Shut) Up the Punx!!!.flac	-11.489998	0.999969
redacted.ch/Bomb The Music Industry!-Scrambles FLAC	11 - Can I Pay My Rent In Fun .flac	-10.029999	0.989777
redacted.ch/Bomb The Music Industry!-Scrambles FLAC	12 - Saddr Weirdr.flac	-10.860001	0.999969
redacted.ch/Bomb The Music Industry!-Scrambles FLAC	13 - Sort of Like Being Pumped.flac	-10.150002	0.999969
redacted.ch/Buckethead - Colma [1998.FLAC]	01 - Whitewash.flac	-5.910004	0.988617
redacted.ch/Buckethead - Colma [1998.FLAC]	02 - For Mom.flac	-5.199997	0.988556
redacted.ch/Buckethead - Colma [1998.FLAC]	03 - Ghost.flac	-7.449997	0.988556
redacted.ch/Buckethead - Colma [1998.FLAC]	04 - Hills of Eternity.flac	-6.809998	0.988586
redacted.ch/Buckethead - Colma [1998.FLAC]	05 - Big Sur Moon.flac	-3.860001	0.988342
redacted.ch/Buckethead - Colma [1998.FLAC]	06 - Machete.flac	-9.550003	0.988586
redacted.ch/Buckethead - Colma [1998.FLAC]	07 - Wishing Well.flac	-5.080002	0.988556
redacted.ch/Buckethead - Colma [1998.FLAC]	08 - Lone Sal Bug.flac	-3.239998	0.988464
redacted.ch/Buckethead - Colma [1998.FLAC]	09 - Sanctum.flac	-6.820000	0.988556
redacted.ch/Buckethead - Colma [1998.FLAC]	10 - Wondering.flac	-5.529999	0.988495
redacted.ch/Buckethead - Colma [1998.FLAC]	11 - Watching The Boats with My Dad.flac	-6.470001	0.988464
redacted.ch/Buckethead - Colma [1998.FLAC]	12 - Ghost,Part 2.flac	-5.940002	0.988373
redacted.ch/Buckethead - Colma [1998.FLAC]	13 - Colma.flac	-3.510002	0.988434
redacted.ch/Buck_O_Nine-Twenty-Eight_Teeth-1997-LOSSLESS-VLR	01-buck_o_nine-round_kid-vlr.flac	-10.419998	0.999023
redacted.ch/Buck_O_Nine-Twenty-Eight_Teeth-1997-LOSSLESS-VLR	02-buck_o_nine-nineteen-vlr.flac	-11.910004	0.999023
redacted.ch/Buck_O_Nine-Twenty-Eight_Teeth-1997-LOSSLESS-VLR	03-buck_o_nine-albequerque-vlr.flac	-10.250000	0.999023
redacted.ch/Buck_O_Nine-Twenty-Eight_Teeth-1997-LOSSLESS-VLR	04-buck_o_nine-tear_jerky-vlr.flac	-11.070000	0.999023
redacted.ch/Buck_O_Nine-Twenty-Eight_Teeth-1997-LOSSLESS-VLR	05-buck_o_nine-im_the_man-vlr.flac	-10.410004	0.999023
redacted.ch/Buck_O_Nine-Twenty-Eight_Teeth-1997-LOSSLESS-VLR	06-buck_o_nine-jennifers_cold-vlr.flac	-10.750000	0.999023
redacted.ch/Buck_O_Nine-Twenty-Eight_Teeth-1997-LOSSLESS-VLR	07-buck_o_nine-steve_was_dead-vlr.flac	-10.019997	0.999023
redacted.ch/Buck_O_Nine-Twenty-Eight_Teeth-1997-LOSSLESS-VLR	08-buck_o_nine-what_happened_to_my_radio_-vlr.flac	-9.550003	0.999023
redacted.ch/Buck_O_Nine-Twenty-Eight_Teeth-1997-LOSSLESS-VLR	09-buck_o_nine-twenty-eight_teeth-vlr.flac	-9.860001	0.999023
redacted.ch/Buck_O_Nine-Twenty-Eight_Teeth-1997-LOSSLESS-VLR	10-buck_o_nine-you_go_youre_gone-vlr.flac	-10.919998	0.999023
redacted.ch/Buck_O_Nine-Twenty-Eight_Teeth-1997-LOSSLESS-VLR	11-buck_o_nine-peach_fish-vlr.flac	-8.500000	0.999023
redacted.ch/Buck_O_Nine-Twenty-Eight_Teeth-1997-LOSSLESS-VLR	12-buck_o_nine-record_store-vlr.flac	-10.169998	0.999023
redacted.ch/Buck_O_Nine-Twenty-Eight_Teeth-1997-LOSSLESS-VLR	13-buck_o_nine-my_town-vlr.flac	-11.750000	0.999023
redacted.ch/Buck_O_Nine-Twenty-Eight_Teeth-1997-LOSSLESS-VLR	14-buck_o_nine-little_pain_inside-vlr.flac	-8.269997	0.999023
redacted.ch/Bullet For My Valentine - The Poison [FLAC]	01 - Bullet For My Valentine - Intro.flac	-6.470001	0.948303
redacted.ch/Bullet For My Valentine - The Poison [FLAC]	02 - Bullet For My Valentine - Her Voice Resides.flac	-10.849998	1.000000
redacted.ch/Bullet For My Valentine - The Poison [FLAC]	03 - Bullet For My Valentine - 4 Words (to choke upon).flac	-11.160004	1.000000
redacted.ch/Bullet For My Valentine - The Poison [FLAC]	04 - Bullet For My Valentine - Tears Don't Fall.flac	-11.040001	1.000000
redacted.ch/Bullet For My Valentine - The Poison [FLAC]	05 - Bullet For My Valentine - Suffocating Under Words Of Sorrow (What Can I Do).flac	-10.940002	1.000000
redacted.ch/Bullet For My Valentine - The Poison [FLAC]	06 - Bullet For My Valentine - Hit The Floor.flac	-10.610001	0.994598
redacted.ch/Bullet For My Valentine - The Poison [FLAC]	07 - Bullet For My Valentine - All These Things I Hate (Revolve Around Me).flac	-10.840004	1.000000
redacted.ch/Bullet For My Valentine - The Poison [FLAC]	08 - Bullet For My Valentine - Room 409.flac	-11.260002	1.000000
redacted.ch/Bullet For My Valentine - The Poison [FLAC]	09 - Bullet For My Valentine - The Poison.flac	-11.110001	1.000000
redacted.ch/Bullet For My Valentine - The Poison [FLAC]	10 - Bullet For My Valentine - 10 Years Today.flac	-10.860001	1.000000
redacted.ch/Bullet For My Valentine - The Poison [FLAC]	11 - Bullet For My Valentine - Cries In Vain.flac	-10.989998	0.994446
redacted.ch/Bullet For My Valentine - The Poison [FLAC]	12 - Bullet For My Valentine - Spit You Out.flac	-10.639999	1.000000
redacted.ch/Bullet For My Valentine - The Poison [FLAC]	13 - Bullet For My Valentine - The End.flac	-10.019997	1.000000
redacted.ch/Butthole Surfers - 1996 - Electriclarryland	01 - Birds.flac	-10.059998	0.999969
redacted.ch/Butthole Surfers - 1996 - Electriclarryland	02 - Cough Syrup.flac	-10.090004	0.999969
redacted.ch/Butthole Surfers - 1996 - Electriclarryland	03 - Pepper.flac	-9.590004	0.999969
redacted.ch/Butthole Surfers - 1996 - Electriclarryland	04 - Thermador.flac	-11.169998	0.999969
redacted.ch/Butthole Surfers - 1996 - Electriclarryland	05 - Ulcer Breakout.flac	-10.760002	0.999969
redacted.ch/Butthole Surfers - 1996 - Electriclarryland	06 - Jingle Of A Dog's Collar.flac	-8.559998	0.999969
redacted.ch/Butthole Surfers - 1996 - Electriclarryland	07 - TV Star.flac	-6.849998	0.999969
redacted.ch/Butthole Surfers - 1996 - Electriclarryland	08 - My Brother's Wife.flac	-8.529999	0.999969
redacted.ch/Butthole Surfers - 1996 - Electriclarryland	09 - Ah Ha.flac	-10.500000	0.999969
redacted.ch/Butthole Surfers - 1996 - Electriclarryland	10 - The Lord Is A Monkey.flac	-10.309998	0.999969
redacted.ch/Butthole Surfers - 1996 - Electriclarryland	11 - Lets Talk About Cars.flac	-3.190002	0.749878
redacted.ch/Butthole Surfers - 1996 - Electriclarryland	12 - L.A..flac	-10.900002	0.999969
redacted.ch/Butthole Surfers - 1996 - Electriclarryland	13 - Space.flac	-9.279999	0.999969
redacted.ch/Capdown - Civil Disobedients (FLAC)	01 - Unite To Progress.flac	-8.220001	0.999817
redacted.ch/Capdown - Civil Disobedients (FLAC)	02 - Kained But Able.flac	-7.930000	0.999817
redacted.ch/Capdown - Civil Disobedients (FLAC)	03 - Ska Wars.flac	-7.529999	0.999817
redacted.ch/Capdown - Civil Disobedients (FLAC)	04 - Jnr NBC.flac	-8.059998	0.999817
redacted.ch/Capdown - Civil Disobedients (FLAC)	05 - Dub No.1 (featuring the Dutch Masters).flac	-8.349998	0.999817
redacted.ch/Capdown - Civil Disobedients (FLAC)	06 - Positivity.flac	-8.470001	0.999817
redacted.ch/Capdown - Civil Disobedients (FLAC)	07 - Cousin Cleotis.flac	-7.849998	0.999817
redacted.ch/Capdown - Civil Disobedients (FLAC)	08 - The Neverlution.flac	-8.029999	0.999817
redacted.ch/Capdown - Civil Disobedients (FLAC)	09 - Civil Disobedients.flac	-7.459999	0.999817
redacted.ch/Capdown - Civil Disobedients (FLAC)	10 - Headstrong.flac	-7.320000	0.999817
redacted.ch/Capdown - Civil Disobedients (FLAC)	11 - Deal Real.flac	-7.959999	0.999817
redacted.ch/Capdown - Civil Disobedients (FLAC)	12 - Bitches And Nike Shoes.flac	-6.489998	0.999817
redacted.ch/Capdown - Time For Change (FLAC)	01 - Time For Change.flac	-7.169998	1.000000
redacted.ch/Capdown - Time For Change (FLAC)	02 - Stand My Ground.flac	-7.050003	1.000000
redacted.ch/Capdown - Time For Change (FLAC)	03 - Yourself, Your Whole Self & Nothing But Yourself.flac	-6.900002	1.000000
redacted.ch/Capdown - Time For Change (FLAC)	04 - If Money's Your Life.flac	-7.840004	1.000000
redacted.ch/Capdown - Time For Change (FLAC)	05 - If We Don't Last Very Long.flac	-6.199997	1.000000
redacted.ch/Catch 22 - 1998 - Keasbey Nights [FLAC]	01 - Dear Sergio.flac	-8.269997	0.966003
redacted.ch/Catch 22 - 1998 - Keasbey Nights [FLAC]	02 - Sick and Sad.flac	-7.199997	0.966064
redacted.ch/Catch 22 - 1998 - Keasbey Nights [FLAC]	03 - Keasbey Nights.flac	-8.430000	0.966034
redacted.ch/Catch 22 - 1998 - Keasbey Nights [FLAC]	04 - Day in Day Out.flac	-8.820000	0.966095
redacted.ch/Catch 22 - 1998 - Keasbey Nights [FLAC]	05 - Walking Away.flac	-6.879997	0.966095
redacted.ch/Catch 22 - 1998 - Keasbey Nights [FLAC]	06 - Giving Up Giving In.flac	-8.750000	0.966095
redacted.ch/Catch 22 - 1998 - Keasbey Nights [FLAC]	07 - On & On & On.flac	-7.099998	0.966003
redacted.ch/Catch 22 - 1998 - Keasbey Nights [FLAC]	08 - Riding the Fourth Wave.flac	-8.209999	0.966034
redacted.ch/Catch 22 - 1998 - Keasbey Nights [FLAC]	09 - This One Goes Out To....flac	-8.809998	0.966064
redacted.ch/Catch 22 - 1998 - Keasbey Nights [FLAC]	10 - Supernothing.flac	-8.340004	0.966034
redacted.ch/Catch 22 - 1998 - Keasbey Nights [FLAC]	11 - 9mm and a Three Piece Suit.flac	-8.410004	0.966095
redacted.ch/Catch 22 - 1998 - Keasbey Nights [FLAC]	12 - Kristina She Don't Know I Exist.flac	-7.550003	0.966034
redacted.ch/Catch 22 - 1998 - Keasbey Nights [FLAC]	13 - As the Footsteps Die Out Forever.flac	-7.300003	0.966003
redacted.ch/Catch 22 - 1998 - Keasbey Nights [FLAC]	14 - 12341234.flac	-7.739998	0.966034
redacted.ch/Cold - Year Of The Spider (Flac)	01 - Remedy.flac	-10.419998	0.999969
redacted.ch/Cold - Year Of The Spider (Flac)	02 - Suffocate.flac	-9.660004	0.999969
redacted.ch/Cold - Year Of The Spider (Flac)	03 - Cure My Tragedy (A Letter To God).flac	-10.150002	0.999969
redacted.ch/Cold - Year Of The Spider (Flac)	04 - Stupid Girl.flac	-10.190002	0.999969
redacted.ch/Cold - Year Of The Spider (Flac)	05 - Don't Belong.flac	-9.940002	0.999969
redacted.ch/Cold - Year Of The Spider (Flac)	06 - Wasted Years.flac	-8.559998	0.999969
redacted.ch/Cold - Year Of The Spider (Flac)	07 - Whatever You Became.flac	-9.320000	0.999969
redacted.ch/Cold - Year Of The Spider (Flac)	08 - Sad Happy.flac	-10.139999	0.999969
redacted.ch/Cold - Year Of The Spider (Flac)	09 - Rain Song.flac	-10.099998	0.999969
redacted.ch/Cold - Year Of The Spider (Flac)	10 - The Day Seattle Died.flac	-9.410004	0.999969
redacted.ch/Cold - Year Of The Spider (Flac)	11 - Change The World.flac	-9.480003	0.999969
redacted.ch/Cold - Year Of The Spider (Flac)	12 - Black Sunday.flac	-9.849998	0.999969
redacted.ch/Cold - Year Of The Spider (Flac)	13 - Kill The Music Industry.flac	-9.349998	0.999969
redacted.ch/Comeback Kid - Wake the Dead (2005) [FLAC]	01 False Idols Fall.flac	-9.190002	0.989014
redacted.ch/Comeback Kid - Wake the Dead (2005) [FLAC]	02 My Other Side.flac	-10.059998	0.989075
redacted.ch/Comeback Kid - Wake the Dead (2005) [FLAC]	03 Wake the Dead.flac	-10.279999	0.989044
redacted.ch/Comeback Kid - Wake the Dead (2005) [FLAC]	04 The Trouble I Love.flac	-9.980003	0.988953
redacted.ch/Comeback Kid - Wake the Dead (2005) [FLAC]	05 Talk Is Cheap.flac	-9.050003	0.989014
redacted.ch/Comeback Kid - Wake the Dead (2005) [FLAC]	06 Partners in Crime.flac	-9.900002	0.989044
redacted.ch/Comeback Kid - Wake the Dead (2005) [FLAC]	07 Our Distance.flac	-9.570000	0.989044
redacted.ch/Comeback Kid - Wake the Dead (2005) [FLAC]	08 Bright Lights Keep Shining.flac	-9.050003	0.988983
redacted.ch/Comeback Kid - Wake the Dead (2005) [FLAC]	09 Falling Apart.flac	-9.510002	0.989044
redacted.ch/Comeback Kid - Wake the Dead (2005) [FLAC]	10 Losing Patience.flac	-10.230003	0.989105
redacted.ch/Comeback Kid - Wake the Dead (2005) [FLAC]	11 Final Goodbye.flac	-9.959999	0.989044
redacted.ch/Crazy Arm - Born To Ruin (2009) - FLAC	01 - Asphalt.flac	-8.580002	0.988617
redacted.ch/Crazy Arm - Born To Ruin (2009) - FLAC	02 - Still To Keep.flac	-9.480003	0.988617
redacted.ch/Crazy Arm - Born To Ruin (2009) - FLAC	03 - Blind Summit.flac	-9.570000	0.988617
redacted.ch/Crazy Arm - Born To Ruin (2009) - FLAC	04 - Desire Lines.flac	-9.779999	0.988617
redacted.ch/Crazy Arm - Born To Ruin (2009) - FLAC	05 - Born To Ruin.flac	-10.050003	0.999969
redacted.ch/Crazy Arm - Born To Ruin (2009) - FLAC	06 - Broken By The Wheel.flac	-9.309998	0.988617
redacted.ch/Crazy Arm - Born To Ruin (2009) - FLAC	07 - International Front.flac	-9.250000	0.988617
redacted.ch/Crazy Arm - Born To Ruin (2009) - FLAC	08 - Henry Fabian Flynn.flac	-9.470001	0.988617
redacted.ch/Crazy Arm - Born To Ruin (2009) - FLAC	09 - Kith And Kingdom.flac	-10.430000	0.988617
redacted.ch/Crazy Arm - Born To Ruin (2009) - FLAC	10 - Reassure Me.flac	-9.860001	0.988617
redacted.ch/Crazy Arm - Born To Ruin (2009) - FLAC	11 - Christ In Concrete.flac	-10.010002	0.988617
redacted.ch/Crematory . 2008 . Pray	01. When Darkness Falls.flac	-9.849998	0.988770
redacted.ch/Crematory . 2008 . Pray	02. Left The Ground.flac	-10.080002	0.988739
redacted.ch/Crematory . 2008 . Pray	03. Alone.flac	-10.070000	0.988770
redacted.ch/Crematory . 2008 . Pray	04. Pray.flac	-10.430000	0.988800
redacted.ch/Crematory . 2008 . Pray	05. Sleeping Solution.flac	-9.790001	0.988739
redacted.ch/Crematory . 2008 . Pray	06. Just Words.flac	-6.750000	0.988739
redacted.ch/Crematory . 2008 . Pray	07. Burning Bridges.flac	-10.150002	0.989899
redacted.ch/Crematory . 2008 . Pray	08. Have You Ever.flac	-9.970001	0.988739
redacted.ch/Crematory . 2008 . Pray	09. Remember.flac	-10.050003	0.988770
redacted.ch/Crematory . 2008 . Pray	10. Say Goodbye.flac	-9.860001	0.988739
redacted.ch/Daft Punk - Human After All - 2005 (CD - FLAC)	01. Human After All.flac	-9.699997	0.944122
redacted.ch/Daft Punk - Human After All - 2005 (CD - FLAC)	02. The Prime Time Of Your Life.flac	-7.940002	0.944122
redacted.ch/Daft Punk - Human After All - 2005 (CD - FLAC)	03. Robot Rock.flac	-10.129997	0.945038
redacted.ch/Daft Punk - Human After All - 2005 (CD - FLAC)	04. Steam Machine.flac	-7.419998	0.944122
redacted.ch/Daft Punk - Human After All - 2005 (CD - FLAC)	05. Make Love.flac	-8.910004	0.944122
redacted.ch/Daft Punk - Human After All - 2005 (CD - FLAC)	06. The Brainwasher.flac	-9.230003	0.944183
redacted.ch/Daft Punk - Human After All - 2005 (CD - FLAC)	07. On,Off.flac	-2.160004	0.375854
redacted.ch/Daft Punk - Human After All - 2005 (CD - FLAC)	08. Television Rules The Nation.flac	-8.720001	0.944550
redacted.ch/Daft Punk - Human After All - 2005 (CD - FLAC)	09. Technologic.flac	-7.620003	0.944122
redacted.ch/Daft Punk - Human After All - 2005 (CD - FLAC)	10. Emotion.flac	-8.919998	0.944122
redacted.ch/Dance Hall Crashers - 1995 - Lockjaw	01 - Shelley.flac	-8.820000	1.000000
redacted.ch/Dance Hall Crashers - 1995 - Lockjaw	02 - Don't Wanna Behave.flac	-8.590004	1.000000
redacted.ch/Dance Hall Crashers - 1995 - Lockjaw	03 - Queen for a Day.flac	-8.949997	1.000000
redacted.ch/Dance Hall Crashers - 1995 - Lockjaw	04 - Flyin'.flac	-7.940002	1.000000
redacted.ch/Dance Hall Crashers - 1995 - Lockjaw	05 - Good for Nothin'.flac	-6.940002	1.000000
redacted.ch/Dance Hall Crashers - 1995 - Lockjaw	06 - Buried Alive.flac	-9.750000	1.000000
redacted.ch/Dance Hall Crashers - 1995 - Lockjaw	07 - Sticky.flac	-8.730003	1.000000
redacted.ch/Dance Hall Crashers - 1995 - Lockjaw	08 - Too Late.flac	-8.860001	1.000000
redacted.ch/Dance Hall Crashers - 1995 - Lockjaw	09 - Go.flac	-9.070000	1.000000
redacted.ch/Dance Hall Crashers - 1995 - Lockjaw	10 - Enough.flac	-9.160004	1.000000
redacted.ch/Dance Hall Crashers - 1995 - Lockjaw	11 - Pictures.flac	-9.250000	1.000000
redacted.ch/Dance Hall Crashers - 1995 - Lockjaw	12 - Day Job.flac	-7.949997	1.000000
redacted.ch/Dance Hall Crashers - 1995 - Lockjaw	13 - So Sue Us.flac	-10.620003	1.000000
redacted.ch/Dance Hall Crashers - 1995 - Lockjaw	14 - We Owe.flac	-8.900002	1.000000
redacted.ch/Dance Hall Crashers - Purr FLAC	01 - Dance Hall Crashers - Beverly Kills.flac	-9.680000	0.944183
redacted.ch/Dance Hall Crashers - Purr FLAC	02 - Dance Hall Crashers - Setting Sun.flac	-9.090004	0.944183
redacted.ch/Dance Hall Crashers - Purr FLAC	03 - Dance Hall Crashers - The Real You.flac	-9.340004	0.944183
redacted.ch/Dance Hall Crashers - Purr FLAC	04 - Dance Hall Crashers - Everything To Lose.flac	-8.699997	0.944183
redacted.ch/Dance Hall Crashers - Purr FLAC	05 - Dance Hall Crashers - Just Like That.flac	-8.269997	0.944183
redacted.ch/Dance Hall Crashers - Purr FLAC	06 - Dance Hall Crashers - Remember To Breathe.flac	-9.080002	0.944183
redacted.ch/Dance Hall Crashers - Purr FLAC	07 - Dance Hall Crashers - Make Her Purr.flac	-9.550003	0.945129
redacted.ch/Dance Hall Crashers - Purr FLAC	08 - Dance Hall Crashers - Do You Think You're Beautiful.flac	-8.949997	0.944183
redacted.ch/Dance Hall Crashers - Purr FLAC	09 - Dance Hall Crashers - Nothing Left To Say.flac	-8.330002	0.944183
redacted.ch/Dance Hall Crashers - Purr FLAC	10 - Dance Hall Crashers - Won't Be The Same.flac	-9.029999	0.944183
redacted.ch/Dance Hall Crashers - Purr FLAC	11 - Dance Hall Crashers - Cat Fight.flac	-9.150002	0.944183
redacted.ch/Dance Hall Crashers - Purr FLAC	12 - Dance Hall Crashers - Cricket.flac	-1.980003	0.668427
redacted.ch/Death By Stereo - Into The Valley Of Death [CD] [FLAC]	01 - The Plague.flac	-7.940002	0.977234
redacted.ch/Death By Stereo - Into The Valley Of Death [CD] [FLAC]	02 - Beyond the Blinders.flac	-8.919998	0.977234
redacted.ch/Death By Stereo - Into The Valley Of Death [CD] [FLAC]	03 - Wasted Words.flac	-8.730003	0.977264
redacted.ch/Death By Stereo - Into The Valley Of Death [CD] [FLAC]	04 - I Wouldn't Piss in Your Ear If Your Brain Was on Fire.flac	-8.190002	0.977234
redacted.ch/Death By Stereo - Into The Valley Of Death [CD] [FLAC]	05 - Shh, It'll Be Our Little Secret.flac	-8.660004	0.977264
redacted.ch/Death By Stereo - Into The Valley Of Death [CD] [FLAC]	06 - What I Can't Hear, Touch, Taste, Smell or See Can't Hurt Me.flac	-8.800003	0.977234
redacted.ch/Death By Stereo - Into The Valley Of Death [CD] [FLAC]	07 - Unstoppable.flac	-8.440002	0.977264
redacted.ch/Death By Stereo - Into The Valley Of Death [CD] [FLAC]	08 - Let Down and Alone.flac	-8.000000	0.977264
redacted.ch/Death By Stereo - Into The Valley Of Death [CD] [FLAC]	09 - These Are a Few of My Favorite Things.flac	-8.980003	0.977264
redacted.ch/Death By Stereo - Into The Valley Of Death [CD] [FLAC]	10 - Good Morning America.flac	-8.389999	0.977234
redacted.ch/Death By Stereo - Into The Valley Of Death [CD] [FLAC]	11 - Flag Day.flac	-7.840004	0.977264
redacted.ch/Death By Stereo - Into The Valley Of Death [CD] [FLAC]	12 - You're a Bullshit Salesman With a Mouthful of Samples.flac	-8.910004	0.977264
redacted.ch/Death By Stereo - Into The Valley Of Death [CD] [FLAC]	13 - Wake Up, You're Dead.flac	-9.340004	0.977264
redacted.ch/Depeche Mode - Enjoy The Silence [FLAC]	01 – Enjoy the Silence (7'' Version).flac	-3.309998	1.000000
redacted.ch/Depeche Mode - Enjoy The Silence [FLAC]	02 – Enjoy the Silence (Hands and Feet Mix).flac	-0.459999	1.000000
redacted.ch/Depeche Mode - Enjoy The Silence [FLAC]	03 – Enjoy the Silence (Ecstatic Dub).flac	0.480003	0.887787
redacted.ch/Depeche Mode - Enjoy The Silence [FLAC]	04 – Sibeling.flac	2.130001	0.599854
redacted.ch/Devotchkas - Live Fast... Die Young	01 - Devotchkas - Pseudo Personality.flac	-6.669998	1.000000
redacted.ch/Devotchkas - Live Fast... Die Young	02 - Devotchkas - Wicked Heart.flac	-6.650002	1.000000
redacted.ch/Devotchkas - Live Fast... Die Young	03 - Devotchkas - Negative Reaction.flac	-6.500000	1.000000
redacted.ch/Devotchkas - Live Fast... Die Young	04 - Devotchkas - Pushed to the Limit.flac	-6.250000	1.000000
redacted.ch/Devotchkas - Live Fast... Die Young	05 - Devotchkas - Live Fast... Die Young.flac	-6.809998	1.000000
redacted.ch/Devotchkas - Live Fast... Die Young	06 - Devotchkas - Travel in Packs.flac	-7.419998	1.000000
redacted.ch/Devotchkas - Live Fast... Die Young	07 - Devotchkas - What Happened.flac	-6.129997	1.000000
redacted.ch/Devotchkas - Live Fast... Die Young	08 - Devotchkas - Transparent Creed.flac	-6.010002	1.000000
redacted.ch/Devotchkas - Live Fast... Die Young	09 - Devotchkas - Gone Crazy.flac	-6.830002	1.000000
redacted.ch/Devotchkas - Live Fast... Die Young	10 - Devotchkas - Her Love Is Innocence.flac	-6.779999	1.000000
redacted.ch/Devotchkas - Live Fast... Die Young	11 - Devotchkas - Like Animals.flac	-5.750000	1.000000
redacted.ch/Devotchkas - Live Fast... Die Young	12 - Devotchkas - Poogly.flac	-6.019997	1.000000
redacted.ch/Devotchkas - Live Fast... Die Young	13 - Devotchkas - Hidden Track.flac	-4.720001	1.000000
redacted.ch/Devotchkas - Live Fast... Die Young	14 - Devotchkas - Hidden Track.flac	3.509998	0.670807
redacted.ch/Discovery	01 One More Time.flac	-5.959999	0.999969
redacted.ch/Discovery	02 Aerodynamic.flac	-5.309998	0.999969
redacted.ch/Discovery	03 Digital Love.flac	-6.510002	0.999969
redacted.ch/Discovery	04 Harder, Better, Faster, Stronger.flac	-6.290001	0.999969
redacted.ch/Discovery	05 Crescendolls.flac	-6.870003	0.999969
redacted.ch/Discovery	06 Nightvision.flac	2.139999	0.940063
redacted.ch/Discovery	07 Superheroes.flac	-5.459999	0.999969
redacted.ch/Discovery	08 High Life.flac	-5.070000	0.999969
redacted.ch/Discovery	09 Something About Us.flac	-3.840004	0.999969
redacted.ch/Discovery	10 Voyager.flac	-4.449997	0.999969
redacted.ch/Discovery	11 Veridis Quo.flac	-3.660004	0.999969
redacted.ch/Discovery	12 Short Circuit.flac	-5.360001	0.999969
redacted.ch/Discovery	13 Face To Face.flac	-4.269997	0.999969
redacted.ch/Discovery	14 Too Long.flac	-6.480003	0.999969
redacted.ch/Distemper - 2001 - Доброе утро [CD]	01. Distemper – Тайна.flac	-9.720001	0.998596
redacted.ch/Distemper - 2001 - Доброе утро [CD]	02. Distemper – Продавщица.flac	-7.320000	0.977570
redacted.ch/Distemper - 2001 - Доброе утро [CD]	03. Distemper – Я Лечу (Свобода).flac	-7.879997	0.977570
redacted.ch/Distemper - 2001 - Доброе утро [CD]	04. Distemper – Похорони Их.flac	-8.000000	0.977570
redacted.ch/Distemper - 2001 - Доброе утро [CD]	05. Distemper – Фенозипам.flac	-7.459999	0.925110
redacted.ch/Distemper - 2001 - Доброе утро [CD]	06. Distemper – Доброе Утро.flac	-8.340004	0.977570
redacted.ch/Distemper - 2001 - Доброе утро [CD]	07. Distemper – Трактористы.flac	-7.720001	0.969208
redacted.ch/Distemper - 2001 - Доброе утро [CD]	08. Distemper – Вобла.flac	-7.809998	0.999725
redacted.ch/Distemper - 2001 - Доброе утро [CD]	09. Distemper – Миллениум.flac	-8.459999	0.977539
redacted.ch/Distemper - 2001 - Доброе утро [CD]	10. Distemper – Ska концерт.flac	-7.809998	0.910339
redacted.ch/Distemper - 2001 - Доброе утро [CD]	11. Distemper – Проваливай Домой.flac	-8.959999	0.999725
redacted.ch/Distemper - 2001 - Доброе утро [CD]	12. Distemper – Добрая Песня.flac	-7.870003	0.925110
redacted.ch/Distemper - 2008 - My Undeground [CD]	01. Distemper – start to relax.flac	-9.860001	0.977448
redacted.ch/Distemper - 2008 - My Undeground [CD]	02. Distemper – i am at ease.flac	-10.050003	0.977478
redacted.ch/Distemper - 2008 - My Undeground [CD]	03. Distemper – alive planet.flac	-9.340004	0.977417
redacted.ch/Distemper - 2008 - My Undeground [CD]	04. Distemper – my underground.flac	-10.230003	0.977478
redacted.ch/Distemper - 2008 - My Undeground [CD]	05. Distemper – jump.flac	-9.590004	0.977448
redacted.ch/Distemper - 2008 - My Undeground [CD]	06. Distemper – three minutes on summertime.flac	-8.580002	0.977448
redacted.ch/Distemper - 2008 - My Undeground [CD]	07. Distemper – dog star.flac	-9.959999	0.977448
redacted.ch/Distemper - 2008 - My Undeground [CD]	08. Distemper – how to stay human.flac	-9.989998	0.977448
redacted.ch/Distemper - 2008 - My Undeground [CD]	09. Distemper – blue blue night.flac	-9.650002	0.977478
redacted.ch/Distemper - 2008 - My Undeground [CD]	10. Distemper – at dawn.flac	-9.690002	0.977478
redacted.ch/Distemper - 2008 - My Undeground [CD]	11. Distemper – happy end.flac	-10.040001	0.977417
redacted.ch/Distemper - Distemper - 2004 (CD - FLAC - Lossless)	01 - Do Utra Guljaet Gorod! (City Rocks Till the Morning!).flac	-7.120003	0.818573
redacted.ch/Distemper - Distemper - 2004 (CD - FLAC - Lossless)	02 - Jamajka (Jamaica).flac	-6.410004	0.818665
redacted.ch/Distemper - Distemper - 2004 (CD - FLAC - Lossless)	03 - V Zerkalah Moej Nadezhdy (In the Mirror of My Hope).flac	-7.500000	0.818573
redacted.ch/Distemper - Distemper - 2004 (CD - FLAC - Lossless)	04 - Vsjo Otlichno! (Everything Is OK).flac	-5.440002	0.818573
redacted.ch/Distemper - Distemper - 2004 (CD - FLAC - Lossless)	05 - Zachem !!! (Why !!!).flac	-7.279999	0.818573
redacted.ch/Distemper - Distemper - 2004 (CD - FLAC - Lossless)	06 - Ljubov'  (Love ).flac	-6.639999	0.818573
redacted.ch/Distemper - Distemper - 2004 (CD - FLAC - Lossless)	07 - Net Rasizma - Net Problem! (No Racism - No Problem!).flac	-7.190002	0.818573
redacted.ch/Distemper - Distemper - 2004 (CD - FLAC - Lossless)	08 - Ostorozhno - Nam Vsjo Mozhno! (Warning - Nothing Is Forbidden for Us!).flac	-6.370003	0.818573
redacted.ch/Distemper - Distemper - 2004 (CD - FLAC - Lossless)	09 - Incident (Incident).flac	-5.470001	0.818695
redacted.ch/Distemper - Distemper - 2004 (CD - FLAC - Lossless)	10 - Nachni S Sebja (Start With Yourself).flac	-6.250000	0.818909
redacted.ch/Distemper - Podumaj Kto Tvoi Druz'ja (Think Who Your Friends Are) - 2005 (CD - FLAC - Lossless)	01 - Internet Pizdoboly (Internet Windbags).flac	-8.860001	1.000000
redacted.ch/Distemper - Podumaj Kto Tvoi Druz'ja (Think Who Your Friends Are) - 2005 (CD - FLAC - Lossless)	02 - Magija Svobody (The Magic of Freedom).flac	-8.879997	1.000000
redacted.ch/Distemper - Podumaj Kto Tvoi Druz'ja (Think Who Your Friends Are) - 2005 (CD - FLAC - Lossless)	03 - Ty nastojawij Lish' Vnutri (You Are Real Only Inside).flac	-8.559998	1.000000
redacted.ch/Distemper - Podumaj Kto Tvoi Druz'ja (Think Who Your Friends Are) - 2005 (CD - FLAC - Lossless)	04 - Slovo Ubivaet (The Word Klls).flac	-9.440002	1.000000
redacted.ch/Distemper - Podumaj Kto Tvoi Druz'ja (Think Who Your Friends Are) - 2005 (CD - FLAC - Lossless)	05 - Prosto Poguljaem (Let's Walk).flac	-8.620003	1.000000
redacted.ch/Distemper - Podumaj Kto Tvoi Druz'ja (Think Who Your Friends Are) - 2005 (CD - FLAC - Lossless)	06 - Spros Rozhdaet Predlozhenie (Demand Creates Supply).flac	-8.459999	1.000000
redacted.ch/Distemper - Podumaj Kto Tvoi Druz'ja (Think Who Your Friends Are) - 2005 (CD - FLAC - Lossless)	07 - Uragan (Hurricane).flac	-9.379997	1.000000
redacted.ch/Distemper - Podumaj Kto Tvoi Druz'ja (Think Who Your Friends Are) - 2005 (CD - FLAC - Lossless)	08 - All colors crew.flac	-7.739998	1.000000
redacted.ch/Distemper - Podumaj Kto Tvoi Druz'ja (Think Who Your Friends Are) - 2005 (CD - FLAC - Lossless)	09 - Devochki V Pomojke (Girls in Scrapyard).flac	-8.870003	1.000000
redacted.ch/Distemper - Podumaj Kto Tvoi Druz'ja (Think Who Your Friends Are) - 2005 (CD - FLAC - Lossless)	10 - Moi Sekrety (My Secrets).flac	-9.419998	1.000000
redacted.ch/Distemper - Podumaj Kto Tvoi Druz'ja (Think Who Your Friends Are) - 2005 (CD - FLAC - Lossless)	11 - Sljozy (Tears).flac	-8.849998	1.000000
redacted.ch/Distemper - Podumaj Kto Tvoi Druz'ja (Think Who Your Friends Are) - 2005 (CD - FLAC - Lossless)	12 - Podumaj Kto Tvoi Druz'ja (Think Who Your Friends Are).flac	-8.919998	1.000000
redacted.ch/Disturbed - Believe (2.0 44.1-24) (DVD-A)	01 - Prayer.flac	-8.570000	1.000000
redacted.ch/Disturbed - Believe (2.0 44.1-24) (DVD-A)	02 - Liberate.flac	-8.570000	1.000000
redacted.ch/Disturbed - Believe (2.0 44.1-24) (DVD-A)	03 - Awaken.flac	-8.919998	1.000000
redacted.ch/Disturbed - Believe (2.0 44.1-24) (DVD-A)	04 - Believe.flac	-8.139999	1.000000
redacted.ch/Disturbed - Believe (2.0 44.1-24) (DVD-A)	05 - Remember.flac	-9.260002	1.000000
redacted.ch/Disturbed - Believe (2.0 44.1-24) (DVD-A)	06 - Intoxication.flac	-9.330002	1.000000
redacted.ch/Disturbed - Believe (2.0 44.1-24) (DVD-A)	07 - Rise.flac	-8.919998	1.000000
redacted.ch/Disturbed - Believe (2.0 44.1-24) (DVD-A)	08 - Mistress.flac	-8.699997	1.000000
redacted.ch/Disturbed - Believe (2.0 44.1-24) (DVD-A)	09 - Breathe.flac	-8.489998	1.000000
redacted.ch/Disturbed - Believe (2.0 44.1-24) (DVD-A)	10 - Bound.flac	-8.449997	1.000000
redacted.ch/Disturbed - Believe (2.0 44.1-24) (DVD-A)	11 - Devour.flac	-8.540001	1.000000
redacted.ch/Disturbed - Believe (2.0 44.1-24) (DVD-A)	12 - Darkness.flac	-3.980003	0.929831
redacted.ch/Dolphin - Звезда (2004)	01. Dolphin - Сумерки.flac	-9.090004	0.986145
redacted.ch/Dolphin - Звезда (2004)	02. Dolphin - Серебро.flac	-6.559998	0.998566
redacted.ch/Dolphin - Звезда (2004)	03. Dolphin - Чужой.flac	-5.849998	0.988586
redacted.ch/Dolphin - Звезда (2004)	04. Dolphin - Весна.flac	-9.430000	0.999023
redacted.ch/Dolphin - Звезда (2004)	05. Dolphin - Имя.flac	-6.840004	1.000000
redacted.ch/Dolphin - Звезда (2004)	06. Dolphin - Романс.flac	0.659996	0.972137
redacted.ch/Dolphin - Звезда (2004)	07. Dolphin - Тоска.flac	-9.470001	0.977539
redacted.ch/Dolphin - Звезда (2004)	08. Dolphin - Облака.flac	-6.970001	0.988831
redacted.ch/Dolphin - Звезда (2004)	09. Dolphin - Звезда.flac	-3.669998	0.977478
redacted.ch/Dolphin - Звезда (2004)	10. Dolphin - Киберпанк.flac	-10.220001	0.977753
redacted.ch/Dolphin - Звезда (2004)	11. Dolphin - MDMA.flac	-7.910004	1.000000
redacted.ch/Donots	Donots - Got the Noise - 2004 [flac]/01 - We Got The Noise.flac	-10.199997	0.999756
redacted.ch/Donots	Donots - Got the Noise - 2004 [flac]/02 - Knowledge.flac	-9.480003	0.999756
redacted.ch/Donots	Donots - Got the Noise - 2004 [flac]/03 - Wretched Boy.flac	-9.840004	1.000000
redacted.ch/Donots	Donots - Got the Noise - 2004 [flac]/04 - It's Over.flac	-9.629997	0.999756
redacted.ch/Donots	Donots - Got the Noise - 2004 [flac]/05 - Disappear.flac	-9.720001	0.999756
redacted.ch/Donots	Donots - Got the Noise - 2004 [flac]/06 - Life Ain't Gonna Wait.flac	-9.730003	0.999756
redacted.ch/Donots	Donots - Got the Noise - 2004 [flac]/07 - Alright Now.flac	-9.940002	0.999756
redacted.ch/Donots	Donots - Got the Noise - 2004 [flac]/08 - Good-Bye Routine.flac	-8.250000	0.999054
redacted.ch/Donots	Donots - Got the Noise - 2004 [flac]/09 - Your Way Home.flac	-9.000000	0.999756
redacted.ch/Donots	Donots - Got the Noise - 2004 [flac]/10 - The Jerk Parade.flac	-10.599998	0.999756
redacted.ch/Donots	Donots - Got the Noise - 2004 [flac]/11 - Cought It Up.flac	-9.129997	0.999756
redacted.ch/Donots	Donots - Got the Noise - 2004 [flac]/12 - Better Days (Not Included).flac	-10.440002	0.999756
redacted.ch/Donots	Donots - Got the Noise - 2004 [flac]/13 - Punchline.flac	-8.690002	0.999756
redacted.ch/Downset - Downset	01 - Anger!.flac	-6.470001	1.000000
redacted.ch/Downset - Downset	02 - Ritual.flac	-5.980003	1.000000
redacted.ch/Downset - Downset	03 - Take 'em Out.flac	-6.620003	1.000000
redacted.ch/Downset - Downset	04 - Prostitutionalized.flac	-6.650002	1.000000
redacted.ch/Downset - Downset	05 - Downset.flac	-6.739998	0.994476
redacted.ch/Downset - Downset	06 - My American Prayer.flac	-7.269997	1.000000
redacted.ch/Downset - Downset	07 - Holding Hands.flac	-6.820000	1.000000
redacted.ch/Downset - Downset	08 - About to Blast.flac	-6.940002	1.000000
redacted.ch/Downset - Downset	09 - Breed the Killer.flac	-6.540001	1.000000
redacted.ch/Downset - Downset	10 - Dying of Thirst.flac	-6.720001	0.999969
redacted.ch/Dream Theater - Images And Words	Dream Theater - Images And Words/01 - Pull Me Under.flac	-4.980003	0.999969
redacted.ch/Dream Theater - Images And Words	Dream Theater - Images And Words/02 - Another Day.flac	-3.779999	0.999969
redacted.ch/Dream Theater - Images And Words	Dream Theater - Images And Words/03 - Take The Time.flac	-4.400002	0.999969
redacted.ch/Dream Theater - Images And Words	Dream Theater - Images And Words/04 - Surrounded.flac	-5.090004	0.999969
redacted.ch/Dream Theater - Images And Words	Dream Theater - Images And Words/05 - Metropolis-Part I- The Miracle And The Sleeper.flac	-4.500000	0.999969
redacted.ch/Dream Theater - Images And Words	Dream Theater - Images And Words/06 - Under A Glass Moon.flac	-3.809998	0.999969
redacted.ch/Dream Theater - Images And Words	Dream Theater - Images And Words/07 - Wait For Sleep.flac	-0.070000	0.883698
redacted.ch/Dream Theater - Images And Words	Dream Theater - Images And Words/08 - Learning To Live.flac	-3.760002	0.999969
redacted.ch/Dub Incorporation - 2005 - Dans le Décor [FLAC]	01-Dub Incorporation-Survie.flac	-7.570000	0.974121
redacted.ch/Dub Incorporation - 2005 - Dans le Décor [FLAC]	02-Dub Incorporation-One Shot.flac	-7.730003	0.963684
redacted.ch/Dub Incorporation - 2005 - Dans le Décor [FLAC]	03-Dub Incorporation-Monnaie (ft. Lyricson).flac	-6.989998	1.000000
redacted.ch/Dub Incorporation - 2005 - Dans le Décor [FLAC]	04-Dub Incorporation-Chaines.flac	-4.959999	1.000000
redacted.ch/Dub Incorporation - 2005 - Dans le Décor [FLAC]	05-Dub Incorporation-A Imma.flac	-5.820000	1.000000
redacted.ch/Dub Incorporation - 2005 - Dans le Décor [FLAC]	06-Dub Incorporation-Décor.flac	-7.680000	0.970673
redacted.ch/Dub Incorporation - 2005 - Dans le Décor [FLAC]	07-Dub Incorporation-Achtah (ft. Omar Perry).flac	-8.040001	0.973267
redacted.ch/Dub Incorporation - 2005 - Dans le Décor [FLAC]	08-Dub Incorporation-Bla bla.flac	-7.349998	0.977112
redacted.ch/Dub Incorporation - 2005 - Dans le Décor [FLAC]	09-Dub Incorporation-Face à Soi.flac	-8.019997	0.962982
redacted.ch/Dub Incorporation - 2005 - Dans le Décor [FLAC]	10-Dub Incorporation-Speed (ft. David Hinds).flac	-7.980003	0.978027
redacted.ch/Dub Incorporation - 2005 - Dans le Décor [FLAC]	11-Dub Incorporation-La Corde Raide.flac	-7.529999	1.000000
redacted.ch/Dub Incorporation - 2005 - Dans le Décor [FLAC]	12-Dub Incorporation-Never Stop.flac	-7.440002	0.970398
redacted.ch/Dub Incorporation - 2005 - Dans le Décor [FLAC]	13-Dub Incorporation-Never More.flac	-6.360001	0.978729
redacted.ch/Epica - Consign To Oblivion (2005) FLAC (WCD)	01 - Hunab K'u - A New Age Dawns - prologue.flac	-8.610001	0.966064
redacted.ch/Epica - Consign To Oblivion (2005) FLAC (WCD)	02 - Dance Of Fate.flac	-6.690002	0.966064
redacted.ch/Epica - Consign To Oblivion (2005) FLAC (WCD)	03 - The Last Crusade - A New Age Dawns #1.flac	-7.379997	0.966064
redacted.ch/Epica - Consign To Oblivion (2005) FLAC (WCD)	04 - Solitary Ground.flac	-5.489998	0.966064
redacted.ch/Epica - Consign To Oblivion (2005) FLAC (WCD)	05 - Blank Infinity.flac	-6.739998	0.966064
redacted.ch/Epica - Consign To Oblivion (2005) FLAC (WCD)	06 - Force Of The Shore.flac	-7.190002	0.966064
redacted.ch/Epica - Consign To Oblivion (2005) FLAC (WCD)	07 - Quietus.flac	-6.510002	0.966064
redacted.ch/Epica - Consign To Oblivion (2005) FLAC (WCD)	08 - Mother of Light - A New Age Dawns #2.flac	-7.519997	0.966064
redacted.ch/Epica - Consign To Oblivion (2005) FLAC (WCD)	09 - Trois Vierges.flac	-5.330002	0.767426
redacted.ch/Epica - Consign To Oblivion (2005) FLAC (WCD)	10 - Another Me 'In Lack'ech'.flac	-7.209999	0.966064
redacted.ch/Epica - Consign To Oblivion (2005) FLAC (WCD)	11 - Consign to Oblivion - A New Age Dawns #3.flac	-7.180000	0.966064
redacted.ch/E-SEX-T - Время Слона (2007) What.cd	01 Что Дороже.flac	-12.250000	0.961731
redacted.ch/E-SEX-T - Время Слона (2007) What.cd	02 Все Сложней (Облом#2).flac	-12.470001	0.961365
redacted.ch/E-SEX-T - Время Слона (2007) What.cd	03 А Ты Попробуй.flac	-12.290001	0.961700
redacted.ch/E-SEX-T - Время Слона (2007) What.cd	04 Театр Теней.flac	-12.300003	0.961731
redacted.ch/E-SEX-T - Время Слона (2007) What.cd	05 Девчонка (С Мушкой Между Бровей).flac	-12.169998	0.961700
redacted.ch/E-SEX-T - Время Слона (2007) What.cd	06 Музыкальная Шкатулка.flac	-12.279999	0.961700
redacted.ch/E-SEX-T - Время Слона (2007) What.cd	07 Некуда Бежать.flac	-12.169998	0.961731
redacted.ch/E-SEX-T - Время Слона (2007) What.cd	08 Ее Еще Нет.flac	-11.620003	0.961731
redacted.ch/E-SEX-T - Время Слона (2007) What.cd	09 Грязь.flac	-11.860001	0.961365
redacted.ch/E-SEX-T - Время Слона (2007) What.cd	10  Волк.flac	-11.739998	0.961731
redacted.ch/E-SEX-T - Время Слона (2007) What.cd	11 Проще И Лучше.flac	-11.930000	0.961731
redacted.ch/E-SEX-T - Время Слона (2007) What.cd	12 Не уходи.flac	-12.269997	0.961731
redacted.ch/Everything Goes Numb	01_-_Everything_Went_Numb.flac	-8.580002	0.920929
redacted.ch/Everything Goes Numb	02_-_That'll_Be_The_Day.flac	-8.629997	0.920929
redacted.ch/Everything Goes Numb	03_-_Point_-_Counterpoint.flac	-8.940002	0.920929
redacted.ch/Everything Goes Numb	04_-_If_And_When_We_Rise_Again.flac	-8.300003	0.920929
redacted.ch/Everything Goes Numb	05_-_A_Better_Place,_A_Better_Time.flac	-9.269997	0.920929
redacted.ch/Everything Goes Numb	06_-_We_Are_The_Few.flac	-8.029999	0.920929
redacted.ch/Everything Goes Numb	07_-_Failing,_Flailing.flac	-8.519997	0.920929
redacted.ch/Everything Goes Numb	08_-_Here's_To_Life.flac	-8.370003	0.920929
redacted.ch/Everything Goes Numb	09_-_A_Moment_Of_Silence.flac	-8.019997	0.920929
redacted.ch/Everything Goes Numb	10_-_A_Moment_Of_Violence.flac	-7.650002	0.920929
redacted.ch/Everything Goes Numb	11_-_The_Saddest_Song.flac	-8.489998	0.920929
redacted.ch/Everything Goes Numb	12_-_The_Big_Sleep.flac	-7.430000	0.920898
redacted.ch/Exilia - 2006 - Nobody Excluded	01 - Exilia - Kill Me.flac	-10.199997	0.983246
redacted.ch/Exilia - 2006 - Nobody Excluded	02 - Exilia - Nobody.flac	-10.519997	0.983246
redacted.ch/Exilia - 2006 - Nobody Excluded	03 - Exilia - Destroy My Eyes.flac	-10.580002	0.983368
redacted.ch/Exilia - 2006 - Nobody Excluded	04 - Exilia - No Colours.flac	-10.220001	0.973633
redacted.ch/Exilia - 2006 - Nobody Excluded	05 - Exilia - Your Rain.flac	-9.889999	0.973663
redacted.ch/Exilia - 2006 - Nobody Excluded	06 - Exilia - Get Sick.flac	-10.050003	0.983337
redacted.ch/Exilia - 2006 - Nobody Excluded	07 - Exilia - Speed Of Light.flac	-9.629997	0.973694
redacted.ch/Exilia - 2006 - Nobody Excluded	08 - Exilia - Fly High Butterfly.flac	-10.239998	0.983368
redacted.ch/Exilia - 2006 - Nobody Excluded	09 - Exilia - My Prophecy.flac	-10.690002	0.983826
redacted.ch/Exilia - 2006 - Nobody Excluded	10 - Exilia - In A Coma.flac	-10.830002	0.983795
redacted.ch/Exilia - 2006 - Nobody Excluded	11 - Exilia - Justify Yourself.flac	-9.919998	0.983856
redacted.ch/Exilia - 2006 - Nobody Excluded	12 - Exilia - Little Girl In A World.flac	-10.440002	0.983856
redacted.ch/Exilia - Unleashed	01 - Coincidence.flac	-10.970001	0.999756
redacted.ch/Exilia - Unleashed	02 - Stop Playing God.flac	-10.269997	0.999847
redacted.ch/Exilia - Unleashed	03 - Day in Hell.flac	-11.230003	0.999756
redacted.ch/Exilia - Unleashed	04 - Underdog.flac	-10.919998	0.999756
redacted.ch/Exilia - Unleashed	05 - Mr. Man.flac	-9.830002	0.999756
redacted.ch/Exilia - Unleashed	06 - Starseed.flac	-11.040001	0.999756
redacted.ch/Exilia - Unleashed	07 - Shout Louder.flac	-11.529999	0.999756
redacted.ch/Exilia - Unleashed	08 - I Guess You Know (feat. MichaIn Extremo).flac	-10.000000	0.999756
redacted.ch/Exilia - Unleashed	09 - Without you.flac	-11.090004	0.999756
redacted.ch/Exilia - Unleashed	10 - The World is Fallin' Down.flac	-10.849998	0.999756
redacted.ch/Exilia - Unleashed	11 - Rise when you Fall.flac	-10.930000	0.999756
redacted.ch/Exilia - Unleashed	12 - Heaven's Gate.flac	-10.879997	0.999756
redacted.ch/Exilia - Unleashed	13 - Where I'm wrong.flac	-10.620003	0.999756
redacted.ch/Faith No More - Angel Dust (1992)[MFSL]	01 - Land Of Sunshine.flac	-2.940002	0.977570
redacted.ch/Faith No More - Angel Dust (1992)[MFSL]	02 - Caffeine.flac	-4.449997	0.986725
redacted.ch/Faith No More - Angel Dust (1992)[MFSL]	03 - MidLife Crisis.flac	-2.830002	0.989929
redacted.ch/Faith No More - Angel Dust (1992)[MFSL]	04 - RV.flac	-3.570000	0.990265
redacted.ch/Faith No More - Angel Dust (1992)[MFSL]	05 - Smaller And Smaller.flac	-2.940002	0.980591
redacted.ch/Faith No More - Angel Dust (1992)[MFSL]	06 - Everything's Ruined.flac	-2.529999	0.982910
redacted.ch/Faith No More - Angel Dust (1992)[MFSL]	07 - Malpractice.flac	-3.840004	0.957367
redacted.ch/Faith No More - Angel Dust (1992)[MFSL]	08 - Kindergarten.flac	-2.220001	0.988617
redacted.ch/Faith No More - Angel Dust (1992)[MFSL]	09 - Be Aggressive.flac	-2.660004	0.994019
redacted.ch/Faith No More - Angel Dust (1992)[MFSL]	10 - A Small Victory.flac	-2.860001	0.986603
redacted.ch/Faith No More - Angel Dust (1992)[MFSL]	11 - Crack Hitler.flac	-3.730003	0.984039
redacted.ch/Faith No More - Angel Dust (1992)[MFSL]	12 - Jizzlobber.flac	-3.379997	0.984802
redacted.ch/Faith No More - Angel Dust (1992)[MFSL]	13 - Midnight Cowboy.flac	0.379997	0.953857
redacted.ch/Favourite Worst Nightmare	01 Arctic Monkeys - Brianstorm.flac	-9.889999	0.999054
redacted.ch/Favourite Worst Nightmare	02 Arctic Monkeys - Teddy Picker.flac	-10.139999	0.999237
redacted.ch/Favourite Worst Nightmare	03 Arctic Monkeys - D Is For Dangerous.flac	-9.340004	0.999054
redacted.ch/Favourite Worst Nightmare	04 Arctic Monkeys - Balaclava.flac	-10.340004	0.999054
redacted.ch/Favourite Worst Nightmare	05 Arctic Monkeys - Fluorescent Adolescent.flac	-9.059998	0.999054
redacted.ch/Favourite Worst Nightmare	06 Arctic Monkeys - Only Ones Who Know.flac	-6.639999	0.999054
redacted.ch/Favourite Worst Nightmare	07 Arctic Monkeys - Do Me A Favour.flac	-10.190002	0.999054
redacted.ch/Favourite Worst Nightmare	08 Arctic Monkeys - This House Is A Circus.flac	-9.300003	0.999054
redacted.ch/Favourite Worst Nightmare	09 Arctic Monkeys - If You Were There, Beware.flac	-9.779999	0.999054
redacted.ch/Favourite Worst Nightmare	10 Arctic Monkeys - The Bad Thing.flac	-9.809998	0.999054
redacted.ch/Favourite Worst Nightmare	11 Arctic Monkeys - Old Yellow Bricks.flac	-9.400002	0.999054
redacted.ch/Favourite Worst Nightmare	12 Arctic Monkeys - 505.flac	-9.860001	0.999054
redacted.ch/Fishbone - The Reality Of My Surroundings (1991) [FLAC]	01 - Fight The Youth.flac	-6.629997	0.970001
redacted.ch/Fishbone - The Reality Of My Surroundings (1991) [FLAC]	02 - If I Were A...I'd.flac	-5.949997	0.947418
redacted.ch/Fishbone - The Reality Of My Surroundings (1991) [FLAC]	03 - So Many Millions.flac	-6.949997	1.000000
redacted.ch/Fishbone - The Reality Of My Surroundings (1991) [FLAC]	04 - Asswhippin'.flac	-4.389999	0.952515
redacted.ch/Fishbone - The Reality Of My Surroundings (1991) [FLAC]	05 - Housework.flac	-5.980003	0.956604
redacted.ch/Fishbone - The Reality Of My Surroundings (1991) [FLAC]	06 - Deathmarch.flac	-1.720001	0.573730
redacted.ch/Fishbone - The Reality Of My Surroundings (1991) [FLAC]	07 - Behavior Control Technician.flac	-6.400002	0.963959
redacted.ch/Fishbone - The Reality Of My Surroundings (1991) [FLAC]	08 - If I Were A...I'd.flac	-5.230003	0.951508
redacted.ch/Fishbone - The Reality Of My Surroundings (1991) [FLAC]	09 - Pressure.flac	-6.760002	0.967316
redacted.ch/Fishbone - The Reality Of My Surroundings (1991) [FLAC]	10 - Junkies Prayer.flac	-5.500000	0.968872
redacted.ch/Fishbone - The Reality Of My Surroundings (1991) [FLAC]	11 - Pray To The Junkiemaker.flac	-6.250000	0.970551
redacted.ch/Fishbone - The Reality Of My Surroundings (1991) [FLAC]	12 - Everyday Sunshine.flac	-7.470001	0.963898
redacted.ch/Fishbone - The Reality Of My Surroundings (1991) [FLAC]	13 - If I Were A...I'd.flac	-4.760002	0.945129
redacted.ch/Fishbone - The Reality Of My Surroundings (1991) [FLAC]	14 - Naz-tee May'en.flac	-6.379997	0.984070
redacted.ch/Fishbone - The Reality Of My Surroundings (1991) [FLAC]	15 - Babyhead.flac	-6.699997	0.964722
redacted.ch/Fishbone - The Reality Of My Surroundings (1991) [FLAC]	16 - If I Were A...I'd.flac	-8.599998	0.961456
redacted.ch/Fishbone - The Reality Of My Surroundings (1991) [FLAC]	17 - Those Days Are Gone.flac	-8.260002	0.984100
redacted.ch/Fishbone - The Reality Of My Surroundings (1991) [FLAC]	18 - Sunless Saturday.flac	-7.809998	0.969604
redacted.ch/Flobots - 2008 - Fight With Tools	01 - There's A War Going On For Your Mind.flac	-8.169998	0.975250
redacted.ch/Flobots - 2008 - Fight With Tools	02 - Mayday!!!.flac	-7.769997	0.993530
redacted.ch/Flobots - 2008 - Fight With Tools	03 - Same Thing.flac	-6.989998	0.979950
redacted.ch/Flobots - 2008 - Fight With Tools	04 - Stand Up.flac	-5.980003	0.977936
redacted.ch/Flobots - 2008 - Fight With Tools	05 - Fight With Tools.flac	-8.129997	0.981171
redacted.ch/Flobots - 2008 - Fight With Tools	06 - Handlebars.flac	-7.440002	0.999969
redacted.ch/Flobots - 2008 - Fight With Tools	07 - Never Had It.flac	-6.379997	0.979462
redacted.ch/Flobots - 2008 - Fight With Tools	08 - Combat.flac	-6.699997	0.970581
redacted.ch/Flobots - 2008 - Fight With Tools	09 - The Rhythm Method (Move!).flac	-7.379997	0.987366
redacted.ch/Flobots - 2008 - Fight With Tools	10 - Anne Braden.flac	-6.650002	0.937378
redacted.ch/Flobots - 2008 - Fight With Tools	11 - We Are Winning.flac	-6.050003	0.999969
redacted.ch/Flobots - 2008 - Fight With Tools	12 - Rise.flac	-7.879997	0.977783
redacted.ch/Flogging Molly - Swagger (2000) [FLAC]	01 Salty Dog.flac	-8.389999	0.997589
redacted.ch/Flogging Molly - Swagger (2000) [FLAC]	02 Selfish Man.flac	-8.290001	0.997742
redacted.ch/Flogging Molly - Swagger (2000) [FLAC]	03 The Worst Day Since Yesterday.flac	-7.830002	0.997498
redacted.ch/Flogging Molly - Swagger (2000) [FLAC]	04 Every Dog Has Its Day.flac	-8.730003	0.998016
redacted.ch/Flogging Molly - Swagger (2000) [FLAC]	05 Life in a Tenement Square.flac	-8.820000	0.997711
redacted.ch/Flogging Molly - Swagger (2000) [FLAC]	06 The Ol' Beggars Bush.flac	-8.570000	0.997772
redacted.ch/Flogging Molly - Swagger (2000) [FLAC]	07 The Likes of You Again.flac	-9.070000	0.997833
redacted.ch/Flogging Molly - Swagger (2000) [FLAC]	08 Black Friday Rule.flac	-8.139999	0.997955
redacted.ch/Flogging Molly - Swagger (2000) [FLAC]	09 Grace of God Go I.flac	-2.410004	0.691162
redacted.ch/Flogging Molly - Swagger (2000) [FLAC]	10 Devil's Dance Floor.flac	-9.160004	0.997864
redacted.ch/Flogging Molly - Swagger (2000) [FLAC]	11 These Exiled Years.flac	-8.610001	0.997894
redacted.ch/Flogging Molly - Swagger (2000) [FLAC]	12 Sentimental Johnny.flac	-8.760002	0.997681
redacted.ch/Flogging Molly - Swagger (2000) [FLAC]	13 Far Away Boys.flac	-3.919998	0.990265
redacted.ch/Foo Fighters - Everlong (UK CD Single 1)	Foo Fighters - Everlong (UK CD Single 1) - 01 - Everlong.flac	-9.209999	0.979767
redacted.ch/Foo Fighters - Everlong (UK CD Single 1)	Foo Fighters - Everlong (UK CD Single 1) - 02 - Drive Me Wild.flac	-7.639999	0.979767
redacted.ch/Foo Fighters - Everlong (UK CD Single 1)	Foo Fighters - Everlong (UK CD Single 1) - 03 - See You (Live).flac	-7.690002	0.979767
redacted.ch/F.P.G - 2001 - Гонщики	01 - Ботинки.flac	-8.510002	0.724426
redacted.ch/F.P.G - 2001 - Гонщики	02 - Ебанутый.flac	-8.930000	0.741302
redacted.ch/F.P.G - 2001 - Гонщики	03 - Утренняя.flac	-9.239998	0.881042
redacted.ch/F.P.G - 2001 - Гонщики	04 - Сучка.flac	-9.330002	0.794312
redacted.ch/F.P.G - 2001 - Гонщики	05 - My Way.flac	-7.709999	0.882416
redacted.ch/F.P.G - 2001 - Гонщики	06 - Туз Виней.flac	-9.989998	0.977234
redacted.ch/F.P.G - 2001 - Гонщики	07 - Идиоты.flac	-9.809998	0.785217
redacted.ch/F.P.G - 2001 - Гонщики	08 - Не отступай.flac	-7.769997	0.794312
redacted.ch/F.P.G - 2001 - Гонщики	09 - Свобода.flac	-8.860001	0.794312
redacted.ch/F.P.G - 2001 - Гонщики	10 - Блядская.flac	-7.650002	0.776245
redacted.ch/F.P.G - 2001 - Гонщики	11 - Восьмое марта.flac	-9.040001	1.000000
redacted.ch/F.P.G. - 2004 - Гавнорок	01 - Двигатель.flac	-11.190002	0.995605
redacted.ch/F.P.G. - 2004 - Гавнорок	02 - Клуб.flac	-11.120003	0.995605
redacted.ch/F.P.G. - 2004 - Гавнорок	03 - Проебал.flac	-10.010002	0.995605
redacted.ch/F.P.G. - 2004 - Гавнорок	04 - Проснулся.flac	-10.709999	0.995605
redacted.ch/F.P.G. - 2004 - Гавнорок	05 - Ночь.flac	-9.550003	0.995605
redacted.ch/F.P.G. - 2004 - Гавнорок	06 - Сейчас.flac	-10.419998	0.995605
redacted.ch/F.P.G. - 2004 - Гавнорок	07 - Джи.flac	-9.260002	0.995605
redacted.ch/F.P.G. - 2004 - Гавнорок	08 - У.е.баны.flac	-10.550003	0.995605
redacted.ch/F.P.G. - 2004 - Гавнорок	09 - Гавнометал.flac	-10.449997	0.995605
redacted.ch/F.P.G. - 2004 - Гавнорок	10 - Сердце.flac	-10.599998	0.995605
redacted.ch/F.P.G. - 2004 - Гавнорок	11 - Бунтари.flac	-11.070000	0.995605
redacted.ch/F.P.G. - 2004 - Гавнорок	12 - Думай!.flac	-9.070000	0.995605
redacted.ch/Friend or FOE	01 Angry Anthem.flac	-10.379997	1.000000
redacted.ch/Friend or FOE	02 Go To Hell.flac	-10.059998	1.000000
redacted.ch/Friend or FOE	03 My Life.flac	-8.459999	1.000000
redacted.ch/Friend or FOE	04 Dance the Night Away.flac	-9.660004	1.000000
redacted.ch/Friend or FOE	05 Vague Love Song.flac	-8.730003	1.000000
redacted.ch/Friend or FOE	06 Hey! Woo! Yea!.flac	-9.870003	1.000000
redacted.ch/Friend or FOE	07 Mistake.flac	-9.620003	1.000000
redacted.ch/Friend or FOE	08 Worst Day.flac	-9.879997	1.000000
redacted.ch/Friend or FOE	09 Maybe I'm Wrong.flac	-9.160004	1.000000
redacted.ch/Friend or FOE	10 Independent.flac	-9.110001	1.000000
redacted.ch/Friend or FOE	11 Fight.flac	-9.639999	1.000000
redacted.ch/God Is An Astronaut - All Is Violent, All Is Bright	01 - Fragile.flac	-10.680000	0.999969
redacted.ch/God Is An Astronaut - All Is Violent, All Is Bright	02 - All Is Violent, All Is Bright.flac	-10.559998	0.999969
redacted.ch/God Is An Astronaut - All Is Violent, All Is Bright	03 - Forever Lost.flac	-10.650002	0.999969
redacted.ch/God Is An Astronaut - All Is Violent, All Is Bright	04 - Fire Flies And Empty Skies.flac	-10.599998	0.999969
redacted.ch/God Is An Astronaut - All Is Violent, All Is Bright	05 - A Deafening Distance.flac	-10.769997	0.999969
redacted.ch/God Is An Astronaut - All Is Violent, All Is Bright	06 - Infinite Horizons.flac	-3.320000	0.930756
redacted.ch/God Is An Astronaut - All Is Violent, All Is Bright	07 - Suicide By Star.flac	-11.489998	0.999969
redacted.ch/God Is An Astronaut - All Is Violent, All Is Bright	08 - Remembrance Day.flac	-10.099998	0.999969
redacted.ch/God Is An Astronaut - All Is Violent, All Is Bright	09 - Dust And Echoes.flac	-10.040001	0.999969
redacted.ch/God Is An Astronaut - All Is Violent, All Is Bright	10 - When Everything Dies.flac	-9.250000	0.999969
redacted.ch/Gogol Bordello - Super Taranta! [FLAC]	01 - Ultimate.flac	-10.610001	0.999969
redacted.ch/Gogol Bordello - Super Taranta! [FLAC]	02 - Wonderlust King.flac	-9.980003	0.999969
redacted.ch/Gogol Bordello - Super Taranta! [FLAC]	03 - Zina-Marina.flac	-9.610001	0.999969
redacted.ch/Gogol Bordello - Super Taranta! [FLAC]	04 - Supertheory Of Supereverything.flac	-8.919998	0.999969
redacted.ch/Gogol Bordello - Super Taranta! [FLAC]	05 - Harem In Tuscany (Taranta).flac	-10.669998	0.999969
redacted.ch/Gogol Bordello - Super Taranta! [FLAC]	06 - Dub The Frequencies Of Love.flac	-9.370003	0.999969
redacted.ch/Gogol Bordello - Super Taranta! [FLAC]	07 - My Strange Uncles From Abroad.flac	-9.550003	0.999969
redacted.ch/Gogol Bordello - Super Taranta! [FLAC]	08 - Tribal Connection.flac	-8.410004	0.999969
redacted.ch/Gogol Bordello - Super Taranta! [FLAC]	09 - Forces Of Victory.flac	-10.919998	0.999969
redacted.ch/Gogol Bordello - Super Taranta! [FLAC]	10 - Alcohol.flac	-7.459999	0.999969
redacted.ch/Gogol Bordello - Super Taranta! [FLAC]	11 - Suddenly...(I Miss Carpaty).flac	-10.709999	0.999969
redacted.ch/Gogol Bordello - Super Taranta! [FLAC]	12 - Your Country.flac	-10.480003	0.999969
redacted.ch/Gogol Bordello - Super Taranta! [FLAC]	13 - American Wedding.flac	-11.269997	0.999969
redacted.ch/Gogol Bordello - Super Taranta! [FLAC]	14 - Super Taranta!.flac	-10.129997	0.999969
redacted.ch/Goldfinger - 2000 - Stomping Ground (FLAC)	01 - I'm Down.flac	-9.370003	0.988647
redacted.ch/Goldfinger - 2000 - Stomping Ground (FLAC)	02 - Pick A Fight.flac	-9.320000	0.988678
redacted.ch/Goldfinger - 2000 - Stomping Ground (FLAC)	03 - Carry On.flac	-10.260002	0.988678
redacted.ch/Goldfinger - 2000 - Stomping Ground (FLAC)	04 - The End Of The Day.flac	-8.449997	0.988647
redacted.ch/Goldfinger - 2000 - Stomping Ground (FLAC)	05 - Don't Say Goodbye.flac	-8.629997	0.988678
redacted.ch/Goldfinger - 2000 - Stomping Ground (FLAC)	06 - Counting The Days.flac	-8.379997	0.977325
redacted.ch/Goldfinger - 2000 - Stomping Ground (FLAC)	07 - Bro.flac	-9.029999	0.988678
redacted.ch/Goldfinger - 2000 - Stomping Ground (FLAC)	08 - San Simeon.flac	-8.870003	0.988678
redacted.ch/Goldfinger - 2000 - Stomping Ground (FLAC)	09 - You Think It's A Joke.flac	-8.790001	0.988647
redacted.ch/Goldfinger - 2000 - Stomping Ground (FLAC)	10 - Forgiveness.flac	-8.970001	0.988678
redacted.ch/Goldfinger - 2000 - Stomping Ground (FLAC)	11 - Margaret Ann.flac	-8.230003	0.988647
redacted.ch/Goldfinger - 2000 - Stomping Ground (FLAC)	12 - Get Away.flac	-8.590004	0.988617
redacted.ch/Goldfinger - 2000 - Stomping Ground (FLAC)	13 - 99 Red Balloons.flac	-7.820000	0.871033
redacted.ch/Goldfinger - 2000 - Stomping Ground (FLAC)	14 - Donut Dan.flac	-9.529999	0.988617
redacted.ch/Goldfinger - 99 Red Balloons [FLAC]	01 99 Red Balloons.flac	-7.340004	0.816650
redacted.ch/Goldfinger - 99 Red Balloons [FLAC]	02 Miles Away.flac	-6.940002	0.926788
redacted.ch/Goldfinger - 99 Red Balloons [FLAC]	03 Superman.flac	-8.410004	0.944122
redacted.ch/Goldfinger - 99 Red Balloons [FLAC]	04 Radio.flac	-8.989998	0.988678
redacted.ch/Green Day - Basket Case (CDS)	01 - Basket Case.flac	-6.040001	0.944336
redacted.ch/Green Day - Basket Case (CDS)	02 - On The Wagon (Non-LP Track).flac	1.579998	0.979126
redacted.ch/Green Day - Basket Case (CDS)	03 - Tired Of Waiting For You.flac	-1.650002	0.882538
redacted.ch/Green Day - Basket Case (CDS)	04 - 409 In Your Coffee Maker (Unmixed).flac	-4.980003	0.988922
redacted.ch/Guano Apes - Bel Air (2011) - [FLAC]	01 - Sunday Lover.flac	-10.260002	0.998749
redacted.ch/Guano Apes - Bel Air (2011) - [FLAC]	02 - Oh What a Night.flac	-11.989998	0.998749
redacted.ch/Guano Apes - Bel Air (2011) - [FLAC]	03 - When the Ships Arrive.flac	-10.309998	0.998749
redacted.ch/Guano Apes - Bel Air (2011) - [FLAC]	04 - This Time.flac	-9.989998	0.998749
redacted.ch/Guano Apes - Bel Air (2011) - [FLAC]	05 - She's a Killer.flac	-10.090004	0.986145
redacted.ch/Guano Apes - Bel Air (2011) - [FLAC]	06 - Tiger.flac	-10.889999	0.986145
redacted.ch/Guano Apes - Bel Air (2011) - [FLAC]	07 - Fanman.flac	-10.360001	0.998749
redacted.ch/Guano Apes - Bel Air (2011) - [FLAC]	08 - All I Wanna Do.flac	-10.900002	0.998749
redacted.ch/Guano Apes - Bel Air (2011) - [FLAC]	09 - Fire in Your Eyes.flac	-10.180000	0.998749
redacted.ch/Guano Apes - Bel Air (2011) - [FLAC]	10 - Trust.flac	-10.070000	0.986145
redacted.ch/Guano Apes - Proud Like A God (1997)	01 - Open Your Eyes.flac	-7.349998	0.999969
redacted.ch/Guano Apes - Proud Like A God (1997)	02 - Maria.flac	-5.190002	0.999969
redacted.ch/Guano Apes - Proud Like A God (1997)	03 - Rain.flac	-6.340004	0.999969
redacted.ch/Guano Apes - Proud Like A God (1997)	04 - Lords Of The Boards.flac	-6.989998	0.958862
redacted.ch/Guano Apes - Proud Like A God (1997)	05 - Crossing The Deadline.flac	-6.070000	0.999969
redacted.ch/Guano Apes - Proud Like A God (1997)	06 - We Use The Pain.flac	-6.980003	0.999969
redacted.ch/Guano Apes - Proud Like A God (1997)	07 - Never Born.flac	-5.720001	0.997131
redacted.ch/Guano Apes - Proud Like A God (1997)	08 - Wash It Down.flac	-6.779999	0.999969
redacted.ch/Guano Apes - Proud Like A God (1997)	09 - Scapegoat.flac	-4.190002	0.999969
redacted.ch/Guano Apes - Proud Like A God (1997)	10 - Get Busy.flac	-6.230003	0.999969
redacted.ch/Guano Apes - Proud Like A God (1997)	11 - Suzie.flac	-6.300003	0.995087
redacted.ch/Guano Apes - Proud Like A God (1997)	12 - Tribute.flac	-5.830002	0.999969
redacted.ch/Guano Apes - Proud Like A God (1997)	13 - (Empty).flac	64.820000	0.000122
redacted.ch/Guano Apes - Proud Like A God (1997)	14 - (Empty).flac	64.820000	0.000122
redacted.ch/Guano Apes - Proud Like A God (1997)	15 - (Empty).flac	64.820000	0.000122
redacted.ch/Guano Apes - Proud Like A God (1997)	16 - (Empty).flac	64.820000	0.000122
redacted.ch/Guano Apes - Proud Like A God (1997)	17 - (Empty).flac	64.820000	0.000122
redacted.ch/Guano Apes - Proud Like A God (1997)	18 - Move A Little Closer.flac	-6.110001	0.999969
redacted.ch/(hed)p.e. - 2000 - Broke - FLAC	01 - Killing Time.flac	-10.760002	1.000000
redacted.ch/(hed)p.e. - 2000 - Broke - FLAC	02 - Waiting To Die.flac	-9.660004	0.999969
redacted.ch/(hed)p.e. - 2000 - Broke - FLAC	03 - Feel Good.flac	-9.949997	0.999969
redacted.ch/(hed)p.e. - 2000 - Broke - FLAC	04 - Bartender.flac	-10.750000	0.999969
redacted.ch/(hed)p.e. - 2000 - Broke - FLAC	05 - Crazy Legs.flac	-10.129997	0.999969
redacted.ch/(hed)p.e. - 2000 - Broke - FLAC	06 - Pac Bell.flac	-9.590004	0.999969
redacted.ch/(hed)p.e. - 2000 - Broke - FLAC	07 - I Got You.flac	-10.769997	1.000000
redacted.ch/(hed)p.e. - 2000 - Broke - FLAC	08 - Boom (How You Like That).flac	-10.379997	0.999969
redacted.ch/(hed)p.e. - 2000 - Broke - FLAC	09 - Swan Dive.flac	-10.260002	0.999969
redacted.ch/(hed)p.e. - 2000 - Broke - FLAC	10 - Stevie.flac	-10.699997	0.999969
redacted.ch/(hed)p.e. - 2000 - Broke - FLAC	11 - Jesus (Of Nazareth).flac	-11.910004	0.999969
redacted.ch/(hed)p.e. - 2000 - Broke - FLAC	12 - The Meadow.flac	-6.090004	1.000000
redacted.ch/Hiromi - Alive (2014) [FLAC]	01 - Alive.flac	-5.250000	0.975922
redacted.ch/Hiromi - Alive (2014) [FLAC]	02 - Wanderer.flac	-3.440002	0.975769
redacted.ch/Hiromi - Alive (2014) [FLAC]	03 - Dreamer.flac	-3.500000	0.972290
redacted.ch/Hiromi - Alive (2014) [FLAC]	04 - Seeker.flac	-4.800003	0.975769
redacted.ch/Hiromi - Alive (2014) [FLAC]	05 - Player.flac	-5.720001	0.975952
redacted.ch/Hiromi - Alive (2014) [FLAC]	06 - Warrior.flac	-4.720001	0.975769
redacted.ch/Hiromi - Alive (2014) [FLAC]	07 - Firefly.flac	1.290001	0.831787
redacted.ch/Hiromi - Alive (2014) [FLAC]	08 - Spirit.flac	-4.010002	0.975739
redacted.ch/Hiromi - Alive (2014) [FLAC]	09 - Life Goes On.flac	-6.410004	0.975769
redacted.ch/Horrorpops - 2005 - Bring It On!	01 - Freaks In Uniforms.flac	-10.000000	0.966187
redacted.ch/Horrorpops - 2005 - Bring It On!	02 - Hit 'N' Run.flac	-9.849998	0.972260
redacted.ch/Horrorpops - 2005 - Bring It On!	03 - Bring It On!.flac	-9.559998	0.966187
redacted.ch/Horrorpops - 2005 - Bring It On!	04 - It's Been So Long.flac	-9.940002	0.966187
redacted.ch/Horrorpops - 2005 - Bring It On!	05 - Undefeated.flac	-10.180000	0.966187
redacted.ch/Horrorpops - 2005 - Bring It On!	06 - You vs. Me.flac	-10.120003	0.966217
redacted.ch/Horrorpops - 2005 - Bring It On!	07 - Crawl Straight Home.flac	-9.779999	0.966187
redacted.ch/Horrorpops - 2005 - Bring It On!	08 - Trapped.flac	-9.690002	0.966187
redacted.ch/Horrorpops - 2005 - Bring It On!	09 - Walk Like A Zombie.flac	-9.779999	0.966187
redacted.ch/Horrorpops - 2005 - Bring It On!	10 - Where You Can't Follow.flac	-11.070000	0.966187
redacted.ch/Horrorpops - 2005 - Bring It On!	11 - Caught In A Blond.flac	-10.540001	0.966248
redacted.ch/Horrorpops - 2005 - Bring It On!	12 - S.O.B..flac	-8.930000	0.966217
redacted.ch/Horrorpops - 2005 - Bring It On!	13 - Who's Leading You Now.flac	-10.559998	0.966187
redacted.ch/Horrorpops - Hell Yeah! - lossless	01 - Horrorpops - Julia.flac	-9.680000	0.912140
redacted.ch/Horrorpops - Hell Yeah! - lossless	02 - Horrorpops - Drama Queen.flac	-9.169998	1.000000
redacted.ch/Horrorpops - Hell Yeah! - lossless	03 - Horrorpops - Ghouls.flac	-8.680000	0.922729
redacted.ch/Horrorpops - Hell Yeah! - lossless	04 - Horrorpops - Girl In A Cage.flac	-7.660004	0.912140
redacted.ch/Horrorpops - Hell Yeah! - lossless	05 - Horrorpops - Miss Take.flac	-9.599998	0.988647
redacted.ch/Horrorpops - Hell Yeah! - lossless	06 - Horrorpops - Where They Wander.flac	-7.980003	0.988647
redacted.ch/Horrorpops - Hell Yeah! - lossless	07 - Horrorpops - Kool Flattop.flac	-8.540001	0.955109
redacted.ch/Horrorpops - Hell Yeah! - lossless	08 - Horrorpops - Psychobitches Outta Hell.flac	-9.400002	0.988647
redacted.ch/Horrorpops - Hell Yeah! - lossless	09 - Horrorpops - Dotted With Hearts.flac	-7.699997	0.901733
redacted.ch/Horrorpops - Hell Yeah! - lossless	10 - Horrorpops - Baby Lou Tattoo.flac	-9.430000	0.891388
redacted.ch/Horrorpops - Hell Yeah! - lossless	11 - Horrorpops - What's Under My Bed.flac	-8.849998	0.988617
redacted.ch/Horrorpops - Hell Yeah! - lossless	12 - Horrorpops - Emotional Abuse.flac	-7.400002	0.966125
redacted.ch/Horrorpops - Hell Yeah! - lossless	13 - Horrorpops - Horrorbeach.flac	-8.529999	1.000000
redacted.ch/How It Goes	01 - Big D And The Kids Table - The Sounds Of Allston Village.flac	-10.389999	1.000000
redacted.ch/How It Goes	02 - Big D And The Kids Table - LAX.flac	-12.529999	1.000000
redacted.ch/How It Goes	03 - Big D And The Kids Table - New Nail Bed.flac	-13.279999	1.000000
redacted.ch/How It Goes	04 - Big D And The Kids Table - If We Want To.flac	-12.550003	1.000000
redacted.ch/How It Goes	05 - Big D And The Kids Table - Flashlight.flac	-12.889999	1.000000
redacted.ch/How It Goes	06 - Big D And The Kids Table - Girls Against Drunk Bitches.flac	-12.389999	1.000000
redacted.ch/How It Goes	07 - Big D And The Kids Table - You Lost, You're Crazy.flac	-12.389999	1.000000
redacted.ch/How It Goes	08 - Big D And The Kids Table - Bender.flac	-13.010002	1.000000
redacted.ch/How It Goes	09 - Big D And The Kids Table - Safe Haven.flac	-11.169998	1.000000
redacted.ch/How It Goes	10 - Big D And The Kids Table - You're Me Now.flac	-12.559998	1.000000
redacted.ch/How It Goes	11 - Big D And The Kids Table - Voice Alone.flac	-12.470001	1.000000
redacted.ch/How It Goes	12 - Big D And The Kids Table - My Girlfriend's On Drugs.flac	-12.500000	1.000000
redacted.ch/How It Goes	13 - Big D And The Kids Table - President.flac	-13.199997	1.000000
redacted.ch/How It Goes	14 - Big D And The Kids Table - Cutshow.flac	-11.620003	1.000000
redacted.ch/How It Goes	15 - Big D And The Kids Table - Little Bitch.flac	-12.709999	1.000000
redacted.ch/How It Goes	16 - Big D And The Kids Table - (We All Have To) Burn Something.flac	-11.180000	1.000000
redacted.ch/How It Goes	17 - Big D And The Kids Table - 175.flac	-12.110001	1.000000
redacted.ch/How It Goes	18 - Big D And The Kids Table - Chicago.flac	-11.709999	1.000000
redacted.ch/How It Goes	19 - Big D And The Kids Table - How It Goes.flac	-9.970001	1.000000
redacted.ch/How It Goes	20 - Big D And The Kids Table - Moment Without An End.flac	-12.309998	1.000000
redacted.ch/Ignite - Our Darkest Days - 2006 (CD - FLAC - Lossless)	01 - Intro (Our Darkest Days).flac	-8.919998	0.988617
redacted.ch/Ignite - Our Darkest Days - 2006 (CD - FLAC - Lossless)	02 - Bleeding.flac	-9.379997	0.988647
redacted.ch/Ignite - Our Darkest Days - 2006 (CD - FLAC - Lossless)	03 - Fear Is Our Tradition.flac	-9.150002	0.988617
redacted.ch/Ignite - Our Darkest Days - 2006 (CD - FLAC - Lossless)	04 - Let It Burn.flac	-8.769997	0.988617
redacted.ch/Ignite - Our Darkest Days - 2006 (CD - FLAC - Lossless)	05 - Poverty For All.flac	-8.500000	0.988617
redacted.ch/Ignite - Our Darkest Days - 2006 (CD - FLAC - Lossless)	06 - My Judgment Day.flac	-8.849998	0.988647
redacted.ch/Ignite - Our Darkest Days - 2006 (CD - FLAC - Lossless)	07 - Slowdown.flac	-8.959999	0.988617
redacted.ch/Ignite - Our Darkest Days - 2006 (CD - FLAC - Lossless)	08 - Save Yourself.flac	-8.980003	0.988647
redacted.ch/Ignite - Our Darkest Days - 2006 (CD - FLAC - Lossless)	09 - Are You Listening.flac	-8.550003	0.988617
redacted.ch/Ignite - Our Darkest Days - 2006 (CD - FLAC - Lossless)	10 - Three Years.flac	-9.470001	0.988617
redacted.ch/Ignite - Our Darkest Days - 2006 (CD - FLAC - Lossless)	11 - Know Your History.flac	-9.590004	0.988647
redacted.ch/Ignite - Our Darkest Days - 2006 (CD - FLAC - Lossless)	12 - Strength.flac	-9.389999	0.988617
redacted.ch/Ignite - Our Darkest Days - 2006 (CD - FLAC - Lossless)	13 - Sunday Bloody Sunday.flac	-9.309998	0.988617
redacted.ch/Ignite - Our Darkest Days - 2006 (CD - FLAC - Lossless)	14 - Live For Better Days.flac	-8.199997	0.988617
redacted.ch/Imperial Leisure - 2012 - Death To The One Trick Pony[FLAC]	01 - Imperial Leisure - Clown At The Funeral.flac	-5.400002	0.966156
redacted.ch/Imperial Leisure - 2012 - Death To The One Trick Pony[FLAC]	02 - Imperial Leisure - Number One.flac	-5.720001	0.966156
redacted.ch/Imperial Leisure - 2012 - Death To The One Trick Pony[FLAC]	03 - Imperial Leisure - Dance Floor.flac	-6.070000	0.966187
redacted.ch/Imperial Leisure - 2012 - Death To The One Trick Pony[FLAC]	04 - Imperial Leisure - Can't Lie.flac	-6.269997	0.966187
redacted.ch/Imperial Leisure - 2012 - Death To The One Trick Pony[FLAC]	05 - Imperial Leisure - All In Good Time.flac	-5.639999	0.966187
redacted.ch/Imperial Leisure - 2012 - Death To The One Trick Pony[FLAC]	06 - Imperial Leisure - Dead Model.flac	-6.419998	0.966187
redacted.ch/Imperial Leisure - 2012 - Death To The One Trick Pony[FLAC]	07 - Imperial Leisure - Thin Line.flac	-6.199997	0.966187
redacted.ch/Imperial Leisure - 2012 - Death To The One Trick Pony[FLAC]	08 - Imperial Leisure - I Thought They'd Love You.flac	-4.099998	0.966156
redacted.ch/Imperial Leisure - 2012 - Death To The One Trick Pony[FLAC]	09 - Imperial Leisure - Bitter And Twisted.flac	-5.540001	0.966187
redacted.ch/Imperial Leisure - 2012 - Death To The One Trick Pony[FLAC]	10 - Imperial Leisure - London To Brighton.flac	-6.169998	0.966187
redacted.ch/Imperial Leisure - 2012 - Death To The One Trick Pony[FLAC]	11 - Imperial Leisure - Talk To Me.flac	-6.059998	0.966187
redacted.ch/Imperial Leisure - 2012 - Death To The One Trick Pony[FLAC]	12 - Imperial Leisure - Saturday Night.flac	-7.750000	0.966217
redacted.ch/Imperial Leisure - 2012 - Death To The One Trick Pony[FLAC]	13 - Imperial Leisure - Truth Hurts.flac	-5.519997	0.966187
redacted.ch/Imperial Leisure - 2012 - Death To The One Trick Pony[FLAC]	14 - Imperial Leisure - Song For Paul.flac	-4.849998	0.966156
redacted.ch/Infected Rain - Embrace Eternity (2014)	01 Falling Through Time.flac	-1.559998	0.975250
redacted.ch/Infected Rain - Embrace Eternity (2014)	02 Hysterical Watches.flac	-10.000000	1.000000
redacted.ch/Infected Rain - Embrace Eternity (2014)	03 Dancing Alone.flac	-10.230003	1.000000
redacted.ch/Infected Rain - Embrace Eternity (2014)	04 Count To Three.flac	-10.559998	1.000000
redacted.ch/Infected Rain - Embrace Eternity (2014)	05 Stop Waiting.flac	-10.129997	1.000000
redacted.ch/Infected Rain - Embrace Eternity (2014)	06 Pretending To Be Happy.flac	-9.750000	1.000000
redacted.ch/Infected Rain - Embrace Eternity (2014)	07 Enslaved By A Dream.flac	-10.120003	1.000000
redacted.ch/Infected Rain - Embrace Eternity (2014)	08 Nothing Left.flac	-3.529999	0.993195
redacted.ch/Infected Rain - Embrace Eternity (2014)	09 Silent Movie.flac	-9.620003	1.000000
redacted.ch/Infected Rain - Embrace Eternity (2014)	10 Perfectly Shining.flac	-9.790001	1.000000
redacted.ch/Infected Rain - Embrace Eternity (2014)	11 My Cage.flac	-10.269997	1.000000
redacted.ch/Infected Rain - Embrace Eternity (2014)	12 Lullaby.flac	-10.209999	1.000000
redacted.ch/Infected Rain - Embrace Eternity (2014)	13 Sweet, Sweet Lies.flac	-10.779999	1.000000
redacted.ch/Infected Rain - Embrace Eternity (2014)	14 Dancing Alone (acoustic).flac	-6.989998	1.000000
redacted.ch/Inner Circle-Bad Boys [FLAC]	01-Sweat (A La La La La Long).flac	-5.900002	0.972870
redacted.ch/Inner Circle-Bad Boys [FLAC]	02-Bad Boys - (Theme From Cops).flac	-6.400002	0.950745
redacted.ch/Inner Circle-Bad Boys [FLAC]	03-Rock With You.flac	-6.160004	0.950745
redacted.ch/Inner Circle-Bad Boys [FLAC]	04-Wrapped Up In Your Love.flac	-2.750000	0.967529
redacted.ch/Inner Circle-Bad Boys [FLAC]	05-Looking For A Better Way.flac	-6.340004	0.972870
redacted.ch/Inner Circle-Bad Boys [FLAC]	06-Sunglasses At Night.flac	-3.989998	0.972870
redacted.ch/Inner Circle-Bad Boys [FLAC]	07-Living It Up.flac	-4.529999	0.950745
redacted.ch/Inner Circle-Bad Boys [FLAC]	08-Hey Love.flac	-4.360001	0.945526
redacted.ch/Inner Circle-Bad Boys [FLAC]	09-Bad To The Bone.flac	-5.269997	0.875031
redacted.ch/Inner Circle-Bad Boys [FLAC]	10-Down By The River.flac	-5.029999	0.950745
redacted.ch/Inner Circle-Bad Boys [FLAC]	11-Slow It Down.flac	-3.190002	0.950684
redacted.ch/Inner Circle-Bad Boys [FLAC]	12-Sweat (A La La La La Long) - (Dancehall Mix).flac	-5.660004	0.962189
redacted.ch/Inner Circle-Bad Boys [FLAC]	13-Tear Down These Walls.flac	-4.970001	0.950745
redacted.ch/Inner Circle-Bad Boys [FLAC]	14-Bad Boys - (David Morales Mix).flac	-4.510002	0.950745
redacted.ch/Irie Révoltés - Allez [FLAC] {2013}	01 - Allez!.flac	-10.239998	0.988129
redacted.ch/Irie Révoltés - Allez [FLAC] {2013}	02 - La Réalité.flac	-7.860001	0.988129
redacted.ch/Irie Révoltés - Allez [FLAC] {2013}	03 - Citoyen Du Monde.flac	-10.430000	0.988129
redacted.ch/Irie Révoltés - Allez [FLAC] {2013}	04 - La Marche.flac	-7.739998	0.988129
redacted.ch/Irie Révoltés - Allez [FLAC] {2013}	05 - Continuer.flac	-9.050003	0.988129
redacted.ch/Irie Révoltés - Allez [FLAC] {2013}	06 - Résisdanse.flac	-6.529999	0.988129
redacted.ch/Irie Révoltés - Allez [FLAC] {2013}	07 - Tout Casser.flac	-11.010002	0.988129
redacted.ch/Irie Révoltés - Allez [FLAC] {2013}	08 - Ensemble.flac	-9.480003	0.988129
redacted.ch/Irie Révoltés - Allez [FLAC] {2013}	09 - La Prix!.flac	-8.180000	0.988129
redacted.ch/Irie Révoltés - Allez [FLAC] {2013}	10 - Make Some Noise.flac	-7.480003	0.988129
redacted.ch/Irie Révoltés - Allez [FLAC] {2013}	11 - Partout.flac	-10.139999	0.988129
redacted.ch/Irie Révoltés - Allez [FLAC] {2013}	12 - Une Nouvelle Journée.flac	-9.510002	0.988129
redacted.ch/Iron Maiden (1986) - Somewhere In Time [FLAC]	01 - Caught Somewhere In Time.flac	-3.860001	0.999908
redacted.ch/Iron Maiden (1986) - Somewhere In Time [FLAC]	02 - Wasted Years.flac	-3.540001	1.000000
redacted.ch/Iron Maiden (1986) - Somewhere In Time [FLAC]	03 - Sea Of Madness.flac	-2.760002	0.923523
redacted.ch/Iron Maiden (1986) - Somewhere In Time [FLAC]	04 - Heaven Can Wait.flac	-1.709999	0.820679
redacted.ch/Iron Maiden (1986) - Somewhere In Time [FLAC]	05 - The Loneliness Of The Long Distance Runner.flac	-3.760002	0.978943
redacted.ch/Iron Maiden (1986) - Somewhere In Time [FLAC]	06 - Stranger In A Strange Land.flac	-3.129997	0.999969
redacted.ch/Iron Maiden (1986) - Somewhere In Time [FLAC]	07 - Deja-Vu.flac	-3.400002	0.998413
redacted.ch/Iron Maiden (1986) - Somewhere In Time [FLAC]	08 - Alexander The Great.flac	-3.029999	0.963684
redacted.ch/Iron Maiden (1992) - Fear Of The Dark [FLAC]	01 - Be Quick Or Be Dead.flac	-5.910004	0.927917
redacted.ch/Iron Maiden (1992) - Fear Of The Dark [FLAC]	02 - From Here To Eternity.flac	-6.529999	0.928436
redacted.ch/Iron Maiden (1992) - Fear Of The Dark [FLAC]	03 - Afraid To Shoot Strangers.flac	-5.720001	0.929169
redacted.ch/Iron Maiden (1992) - Fear Of The Dark [FLAC]	04 - Fear Is The Key.flac	-5.489998	0.927460
redacted.ch/Iron Maiden (1992) - Fear Of The Dark [FLAC]	05 - Childhood's End.flac	-5.389999	0.931061
redacted.ch/Iron Maiden (1992) - Fear Of The Dark [FLAC]	06 - Wasting Love.flac	-4.360001	0.927612
redacted.ch/Iron Maiden (1992) - Fear Of The Dark [FLAC]	07 - The Fugitive.flac	-4.660004	0.928467
redacted.ch/Iron Maiden (1992) - Fear Of The Dark [FLAC]	08 - Chains Of Misery.flac	-5.389999	0.927368
redacted.ch/Iron Maiden (1992) - Fear Of The Dark [FLAC]	09 - The Apparition.flac	-4.989998	0.928436
redacted.ch/Iron Maiden (1992) - Fear Of The Dark [FLAC]	10 - Judas Be My Guide.flac	-5.690002	0.927460
redacted.ch/Iron Maiden (1992) - Fear Of The Dark [FLAC]	11 - Weekend Warrior.flac	-4.989998	0.928223
redacted.ch/Iron Maiden (1992) - Fear Of The Dark [FLAC]	12 - Fear Of The Dark.flac	-4.919998	0.927460
redacted.ch/Iron Maiden - Iron Maiden (1980)	01 - Prowler.flac	-5.660004	0.977234
redacted.ch/Iron Maiden - Iron Maiden (1980)	02 - Remember Tomorrow.flac	-5.690002	0.977234
redacted.ch/Iron Maiden - Iron Maiden (1980)	03 - Running Free.flac	-6.970001	0.977234
redacted.ch/Iron Maiden - Iron Maiden (1980)	04 - Phantom Of The Opera.flac	-5.709999	0.977234
redacted.ch/Iron Maiden - Iron Maiden (1980)	05 - Transylvania.flac	-7.750000	0.977234
redacted.ch/Iron Maiden - Iron Maiden (1980)	06 - Strange World.flac	-4.070000	0.977234
redacted.ch/Iron Maiden - Iron Maiden (1980)	07 - Charlotte The Harlot.flac	-6.660004	0.977234
redacted.ch/Iron Maiden - Iron Maiden (1980)	08 - Iron Maiden.flac	-7.250000	0.977234
redacted.ch/Izia - 2011 - So Much Trouble [FLAC]	01-Izia-Baby.flac	-10.959999	1.000000
redacted.ch/Izia - 2011 - So Much Trouble [FLAC]	02-Izia-So Much Trouble.flac	-11.590004	1.000000
redacted.ch/Izia - 2011 - So Much Trouble [FLAC]	03-Izia-Your Love Is A Gift.flac	-11.389999	1.000000
redacted.ch/Izia - 2011 - So Much Trouble [FLAC]	04-Izia-I Can Dance.flac	-10.910004	1.000000
redacted.ch/Izia - 2011 - So Much Trouble [FLAC]	05-Izia-On The Top Of The World.flac	-10.209999	1.000000
redacted.ch/Izia - 2011 - So Much Trouble [FLAC]	06-Izia-Penicilline.flac	-11.180000	1.000000
redacted.ch/Izia - 2011 - So Much Trouble [FLAC]	07-Izia-Twenty Times A Day.flac	-10.059998	1.000000
redacted.ch/Izia - 2011 - So Much Trouble [FLAC]	08-Izia-That Night.flac	-10.349998	1.000000
redacted.ch/Izia - 2011 - So Much Trouble [FLAC]	09-Izia-She.flac	-10.370003	1.000000
redacted.ch/Izia - 2011 - So Much Trouble [FLAC]	10-Izia-I Hate You.flac	-11.410004	1.000000
redacted.ch/Jaya The Cat - 2012 - The New International Sound Of Hedonism[FLAC]	01 - Jaya The Cat - Rebel Sound.flac	-8.800003	0.995575
redacted.ch/Jaya The Cat - 2012 - The New International Sound Of Hedonism[FLAC]	02 - Jaya The Cat - Late Night Sonic Insurrection.flac	-8.110001	0.996429
redacted.ch/Jaya The Cat - 2012 - The New International Sound Of Hedonism[FLAC]	03 - Jaya The Cat - Here Come The Drums.flac	-7.480003	0.994934
redacted.ch/Jaya The Cat - 2012 - The New International Sound Of Hedonism[FLAC]	04 - Jaya The Cat - Bos En Lommerweg.flac	-8.739998	0.889557
redacted.ch/Jaya The Cat - 2012 - The New International Sound Of Hedonism[FLAC]	05 - Jaya The Cat - Unconditional Love.flac	-7.620003	0.995941
redacted.ch/Jaya The Cat - 2012 - The New International Sound Of Hedonism[FLAC]	06 - Jaya The Cat - Put A Boombox On My Grave.flac	-8.709999	0.995941
redacted.ch/Jaya The Cat - 2012 - The New International Sound Of Hedonism[FLAC]	07 - Jaya The Cat - One Way Ticket Home.flac	-6.220001	1.000000
redacted.ch/Jaya The Cat - 2012 - The New International Sound Of Hedonism[FLAC]	08 - Jaya The Cat - Thessaloniki.flac	-9.190002	0.889557
redacted.ch/Jaya The Cat - 2012 - The New International Sound Of Hedonism[FLAC]	09 - Jaya The Cat - Peace And Love.flac	-8.559998	0.994781
redacted.ch/Jaya The Cat - 2012 - The New International Sound Of Hedonism[FLAC]	10 - Jaya The Cat - Fake Carreras.flac	-9.449997	0.994324
redacted.ch/Jaya The Cat - 2012 - The New International Sound Of Hedonism[FLAC]	11 - Jaya The Cat - Two Ships Passing.flac	-8.519997	0.994720
redacted.ch/Jaya The Cat - 2012 - The New International Sound Of Hedonism[FLAC]	12 - Jaya The Cat - Date With A Needle.flac	-9.139999	0.994293
redacted.ch/Jaya The Cat - 2012 - The New International Sound Of Hedonism[FLAC]	13 - Jaya The Cat - This Could All Go So Horribly Wrong.flac	-8.650002	0.994324
redacted.ch/Jaya The Cat - 2012 - The New International Sound Of Hedonism[FLAC]	14 - Jaya The Cat - Thank You.flac	-7.809998	0.994354
redacted.ch/Jaya The Cat - 2012 - The New International Sound Of Hedonism[FLAC]	15 - Jaya The Cat - Wayne É.flac	1.759998	0.374786
redacted.ch/Jaya The Cat - More Late Night Transmissions With (2007) [FLAC]	01 - Hold My Beer And Watch This.flac	-4.849998	0.999847
redacted.ch/Jaya The Cat - More Late Night Transmissions With (2007) [FLAC]	02 - Blur.flac	-6.910004	0.999939
redacted.ch/Jaya The Cat - More Late Night Transmissions With (2007) [FLAC]	03 - Good Morning.flac	-6.750000	1.000000
redacted.ch/Jaya The Cat - More Late Night Transmissions With (2007) [FLAC]	04 - Thank You Reggae.flac	-6.660004	0.999969
redacted.ch/Jaya The Cat - More Late Night Transmissions With (2007) [FLAC]	05 - Hello Hangover.flac	-6.459999	0.999939
redacted.ch/Jaya The Cat - More Late Night Transmissions With (2007) [FLAC]	06 - Mistake.flac	-8.019997	0.999969
redacted.ch/Jaya The Cat - More Late Night Transmissions With (2007) [FLAC]	07 - Chemical Salvation.flac	-6.840004	0.997681
redacted.ch/Jaya The Cat - More Late Night Transmissions With (2007) [FLAC]	08 - Pass The Ammunition.flac	-6.190002	1.000000
redacted.ch/Jaya The Cat - More Late Night Transmissions With (2007) [FLAC]	09 - Night Bus.flac	-6.540001	0.994995
redacted.ch/Jaya The Cat - More Late Night Transmissions With (2007) [FLAC]	10 - Carnival.flac	-8.000000	0.999939
redacted.ch/Jaya The Cat - More Late Night Transmissions With (2007) [FLAC]	11 - Voice Of The Poor.flac	-7.790001	0.999969
redacted.ch/Jaya The Cat - More Late Night Transmissions With (2007) [FLAC]	12 - Government Center.flac	-7.660004	0.998077
redacted.ch/Jaya The Cat - More Late Night Transmissions With (2007) [FLAC]	13 - Closing Time.flac	-6.779999	0.999329
redacted.ch/Jefferson Airplane - Surrealistic Pillow	01 - She Has Funny Cars.flac	-5.889999	0.883789
redacted.ch/Jefferson Airplane - Surrealistic Pillow	02 - Somebody To Love.flac	-6.040001	0.798767
redacted.ch/Jefferson Airplane - Surrealistic Pillow	03 - My Best Friend.flac	-6.290001	1.000000
redacted.ch/Jefferson Airplane - Surrealistic Pillow	04 - Today.flac	-4.139999	1.000000
redacted.ch/Jefferson Airplane - Surrealistic Pillow	05 - Comin' Back To Me.flac	1.739998	0.677979
redacted.ch/Jefferson Airplane - Surrealistic Pillow	06 - 3-5 Of A Mile In 10 Seconds.flac	-7.349998	0.994324
redacted.ch/Jefferson Airplane - Surrealistic Pillow	07 - D.C.B.A. - 25.flac	-5.580002	1.000000
redacted.ch/Jefferson Airplane - Surrealistic Pillow	08 - How Do You Feel.flac	-5.309998	1.000000
redacted.ch/Jefferson Airplane - Surrealistic Pillow	09 - Embryonic Journey.flac	-2.739998	0.998657
redacted.ch/Jefferson Airplane - Surrealistic Pillow	10 - White Rabbit.flac	-4.730003	1.000000
redacted.ch/Jefferson Airplane - Surrealistic Pillow	11 - Plastic Fantastic Lover.flac	-4.970001	1.000000
redacted.ch/Jefferson Airplane - Surrealistic Pillow	12 - In The Morning.flac	-4.260002	0.882446
redacted.ch/Jefferson Airplane - Surrealistic Pillow	13 - J.P.P.McStep B. Blues.flac	-4.370003	0.952606
redacted.ch/Jefferson Airplane - Surrealistic Pillow	14 - Go To Her [Version Two].flac	-6.510002	0.942474
redacted.ch/Jefferson Airplane - Surrealistic Pillow	15 - Come Back Baby.flac	-5.230003	1.000000
redacted.ch/Jefferson Airplane - Surrealistic Pillow	16 - Somebody To Love [Mono Single Version].flac	-7.080002	0.861145
redacted.ch/Jefferson Airplane - Surrealistic Pillow	17 - White Rabbit [Mono Single Version].flac	-5.550003	1.000000
redacted.ch/Joe Satriani  - Surfing With The Alien (MFSL - UDCD-751)	01 - Joe Satriani - Surfing With The Alien.flac	-4.139999	1.000000
redacted.ch/Joe Satriani  - Surfing With The Alien (MFSL - UDCD-751)	02 - Joe Satriani - Ice 9.flac	-3.900002	1.000000
redacted.ch/Joe Satriani  - Surfing With The Alien (MFSL - UDCD-751)	03 - Joe Satriani - Crushing Day.flac	-4.889999	1.000000
redacted.ch/Joe Satriani  - Surfing With The Alien (MFSL - UDCD-751)	04 - Joe Satriani - Always With Me, Always With You.flac	-4.639999	1.000000
redacted.ch/Joe Satriani  - Surfing With The Alien (MFSL - UDCD-751)	05 - Joe Satriani - Satch Boogie.flac	-3.019997	1.000000
redacted.ch/Joe Satriani  - Surfing With The Alien (MFSL - UDCD-751)	06 - Joe Satriani - Hill Of The Skull.flac	-2.750000	1.000000
redacted.ch/Joe Satriani  - Surfing With The Alien (MFSL - UDCD-751)	07 - Joe Satriani - Circles.flac	-1.660004	1.000000
redacted.ch/Joe Satriani  - Surfing With The Alien (MFSL - UDCD-751)	08 - Joe Satriani - Lords Of Karma.flac	-4.709999	1.000000
redacted.ch/Joe Satriani  - Surfing With The Alien (MFSL - UDCD-751)	09 - Joe Satriani - Midnight.flac	-3.199997	0.963928
redacted.ch/Joe Satriani  - Surfing With The Alien (MFSL - UDCD-751)	10 - Joe Satriani - Echo.flac	-3.840004	1.000000
redacted.ch/King Blues - Save The World, Get The Girl	01 My Boulder.flac	-11.459999	1.000000
redacted.ch/King Blues - Save The World, Get The Girl	02 I Got Love.flac	-8.580002	0.999969
redacted.ch/King Blues - Save The World, Get The Girl	03 The Schemers, The Scroungers, And The Rats.flac	-9.230003	0.999969
redacted.ch/King Blues - Save The World, Get The Girl	04 Underneath This Lamppost Light.flac	-8.290001	0.999908
redacted.ch/King Blues - Save The World, Get The Girl	05 Save The World, Get The Girl.flac	-8.730003	1.000000
redacted.ch/King Blues - Save The World, Get The Girl	06 For You My Darling.flac	-9.570000	0.988831
redacted.ch/King Blues - Save The World, Get The Girl	07 The Streets Are Ours.flac	-8.160004	1.000000
redacted.ch/King Blues - Save The World, Get The Girl	08 Let's Hang The Landlord.flac	-12.519997	1.000000
redacted.ch/King Blues - Save The World, Get The Girl	09 Out Of Luck.flac	-7.779999	0.999969
redacted.ch/King Blues - Save The World, Get The Girl	10 Hold On Tight.flac	-7.639999	0.999969
redacted.ch/King Blues - Save The World, Get The Girl	11 What If Punk Never Happened.flac	-7.459999	1.000000
redacted.ch/King Prawn - 2003 - Got The Thirst [FLAC]	01 - Bring Down The House.flac	-9.239998	0.988586
redacted.ch/King Prawn - 2003 - Got The Thirst [FLAC]	02 - The Dominant View.flac	-8.570000	0.988556
redacted.ch/King Prawn - 2003 - Got The Thirst [FLAC]	03 - Caught Inna Rut.flac	-8.599998	0.988586
redacted.ch/King Prawn - 2003 - Got The Thirst [FLAC]	04 - Smoke Some Shit.flac	-9.199997	0.988586
redacted.ch/King Prawn - 2003 - Got The Thirst [FLAC]	05 - The Loneiest Life.flac	-8.260002	0.988586
redacted.ch/King Prawn - 2003 - Got The Thirst [FLAC]	06 - Hell Below.flac	-8.180000	0.988556
redacted.ch/King Prawn - 2003 - Got The Thirst [FLAC]	07 - Bitter Taste.flac	-8.629997	0.988556
redacted.ch/King Prawn - 2003 - Got The Thirst [FLAC]	08 - Raise The Banner.flac	-8.790001	0.988586
redacted.ch/King Prawn - 2003 - Got The Thirst [FLAC]	09 - Lick Of The Flame.flac	-9.620003	0.988586
redacted.ch/King Prawn - 2003 - Got The Thirst [FLAC]	10 - Gather Round.flac	-7.480003	0.988556
redacted.ch/King Prawn - 2003 - Got The Thirst [FLAC]	11 - Satan's Folly.flac	-8.459999	0.988556
redacted.ch/King Prawn - 2003 - Got The Thirst [FLAC]	12 - Another Great Escape.flac	-8.300003	0.988556
redacted.ch/King Prawn - 2003 - Got The Thirst [FLAC]	13 - Viva Devi.flac	-7.639999	0.989319
redacted.ch/King Prawn - 2003 - Got The Thirst [FLAC]	14 - If Dawn Comes... We Ride.flac	-6.940002	0.988586
redacted.ch/Kittie - Brackish (2000) [FLAC] {ATM 668952 2}	01 - Brackish.flac	-9.660004	0.998718
redacted.ch/Kittie - Brackish (2000) [FLAC] {ATM 668952 2}	02 - Da Shit You Can't Fuc Wit.flac	-8.120003	0.998718
redacted.ch/Kittie - Brackish (2000) [FLAC] {ATM 668952 2}	03 - Charlotte (Alternate Mellow Version).flac	-7.940002	0.998718
redacted.ch/KMFDM - Symbols	01 - Megalomaniac.flac	-7.879997	0.980560
redacted.ch/KMFDM - Symbols	02 - Stray Bullet.flac	-7.250000	0.980530
redacted.ch/KMFDM - Symbols	03 - Leid Und Elend.flac	-7.879997	0.980286
redacted.ch/KMFDM - Symbols	04 - Mercy.flac	-8.739998	0.981171
redacted.ch/KMFDM - Symbols	05 - Torture.flac	-8.120003	0.981689
redacted.ch/KMFDM - Symbols	06 - Spit Sperm.flac	-9.010002	0.982147
redacted.ch/KMFDM - Symbols	07 - Anarchy.flac	-8.720001	0.980255
redacted.ch/KMFDM - Symbols	08 - Down And Out.flac	-7.500000	0.980591
redacted.ch/KMFDM - Symbols	09 - Unfit.flac	-7.430000	0.982880
redacted.ch/KMFDM - Symbols	10 - Waste.flac	-8.730003	0.980255
redacted.ch/Korn - Follow The Leader	01 - (Untitled).flac	64.820000	0.000000
redacted.ch/Korn - Follow The Leader	02 - (Untitled).flac	64.820000	0.000000
redacted.ch/Korn - Follow The Leader	03 - (Untitled).flac	64.820000	0.000000
redacted.ch/Korn - Follow The Leader	04 - (Untitled).flac	64.820000	0.000000
redacted.ch/Korn - Follow The Leader	05 - (Untitled).flac	64.820000	0.000000
redacted.ch/Korn - Follow The Leader	06 - (Untitled).flac	64.820000	0.000000
redacted.ch/Korn - Follow The Leader	07 - (Untitled).flac	64.820000	0.000000
redacted.ch/Korn - Follow The Leader	08 - (Untitled).flac	64.820000	0.000000
redacted.ch/Korn - Follow The Leader	09 - (Untitled).flac	64.820000	0.000000
redacted.ch/Korn - Follow The Leader	10 - (Untitled).flac	64.820000	0.000000
redacted.ch/Korn - Follow The Leader	11 - (Untitled).flac	64.820000	0.000000
redacted.ch/Korn - Follow The Leader	12 - (Untitled).flac	64.820000	0.000000
redacted.ch/Korn - Follow The Leader	13 - It's On!.flac	-7.320000	0.988556
redacted.ch/Korn - Follow The Leader	14 - Freak On A Leash.flac	-7.820000	0.944061
redacted.ch/Korn - Follow The Leader	15 - Got The Life.flac	-7.400002	0.988556
redacted.ch/Korn - Follow The Leader	16 - Dead Bodies Everywhere.flac	-7.889999	0.988556
redacted.ch/Korn - Follow The Leader	17 - Children Of The Korn.flac	-8.529999	0.944061
redacted.ch/Korn - Follow The Leader	18 - B.B.K..flac	-8.610001	0.977234
redacted.ch/Korn - Follow The Leader	19 - Pretty.flac	-7.000000	0.954987
redacted.ch/Korn - Follow The Leader	20 - All In The Family.flac	-7.690002	0.988556
redacted.ch/Korn - Follow The Leader	21 - Reclaim My Place.flac	-8.349998	0.954987
redacted.ch/Korn - Follow The Leader	22 - Justin.flac	-8.620003	0.944061
redacted.ch/Korn - Follow The Leader	23 - Seed.flac	-8.019997	0.944061
redacted.ch/Korn - Follow The Leader	24 - Cameltosis.flac	-7.459999	0.954987
redacted.ch/Korn - Follow The Leader	25 - My Gift To You.flac	-7.760002	0.944061
redacted.ch/Lacuna Coil - Karmacode [2006] [FLAC]	01 - Fragile.flac	-7.209999	0.979431
redacted.ch/Lacuna Coil - Karmacode [2006] [FLAC]	02 - To The Edge.flac	-7.629997	0.979431
redacted.ch/Lacuna Coil - Karmacode [2006] [FLAC]	03 - Our Truth.flac	-7.430000	0.986816
redacted.ch/Lacuna Coil - Karmacode [2006] [FLAC]	04 - Within Me.flac	-6.910004	0.946594
redacted.ch/Lacuna Coil - Karmacode [2006] [FLAC]	05 - Devoted.flac	-7.800003	0.979431
redacted.ch/Lacuna Coil - Karmacode [2006] [FLAC]	06 - You Create.flac	-5.110001	0.964691
redacted.ch/Lacuna Coil - Karmacode [2006] [FLAC]	07 - What I See.flac	-6.949997	0.985931
redacted.ch/Lacuna Coil - Karmacode [2006] [FLAC]	08 - Fragments Of Faith.flac	-7.680000	0.979431
redacted.ch/Lacuna Coil - Karmacode [2006] [FLAC]	09 - Closer.flac	-7.480003	0.964691
redacted.ch/Lacuna Coil - Karmacode [2006] [FLAC]	10 - In Visible Light.flac	-7.669998	0.990387
redacted.ch/Lacuna Coil - Karmacode [2006] [FLAC]	11 - The Game.flac	-7.279999	0.964691
redacted.ch/Lacuna Coil - Karmacode [2006] [FLAC]	12 - Without Fear.flac	-7.559998	0.964691
redacted.ch/Lacuna Coil - Karmacode [2006] [FLAC]	13 - Enjoy The Silence.flac	-7.830002	0.979431
redacted.ch/Leftover Crack and Citizen Fish - Deadline	01 Working On The Inside.flac	-7.199997	0.958923
redacted.ch/Leftover Crack and Citizen Fish - Deadline	02 Money.flac	-7.690002	0.958954
redacted.ch/Leftover Crack and Citizen Fish - Deadline	03 Meltdown.flac	-7.459999	0.958893
redacted.ch/Leftover Crack and Citizen Fish - Deadline	04 Getting Used To It.flac	-8.360001	0.977081
redacted.ch/Leftover Crack and Citizen Fish - Deadline	05 Back To Square One.flac	-6.989998	0.958893
redacted.ch/Leftover Crack and Citizen Fish - Deadline	06 Join The Dots.flac	-8.199997	0.971863
redacted.ch/Leftover Crack and Citizen Fish - Deadline	07 Clear Channel (Fuck Off!).flac	-8.290001	0.958954
redacted.ch/Leftover Crack and Citizen Fish - Deadline	08 L.o.c. Intro (B.d.c.).flac	-8.070000	0.977081
redacted.ch/Leftover Crack and Citizen Fish - Deadline	09 Baby-Punchers.flac	-9.650002	0.977081
redacted.ch/Leftover Crack and Citizen Fish - Deadline	10 Genocidal Tendencies.flac	-8.849998	0.977081
redacted.ch/Leftover Crack and Citizen Fish - Deadline	11 And Out Comes The N-Bomb!.flac	-8.870003	0.977081
redacted.ch/Leftover Crack and Citizen Fish - Deadline	12 Life Causes Cancer.flac	-7.980003	0.977081
redacted.ch/Leftover Crack and Citizen Fish - Deadline	13 World War 4.flac	-8.410004	0.977081
redacted.ch/Leftover Crack and Citizen Fish - Deadline	14 Supermarket Song.flac	-8.800003	0.977081
redacted.ch/Leftover Crack and Citizen Fish - Deadline	15 Reason For Existence.flac	-7.639999	0.977081
redacted.ch/Leftover Crack - Fuck World Trade - FLAC	01. Clear Channel (Fuck Off!).flac	-9.239998	0.990967
redacted.ch/Leftover Crack - Fuck World Trade - FLAC	02. Life Is Pain.flac	-10.809998	0.974243
redacted.ch/Leftover Crack - Fuck World Trade - FLAC	03. Burn Them Prisons.flac	-10.919998	0.989258
redacted.ch/Leftover Crack - Fuck World Trade - FLAC	04. Gang Control.flac	-10.650002	0.991150
redacted.ch/Leftover Crack - Fuck World Trade - FLAC	05. Super Tuesday.flac	-11.320000	0.991028
redacted.ch/Leftover Crack - Fuck World Trade - FLAC	06. Via Sin Dios.flac	-11.150002	0.970734
redacted.ch/Leftover Crack - Fuck World Trade - FLAC	07. Feed The Children (Books Of Lies).flac	-11.529999	0.981018
redacted.ch/Leftover Crack - Fuck World Trade - FLAC	08. One Dead Cop.flac	-10.470001	0.990875
redacted.ch/Leftover Crack - Fuck World Trade - FLAC	09. Ya Can't Go Home.flac	-10.349998	0.982635
redacted.ch/Leftover Crack - Fuck World Trade - FLAC	10. Rock The 40 oz..flac	-11.019997	0.991333
redacted.ch/Leftover Crack - Fuck World Trade - FLAC	11. Soon We'll Be Dead.flac	-9.480003	0.986664
redacted.ch/Leftover Crack - Fuck World Trade - FLAC	12. Gringos Son Puercos Feos,The Rain.flac	-11.160004	0.991302
redacted.ch/Leftover Crack - Fuck World Trade - FLAC	13. Operation- M.O.V.E..flac	-9.389999	0.991119
redacted.ch/Less Than Jake - In with the out crowd (Flac)	01  Less Than Jake - Soundtrack Of My Life.flac	-9.790001	0.998840
redacted.ch/Less Than Jake - In with the out crowd (Flac)	02  Less Than Jake - A Still Life Franchise.flac	-10.800003	0.998871
redacted.ch/Less Than Jake - In with the out crowd (Flac)	03  Less Than Jake - Overrated (Everything Is).flac	-10.120003	0.998901
redacted.ch/Less Than Jake - In with the out crowd (Flac)	04  Less Than Jake - Fall Apart.flac	-9.989998	0.998840
redacted.ch/Less Than Jake - In with the out crowd (Flac)	05  Less Than Jake - In-Dependence Day.flac	-11.340004	0.998840
redacted.ch/Less Than Jake - In with the out crowd (Flac)	06  Less Than Jake - Don't Fall Asleep On The Subway.flac	-10.349998	0.998840
redacted.ch/Less Than Jake - In with the out crowd (Flac)	07  Less Than Jake - Landmines And Landslides.flac	-10.290001	0.998840
redacted.ch/Less Than Jake - In with the out crowd (Flac)	08  Less Than Jake - The Rest Of My Life.flac	-9.529999	0.998840
redacted.ch/Less Than Jake - In with the out crowd (Flac)	09  Less Than Jake - Mostly Memories.flac	-10.760002	0.998840
redacted.ch/Less Than Jake - In with the out crowd (Flac)	10  Less Than Jake - Let Her Go.flac	-9.989998	0.998901
redacted.ch/Less Than Jake - In with the out crowd (Flac)	11  Less Than Jake - Hopeless Case.flac	-9.599998	0.998840
redacted.ch/Less Than Jake - In with the out crowd (Flac)	12  Less Than Jake - P.S. Shock The World.flac	-10.320000	0.998840
redacted.ch/Limbo Messiah	01 - As I Please.flac	-9.099998	0.999939
redacted.ch/Limbo Messiah	02 - Jane Became Insane.flac	-9.889999	0.997559
redacted.ch/Limbo Messiah	03 - Sharp, Cool & Collected.flac	-9.980003	0.999664
redacted.ch/Limbo Messiah	04 - Meantime.flac	-9.769997	0.994843
redacted.ch/Limbo Messiah	05 - Demons Galore.flac	-10.090004	0.929779
redacted.ch/Limbo Messiah	06 - Cut Off The Top.flac	-8.840004	0.997559
redacted.ch/Limbo Messiah	07 - Bad Brain.flac	-10.260002	0.924652
redacted.ch/Limbo Messiah	08 - She Was Great.flac	-4.340004	0.945465
redacted.ch/Limbo Messiah	09 - Soljanka.flac	-9.660004	0.994659
redacted.ch/Limbo Messiah	10 - Hail To The Freaks.flac	-8.230003	0.991028
redacted.ch/Limbo Messiah	11 - E-G-O.flac	-9.629997	0.952271
redacted.ch/Limp Bizkit - Chocolate Starfish And The Hot Dog Flavored Water	01 - Limp Bizkit , Intro.flac	-1.730003	0.988556
redacted.ch/Limp Bizkit - Chocolate Starfish And The Hot Dog Flavored Water	02 - Hot Dog.flac	-10.660004	0.988556
redacted.ch/Limp Bizkit - Chocolate Starfish And The Hot Dog Flavored Water	03 - My Generation.flac	-11.370003	0.988556
redacted.ch/Limp Bizkit - Chocolate Starfish And The Hot Dog Flavored Water	04 - Full Nelson.flac	-11.349998	0.988556
redacted.ch/Limp Bizkit - Chocolate Starfish And The Hot Dog Flavored Water	05 - My Way.flac	-11.599998	0.988556
redacted.ch/Limp Bizkit - Chocolate Starfish And The Hot Dog Flavored Water	06 - Rollin' (Air Raid Vehicle).flac	-10.250000	0.988556
redacted.ch/Limp Bizkit - Chocolate Starfish And The Hot Dog Flavored Water	07 - Livin' It Up.flac	-10.739998	0.988556
redacted.ch/Limp Bizkit - Chocolate Starfish And The Hot Dog Flavored Water	08 - The One.flac	-10.480003	0.989197
redacted.ch/Limp Bizkit - Chocolate Starfish And The Hot Dog Flavored Water	09 - Getcha Groove On.flac	-8.910004	0.988556
redacted.ch/Limp Bizkit - Chocolate Starfish And The Hot Dog Flavored Water	10 - Take A Look Around.flac	-10.040001	0.988556
redacted.ch/Limp Bizkit - Chocolate Starfish And The Hot Dog Flavored Water	11 - It'll Be Ok.flac	-10.970001	0.977234
redacted.ch/Limp Bizkit - Chocolate Starfish And The Hot Dog Flavored Water	12 - Boiler.flac	-10.760002	0.999969
redacted.ch/Limp Bizkit - Chocolate Starfish And The Hot Dog Flavored Water	13 - Hold On.flac	-6.410004	0.812836
redacted.ch/Limp Bizkit - Chocolate Starfish And The Hot Dog Flavored Water	14 - Rollin' (Urban Assault Vehicle).flac	-9.050003	0.988556
redacted.ch/Limp Bizkit - Chocolate Starfish And The Hot Dog Flavored Water	15 - Outro.flac	-3.410004	0.988556
redacted.ch/Lindsey Stirling - Lindsey Stirling	01 Electric Daisy Violin.flac	-7.320000	1.000000
redacted.ch/Lindsey Stirling - Lindsey Stirling	02 Zi-Zi's Journey.flac	-8.800003	1.000000
redacted.ch/Lindsey Stirling - Lindsey Stirling	03 Crystallize.flac	-6.870003	1.000000
redacted.ch/Lindsey Stirling - Lindsey Stirling	04 Song of the Caged Bird.flac	-7.820000	1.000000
redacted.ch/Lindsey Stirling - Lindsey Stirling	05 Moon Trance.flac	-9.220001	1.000000
redacted.ch/Lindsey Stirling - Lindsey Stirling	06 Minimal Beat.flac	-8.800003	1.000000
redacted.ch/Lindsey Stirling - Lindsey Stirling	07 Transcendence.flac	-7.860001	1.000000
redacted.ch/Lindsey Stirling - Lindsey Stirling	08 Elements.flac	-8.590004	1.000000
redacted.ch/Lindsey Stirling - Lindsey Stirling	09 Shadows.flac	-8.000000	1.000000
redacted.ch/Lindsey Stirling - Lindsey Stirling	10 Spontaneous Me.flac	-6.660004	1.000000
redacted.ch/Lindsey Stirling - Lindsey Stirling	11 Anti Gravity.flac	-8.629997	1.000000
redacted.ch/Lindsey Stirling - Lindsey Stirling	12 Stars Align.flac	-9.209999	0.999969
redacted.ch/Long Beach Dub Allstars - Wonders Of The World - 2001 (CD - FLAC - Lossless)	01 - Wonders Dub I.flac	-6.989998	0.988647
redacted.ch/Long Beach Dub Allstars - Wonders Of The World - 2001 (CD - FLAC - Lossless)	02 - Sunny Hours (feat. Will.I.Am).flac	-10.800003	0.988586
redacted.ch/Long Beach Dub Allstars - Wonders Of The World - 2001 (CD - FLAC - Lossless)	03 - Listen To DJ's.flac	-10.099998	0.988617
redacted.ch/Long Beach Dub Allstars - Wonders Of The World - 2001 (CD - FLAC - Lossless)	04 - Rolled Up.flac	-10.669998	0.988617
redacted.ch/Long Beach Dub Allstars - Wonders Of The World - 2001 (CD - FLAC - Lossless)	05 - Every Mother's Dream.flac	-12.220001	0.988617
redacted.ch/Long Beach Dub Allstars - Wonders Of The World - 2001 (CD - FLAC - Lossless)	06 - Life Goes On (feat. Half Pint, Ives, Chali2na and Tippa Irie).flac	-10.029999	0.988617
redacted.ch/Long Beach Dub Allstars - Wonders Of The World - 2001 (CD - FLAC - Lossless)	07 - It Ain't Easy.flac	-11.349998	0.988617
redacted.ch/Long Beach Dub Allstars - Wonders Of The World - 2001 (CD - FLAC - Lossless)	08 - Luke.flac	-9.260002	0.988617
redacted.ch/Long Beach Dub Allstars - Wonders Of The World - 2001 (CD - FLAC - Lossless)	09 - Wonders Dub II.flac	-5.820000	0.988617
redacted.ch/Long Beach Dub Allstars - Wonders Of The World - 2001 (CD - FLAC - Lossless)	10 - No Way.flac	-11.930000	0.988617
redacted.ch/Long Beach Dub Allstars - Wonders Of The World - 2001 (CD - FLAC - Lossless)	11 - Lonely End.flac	-11.779999	0.988617
redacted.ch/Long Beach Dub Allstars - Wonders Of The World - 2001 (CD - FLAC - Lossless)	12 - Talkin' The Truth (feat. Paulie Selekta).flac	-8.019997	0.988617
redacted.ch/Long Beach Dub Allstars - Wonders Of The World - 2001 (CD - FLAC - Lossless)	13 - Free Love.flac	-10.750000	0.988617
redacted.ch/Long Beach Dub Allstars - Wonders Of The World - 2001 (CD - FLAC - Lossless)	14 - Lies (feat. I-Man).flac	-9.730003	0.988617
redacted.ch/Long Beach Dub Allstars - Wonders Of The World - 2001 (CD - FLAC - Lossless)	15 - Kablammin' It.flac	-9.709999	0.988617
redacted.ch/Long Beach Dub Allstars - Wonders Of The World - 2001 (CD - FLAC - Lossless)	16 - Grass Cloud.flac	-9.389999	0.988617
redacted.ch/Long Beach Dub Allstars - Wonders Of The World - 2001 (CD - FLAC - Lossless)	17 - Sunny Hours (reprise).flac	-9.840004	0.988647
redacted.ch/Los Lobos - Kiko [FLAC] (What.cd)	01 Lobos Los - Dream in Blue.flac	-4.379997	0.973175
redacted.ch/Los Lobos - Kiko [FLAC] (What.cd)	02 Lobos Los - Wake Up Dolores.flac	-5.269997	0.973206
redacted.ch/Los Lobos - Kiko [FLAC] (What.cd)	03 Lobos Los - Angels With Dirty Faces.flac	-3.690002	0.972992
redacted.ch/Los Lobos - Kiko [FLAC] (What.cd)	04 Lobos Los - That Train Don't Stop Here.flac	-3.879997	0.973145
redacted.ch/Los Lobos - Kiko [FLAC] (What.cd)	05 Lobos Los - Kiko And The Lavender Moon.flac	-3.360001	0.973145
redacted.ch/Los Lobos - Kiko [FLAC] (What.cd)	06 Lobos Los - Saint Behind The Glass.flac	-2.730003	0.973145
redacted.ch/Los Lobos - Kiko [FLAC] (What.cd)	07 Lobos Los - Reva's House.flac	-5.080002	0.973206
redacted.ch/Los Lobos - Kiko [FLAC] (What.cd)	08 Lobos Los - When The Circus Comes.flac	-4.940002	0.973053
redacted.ch/Los Lobos - Kiko [FLAC] (What.cd)	09 Lobos Los - Arizona Skies.flac	-1.099998	0.974640
redacted.ch/Los Lobos - Kiko [FLAC] (What.cd)	10 Lobos Los - Short Side Of Nothing.flac	-5.500000	0.973267
redacted.ch/Los Lobos - Kiko [FLAC] (What.cd)	11 Lobos Los - Two Janes.flac	-2.239998	1.000000
redacted.ch/Los Lobos - Kiko [FLAC] (What.cd)	12 Lobos Los - Wicked Rain.flac	-3.849998	0.973236
redacted.ch/Los Lobos - Kiko [FLAC] (What.cd)	13 Lobos Los - Whiskey Trail.flac	-5.910004	0.973236
redacted.ch/Los Lobos - Kiko [FLAC] (What.cd)	14 Lobos Los - Just A Man.flac	-4.300003	0.973175
redacted.ch/Los Lobos - Kiko [FLAC] (What.cd)	15 Lobos Los - Peace.flac	-1.550003	0.973328
redacted.ch/Los Lobos - Kiko [FLAC] (What.cd)	16 Lobos Los - Rio de Tenampa.flac	-4.430000	0.863525
redacted.ch/Machine Head - Burn my eyes [1994] flac	01  Machine Head - Davidian.flac	-8.099998	1.000000
redacted.ch/Machine Head - Burn my eyes [1994] flac	02  Machine Head - Old.flac	-8.690002	1.000000
redacted.ch/Machine Head - Burn my eyes [1994] flac	03  Machine Head - A Thousand Lies.flac	-9.650002	1.000000
redacted.ch/Machine Head - Burn my eyes [1994] flac	04  Machine Head - None But My Own.flac	-9.500000	1.000000
redacted.ch/Machine Head - Burn my eyes [1994] flac	05  Machine Head - The Rage To Overcome.flac	-9.500000	1.000000
redacted.ch/Machine Head - Burn my eyes [1994] flac	06  Machine Head - Death Church.flac	-8.959999	1.000000
redacted.ch/Machine Head - Burn my eyes [1994] flac	07  Machine Head - A Nation On Fire.flac	-8.010002	0.964569
redacted.ch/Machine Head - Burn my eyes [1994] flac	08  Machine Head - Blood For Blood.flac	-8.820000	1.000000
redacted.ch/Machine Head - Burn my eyes [1994] flac	09  Machine Head - I'm Your God Now.flac	-9.739998	1.000000
redacted.ch/Machine Head - Burn my eyes [1994] flac	10  Machine Head - Real Eyes, Realize, Real Lies.flac	-9.010002	1.000000
redacted.ch/Machine Head - Burn my eyes [1994] flac	11  Machine Head - Block.flac	-8.599998	1.000000
redacted.ch/Mad Caddies - Keep It Going [FLAC]	01 - The Dirge.flac	-9.930000	1.000000
redacted.ch/Mad Caddies - Keep It Going [FLAC]	02 - Backyard.flac	-9.900002	1.000000
redacted.ch/Mad Caddies - Keep It Going [FLAC]	03 - State Of Mind.flac	-8.000000	1.000000
redacted.ch/Mad Caddies - Keep It Going [FLAC]	04 - Today.flac	-10.610001	0.998962
redacted.ch/Mad Caddies - Keep It Going [FLAC]	05 - Without You.flac	-9.120003	1.000000
redacted.ch/Mad Caddies - Keep It Going [FLAC]	06 - Reflections.flac	-8.690002	1.000000
redacted.ch/Mad Caddies - Keep It Going [FLAC]	07 - Lay Your Head Down.flac	-9.709999	1.000000
redacted.ch/Mad Caddies - Keep It Going [FLAC]	08 - Tired Bones.flac	-9.699997	1.000000
redacted.ch/Mad Caddies - Keep It Going [FLAC]	09 - Coyote.flac	-8.480003	1.000000
redacted.ch/Mad Caddies - Keep It Going [FLAC]	10 - Don't Go.flac	-9.029999	1.000000
redacted.ch/Mad Caddies - Keep It Going [FLAC]	11 - Pyramid Sheme.flac	-10.139999	1.000000
redacted.ch/Mad Caddies - Keep It Going [FLAC]	12 - Souls For Sale.flac	-7.680000	1.000000
redacted.ch/Mad Caddies - Keep It Going [FLAC]	13 - Riding For A Fall.flac	-9.160004	1.000000
redacted.ch/Mad Caddies - Keep It Going [FLAC]	14 - Watcha Gonna Do.flac	-6.279999	1.000000
redacted.ch/Mad Caddies - Keep It Going [FLAC]	15 - End Dirge.flac	-5.480003	0.829468
redacted.ch/Madness - One Step Beyond (Remaster) [1979]	01 - One Step Beyond.flac	-11.320000	0.967865
redacted.ch/Madness - One Step Beyond (Remaster) [1979]	02 - My Girl.flac	-9.790001	0.968445
redacted.ch/Madness - One Step Beyond (Remaster) [1979]	03 - Night Boat To Cairo.flac	-11.410004	0.951752
redacted.ch/Madness - One Step Beyond (Remaster) [1979]	04 - Believe Me.flac	-10.220001	0.968140
redacted.ch/Madness - One Step Beyond (Remaster) [1979]	05 - Land Of Hope And Glory.flac	-11.090004	0.951752
redacted.ch/Madness - One Step Beyond (Remaster) [1979]	06 - The Prince.flac	-8.970001	0.948303
redacted.ch/Madness - One Step Beyond (Remaster) [1979]	07 - Tarzan's Nuts.flac	-8.840004	0.951752
redacted.ch/Madness - One Step Beyond (Remaster) [1979]	08 - In The Middle Of The Night.flac	-10.230003	0.984314
redacted.ch/Madness - One Step Beyond (Remaster) [1979]	09 - Bed And Breakfast Man.flac	-10.480003	0.968384
redacted.ch/Madness - One Step Beyond (Remaster) [1979]	10 - Razor Blade Alley.flac	-9.599998	0.968231
redacted.ch/Madness - One Step Beyond (Remaster) [1979]	11 - Swan Lake.flac	-9.389999	0.971069
redacted.ch/Madness - One Step Beyond (Remaster) [1979]	12 - Rockin' In A Flat.flac	-9.090004	0.952087
redacted.ch/Madness - One Step Beyond (Remaster) [1979]	13 - Mummy's Boy.flac	-9.769997	0.968353
redacted.ch/Madness - One Step Beyond (Remaster) [1979]	14 - Madness.flac	-10.050003	0.983765
redacted.ch/Madness - One Step Beyond (Remaster) [1979]	15 - Chipmunks Are Go!.flac	-7.590004	0.790283
redacted.ch/MAN WITH A MISSION - The World's On Fire (2016) [FLAC]	1.01. Survivor.flac	-12.160004	0.988525
redacted.ch/MAN WITH A MISSION - The World's On Fire (2016) [FLAC]	1.02. Waiting for the Moment.flac	-8.769997	0.988525
redacted.ch/MAN WITH A MISSION - The World's On Fire (2016) [FLAC]	1.03. Dive.flac	-12.150002	0.988525
redacted.ch/MAN WITH A MISSION - The World's On Fire (2016) [FLAC]	1.04. Raise your flag.flac	-12.529999	0.988525
redacted.ch/MAN WITH A MISSION - The World's On Fire (2016) [FLAC]	1.05. followers.flac	-10.370003	0.988525
redacted.ch/MAN WITH A MISSION - The World's On Fire (2016) [FLAC]	1.06. The World's On Fire.flac	-10.690002	0.988525
redacted.ch/MAN WITH A MISSION - The World's On Fire (2016) [FLAC]	1.07. Give it Away.flac	-11.300003	0.988525
redacted.ch/MAN WITH A MISSION - The World's On Fire (2016) [FLAC]	1.08. Seven Deadly Sins.flac	-12.209999	0.988525
redacted.ch/MAN WITH A MISSION - The World's On Fire (2016) [FLAC]	1.09. Mirror Mirror.flac	-11.099998	0.988525
redacted.ch/MAN WITH A MISSION - The World's On Fire (2016) [FLAC]	1.10. Memories.flac	-11.529999	0.988525
redacted.ch/MAN WITH A MISSION - The World's On Fire (2016) [FLAC]	1.11. Far.flac	-10.959999	0.988525
redacted.ch/MAN WITH A MISSION - The World's On Fire (2016) [FLAC]	1.12. Out of Control.flac	-12.230003	0.988525
redacted.ch/MAN WITH A MISSION - The World's On Fire (2016) [FLAC]	1.13. ワンダーランド.flac	-8.150002	0.988525
redacted.ch/Megadeth - Countdown To Extinction (Remixed & Remastered) [MFSL] - 1992 [FLAC]	01 - Skin O' My Teeth.flac	-7.360001	0.957825
redacted.ch/Megadeth - Countdown To Extinction (Remixed & Remastered) [MFSL] - 1992 [FLAC]	02 - Symphony Of Destruction.flac	-7.750000	0.988525
redacted.ch/Megadeth - Countdown To Extinction (Remixed & Remastered) [MFSL] - 1992 [FLAC]	03 - Architecture Of Aggression.flac	-7.529999	0.953064
redacted.ch/Megadeth - Countdown To Extinction (Remixed & Remastered) [MFSL] - 1992 [FLAC]	04 - Foreclosure Of A Dream.flac	-7.879997	0.935883
redacted.ch/Megadeth - Countdown To Extinction (Remixed & Remastered) [MFSL] - 1992 [FLAC]	05 - Sweating Bullets.flac	-7.029999	0.988525
redacted.ch/Megadeth - Countdown To Extinction (Remixed & Remastered) [MFSL] - 1992 [FLAC]	06 - This Was My Life.flac	-6.699997	0.988525
redacted.ch/Megadeth - Countdown To Extinction (Remixed & Remastered) [MFSL] - 1992 [FLAC]	07 - Countdown To Extinction.flac	-6.910004	0.986267
redacted.ch/Megadeth - Countdown To Extinction (Remixed & Remastered) [MFSL] - 1992 [FLAC]	08 - High Speed Dirt.flac	-8.800003	0.988525
redacted.ch/Megadeth - Countdown To Extinction (Remixed & Remastered) [MFSL] - 1992 [FLAC]	09 - Psychotron.flac	-8.989998	0.988525
redacted.ch/Megadeth - Countdown To Extinction (Remixed & Remastered) [MFSL] - 1992 [FLAC]	10 - Captive Honour.flac	-9.449997	0.988525
redacted.ch/Megadeth - Countdown To Extinction (Remixed & Remastered) [MFSL] - 1992 [FLAC]	11 - Ashes In Your Mouth.flac	-9.169998	0.988525
redacted.ch/Megadeth - Countdown To Extinction (Remixed & Remastered) [MFSL] - 1992 [FLAC]	12 - Crown Of Worms (previously unreleased in the U.S.).flac	-7.800003	0.958374
redacted.ch/Megadeth - Countdown To Extinction (Remixed & Remastered) [MFSL] - 1992 [FLAC]	13 - Countdown To Extinction (Demo) (previously unreleased).flac	-8.980003	0.988525
redacted.ch/Megadeth - Countdown To Extinction (Remixed & Remastered) [MFSL] - 1992 [FLAC]	14 - Symphony Of Destruction (Demo) (previously unreleased in the U.S.).flac	-9.410004	0.987518
redacted.ch/Megadeth - Countdown To Extinction (Remixed & Remastered) [MFSL] - 1992 [FLAC]	15 - Psychotron (Demo) (previously unreleased).flac	-8.750000	0.988525
redacted.ch/Megadeth - Endgame	01 - Dialectic Chaos.flac	-10.379997	0.988708
redacted.ch/Megadeth - Endgame	02 - This Day We Fight!.flac	-10.699997	0.988678
redacted.ch/Megadeth - Endgame	03 - 44 Minutes.flac	-10.090004	0.988678
redacted.ch/Megadeth - Endgame	04 - 1,320.flac	-10.580002	0.988678
redacted.ch/Megadeth - Endgame	05 - Bite the Hand.flac	-10.050003	0.988678
redacted.ch/Megadeth - Endgame	06 - Bodies.flac	-9.849998	0.988678
redacted.ch/Megadeth - Endgame	07 - Endgame.flac	-9.650002	0.988678
redacted.ch/Megadeth - Endgame	08 - The Hardest Part of Letting Go...Sealed With a Kiss.flac	-9.260002	0.988678
redacted.ch/Megadeth - Endgame	09 - Head Crusher.flac	-10.370003	0.988678
redacted.ch/Megadeth - Endgame	10 - How the Story Ends.flac	-9.400002	0.988678
redacted.ch/Megadeth - Endgame	11 - The Right to Go Insane.flac	-9.949997	0.988678
redacted.ch/Megadeth-Rust_In_Peace-Original-1990-FLAC	01 - Holy Wars... The Punishment Due.flac	-2.529999	0.999268
redacted.ch/Megadeth-Rust_In_Peace-Original-1990-FLAC	02 - Hangar 18.flac	-3.949997	0.937225
redacted.ch/Megadeth-Rust_In_Peace-Original-1990-FLAC	03 - Take No Prisoners.flac	-3.260002	0.970337
redacted.ch/Megadeth-Rust_In_Peace-Original-1990-FLAC	04 - Five Magics.flac	-4.550003	0.951874
redacted.ch/Megadeth-Rust_In_Peace-Original-1990-FLAC	05 - Poison Was The Cure.flac	-3.739998	0.999725
redacted.ch/Megadeth-Rust_In_Peace-Original-1990-FLAC	06 - Lucretia.flac	-4.220001	0.999359
redacted.ch/Megadeth-Rust_In_Peace-Original-1990-FLAC	07 - Tornado Of Souls.flac	-3.489998	0.951263
redacted.ch/Megadeth-Rust_In_Peace-Original-1990-FLAC	08 - Dawn Patrol.flac	0.559998	0.999969
redacted.ch/Megadeth-Rust_In_Peace-Original-1990-FLAC	09 - Rust In Peace... Polaris.flac	-1.650002	0.903870
redacted.ch/Melbourne Ska Orchestra - Melbourne Ska Orchestra (2013) [FLAC]	01 - Get Smart.flac	-4.370003	0.999969
redacted.ch/Melbourne Ska Orchestra - Melbourne Ska Orchestra (2013) [FLAC]	02 - Lygon St.flac	-4.340004	1.000000
redacted.ch/Melbourne Ska Orchestra - Melbourne Ska Orchestra (2013) [FLAC]	03 - Time To Wake Up.flac	-4.669998	0.997650
redacted.ch/Melbourne Ska Orchestra - Melbourne Ska Orchestra (2013) [FLAC]	04 - The Diplomat.flac	-5.230003	0.997040
redacted.ch/Melbourne Ska Orchestra - Melbourne Ska Orchestra (2013) [FLAC]	05 - Dean Went To Mexico.flac	-4.330002	0.995087
redacted.ch/Melbourne Ska Orchestra - Melbourne Ska Orchestra (2013) [FLAC]	06 - Learn To Love Again.flac	-4.430000	0.994751
redacted.ch/Melbourne Ska Orchestra - Melbourne Ska Orchestra (2013) [FLAC]	07 - He's A Tripper.flac	-4.599998	0.999969
redacted.ch/Melbourne Ska Orchestra - Melbourne Ska Orchestra (2013) [FLAC]	08 - Third Time Lucky.flac	-4.419998	0.995026
redacted.ch/Melbourne Ska Orchestra - Melbourne Ska Orchestra (2013) [FLAC]	09 - While You Wait.flac	-4.559998	0.991608
redacted.ch/Melbourne Ska Orchestra - Melbourne Ska Orchestra (2013) [FLAC]	10 - Katoomba.flac	-4.470001	0.997467
redacted.ch/Melbourne Ska Orchestra - Melbourne Ska Orchestra (2013) [FLAC]	11 - Papa's Got A Brand New Ska.flac	-4.449997	1.000000
redacted.ch/Melbourne Ska Orchestra - Melbourne Ska Orchestra (2013) [FLAC]	12 - Time For This Monkey.flac	-4.809998	0.995789
redacted.ch/Melbourne Ska Orchestra - Melbourne Ska Orchestra (2013) [FLAC]	13 - Paradiso.flac	-4.440002	0.992493
redacted.ch/Melbourne Ska Orchestra - Melbourne Ska Orchestra (2013) [FLAC]	14 - Best Things.flac	-4.389999	1.000000
redacted.ch/Melbourne Ska Orchestra - Melbourne Ska Orchestra (2013) [FLAC]	15 - Singalong Day.flac	-4.389999	0.999420
redacted.ch/Messer Chups - Zombie Shopping (2007) [FLAC]	01. Darkness Is a Teenager's Friend.flac	-8.809998	0.946442
redacted.ch/Messer Chups - Zombie Shopping (2007) [FLAC]	02. Cat Mobile.flac	-6.489998	0.941040
redacted.ch/Messer Chups - Zombie Shopping (2007) [FLAC]	03. Flash Of The Night (Алешеньке - Кыштымскому карлику посвящается).flac	-8.459999	0.946350
redacted.ch/Messer Chups - Zombie Shopping (2007) [FLAC]	04. When a Knife Thrower Missed the Target.flac	-9.250000	0.960571
redacted.ch/Messer Chups - Zombie Shopping (2007) [FLAC]	05. Zombie in a Mini Skirt.flac	-8.529999	0.945496
redacted.ch/Messer Chups - Zombie Shopping (2007) [FLAC]	06. Girls in Orbit.flac	-9.040001	0.949524
redacted.ch/Messer Chups - Zombie Shopping (2007) [FLAC]	07. Dried Human Head from Ecuador.flac	-7.330002	0.941772
redacted.ch/Messer Chups - Zombie Shopping (2007) [FLAC]	08. Swamp Cowboy.flac	-8.570000	0.944305
redacted.ch/Messer Chups - Zombie Shopping (2007) [FLAC]	09. Model.flac	-8.849998	0.945557
redacted.ch/Messer Chups - Zombie Shopping (2007) [FLAC]	10. Swamp Surfing.flac	-9.099998	0.944031
redacted.ch/Messer Chups - Zombie Shopping (2007) [FLAC]	11. With an Alligato in Your Hand.flac	-9.309998	0.949615
redacted.ch/Messer Chups - Zombie Shopping (2007) [FLAC]	12. Holy Psychedelics.flac	-7.550003	0.942688
redacted.ch/Messer Chups - Zombie Shopping (2007) [FLAC]	13. Vincent Price Is Coming to Russia.flac	-7.400002	0.949432
redacted.ch/Messer Chups - Zombie Shopping (2007) [FLAC]	14. Hearty Dracula.flac	-8.760002	0.944305
redacted.ch/Messer Chups - Zombie Shopping (2007) [FLAC]	15. Boys in Skeleton Costumes.flac	-9.300003	0.952759
redacted.ch/Messer Chups - Zombie Shopping (2007) [FLAC]	16. Laughing Gas Attacking Jamaica.flac	-8.470001	0.946594
redacted.ch/Messer Chups - Zombie Shopping (2007) [FLAC]	17. Popcorno Revenge.flac	-7.870003	0.954865
redacted.ch/Metallica - Ride The Lightning (1984) - 1989 Vertigo 838 140-2 - FLAC	01 - Fight Fire With Fire.flac	-4.090004	0.968079
redacted.ch/Metallica - Ride The Lightning (1984) - 1989 Vertigo 838 140-2 - FLAC	02 - Ride The Lightning.flac	-4.150002	1.000000
redacted.ch/Metallica - Ride The Lightning (1984) - 1989 Vertigo 838 140-2 - FLAC	03 - For Whom The Bell Tolls.flac	-3.699997	0.969360
redacted.ch/Metallica - Ride The Lightning (1984) - 1989 Vertigo 838 140-2 - FLAC	04 - Fade To Black.flac	-5.230003	1.000000
redacted.ch/Metallica - Ride The Lightning (1984) - 1989 Vertigo 838 140-2 - FLAC	05 - Trapped Under Ice.flac	-3.779999	0.862488
redacted.ch/Metallica - Ride The Lightning (1984) - 1989 Vertigo 838 140-2 - FLAC	06 - Escape.flac	-3.180000	0.829102
redacted.ch/Metallica - Ride The Lightning (1984) - 1989 Vertigo 838 140-2 - FLAC	07 - Creeping Death.flac	-4.150002	1.000000
redacted.ch/Metallica - Ride The Lightning (1984) - 1989 Vertigo 838 140-2 - FLAC	08 - The Call Of Ktulu.flac	-4.419998	1.000000
redacted.ch/Mighty Mighty Bosstones, The - 1993 - Ska-Core, The Devil And More	01 - Someday I suppose.flac	-4.070000	0.999969
redacted.ch/Mighty Mighty Bosstones, The - 1993 - Ska-Core, The Devil And More	02 - Think again.flac	-4.820000	0.938080
redacted.ch/Mighty Mighty Bosstones, The - 1993 - Ska-Core, The Devil And More	03 - Lights out.flac	-4.910004	1.000000
redacted.ch/Mighty Mighty Bosstones, The - 1993 - Ska-Core, The Devil And More	04 - Police beat.flac	-2.989998	1.000000
redacted.ch/Mighty Mighty Bosstones, The - 1993 - Ska-Core, The Devil And More	05 - Simmer down.flac	-3.150002	1.000000
redacted.ch/Mighty Mighty Bosstones, The - 1993 - Ska-Core, The Devil And More	06 - Drugs and kittens I'll drink to that.flac	-0.669998	1.000000
redacted.ch/Mighty Mighty Bosstones - The Magic of Youth-2011 (FLAC)	01 The Mighty Mighty Bosstones - The Daylights.flac	-11.590004	1.000000
redacted.ch/Mighty Mighty Bosstones - The Magic of Youth-2011 (FLAC)	02 The Mighty Mighty Bosstones - Like a Shotgun.flac	-11.320000	1.000000
redacted.ch/Mighty Mighty Bosstones - The Magic of Youth-2011 (FLAC)	03 The Mighty Mighty Bosstones - Disappearing.flac	-10.540001	1.000000
redacted.ch/Mighty Mighty Bosstones - The Magic of Youth-2011 (FLAC)	04 The Mighty Mighty Bosstones - Sunday Afternoons on Wisdom Ave.flac	-11.290001	1.000000
redacted.ch/Mighty Mighty Bosstones - The Magic of Youth-2011 (FLAC)	05 The Mighty Mighty Bosstones - They Will Need Music.flac	-11.080002	1.000000
redacted.ch/Mighty Mighty Bosstones - The Magic of Youth-2011 (FLAC)	06 The Mighty Mighty Bosstones - The Package Store Petition.flac	-11.570000	1.000000
redacted.ch/Mighty Mighty Bosstones - The Magic of Youth-2011 (FLAC)	07 The Mighty Mighty Bosstones - The Horse Shoe and the Rabbits Foot.flac	-10.309998	1.000000
redacted.ch/Mighty Mighty Bosstones - The Magic of Youth-2011 (FLAC)	08 The Mighty Mighty Bosstones - The Magic of Youth.flac	-11.480003	1.000000
redacted.ch/Mighty Mighty Bosstones - The Magic of Youth-2011 (FLAC)	09 The Mighty Mighty Bosstones - The Upper Hand.flac	-10.840004	1.000000
redacted.ch/Mighty Mighty Bosstones - The Magic of Youth-2011 (FLAC)	10 The Mighty Mighty Bosstones - The Ballad of Candlepin Paul.flac	-10.820000	1.000000
redacted.ch/Mighty Mighty Bosstones - The Magic of Youth-2011 (FLAC)	11 The Mighty Mighty Bosstones - Open and Honest.flac	-10.580002	1.000000
redacted.ch/Mindless Self Indulgence (2005) You'll Rebel to Anything [FLAC]	01 - Shut Me Up.flac	-9.779999	0.993713
redacted.ch/Mindless Self Indulgence (2005) You'll Rebel to Anything [FLAC]	02 - 1989.flac	-9.970001	0.999054
redacted.ch/Mindless Self Indulgence (2005) You'll Rebel to Anything [FLAC]	03 - Straight to Video.flac	-9.389999	0.999146
redacted.ch/Mindless Self Indulgence (2005) You'll Rebel to Anything [FLAC]	04 - Tom Sawyer.flac	-8.919998	0.999176
redacted.ch/Mindless Self Indulgence (2005) You'll Rebel to Anything [FLAC]	05 - You'll Rebel to Anything (As Long as it's Not Challenging).flac	-9.239998	0.999115
redacted.ch/Mindless Self Indulgence (2005) You'll Rebel to Anything [FLAC]	06 - What Do They Know .flac	-8.879997	0.999115
redacted.ch/Mindless Self Indulgence (2005) You'll Rebel to Anything [FLAC]	07 - Stupid MF.flac	-9.269997	0.999084
redacted.ch/Mindless Self Indulgence (2005) You'll Rebel to Anything [FLAC]	08 - 2 Hookers and an Eightball.flac	-9.059998	0.999115
redacted.ch/Mindless Self Indulgence (2005) You'll Rebel to Anything [FLAC]	09 - Prom.flac	-9.489998	0.999115
redacted.ch/Mindless Self Indulgence (2005) You'll Rebel to Anything [FLAC]	10 - Bullshit.flac	-9.120003	0.999207
redacted.ch/Misfits - Famous Monsters	01 - Kong at the Gates.flac	-7.660004	0.998871
redacted.ch/Misfits - Famous Monsters	02 - The Forbidden Zone.flac	-8.809998	0.998932
redacted.ch/Misfits - Famous Monsters	03 - Lost in Space.flac	-9.150002	0.998932
redacted.ch/Misfits - Famous Monsters	04 - Dust to Dust.flac	-8.180000	0.998932
redacted.ch/Misfits - Famous Monsters	05 - Crawling Eye.flac	-9.879997	0.998932
redacted.ch/Misfits - Famous Monsters	06 - Witch Hunt.flac	-9.449997	0.998932
redacted.ch/Misfits - Famous Monsters	07 - Scream!.flac	-10.029999	0.998932
redacted.ch/Misfits - Famous Monsters	08 - Saturday Night.flac	-9.620003	0.998962
redacted.ch/Misfits - Famous Monsters	09 - Pumpkin Head.flac	-8.449997	0.998962
redacted.ch/Misfits - Famous Monsters	10 - Scarecrow Man.flac	-9.330002	0.998932
redacted.ch/Misfits - Famous Monsters	11 - Die Monster Die.flac	-9.000000	0.998962
redacted.ch/Misfits - Famous Monsters	12 - Living Hell.flac	-9.449997	0.998932
redacted.ch/Misfits - Famous Monsters	13 - Descending Angel.flac	-9.500000	0.998932
redacted.ch/Misfits - Famous Monsters	14 - Them.flac	-9.029999	0.998962
redacted.ch/Misfits - Famous Monsters	15 - Fiend Club.flac	-9.120003	0.998932
redacted.ch/Misfits - Famous Monsters	16 - Hunting Humans.flac	-9.459999	0.998932
redacted.ch/Misfits - Famous Monsters	17 - Helena.flac	-9.169998	0.998932
redacted.ch/Misfits - Famous Monsters	18 - Kong Unleashed.flac	-6.169998	0.998932
redacted.ch/Misfits - Static Age  (1997) [FLAC]	01 - The Misfits - Static Age.flac	-6.959999	0.999969
redacted.ch/Misfits - Static Age  (1997) [FLAC]	02 - The Misfits - TV Casualty.flac	-7.459999	0.999969
redacted.ch/Misfits - Static Age  (1997) [FLAC]	03 - The Misfits - Some Kinda Hate.flac	-6.930000	0.999969
redacted.ch/Misfits - Static Age  (1997) [FLAC]	04 - The Misfits - Last Caress.flac	-6.489998	0.937805
redacted.ch/Misfits - Static Age  (1997) [FLAC]	05 - The Misfits - Return Of The Fly.flac	-6.449997	0.942810
redacted.ch/Misfits - Static Age  (1997) [FLAC]	06 - The Misfits - Hybrid Moments.flac	-6.910004	0.915588
redacted.ch/Misfits - Static Age  (1997) [FLAC]	07 - The Misfits - We Are 138.flac	-6.690002	0.999969
redacted.ch/Misfits - Static Age  (1997) [FLAC]	08 - The Misfits - Teenagers From Mars.flac	-6.980003	0.982483
redacted.ch/Misfits - Static Age  (1997) [FLAC]	09 - The Misfits - Come Back.flac	-6.620003	0.923218
redacted.ch/Misfits - Static Age  (1997) [FLAC]	10 - The Misfits - Angelfuck.flac	-7.019997	0.949127
redacted.ch/Misfits - Static Age  (1997) [FLAC]	11 - The Misfits - Hollywood Babylon.flac	-7.059998	0.999969
redacted.ch/Misfits - Static Age  (1997) [FLAC]	12 - The Misfits - Attitude.flac	-7.419998	0.999969
redacted.ch/Misfits - Static Age  (1997) [FLAC]	13 - The Misfits - Bullet.flac	-7.120003	0.999878
redacted.ch/Misfits - Static Age  (1997) [FLAC]	14 - The Misfits - Theme For A Jackal.flac	-7.400002	0.999969
redacted.ch/Misfits - Static Age  (1997) [FLAC]	15 - The Misfits - She.flac	-7.019997	0.966003
redacted.ch/Misfits - Static Age  (1997) [FLAC]	16 - The Misfits - Spinal Remains.flac	-7.269997	0.966034
redacted.ch/Misfits - Static Age  (1997) [FLAC]	17 - The Misfits - In the Doorway.flac	-7.139999	0.965973
redacted.ch/Misfits - Static Age  (1997) [FLAC]	18 - The Misfits - [Untitled].flac	-4.260002	0.966034
redacted.ch/Misfits - Static Age  (1997) [FLAC]	19 - The Misfits - [Untitled].flac	64.820000	0.000031
redacted.ch/Modest Mouse - Good News For People Who Love Bad News [FLAC]	Modest Mouse - Good News For People Who Love Bad News - 01 - Horn Intro.flac	-8.610001	0.999969
redacted.ch/Modest Mouse - Good News For People Who Love Bad News [FLAC]	Modest Mouse - Good News For People Who Love Bad News - 02 - The World At Large.flac	-5.510002	0.999023
redacted.ch/Modest Mouse - Good News For People Who Love Bad News [FLAC]	Modest Mouse - Good News For People Who Love Bad News - 03 - Float On.flac	-8.849998	0.999969
redacted.ch/Modest Mouse - Good News For People Who Love Bad News [FLAC]	Modest Mouse - Good News For People Who Love Bad News - 04 - Ocean Breathes Salty.flac	-9.910004	0.999969
redacted.ch/Modest Mouse - Good News For People Who Love Bad News [FLAC]	Modest Mouse - Good News For People Who Love Bad News - 05 - Dig Your Grave.flac	-4.480003	0.999023
redacted.ch/Modest Mouse - Good News For People Who Love Bad News [FLAC]	Modest Mouse - Good News For People Who Love Bad News - 06 - Bury Me With It.flac	-9.949997	0.999969
redacted.ch/Modest Mouse - Good News For People Who Love Bad News [FLAC]	Modest Mouse - Good News For People Who Love Bad News - 07 - Dance Hall.flac	-9.540001	0.999969
redacted.ch/Modest Mouse - Good News For People Who Love Bad News [FLAC]	Modest Mouse - Good News For People Who Love Bad News - 08 - Bukowski.flac	-5.279999	0.999054
redacted.ch/Modest Mouse - Good News For People Who Love Bad News [FLAC]	Modest Mouse - Good News For People Who Love Bad News - 09 - This Devil's Workday.flac	-8.769997	0.999023
redacted.ch/Modest Mouse - Good News For People Who Love Bad News [FLAC]	Modest Mouse - Good News For People Who Love Bad News - 10 - The View.flac	-8.849998	0.999969
redacted.ch/Modest Mouse - Good News For People Who Love Bad News [FLAC]	Modest Mouse - Good News For People Who Love Bad News - 11 - Satin In A Coffin.flac	-7.650002	0.999390
redacted.ch/Modest Mouse - Good News For People Who Love Bad News [FLAC]	Modest Mouse - Good News For People Who Love Bad News - 12 - Interlude (Milo).flac	-1.930000	0.999023
redacted.ch/Modest Mouse - Good News For People Who Love Bad News [FLAC]	Modest Mouse - Good News For People Who Love Bad News - 13 - Blame It On The Tetons.flac	-2.559998	0.999023
redacted.ch/Modest Mouse - Good News For People Who Love Bad News [FLAC]	Modest Mouse - Good News For People Who Love Bad News - 14 - Black Cadillacs.flac	-9.330002	0.999969
redacted.ch/Modest Mouse - Good News For People Who Love Bad News [FLAC]	Modest Mouse - Good News For People Who Love Bad News - 15 - One Chance.flac	-9.129997	0.999969
redacted.ch/Modest Mouse - Good News For People Who Love Bad News [FLAC]	Modest Mouse - Good News For People Who Love Bad News - 16 - The Good Times Are Killing Me.flac	-7.110001	0.979675
redacted.ch/Molotov - 1997 - Donde Jugaran Las Ninas	01. Que No Te Haga Bobo Jacobo.flac	-9.090004	1.000000
redacted.ch/Molotov - 1997 - Donde Jugaran Las Ninas	02. Molotov Cocktail Party.flac	-10.120003	1.000000
redacted.ch/Molotov - 1997 - Donde Jugaran Las Ninas	03. Voto Latino.flac	-9.480003	1.000000
redacted.ch/Molotov - 1997 - Donde Jugaran Las Ninas	04. Chinga Tu Madre.flac	-8.980003	1.000000
redacted.ch/Molotov - 1997 - Donde Jugaran Las Ninas	05. Gimme Tha Power.flac	-5.820000	1.000000
redacted.ch/Molotov - 1997 - Donde Jugaran Las Ninas	06. Matate Tete.flac	-8.790001	1.000000
redacted.ch/Molotov - 1997 - Donde Jugaran Las Ninas	07. Mas Vale Cholo.flac	-8.279999	1.000000
redacted.ch/Molotov - 1997 - Donde Jugaran Las Ninas	08. Use It Or Lose It.flac	-7.699997	1.000000
redacted.ch/Molotov - 1997 - Donde Jugaran Las Ninas	09. Puto.flac	-8.879997	1.000000
redacted.ch/Molotov - 1997 - Donde Jugaran Las Ninas	10. Por Que No Te Haces Para Alla ... Al Mas Alla.flac	-7.470001	1.000000
redacted.ch/Molotov - 1997 - Donde Jugaran Las Ninas	11. Cerdo.flac	-7.139999	1.000000
redacted.ch/Molotov - 1997 - Donde Jugaran Las Ninas	12. Quitate Que Ma' sturbas (Perra Arrabalera).flac	-8.540001	1.000000
redacted.ch/Mouthwash - 1000 Dreams FLAC	01 Mouthwash - Drop The Bomb.flac	-9.400002	0.998871
redacted.ch/Mouthwash - 1000 Dreams FLAC	02 Mouthwash - We Evolve.flac	-7.790001	0.998871
redacted.ch/Mouthwash - 1000 Dreams FLAC	03 Mouthwash - My Kind Of Love.flac	-10.230003	0.998871
redacted.ch/Mouthwash - 1000 Dreams FLAC	04 Mouthwash - Fools Gold.flac	-9.889999	0.998871
redacted.ch/Mouthwash - 1000 Dreams FLAC	05 Mouthwash - One For Sorrow.flac	-10.550003	0.998871
redacted.ch/Mouthwash - 1000 Dreams FLAC	06 Mouthwash - Competing For Frequency.flac	-9.830002	0.998871
redacted.ch/Mouthwash - 1000 Dreams FLAC	07 Mouthwash - Live Like Kings.flac	-8.400002	0.998871
redacted.ch/Mouthwash - 1000 Dreams FLAC	08 Mouthwash - Through The Gray.flac	-10.580002	0.998871
redacted.ch/Mouthwash - 1000 Dreams FLAC	09 Mouthwash - Babylondon.flac	-9.779999	0.998871
redacted.ch/Mouthwash - 1000 Dreams FLAC	10 Mouthwash - Neon Heartbeat.flac	-9.699997	0.998871
redacted.ch/Mouthwash - 1000 Dreams FLAC	11 Mouthwash - Saving Grace.flac	-6.500000	0.840454
redacted.ch/Mustard_Plug-Big_Daddy_Multitude-1993-LOSSLESS-VLR	01-mustard_plug-skank_by_numbers-vlr.flac	-0.400002	0.999939
redacted.ch/Mustard_Plug-Big_Daddy_Multitude-1993-LOSSLESS-VLR	02-mustard_plug-too_stoopid-vlr.flac	-3.900002	0.999969
redacted.ch/Mustard_Plug-Big_Daddy_Multitude-1993-LOSSLESS-VLR	03-mustard_plug-schoolboy-vlr.flac	-1.209999	0.999939
redacted.ch/Mustard_Plug-Big_Daddy_Multitude-1993-LOSSLESS-VLR	04-mustard_plug-mr_smiley-vlr.flac	-1.340004	0.999939
redacted.ch/Mustard_Plug-Big_Daddy_Multitude-1993-LOSSLESS-VLR	05-mustard_plug-ball_park_skank-vlr.flac	0.900002	0.999969
redacted.ch/Mustard_Plug-Big_Daddy_Multitude-1993-LOSSLESS-VLR	06-mustard_plug-thigh_high_nylons-vlr.flac	-3.010002	0.999939
redacted.ch/Mustard_Plug-Big_Daddy_Multitude-1993-LOSSLESS-VLR	07-mustard_plug-dysfunktional-vlr.flac	-1.570000	0.999969
redacted.ch/Mustard_Plug-Big_Daddy_Multitude-1993-LOSSLESS-VLR	08-mustard_plug-alone-vlr.flac	-1.660004	0.999939
redacted.ch/Mustard_Plug-Big_Daddy_Multitude-1993-LOSSLESS-VLR	09-mustard_plug-summertime-vlr.flac	-1.529999	0.999969
redacted.ch/Mustard_Plug-Big_Daddy_Multitude-1993-LOSSLESS-VLR	10-mustard_plug-murder_in_tulip_city-vlr.flac	-1.860001	0.999969
redacted.ch/Mustard_Plug-Big_Daddy_Multitude-1993-LOSSLESS-VLR	11-mustard_plug-gum-vlr.flac	-1.919998	0.999969
redacted.ch/Mustard_Plug-Big_Daddy_Multitude-1993-LOSSLESS-VLR	12-mustard_plug-i_made_love_to_a_martian-vlr.flac	-1.910004	0.999969
redacted.ch/Mustard_Plug-Big_Daddy_Multitude-1993-LOSSLESS-VLR	13-mustard_plug-brain_on_ska-vlr.flac	-2.389999	0.999969
redacted.ch/Mustard_Plug-Big_Daddy_Multitude-1993-LOSSLESS-VLR	14-mustard_plug-insomnia-vlr.flac	-0.320000	0.999969
redacted.ch/Mustard_Plug-Big_Daddy_Multitude-1993-LOSSLESS-VLR	15-mustard_plug-average_guy-vlr.flac	-0.379997	0.999969
redacted.ch/Mustard_Plug-Big_Daddy_Multitude-1993-LOSSLESS-VLR	16-mustard_plug-grow_up-vlr.flac	-1.830002	0.999969
redacted.ch/Nevermore - 2005 - This Godless Endeavor [FLAC]	01 - Born.flac	-10.180000	0.994385
redacted.ch/Nevermore - 2005 - This Godless Endeavor [FLAC]	02 - Final Product.flac	-9.559998	0.996948
redacted.ch/Nevermore - 2005 - This Godless Endeavor [FLAC]	03 - My Acid Words.flac	-9.160004	0.995422
redacted.ch/Nevermore - 2005 - This Godless Endeavor [FLAC]	04 - Bittersweet Feast.flac	-9.120003	0.994446
redacted.ch/Nevermore - 2005 - This Godless Endeavor [FLAC]	05 - Sentient 6.flac	-9.120003	0.994446
redacted.ch/Nevermore - 2005 - This Godless Endeavor [FLAC]	06 - Medicated Nation.flac	-9.000000	0.994659
redacted.ch/Nevermore - 2005 - This Godless Endeavor [FLAC]	07 - The Holocaust Of Thought.flac	-5.199997	1.000000
redacted.ch/Nevermore - 2005 - This Godless Endeavor [FLAC]	08 - Sell My Heart For Stones.flac	-8.940002	0.994446
redacted.ch/Nevermore - 2005 - This Godless Endeavor [FLAC]	09 - The Psalm Of Lydia.flac	-9.660004	0.999359
redacted.ch/Nevermore - 2005 - This Godless Endeavor [FLAC]	10 - A Future Uncertain.flac	-9.050003	1.000000
redacted.ch/Nevermore - 2005 - This Godless Endeavor [FLAC]	11 - This Godless Endeavor.flac	-9.370003	1.000000
redacted.ch/Nirvana - Nevermind MFSL UDCD 666	01 Smells Like Teen Spirit.flac	-5.169998	0.961945
redacted.ch/Nirvana - Nevermind MFSL UDCD 666	02 In Bloom.flac	-3.889999	0.984100
redacted.ch/Nirvana - Nevermind MFSL UDCD 666	03 Come As You Are.flac	-2.580002	0.965912
redacted.ch/Nirvana - Nevermind MFSL UDCD 666	04 Breed.flac	-3.889999	0.961273
redacted.ch/Nirvana - Nevermind MFSL UDCD 666	05 Lithium.flac	-3.739998	0.965912
redacted.ch/Nirvana - Nevermind MFSL UDCD 666	06 Polly.flac	1.090000	0.611298
redacted.ch/Nirvana - Nevermind MFSL UDCD 666	07 Territorial Pissings.flac	-4.629997	0.975769
redacted.ch/Nirvana - Nevermind MFSL UDCD 666	08 Drain You.flac	-2.879997	0.979462
redacted.ch/Nirvana - Nevermind MFSL UDCD 666	09 Lounge Act.flac	-3.949997	0.885162
redacted.ch/Nirvana - Nevermind MFSL UDCD 666	10 Stay Away.flac	-3.570000	0.977295
redacted.ch/Nirvana - Nevermind MFSL UDCD 666	11 On A Plain.flac	-3.790001	0.938629
redacted.ch/Nirvana - Nevermind MFSL UDCD 666	12 Something In The Way (Silent + Hidden Track).flac	-2.250000	0.950775
redacted.ch/nobody.one - Does [2012]	01. Challenge.flac	-6.940002	0.941620
redacted.ch/nobody.one - Does [2012]	02. Deadman.flac	-6.919998	0.941467
redacted.ch/nobody.one - Does [2012]	03. Farvel.flac	-5.010002	0.941437
redacted.ch/nobody.one - Does [2012]	04. Airblow.flac	-6.860001	0.941650
redacted.ch/nobody.one - Does [2012]	05. Shuffled God.flac	-5.260002	0.941498
redacted.ch/nobody.one - Does [2012]	06. Swabbie The Smuggler.flac	-5.169998	0.941467
redacted.ch/nobody.one - Does [2012]	07. Horizon.flac	-6.650002	0.941864
redacted.ch/nobody.one - Does [2012]	08. Aurora.flac	-5.840004	0.941223
redacted.ch/nobody.one - Does [2012]	09. Sunday.flac	-7.080002	0.941559
redacted.ch/nobody.one - Does [2012]	10. Cosmos.flac	1.639999	0.941040
redacted.ch/nobody.one - Does [2012]	11. Hover.flac	-1.980003	0.938110
redacted.ch/nobody.one - Does [2012]	12. Humility.flac	-2.580002	0.941223
redacted.ch/nobody.one - Head Moves [2010][FLAC]	01. Leerg.flac	-7.639999	0.987091
redacted.ch/nobody.one - Head Moves [2010][FLAC]	02. Change.flac	-7.419998	0.988007
redacted.ch/nobody.one - Head Moves [2010][FLAC]	03. Bob.flac	-8.599998	0.991516
redacted.ch/nobody.one - Head Moves [2010][FLAC]	04. Astronomy.flac	-5.239998	0.982574
redacted.ch/nobody.one - Head Moves [2010][FLAC]	05. JB.flac	-7.059998	0.988586
redacted.ch/nobody.one - Head Moves [2010][FLAC]	06. Milena (feat. Artem Abrosimov).flac	-7.199997	0.987488
redacted.ch/nobody.one - Head Moves [2010][FLAC]	07. Lifeline.flac	-6.940002	0.988251
redacted.ch/nobody.one - Head Moves [2010][FLAC]	08. The Duck Song.flac	-7.809998	0.989105
redacted.ch/nobody.one - Head Moves [2010][FLAC]	09. Set.flac	-8.010002	0.988007
redacted.ch/nobody.one - Head Moves [2010][FLAC]	10. Through.flac	-8.040001	0.988617
redacted.ch/nobody.one - Head Moves [2010][FLAC]	11. Touching The Void.flac	64.820000	0.000244
redacted.ch/nobody.one - Head Moves [2010][FLAC]	12. Soul (live 2006).flac	-11.599998	1.000000
redacted.ch/Nobody.One - The Wall Eater (2013) FLAC	01 - Bring It On.flac	-7.199997	0.999969
redacted.ch/Nobody.One - The Wall Eater (2013) FLAC	02 - Chasing The Beyond.flac	-7.239998	1.000000
redacted.ch/Nobody.One - The Wall Eater (2013) FLAC	03 - Edgie The Wall Eater.flac	-6.879997	0.999969
redacted.ch/Nobody.One - The Wall Eater (2013) FLAC	04 - Home.flac	-7.110001	0.999969
redacted.ch/Nobody.One - The Wall Eater (2013) FLAC	05 - Trapper.flac	-6.919998	0.999969
redacted.ch/Nobody.One - The Wall Eater (2013) FLAC	06 - Rumble.flac	-7.320000	0.999969
redacted.ch/Nobody.One - The Wall Eater (2013) FLAC	07 - The Fluke.flac	-7.010002	0.999969
redacted.ch/Nobody.One - The Wall Eater (2013) FLAC	08 - The Days of Yore.flac	-6.480003	0.999512
redacted.ch/Nobody.One - The Wall Eater (2013) FLAC	09 - Third From The Sun.flac	-1.989998	0.987823
redacted.ch/NoComply - 2002 - Your Life Is Your Direction [FLAC]	01 - Your Life (Is Your Direction).flac	-9.650002	0.983154
redacted.ch/NoComply - 2002 - Your Life Is Your Direction [FLAC]	02 - Decide.flac	-9.489998	0.983154
redacted.ch/NoComply - 2002 - Your Life Is Your Direction [FLAC]	03 - Misuse Of Control.flac	-9.320000	0.983154
redacted.ch/NoComply - 2002 - Your Life Is Your Direction [FLAC]	04 - Rejected.flac	-9.949997	0.983154
redacted.ch/NoComply - 2002 - Your Life Is Your Direction [FLAC]	05 - Faling From Crosses.flac	-10.230003	0.983154
redacted.ch/NoComply - 2002 - Your Life Is Your Direction [FLAC]	06 - Background Action.flac	-9.199997	0.983154
redacted.ch/NoComply - 2004 - With Windmills Turning Wrong Directions [FLAC]	01 - Future Template.flac	-11.410004	1.000000
redacted.ch/NoComply - 2004 - With Windmills Turning Wrong Directions [FLAC]	02 - Stories.flac	-10.570000	1.000000
redacted.ch/NoComply - 2004 - With Windmills Turning Wrong Directions [FLAC]	03 - The Price Of You.flac	-11.489998	1.000000
redacted.ch/NoComply - 2004 - With Windmills Turning Wrong Directions [FLAC]	04 - Sung By Mutes.flac	-11.019997	1.000000
redacted.ch/NoComply - 2004 - With Windmills Turning Wrong Directions [FLAC]	05 - Close To Hell And Burning.flac	-11.029999	1.000000
redacted.ch/NoComply - 2004 - With Windmills Turning Wrong Directions [FLAC]	06 - Veronika Decides To Die.flac	-11.239998	1.000000
redacted.ch/NoComply - 2004 - With Windmills Turning Wrong Directions [FLAC]	07 - Lifetime Of Destruction.flac	-11.239998	1.000000
redacted.ch/NoComply - 2004 - With Windmills Turning Wrong Directions [FLAC]	08 - A Bloody Welcome.flac	-11.260002	1.000000
redacted.ch/NoComply - 2004 - With Windmills Turning Wrong Directions [FLAC]	09 - The Against.flac	-10.459999	1.000000
redacted.ch/NoComply - 2004 - With Windmills Turning Wrong Directions [FLAC]	10 - Silencio.flac	-10.580002	1.000000
redacted.ch/NoComply - 2004 - With Windmills Turning Wrong Directions [FLAC]	11 - The Love Song.flac	-11.000000	1.000000
redacted.ch/NoComply - 2004 - With Windmills Turning Wrong Directions [FLAC]	12 - A Waking Dream.flac	-10.639999	1.000000
redacted.ch/No Doubt - Tragic Kingdom [1995] - FLAC	01 - Spiderwebs.flac	-6.919998	0.949249
redacted.ch/No Doubt - Tragic Kingdom [1995] - FLAC	02 - Excuse Me Mr..flac	-7.750000	0.950714
redacted.ch/No Doubt - Tragic Kingdom [1995] - FLAC	03 - Just A Girl.flac	-8.760002	0.957489
redacted.ch/No Doubt - Tragic Kingdom [1995] - FLAC	04 - Happy Now.flac	-7.730003	0.999969
redacted.ch/No Doubt - Tragic Kingdom [1995] - FLAC	05 - Different People.flac	-7.980003	0.950714
redacted.ch/No Doubt - Tragic Kingdom [1995] - FLAC	06 - Hey You.flac	-7.389999	0.950684
redacted.ch/No Doubt - Tragic Kingdom [1995] - FLAC	07 - The Climb.flac	-7.449997	0.950684
redacted.ch/No Doubt - Tragic Kingdom [1995] - FLAC	08 - Sixteen.flac	-7.209999	0.956757
redacted.ch/No Doubt - Tragic Kingdom [1995] - FLAC	09 - Sunday Morning.flac	-8.010002	0.919281
redacted.ch/No Doubt - Tragic Kingdom [1995] - FLAC	10 - Don't Speak.flac	-7.389999	0.933197
redacted.ch/No Doubt - Tragic Kingdom [1995] - FLAC	11 - You Can Do It.flac	-8.269997	0.956055
redacted.ch/No Doubt - Tragic Kingdom [1995] - FLAC	12 - World Go 'round.flac	-7.760002	0.952576
redacted.ch/No Doubt - Tragic Kingdom [1995] - FLAC	13 - End It On This.flac	-5.900002	0.950714
redacted.ch/No Doubt - Tragic Kingdom [1995] - FLAC	14 - Tragic Kingdom.flac	-6.879997	0.953308
redacted.ch/NOFX - 1994 - Punk in Drublic	01 - Linoleum.flac	-6.709999	0.990753
redacted.ch/NOFX - 1994 - Punk in Drublic	02 - Leave It Alone.flac	-5.830002	0.983765
redacted.ch/NOFX - 1994 - Punk in Drublic	03 - Dig.flac	-6.559998	0.971466
redacted.ch/NOFX - 1994 - Punk in Drublic	04 - The Cause.flac	-7.620003	0.941284
redacted.ch/NOFX - 1994 - Punk in Drublic	05 - Don't Call Me White.flac	-6.389999	0.946686
redacted.ch/NOFX - 1994 - Punk in Drublic	06 - My Heart Is Yearning.flac	-3.070000	0.932495
redacted.ch/NOFX - 1994 - Punk in Drublic	07 - Perfect Government.flac	-6.790001	0.990967
redacted.ch/NOFX - 1994 - Punk in Drublic	08 - The Brews.flac	-5.760002	0.937469
redacted.ch/NOFX - 1994 - Punk in Drublic	09 - The Quass.flac	-5.070000	0.957703
redacted.ch/NOFX - 1994 - Punk in Drublic	10 - Dying Degree.flac	-6.519997	0.862244
redacted.ch/NOFX - 1994 - Punk in Drublic	11 - Fleas.flac	-6.120003	0.987793
redacted.ch/NOFX - 1994 - Punk in Drublic	12 - Lori Meyers.flac	-7.349998	0.928986
redacted.ch/NOFX - 1994 - Punk in Drublic	13 - Jeff Wears Birkenstocks.flac	-5.470001	0.969269
redacted.ch/NOFX - 1994 - Punk in Drublic	14 - Punk Guy.flac	-6.889999	0.982941
redacted.ch/NOFX - 1994 - Punk in Drublic	15 - Happy Guy.flac	-6.870003	0.984924
redacted.ch/NOFX - 1994 - Punk in Drublic	16 - Reeko.flac	-7.370003	0.996307
redacted.ch/NOFX - 1994 - Punk in Drublic	17 - Scavenger Type.flac	-0.650002	0.860413
redacted.ch/NOFX - Pump Up The Valuum	01 - And Now For Something Completely Similar.flac	-9.040001	0.922638
redacted.ch/NOFX - Pump Up The Valuum	02 - Take Two Placebos And Call Me Lame.flac	-9.570000	0.977325
redacted.ch/NOFX - Pump Up The Valuum	03 - What's The Matter With Parents Today.flac	-9.269997	0.977325
redacted.ch/NOFX - Pump Up The Valuum	04 - Dinosaurs Will Die.flac	-10.779999	0.988647
redacted.ch/NOFX - Pump Up The Valuum	05 - Thank God It's Monday.flac	-10.949997	0.988678
redacted.ch/NOFX - Pump Up The Valuum	06 - Clams Have Feelings Too (Actually They Don't).flac	-9.959999	0.977325
redacted.ch/NOFX - Pump Up The Valuum	07 - Louise.flac	-8.849998	0.988647
redacted.ch/NOFX - Pump Up The Valuum	08 - Stranger Than Fishin.flac	-9.540001	0.977325
redacted.ch/NOFX - Pump Up The Valuum	09 - Pharmacist's Daughter.flac	-9.709999	0.977386
redacted.ch/NOFX - Pump Up The Valuum	10 - Bottles To The Ground.flac	-9.059998	0.988586
redacted.ch/NOFX - Pump Up The Valuum	11 - Total Bummer.flac	-9.340004	0.988647
redacted.ch/NOFX - Pump Up The Valuum	12 - My Vagina.flac	-7.900002	0.977325
redacted.ch/NOFX - Pump Up The Valuum	13 - Herojuana.flac	-9.260002	0.977295
redacted.ch/NOFX - Pump Up The Valuum	14 - Theme From A NOFX Album.flac	-10.129997	0.977325
redacted.ch/Oingo Boingo - 1985 - Dead Man's Party	01 - Just Another Day.flac	-4.629997	0.896454
redacted.ch/Oingo Boingo - 1985 - Dead Man's Party	02 - Dead Man's Party.flac	-4.090004	0.809082
redacted.ch/Oingo Boingo - 1985 - Dead Man's Party	03 - Heard Somebody Cry.flac	-4.220001	0.911407
redacted.ch/Oingo Boingo - 1985 - Dead Man's Party	04 - No One Lives Forever.flac	-3.650002	0.826965
redacted.ch/Oingo Boingo - 1985 - Dead Man's Party	05 - Stay.flac	-4.050003	0.910675
redacted.ch/Oingo Boingo - 1985 - Dead Man's Party	06 - Fool's Paradise.flac	-1.750000	0.677124
redacted.ch/Oingo Boingo - 1985 - Dead Man's Party	07 - Help Me.flac	-3.300003	0.898010
redacted.ch/Oingo Boingo - 1985 - Dead Man's Party	08 - Same Man I Was Before.flac	-2.559998	0.741669
redacted.ch/Oingo Boingo - 1985 - Dead Man's Party	09 - Weird Science.flac	-3.139999	0.805573
redacted.ch/Pepper - 2006 - No Shame (FLAC)	01 - Bring Me Along.flac	-10.169998	0.999725
redacted.ch/Pepper - 2006 - No Shame (FLAC)	02 - Rent.flac	-9.500000	0.989136
redacted.ch/Pepper - 2006 - No Shame (FLAC)	03 - No Control.flac	-10.599998	0.957123
redacted.ch/Pepper - 2006 - No Shame (FLAC)	04 - Green Hell.flac	-9.019997	1.000000
redacted.ch/Pepper - 2006 - No Shame (FLAC)	05 - Lost In America.flac	-10.830002	1.000000
redacted.ch/Pepper - 2006 - No Shame (FLAC)	06 - UFA Point Skit.flac	-1.540001	0.688965
redacted.ch/Pepper - 2006 - No Shame (FLAC)	07 - Your Face.flac	-8.090004	0.988556
redacted.ch/Pepper - 2006 - No Shame (FLAC)	08 - Nice Time.flac	-8.540001	0.999725
redacted.ch/Pepper - 2006 - No Shame (FLAC)	09 - Crazy Love.flac	-9.459999	0.988556
redacted.ch/Pepper - 2006 - No Shame (FLAC)	10 - Like Your Style.flac	-8.500000	0.988586
redacted.ch/Pepper - 2006 - No Shame (FLAC)	11 - Point and Shoot.flac	-9.849998	0.963745
redacted.ch/Pepper - 2006 - No Shame (FLAC)	12 - Old Time Problem.flac	-9.699997	0.988556
redacted.ch/Pepper - 2006 - No Shame (FLAC)	13 - Beers Skit.flac	-3.459999	0.779449
redacted.ch/Pepper - 2006 - No Shame (FLAC)	14 - Outta My Face.flac	-9.550003	1.000000
redacted.ch/Pepper - 2006 - No Shame (FLAC)	15 - Wanted.flac	-9.449997	0.998718
redacted.ch/Pepper - 2006 - No Shame (FLAC)	16 - Good Enough.flac	-9.129997	0.940308
redacted.ch/Pepper - 2006 - No Shame (FLAC)	17 - Zicky's Song.flac	-7.739998	0.999725
redacted.ch/Pepper - 2006 - No Shame (FLAC)	18 - Intro Skit.flac	-1.059998	0.543915
redacted.ch/Peter Bjorn and John - Writer's Block (2006) [FLAC]	01 Writer's Block.flac	7.320000	0.388611
redacted.ch/Peter Bjorn and John - Writer's Block (2006) [FLAC]	02 Objects of My Affection.flac	-8.430000	0.988678
redacted.ch/Peter Bjorn and John - Writer's Block (2006) [FLAC]	03 Young Folks.flac	-9.180000	0.988739
redacted.ch/Peter Bjorn and John - Writer's Block (2006) [FLAC]	04 Amsterdam.flac	-9.090004	0.988708
redacted.ch/Peter Bjorn and John - Writer's Block (2006) [FLAC]	05 Start to Melt.flac	-10.309998	0.998840
redacted.ch/Peter Bjorn and John - Writer's Block (2006) [FLAC]	06 Up Against the Wall.flac	-7.949997	0.998840
redacted.ch/Peter Bjorn and John - Writer's Block (2006) [FLAC]	07 Paris 2004.flac	-8.480003	0.988647
redacted.ch/Peter Bjorn and John - Writer's Block (2006) [FLAC]	08 Let's Call It Off.flac	-9.730003	0.988708
redacted.ch/Peter Bjorn and John - Writer's Block (2006) [FLAC]	09 The Chills.flac	-7.470001	0.998840
redacted.ch/Peter Bjorn and John - Writer's Block (2006) [FLAC]	10 Roll the Credits.flac	-9.059998	0.988678
redacted.ch/Peter Bjorn and John - Writer's Block (2006) [FLAC]	11 Poor Cow.flac	-8.059998	0.988647
redacted.ch/Placebo - Sleeping With Ghosts FLAC	01 - Bulletproof Cupid.flac	-9.290001	0.912598
redacted.ch/Placebo - Sleeping With Ghosts FLAC	02 - English Summer Rain.flac	-6.599998	0.944305
redacted.ch/Placebo - Sleeping With Ghosts FLAC	03 - This Picture.flac	-8.459999	0.912781
redacted.ch/Placebo - Sleeping With Ghosts FLAC	04 - Sleeping With Ghosts.flac	-4.360001	0.905426
redacted.ch/Placebo - Sleeping With Ghosts FLAC	05 - The Bitter End.flac	-9.300003	0.947083
redacted.ch/Placebo - Sleeping With Ghosts FLAC	06 - Something Rotten.flac	-10.230003	0.913940
redacted.ch/Placebo - Sleeping With Ghosts FLAC	07 - Plasticine.flac	-10.870003	0.938782
redacted.ch/Placebo - Sleeping With Ghosts FLAC	08 - Special Needs.flac	-6.430000	0.835876
redacted.ch/Placebo - Sleeping With Ghosts FLAC	09 - I'll Be Yours.flac	-2.830002	0.938293
redacted.ch/Placebo - Sleeping With Ghosts FLAC	10 - Second Sight.flac	-8.820000	0.829987
redacted.ch/Placebo - Sleeping With Ghosts FLAC	11 - Protect Me From What I Want.flac	-8.919998	0.811676
redacted.ch/Placebo - Sleeping With Ghosts FLAC	12 - Centrefolds.flac	-1.599998	0.946747
redacted.ch/Play	01 - Moby - Honey.flac	-4.830002	0.891266
redacted.ch/Play	02 - Moby - Find My Baby.flac	-7.169998	0.999969
redacted.ch/Play	03 - Moby - Porcelain.flac	-6.980003	0.999969
redacted.ch/Play	04 - Moby - Why Does My Heart Feel So Bad .flac	-7.709999	0.999969
redacted.ch/Play	05 - Moby - South Side.flac	-6.320000	0.999969
redacted.ch/Play	06 - Moby - Rushing.flac	-3.590004	0.999969
redacted.ch/Play	07 - Moby - Bodyrock.flac	-5.139999	0.999969
redacted.ch/Play	08 - Moby - Natural Blues.flac	-5.889999	0.999969
redacted.ch/Play	09 - Moby - Machete.flac	-6.090004	0.999969
redacted.ch/Play	10 - Moby - 7.flac	-1.830002	0.999969
redacted.ch/Play	11 - Moby - Run On.flac	-5.230003	0.999969
redacted.ch/Play	12 - Moby - Down Slow.flac	-3.239998	0.999969
redacted.ch/Play	13 - Moby - If Things Were Perfect.flac	-3.860001	0.999939
redacted.ch/Play	14 - Moby - Everloving.flac	-5.879997	0.999969
redacted.ch/Play	15 - Moby - Inside.flac	-5.739998	0.999969
redacted.ch/Play	16 - Moby - Guitar Flute & String.flac	-2.389999	0.824280
redacted.ch/Play	17 - Moby - The Sky Is Broken.flac	-4.650002	0.999969
redacted.ch/Play	18 - Moby - My Weakness.flac	-6.199997	0.999969
redacted.ch/Portishead - Dummy (1994) [FLAC] {Go! Beat Records 828 553-2}	01 - Mysterons.flac	-6.000000	0.977234
redacted.ch/Portishead - Dummy (1994) [FLAC] {Go! Beat Records 828 553-2}	02 - Sour Times.flac	-8.389999	0.977234
redacted.ch/Portishead - Dummy (1994) [FLAC] {Go! Beat Records 828 553-2}	03 - Strangers.flac	-8.309998	0.977234
redacted.ch/Portishead - Dummy (1994) [FLAC] {Go! Beat Records 828 553-2}	04 - It Could Be Sweet.flac	-4.900002	0.977234
redacted.ch/Portishead - Dummy (1994) [FLAC] {Go! Beat Records 828 553-2}	05 - Wandering Star.flac	-6.470001	0.977234
redacted.ch/Portishead - Dummy (1994) [FLAC] {Go! Beat Records 828 553-2}	06 - It's A Fire.flac	-4.580002	0.977234
redacted.ch/Portishead - Dummy (1994) [FLAC] {Go! Beat Records 828 553-2}	07 - Numb.flac	-8.199997	0.977234
redacted.ch/Portishead - Dummy (1994) [FLAC] {Go! Beat Records 828 553-2}	08 - Roads.flac	-6.720001	0.977234
redacted.ch/Portishead - Dummy (1994) [FLAC] {Go! Beat Records 828 553-2}	09 - Pedestal.flac	-4.040001	0.977234
redacted.ch/Portishead - Dummy (1994) [FLAC] {Go! Beat Records 828 553-2}	10 - Biscuit.flac	-7.669998	0.977234
redacted.ch/Portishead - Dummy (1994) [FLAC] {Go! Beat Records 828 553-2}	11 - Glory Box.flac	-6.940002	0.977234
redacted.ch/Raised Fist - Dedication	01 - Get This Right!.flac	-10.010002	0.988678
redacted.ch/Raised Fist - Dedication	02 - That's Why.flac	-10.889999	0.988678
redacted.ch/Raised Fist - Dedication	03 - Message Beneath Contempt.flac	-9.940002	0.988922
redacted.ch/Raised Fist - Dedication	04 - The People Behind.flac	-9.930000	0.988678
redacted.ch/Raised Fist - Dedication	05 - Disable Me.flac	-11.209999	0.988678
redacted.ch/Raised Fist - Dedication	06 - Killing Revenues.flac	-10.529999	0.988678
redacted.ch/Raised Fist - Dedication	07 - Illustration Of Desperation.flac	-10.389999	0.988678
redacted.ch/Raised Fist - Dedication	08 - Dedication.flac	-10.220001	0.988678
redacted.ch/Raised Fist - Dedication	09 - Silence Is The Key.flac	-10.449997	0.988678
redacted.ch/Raised Fist - Dedication	10 - Another Day.flac	-10.650002	0.988678
redacted.ch/Raised Fist - Dedication	11 - Between The Demons.flac	-10.830002	0.988678
redacted.ch/Raised Fist - Veil Of Ignorance - FLAC	01 - Raised Fist - Friends And Traitors.flac	-8.340004	1.000000
redacted.ch/Raised Fist - Veil Of Ignorance - FLAC	02 - Raised Fist - They Can't Keep Us Down.flac	-9.010002	1.000000
redacted.ch/Raised Fist - Veil Of Ignorance - FLAC	03 - Raised Fist - Wounds.flac	-9.160004	1.000000
redacted.ch/Raised Fist - Veil Of Ignorance - FLAC	04 - Raised Fist - Afraid.flac	-8.809998	1.000000
redacted.ch/Raised Fist - Veil Of Ignorance - FLAC	05 - Raised Fist - Slipping Into Coma.flac	-8.599998	1.000000
redacted.ch/Raised Fist - Veil Of Ignorance - FLAC	06 - Raised Fist - City Of Cold.flac	-8.620003	1.000000
redacted.ch/Raised Fist - Veil Of Ignorance - FLAC	07 - Raised Fist - Volcano Is Me.flac	-9.449997	1.000000
redacted.ch/Raised Fist - Veil Of Ignorance - FLAC	08 - Raised Fist - Disbelief.flac	-8.650002	1.000000
redacted.ch/Raised Fist - Veil Of Ignorance - FLAC	09 - Raised Fist - My Last Day.flac	-8.870003	1.000000
redacted.ch/Raised Fist - Veil Of Ignorance - FLAC	10 - Raised Fist - I Have To Pretend.flac	-9.519997	1.000000
redacted.ch/Raised Fist - Veil Of Ignorance - FLAC	11 - Raised Fist - Words And Phrases.flac	-9.980003	1.000000
redacted.ch/Raised Fist - Veil Of Ignorance - FLAC	12 - Raised Fist - Keeping It To Yourself.flac	-8.860001	1.000000
redacted.ch/Raised Fist - Veil Of Ignorance - FLAC	13 - Raised Fist - Never Negotiate.flac	-8.690002	1.000000
redacted.ch/Raised Fist - Veil Of Ignorance - FLAC	14 - Raised Fist - Out.flac	-9.400002	1.000000
redacted.ch/Rancid - Indestructible (2003) FLAC	01 - Indestructible.flac	-12.660004	0.982788
redacted.ch/Rancid - Indestructible (2003) FLAC	02 - Fall Back Down.flac	-11.840004	0.979401
redacted.ch/Rancid - Indestructible (2003) FLAC	03 - Red Hot Moon.flac	-11.269997	0.995697
redacted.ch/Rancid - Indestructible (2003) FLAC	04 - David Courtney.flac	-11.830002	0.995697
redacted.ch/Rancid - Indestructible (2003) FLAC	05 - Start Now.flac	-12.169998	0.988342
redacted.ch/Rancid - Indestructible (2003) FLAC	06 - Out Of Control.flac	-11.540001	0.965179
redacted.ch/Rancid - Indestructible (2003) FLAC	07 - Django.flac	-12.629997	0.996460
redacted.ch/Rancid - Indestructible (2003) FLAC	08 - Arrested In Shanghai.flac	-11.070000	0.996948
redacted.ch/Rancid - Indestructible (2003) FLAC	09 - Travis Bickle.flac	-12.419998	0.995697
redacted.ch/Rancid - Indestructible (2003) FLAC	10 - Memphis.flac	-12.290001	0.995697
redacted.ch/Rancid - Indestructible (2003) FLAC	11 - Spirit Of '87.flac	-12.389999	0.993073
redacted.ch/Rancid - Indestructible (2003) FLAC	12 - Ghost Band.flac	-11.889999	0.995697
redacted.ch/Rancid - Indestructible (2003) FLAC	13 - Tropical London.flac	-11.730003	0.973938
redacted.ch/Rancid - Indestructible (2003) FLAC	14 - Roadblock.flac	-11.739998	0.984100
redacted.ch/Rancid - Indestructible (2003) FLAC	15 - Born Frustrated.flac	-12.959999	0.979797
redacted.ch/Rancid - Indestructible (2003) FLAC	16 - Back Up Against The Wall.flac	-12.709999	0.987030
redacted.ch/Rancid - Indestructible (2003) FLAC	17 - Ivory Coast.flac	-12.040001	0.985596
redacted.ch/Rancid - Indestructible (2003) FLAC	18 - Stand Your Ground.flac	-12.139999	0.988464
redacted.ch/Rancid - Indestructible (2003) FLAC	19 - Otherside.flac	-11.269997	0.995697
redacted.ch/Razika - Program 91 (2011) - FLAC	01 - Youth.flac	-8.309998	0.987274
redacted.ch/Razika - Program 91 (2011) - FLAC	02 - Why Have We To Wait.flac	-8.379997	0.987488
redacted.ch/Razika - Program 91 (2011) - FLAC	03 - Vondt i hjertet.flac	-7.279999	0.987701
redacted.ch/Razika - Program 91 (2011) - FLAC	04 - Taste My Dream.flac	-7.559998	0.987457
redacted.ch/Razika - Program 91 (2011) - FLAC	05 - Aldri.flac	-7.080002	0.987366
redacted.ch/Razika - Program 91 (2011) - FLAC	06 - Nytt på nytt.flac	-8.239998	0.987762
redacted.ch/Razika - Program 91 (2011) - FLAC	07 - Eg vetsje.flac	-7.090004	0.988037
redacted.ch/Razika - Program 91 (2011) - FLAC	08 - Above All.flac	-7.930000	0.987488
redacted.ch/Razika - Program 91 (2011) - FLAC	09 - Hvem skal ha tro på deg nå.flac	-7.389999	0.987732
redacted.ch/Razika - Program 91 (2011) - FLAC	10 - Middelalder.flac	-7.540001	0.987335
redacted.ch/Razika - Program 91 (2011) - FLAC	11 - Walk In The Park.flac	-6.220001	0.987183
redacted.ch/!Razika - Ut til de andre (2015) [flac]	01 - Faen ta deg.flac	-9.840004	0.988708
redacted.ch/!Razika - Ut til de andre (2015) [flac]	02 - Første gangen om igjen.flac	-9.559998	0.988708
redacted.ch/!Razika - Ut til de andre (2015) [flac]	03 - Gutten i dongerijakke.flac	-8.959999	0.988708
redacted.ch/!Razika - Ut til de andre (2015) [flac]	04 - Mer.flac	-8.879997	0.988678
redacted.ch/!Razika - Ut til de andre (2015) [flac]	05 - Om igjen.flac	-8.949997	0.944214
redacted.ch/!Razika - Ut til de andre (2015) [flac]	06 - Før vi sovner.flac	-9.500000	0.988708
redacted.ch/!Razika - Ut til de andre (2015) [flac]	07 - Gi meg, gi meg, gi meg.flac	-9.510002	0.988708
redacted.ch/!Razika - Ut til de andre (2015) [flac]	08 - Vi som gråter.flac	-9.400002	0.977386
redacted.ch/!Razika - Ut til de andre (2015) [flac]	09 - Syndere i sommersol.flac	-9.180000	0.988708
redacted.ch/!Razika - Ut til de andre (2015) [flac]	10 - Kjedelig.flac	-8.739998	0.988708
redacted.ch/!Razika - Ut til de andre (2015) [flac]	11 - Det Embla sa.flac	-8.760002	0.988678
redacted.ch/!Razika - Ut til de andre (2015) [flac]	12 - Når alle sammen går så går du etter.flac	-9.690002	0.988708
redacted.ch/Red Hot Chili Peppers - 1989 - Mother's Milk (MFSL)	01 - Good Time Boys.flac	-4.320000	0.981110
redacted.ch/Red Hot Chili Peppers - 1989 - Mother's Milk (MFSL)	02 - Higher Ground.flac	-2.500000	0.951447
redacted.ch/Red Hot Chili Peppers - 1989 - Mother's Milk (MFSL)	03 - Subway To Venus.flac	-3.410004	0.952423
redacted.ch/Red Hot Chili Peppers - 1989 - Mother's Milk (MFSL)	04 - Magic Johnson.flac	-2.669998	0.946777
redacted.ch/Red Hot Chili Peppers - 1989 - Mother's Milk (MFSL)	05 - Nobody Weird Like Me.flac	-2.709999	0.970001
redacted.ch/Red Hot Chili Peppers - 1989 - Mother's Milk (MFSL)	06 - Knock Me Down.flac	-3.029999	0.921082
redacted.ch/Red Hot Chili Peppers - 1989 - Mother's Milk (MFSL)	07 - Taste The Pain.flac	-2.160004	0.909973
redacted.ch/Red Hot Chili Peppers - 1989 - Mother's Milk (MFSL)	08 - Stone Cold Bush.flac	-2.980003	0.960907
redacted.ch/Red Hot Chili Peppers - 1989 - Mother's Milk (MFSL)	09 - Fire.flac	-5.910004	0.960144
redacted.ch/Red Hot Chili Peppers - 1989 - Mother's Milk (MFSL)	10 - Pretty Little Ditty.flac	-1.610001	0.585022
redacted.ch/Red Hot Chili Peppers - 1989 - Mother's Milk (MFSL)	11 - Punk Rock Classic.flac	-3.949997	0.971985
redacted.ch/Red Hot Chili Peppers - 1989 - Mother's Milk (MFSL)	12 - Sexy Mexican Maid.flac	-2.379997	0.951691
redacted.ch/Red Hot Chili Peppers - 1989 - Mother's Milk (MFSL)	13 - Johnny, Kick A Hole In The Sky.flac	-3.410004	0.974670
redacted.ch/Red Hot Chili Peppers - By The Way (2002) [FLAC]	01 - By The Way.flac	-9.220001	0.988556
redacted.ch/Red Hot Chili Peppers - By The Way (2002) [FLAC]	02 - Universally Speaking.flac	-9.400002	0.988556
redacted.ch/Red Hot Chili Peppers - By The Way (2002) [FLAC]	03 - This Is The Place.flac	-10.040001	0.988556
redacted.ch/Red Hot Chili Peppers - By The Way (2002) [FLAC]	04 - Dosed.flac	-9.209999	0.988556
redacted.ch/Red Hot Chili Peppers - By The Way (2002) [FLAC]	05 - Don't Forget Me.flac	-9.599998	0.999969
redacted.ch/Red Hot Chili Peppers - By The Way (2002) [FLAC]	06 - The Zephyr Song.flac	-9.790001	0.988556
redacted.ch/Red Hot Chili Peppers - By The Way (2002) [FLAC]	07 - Can't Stop.flac	-10.139999	0.988556
redacted.ch/Red Hot Chili Peppers - By The Way (2002) [FLAC]	08 - I Could Die For You.flac	-9.940002	0.988556
redacted.ch/Red Hot Chili Peppers - By The Way (2002) [FLAC]	09 - Midnight.flac	-10.910004	0.988556
redacted.ch/Red Hot Chili Peppers - By The Way (2002) [FLAC]	10 - Throw Away Your Television.flac	-9.199997	0.988556
redacted.ch/Red Hot Chili Peppers - By The Way (2002) [FLAC]	11 - Cabron.flac	-9.840004	0.988556
redacted.ch/Red Hot Chili Peppers - By The Way (2002) [FLAC]	12 - Tear.flac	-10.000000	0.988556
redacted.ch/Red Hot Chili Peppers - By The Way (2002) [FLAC]	13 - On Mercury.flac	-11.010002	0.988556
redacted.ch/Red Hot Chili Peppers - By The Way (2002) [FLAC]	14 - Minor Thing.flac	-10.090004	0.988556
redacted.ch/Red Hot Chili Peppers - By The Way (2002) [FLAC]	15 - Warm Tape.flac	-10.440002	0.988586
redacted.ch/Red Hot Chili Peppers - By The Way (2002) [FLAC]	16 - Venice Queen.flac	-9.680000	0.988556
redacted.ch/Reel Big Fish - 1996 - Turn The Radio Off (FLAC)	01 - Sell Out.flac	-7.349998	0.958130
redacted.ch/Reel Big Fish - 1996 - Turn The Radio Off (FLAC)	02 - Trendy.flac	-7.110001	0.958130
redacted.ch/Reel Big Fish - 1996 - Turn The Radio Off (FLAC)	03 - Join The Club.flac	-6.059998	0.957916
redacted.ch/Reel Big Fish - 1996 - Turn The Radio Off (FLAC)	04 - She Has A Girlfriend Now.flac	-7.919998	0.958374
redacted.ch/Reel Big Fish - 1996 - Turn The Radio Off (FLAC)	05 - Snoop Dog, Baby.flac	-7.190002	0.957153
redacted.ch/Reel Big Fish - 1996 - Turn The Radio Off (FLAC)	06 - Beer.flac	-6.750000	0.956726
redacted.ch/Reel Big Fish - 1996 - Turn The Radio Off (FLAC)	07 - 241.flac	-6.599998	0.958008
redacted.ch/Reel Big Fish - 1996 - Turn The Radio Off (FLAC)	08 - Everything Sucks.flac	-6.629997	0.956512
redacted.ch/Reel Big Fish - 1996 - Turn The Radio Off (FLAC)	09 - S.R..flac	-5.599998	0.955719
redacted.ch/Reel Big Fish - 1996 - Turn The Radio Off (FLAC)	10 - Skatanic.flac	-7.989998	0.956482
redacted.ch/Reel Big Fish - 1996 - Turn The Radio Off (FLAC)	11 - All I Want Is More.flac	-7.129997	0.956451
redacted.ch/Reel Big Fish - 1996 - Turn The Radio Off (FLAC)	12 - Nothin'.flac	-6.940002	0.956146
redacted.ch/Reel Big Fish - 1996 - Turn The Radio Off (FLAC)	13 - Say 'Ten'.flac	-7.570000	0.957245
redacted.ch/Reel Big Fish - 1996 - Turn The Radio Off (FLAC)	14 - I'll Never Be.flac	-6.540001	0.958130
redacted.ch/Reel Big Fish - 1996 - Turn The Radio Off (FLAC)	15 - Alternative Baby.flac	-6.669998	0.958984
redacted.ch/Reel Big Fish - 1996 - Turn The Radio Off (FLAC)	16 - Secret Song.flac	3.150002	0.202545
redacted.ch/Reel Big Fish - 2002 - Cheer Up! [FLAC]	01 - Good Thing.flac	-10.440002	0.999969
redacted.ch/Reel Big Fish - 2002 - Cheer Up! [FLAC]	02 - Somebody Loved Me.flac	-10.489998	0.999969
redacted.ch/Reel Big Fish - 2002 - Cheer Up! [FLAC]	03 - Ban The Tube Top.flac	-10.220001	0.999969
redacted.ch/Reel Big Fish - 2002 - Cheer Up! [FLAC]	04 - Cheer Up.flac	-9.820000	0.999969
redacted.ch/Reel Big Fish - 2002 - Cheer Up! [FLAC]	05 - Where Have You Been.flac	-10.050003	0.999969
redacted.ch/Reel Big Fish - 2002 - Cheer Up! [FLAC]	06 - Suckers.flac	-10.279999	0.999969
redacted.ch/Reel Big Fish - 2002 - Cheer Up! [FLAC]	07 - What Are Friends For.flac	-10.290001	1.000000
redacted.ch/Reel Big Fish - 2002 - Cheer Up! [FLAC]	08 - A Little Doubt Goes A Long Way.flac	-9.849998	0.999969
redacted.ch/Reel Big Fish - 2002 - Cheer Up! [FLAC]	09 - Dateless Losers.flac	-10.300003	1.000000
redacted.ch/Reel Big Fish - 2002 - Cheer Up! [FLAC]	10 - Valerie.flac	-9.449997	1.000000
redacted.ch/Reel Big Fish - 2002 - Cheer Up! [FLAC]	11 - Rock 'n' Roll Is Bitchin'.flac	-10.699997	0.999969
redacted.ch/Reel Big Fish - 2002 - Cheer Up! [FLAC]	12 - New York, New York.flac	-8.550003	0.999969
redacted.ch/Reel Big Fish - 2002 - Cheer Up! [FLAC]	13 - Sayonara Senorita.flac	-9.559998	0.999969
redacted.ch/Reel Big Fish - 2002 - Cheer Up! [FLAC]	14 - Boss DJ.flac	-10.099998	0.999969
redacted.ch/Reel Big Fish - 2002 - Cheer Up! [FLAC]	15 - Brand New Hero.flac	-10.260002	0.999969
redacted.ch/Reel Big Fish - 2002 - Cheer Up! [FLAC]	16 - Drunk Again.flac	-10.000000	0.999969
redacted.ch/Refused - The Shape Of Punk To Come DVD-Audio 2.0	01. Worms Of The Senses  Faculties Of The Skull.flac	-5.870003	0.990681
redacted.ch/Refused - The Shape Of Punk To Come DVD-Audio 2.0	02. Liberation Frequency.flac	-6.029999	0.993656
redacted.ch/Refused - The Shape Of Punk To Come DVD-Audio 2.0	03. The Deadly Rhythm.flac	-6.379997	0.984039
redacted.ch/Refused - The Shape Of Punk To Come DVD-Audio 2.0	04. Summerholidays Vs. Punkroutine.flac	-5.940002	0.980553
redacted.ch/Refused - The Shape Of Punk To Come DVD-Audio 2.0	05. Bruitist Pome #5.flac	-2.019997	0.944509
redacted.ch/Refused - The Shape Of Punk To Come DVD-Audio 2.0	06. New Noise.flac	-5.260002	0.982736
redacted.ch/Refused - The Shape Of Punk To Come DVD-Audio 2.0	07. The Refused Party Program.flac	-5.840004	0.981363
redacted.ch/Refused - The Shape Of Punk To Come DVD-Audio 2.0	08. Protest Song '68.flac	-5.449997	1.000000
redacted.ch/Refused - The Shape Of Punk To Come DVD-Audio 2.0	09. Refused Are Fuckin Dead.flac	-6.599998	0.995601
redacted.ch/Refused - The Shape Of Punk To Come DVD-Audio 2.0	10. The Shape Of Punk To Come.flac	-5.900002	0.985196
redacted.ch/Refused - The Shape Of Punk To Come DVD-Audio 2.0	11. Tannhäuser  Derivè.flac	-6.320000	0.990289
redacted.ch/Refused - The Shape Of Punk To Come DVD-Audio 2.0	12. The Apollo Programme Was A Hoax.flac	2.410000	0.977979
redacted.ch/Rise Against - 2006 - The Sufferer & the Witness	01 - Chamber the Cartridge.flac	-10.480003	0.966675
redacted.ch/Rise Against - 2006 - The Sufferer & the Witness	02 - Injection.flac	-10.620003	1.000000
redacted.ch/Rise Against - 2006 - The Sufferer & the Witness	03 - Ready to Fall.flac	-10.040001	0.966553
redacted.ch/Rise Against - 2006 - The Sufferer & the Witness	04 - Bricks.flac	-10.510002	0.980347
redacted.ch/Rise Against - 2006 - The Sufferer & the Witness	05 - Under the Knife.flac	-9.919998	0.969025
redacted.ch/Rise Against - 2006 - The Sufferer & the Witness	06 - Prayer of the Refugee.flac	-10.639999	0.966644
redacted.ch/Rise Against - 2006 - The Sufferer & the Witness	07 - Drones.flac	-10.150002	0.971375
redacted.ch/Rise Against - 2006 - The Sufferer & the Witness	08 - The Approaching Curve.flac	-9.239998	0.966614
redacted.ch/Rise Against - 2006 - The Sufferer & the Witness	09 - Worth Dying For.flac	-9.849998	0.974243
redacted.ch/Rise Against - 2006 - The Sufferer & the Witness	10 - Behind Closed Doors.flac	-10.459999	0.966675
redacted.ch/Rise Against - 2006 - The Sufferer & the Witness	11 - Roadside.flac	-7.379997	0.966431
redacted.ch/Rise Against - 2006 - The Sufferer & the Witness	12 - The Good Left Undone.flac	-9.639999	0.966553
redacted.ch/Rise Against - 2006 - The Sufferer & the Witness	13 - Survive.flac	-9.970001	0.966675
redacted.ch/Rise Against - 2011 - Endgame [FLAC]	01 - Architects.flac	-11.129997	1.000000
redacted.ch/Rise Against - 2011 - Endgame [FLAC]	02 - Help Is On The Way.flac	-10.720001	1.000000
redacted.ch/Rise Against - 2011 - Endgame [FLAC]	03 - Make It Stop (September's Children).flac	-10.629997	1.000000
redacted.ch/Rise Against - 2011 - Endgame [FLAC]	04 - Disparity By Design.flac	-10.470001	1.000000
redacted.ch/Rise Against - 2011 - Endgame [FLAC]	05 - Satellite.flac	-10.389999	1.000000
redacted.ch/Rise Against - 2011 - Endgame [FLAC]	06 - Midnight Hands.flac	-10.519997	1.000000
redacted.ch/Rise Against - 2011 - Endgame [FLAC]	07 - Survivor Guilt.flac	-10.669998	1.000000
redacted.ch/Rise Against - 2011 - Endgame [FLAC]	08 - Broken Mirrors.flac	-10.500000	1.000000
redacted.ch/Rise Against - 2011 - Endgame [FLAC]	09 - Wait For Me.flac	-10.370003	1.000000
redacted.ch/Rise Against - 2011 - Endgame [FLAC]	10 - A Gentlemen's Coup.flac	-10.540001	1.000000
redacted.ch/Rise Against - 2011 - Endgame [FLAC]	11 - This Is Letting Go.flac	-10.320000	1.000000
redacted.ch/Rise Against - 2011 - Endgame [FLAC]	12 - Endgame.flac	-9.849998	1.000000
redacted.ch/Rise Against - Revolutions Per Minute (2003) [FLAC]	01. Black Masks & Gasoline.flac	-11.290001	0.966309
redacted.ch/Rise Against - Revolutions Per Minute (2003) [FLAC]	02. Heaven Knows.flac	-11.110001	0.966309
redacted.ch/Rise Against - Revolutions Per Minute (2003) [FLAC]	03. Dead Ringer.flac	-10.940002	0.966309
redacted.ch/Rise Against - Revolutions Per Minute (2003) [FLAC]	04. Halfway There.flac	-10.830002	0.966309
redacted.ch/Rise Against - Revolutions Per Minute (2003) [FLAC]	05. Like The Angel.flac	-11.059998	0.966309
redacted.ch/Rise Against - Revolutions Per Minute (2003) [FLAC]	06. Voices Off Camera.flac	-11.050003	0.966309
redacted.ch/Rise Against - Revolutions Per Minute (2003) [FLAC]	07. Blood Red, White, & Blue.flac	-11.120003	0.966309
redacted.ch/Rise Against - Revolutions Per Minute (2003) [FLAC]	08. Broken English.flac	-10.430000	0.966309
redacted.ch/Rise Against - Revolutions Per Minute (2003) [FLAC]	09. Last Chance Blueprint.flac	-11.019997	0.966278
redacted.ch/Rise Against - Revolutions Per Minute (2003) [FLAC]	10. To The Core.flac	-10.760002	0.966278
redacted.ch/Rise Against - Revolutions Per Minute (2003) [FLAC]	11. Torches.flac	-10.660004	0.966309
redacted.ch/Rise Against - Revolutions Per Minute (2003) [FLAC]	12. Amber Changing.flac	-10.849998	0.966309
redacted.ch/Rise Against - Revolutions Per Minute (2003) [FLAC]	13. Any Way You Want It.flac	-10.510002	0.966309
redacted.ch/Rotfront - 2011 - Visafree [FLAC]	01 - VisaFree.flac	-10.250000	0.966095
redacted.ch/Rotfront - 2011 - Visafree [FLAC]	02 - Eyn Tsvey.flac	-10.820000	0.968201
redacted.ch/Rotfront - 2011 - Visafree [FLAC]	03 - Gay, Gypsy & Jew.flac	-11.029999	0.983643
redacted.ch/Rotfront - 2011 - Visafree [FLAC]	04 - Revolution Disco.flac	-10.389999	0.990967
redacted.ch/Rotfront - 2011 - Visafree [FLAC]	05 - Cosmos.flac	-10.519997	0.966095
redacted.ch/Rotfront - 2011 - Visafree [FLAC]	06 - Vodka & Garlic.flac	-10.760002	0.966125
redacted.ch/Rotfront - 2011 - Visafree [FLAC]	07 - Money Money Money.flac	-11.150002	0.966095
redacted.ch/Rotfront - 2011 - Visafree [FLAC]	08 - Real Berlin Wedding.flac	-10.360001	0.966095
redacted.ch/Rotfront - 2011 - Visafree [FLAC]	09 - Csöváz.flac	-9.260002	0.966034
redacted.ch/Rotfront - 2011 - Visafree [FLAC]	10 - Live Is Life.flac	-10.019997	0.966095
redacted.ch/Rotfront - 2011 - Visafree [FLAC]	11 - No Sleep Till Berlin.flac	-10.099998	0.966431
redacted.ch/Rotfront - 2011 - Visafree [FLAC]	12 - Village Superstar.flac	-10.059998	0.862030
redacted.ch/Rotfront - 2011 - Visafree [FLAC]	13 - James Bondski.flac	-10.209999	0.966095
redacted.ch/Rotfront - 2011 - Visafree [FLAC]	14 - Sigaretta.flac	-10.169998	0.966095
redacted.ch/Rotfront - 2011 - Visafree [FLAC]	15 - Backsteinpulver.flac	-8.769997	0.966095
redacted.ch/Rubblebucket-OmegaLaLa(FLAC)	01 Rubblebucket - Down in the Yards.flac	-8.160004	0.988586
redacted.ch/Rubblebucket-OmegaLaLa(FLAC)	02 Rubblebucket - L'Homme.flac	-7.220001	0.988586
redacted.ch/Rubblebucket-OmegaLaLa(FLAC)	03 Rubblebucket - Silly Fathers.flac	-8.239998	0.987976
redacted.ch/Rubblebucket-OmegaLaLa(FLAC)	04 Rubblebucket - Came Out of a Lady.flac	-8.190002	0.988586
redacted.ch/Rubblebucket-OmegaLaLa(FLAC)	05 Rubblebucket - Raining.flac	-4.940002	0.988586
redacted.ch/Rubblebucket-OmegaLaLa(FLAC)	06 Rubblebucket - Breatherz (Young As Clouds).flac	-7.720001	0.988586
redacted.ch/Rubblebucket-OmegaLaLa(FLAC)	07 Rubblebucket - Rescue Ranger.flac	-7.570000	0.988586
redacted.ch/Rubblebucket-OmegaLaLa(FLAC)	08 Rubblebucket - Lifted／Weak Arms.flac	-7.209999	0.988586
redacted.ch/Rubblebucket-OmegaLaLa(FLAC)	09 Rubblebucket - Triangular Daisies.flac	-8.040001	0.988586
redacted.ch/Rubblebucket-OmegaLaLa(FLAC)	10 Rubblebucket - Worker.flac	-7.500000	0.988586
redacted.ch/Rubblebucket-OmegaLaLa(FLAC)	11 Rubblebucket - Pile of Rage.flac	-7.419998	0.988586
redacted.ch/!Rudiments - Circle Our Empire [FLAC]	01 - Martians Don't Skank.flac	-9.889999	0.991791
redacted.ch/!Rudiments - Circle Our Empire [FLAC]	02 - Scapegoat.flac	-9.559998	0.999481
redacted.ch/!Rudiments - Circle Our Empire [FLAC]	03 - Plank.flac	-9.260002	0.999542
redacted.ch/!Rudiments - Circle Our Empire [FLAC]	04 - Mamacita.flac	-9.150002	0.999481
redacted.ch/!Rudiments - Circle Our Empire [FLAC]	05 - Too Late.flac	-11.959999	0.999451
redacted.ch/!Rudiments - Circle Our Empire [FLAC]	06 - Wailing Paddle.flac	-8.580002	0.999512
redacted.ch/!Rudiments - Circle Our Empire [FLAC]	07 - Lucky Charms.flac	-9.269997	0.999481
redacted.ch/!Rudiments - Circle Our Empire [FLAC]	08 - The Doctor.flac	-11.000000	0.950989
redacted.ch/!Rudiments - Circle Our Empire [FLAC]	09 - Pounce.flac	-11.190002	0.999420
redacted.ch/!Rudiments - Circle Our Empire [FLAC]	10 - Spoon.flac	-8.800003	0.999512
redacted.ch/!Rudiments - Circle Our Empire [FLAC]	11 - What's Cooking.flac	-9.959999	0.999512
redacted.ch/!Rudiments - Circle Our Empire [FLAC]	12 - Pathfinder.flac	-7.699997	0.999481
redacted.ch/!Rudiments - Circle Our Empire [FLAC]	13 - Dine In Crossfire.flac	-8.160004	0.999420
redacted.ch/!Rudiments - Circle Our Empire [FLAC]	14 - Trash.flac	-9.480003	0.999390
redacted.ch/!Rudiments - Circle Our Empire [FLAC]	15 - Two Face.flac	-10.389999	0.972107
redacted.ch/!Rudiments - Circle Our Empire [FLAC]	16 - The Sweet Doc.flac	-8.739998	0.999420
redacted.ch/!Rudiments - Circle Our Empire [FLAC]	17 - Skactopus.flac	-10.750000	0.999420
redacted.ch/!Run Your Pockets (FLAC)	01 No Cash - Samurais Of The Sea.flac	-9.699997	1.000000
redacted.ch/!Run Your Pockets (FLAC)	02 No Cash - Life Sucks.flac	-11.360001	1.000000
redacted.ch/!Run Your Pockets (FLAC)	03 No Cash - Wilkes Booth Style.flac	-12.650002	1.000000
redacted.ch/!Run Your Pockets (FLAC)	04 No Cash - Knowledge Is Power.flac	-9.639999	1.000000
redacted.ch/!Run Your Pockets (FLAC)	05 No Cash - Skate Or Die.flac	-10.849998	1.000000
redacted.ch/!Run Your Pockets (FLAC)	06 No Cash - Pierce The Gates.flac	-8.519997	1.000000
redacted.ch/!Run Your Pockets (FLAC)	07 No Cash - Homelife Is A Drag.flac	-6.340004	1.000000
redacted.ch/!Run Your Pockets (FLAC)	08 No Cash - The Lucky Few.flac	-11.669998	1.000000
redacted.ch/!Run Your Pockets (FLAC)	09 No Cash - Pure Evil.flac	-10.180000	1.000000
redacted.ch/!Run Your Pockets (FLAC)	10 No Cash - A Better Tomorrow.flac	-10.489998	1.000000
redacted.ch/!Run Your Pockets (FLAC)	11 No Cash - Gasoline.flac	-9.220001	1.000000
redacted.ch/!Run Your Pockets (FLAC)	12 No Cash - Run Your Pockets.flac	-10.040001	1.000000
redacted.ch/Selah Sue	01 - Selah Sue - This World.flac	-10.400002	0.988525
redacted.ch/Selah Sue	02 - Selah Sue - Peace Of Mind.flac	-9.580002	0.988525
redacted.ch/Selah Sue	03 - Selah Sue - Raggamuffin.flac	-8.769997	0.988525
redacted.ch/Selah Sue	04 - Selah Sue - Crazy Vibes.flac	-9.470001	0.988525
redacted.ch/Selah Sue	05 - Selah Sue - Black Part Love.flac	-9.070000	0.988525
redacted.ch/Selah Sue	06 - Selah Sue - Mommy.flac	-8.099998	0.988525
redacted.ch/Selah Sue	07 - Selah Sue - Explanations.flac	-4.660004	0.795105
redacted.ch/Selah Sue	08 - Selah Sue - Please (Ft.Cee-Lo Green).flac	-9.059998	0.988525
redacted.ch/Selah Sue	09 - Selah Sue - Summertime.flac	-5.570000	0.988525
redacted.ch/Selah Sue	10 - Selah Sue - Style Crazy Sufferin.flac	-8.860001	0.988525
redacted.ch/Selah Sue	11 - Selah Sue - Fyah Fyah.flac	-9.379997	0.988525
redacted.ch/Selah Sue	12 - Selah Sue - Just Because I Do.flac	-8.769997	0.901520
redacted.ch/!Senser - How To Do Battle FLAC (2009)	01 - Wake Up, You're On Fire.flac	-1.889999	0.891266
redacted.ch/!Senser - How To Do Battle FLAC (2009)	02 - Resistance Now.flac	-11.400002	1.000000
redacted.ch/!Senser - How To Do Battle FLAC (2009)	03 - Brightest Rays.flac	-11.639999	1.000000
redacted.ch/!Senser - How To Do Battle FLAC (2009)	04 - 2 3 Clear.flac	-11.320000	1.000000
redacted.ch/!Senser - How To Do Battle FLAC (2009)	05 - Dictator Bling.flac	-11.230003	1.000000
redacted.ch/!Senser - How To Do Battle FLAC (2009)	06 - End Of The World Show.flac	-11.400002	1.000000
redacted.ch/!Senser - How To Do Battle FLAC (2009)	07 - Smoking Paranoia.flac	-10.680000	1.000000
redacted.ch/!Senser - How To Do Battle FLAC (2009)	08 - Sandhurst In Zero G.flac	-4.349998	0.794342
redacted.ch/!Senser - How To Do Battle FLAC (2009)	09 - So Refined.flac	-11.690002	1.000000
redacted.ch/!Senser - How To Do Battle FLAC (2009)	10 - Hex.flac	-11.340004	1.000000
redacted.ch/!Senser - How To Do Battle FLAC (2009)	11 - Fairytale.flac	-9.230003	1.000000
redacted.ch/!Senser - How To Do Battle FLAC (2009)	12 - Lights Out.flac	-11.239998	1.000000
redacted.ch/!Senser - How To Do Battle FLAC (2009)	13 - Arturo.flac	-1.540001	1.000000
redacted.ch/Sex Pistols - Never Mind the Bollocks, Here's The Sex Pistols (1977) [FLAC]	01 - The Sex Pistols - Holidays in the Sun.flac	-3.800003	0.850342
redacted.ch/Sex Pistols - Never Mind the Bollocks, Here's The Sex Pistols (1977) [FLAC]	02 - The Sex Pistols - Bodies.flac	-4.029999	0.999969
redacted.ch/Sex Pistols - Never Mind the Bollocks, Here's The Sex Pistols (1977) [FLAC]	03 - The Sex Pistols - No Feelings.flac	-3.029999	0.877441
redacted.ch/Sex Pistols - Never Mind the Bollocks, Here's The Sex Pistols (1977) [FLAC]	04 - The Sex Pistols - Liar.flac	-3.370003	0.998383
redacted.ch/Sex Pistols - Never Mind the Bollocks, Here's The Sex Pistols (1977) [FLAC]	05 - The Sex Pistols - Problems.flac	-3.320000	0.979034
redacted.ch/Sex Pistols - Never Mind the Bollocks, Here's The Sex Pistols (1977) [FLAC]	06 - The Sex Pistols - God Save the Queen.flac	-3.320000	0.981659
redacted.ch/Sex Pistols - Never Mind the Bollocks, Here's The Sex Pistols (1977) [FLAC]	07 - The Sex Pistols - Seventeen.flac	-3.620003	0.999969
redacted.ch/Sex Pistols - Never Mind the Bollocks, Here's The Sex Pistols (1977) [FLAC]	08 - The Sex Pistols - Anarchy in the UK.flac	-4.110001	0.972504
redacted.ch/Sex Pistols - Never Mind the Bollocks, Here's The Sex Pistols (1977) [FLAC]	09 - The Sex Pistols - Submission.flac	-2.470001	0.999542
redacted.ch/Sex Pistols - Never Mind the Bollocks, Here's The Sex Pistols (1977) [FLAC]	10 - The Sex Pistols - Pretty Vacant.flac	-4.019997	1.000000
redacted.ch/Sex Pistols - Never Mind the Bollocks, Here's The Sex Pistols (1977) [FLAC]	11 - The Sex Pistols - New York.flac	-3.279999	0.983887
redacted.ch/Sex Pistols - Never Mind the Bollocks, Here's The Sex Pistols (1977) [FLAC]	12 - The Sex Pistols - EMI.flac	-3.980003	0.999969
redacted.ch/Siren Song Of The Counter Culture	01 - State Of The Union.flac	-9.750000	0.999390
redacted.ch/Siren Song Of The Counter Culture	02 - The First Drop.flac	-9.699997	1.000000
redacted.ch/Siren Song Of The Counter Culture	03 - Life Less Frightening.flac	-10.459999	1.000000
redacted.ch/Siren Song Of The Counter Culture	04 - Paper Wings.flac	-9.620003	0.999023
redacted.ch/Siren Song Of The Counter Culture	05 - Blood To Bleed.flac	-9.139999	0.999023
redacted.ch/Siren Song Of The Counter Culture	06 - To Them These Streets Belong.flac	-10.580002	1.000000
redacted.ch/Siren Song Of The Counter Culture	07 - Tip The Scales.flac	-9.620003	0.999023
redacted.ch/Siren Song Of The Counter Culture	08 - Anywhere But Here.flac	-9.309998	0.999023
redacted.ch/Siren Song Of The Counter Culture	09 - Give It All.flac	-9.779999	0.999603
redacted.ch/Siren Song Of The Counter Culture	10 - Dancing For Rain.flac	-9.510002	0.999023
redacted.ch/Siren Song Of The Counter Culture	11 - Swing Life Away.flac	-7.160004	0.999023
redacted.ch/Siren Song Of The Counter Culture	12 - Rumors Of My Demise Have Been Greatly Exaggerated.flac	-9.860001	0.999023
redacted.ch/!Skafandr - 2006 - Убить Голос FLAC	CD1 (Голос)/Skafandr - 01 - Intro.flac	-6.949997	0.980469
redacted.ch/!Skafandr - 2006 - Убить Голос FLAC	CD1 (Голос)/Skafandr - 02 - Все к чему-то приводит (feat. Илья Разин).flac	-11.660004	1.000000
redacted.ch/!Skafandr - 2006 - Убить Голос FLAC	CD1 (Голос)/Skafandr - 03 - Петр живет в тайге (feat. Захар Май).flac	-10.830002	1.000000
redacted.ch/!Skafandr - 2006 - Убить Голос FLAC	CD1 (Голос)/Skafandr - 04 - Не мы (feat. Вася Васин).flac	-10.440002	1.000000
redacted.ch/!Skafandr - 2006 - Убить Голос FLAC	CD1 (Голос)/Skafandr - 05 - ....flac	5.169998	0.660431
redacted.ch/!Skafandr - 2006 - Убить Голос FLAC	CD1 (Голос)/Skafandr - 06 - Немые речи (feat. Владимир Долгов).flac	-11.360001	1.000000
redacted.ch/!Skafandr - 2006 - Убить Голос FLAC	CD1 (Голос)/Skafandr - 07 - Наблюдатель (feat. Олег Воробьевский).flac	-12.470001	1.000000
redacted.ch/!Skafandr - 2006 - Убить Голос FLAC	CD1 (Голос)/Skafandr - 08 - Солдаты (feat. Dj Shahash, Максим Новый, Сергей Вырвич).flac	-9.650002	0.993805
redacted.ch/!Skafandr - 2006 - Убить Голос FLAC	CD1 (Голос)/Skafandr - 09 - ....flac	-7.320000	0.993256
redacted.ch/!Skafandr - 2006 - Убить Голос FLAC	CD1 (Голос)/Skafandr - 10 - Show must go on (feat. Алексей Никонов, Дмитрий Порубов, Салима).flac	-10.459999	1.000000
redacted.ch/!Skafandr - 2006 - Убить Голос FLAC	CD1 (Голос)/Skafandr - 11 - Холод и лед (feat. Игорь Мамонов).flac	-11.040001	1.000000
redacted.ch/!Skafandr - 2006 - Убить Голос FLAC	CD1 (Голос)/Skafandr - 12 - Вес и сила (feat. Анна Столярова).flac	-10.830002	1.000000
redacted.ch/!Skafandr - 2006 - Убить Голос FLAC	CD1 (Голос)/Skafandr - 13 - Колыбельная для утопленницы (feat. Вера Огарева).flac	-11.169998	1.000000
redacted.ch/!Skafandr - 2006 - Убить Голос FLAC	CD1 (Голос)/Skafandr - 14 - Полоска (feat. Михаил Феничев, Михаил Ильин).flac	-7.739998	0.996216
redacted.ch/!Skafandr - 2006 - Убить Голос FLAC	CD1 (Голос)/Skafandr - 15 - Вселенная (feat. Алена Вартамо).flac	-10.660004	1.000000
redacted.ch/!Skafandr - 2006 - Убить Голос FLAC	CD1 (Голос)/Skafandr - 16 - Поджигай (feat. Андрей Шевченко).flac	-11.510002	1.000000
redacted.ch/!Skafandr - 2006 - Убить Голос FLAC	CD1 (Голос)/Skafandr - 17 - ....flac	-9.309998	1.000000
redacted.ch/!Skafandr - 2006 - Убить Голос FLAC	CD1 (Голос)/Skafandr - 18 - Космические сны (feat. Наталья Полищук).flac	-11.349998	1.000000
redacted.ch/!Skafandr - 2006 - Убить Голос FLAC	CD1 (Голос)/Skafandr - 19 - Были по п.... (feat. Дмитрий Порубов).flac	-9.269997	0.999969
redacted.ch/!Skafandr - 2006 - Убить Голос FLAC	CD1 (Голос)/Skafandr - 20 - Outro.flac	-6.860001	1.000000
redacted.ch/!Skafandr - 2006 - Убить Голос FLAC	CD2 (Убить Голос)/Skafandr - 01 - Intro.flac	-6.949997	0.980469
redacted.ch/!Skafandr - 2006 - Убить Голос FLAC	CD2 (Убить Голос)/Skafandr - 02 - Все к чему-то приводит.flac	-11.180000	1.000000
redacted.ch/!Skafandr - 2006 - Убить Голос FLAC	CD2 (Убить Голос)/Skafandr - 03 - Петр живет в тайге.flac	-9.519997	1.000000
redacted.ch/!Skafandr - 2006 - Убить Голос FLAC	CD2 (Убить Голос)/Skafandr - 04 - Не мы.flac	-10.419998	1.000000
redacted.ch/!Skafandr - 2006 - Убить Голос FLAC	CD2 (Убить Голос)/Skafandr - 05 - ....flac	5.130001	0.660431
redacted.ch/!Skafandr - 2006 - Убить Голос FLAC	CD2 (Убить Голос)/Skafandr - 06 - Немые речи.flac	-10.849998	1.000000
redacted.ch/!Skafandr - 2006 - Убить Голос FLAC	CD2 (Убить Голос)/Skafandr - 07 - Наблюдатель.flac	-12.830002	1.000000
redacted.ch/!Skafandr - 2006 - Убить Голос FLAC	CD2 (Убить Голос)/Skafandr - 08 - Солдаты.flac	-9.669998	0.993500
redacted.ch/!Skafandr - 2006 - Убить Голос FLAC	CD2 (Убить Голос)/Skafandr - 09 - ....flac	-7.349998	0.993256
redacted.ch/!Skafandr - 2006 - Убить Голос FLAC	CD2 (Убить Голос)/Skafandr - 10 - Show must go on.flac	-9.800003	1.000000
redacted.ch/!Skafandr - 2006 - Убить Голос FLAC	CD2 (Убить Голос)/Skafandr - 11 - Холод и лед.flac	-10.139999	1.000000
redacted.ch/!Skafandr - 2006 - Убить Голос FLAC	CD2 (Убить Голос)/Skafandr - 12 - Вес и сила.flac	-10.559998	1.000000
redacted.ch/!Skafandr - 2006 - Убить Голос FLAC	CD2 (Убить Голос)/Skafandr - 13 - Колыбельная для утопленницы.flac	-11.360001	1.000000
redacted.ch/!Skafandr - 2006 - Убить Голос FLAC	CD2 (Убить Голос)/Skafandr - 14 - Полоска.flac	-6.660004	0.993195
redacted.ch/!Skafandr - 2006 - Убить Голос FLAC	CD2 (Убить Голос)/Skafandr - 15 - Вселенная.flac	-9.209999	1.000000
redacted.ch/!Skafandr - 2006 - Убить Голос FLAC	CD2 (Убить Голос)/Skafandr - 16 - Поджигай.flac	-12.029999	1.000000
redacted.ch/!Skafandr - 2006 - Убить Голос FLAC	CD2 (Убить Голос)/Skafandr - 17 - ....flac	-9.480003	1.000000
redacted.ch/!Skafandr - 2006 - Убить Голос FLAC	CD2 (Убить Голос)/Skafandr - 18 - Космические сны.flac	-10.760002	1.000000
redacted.ch/!Skafandr - 2006 - Убить Голос FLAC	CD2 (Убить Голос)/Skafandr - 19 - Были по п.....flac	-8.900002	1.000000
redacted.ch/!Skafandr - 2006 - Убить Голос FLAC	CD2 (Убить Голос)/Skafandr - 20 - Outro.flac	-6.760002	1.000000
redacted.ch/slapstick [1997]	01 - Slapstick - There's a Metal Head in the Parking Lot.flac	-5.699997	0.999939
redacted.ch/slapstick [1997]	02 - Slapstick - The Park.flac	-5.150002	0.999939
redacted.ch/slapstick [1997]	03 - Slapstick - Eighteen.flac	-4.989998	0.999939
redacted.ch/slapstick [1997]	04 - Slapstick - What I Learned.flac	-5.860001	0.999969
redacted.ch/slapstick [1997]	05 - Slapstick - February One.flac	-5.959999	0.999969
redacted.ch/slapstick [1997]	06 - Slapstick - Sick of This Place.flac	-6.019997	0.999939
redacted.ch/slapstick [1997]	07 - Slapstick - Good Times Gone.flac	-3.590004	0.999969
redacted.ch/slapstick [1997]	08 - Slapstick - Almost Punk Enough.flac	-2.820000	0.999969
redacted.ch/slapstick [1997]	09 - Slapstick - Cheat to Win.flac	-3.459999	0.999969
redacted.ch/slapstick [1997]	10 - Slapstick - Crooked.flac	-0.660004	0.999969
redacted.ch/slapstick [1997]	11 - Slapstick - Colorado.flac	-2.349998	0.999939
redacted.ch/slapstick [1997]	12 - Slapstick - 74 Fullerton.flac	-2.750000	0.999969
redacted.ch/slapstick [1997]	13 - Slapstick - She Doesn't Love Me.flac	-2.349998	0.999969
redacted.ch/slapstick [1997]	14 - Slapstick - My Way.flac	-1.970001	0.999939
redacted.ch/slapstick [1997]	15 - Slapstick - The Geek.flac	-3.139999	0.999939
redacted.ch/slapstick [1997]	16 - Slapstick - Not Tonight.flac	-2.590004	0.999969
redacted.ch/slapstick [1997]	17 - Slapstick - Ed.flac	-2.320000	0.999939
redacted.ch/slapstick [1997]	18 - Slapstick - The Punks.flac	-2.540001	0.999939
redacted.ch/slapstick [1997]	19 - Slapstick - Nate B..flac	-3.110001	0.999969
redacted.ch/slapstick [1997]	20 - Slapstick - Broken Down.flac	-3.820000	0.999969
redacted.ch/slapstick [1997]	21 - Slapstick - Johnny.flac	-4.559998	0.999969
redacted.ch/slapstick [1997]	22 - Slapstick - Wake Up Stanley.flac	-3.150002	0.999969
redacted.ch/slapstick [1997]	23 - Slapstick - My Only Friend.flac	-4.500000	0.999969
redacted.ch/slapstick [1997]	24 - Slapstick - Earth Angel.flac	-5.360001	0.999969
redacted.ch/slapstick [1997]	25 - Slapstick - Alternative Radio.flac	-3.709999	0.999969
redacted.ch/Slightly Stoopid - 2012 - Top Of The World [FLAC]	01 Top of the World.flac	-8.800003	1.000000
redacted.ch/Slightly Stoopid - 2012 - Top Of The World [FLAC]	02 Don't Stop.flac	-6.739998	0.999725
redacted.ch/Slightly Stoopid - 2012 - Top Of The World [FLAC]	03 Devils Door.flac	-9.500000	0.998840
redacted.ch/Slightly Stoopid - 2012 - Top Of The World [FLAC]	04 Serious Man.flac	-8.559998	0.998871
redacted.ch/Slightly Stoopid - 2012 - Top Of The World [FLAC]	05 Way You Move.flac	-8.099998	0.998871
redacted.ch/Slightly Stoopid - 2012 - Top Of The World [FLAC]	06 Drink Professionally.flac	-6.930000	0.998779
redacted.ch/Slightly Stoopid - 2012 - Top Of The World [FLAC]	07 Pon Da Horizon (With Barrington Levy).flac	-6.669998	0.997711
redacted.ch/Slightly Stoopid - 2012 - Top Of The World [FLAC]	08 We Don't Wanna Go.flac	-8.590004	1.000000
redacted.ch/Slightly Stoopid - 2012 - Top Of The World [FLAC]	09 Ska Diddy (With Angelo Moore).flac	-8.800003	0.998840
redacted.ch/Slightly Stoopid - 2012 - Top Of The World [FLAC]	10 Just Thinking (With Chali 2NA).flac	-9.019997	0.998871
redacted.ch/Slightly Stoopid - 2012 - Top Of The World [FLAC]	11 Your Love.flac	-6.099998	0.997528
redacted.ch/Slightly Stoopid - 2012 - Top Of The World [FLAC]	12 Deal with It.flac	-7.199997	0.999573
redacted.ch/Slightly Stoopid - 2012 - Top Of The World [FLAC]	13 Work.flac	-7.599998	0.999512
redacted.ch/Slightly Stoopid - 2012 - Top Of The World [FLAC]	14 Mona June (With Angela).flac	-7.820000	0.998871
redacted.ch/Slightly Stoopid - 2012 - Top Of The World [FLAC]	15 Rhythm Streets.flac	-5.279999	0.998779
redacted.ch/Slightly Stoopid - 2012 - Top Of The World [FLAC]	16 Hiphoppablues (With G Love).flac	-8.709999	0.998871
redacted.ch/Slightly Stoopid - 2012 - Top Of The World [FLAC]	17 New Day.flac	-3.790001	0.998871
redacted.ch/Slightly Stoopid - 2012 - Top Of The World [FLAC]	18 Underneath The Pressure.flac	-8.199997	0.998871
redacted.ch/Slightly Stoopid - 2012 - Top Of The World [FLAC]	19 Marijuana (With Don Carlos).flac	-7.940002	0.999451
redacted.ch/Slightly Stoopid - 2012 - Top Of The World [FLAC]	20 Im On Fire.flac	-8.379997	0.998871
redacted.ch/Slightly Stoopid - 2012 - Top Of The World [FLAC]	21 Intro To Organics (With Dan Papaila).flac	-9.750000	0.998871
redacted.ch/Slightly Stoopid - Closer To The Sun (2005) [FLAC]	01 - Intro.flac	-6.230003	0.961975
redacted.ch/Slightly Stoopid - Closer To The Sun (2005) [FLAC]	02 - Babylon Is Falling.flac	-7.739998	0.988556
redacted.ch/Slightly Stoopid - Closer To The Sun (2005) [FLAC]	03 - Somebody.flac	-8.040001	0.988556
redacted.ch/Slightly Stoopid - Closer To The Sun (2005) [FLAC]	04 - Fat Spliffs.flac	-7.699997	0.988556
redacted.ch/Slightly Stoopid - Closer To The Sun (2005) [FLAC]	05 - Bandelero.flac	-9.680000	0.988556
redacted.ch/Slightly Stoopid - Closer To The Sun (2005) [FLAC]	06 - See It No Other Way.flac	-6.919998	0.988556
redacted.ch/Slightly Stoopid - Closer To The Sun (2005) [FLAC]	07 - Nothin Over Me.flac	-11.709999	0.999725
redacted.ch/Slightly Stoopid - Closer To The Sun (2005) [FLAC]	08 - This Joint.flac	-8.900002	0.981903
redacted.ch/Slightly Stoopid - Closer To The Sun (2005) [FLAC]	09 - Older.flac	-8.879997	0.864227
redacted.ch/Slightly Stoopid - Closer To The Sun (2005) [FLAC]	10 - Ain't Got A Lot Of Money.flac	-8.209999	0.988556
redacted.ch/Slightly Stoopid - Closer To The Sun (2005) [FLAC]	11 - Till It Gets Wet.flac	-9.379997	0.988556
redacted.ch/Slightly Stoopid - Closer To The Sun (2005) [FLAC]	12 - Don't Care.flac	-8.160004	0.988770
redacted.ch/Slightly Stoopid - Closer To The Sun (2005) [FLAC]	13 - Basher.flac	-7.059998	0.988556
redacted.ch/Slightly Stoopid - Closer To The Sun (2005) [FLAC]	14 - Righteous Man.flac	-10.989998	0.999725
redacted.ch/Slightly Stoopid - Closer To The Sun (2005) [FLAC]	15 - Up On A Plane.flac	-8.440002	0.988556
redacted.ch/Slightly Stoopid - Closer To The Sun (2005) [FLAC]	16 - Waiting.flac	-10.370003	0.988556
redacted.ch/Slightly Stoopid - Closer To The Sun (2005) [FLAC]	17 - Closer To The Sun.flac	-7.830002	0.993561
redacted.ch/Slightly Stoopid - Closer To The Sun (2005) [FLAC]	18 - Zeplike.flac	-6.010002	0.988556
redacted.ch/Slightly Stoopid - Closer To The Sun (2005) [FLAC]	19 - Comb 4 My Dome.flac	-8.320000	0.851410
redacted.ch/Slightly Stoopid - Closer To The Sun (2005) [FLAC]	20 - Open Road.flac	-8.209999	0.997528
redacted.ch/Slightly Stoopid - Everything You Need (2003) [CD FLAC]	01 Everything You Need.flac	-7.489998	0.988617
redacted.ch/Slightly Stoopid - Everything You Need (2003) [CD FLAC]	02 Officer.flac	-9.459999	0.988617
redacted.ch/Slightly Stoopid - Everything You Need (2003) [CD FLAC]	03 Questionable.flac	-10.830002	0.962036
redacted.ch/Slightly Stoopid - Everything You Need (2003) [CD FLAC]	04 Runnin' With A Gun.flac	-8.360001	0.988617
redacted.ch/Slightly Stoopid - Everything You Need (2003) [CD FLAC]	05 Killin' Me Deep Inside.flac	-9.610001	0.988617
redacted.ch/Slightly Stoopid - Everything You Need (2003) [CD FLAC]	06 Perfect Gentleman.flac	-10.680000	0.988617
redacted.ch/Slightly Stoopid - Everything You Need (2003) [CD FLAC]	07 Wicked Rebel.flac	-8.120003	0.988953
redacted.ch/Slightly Stoopid - Everything You Need (2003) [CD FLAC]	08 Sweet Honey.flac	-9.769997	0.988617
redacted.ch/Slightly Stoopid - Everything You Need (2003) [CD FLAC]	09 Punk Rock Billy.flac	-10.430000	0.988617
redacted.ch/Slightly Stoopid - Everything You Need (2003) [CD FLAC]	10 World Goes Round (Feat. I-Man).flac	-8.430000	0.988617
redacted.ch/Slightly Stoopid - Everything You Need (2003) [CD FLAC]	11 Wiseman.flac	-6.199997	0.999420
redacted.ch/Slightly Stoopid - Everything You Need (2003) [CD FLAC]	12 Leaving On A Jet Plane.flac	-8.010002	0.973541
redacted.ch/Slightly Stoopid - Everything You Need (2003) [CD FLAC]	13 Mellow Mood (Feat. G. Love).flac	-7.680000	0.988617
redacted.ch/Slightly Stoopid - Everything You Need (2003) [CD FLAC]	14 Collie Man.flac	-7.750000	0.988617
redacted.ch/Slightly Stoopid - Slightly Not Stoned Enough To Eat Breakfast Yet Stoopid - 2008 (CD - FLAC - Lossless)	01 - Thinkin Bout Cops.flac	-9.489998	0.998535
redacted.ch/Slightly Stoopid - Slightly Not Stoned Enough To Eat Breakfast Yet Stoopid - 2008 (CD - FLAC - Lossless)	02 - Circle House Blues.flac	-7.150002	0.988556
redacted.ch/Slightly Stoopid - Slightly Not Stoned Enough To Eat Breakfast Yet Stoopid - 2008 (CD - FLAC - Lossless)	03 - Supernatural.flac	-6.300003	0.998535
redacted.ch/Slightly Stoopid - Slightly Not Stoned Enough To Eat Breakfast Yet Stoopid - 2008 (CD - FLAC - Lossless)	04 - Chaunch.flac	-7.510002	0.998535
redacted.ch/Slightly Stoopid - Slightly Not Stoned Enough To Eat Breakfast Yet Stoopid - 2008 (CD - FLAC - Lossless)	05 - I Would Do For You.flac	-6.989998	0.988556
redacted.ch/Slightly Stoopid - Slightly Not Stoned Enough To Eat Breakfast Yet Stoopid - 2008 (CD - FLAC - Lossless)	06 - Fruits 'Legalize Them'.flac	-6.320000	1.000000
redacted.ch/Slightly Stoopid - Slightly Not Stoned Enough To Eat Breakfast Yet Stoopid - 2008 (CD - FLAC - Lossless)	07 - Aint No Reason To Go.flac	-7.080002	0.989258
redacted.ch/Slightly Stoopid - Slightly Not Stoned Enough To Eat Breakfast Yet Stoopid - 2008 (CD - FLAC - Lossless)	08 - Sinsemilla.flac	-4.620003	0.988556
redacted.ch/Slightly Stoopid - Slightly Not Stoned Enough To Eat Breakfast Yet Stoopid - 2008 (CD - FLAC - Lossless)	09 - No Cocaine.flac	-8.250000	0.999939
redacted.ch/Slightly Stoopid - Slightly Not Stoned Enough To Eat Breakfast Yet Stoopid - 2008 (CD - FLAC - Lossless)	10 - London Dub.flac	-7.180000	0.999939
redacted.ch/Slightly Stoopid - Slightly Not Stoned Enough To Eat Breakfast Yet Stoopid - 2008 (CD - FLAC - Lossless)	11 - Shoobie.flac	-9.080002	1.000000
redacted.ch/Slightly Stoopid - Slightly Not Stoned Enough To Eat Breakfast Yet Stoopid - 2008 (CD - FLAC - Lossless)	12 - On And On.flac	-8.080002	1.000000
redacted.ch/Slightly Stoopid - Slightly Not Stoned Enough To Eat Breakfast Yet Stoopid - 2008 (CD - FLAC - Lossless)	13 - Train 1.flac	-10.290001	0.999939
redacted.ch/Slightly Stoopid - Slightly Not Stoned Enough To Eat Breakfast Yet Stoopid - 2008 (CD - FLAC - Lossless)	14 - Train 2.flac	-7.029999	1.000000
redacted.ch/Slightly Stoopid - Slightly Not Stoned Enough To Eat Breakfast Yet Stoopid - 2008 (CD - FLAC - Lossless)	15 - Know You Rider.flac	-9.250000	0.998535
redacted.ch/Slightly Stoopid - Slightly Not Stoned Enough To Eat Breakfast Yet Stoopid - 2008 (CD - FLAC - Lossless)	16 - False Rhythms.flac	-7.930000	0.988556
redacted.ch/Slightly Stoopid - Slightly Not Stoned Enough To Eat Breakfast Yet Stoopid - 2008 (CD - FLAC - Lossless)	17 - I Metal.flac	-10.419998	0.998962
redacted.ch/Slightly Stoopid - Slightly Not Stoned Enough To Eat Breakfast Yet Stoopid - 2008 (CD - FLAC - Lossless)	18 - She Bangs.flac	-8.059998	0.989014
redacted.ch/Slightly Stoopid - Slightly Not Stoned Enough To Eat Breakfast Yet Stoopid - 2008 (CD - FLAC - Lossless)	19 - Digital.flac	-5.779999	0.999969
redacted.ch/Slightly Stoopid - Slightly Not Stoned Enough To Eat Breakfast Yet Stoopid - 2008 (CD - FLAC - Lossless)	20 - Foreign Land.flac	-10.419998	0.988556
redacted.ch/Slightly Stoopid - Slightly Not Stoned Enough To Eat Breakfast Yet Stoopid - 2008 (CD - FLAC - Lossless)	21 - Tom & Jerry.flac	-5.629997	0.988556
redacted.ch/Slightly Stoopid - Slighty $toopid (1996) [FLAC]	01 - Righteous Man.flac	-7.800003	0.950928
redacted.ch/Slightly Stoopid - Slighty $toopid (1996) [FLAC]	02 - Operation.flac	-5.489998	0.934479
redacted.ch/Slightly Stoopid - Slighty $toopid (1996) [FLAC]	03 - Hey Stoopid (live).flac	-1.470001	0.906097
redacted.ch/Slightly Stoopid - Slighty $toopid (1996) [FLAC]	04 - Civil Opression Dub.flac	0.029999	0.999939
redacted.ch/Slightly Stoopid - Slighty $toopid (1996) [FLAC]	05 - Zero Tolerance.flac	-5.129997	0.938934
redacted.ch/Slightly Stoopid - Slighty $toopid (1996) [FLAC]	06 - Alibi's.flac	-5.860001	0.914948
redacted.ch/Slightly Stoopid - Slighty $toopid (1996) [FLAC]	07 - Antisocialistic.flac	-6.040001	0.958282
redacted.ch/Slightly Stoopid - Slighty $toopid (1996) [FLAC]	08 - Opportunities.flac	-7.660004	0.959778
redacted.ch/Slightly Stoopid - Slighty $toopid (1996) [FLAC]	09 - Smoke Rasta Dub.flac	0.230003	0.988556
redacted.ch/Slightly Stoopid - Slighty $toopid (1996) [FLAC]	10 - Stop.flac	-5.949997	0.905609
redacted.ch/Slightly Stoopid - Slighty $toopid (1996) [FLAC]	11 - Wake Up Late.flac	-4.669998	0.943451
redacted.ch/Slightly Stoopid - Slighty $toopid (1996) [FLAC]	12 - Fuck the Police.flac	-7.010002	0.869965
redacted.ch/Slightly Stoopid - Slighty $toopid (1996) [FLAC]	13 - American Man.flac	-6.680000	0.936279
redacted.ch/Slightly Stoopid - Slighty $toopid (1996) [FLAC]	14 - To A Party.flac	3.869999	0.923004
redacted.ch/!Sonic Boom Six - 2005 - Sounds to Consume- Champion Edition[FLAC]	01 - The Rape of Punk to Come.flac	-10.099998	0.988708
redacted.ch/!Sonic Boom Six - 2005 - Sounds to Consume- Champion Edition[FLAC]	02 - Let the Children Play.flac	-10.419998	0.988708
redacted.ch/!Sonic Boom Six - 2005 - Sounds to Consume- Champion Edition[FLAC]	03 - Monkey See Monkey Do (Funky Kingston).flac	-7.300003	0.988708
redacted.ch/!Sonic Boom Six - 2005 - Sounds to Consume- Champion Edition[FLAC]	04 - Safe European Home.flac	-9.680000	0.988708
redacted.ch/!Sonic Boom Six - 2005 - Sounds to Consume- Champion Edition[FLAC]	05 - Blood For Oil.flac	-11.449997	0.988708
redacted.ch/!Sonic Boom Six - 2005 - Sounds to Consume- Champion Edition[FLAC]	06 - People Acklike They Don't Know.flac	-11.080002	0.988708
redacted.ch/!Sonic Boom Six - 2005 - Sounds to Consume- Champion Edition[FLAC]	07 - The Devil Made Me Do It.flac	-11.550003	0.988739
redacted.ch/!Sonic Boom Six - 2005 - Sounds to Consume- Champion Edition[FLAC]	08 - Silent Majority.flac	-11.040001	0.988739
redacted.ch/!Sonic Boom Six - 2005 - Sounds to Consume- Champion Edition[FLAC]	09 - SB6 (Demo).flac	-10.199997	0.988739
redacted.ch/!Sonic Boom Six - 2005 - Sounds to Consume- Champion Edition[FLAC]	10 - Northern Skies (Demo).flac	-9.480003	0.988708
redacted.ch/!Sonic Boom Six - 2005 - Sounds to Consume- Champion Edition[FLAC]	11 - Different People (Demo).flac	-11.190002	0.988708
redacted.ch/!Sonic Boom Six - 2005 - Sounds to Consume- Champion Edition[FLAC]	12 - Play Inna Day (Demo).flac	-10.570000	0.988708
redacted.ch/!Sonic Boom Six - 2005 - Sounds to Consume- Champion Edition[FLAC]	13 - Rape of Dub to Come (Tim G Mash-up Refix).flac	-10.080002	0.988708
redacted.ch/!Sonic Boom Six - 2005 - Sounds to Consume- Champion Edition[FLAC]	14 - Monkey See Monkey Do (Rogue Trooper's Jungle Fever).flac	-10.000000	0.988708
redacted.ch/!Sonic Boom Six - 2005 - Sounds to Consume- Champion Edition[FLAC]	15 - Northern Dub (Casa Boom Reggae Refit).flac	-9.629997	0.988525
redacted.ch/!Sonic Boom Six - 2005 - Sounds to Consume- Champion Edition[FLAC]	16 - The Reckoning (Babyboom Bonus Track).flac	-11.739998	0.988708
redacted.ch/!Sonic Boom Six - 2005 - Sounds to Consume- Champion Edition[FLAC]	17 - Monkey See, Monkey Do (Live).flac	-11.070000	1.000000
redacted.ch/!Sonic Boom Six - 2005 - Sounds to Consume- Champion Edition[FLAC]	18 - The Might Mighty Boom.flac	-11.320000	0.988708
redacted.ch/!Sonic Boom Six - 2007 - All In [FLAC]	01 - All In (feat. Coolie Ranx) (Single Mix).flac	-9.459999	1.000000
redacted.ch/!Sonic Boom Six - 2007 - All In [FLAC]	02 - Face Forward.flac	-9.029999	1.000000
redacted.ch/!Sonic Boom Six - 2007 - All In [FLAC]	03 - Marching Round In Circles.flac	-10.760002	1.000000
redacted.ch/!Sonic Boom Six - 2008 - Play On - Rare, Rejected & Arcade Perfected [FLAC]	Disc 01 (Arcade Perfected)/01 - Sound Of Revolutionization.flac	-8.139999	0.966553
redacted.ch/!Sonic Boom Six - 2008 - Play On - Rare, Rejected & Arcade Perfected [FLAC]	Disc 01 (Arcade Perfected)/02 - While New Were Sleeping.flac	-8.389999	0.982025
redacted.ch/!Sonic Boom Six - 2008 - Play On - Rare, Rejected & Arcade Perfected [FLAC]	Disc 01 (Arcade Perfected)/03 - Ya Dubsta!.flac	-8.980003	0.966553
redacted.ch/!Sonic Boom Six - 2008 - Play On - Rare, Rejected & Arcade Perfected [FLAC]	Disc 01 (Arcade Perfected)/04 - I Changed I Could Smile.flac	-5.989998	0.967651
redacted.ch/!Sonic Boom Six - 2008 - Play On - Rare, Rejected & Arcade Perfected [FLAC]	Disc 01 (Arcade Perfected)/05 - Arcade Perfected.flac	-9.900002	0.966553
redacted.ch/!Sonic Boom Six - 2008 - Play On - Rare, Rejected & Arcade Perfected [FLAC]	Disc 01 (Arcade Perfected)/06 - Meanwhile, Back In The Other World.flac	-8.000000	0.966553
redacted.ch/!Sonic Boom Six - 2008 - Play On - Rare, Rejected & Arcade Perfected [FLAC]	Disc 01 (Arcade Perfected)/07 - For 12 Weeks, The City Is Different.flac	-7.760002	0.966553
redacted.ch/!Sonic Boom Six - 2008 - Play On - Rare, Rejected & Arcade Perfected [FLAC]	Disc 01 (Arcade Perfected)/08 - Tell Me Something I Dub Know.flac	-8.580002	0.966553
redacted.ch/!Sonic Boom Six - 2008 - Play On - Rare, Rejected & Arcade Perfected [FLAC]	Disc 01 (Arcade Perfected)/09 - Flowered.flac	-8.820000	1.000000
redacted.ch/!Sonic Boom Six - 2008 - Play On - Rare, Rejected & Arcade Perfected [FLAC]	Disc 01 (Arcade Perfected)/10 - The Strange Mix Of Sid The Strangler.flac	-10.040001	0.966553
redacted.ch/!Sonic Boom Six - 2008 - Play On - Rare, Rejected & Arcade Perfected [FLAC]	Disc 01 (Arcade Perfected)/11 - For 12 Weeks, The City Is Sleeping.flac	-9.260002	1.000000
redacted.ch/!Sonic Boom Six - 2008 - Play On - Rare, Rejected & Arcade Perfected [FLAC]	Disc 01 (Arcade Perfected)/12 - September To Maybe.flac	-9.849998	1.000000
redacted.ch/!Sonic Boom Six - 2008 - Play On - Rare, Rejected & Arcade Perfected [FLAC]	Disc 02 (Rare & Rejected)/01 - Play On.flac	-11.349998	0.988678
redacted.ch/!Sonic Boom Six - 2008 - Play On - Rare, Rejected & Arcade Perfected [FLAC]	Disc 02 (Rare & Rejected)/02 - Marching Round In Circles.flac	-10.739998	0.988647
redacted.ch/!Sonic Boom Six - 2008 - Play On - Rare, Rejected & Arcade Perfected [FLAC]	Disc 02 (Rare & Rejected)/03 - We Wanna War.flac	-10.180000	0.988647
redacted.ch/!Sonic Boom Six - 2008 - Play On - Rare, Rejected & Arcade Perfected [FLAC]	Disc 02 (Rare & Rejected)/04 - Devil Made Me Do It.flac	-11.620003	0.988647
redacted.ch/!Sonic Boom Six - 2008 - Play On - Rare, Rejected & Arcade Perfected [FLAC]	Disc 02 (Rare & Rejected)/05 - Boy Meets Girl.flac	-10.459999	0.988647
redacted.ch/!Sonic Boom Six - 2008 - Play On - Rare, Rejected & Arcade Perfected [FLAC]	Disc 02 (Rare & Rejected)/06 - Setting Sun.flac	-8.419998	0.988647
redacted.ch/!Sonic Boom Six - 2008 - Play On - Rare, Rejected & Arcade Perfected [FLAC]	Disc 02 (Rare & Rejected)/07 - Found It, Burned It, Fucked Off.flac	-10.809998	0.988647
redacted.ch/!Sonic Boom Six - 2008 - Play On - Rare, Rejected & Arcade Perfected [FLAC]	Disc 02 (Rare & Rejected)/08 - Cuckold.flac	-12.309998	0.988647
redacted.ch/!Sonic Boom Six - 2008 - Play On - Rare, Rejected & Arcade Perfected [FLAC]	Disc 02 (Rare & Rejected)/09 - 3 Minute Hero.flac	-10.419998	0.988647
redacted.ch/!Sonic Boom Six - 2008 - Play On - Rare, Rejected & Arcade Perfected [FLAC]	Disc 02 (Rare & Rejected)/10 - Sticks & Stones.flac	-7.160004	0.988647
redacted.ch/!Sonic Boom Six - 2008 - Play On - Rare, Rejected & Arcade Perfected [FLAC]	Disc 02 (Rare & Rejected)/11 - The World's A Twisted Place, But It Won't Twist Me.flac	-9.769997	0.988647
redacted.ch/!Sonic Boom Six - 2008 - Play On - Rare, Rejected & Arcade Perfected [FLAC]	Disc 02 (Rare & Rejected)/12 - Face Forward.flac	-7.459999	0.988647
redacted.ch/!Sonic Boom Six - 2011 - New Style Rocka [FLAC]	01 - New Style Rocka (feat Tonn Piper).flac	-10.750000	0.977203
redacted.ch/!Sonic Boom Six - 2011 - New Style Rocka [FLAC]	02 - What Doesn't Kill You Make You Stronger.flac	-8.730003	0.977203
redacted.ch/!Sonic Boom Six - 2011 - New Style Rocka [FLAC]	03 - New Style Rocka (Frisk Remix).flac	-8.470001	0.977203
redacted.ch/Star Fucking Hipsters - Until We're Dead (2008) [FLAC]	01 Introducción a los Hipsters.flac	-4.669998	0.793610
redacted.ch/Star Fucking Hipsters - Until We're Dead (2008) [FLAC]	02 Until We're Dead.flac	-9.400002	0.988953
redacted.ch/Star Fucking Hipsters - Until We're Dead (2008) [FLAC]	03 Immigrants & Hypocrites.flac	-10.010002	0.977173
redacted.ch/Star Fucking Hipsters - Until We're Dead (2008) [FLAC]	04 Two Cups of Tea.flac	-7.349998	0.907776
redacted.ch/Star Fucking Hipsters - Until We're Dead (2008) [FLAC]	05 Empty Lives.flac	-8.540001	0.922638
redacted.ch/Star Fucking Hipsters - Until We're Dead (2008) [FLAC]	06 Snitch To The Suture.flac	-8.510002	0.938232
redacted.ch/Star Fucking Hipsters - Until We're Dead (2008) [FLAC]	07 Only Sleep.flac	-8.309998	0.931946
redacted.ch/Star Fucking Hipsters - Until We're Dead (2008) [FLAC]	08 9／11 Was (An Inside Joke).flac	-8.580002	0.941376
redacted.ch/Star Fucking Hipsters - Until We're Dead (2008) [FLAC]	09 The Path is Paved.flac	-8.500000	0.933105
redacted.ch/Star Fucking Hipsters - Until We're Dead (2008) [FLAC]	10 Zombie Christ.flac	-9.190002	0.880341
redacted.ch/Star Fucking Hipsters - Until We're Dead (2008) [FLAC]	11 This Wal-Mart Life.flac	-8.330002	0.922333
redacted.ch/Star Fucking Hipsters - Until We're Dead (2008) [FLAC]	12 Broken.flac	-8.610001	0.932861
redacted.ch/Star Fucking Hipsters - Until We're Dead (2008) [FLAC]	13 Death or Fight.flac	-8.779999	0.922394
redacted.ch/Stick Figure - Burnin' Ocean (2008)	Stick Figure - Burnin' Ocean - 01. White Fire.flac	-6.660004	0.998871
redacted.ch/Stick Figure - Burnin' Ocean (2008)	Stick Figure - Burnin' Ocean - 02. We Get High.flac	-8.099998	0.998871
redacted.ch/Stick Figure - Burnin' Ocean (2008)	Stick Figure - Burnin' Ocean - 03. Trouble Up There.flac	-9.349998	0.998871
redacted.ch/Stick Figure - Burnin' Ocean (2008)	Stick Figure - Burnin' Ocean - 04. Dead End Street.flac	-7.620003	0.998871
redacted.ch/Stick Figure - Burnin' Ocean (2008)	Stick Figure - Burnin' Ocean - 05. Running Wild.flac	-9.529999	0.998871
redacted.ch/Stick Figure - Burnin' Ocean (2008)	Stick Figure - Burnin' Ocean - 06. The World is Waiting.flac	-8.580002	0.998871
redacted.ch/Stick Figure - Burnin' Ocean (2008)	Stick Figure - Burnin' Ocean - 07. Burnin' Ocean.flac	-7.340004	0.991302
redacted.ch/Stick Figure - Burnin' Ocean (2008)	Stick Figure - Burnin' Ocean - 08. So Good.flac	-6.660004	0.998871
redacted.ch/Stick Figure - Burnin' Ocean (2008)	Stick Figure - Burnin' Ocean - 09. Come With Me.flac	-8.379997	0.998871
redacted.ch/Stick Figure - Burnin' Ocean (2008)	Stick Figure - Burnin' Ocean - 10. Rise Above.flac	-6.269997	0.998871
redacted.ch/Stick Figure - Burnin' Ocean (2008)	Stick Figure - Burnin' Ocean - 11. Ballz Deep.flac	-7.440002	0.998871
redacted.ch/Stick Figure - Burnin' Ocean (2008)	Stick Figure - Burnin' Ocean - 12. Wonderful World.flac	-8.010002	0.998871
redacted.ch/Stick Figure - Burnin' Ocean (2008)	Stick Figure - Burnin' Ocean - 13. Love Found.flac	-9.080002	0.998871
redacted.ch/Stick Figure - Burnin' Ocean (2008)	Stick Figure - Burnin' Ocean - 14. Songs of Yesterday.flac	-9.269997	0.998871
redacted.ch/Streetlight Manifesto - The Hands That Thieve (2013) [FLAC] {Victory Records - VR614-CD}	01 The Three of US.flac	-10.209999	0.991333
redacted.ch/Streetlight Manifesto - The Hands That Thieve (2013) [FLAC] {Victory Records - VR614-CD}	02 Ungrateful.flac	-10.070000	0.991302
redacted.ch/Streetlight Manifesto - The Hands That Thieve (2013) [FLAC] {Victory Records - VR614-CD}	03 The Littlest Things.flac	-9.349998	0.991272
redacted.ch/Streetlight Manifesto - The Hands That Thieve (2013) [FLAC] {Victory Records - VR614-CD}	04 The Hands That Thieve.flac	-10.010002	0.991333
redacted.ch/Streetlight Manifesto - The Hands That Thieve (2013) [FLAC] {Victory Records - VR614-CD}	05 With Any Sort of Certainity.flac	-9.739998	0.991241
redacted.ch/Streetlight Manifesto - The Hands That Thieve (2013) [FLAC] {Victory Records - VR614-CD}	06 If Only For Memories.flac	-9.150002	0.991333
redacted.ch/Streetlight Manifesto - The Hands That Thieve (2013) [FLAC] {Victory Records - VR614-CD}	07 They Broke Him Down.flac	-10.080002	0.991272
redacted.ch/Streetlight Manifesto - The Hands That Thieve (2013) [FLAC] {Victory Records - VR614-CD}	08 Toe to Toe.flac	-9.290001	0.991272
redacted.ch/Streetlight Manifesto - The Hands That Thieve (2013) [FLAC] {Victory Records - VR614-CD}	09 Oh Me, Oh My.flac	-9.690002	0.991333
redacted.ch/Streetlight Manifesto - The Hands That Thieve (2013) [FLAC] {Victory Records - VR614-CD}	10 Your Day Will Come.flac	-10.050003	0.991364
redacted.ch/Strike Anywhere - 2006 - Dead FM	01 Sedition.flac	-10.190002	0.999146
redacted.ch/Strike Anywhere - 2006 - Dead FM	02 How To Pray.flac	-10.680000	0.999146
redacted.ch/Strike Anywhere - 2006 - Dead FM	03 Prisoner Echoes.flac	-10.290001	0.999268
redacted.ch/Strike Anywhere - 2006 - Dead FM	04 Instinct.flac	-10.050003	0.999146
redacted.ch/Strike Anywhere - 2006 - Dead FM	05 The Promise.flac	-9.959999	0.999146
redacted.ch/Strike Anywhere - 2006 - Dead FM	06 Speak To Our Empty Pockets.flac	-9.959999	0.999146
redacted.ch/Strike Anywhere - 2006 - Dead FM	07 Two Thousand Voices.flac	-10.430000	0.999146
redacted.ch/Strike Anywhere - 2006 - Dead FM	08 Hollywood Cemetery.flac	-9.800003	0.999146
redacted.ch/Strike Anywhere - 2006 - Dead FM	09 Allies.flac	-10.309998	0.999146
redacted.ch/Strike Anywhere - 2006 - Dead FM	10 Gunpowder.flac	-9.650002	0.999146
redacted.ch/Strike Anywhere - 2006 - Dead FM	11 Dead Hours.flac	-10.419998	0.999146
redacted.ch/Strike Anywhere - 2006 - Dead FM	12 Iron Trees.flac	-10.309998	0.999298
redacted.ch/Strike Anywhere - 2006 - Dead FM	13 House Arrest.flac	-9.980003	0.999146
redacted.ch/Strike Anywhere - 2006 - Dead FM	14 Ballad Of Bloody Run.flac	-9.919998	0.999146
redacted.ch/Tegan & Sara - So Jealous	01 - Tegan & Sara - You Wouldn't Like Me.flac	-9.919998	0.901398
redacted.ch/Tegan & Sara - So Jealous	02 - Tegan & Sara - Take Me Anywhere.flac	-10.519997	0.901398
redacted.ch/Tegan & Sara - So Jealous	03 - Tegan & Sara - I Bet It Stung.flac	-10.720001	0.901398
redacted.ch/Tegan & Sara - So Jealous	04 - Tegan & Sara - I Know I Know I Know.flac	-8.400002	0.901428
redacted.ch/Tegan & Sara - So Jealous	05 - Tegan & Sara - Where Does The Good Go.flac	-8.180000	0.901428
redacted.ch/Tegan & Sara - So Jealous	06 - Tegan & Sara - Downtown.flac	-8.870003	0.901398
redacted.ch/Tegan & Sara - So Jealous	07 - Tegan & Sara - I Won't Be Left.flac	-8.709999	0.901428
redacted.ch/Tegan & Sara - So Jealous	08 - Tegan & Sara - Walking With A Ghost.flac	-8.690002	0.901398
redacted.ch/Tegan & Sara - So Jealous	09 - Tegan & Sara - So Jealous.flac	-8.919998	0.901398
redacted.ch/Tegan & Sara - So Jealous	10 - Tegan & Sara - Speak Slow.flac	-9.080002	0.901398
redacted.ch/Tegan & Sara - So Jealous	11 - Tegan & Sara - Wake Up Exhausted.flac	-7.599998	0.901398
redacted.ch/Tegan & Sara - So Jealous	12 - Tegan & Sara - We Didn't Do It.flac	-8.330002	0.901398
redacted.ch/Tegan & Sara - So Jealous	13 - Tegan & Sara - Fix You Up.flac	-8.570000	0.901398
redacted.ch/Tegan & Sara - So Jealous	14 - Tegan & Sara - I Can't Take It.flac	-7.290001	0.901398
redacted.ch/!Tequilajazzz - Целлулоид (2009) [FLAC]	01 - В ожидании праздника.flac	-5.090004	0.881012
redacted.ch/!Tequilajazzz - Целлулоид (2009) [FLAC]	02 - Кроме звезд.flac	-8.959999	0.988892
redacted.ch/!Tequilajazzz - Целлулоид (2009) [FLAC]	03 - Авиация и артиллерия.flac	-7.870003	0.988770
redacted.ch/!Tequilajazzz - Целлулоид (2009) [FLAC]	04 - Зимнее Солнце.flac	-7.830002	0.988861
redacted.ch/!Tequilajazzz - Целлулоид (2009) [FLAC]	05 - Тишина и волшебство.flac	-8.150002	0.988831
redacted.ch/!Tequilajazzz - Целлулоид (2009) [FLAC]	06 - Небо с молоком (Испания).flac	-7.870003	0.988831
redacted.ch/!Tequilajazzz - Целлулоид (2009) [FLAC]	07 - Ветры лестниц.flac	-8.730003	0.988861
redacted.ch/!Tequilajazzz - Целлулоид (2009) [FLAC]	08 - Легенда.flac	-8.279999	0.988831
redacted.ch/!Tequilajazzz - Целлулоид (2009) [FLAC]	09 - Ночью в эфире.flac	-8.190002	0.988800
redacted.ch/!Tequilajazzz - Целлулоид (2009) [FLAC]	10 - Лень.flac	-8.090004	0.988922
redacted.ch/!Tequilajazzz - Целлулоид (2009) [FLAC]	11 - Улитка.flac	-8.349998	0.988861
redacted.ch/!Tequilajazzz - Целлулоид (2009) [FLAC]	12 - Наливайя.flac	-8.760002	0.988831
redacted.ch/!Tequilajazzz - Целлулоид (2009) [FLAC]	13 - Тема прошлого лета.flac	-7.840004	0.988831
redacted.ch/!Tequilajazzz - Целлулоид (2009) [FLAC]	14 - Тема прошлого лета (Sinner And Saint Eclectica Mix).flac	-5.660004	0.988586
redacted.ch/!Tequilajazzz - Целлулоид (2009) [FLAC]	15 - Тема прошлого лета (Wonderful Camouflage Eclectica Mix).flac	-6.639999	0.988586
redacted.ch/!Tequilajazzz - Целлулоид (2009) [FLAC]	16 - Зимнее солнце (Tequila Nova Eclectica Mix).flac	-5.709999	0.988586
redacted.ch/The Cat Empire (2003)	01-The Cat Empire-How to Explain.flac	-7.580002	0.988617
redacted.ch/The Cat Empire (2003)	02-The Cat Empire-Days Like These.flac	-7.330002	1.000000
redacted.ch/The Cat Empire (2003)	03-The Cat Empire-The Lost Song.flac	-5.400002	0.988556
redacted.ch/The Cat Empire (2003)	04-The Cat Empire-The Chariot.flac	-7.879997	0.988617
redacted.ch/The Cat Empire (2003)	05-The Cat Empire-Hello.flac	-7.519997	0.988556
redacted.ch/The Cat Empire (2003)	06-The Cat Empire-One Four Five.flac	-7.669998	0.988556
redacted.ch/The Cat Empire (2003)	07-The Cat Empire-The Rhythm.flac	-7.910004	0.988556
redacted.ch/The Cat Empire (2003)	08-The Cat Empire-The Wine Song.flac	-8.120003	0.988556
redacted.ch/The Cat Empire (2003)	09-The Cat Empire-Nothing.flac	-7.080002	0.988556
redacted.ch/The Cat Empire (2003)	10-The Cat Empire-Beanni.flac	-7.260002	0.988556
redacted.ch/The Cat Empire (2003)	11-The Cat Empire-The Crowd.flac	-8.870003	0.988556
redacted.ch/The Cat Empire (2003)	12-The Cat Empire-Manifesto.flac	-8.519997	0.988617
redacted.ch/The Cat Empire (2003)	13-The Cat Empire-All That Talking.flac	-6.410004	0.988556
redacted.ch/The Cranberries - Everybody Else Is Doing It, So Why Can't We (514 156-2) [FLAC]	01 - I Still Do.flac	-2.809998	0.999359
redacted.ch/The Cranberries - Everybody Else Is Doing It, So Why Can't We (514 156-2) [FLAC]	02 - Dreams.flac	-2.139999	0.920868
redacted.ch/The Cranberries - Everybody Else Is Doing It, So Why Can't We (514 156-2) [FLAC]	03 - Sunday.flac	-2.000000	0.991364
redacted.ch/The Cranberries - Everybody Else Is Doing It, So Why Can't We (514 156-2) [FLAC]	04 - Pretty.flac	-0.410004	0.954132
redacted.ch/The Cranberries - Everybody Else Is Doing It, So Why Can't We (514 156-2) [FLAC]	05 - Waltzing Back.flac	-1.419998	0.999359
redacted.ch/The Cranberries - Everybody Else Is Doing It, So Why Can't We (514 156-2) [FLAC]	06 - Not Sorry.flac	-2.459999	0.953308
redacted.ch/The Cranberries - Everybody Else Is Doing It, So Why Can't We (514 156-2) [FLAC]	07 - Linger.flac	-1.120003	0.851105
redacted.ch/The Cranberries - Everybody Else Is Doing It, So Why Can't We (514 156-2) [FLAC]	08 - Wanted.flac	-2.959999	0.975067
redacted.ch/The Cranberries - Everybody Else Is Doing It, So Why Can't We (514 156-2) [FLAC]	09 - Still Can't....flac	-2.360001	0.861969
redacted.ch/The Cranberries - Everybody Else Is Doing It, So Why Can't We (514 156-2) [FLAC]	10 - I Will Always.flac	-1.720001	0.961487
redacted.ch/The Cranberries - Everybody Else Is Doing It, So Why Can't We (514 156-2) [FLAC]	11 - How.flac	-3.010002	0.932495
redacted.ch/The Cranberries - Everybody Else Is Doing It, So Why Can't We (514 156-2) [FLAC]	12 - Put Me Down.flac	-2.669998	0.959656
redacted.ch/The Cranberries - No Need To Argue (1994) [FLAC]	The Cranberries - 01 - Ode To My Family.flac	-5.220001	0.929840
redacted.ch/The Cranberries - No Need To Argue (1994) [FLAC]	The Cranberries - 02 - I Can't Be with You.flac	-4.840004	0.939880
redacted.ch/The Cranberries - No Need To Argue (1994) [FLAC]	The Cranberries - 03 - Twenty One.flac	-0.739998	0.910339
redacted.ch/The Cranberries - No Need To Argue (1994) [FLAC]	The Cranberries - 04 - Zombie.flac	-6.209999	0.994232
redacted.ch/The Cranberries - No Need To Argue (1994) [FLAC]	The Cranberries - 05 - Empty.flac	-4.330002	0.882599
redacted.ch/The Cranberries - No Need To Argue (1994) [FLAC]	The Cranberries - 06 - Everything I Said.flac	-4.669998	0.953247
redacted.ch/The Cranberries - No Need To Argue (1994) [FLAC]	The Cranberries - 07 - The Icicle Melts.flac	-5.860001	0.956787
redacted.ch/The Cranberries - No Need To Argue (1994) [FLAC]	The Cranberries - 08 - Disappointment.flac	-3.470001	0.932800
redacted.ch/The Cranberries - No Need To Argue (1994) [FLAC]	The Cranberries - 09 - Ridiculous Thoughts.flac	-5.040001	0.942749
redacted.ch/The Cranberries - No Need To Argue (1994) [FLAC]	The Cranberries - 10 - Dreaming My Dreams.flac	-1.190002	0.921722
redacted.ch/The Cranberries - No Need To Argue (1994) [FLAC]	The Cranberries - 11 - Yeat's Grave.flac	-5.349998	0.983856
redacted.ch/The Cranberries - No Need To Argue (1994) [FLAC]	The Cranberries - 12 - Daffodil Lament.flac	-4.120003	0.966125
redacted.ch/The Cranberries - No Need To Argue (1994) [FLAC]	The Cranberries - 13 - No Need To Argue.flac	0.980000	0.886658
redacted.ch/The Dirty Heads - Any Port in a Storm (2010) - FLAC	01 - Neighborhood.flac	-9.849998	0.999969
redacted.ch/The Dirty Heads - Any Port in a Storm (2010) - FLAC	02 - Stand Tall.flac	-10.019997	0.999969
redacted.ch/The Dirty Heads - Any Port in a Storm (2010) - FLAC	03 - Shine.flac	-10.320000	0.999969
redacted.ch/The Dirty Heads - Any Port in a Storm (2010) - FLAC	04 - Driftin'.flac	-10.040001	0.999969
redacted.ch/The Dirty Heads - Any Port in a Storm (2010) - FLAC	05 - Taint.flac	-9.720001	0.999969
redacted.ch/The Dirty Heads - Any Port in a Storm (2010) - FLAC	06 - Morning Light.flac	-9.370003	0.999969
redacted.ch/The Dirty Heads - Any Port in a Storm (2010) - FLAC	07 - Insomnia.flac	-8.930000	0.999969
redacted.ch/The Dirty Heads - Any Port in a Storm (2010) - FLAC	08 - Easy.flac	-9.440002	0.999969
redacted.ch/The Dirty Heads - Any Port in a Storm (2010) - FLAC	09 - Knows That I.flac	-8.330002	0.999969
redacted.ch/The Dirty Heads - Any Port in a Storm (2010) - FLAC	10 - Chelsea.flac	-9.870003	0.999969
redacted.ch/The Dirty Heads - Any Port in a Storm (2010) - FLAC	11 - Check the Level.flac	-10.599998	0.999969
redacted.ch/The Dirty Heads - Any Port in a Storm (2010) - FLAC	12 - Believe.flac	-8.370003	0.999969
redacted.ch/The Dirty Heads - Any Port in a Storm (2010) - FLAC	13 - Hip Hop Misfits.flac	-9.919998	0.999969
redacted.ch/The Dirty Heads - Any Port in a Storm (2010) - FLAC	14 - Everything I'm Looking For.flac	-7.470001	0.999969
redacted.ch/The Dirty Heads - Any Port in a Storm (2010) - FLAC	15 - Stand Tall (acoustic).flac	-9.330002	0.999969
redacted.ch/The Dirty Heads - Any Port in a Storm (2010) - FLAC	16 - Sails to the Wind.flac	-9.910004	0.999969
redacted.ch/The Dirty Heads - Any Port in a Storm (2010) - FLAC	17 - Headphones.flac	-8.470001	0.999969
redacted.ch/The Dirty Heads - Any Port in a Storm (2010) - FLAC	18 - Lonely One.flac	-10.889999	0.999969
redacted.ch/The Dirty Heads - Any Port in a Storm (2010) - FLAC	19 - Lay Me Down.flac	-8.629997	0.999969
redacted.ch/The Dirty Heads - Any Port in a Storm (2010) - FLAC	20 - Antelope.flac	-8.519997	0.999969
redacted.ch/The Dirty Heads - Any Port in a Storm (2010) - FLAC	21 - Rains It Pours.flac	-7.910004	0.999969
redacted.ch/The Dirty Heads - Any Port in a Storm (2010) - FLAC	22 - I Got No Time.flac	-8.790001	0.999969
redacted.ch/The Distillers - 2002 - Sing Sing Death House [FLAC]	01 Sick Of It All.flac	-10.610001	0.988831
redacted.ch/The Distillers - 2002 - Sing Sing Death House [FLAC]	02 I Am A Revenant.flac	-10.590004	0.999969
redacted.ch/The Distillers - 2002 - Sing Sing Death House [FLAC]	03 Seneca Falls.flac	-10.169998	0.966309
redacted.ch/The Distillers - 2002 - Sing Sing Death House [FLAC]	04 The Young Crazed Peeling.flac	-10.309998	1.000000
redacted.ch/The Distillers - 2002 - Sing Sing Death House [FLAC]	05 Sing Sing Death House.flac	-11.360001	0.988831
redacted.ch/The Distillers - 2002 - Sing Sing Death House [FLAC]	06 Bullet & The Bullseye.flac	-11.269997	0.996246
redacted.ch/The Distillers - 2002 - Sing Sing Death House [FLAC]	07 City Of Angels.flac	-10.320000	1.000000
redacted.ch/The Distillers - 2002 - Sing Sing Death House [FLAC]	08 Young Girl.flac	-10.769997	0.988831
redacted.ch/The Distillers - 2002 - Sing Sing Death House [FLAC]	09 Hate Me.flac	-10.940002	0.988831
redacted.ch/The Distillers - 2002 - Sing Sing Death House [FLAC]	10 Desperate.flac	-11.470001	0.988831
redacted.ch/The Distillers - 2002 - Sing Sing Death House [FLAC]	11 I Understand.flac	-10.750000	0.988831
redacted.ch/The Distillers - 2002 - Sing Sing Death House [FLAC]	12 Lordy Lordy.flac	-10.160004	0.988800
redacted.ch/The Flatliners - Cavalcade (2010) [FLAC]	01-The_Flatliners-The_Calming_Collection.flac	-9.959999	0.999878
redacted.ch/The Flatliners - Cavalcade (2010) [FLAC]	02-The_Flatliners-Carry_The_Banner.flac	-10.010002	0.999878
redacted.ch/The Flatliners - Cavalcade (2010) [FLAC]	03-The_Flatliners-Bleed.flac	-9.650002	0.999878
redacted.ch/The Flatliners - Cavalcade (2010) [FLAC]	04-The_Flatliners-Here_Comes_Treble.flac	-10.199997	0.999878
redacted.ch/The Flatliners - Cavalcade (2010) [FLAC]	05-The_Flatliners-He_Was_A_Jazzman.flac	-9.370003	0.999878
redacted.ch/The Flatliners - Cavalcade (2010) [FLAC]	06-The_Flatliners-Shithawks.flac	-10.120003	0.999878
redacted.ch/The Flatliners - Cavalcade (2010) [FLAC]	07-The_Flatliners-Monumental.flac	-10.309998	0.999878
redacted.ch/The Flatliners - Cavalcade (2010) [FLAC]	08-The_Flatliners-Filthy_Habits.flac	-10.199997	0.999878
redacted.ch/The Flatliners - Cavalcade (2010) [FLAC]	09-The_Flatliners-Liver_Alone.flac	-10.489998	0.999878
redacted.ch/The Flatliners - Cavalcade (2010) [FLAC]	10-The_Flatliners-Sleep_Your_Life_Away.flac	-9.699997	0.999878
redacted.ch/The Flatliners - Cavalcade (2010) [FLAC]	11-The_Flatliners-Count_Your_Bruises.flac	-10.510002	0.999878
redacted.ch/The Flatliners - Cavalcade (2010) [FLAC]	12-The_Flatliners-New_Years_Resolution.flac	-9.239998	0.999878
redacted.ch/The Flatliners - Dead Language (2013) [FLAC]	01 - Resuscitation of the Year.flac	-10.290001	1.000000
redacted.ch/The Flatliners - Dead Language (2013) [FLAC]	02 - Bury Me.flac	-9.340004	0.999969
redacted.ch/The Flatliners - Dead Language (2013) [FLAC]	03 - Birds of England.flac	-9.879997	1.000000
redacted.ch/The Flatliners - Dead Language (2013) [FLAC]	04 - Drown in Blood.flac	-10.029999	1.000000
redacted.ch/The Flatliners - Dead Language (2013) [FLAC]	05 - Sew My Mouth Shut.flac	-9.590004	0.999969
redacted.ch/The Flatliners - Dead Language (2013) [FLAC]	06 - Caskets Full.flac	-10.160004	0.999969
redacted.ch/The Flatliners - Dead Language (2013) [FLAC]	07 - Ashes Away.flac	-9.500000	1.000000
redacted.ch/The Flatliners - Dead Language (2013) [FLAC]	08 - Hounds.flac	-9.940002	0.999725
redacted.ch/The Flatliners - Dead Language (2013) [FLAC]	09 - Dead Hands.flac	-10.389999	1.000000
redacted.ch/The Flatliners - Dead Language (2013) [FLAC]	10 - Tail Feathers.flac	-10.040001	1.000000
redacted.ch/The Flatliners - Dead Language (2013) [FLAC]	11 - Quitters.flac	-10.040001	1.000000
redacted.ch/The Flatliners - Dead Language (2013) [FLAC]	12 - Young Professionals.flac	-10.099998	1.000000
redacted.ch/The Flatliners - Dead Language (2013) [FLAC]	13 - Brilliant Resilience.flac	-9.010002	1.000000
redacted.ch/The Hot 8 Brass Band - Rock With the Hot 8 (2007) [FLAC] {TRU CD 141}	01 What's My Name .flac	-10.559998	0.977478
redacted.ch/The Hot 8 Brass Band - Rock With the Hot 8 (2007) [FLAC] {TRU CD 141}	02 It's Real.flac	-9.639999	0.977509
redacted.ch/The Hot 8 Brass Band - Rock With the Hot 8 (2007) [FLAC] {TRU CD 141}	03 Fly Away.flac	-10.169998	0.977478
redacted.ch/The Hot 8 Brass Band - Rock With the Hot 8 (2007) [FLAC] {TRU CD 141}	04 I Got You.flac	-10.090004	0.977478
redacted.ch/The Hot 8 Brass Band - Rock With the Hot 8 (2007) [FLAC] {TRU CD 141}	05 Sexual Healing.flac	-11.459999	0.977509
redacted.ch/The Hot 8 Brass Band - Rock With the Hot 8 (2007) [FLAC] {TRU CD 141}	06 Jisten to Me.flac	-9.760002	0.977478
redacted.ch/The Hot 8 Brass Band - Rock With the Hot 8 (2007) [FLAC] {TRU CD 141}	07 We Are One.flac	-10.199997	0.977509
redacted.ch/The Hot 8 Brass Band - Rock With the Hot 8 (2007) [FLAC] {TRU CD 141}	08 Skeet Street.flac	-11.309998	0.977478
redacted.ch/The Hot 8 Brass Band - Rock With the Hot 8 (2007) [FLAC] {TRU CD 141}	09 Rastafunk.flac	-9.220001	0.977478
redacted.ch/The Hot 8 Brass Band - Rock With the Hot 8 (2007) [FLAC] {TRU CD 141}	10 E Flat Blues.flac	-9.870003	0.977509
redacted.ch/The Hot 8 Brass Band - Rock With the Hot 8 (2007) [FLAC] {TRU CD 141}	11 Skit #1.flac	-6.650002	0.863495
redacted.ch/The Hot 8 Brass Band - Rock With the Hot 8 (2007) [FLAC] {TRU CD 141}	12 Love Don't Live Here.flac	-11.120003	0.977509
redacted.ch/The Hot 8 Brass Band - Rock With the Hot 8 (2007) [FLAC] {TRU CD 141}	13 Get Up.flac	-9.940002	0.977509
redacted.ch/!The Jam - Sound Affects and All Mod Cons [MFSL]	01 - All Mod Cons.flac	-4.320000	0.988251
redacted.ch/!The Jam - Sound Affects and All Mod Cons [MFSL]	02 - To Be Someone (Didn't We Have A Nice Time).flac	-3.849998	0.988281
redacted.ch/!The Jam - Sound Affects and All Mod Cons [MFSL]	03 - Mr. Clean.flac	-3.620003	0.988251
redacted.ch/!The Jam - Sound Affects and All Mod Cons [MFSL]	04 - David Watts.flac	-4.470001	0.984863
redacted.ch/!The Jam - Sound Affects and All Mod Cons [MFSL]	05 - English Rose.flac	3.680000	0.374359
redacted.ch/!The Jam - Sound Affects and All Mod Cons [MFSL]	06 - In The Crowd.flac	-5.330002	0.988281
redacted.ch/!The Jam - Sound Affects and All Mod Cons [MFSL]	07 - Billy Hunt.flac	-5.550003	0.988281
redacted.ch/!The Jam - Sound Affects and All Mod Cons [MFSL]	08 - It's Too Bad.flac	-5.040001	0.988281
redacted.ch/!The Jam - Sound Affects and All Mod Cons [MFSL]	09 - Fly.flac	-1.769997	0.792236
redacted.ch/!The Jam - Sound Affects and All Mod Cons [MFSL]	10 - The Place I Love.flac	-5.309998	0.988251
redacted.ch/!The Jam - Sound Affects and All Mod Cons [MFSL]	11 - 'A' Bomb In Wardour Street.flac	-5.650002	0.988281
redacted.ch/!The Jam - Sound Affects and All Mod Cons [MFSL]	12 - Down In The Tube Station At Midnight.flac	-5.590004	0.988281
redacted.ch/!The Jam - Sound Affects and All Mod Cons [MFSL]	13 - Pretty Green.flac	-2.540001	0.934509
redacted.ch/!The Jam - Sound Affects and All Mod Cons [MFSL]	14 - Monday.flac	-2.550003	0.967499
redacted.ch/!The Jam - Sound Affects and All Mod Cons [MFSL]	15 - But I'm Different Now.flac	-4.269997	0.963104
redacted.ch/!The Jam - Sound Affects and All Mod Cons [MFSL]	16 - Set The House Ablaze.flac	-4.370003	0.988281
redacted.ch/!The Jam - Sound Affects and All Mod Cons [MFSL]	17 - Start!.flac	-1.919998	0.922180
redacted.ch/!The Jam - Sound Affects and All Mod Cons [MFSL]	18 - That's Entertainment.flac	-0.470001	0.999969
redacted.ch/!The Jam - Sound Affects and All Mod Cons [MFSL]	19 - Dream Time.flac	-2.370003	0.958832
redacted.ch/!The Jam - Sound Affects and All Mod Cons [MFSL]	20 - Man In The Corner Shop.flac	-1.580002	0.949829
redacted.ch/!The Jam - Sound Affects and All Mod Cons [MFSL]	21 - Music For The Last Couple.flac	0.779999	0.956482
redacted.ch/!The Jam - Sound Affects and All Mod Cons [MFSL]	22 - Boy About Town.flac	-2.840004	0.979645
redacted.ch/!The Jam - Sound Affects and All Mod Cons [MFSL]	23 - Scrape Away.flac	-0.419998	0.859711
redacted.ch/The Mighty Mighty Bosstones - Let's Face It	01 - Noise Brigade.flac	-8.500000	0.928589
redacted.ch/The Mighty Mighty Bosstones - Let's Face It	02 - The Rascal King.flac	-8.199997	0.928436
redacted.ch/The Mighty Mighty Bosstones - Let's Face It	03 - Royal Oil.flac	-6.720001	0.977234
redacted.ch/The Mighty Mighty Bosstones - Let's Face It	04 - The Impression That I Get.flac	-9.269997	0.979889
redacted.ch/The Mighty Mighty Bosstones - Let's Face It	05 - Let's Face It.flac	-8.059998	0.979889
redacted.ch/The Mighty Mighty Bosstones - Let's Face It	06 - That Bug Bit Me.flac	-8.779999	0.979889
redacted.ch/The Mighty Mighty Bosstones - Let's Face It	07 - Another Drinkin' Song.flac	-9.449997	0.999420
redacted.ch/The Mighty Mighty Bosstones - Let's Face It	08 - Numbered Days.flac	-8.910004	0.979889
redacted.ch/The Mighty Mighty Bosstones - Let's Face It	09 - Break So Easily.flac	-8.320000	0.977234
redacted.ch/The Mighty Mighty Bosstones - Let's Face It	10 - Nevermind Me.flac	-8.680000	1.000000
redacted.ch/The Mighty Mighty Bosstones - Let's Face It	11 - Desensitized.flac	-9.879997	0.979889
redacted.ch/The Mighty Mighty Bosstones - Let's Face It	12 - 1-2-8.flac	-8.550003	0.979889
redacted.ch/The Mighty Mighty Bosstones - Pay Attention (2000) [FLAC]	01 - Let Me Be.flac	-10.389999	0.998474
redacted.ch/The Mighty Mighty Bosstones - Pay Attention (2000) [FLAC]	02 - The Skeleton Song.flac	-11.379997	0.998413
redacted.ch/The Mighty Mighty Bosstones - Pay Attention (2000) [FLAC]	03 - All Things Considered.flac	-10.220001	0.998444
redacted.ch/The Mighty Mighty Bosstones - Pay Attention (2000) [FLAC]	04 - So Sad to Say.flac	-10.970001	0.998566
redacted.ch/The Mighty Mighty Bosstones - Pay Attention (2000) [FLAC]	05 - Allow Them.flac	-10.019997	0.998474
redacted.ch/The Mighty Mighty Bosstones - Pay Attention (2000) [FLAC]	06 - High School Dance.flac	-9.980003	0.998383
redacted.ch/The Mighty Mighty Bosstones - Pay Attention (2000) [FLAC]	07 - Over the Eggshells.flac	-10.290001	0.998535
redacted.ch/The Mighty Mighty Bosstones - Pay Attention (2000) [FLAC]	08 - She Just Happened.flac	-9.230003	0.998260
redacted.ch/The Mighty Mighty Bosstones - Pay Attention (2000) [FLAC]	09 - Finally.flac	-9.989998	0.998444
redacted.ch/The Mighty Mighty Bosstones - Pay Attention (2000) [FLAC]	10 - I Know More.flac	-10.309998	0.998383
redacted.ch/The Mighty Mighty Bosstones - Pay Attention (2000) [FLAC]	11 - Riot on Broad Street.flac	-9.239998	0.998383
redacted.ch/The Mighty Mighty Bosstones - Pay Attention (2000) [FLAC]	12 - One Million Reasons.flac	-10.840004	0.998657
redacted.ch/The Mighty Mighty Bosstones - Pay Attention (2000) [FLAC]	13 - Bad News and Bad Breaks.flac	-9.230003	0.998535
redacted.ch/The Mighty Mighty Bosstones - Pay Attention (2000) [FLAC]	14 - Temporary Trip.flac	-10.349998	0.998383
redacted.ch/The Mighty Mighty Bosstones - Pay Attention (2000) [FLAC]	15 - Where You Come From.flac	-10.730003	0.998657
redacted.ch/The Mighty Mighty Bosstones - Pay Attention (2000) [FLAC]	16 - The Day He Didn't Die.flac	-8.279999	0.998352
redacted.ch/The Mighty Mighty Bosstones - Pin Points and Gin Joints [FLAC]	01 - The Mighty Mighty Bosstones - Graffiti Worth Reading.flac	-10.290001	0.966125
redacted.ch/The Mighty Mighty Bosstones - Pin Points and Gin Joints [FLAC]	02 - The Mighty Mighty Bosstones - Nah Nah Nah Nah Nah.flac	-10.940002	0.966125
redacted.ch/The Mighty Mighty Bosstones - Pin Points and Gin Joints [FLAC]	03 - The Mighty Mighty Bosstones - The Route That I Took.flac	-10.389999	0.966125
redacted.ch/The Mighty Mighty Bosstones - Pin Points and Gin Joints [FLAC]	04 - The Mighty Mighty Bosstones - You Left Right .flac	-10.139999	0.966125
redacted.ch/The Mighty Mighty Bosstones - Pin Points and Gin Joints [FLAC]	05 - The Mighty Mighty Bosstones - Too Many Stars.flac	-11.610001	0.966125
redacted.ch/The Mighty Mighty Bosstones - Pin Points and Gin Joints [FLAC]	06 - The Mighty Mighty Bosstones - Your Life.flac	-9.430000	0.966125
redacted.ch/The Mighty Mighty Bosstones - Pin Points and Gin Joints [FLAC]	07 - The Mighty Mighty Bosstones - I Wrote It.flac	-10.320000	0.966125
redacted.ch/The Mighty Mighty Bosstones - Pin Points and Gin Joints [FLAC]	08 - The Mighty Mighty Bosstones - Not To Me On That Night.flac	-10.070000	0.966278
redacted.ch/The Mighty Mighty Bosstones - Pin Points and Gin Joints [FLAC]	09 - The Mighty Mighty Bosstones - Wasted Summers.flac	-10.449997	0.966217
redacted.ch/The Mighty Mighty Bosstones - Pin Points and Gin Joints [FLAC]	10 - The Mighty Mighty Bosstones - Sister Mary.flac	-9.809998	0.988647
redacted.ch/The Mighty Mighty Bosstones - Pin Points and Gin Joints [FLAC]	11 - The Mighty Mighty Bosstones - It Will Be.flac	-11.169998	0.988617
redacted.ch/The Mighty Mighty Bosstones - Pin Points and Gin Joints [FLAC]	12 - The Mighty Mighty Bosstones - The Death Valley Vipers.flac	-11.120003	0.988617
redacted.ch/The Mighty Mighty Bosstones - Pin Points and Gin Joints [FLAC]	13 - The Mighty Mighty Bosstones - The Bricklayer's Story.flac	-11.050003	0.988617
redacted.ch/The Mighty Mighty Bosstones - Pin Points and Gin Joints [FLAC]	14 - The Mighty Mighty Bosstones - A Pretty Sad Excuse.flac	-10.879997	0.988617
redacted.ch/The Mighty Mighty BossTones - Question The Answers (1994) - flac	01 - Kinder Words.flac	-6.180000	0.988556
redacted.ch/The Mighty Mighty BossTones - Question The Answers (1994) - flac	02 - A Sad Silence.flac	-5.650002	0.988556
redacted.ch/The Mighty Mighty BossTones - Question The Answers (1994) - flac	03 - Hell of a Hat.flac	-7.959999	0.988556
redacted.ch/The Mighty Mighty BossTones - Question The Answers (1994) - flac	04 - Pictures to Prove it.flac	-7.599998	0.988556
redacted.ch/The Mighty Mighty BossTones - Question The Answers (1994) - flac	05 - We Should Talk.flac	-6.500000	0.988556
redacted.ch/The Mighty Mighty BossTones - Question The Answers (1994) - flac	06 - A Dollar and a Dream.flac	-4.739998	0.983307
redacted.ch/The Mighty Mighty BossTones - Question The Answers (1994) - flac	07 - Stand Off.flac	-7.779999	0.988556
redacted.ch/The Mighty Mighty BossTones - Question The Answers (1994) - flac	08 - 365 Days.flac	-6.959999	0.988556
redacted.ch/The Mighty Mighty BossTones - Question The Answers (1994) - flac	09 - Toxic Toast.flac	-5.680000	0.988556
redacted.ch/The Mighty Mighty BossTones - Question The Answers (1994) - flac	10 - Bronzing the Garbage.flac	-7.440002	0.988556
redacted.ch/The Mighty Mighty BossTones - Question The Answers (1994) - flac	11 - Dogs and Chaplains.flac	-6.180000	0.988556
redacted.ch/The Mighty Mighty BossTones - Question The Answers (1994) - flac	12 - Jump Through the Hoops.flac	-7.349998	0.988556
redacted.ch/The Offspring - Defy You [FLAC]	01 - Defy You.flac	-10.529999	0.988800
redacted.ch/The Offspring - Defy You [FLAC]	02 - One Hundred Punks.flac	-9.019997	0.999969
redacted.ch/The Offspring - Defy You [FLAC]	03 - Sel Esteem ( Live ).flac	-8.199997	1.000000
redacted.ch/The Offspring - Defy You [FLAC]	04 - Want You Bad ( Live ).flac	-9.989998	0.988831
redacted.ch/Therapy; - 1994 - Troublegum	01 - Knives.flac	-8.580002	0.977631
redacted.ch/Therapy; - 1994 - Troublegum	02 - Screamager.flac	-8.040001	0.977631
redacted.ch/Therapy; - 1994 - Troublegum	03 - Hellbelly.flac	-7.820000	0.977631
redacted.ch/Therapy; - 1994 - Troublegum	04 - Stop It You're Killing Me.flac	-8.059998	0.977631
redacted.ch/Therapy; - 1994 - Troublegum	05 - Nowhere.flac	-7.620003	0.977509
redacted.ch/Therapy; - 1994 - Troublegum	06 - Die Laughing.flac	-7.980003	0.977570
redacted.ch/Therapy; - 1994 - Troublegum	07 - Unbeliever.flac	-7.900002	0.977631
redacted.ch/Therapy; - 1994 - Troublegum	08 - Trigger Inside.flac	-8.169998	0.977661
redacted.ch/Therapy; - 1994 - Troublegum	09 - Lunacy Booth.flac	-7.320000	0.977570
redacted.ch/Therapy; - 1994 - Troublegum	10 - Isolation.flac	-7.699997	0.977692
redacted.ch/Therapy; - 1994 - Troublegum	11 - Turn.flac	-7.840004	0.977631
redacted.ch/Therapy; - 1994 - Troublegum	12 - Femtex.flac	-8.269997	0.977661
redacted.ch/Therapy; - 1994 - Troublegum	13 - Unrequited.flac	-8.220001	0.977692
redacted.ch/Therapy; - 1994 - Troublegum	14 - Brainsaw.flac	-5.860001	0.990387
redacted.ch/Therapy - Infernal Love (1995) [FLAC]	01 - Epilepsy.flac	-8.230003	0.949158
redacted.ch/Therapy - Infernal Love (1995) [FLAC]	02 - Stories.flac	-6.959999	0.944153
redacted.ch/Therapy - Infernal Love (1995) [FLAC]	03 - A Moment Of Clarity.flac	-6.379997	0.944153
redacted.ch/Therapy - Infernal Love (1995) [FLAC]	04 - Jude The Obscene.flac	-8.070000	0.960541
redacted.ch/Therapy - Infernal Love (1995) [FLAC]	05 - Bowels Of Love.flac	-7.110001	0.961456
redacted.ch/Therapy - Infernal Love (1995) [FLAC]	06 - Misery.flac	-8.360001	0.910034
redacted.ch/Therapy - Infernal Love (1995) [FLAC]	07 - Bad Mother.flac	-7.309998	0.949402
redacted.ch/Therapy - Infernal Love (1995) [FLAC]	08 - Me Vs You.flac	-7.650002	0.954010
redacted.ch/Therapy - Infernal Love (1995) [FLAC]	09 - Loose.flac	-8.040001	0.955444
redacted.ch/Therapy - Infernal Love (1995) [FLAC]	10 - Diane.flac	-4.489998	0.944122
redacted.ch/Therapy - Infernal Love (1995) [FLAC]	11 - 30 Seconds.flac	-7.410004	0.963287
redacted.ch/The Skatalites - 1997 - Foundation Ska (FLAC)	The Skatalites - 1997 - Foundation Ska - Disc One/01 - Christine Keeler.flac	-5.519997	0.988586
redacted.ch/The Skatalites - 1997 - Foundation Ska (FLAC)	The Skatalites - 1997 - Foundation Ska - Disc One/02 - Fidel Castro.flac	-3.790001	0.842621
redacted.ch/The Skatalites - 1997 - Foundation Ska (FLAC)	The Skatalites - 1997 - Foundation Ska - Disc One/03 - Simmer Down (with Bob Marley and The Wailers).flac	-7.300003	0.988556
redacted.ch/The Skatalites - 1997 - Foundation Ska (FLAC)	The Skatalites - 1997 - Foundation Ska - Disc One/04 - Alley Pang.flac	-4.550003	0.988556
redacted.ch/The Skatalites - 1997 - Foundation Ska (FLAC)	The Skatalites - 1997 - Foundation Ska - Disc One/05 - Exodus.flac	-6.590004	0.988556
redacted.ch/The Skatalites - 1997 - Foundation Ska (FLAC)	The Skatalites - 1997 - Foundation Ska - Disc One/06 - King Solomon.flac	-4.849998	0.988586
redacted.ch/The Skatalites - 1997 - Foundation Ska (FLAC)	The Skatalites - 1997 - Foundation Ska - Disc One/07 - Eastern Standard Time.flac	-4.849998	0.988586
redacted.ch/The Skatalites - 1997 - Foundation Ska (FLAC)	The Skatalites - 1997 - Foundation Ska - Disc One/08 - World's Fair (with Stranger Cole and Ken Boothe).flac	-5.489998	0.925873
redacted.ch/The Skatalites - 1997 - Foundation Ska (FLAC)	The Skatalites - 1997 - Foundation Ska - Disc One/09 - Two For One.flac	-6.090004	0.988586
redacted.ch/The Skatalites - 1997 - Foundation Ska (FLAC)	The Skatalites - 1997 - Foundation Ska - Disc One/10 - I Should Have Known Better.flac	-7.760002	0.988586
redacted.ch/The Skatalites - 1997 - Foundation Ska (FLAC)	The Skatalites - 1997 - Foundation Ska - Disc One/11 - Hot Cargo.flac	-5.500000	0.988586
redacted.ch/The Skatalites - 1997 - Foundation Ska (FLAC)	The Skatalites - 1997 - Foundation Ska - Disc One/12 - Black Sunday.flac	-4.650002	0.988586
redacted.ch/The Skatalites - 1997 - Foundation Ska (FLAC)	The Skatalites - 1997 - Foundation Ska - Disc One/13 - Ska La Parisienne.flac	-5.590004	0.964783
redacted.ch/The Skatalites - 1997 - Foundation Ska (FLAC)	The Skatalites - 1997 - Foundation Ska - Disc One/14 - Don D Lion.flac	-5.639999	0.988586
redacted.ch/The Skatalites - 1997 - Foundation Ska (FLAC)	The Skatalites - 1997 - Foundation Ska - Disc One/15 - Dick Tracy.flac	-4.580002	0.988586
redacted.ch/The Skatalites - 1997 - Foundation Ska (FLAC)	The Skatalites - 1997 - Foundation Ska - Disc One/16 - Hanging Tree.flac	-7.349998	0.919373
redacted.ch/The Skatalites - 1997 - Foundation Ska (FLAC)	The Skatalites - 1997 - Foundation Ska - Disc Two/01 - Scandal Ska.flac	-4.150002	0.988586
redacted.ch/The Skatalites - 1997 - Foundation Ska (FLAC)	The Skatalites - 1997 - Foundation Ska - Disc Two/02 - Occupation.flac	-4.180000	0.988586
redacted.ch/The Skatalites - 1997 - Foundation Ska (FLAC)	The Skatalites - 1997 - Foundation Ska - Disc Two/03 - Old Rocking Chair (feat. Jackie Opel).flac	-6.809998	0.780487
redacted.ch/The Skatalites - 1997 - Foundation Ska (FLAC)	The Skatalites - 1997 - Foundation Ska - Disc Two/04 - Third Man Ska.flac	-9.279999	0.820831
redacted.ch/The Skatalites - 1997 - Foundation Ska (FLAC)	The Skatalites - 1997 - Foundation Ska - Disc Two/05 - Ringo's Theme Ska.flac	-5.389999	0.988586
redacted.ch/The Skatalites - 1997 - Foundation Ska (FLAC)	The Skatalites - 1997 - Foundation Ska - Disc Two/06 - Ringo's Theme (v2).flac	-6.290001	0.988586
redacted.ch/The Skatalites - 1997 - Foundation Ska (FLAC)	The Skatalites - 1997 - Foundation Ska - Disc Two/07 - Nimrod.flac	-4.730003	0.988556
redacted.ch/The Skatalites - 1997 - Foundation Ska (FLAC)	The Skatalites - 1997 - Foundation Ska - Disc Two/08 - Woman a Come (feat. Margarita).flac	-4.160004	0.988586
redacted.ch/The Skatalites - 1997 - Foundation Ska (FLAC)	The Skatalites - 1997 - Foundation Ska - Disc Two/09 - Cleopatra.flac	-7.230003	0.907990
redacted.ch/The Skatalites - 1997 - Foundation Ska (FLAC)	The Skatalites - 1997 - Foundation Ska - Disc Two/10 - Beardsman Ska.flac	-6.110001	1.000000
redacted.ch/The Skatalites - 1997 - Foundation Ska (FLAC)	The Skatalites - 1997 - Foundation Ska - Disc Two/11 - Addis Ababa.flac	-5.949997	0.999969
redacted.ch/The Skatalites - 1997 - Foundation Ska (FLAC)	The Skatalites - 1997 - Foundation Ska - Disc Two/12 - Silver Dollar (original version).flac	-4.820000	0.780548
redacted.ch/The Skatalites - 1997 - Foundation Ska (FLAC)	The Skatalites - 1997 - Foundation Ska - Disc Two/13 - The Vow (feat. Jackie Opel & Doreen Schaffer).flac	-5.250000	0.988586
redacted.ch/The Skatalites - 1997 - Foundation Ska (FLAC)	The Skatalites - 1997 - Foundation Ska - Disc Two/14 - Dr Kildare.flac	-2.879997	0.988586
redacted.ch/The Skatalites - 1997 - Foundation Ska (FLAC)	The Skatalites - 1997 - Foundation Ska - Disc Two/15 - Killer Diller.flac	-5.610001	0.928589
redacted.ch/The Skatalites - 1997 - Foundation Ska (FLAC)	The Skatalites - 1997 - Foundation Ska - Disc Two/16 - Naked City.flac	-6.250000	0.988586
redacted.ch/The Skints - 2009 - Live, Breathe, Build, Believe[FLAC]	01 - Mindless.flac	-6.970001	0.977661
redacted.ch/The Skints - 2009 - Live, Breathe, Build, Believe[FLAC]	02 - 'Get Me!'.flac	-8.540001	0.977661
redacted.ch/The Skints - 2009 - Live, Breathe, Build, Believe[FLAC]	03 - Ya Know.flac	-7.000000	0.977692
redacted.ch/The Skints - 2009 - Live, Breathe, Build, Believe[FLAC]	04 - Contemplations of the Modern Rudeboy.flac	-7.570000	0.977722
redacted.ch/The Skints - 2009 - Live, Breathe, Build, Believe[FLAC]	05 - Culture Vulture.flac	-8.010002	0.977661
redacted.ch/The Skints - 2009 - Live, Breathe, Build, Believe[FLAC]	06 - Murderer.flac	-6.849998	0.977692
redacted.ch/The Skints - 2009 - Live, Breathe, Build, Believe[FLAC]	07 - Bright Girl.flac	-6.629997	0.977661
redacted.ch/The Skints - 2009 - Live, Breathe, Build, Believe[FLAC]	08 - Change the Channel.flac	-6.919998	0.977661
redacted.ch/The Skints - 2009 - Live, Breathe, Build, Believe[FLAC]	09 - Sociopath.flac	-7.849998	0.977692
redacted.ch/The Skints - 2009 - Live, Breathe, Build, Believe[FLAC]	10 - Roanna's Song.flac	-7.139999	0.977692
redacted.ch/The Skints - 2012 - Part & Parcel[FLAC]	01 - The Skints - Rise Up.flac	-7.779999	0.988922
redacted.ch/The Skints - 2012 - Part & Parcel[FLAC]	02 - The Skints - Ratatat.flac	-7.430000	0.991821
redacted.ch/The Skints - 2012 - Part & Parcel[FLAC]	03 - The Skints - Can't Take No More.flac	-8.309998	0.994751
redacted.ch/The Skints - 2012 - Part & Parcel[FLAC]	04 - The Skints - Live East Die Young.flac	-7.840004	0.988525
redacted.ch/The Skints - 2012 - Part & Parcel[FLAC]	05 - The Skints - Ring Ring.flac	-5.970001	0.982819
redacted.ch/The Skints - 2012 - Part & Parcel[FLAC]	06 - The Skints - Lay You Down.flac	-6.809998	0.988525
redacted.ch/The Skints - 2012 - Part & Parcel[FLAC]	07 - The Skints - Sunny Sunny.flac	-6.269997	0.999969
redacted.ch/The Skints - 2012 - Part & Parcel[FLAC]	08 - The Skints - Rubadub (Done Know).flac	-8.940002	0.989166
redacted.ch/The Skints - 2012 - Part & Parcel[FLAC]	09 - The Skints - Up Against The Wall Riddm.flac	-8.370003	0.988525
redacted.ch/The Skints - 2012 - Part & Parcel[FLAC]	10 - The Skints - Soundboy.flac	-6.529999	0.982758
redacted.ch/The Skints - 2012 - Part & Parcel[FLAC]	11 - The Skints - You Better.flac	-6.330002	0.979523
redacted.ch/The Skints - FM (2015) [FLAC] { Easy Star Records, ES-1046, 15 TRK }	01 - FM ... DJ Mr. Versatile Breakfast Show.flac	-2.699997	0.976257
redacted.ch/The Skints - FM (2015) [FLAC] { Easy Star Records, ES-1046, 15 TRK }	02 - This Town  (featuring Tippa Irie & Horseman).flac	-5.779999	0.976349
redacted.ch/The Skints - FM (2015) [FLAC] { Easy Star Records, ES-1046, 15 TRK }	03 - In The Night  (featuring Horseman).flac	-6.080002	0.976349
redacted.ch/The Skints - FM (2015) [FLAC] { Easy Star Records, ES-1046, 15 TRK }	04 - Come To You.flac	-6.220001	0.976318
redacted.ch/The Skints - FM (2015) [FLAC] { Easy Star Records, ES-1046, 15 TRK }	05 - My War.flac	-6.690002	0.976349
redacted.ch/The Skints - FM (2015) [FLAC] { Easy Star Records, ES-1046, 15 TRK }	06 - FM ... Dancehall Dilemmas with Dr. Ranking Pegasus.flac	-6.019997	0.976227
redacted.ch/The Skints - FM (2015) [FLAC] { Easy Star Records, ES-1046, 15 TRK }	07 - Friends & Business.flac	-6.480003	0.976318
redacted.ch/The Skints - FM (2015) [FLAC] { Easy Star Records, ES-1046, 15 TRK }	08 - Where Did You Go.flac	-5.900002	0.976349
redacted.ch/The Skints - FM (2015) [FLAC] { Easy Star Records, ES-1046, 15 TRK }	09 - Tazer Beam  (featuring Tippa Irie).flac	-5.800003	0.976349
redacted.ch/The Skints - FM (2015) [FLAC] { Easy Star Records, ES-1046, 15 TRK }	10 - The Forest For The Trees.flac	-6.959999	0.976318
redacted.ch/The Skints - FM (2015) [FLAC] { Easy Star Records, ES-1046, 15 TRK }	11 - FM ... Grime Hour with Rivz.flac	-5.879997	0.952820
redacted.ch/The Skints - FM (2015) [FLAC] { Easy Star Records, ES-1046, 15 TRK }	12 - Eyes In The Back Of My Head  (featuring Rival).flac	-6.840004	0.976349
redacted.ch/The Skints - FM (2015) [FLAC] { Easy Star Records, ES-1046, 15 TRK }	13 - Got No Say.flac	-6.340004	0.976318
redacted.ch/The Skints - FM (2015) [FLAC] { Easy Star Records, ES-1046, 15 TRK }	14 - FM ... DJ Mr. Versatile Evening Session.flac	-4.800003	0.976257
redacted.ch/The Skints - FM (2015) [FLAC] { Easy Star Records, ES-1046, 15 TRK }	15 - Tomorrow.flac	-6.459999	0.976318
redacted.ch/The Specials - 1979 - Specials [FLAC]	01 - A Message to You Rudy.flac	-3.820000	0.962952
redacted.ch/The Specials - 1979 - Specials [FLAC]	02 - Do the Dog.flac	-6.470001	0.965179
redacted.ch/The Specials - 1979 - Specials [FLAC]	03 - It's Up to You.flac	-4.910004	0.978058
redacted.ch/The Specials - 1979 - Specials [FLAC]	04 - Nite Klub.flac	-6.690002	0.969849
redacted.ch/The Specials - 1979 - Specials [FLAC]	05 - Doesn't Make It Alright.flac	-3.989998	0.959625
redacted.ch/The Specials - 1979 - Specials [FLAC]	06 - Concrete Jungle.flac	-5.820000	0.955872
redacted.ch/The Specials - 1979 - Specials [FLAC]	07 - Too Hot.flac	-3.949997	0.961090
redacted.ch/The Specials - 1979 - Specials [FLAC]	08 - Monkey Man.flac	-4.110001	0.949463
redacted.ch/The Specials - 1979 - Specials [FLAC]	09 - (Dawning of a) New Era.flac	-6.370003	0.960327
redacted.ch/The Specials - 1979 - Specials [FLAC]	10 - Blank Expression.flac	-4.050003	0.971558
redacted.ch/The Specials - 1979 - Specials [FLAC]	11 - Stupid Marriage.flac	-5.820000	0.972900
redacted.ch/The Specials - 1979 - Specials [FLAC]	12 - Too Much Too Young.flac	-4.739998	0.947266
redacted.ch/The Specials - 1979 - Specials [FLAC]	13 - Little Bitch.flac	-5.959999	0.963562
redacted.ch/The Specials - 1979 - Specials [FLAC]	14 - You're Wondering Now.flac	-2.529999	0.971863
redacted.ch/The Suicide Machines - 1996 - Destruction by Definition [FLAC]	01 - New Girl.flac	-10.199997	1.000000
redacted.ch/The Suicide Machines - 1996 - Destruction by Definition [FLAC]	02 - SOS.flac	-10.190002	1.000000
redacted.ch/The Suicide Machines - 1996 - Destruction by Definition [FLAC]	03 - Break The Glass.flac	-11.000000	1.000000
redacted.ch/The Suicide Machines - 1996 - Destruction by Definition [FLAC]	04 - No Face.flac	-8.669998	1.000000
redacted.ch/The Suicide Machines - 1996 - Destruction by Definition [FLAC]	05 - Hey.flac	-10.029999	1.000000
redacted.ch/The Suicide Machines - 1996 - Destruction by Definition [FLAC]	06 - Our Time.flac	-10.910004	1.000000
redacted.ch/The Suicide Machines - 1996 - Destruction by Definition [FLAC]	07 - Too Much.flac	-10.699997	1.000000
redacted.ch/The Suicide Machines - 1996 - Destruction by Definition [FLAC]	08 - Islands.flac	-10.790001	1.000000
redacted.ch/The Suicide Machines - 1996 - Destruction by Definition [FLAC]	09 - The Real You.flac	-11.120003	1.000000
redacted.ch/The Suicide Machines - 1996 - Destruction by Definition [FLAC]	10 - Face Values.flac	-10.590004	1.000000
redacted.ch/The Suicide Machines - 1996 - Destruction by Definition [FLAC]	11 - Punk Out.flac	-10.930000	1.000000
redacted.ch/The Suicide Machines - 1996 - Destruction by Definition [FLAC]	12 - Vans Song.flac	-9.500000	1.000000
redacted.ch/The Suicide Machines - 1996 - Destruction by Definition [FLAC]	13 - Insecurities.flac	-10.250000	1.000000
redacted.ch/The Suicide Machines - 1996 - Destruction by Definition [FLAC]	14 - Inside,Outside.flac	-10.779999	1.000000
redacted.ch/The Suicide Machines - 1996 - Destruction by Definition [FLAC]	15 - Zero.flac	-10.320000	1.000000
redacted.ch/The Suicide Machines - 1996 - Destruction by Definition [FLAC]	16 - So Long.flac	-10.370003	1.000000
redacted.ch/The Suicide Machines - War Profiteering is Killing Us All (2005) [FLAC]	01 - War Profiteering Is Killing Us All.flac	-12.610001	0.999725
redacted.ch/The Suicide Machines - War Profiteering is Killing Us All (2005) [FLAC]	02 - Capitalist Suicide.flac	-11.779999	1.000000
redacted.ch/The Suicide Machines - War Profiteering is Killing Us All (2005) [FLAC]	03 - Ghost On Sunset Strip.flac	-10.519997	0.988556
redacted.ch/The Suicide Machines - War Profiteering is Killing Us All (2005) [FLAC]	04 - Junk.flac	-12.029999	0.999725
redacted.ch/The Suicide Machines - War Profiteering is Killing Us All (2005) [FLAC]	05 - 17% 18 - 25.flac	-12.389999	1.000000
redacted.ch/The Suicide Machines - War Profiteering is Killing Us All (2005) [FLAC]	06 - Capsule (AKA Requiem For The Stupid Human Race).flac	-11.340004	0.944550
redacted.ch/The Suicide Machines - War Profiteering is Killing Us All (2005) [FLAC]	07 - All Systems Fail.flac	-10.840004	0.988556
redacted.ch/The Suicide Machines - War Profiteering is Killing Us All (2005) [FLAC]	08 - Red Flag.flac	-11.910004	1.000000
redacted.ch/The Suicide Machines - War Profiteering is Killing Us All (2005) [FLAC]	09 - Nuclear Generators.flac	-12.040001	0.999725
redacted.ch/The Suicide Machines - War Profiteering is Killing Us All (2005) [FLAC]	10 - Bottomed Out.flac	-11.820000	0.999725
redacted.ch/The Suicide Machines - War Profiteering is Killing Us All (2005) [FLAC]	11 - Rebellion Is On The Clearance Rack (And I Think I Like It).flac	-11.970001	0.999725
redacted.ch/The Suicide Machines - War Profiteering is Killing Us All (2005) [FLAC]	12 - Hands Tied.flac	-10.830002	0.999725
redacted.ch/The Suicide Machines - War Profiteering is Killing Us All (2005) [FLAC]	13 - I Went On Tour For Ten Years... And All I Got Was This Lousy T-Shirt.flac	-10.059998	0.999725
redacted.ch/The Suicide Machines - War Profiteering is Killing Us All (2005) [FLAC]	14 - 95% Of The World Is Third World.flac	-9.440002	0.988556
redacted.ch/Time Bomb	01 - Time Bomb.flac	-8.070000	0.988678
redacted.ch/Time Bomb	02 - Turn Around.flac	-6.669998	0.988678
redacted.ch/Time Bomb	03 - Let Me Inside.flac	-6.980003	0.988678
redacted.ch/Time Bomb	04 - Dream.flac	-5.730003	0.988678
redacted.ch/Time Bomb	05 - You Don't Know (ft. Tunji).flac	-6.610001	0.988678
redacted.ch/Time Bomb	06 - Get Back Me.flac	-7.790001	0.988678
redacted.ch/Time Bomb	07 - Coming Your Way.flac	-8.430000	0.988678
redacted.ch/Time Bomb	08 - Wait and See.flac	-6.320000	0.988678
redacted.ch/Time Bomb	09 - Changed My Mind.flac	-5.980003	0.988678
redacted.ch/Time Bomb	10 - Love／Hate.flac	-5.419998	0.988678
redacted.ch/Time Bomb	11 - All in You.flac	-6.559998	0.988678
redacted.ch/Time Bomb	12 - Falling.flac	-4.669998	0.988678
redacted.ch/Time Bomb	13 - The End.flac	-6.320000	0.988678
redacted.ch/Tokyo Ska Paradise Orchestra {1990} Skapara Toujou [FLAC]	01 - Strange Bird.flac	-5.510002	1.000000
redacted.ch/Tokyo Ska Paradise Orchestra {1990} Skapara Toujou [FLAC]	02 - Vampire.flac	-4.860001	1.000000
redacted.ch/Tokyo Ska Paradise Orchestra {1990} Skapara Toujou [FLAC]	03 - Monster Rock.flac	-5.080002	1.000000
redacted.ch/Tokyo Ska Paradise Orchestra {1990} Skapara Toujou [FLAC]	04 - Kozou No Kousin.flac	-5.150002	1.000000
redacted.ch/Tokyo Ska Paradise Orchestra {1990} Skapara Toujou [FLAC]	05 - Uuhan No Onna.flac	-5.320000	1.000000
redacted.ch/Tokyo Ska Paradise Orchestra {1990} Skapara Toujou [FLAC]	06 - Tin Tin Deo.flac	-5.690002	1.000000
redacted.ch/Tokyo Ska Paradise Orchestra {1990} Skapara Toujou [FLAC]	07 - Getsumen Butou.flac	-3.570000	0.999969
redacted.ch/Tokyo Ska Paradise Orchestra {1990} Skapara Toujou [FLAC]	08 - Nigai Namida.flac	-5.050003	1.000000
redacted.ch/Tokyo Ska Paradise Orchestra {1990} Skapara Toujou [FLAC]	09 - Inishie No Hana.flac	-3.970001	1.000000
redacted.ch/Tokyo Ska Paradise Orchestra {1990} Skapara Toujou [FLAC]	10 - Golden Tiger.flac	-5.050003	1.000000
redacted.ch/Tokyo Ska Paradise Orchestra {1990} Skapara Toujou [FLAC]	11 - Hit the Road Jack.flac	-4.669998	1.000000
redacted.ch/Tokyo Ska Paradise Orchestra {1990} Skapara Toujou [FLAC]	12 - Dokidoki Time.flac	-5.750000	1.000000
redacted.ch/Tokyo Ska Paradise Orchestra {1990} Skapara Toujou [FLAC]	13 - Kimi to Boku.flac	-1.830002	0.488037
redacted.ch/Tokyo Ska Paradise Orchestra - Perfect Future	01 Perfect Future.flac	-9.370003	0.992096
redacted.ch/Tokyo Ska Paradise Orchestra - Perfect Future	02 女神の願い.flac	-10.129997	0.995544
redacted.ch/Tokyo Ska Paradise Orchestra - Perfect Future	03 Punch'n' Sway.flac	-9.790001	0.992096
redacted.ch/Tokyo Ska Paradise Orchestra - Perfect Future	04 Me & My Skyline.flac	-10.029999	0.992126
redacted.ch/Tokyo Ska Paradise Orchestra - Perfect Future	05 964スピードスター.flac	-11.080002	0.992096
redacted.ch/Tokyo Ska Paradise Orchestra - Perfect Future	06 Warrior Chant.flac	-8.870003	0.992096
redacted.ch/Tokyo Ska Paradise Orchestra - Perfect Future	07 Last Temptation.flac	-8.349998	0.992096
redacted.ch/Tokyo Ska Paradise Orchestra - Perfect Future	08 Latin Scorcher.flac	-8.970001	0.992096
redacted.ch/Tokyo Ska Paradise Orchestra - Perfect Future	09 A Song for Athletes.flac	-10.070000	0.992065
redacted.ch/Tokyo Ska Paradise Orchestra - Perfect Future	10 All About My Monster.flac	-9.849998	0.992126
redacted.ch/Tokyo Ska Paradise Orchestra - Perfect Future	11 Pride of Lions.flac	-10.330002	0.992096
redacted.ch/Tokyo Ska Paradise Orchestra - Perfect Future	12 Transit Passenger.flac	-9.360001	0.992126
redacted.ch/Tokyo Ska Paradise Orchestra - Perfect Future	13 Walking Angel.flac	-8.459999	0.992401
redacted.ch/Tool (1996) - Ænima [FLAC]	01 - Stinkfist.flac	-8.440002	0.994446
redacted.ch/Tool (1996) - Ænima [FLAC]	02 - Eulogy.flac	-7.809998	0.994446
redacted.ch/Tool (1996) - Ænima [FLAC]	03 - H..flac	-7.090004	0.994446
redacted.ch/Tool (1996) - Ænima [FLAC]	04 - Useful Idiot.flac	5.279999	0.742706
redacted.ch/Tool (1996) - Ænima [FLAC]	05 - Forty Six & 2.flac	-7.709999	0.994446
redacted.ch/Tool (1996) - Ænima [FLAC]	06 - Message To Harry Manback.flac	9.610001	0.292236
redacted.ch/Tool (1996) - Ænima [FLAC]	07 - Hooker With A Penis.flac	-7.559998	0.979980
redacted.ch/Tool (1996) - Ænima [FLAC]	08 - Intermission.flac	7.160000	0.265686
redacted.ch/Tool (1996) - Ænima [FLAC]	09 - Jimmy.flac	-7.349998	0.994446
redacted.ch/Tool (1996) - Ænima [FLAC]	10 - Die Eier Von Satan.flac	-5.459999	0.794342
redacted.ch/Tool (1996) - Ænima [FLAC]	11 - Pushit.flac	-7.889999	0.994446
redacted.ch/Tool (1996) - Ænima [FLAC]	12 - Cesaro Summability.flac	-2.180000	0.960724
redacted.ch/Tool (1996) - Ænima [FLAC]	13 - Ænema.flac	-7.800003	0.994446
redacted.ch/Tool (1996) - Ænima [FLAC]	14 - (-) Ions.flac	0.550003	0.953156
redacted.ch/Tool (1996) - Ænima [FLAC]	15 - Third Eye.flac	-7.470001	0.994446
redacted.ch/Tool (2001) - Lateralus [FLAC]	01 - The Grudge.flac	-7.830002	0.999969
redacted.ch/Tool (2001) - Lateralus [FLAC]	02 - Eon Blue Apocalypse.flac	6.250000	0.423431
redacted.ch/Tool (2001) - Lateralus [FLAC]	03 - The Patient.flac	-7.570000	0.988678
redacted.ch/Tool (2001) - Lateralus [FLAC]	04 - Mantra.flac	6.750000	0.370941
redacted.ch/Tool (2001) - Lateralus [FLAC]	05 - Schism.flac	-6.459999	0.988708
redacted.ch/Tool (2001) - Lateralus [FLAC]	06 - Parabol.flac	6.970001	0.619690
redacted.ch/Tool (2001) - Lateralus [FLAC]	07 - Parabola.flac	-7.090004	0.988770
redacted.ch/Tool (2001) - Lateralus [FLAC]	08 - Ticks & Leeches.flac	-7.080002	0.988678
redacted.ch/Tool (2001) - Lateralus [FLAC]	09 - Lateralus.flac	-8.500000	0.988678
redacted.ch/Tool (2001) - Lateralus [FLAC]	10 - Disposition.flac	2.750000	0.748474
redacted.ch/Tool (2001) - Lateralus [FLAC]	11 - Reflection.flac	-5.889999	0.988647
redacted.ch/Tool (2001) - Lateralus [FLAC]	12 - Triad.flac	-6.699997	0.988770
redacted.ch/Tool (2001) - Lateralus [FLAC]	13 - Faaip De Oiad.flac	-5.209999	1.000000
redacted.ch/Transplants - Haunted Cities	01 - Not Today (feat. Sen Dog).flac	-10.680000	0.988556
redacted.ch/Transplants - Haunted Cities	02 - Apocalypse Now.flac	-9.910004	0.988556
redacted.ch/Transplants - Haunted Cities	03 - Gangsters and Thugs.flac	-9.040001	0.988586
redacted.ch/Transplants - Haunted Cities	04 - What I Can't Describe (feat. Boo-Yaa TRIBE).flac	-8.610001	0.989166
redacted.ch/Transplants - Haunted Cities	05 - Doomsday.flac	-10.000000	0.990448
redacted.ch/Transplants - Haunted Cities	06 - Killafornia (feat. B.Real).flac	-7.959999	0.988556
redacted.ch/Transplants - Haunted Cities	07 - American Guns.flac	-9.340004	0.988556
redacted.ch/Transplants - Haunted Cities	08 - Madness.flac	-10.139999	0.988556
redacted.ch/Transplants - Haunted Cities	09 - Hit the Fence.flac	-7.690002	0.988556
redacted.ch/Transplants - Haunted Cities	10 - Pay Any Price.flac	-9.559998	0.988953
redacted.ch/Transplants - Haunted Cities	11 - I Want It All.flac	-9.400002	0.988556
redacted.ch/Transplants - Haunted Cities	12 - Crash and Burn (feat. Rakaa).flac	-8.760002	0.988831
redacted.ch/Transplants - Transplants (Flac)	01 - Transplants - Romper Stomper.flac	-12.150002	1.000000
redacted.ch/Transplants - Transplants (Flac)	02 - Transplants - Tall Cans In The Air.flac	-11.550003	0.988708
redacted.ch/Transplants - Transplants (Flac)	03 - Transplants - D.J. D.J..flac	-9.750000	1.000000
redacted.ch/Transplants - Transplants (Flac)	04 - Transplants - Diamonds And Guns.flac	-10.300003	0.988739
redacted.ch/Transplants - Transplants (Flac)	05 - Transplants - Quick Death.flac	-11.160004	0.988739
redacted.ch/Transplants - Transplants (Flac)	06 - Transplants - Sad But True.flac	-10.500000	0.988739
redacted.ch/Transplants - Transplants (Flac)	07 - Transplants - Weigh On My Mind.flac	-8.660004	0.988739
redacted.ch/Transplants - Transplants (Flac)	08 - Transplants - One Seventeen.flac	-10.430000	0.988739
redacted.ch/Transplants - Transplants (Flac)	09 - Transplants - California Babylon.flac	-9.180000	0.988739
redacted.ch/Transplants - Transplants (Flac)	10 - Transplants - We Trusted You.flac	-9.669998	0.988739
redacted.ch/Transplants - Transplants (Flac)	11 - Transplants - D.R.E.A.M..flac	-9.080002	1.000000
redacted.ch/Transplants - Transplants (Flac)	12 - Transplants - Down In Oakland.flac	-9.019997	0.988739
redacted.ch/Two Door Cinema Club - 2010 - Tourist History [FLAC]	01 - Cigarettes In The Theatre.flac	-10.989998	1.000000
redacted.ch/Two Door Cinema Club - 2010 - Tourist History [FLAC]	02 - Come Back Home.flac	-10.889999	1.000000
redacted.ch/Two Door Cinema Club - 2010 - Tourist History [FLAC]	03 - Do You Want It All.flac	-10.599998	1.000000
redacted.ch/Two Door Cinema Club - 2010 - Tourist History [FLAC]	04 - This Is The Life.flac	-9.930000	1.000000
redacted.ch/Two Door Cinema Club - 2010 - Tourist History [FLAC]	05 - Something Good Can Work.flac	-9.769997	1.000000
redacted.ch/Two Door Cinema Club - 2010 - Tourist History [FLAC]	06 - I Can Talk.flac	-9.510002	1.000000
redacted.ch/Two Door Cinema Club - 2010 - Tourist History [FLAC]	07 - Undercover Martyn.flac	-10.050003	1.000000
redacted.ch/Two Door Cinema Club - 2010 - Tourist History [FLAC]	08 - What You Know.flac	-9.599998	1.000000
redacted.ch/Two Door Cinema Club - 2010 - Tourist History [FLAC]	09 - Eat That Up, It's Good For You.flac	-10.989998	1.000000
redacted.ch/Two Door Cinema Club - 2010 - Tourist History [FLAC]	10 - You're Not Stubborn.flac	-10.620003	1.000000
redacted.ch/Useless ID - 2001 - Bad Story, Happy Ending	01 - At the Stadium.flac	-10.180000	0.988556
redacted.ch/Useless ID - 2001 - Bad Story, Happy Ending	02 - Another Bad Taste.flac	-8.500000	0.988495
redacted.ch/Useless ID - 2001 - Bad Story, Happy Ending	03 - No Time for Me to Be a Teenager.flac	-8.330002	0.988525
redacted.ch/Useless ID - 2001 - Bad Story, Happy Ending	04 - Presents.flac	-8.059998	0.988525
redacted.ch/Useless ID - 2001 - Bad Story, Happy Ending	05 - Just Friends.flac	-8.750000	0.988556
redacted.ch/Useless ID - 2001 - Bad Story, Happy Ending	06 - Oh, My Guard.flac	-9.279999	0.988556
redacted.ch/Useless ID - 2001 - Bad Story, Happy Ending	07 - Day By Day.flac	-9.059998	0.988525
redacted.ch/Useless ID - 2001 - Bad Story, Happy Ending	08 - Nothing Logical In This Lifetime.flac	-8.239998	0.988525
redacted.ch/Useless ID - 2001 - Bad Story, Happy Ending	09 - Out of Tune.flac	-8.220001	0.988525
redacted.ch/Useless ID - 2001 - Bad Story, Happy Ending	10 - Note.flac	-8.059998	0.988312
redacted.ch/Useless ID - 2001 - Bad Story, Happy Ending	11 - Far from Distance.flac	-8.419998	0.988495
redacted.ch/Useless ID - 2001 - Bad Story, Happy Ending	12 - Operation New Years.flac	-8.709999	0.988525
redacted.ch/Useless ID - 2001 - Bad Story, Happy Ending	13 - Working Jerk.flac	-8.610001	0.988495
redacted.ch/Useless ID - 2001 - Bad Story, Happy Ending	14 - Wake Up Call.flac	-7.930000	0.988495
redacted.ch/Useless ID - 2001 - Bad Story, Happy Ending	15 - A Year to Forget.flac	-7.650002	0.988525
redacted.ch/VA - Jazz from the USSR (1987) [FLAC] (MFSL)	01 - Oleg Lundstrum Orchestra - Jive.flac	-6.269997	1.000000
redacted.ch/VA - Jazz from the USSR (1987) [FLAC] (MFSL)	02 - David Azarian Trio - My Favorite Things.flac	-1.290001	1.000000
redacted.ch/VA - Jazz from the USSR (1987) [FLAC] (MFSL)	03 - Retro Quartet - Sweet Sue, Just You.flac	-1.639999	0.972992
redacted.ch/VA - Jazz from the USSR (1987) [FLAC] (MFSL)	04 - Otar Magradze, Otar Sagaelidze - Tenderly.flac	1.630001	0.673798
redacted.ch/VA - Jazz from the USSR (1987) [FLAC] (MFSL)	05 - Rautio Musical College - Fascinating Rhythm.flac	-1.809998	0.976776
redacted.ch/VA - Jazz from the USSR (1987) [FLAC] (MFSL)	06 - Igor Butman Ensemble - Summer of '42.flac	-1.660004	0.877747
redacted.ch/VA - Jazz from the USSR (1987) [FLAC] (MFSL)	07 - Vladimir Voronetsky, Bladimir Gabai - Kusya.flac	7.459999	0.514221
redacted.ch/VA - Jazz from the USSR (1987) [FLAC] (MFSL)	08 - Allegro Jazz Ensemble - Song of Fading Flowers.flac	8.029999	0.459381
redacted.ch/VA - Jazz from the USSR (1987) [FLAC] (MFSL)	09 - Valery Mysovsky - Red Roses for a Blue Lady.flac	-1.070000	0.964752
redacted.ch/VA - Jazz from the USSR (1987) [FLAC] (MFSL)	10 - Nikolai Levinovsky - A Trip With Pleasant Company.flac	-4.959999	0.983063
redacted.ch/VA - Jazz from the USSR (1987) [FLAC] (MFSL)	11 - Leonid Chizhik - Sentimental Elegy.flac	-0.570000	0.926178
redacted.ch/Various Artists - 2006 - Forever Free- A Sublime Tribute Album {FLAC}	01 - No Use For A Name - Badfish.flac	-10.650002	0.999512
redacted.ch/Various Artists - 2006 - Forever Free- A Sublime Tribute Album {FLAC}	02 - Never Heard Of It - Same in the End.flac	-10.830002	1.000000
redacted.ch/Various Artists - 2006 - Forever Free- A Sublime Tribute Album {FLAC}	03 - Voodoo Glow Skulls - Caress Me Down.flac	-11.190002	1.000000
redacted.ch/Various Artists - 2006 - Forever Free- A Sublime Tribute Album {FLAC}	04 - UP SyNDROME - Doin' Time.flac	-11.419998	0.999481
redacted.ch/Various Artists - 2006 - Forever Free- A Sublime Tribute Album {FLAC}	05 - Guttermouth - April 29 1992.flac	-8.989998	0.999451
redacted.ch/Various Artists - 2006 - Forever Free- A Sublime Tribute Album {FLAC}	06 - If All Else Fails w, Max Gingold - Wrong Way.flac	-9.400002	0.999420
redacted.ch/Various Artists - 2006 - Forever Free- A Sublime Tribute Album {FLAC}	07 - The Toast - Pawn Shop.flac	-9.889999	0.999603
redacted.ch/Various Artists - 2006 - Forever Free- A Sublime Tribute Album {FLAC}	08 - Ozomatli - Ebin.flac	-9.650002	1.000000
redacted.ch/Various Artists - 2006 - Forever Free- A Sublime Tribute Album {FLAC}	09 - The Forces Of Evil - Ball & Chain.flac	-9.739998	0.999481
redacted.ch/Various Artists - 2006 - Forever Free- A Sublime Tribute Album {FLAC}	10 - The Skeletones - Seed.flac	-10.570000	0.999634
redacted.ch/Various Artists - 2006 - Forever Free- A Sublime Tribute Album {FLAC}	11 - Ballyhoo! - 40 Oz. To Freedom.flac	-10.080002	0.999420
redacted.ch/Various Artists - 2006 - Forever Free- A Sublime Tribute Album {FLAC}	12 - The Line - Pool Shark.flac	-10.570000	0.999756
redacted.ch/Various Artists - 2006 - Forever Free- A Sublime Tribute Album {FLAC}	13 - 1208 - Boss DJ.flac	-10.389999	0.999512
redacted.ch/Various Artists - 2006 - Forever Free- A Sublime Tribute Album {FLAC}	14 - If All Else Fails - Forever Free [Bonus Track].flac	-7.840004	0.999359
redacted.ch/Velcra - Between Force and Fate (2005) [Flac]	01 War Is Peace.flac	-9.820000	0.952362
redacted.ch/Velcra - Between Force and Fate (2005) [Flac]	02 Water Is Getting High.flac	-10.070000	0.989288
redacted.ch/Velcra - Between Force and Fate (2005) [Flac]	03 Our Will Against Their Will.flac	-10.620003	0.989349
redacted.ch/Velcra - Between Force and Fate (2005) [Flac]	04 For My Loneliness I Pay.flac	-11.050003	1.000000
redacted.ch/Velcra - Between Force and Fate (2005) [Flac]	05 Memory Loss.flac	-10.919998	0.989288
redacted.ch/Velcra - Between Force and Fate (2005) [Flac]	06 I Can't Tell The Sun From The Moon.flac	-10.550003	0.989471
redacted.ch/Velcra - Between Force and Fate (2005) [Flac]	07 The Bong Song.flac	-8.970001	1.000000
redacted.ch/Velcra - Between Force and Fate (2005) [Flac]	08 Corruption.flac	-9.919998	1.000000
redacted.ch/Velcra - Between Force and Fate (2005) [Flac]	09 Hotel Alcatraz.flac	-10.059998	0.989258
redacted.ch/Velcra - Between Force and Fate (2005) [Flac]	10 Wonderland Sunrise.flac	-9.110001	0.989288
redacted.ch/Velcra - Consequences of Disobedience (2002) [Flac]	01 My Law.flac	-9.620003	0.977295
redacted.ch/Velcra - Consequences of Disobedience (2002) [Flac]	02 Big Brother.flac	-8.550003	0.977295
redacted.ch/Velcra - Consequences of Disobedience (2002) [Flac]	03 Shine for Me.flac	-9.129997	0.977295
redacted.ch/Velcra - Consequences of Disobedience (2002) [Flac]	04 Not Against Me.flac	-9.269997	0.988556
redacted.ch/Velcra - Consequences of Disobedience (2002) [Flac]	05 Solar Red.flac	-8.459999	0.988586
redacted.ch/Velcra - Consequences of Disobedience (2002) [Flac]	06 Tension.flac	-8.790001	0.988586
redacted.ch/Velcra - Consequences of Disobedience (2002) [Flac]	07 Removed.flac	-8.769997	0.988586
redacted.ch/Velcra - Consequences of Disobedience (2002) [Flac]	08 Can't Stop Fighting.flac	-9.220001	0.988586
redacted.ch/Velcra - Consequences of Disobedience (2002) [Flac]	09 Made to Fail.flac	-9.110001	0.977295
redacted.ch/Velcra - Consequences of Disobedience (2002) [Flac]	10 Test Animals.flac	-8.760002	0.977295
redacted.ch/Walk Among Us	01 - 20 Eyes.flac	-2.989998	0.709503
redacted.ch/Walk Among Us	02 - I Turned Into A Martian.flac	-3.760002	0.902313
redacted.ch/Walk Among Us	03 - All Hell Breaks Loose.flac	-2.980003	0.716888
redacted.ch/Walk Among Us	04 - Vampira.flac	-3.230003	0.814484
redacted.ch/Walk Among Us	05 - Nike A Go Go.flac	-3.709999	0.824677
redacted.ch/Walk Among Us	06 - Hatebreeders.flac	-3.580002	0.802246
redacted.ch/Walk Among Us	07 - Mommy Can I Go Out & Kill Tonight (Live).flac	-2.370003	0.729340
redacted.ch/Walk Among Us	08 - Night Of The Living Dead.flac	-3.419998	0.814514
redacted.ch/Walk Among Us	09 - Skulls.flac	-3.440002	0.734497
redacted.ch/Walk Among Us	10 - Violent World.flac	-2.949997	0.752289
redacted.ch/Walk Among Us	11 - Devils Whorehouse.flac	-3.120003	0.926392
redacted.ch/Walk Among Us	12 - Astro Zombies.flac	-3.410004	0.807068
redacted.ch/Walk Among Us	13 - Braineaters.flac	-3.760002	0.930878
redacted.ch/White Lies - 2011 - Ritual [FLAC]	01 - Is Love.flac	-8.349998	0.980682
redacted.ch/White Lies - 2011 - Ritual [FLAC]	02 - Strangers.flac	-8.660004	0.980682
redacted.ch/White Lies - 2011 - Ritual [FLAC]	03 - Bigger Than Us.flac	-9.650002	0.980682
redacted.ch/White Lies - 2011 - Ritual [FLAC]	04 - Peace & Quiet.flac	-8.680000	0.980682
redacted.ch/White Lies - 2011 - Ritual [FLAC]	05 - Streetlights.flac	-8.559998	0.980682
redacted.ch/White Lies - 2011 - Ritual [FLAC]	06 - Holy Ghost.flac	-8.279999	0.980682
redacted.ch/White Lies - 2011 - Ritual [FLAC]	07 - Turn The Bells.flac	-8.730003	0.980682
redacted.ch/White Lies - 2011 - Ritual [FLAC]	08 - The Power & The Glory.flac	-6.260002	0.980682
redacted.ch/White Lies - 2011 - Ritual [FLAC]	09 - Bad Love.flac	-8.650002	0.980682
redacted.ch/White Lies - 2011 - Ritual [FLAC]	10 - Come Down.flac	-7.059998	0.980682
redacted.ch/White Lies - To Lose My Life	01 - Death.flac	-10.669998	0.999695
redacted.ch/White Lies - To Lose My Life	02 - To Lose My Life.flac	-10.800003	0.999634
redacted.ch/White Lies - To Lose My Life	03 - A Place To Hide.flac	-10.290001	0.999664
redacted.ch/White Lies - To Lose My Life	04 - Fifty On Our Foreheads.flac	-9.230003	0.960632
redacted.ch/White Lies - To Lose My Life	05 - Unfinished Business.flac	-9.599998	0.984314
redacted.ch/White Lies - To Lose My Life	06 - E . S . T ..flac	-9.550003	0.999634
redacted.ch/White Lies - To Lose My Life	07 - From The Stars.flac	-10.290001	0.999664
redacted.ch/White Lies - To Lose My Life	08 - Farewell To The Fairground.flac	-9.949997	0.998108
redacted.ch/White Lies - To Lose My Life	09 - Nothing To Give.flac	-9.959999	0.999634
redacted.ch/White Lies - To Lose My Life	10 - The Price Of Love.flac	-9.449997	0.999695
redacted.ch/White Zombie - La Sexorcisto; Devil Music Vol. 1	01 - Welcome To Planet Motherfucker,Psychoholic Slag.flac	-2.650002	1.000000
redacted.ch/White Zombie - La Sexorcisto; Devil Music Vol. 1	02 - Knuckle Duster (Radio 1-A).flac	7.770000	0.218658
redacted.ch/White Zombie - La Sexorcisto; Devil Music Vol. 1	03 - Thunder Kiss '65.flac	-4.709999	1.000000
redacted.ch/White Zombie - La Sexorcisto; Devil Music Vol. 1	04 - Black Sunshine.flac	-3.809998	1.000000
redacted.ch/White Zombie - La Sexorcisto; Devil Music Vol. 1	05 - Soul-Crusher.flac	-3.900002	1.000000
redacted.ch/White Zombie - La Sexorcisto; Devil Music Vol. 1	06 - Cosmic Monsters Inc..flac	-2.699997	1.000000
redacted.ch/White Zombie - La Sexorcisto; Devil Music Vol. 1	07 - Spiderbaby (Yeah-Yeah-Yeah).flac	-3.070000	1.000000
redacted.ch/White Zombie - La Sexorcisto; Devil Music Vol. 1	08 - I Am Legend.flac	-4.000000	0.977234
redacted.ch/White Zombie - La Sexorcisto; Devil Music Vol. 1	09 - Knuckle Duster (Radio 2-B).flac	10.650002	0.132416
redacted.ch/White Zombie - La Sexorcisto; Devil Music Vol. 1	10 - Thrust!.flac	-3.279999	0.977234
redacted.ch/White Zombie - La Sexorcisto; Devil Music Vol. 1	11 - One Big Crunch.flac	7.689999	0.515869
redacted.ch/White Zombie - La Sexorcisto; Devil Music Vol. 1	12 - Grindhouse (A Go-Go).flac	-3.290001	0.977234
redacted.ch/White Zombie - La Sexorcisto; Devil Music Vol. 1	13 - Starface.flac	-3.809998	0.977234
redacted.ch/White Zombie - La Sexorcisto; Devil Music Vol. 1	14 - Warp Asylum.flac	-2.639999	0.977234
redacted.ch/WWIII	01 - WWIII.flac	-8.739998	0.987518
redacted.ch/WWIII	02 - From Here On Out.flac	-8.750000	0.999969
redacted.ch/WWIII	03 - Blackball.flac	-7.680000	0.987518
redacted.ch/WWIII	04 - Jihad.flac	-7.540001	0.999969
redacted.ch/WWIII	05 - Last Things.flac	-8.900002	0.987518
redacted.ch/WWIII	06 - Pitty For The Pious.flac	-9.620003	0.999969
redacted.ch/WWIII	07 - Stars And Stripes.flac	-7.440002	0.999969
redacted.ch/WWIII	08 - Bullets,Bombs & Bigotry.flac	-8.029999	0.999969
redacted.ch/WWIII	09 - Moron.flac	-7.590004	0.999969
redacted.ch/WWIII	10 - Revenge.flac	-7.889999	0.998962
redacted.ch/WWIII	11 - Intro.flac	-8.400002	0.998932
redacted.ch/Yanka - Sold! (1989) FLAC	Yanka - 01 - For the darkest day.flac	-6.870003	0.794464
redacted.ch/Yanka - Sold! (1989) FLAC	Yanka - 02 - We are knee deep.flac	-4.769997	0.794250
redacted.ch/Yanka - Sold! (1989) FLAC	Yanka - 03 - Decorations.flac	-6.199997	0.794342
redacted.ch/Yanka - Sold! (1989) FLAC	Yanka - 04 - Special reason.flac	-3.860001	0.794403
redacted.ch/Yanka - Sold! (1989) FLAC	Yanka - 05 - Half a kingdom.flac	-0.629997	0.748962
redacted.ch/Yanka - Sold! (1989) FLAC	Yanka - 06 - Watch out!.flac	-2.239998	0.794189
redacted.ch/Yanka - Sold! (1989) FLAC	Yanka - 07 - Bear goes hunting.flac	-5.660004	0.794006
redacted.ch/Yanka - Sold! (1989) FLAC	Yanka - 08 - My grief is light.flac	-2.379997	0.891205
redacted.ch/Yanka - Sold! (1989) FLAC	Yanka - 09 - I turn to a bitch.flac	-5.190002	0.891205
redacted.ch/Yanka - Sold! (1989) FLAC	Yanka - 10 - Riga.flac	-4.330002	0.891235
redacted.ch/Yanka - Sold! (1989) FLAC	Yanka - 11 - Because of big smarts.flac	-4.680000	0.891235
redacted.ch/Yanka - Sold! (1989) FLAC	Yanka - 12 - Along the rail tracks.flac	-3.590004	0.891235
redacted.ch/Yanka - Sold! (1989) FLAC	Yanka - 13 - Reggae.flac	-3.440002	0.891235
redacted.ch/Yanka - Sold! (1989) FLAC	Yanka - 14 - Flocks are flying.flac	1.169998	0.891235
redacted.ch/Yanka - Sold! (1989) FLAC	Yanka - 15 - Burn baby burn!.flac	-3.860001	0.891235
redacted.ch/Yanka - Sold! (1989) FLAC	Yanka - 16 - Go home.flac	-5.459999	0.891235
redacted.ch/Yanka - Sold! (1989) FLAC	Yanka - 17 - With Cross and zero.flac	-5.629997	0.891205
redacted.ch/Yanka - Sold! (1989) FLAC	Yanka - 18 - Sold.flac	-5.000000	0.891235
redacted.ch/Yanka - Sold! (1989) FLAC	Yanka - 19 - Outcasts.flac	-6.840004	0.891235
redacted.ch/Youngblood Brass Band - 2006 - Is That A Riot [FLAC]	01 - March.flac	-9.160004	0.988678
redacted.ch/Youngblood Brass Band - 2006 - Is That A Riot [FLAC]	02 - Nuclear Summer.flac	-11.510002	0.988708
redacted.ch/Youngblood Brass Band - 2006 - Is That A Riot [FLAC]	03 - Waiver.flac	-7.400002	0.988617
redacted.ch/Youngblood Brass Band - 2006 - Is That A Riot [FLAC]	04 - But You Can't Run.flac	-8.959999	0.998993
redacted.ch/Youngblood Brass Band - 2006 - Is That A Riot [FLAC]	05 - Pala Minima.flac	-8.070000	0.965088
redacted.ch/Youngblood Brass Band - 2006 - Is That A Riot [FLAC]	06 - JEM.flac	-6.000000	0.988647
redacted.ch/Youngblood Brass Band - 2006 - Is That A Riot [FLAC]	07 - Dead Man Stomping.flac	-8.790001	0.988678
redacted.ch/Youngblood Brass Band - 2006 - Is That A Riot [FLAC]	08 - Ake.flac	0.980000	0.988617
redacted.ch/Youngblood Brass Band - 2006 - Is That A Riot [FLAC]	09 - Is That A Riot.flac	-8.599998	0.988678
redacted.ch/Youngblood Brass Band - 2006 - Is That A Riot [FLAC]	10 - Bone Refinery.flac	-3.489998	0.988708
redacted.ch/Youngblood Brass Band - 2006 - Is That A Riot [FLAC]	11 - Sell Me More Or Like You Just Don't Care.flac	-8.209999	0.983368
redacted.ch/Youngblood Brass Band - 2006 - Is That A Riot [FLAC]	12 - Will.flac	6.639999	0.796967
redacted.ch/Youngblood Brass Band - 2006 - Is That A Riot [FLAC]	13 - Thanks.flac	-8.750000	0.988678
redacted.ch/ZZ Top - Eliminator (1983)  [FLAC]	01 - Gimme All Your Lovin'.flac	-7.040001	0.993835
redacted.ch/ZZ Top - Eliminator (1983)  [FLAC]	02 - Got Me Under Pressure.flac	-7.389999	0.996460
redacted.ch/ZZ Top - Eliminator (1983)  [FLAC]	03 - Sharp Dressed Man.flac	-7.389999	0.998352
redacted.ch/ZZ Top - Eliminator (1983)  [FLAC]	04 - I Need You Tonight.flac	-5.559998	0.993896
redacted.ch/ZZ Top - Eliminator (1983)  [FLAC]	05 - I Got the Six.flac	-6.870003	0.989136
redacted.ch/ZZ Top - Eliminator (1983)  [FLAC]	06 - Legs.flac	-7.500000	0.964996
redacted.ch/ZZ Top - Eliminator (1983)  [FLAC]	07 - Thug.flac	-5.459999	0.996246
redacted.ch/ZZ Top - Eliminator (1983)  [FLAC]	08 - TV Dinners.flac	-5.930000	0.997375
redacted.ch/ZZ Top - Eliminator (1983)  [FLAC]	09 - Dirty Dog.flac	-5.930000	0.997772
redacted.ch/ZZ Top - Eliminator (1983)  [FLAC]	10 - If I Could Only Flag Her Down.flac	-4.760002	0.997620
redacted.ch/ZZ Top - Eliminator (1983)  [FLAC]	11 - Bad Girl.flac	-6.730003	0.996490
redacted.ch/ZZ Top - Tres Hombres [FLAC]	01 - Waitin' for the Bus.flac	-1.849998	0.955017
redacted.ch/ZZ Top - Tres Hombres [FLAC]	02 - Jesus Just Left Chicago.flac	-2.080002	0.954987
redacted.ch/ZZ Top - Tres Hombres [FLAC]	03 - Beer Drinkers & Hell Raisers.flac	-1.959999	0.954987
redacted.ch/ZZ Top - Tres Hombres [FLAC]	04 - Master of Sparks.flac	-1.489998	0.954407
redacted.ch/ZZ Top - Tres Hombres [FLAC]	05 - Hot, Blue and Righteous.flac	0.029999	0.955017
redacted.ch/ZZ Top - Tres Hombres [FLAC]	06 - Move Me on Down the Line.flac	-2.370003	0.955017
redacted.ch/ZZ Top - Tres Hombres [FLAC]	07 - Precious and Grace.flac	-2.150002	0.954437
redacted.ch/ZZ Top - Tres Hombres [FLAC]	08 - La Grange.flac	-1.529999	0.954987
redacted.ch/ZZ Top - Tres Hombres [FLAC]	09 - Shiek.flac	-1.459999	0.954926
redacted.ch/ZZ Top - Tres Hombres [FLAC]	10 - Have You Heard .flac	-2.360001	0.955017
redacted.ch/Король и шут - 2001 - Герои и Злодеи [FLAC]	01 Дед на свадьбе.flac	-5.720001	0.995605
redacted.ch/Король и шут - 2001 - Герои и Злодеи [FLAC]	02 Запрет отца.flac	-4.050003	0.979523
redacted.ch/Король и шут - 2001 - Герои и Злодеи [FLAC]	03 Кузнец.flac	-4.250000	0.978516
redacted.ch/Король и шут - 2001 - Герои и Злодеи [FLAC]	04 Разговор с гоблином.flac	-7.230003	0.986450
redacted.ch/Король и шут - 2001 - Герои и Злодеи [FLAC]	05 Вор, граф и графиня.flac	-5.500000	0.977966
redacted.ch/Король и шут - 2001 - Герои и Злодеи [FLAC]	06 Что видел малыш.flac	-7.010002	0.976257
redacted.ch/Король и шут - 2001 - Герои и Злодеи [FLAC]	07 Невеста палача.flac	-5.099998	0.987610
redacted.ch/Король и шут - 2001 - Герои и Злодеи [FLAC]	08 Мастер приглашает в гости.flac	-4.940002	0.969299
redacted.ch/Король и шут - 2001 - Герои и Злодеи [FLAC]	09 Бродяга и старик.flac	-4.500000	0.986084
redacted.ch/Король и шут - 2001 - Герои и Злодеи [FLAC]	10 Смерть халдея.flac	-5.559998	0.999969
redacted.ch/Король и шут - 2001 - Герои и Злодеи [FLAC]	11 Помнят с горечью древляне.flac	-4.290001	0.967468
redacted.ch/Король и шут - 2001 - Герои и Злодеи [FLAC]	12 Про Ивана.flac	-4.760002	0.982025
redacted.ch/Король и шут - 2001 - Герои и Злодеи [FLAC]	13 Воспоминания о былой любви.flac	-6.239998	0.984680
redacted.ch/Король и шут - 2001 - Герои и Злодеи [FLAC]	14 Разбойники (Live).flac	-9.540001	0.999237
redacted.ch/Король и шут - 2001 - Герои и Злодеи [FLAC]	15 Паника в селе (Live).flac	-8.550003	0.951691
redacted.ch/Король и Шут - Бунт на корабле (2004) FLAC	01 - Хардкор по-русски.flac	-10.379997	0.981750
redacted.ch/Король и Шут - Бунт на корабле (2004) FLAC	02 - Волшебный глаз старика Алонса.flac	-9.889999	0.981750
redacted.ch/Король и Шут - Бунт на корабле (2004) FLAC	03 - Исповедь вампира.flac	-10.059998	0.981750
redacted.ch/Король и Шут - Бунт на корабле (2004) FLAC	04 - Месть Гарри.flac	-9.980003	0.981750
redacted.ch/Король и Шут - Бунт на корабле (2004) FLAC	05 - Северный флот.flac	-9.059998	0.981750
redacted.ch/Король и Шут - Бунт на корабле (2004) FLAC	06 - Идол.flac	-9.510002	0.981750
redacted.ch/Король и Шут - Бунт на корабле (2004) FLAC	07 - Бунт на корабле!.flac	-9.820000	0.981750
redacted.ch/Король и Шут - Бунт на корабле (2004) FLAC	08 - Хороший пират - Мертвый пират.flac	-8.930000	0.981750
redacted.ch/Король и Шут - Бунт на корабле (2004) FLAC	09 - Рыцарь.flac	-9.550003	0.981750
redacted.ch/Король и Шут - Бунт на корабле (2004) FLAC	10 - Звонок.flac	-9.239998	0.981750
redacted.ch/Король и Шут - Бунт на корабле (2004) FLAC	11 - Инквизитор.flac	-9.669998	0.981750
redacted.ch/Король и Шут - Бунт на корабле (2004) FLAC	12 - Задира и солдат.flac	-10.059998	0.981750
redacted.ch/Король и Шут - Бунт на корабле (2004) FLAC	13 - Раненый воин.flac	-9.199997	0.981750
redacted.ch/Король и Шут - Бунт на корабле (2004) FLAC	14 - Муха - маленькая птичка.flac	-5.730003	0.963104
redacted.ch/Король и Шут - Бунт на корабле (2004) FLAC	15 - Хозяин леса.flac	-9.180000	0.981750
redacted.ch/Крупский сотоварищи - Чужие песни и несколько своих (1997, flac)	01. Я остаюсь.flac	-6.410004	0.935242
redacted.ch/Крупский сотоварищи - Чужие песни и несколько своих (1997, flac)	02. Танго.flac	-6.150002	0.934601
redacted.ch/Крупский сотоварищи - Чужие песни и несколько своих (1997, flac)	03. Игрок.flac	-6.300003	0.929901
redacted.ch/Крупский сотоварищи - Чужие песни и несколько своих (1997, flac)	04. Про любовь.flac	-4.440002	0.913971
redacted.ch/Крупский сотоварищи - Чужие песни и несколько своих (1997, flac)	05. Вальс.flac	-5.709999	0.822876
redacted.ch/Крупский сотоварищи - Чужие песни и несколько своих (1997, flac)	06. Dance Me To The End Of Love.flac	-2.879997	0.924622
redacted.ch/Крупский сотоварищи - Чужие песни и несколько своих (1997, flac)	07. Дорожная.flac	-6.730003	0.921936
redacted.ch/Крупский сотоварищи - Чужие песни и несколько своих (1997, flac)	08. Аве Цезарь.flac	-5.639999	0.926422
redacted.ch/Крупский сотоварищи - Чужие песни и несколько своих (1997, flac)	09. Долго будем ожидать.flac	-6.230003	0.927979
redacted.ch/Крупский сотоварищи - Чужие песни и несколько своих (1997, flac)	10. Soli.flac	-6.040001	0.925385
redacted.ch/Крупский сотоварищи - Чужие песни и несколько своих (1997, flac)	11. Пельменная.flac	-4.930000	0.889740
redacted.ch/Последние Танки в Париже - 2084 (2004, flac)	01. Звёзды.flac	-8.919998	0.999176
redacted.ch/Последние Танки в Париже - 2084 (2004, flac)	02. Революция!.flac	-8.769997	0.999176
redacted.ch/Последние Танки в Париже - 2084 (2004, flac)	03. Трава-Любовь.flac	-8.430000	0.999176
redacted.ch/Последние Танки в Париже - 2084 (2004, flac)	04. Новые календари.flac	-7.639999	0.999176
redacted.ch/Последние Танки в Париже - 2084 (2004, flac)	05. Улицы в огне.flac	-8.690002	0.999176
redacted.ch/Последние Танки в Париже - 2084 (2004, flac)	06. Панк-Рок.flac	-7.309998	0.999176
redacted.ch/Последние Танки в Париже - 2084 (2004, flac)	07. Обратный билет.flac	-7.440002	0.999176
redacted.ch/Последние Танки в Париже - 2084 (2004, flac)	08. График.flac	-8.510002	0.999176
redacted.ch/Последние Танки в Париже - 2084 (2004, flac)	09. Игрушки.flac	-7.370003	0.999176
redacted.ch/Последние Танки в Париже - 2084 (2004, flac)	10. x11 сентября.flac	-7.050003	0.999146
redacted.ch/Последние Танки в Париже - 2084 (2004, flac)	11. Винстон.flac	-7.639999	0.999176
redacted.ch/Последние Танки в Париже - 2084 (2004, flac)	12. Королева Гашиша.flac	-8.590004	0.999176
redacted.ch/Последние Танки в Париже - 2084 (2004, flac)	13. Если сейчас начнётся дождь.flac	-8.650002	0.999176
redacted.ch/Последние Танки в Париже - 2084 (2004, flac)	14. Здесь или сейчас.flac	-8.190002	0.999176
redacted.ch/Последние Танки в Париже - 2084 (2004, flac)	15. В руки нож.flac	-7.650002	0.999176
redacted.ch/Последние Танки в Париже - 2084 (2004, flac)	16. Дискотека.flac	-8.260002	0.999176
redacted.ch/Психея - 2004 - Психея (1st Edition) (FLAC)	01 - Поколение Ты.flac	-11.650002	0.999176
redacted.ch/Психея - 2004 - Психея (1st Edition) (FLAC)	02 - Лезвием Сердца.flac	-10.720001	0.999176
redacted.ch/Психея - 2004 - Психея (1st Edition) (FLAC)	03 - Убей Мента.flac	-11.519997	0.999207
redacted.ch/Психея - 2004 - Психея (1st Edition) (FLAC)	04 - От А до Я....flac	-10.639999	0.999176
redacted.ch/Психея - 2004 - Психея (1st Edition) (FLAC)	05 - Люди Врут Тебе, Ты Врёшь Людям, но Ещё Чаще Ты Врёшь Сам Себе.flac	-10.830002	0.999176
redacted.ch/Психея - 2004 - Психея (1st Edition) (FLAC)	06 - Э].flac	-12.090004	0.999176
redacted.ch/Психея - 2004 - Психея (1st Edition) (FLAC)	07 - Рефлекс Хичкока.flac	-11.389999	0.999176
redacted.ch/Психея - 2004 - Психея (1st Edition) (FLAC)	08 - Клон Future.flac	-11.139999	0.999176
redacted.ch/Психея - 2004 - Психея (1st Edition) (FLAC)	09 - Если Ты Меня Слышишь....flac	-11.269997	0.999176
redacted.ch/Психея - 2004 - Психея (1st Edition) (FLAC)	10 - ШШШюю.flac	-10.980003	0.999176
redacted.ch/Психея - 2004 - Психея (1st Edition) (FLAC)	11 - Миф о Розовых Деликатесах.flac	-12.250000	0.999207
redacted.ch/Психея - 2004 - Психея (1st Edition) (FLAC)	12 - --).flac	2.980000	0.811371
redacted.ch/Психея - Дневники Одиночки (2009) [FLAC]	01 Эти Дни.flac	-9.000000	0.994293
redacted.ch/Психея - Дневники Одиночки (2009) [FLAC]	02 В Лицо.flac	-8.800003	0.994293
redacted.ch/Психея - Дневники Одиночки (2009) [FLAC]	03 Наблюдатель за Наблюдателями.flac	-8.330002	0.994293
redacted.ch/Психея - Дневники Одиночки (2009) [FLAC]	04 Очевидное Зло.flac	-9.629997	0.994293
redacted.ch/Психея - Дневники Одиночки (2009) [FLAC]	05 Север Времени.flac	-8.739998	0.994293
redacted.ch/Психея - Дневники Одиночки (2009) [FLAC]	06 Поцелуи Мечты.flac	-9.300003	0.994293
redacted.ch/Психея - Дневники Одиночки (2009) [FLAC]	07 Еретики.flac	-10.220001	0.994324
redacted.ch/Психея - Дневники Одиночки (2009) [FLAC]	08 Ориентир.flac	-9.370003	0.994293
redacted.ch/Психея - Дневники Одиночки (2009) [FLAC]	09 Увядание.flac	-9.209999	0.994293
redacted.ch/Психея - Дневники Одиночки (2009) [FLAC]	10 Цвета Индиго.flac	-9.940002	0.994293
redacted.ch/Химера - 1996 - Zudwa-Dwa [FLAC]	01 - Пётр.flac	-1.529999	0.647980
redacted.ch/Химера - 1996 - Zudwa-Dwa [FLAC]	02 - Ай-лю-ли.flac	-3.739998	0.999969
redacted.ch/Химера - 1996 - Zudwa-Dwa [FLAC]	03 - Зайцы.flac	-2.279999	0.750610
redacted.ch/Химера - 1996 - Zudwa-Dwa [FLAC]	04 - Свистки.flac	1.090000	0.457886
redacted.ch/Химера - 1996 - Zudwa-Dwa [FLAC]	05 - Дождик.flac	2.660000	0.473236
redacted.ch/Химера - 1996 - Zudwa-Dwa [FLAC]	06 - Вороны.flac	-2.110001	0.785278
redacted.ch/Химера - 1996 - Zudwa-Dwa [FLAC]	07 - Графин.flac	1.759998	0.599945
redacted.ch/Химера - 1996 - Zudwa-Dwa [FLAC]	08 - Лошадь.flac	-1.860001	0.863495
redacted.ch/Химера - 1996 - Zudwa-Dwa [FLAC]	09 - Челленджер.flac	-2.580002	0.896301
redacted.ch/Химера - 1996 - Zudwa-Dwa [FLAC]	10 - Узлы.flac	-3.529999	0.904388
redacted.ch/Химера - 1996 - Zudwa-Dwa [FLAC]	11 - Счастливого пути.flac	-1.209999	0.844574
redacted.ch/Химера - 1996 - Zudwa-Dwa [FLAC]	12 - Сюзанна.flac	-0.870003	0.915894
redacted.ch/Химера - 1996 - Zudwa-Dwa [FLAC]	13 - Фантазёры.flac	-2.290001	0.908813
redacted.ch/Химера - 1996 - Zudwa-Dwa [FLAC]	14 - Bonus Sound.flac	13.730000	0.289642
redacted.ch/Химера - 1996 - Zudwa-Dwa [FLAC]	15 - Клоп (Remix).flac	-6.669998	0.781708
redacted.ch/Элизиум - Космос (2003) [FLAC]	01 - Словно Будда.flac	-7.059998	0.930206
redacted.ch/Элизиум - Космос (2003) [FLAC]	02 - Куда теряется мечта.flac	-6.989998	0.796417
redacted.ch/Элизиум - Космос (2003) [FLAC]	03 - Расскажите, птицы.flac	-6.639999	0.805481
redacted.ch/Элизиум - Космос (2003) [FLAC]	04 - Время не ждёт.flac	-6.040001	0.787689
redacted.ch/Элизиум - Космос (2003) [FLAC]	05 - Ослепительный мир.flac	-6.830002	0.822968
redacted.ch/Элизиум - Космос (2003) [FLAC]	06 - Солнце.flac	-6.400002	0.799896
redacted.ch/Элизиум - Космос (2003) [FLAC]	07 - Космос.flac	-6.459999	0.858795
redacted.ch/Элизиум - Космос (2003) [FLAC]	08 - Колесо Сансары.flac	-7.250000	0.856354
redacted.ch/Элизиум - Космос (2003) [FLAC]	09 - Южная.flac	-6.529999	0.798004
redacted.ch/Элизиум - Космос (2003) [FLAC]	10 - Секунды - года.flac	-6.879997	0.810120
redacted.ch/Элизиум - Космос (2003) [FLAC]	11 - Интересно.flac	-6.949997	0.946106
redacted.ch/Элизиум - Космос (2003) [FLAC]	12 - Супер робот.flac	-6.540001	0.797516
redacted.ch/Элизиум - Космос (2003) [FLAC]	13 - До завтра!.flac	-6.580002	0.744873
waffles.fm/1981- Damaged	01 - Rise Above.flac	-1.040001	0.639587
waffles.fm/1981- Damaged	02 - Spray Paint.flac	-1.940002	0.672546
waffles.fm/1981- Damaged	03 - Six Pack.flac	-0.940002	0.642548
waffles.fm/1981- Damaged	04 - What I See.flac	-1.550003	0.781616
waffles.fm/1981- Damaged	05 - TV Party.flac	-1.739998	0.696289
waffles.fm/1981- Damaged	06 - Thirsty and Miserable.flac	-1.470001	0.633789
waffles.fm/1981- Damaged	07 - Police Story.flac	-0.440002	0.616852
waffles.fm/1981- Damaged	08 - Gimmie Gimmie Gimmie.flac	-1.879997	0.767975
waffles.fm/1981- Damaged	09 - Depression.flac	-0.610001	0.598114
waffles.fm/1981- Damaged	10 - Room 13.flac	-0.809998	0.517212
waffles.fm/1981- Damaged	11 - Damaged II.flac	-0.480003	0.676544
waffles.fm/1981- Damaged	12 - No More.flac	-1.169998	0.669556
waffles.fm/1981- Damaged	13 - Padded Cell.flac	-1.510002	0.603333
waffles.fm/1981- Damaged	14 - Life of Pain.flac	-0.220001	0.636475
waffles.fm/1981- Damaged	15 - Damaged I.flac	0.040001	0.581818
waffles.fm/1992- Vulgar Display of Power	01 - Pantera - Mouth for war.flac	-6.120003	0.972870
waffles.fm/1992- Vulgar Display of Power	02 - Pantera - A new level.flac	-5.959999	0.972900
waffles.fm/1992- Vulgar Display of Power	03 - Pantera - Walk.flac	-6.260002	0.972900
waffles.fm/1992- Vulgar Display of Power	04 - Pantera - Fucking hostile.flac	-6.440002	0.868103
waffles.fm/1992- Vulgar Display of Power	05 - Pantera - This love.flac	-4.519997	0.972900
waffles.fm/1992- Vulgar Display of Power	06 - Pantera - Rise.flac	-4.919998	0.952362
waffles.fm/1992- Vulgar Display of Power	07 - Pantera - No good (Attack the radical).flac	-5.459999	0.957489
waffles.fm/1992- Vulgar Display of Power	08 - Pantera - Live in a hole.flac	-5.629997	0.972900
waffles.fm/1992- Vulgar Display of Power	09 - Pantera - Regular people (conceit).flac	-5.120003	0.972900
waffles.fm/1992- Vulgar Display of Power	10 - Pantera - By demons be driven.flac	-6.230003	0.972900
waffles.fm/1992- Vulgar Display of Power	11 - Pantera - Hollow.flac	-4.790001	0.920898
waffles.fm/2001 - A Call To Arms	01 - This Is A Call To Arms.flac	-4.309998	0.977264
waffles.fm/2001 - A Call To Arms	02 - Heres To Life.flac	-5.519997	0.977264
waffles.fm/2001 - A Call To Arms	03 - Dear Sergio.flac	-5.699997	0.977264
waffles.fm/2001 - A Call To Arms	04 - Its A Wonderful Life.flac	-6.379997	0.977264
waffles.fm/2001 - A Call To Arms	05 - They Provide The Paint For The Picture Perfect Masterpiece That You Will Paint On The Inside Of Your Eyelids.flac	-5.220001	0.977264
waffles.fm/2006 - The Ruff Guide to Genre-Terrorism	01 - Do It Today.flac	-10.519997	1.000000
waffles.fm/2006 - The Ruff Guide to Genre-Terrorism	02 - Apathy Begins At Home.flac	-9.949997	1.000000
waffles.fm/2006 - The Ruff Guide to Genre-Terrorism	03 - All In (feat Coolie Ranx).flac	-8.550003	1.000000
waffles.fm/2006 - The Ruff Guide to Genre-Terrorism	04 - Piggy In The Middle.flac	-10.400002	1.000000
waffles.fm/2006 - The Ruff Guide to Genre-Terrorism	05 - For Unlawful Carnal Knowledge.flac	-9.639999	1.000000
waffles.fm/2006 - The Ruff Guide to Genre-Terrorism	06 - Northern Skies.flac	-10.029999	1.000000
waffles.fm/2006 - The Ruff Guide to Genre-Terrorism	07 - Bigger Than Punk Rock.flac	-10.090004	1.000000
waffles.fm/2006 - The Ruff Guide to Genre-Terrorism	08 - Danger! Danger!.flac	-10.540001	1.000000
waffles.fm/2006 - The Ruff Guide to Genre-Terrorism	09 - Don't Say I Never Warned Ya....flac	-9.019997	1.000000
waffles.fm/2006 - The Ruff Guide to Genre-Terrorism	10 - Shareena.flac	-10.309998	1.000000
waffles.fm/2006 - The Ruff Guide to Genre-Terrorism	11 - A People's History of the Future.flac	-10.550003	1.000000
waffles.fm/2006 - The Ruff Guide to Genre-Terrorism	12 - Until The Sunlight Comes.flac	-9.550003	1.000000
waffles.fm/Against Me! - New Wave (2007) [FLAC]	01 - New Wave.flac	-11.970001	0.999969
waffles.fm/Against Me! - New Wave (2007) [FLAC]	02 - Up The Cuts.flac	-10.260002	0.999969
waffles.fm/Against Me! - New Wave (2007) [FLAC]	03 - Thrash Unreal.flac	-10.519997	0.999969
waffles.fm/Against Me! - New Wave (2007) [FLAC]	04 - White People For Peace.flac	-11.949997	0.999969
waffles.fm/Against Me! - New Wave (2007) [FLAC]	05 - Stop!.flac	-10.919998	0.999969
waffles.fm/Against Me! - New Wave (2007) [FLAC]	06 - Borne On The Fm Waves Of The Heart.flac	-10.959999	0.999969
waffles.fm/Against Me! - New Wave (2007) [FLAC]	07 - Piss And Vinegar.flac	-11.610001	0.999969
waffles.fm/Against Me! - New Wave (2007) [FLAC]	08 - Americans Abroad.flac	-10.840004	0.999969
waffles.fm/Against Me! - New Wave (2007) [FLAC]	09 - Animal.flac	-10.500000	0.999969
waffles.fm/Against Me! - New Wave (2007) [FLAC]	10 - The Ocean.flac	-9.730003	0.999969
waffles.fm/American Psycho (FLAC)	01 - Misfits - The Abominable Dr. Phibes.flac	-6.080002	0.999023
waffles.fm/American Psycho (FLAC)	02 - Misfits - American Psycho.flac	-9.629997	0.999023
waffles.fm/American Psycho (FLAC)	03 - Misfits - Speak Of The Devil.flac	-9.779999	0.999023
waffles.fm/American Psycho (FLAC)	04 - Misfits - Walk Among Us.flac	-8.550003	0.999023
waffles.fm/American Psycho (FLAC)	05 - Misfits - The Hunger.flac	-7.840004	0.999023
waffles.fm/American Psycho (FLAC)	06 - Misfits - From Hell They Came.flac	-8.629997	0.999023
waffles.fm/American Psycho (FLAC)	07 - Misfits - Dig Up Her Bones.flac	-10.029999	0.999023
waffles.fm/American Psycho (FLAC)	08 - Misfits - Blacklight.flac	-9.320000	0.999023
waffles.fm/American Psycho (FLAC)	09 - Misfits - Resurrection.flac	-7.790001	0.999023
waffles.fm/American Psycho (FLAC)	10 - Misfits - This Island Earth.flac	-8.840004	0.999023
waffles.fm/American Psycho (FLAC)	11 - Misfits - The Crimson Ghost.flac	-7.500000	0.999023
waffles.fm/American Psycho (FLAC)	12 - Misfits - Day Of The Dead.flac	-8.449997	0.999023
waffles.fm/American Psycho (FLAC)	13 - Misfits - The Haunting.flac	-8.930000	0.999023
waffles.fm/American Psycho (FLAC)	14 - Misfits - Mars Attacks.flac	-7.379997	0.999023
waffles.fm/American Psycho (FLAC)	15 - Misfits - Hate The Living, Love The Dead.flac	-8.510002	0.999023
waffles.fm/American Psycho (FLAC)	16 - Misfits - The Shining.flac	-9.480003	0.999969
waffles.fm/American Psycho (FLAC)	17 - Misfits - Don't Open 'Til Doomsday (+ Hellnight - Hidden Track).flac	-8.160004	0.999023
waffles.fm/Atari Teenage Riot - Delete Yourself!	01 - Start The Riot!.flac	-7.550003	0.982880
waffles.fm/Atari Teenage Riot - Delete Yourself!	02 - Into The Death.flac	-7.680000	0.980560
waffles.fm/Atari Teenage Riot - Delete Yourself!	03 - Raverbashing.flac	-6.510002	0.982758
waffles.fm/Atari Teenage Riot - Delete Yourself!	04 - Speed.flac	-7.480003	0.984497
waffles.fm/Atari Teenage Riot - Delete Yourself!	05 - Sex.flac	-6.220001	0.983673
waffles.fm/Atari Teenage Riot - Delete Yourself!	06 - Midijunkies.flac	-8.419998	0.985016
waffles.fm/Atari Teenage Riot - Delete Yourself!	07 - Delete Yourself! You Got No Chance To Win! (Live In Glasgow 17.10.1993).flac	-7.769997	0.984619
waffles.fm/Atari Teenage Riot - Delete Yourself!	08 - Hetzjagd Auf Nazis! (Live In Berlin 25.2.1994).flac	-5.489998	0.980652
waffles.fm/Atari Teenage Riot - Delete Yourself!	09 - Cyberpunks Are Dead!.flac	-6.110001	0.986633
waffles.fm/Atari Teenage Riot - Delete Yourself!	10 - Kids Are United!.flac	-8.949997	0.983948
waffles.fm/Atari Teenage Riot - Delete Yourself!	11 - Atari Teenage Riot.flac	-6.870003	0.987579
waffles.fm/Atari Teenage Riot - Delete Yourself!	12 - Riot 1995.flac	-9.440002	0.985596
waffles.fm/Babyboom - 2007 - Babyboom [FLAC]	01 - Passing Through.flac	-8.150002	0.988525
waffles.fm/Babyboom - 2007 - Babyboom [FLAC]	02 - Sister.flac	-8.230003	0.988525
waffles.fm/Babyboom - 2007 - Babyboom [FLAC]	03 - Scatterbrain.flac	-8.610001	0.988525
waffles.fm/Babyboom - 2007 - Babyboom [FLAC]	04 - Not Yet.flac	-8.349998	0.988525
waffles.fm/Beastie Boys - Ill Communication	01 - Sure Shot.flac	-6.500000	0.950745
waffles.fm/Beastie Boys - Ill Communication	02 - Tough Guy.flac	-6.160004	0.950745
waffles.fm/Beastie Boys - Ill Communication	03 - B-Boys Makin' With The Freak Freak.flac	-6.139999	0.950745
waffles.fm/Beastie Boys - Ill Communication	04 - Bobo On The Corner.flac	-4.870003	0.950745
waffles.fm/Beastie Boys - Ill Communication	05 - Root Down.flac	-7.699997	0.950745
waffles.fm/Beastie Boys - Ill Communication	06 - Sabotage.flac	-7.209999	0.950745
waffles.fm/Beastie Boys - Ill Communication	07 - Get It Together.flac	-6.720001	0.950745
waffles.fm/Beastie Boys - Ill Communication	08 - Sabrosa.flac	-4.199997	0.950745
waffles.fm/Beastie Boys - Ill Communication	09 - The Update.flac	-6.410004	0.954926
waffles.fm/Beastie Boys - Ill Communication	10 - Futterman's Rule.flac	-6.730003	0.950745
waffles.fm/Beastie Boys - Ill Communication	11 - Alright Hear This.flac	-7.110001	0.950745
waffles.fm/Beastie Boys - Ill Communication	12 - Eugene's Lament.flac	-1.650002	0.977234
waffles.fm/Beastie Boys - Ill Communication	13 - Flute Loop.flac	-5.029999	0.950745
waffles.fm/Beastie Boys - Ill Communication	14 - Do It.flac	-7.040001	0.954926
waffles.fm/Beastie Boys - Ill Communication	15 - Ricky's Theme.flac	-4.250000	0.950745
waffles.fm/Beastie Boys - Ill Communication	16 - Heart Attack Man.flac	-6.290001	0.954926
waffles.fm/Beastie Boys - Ill Communication	17 - The Scoop.flac	-7.139999	0.954926
waffles.fm/Beastie Boys - Ill Communication	18 - Shambala.flac	-2.750000	0.950745
waffles.fm/Beastie Boys - Ill Communication	19 - Bodhisattva Vow.flac	-5.360001	0.950745
waffles.fm/Beastie Boys - Ill Communication	20 - Transitions.flac	-1.769997	0.977234
waffles.fm/Children_Of_Bodom-Are_You_Dead_Yet-2005-LOSSLESS	01-children_of_bodom-living_dead_beat.flac	-10.349998	0.977234
waffles.fm/Children_Of_Bodom-Are_You_Dead_Yet-2005-LOSSLESS	02-children_of_bodom-are_you_dead_yet.flac	-10.340004	0.977234
waffles.fm/Children_Of_Bodom-Are_You_Dead_Yet-2005-LOSSLESS	03-children_of_bodom-if_you_want_peace..._prepare_for_war.flac	-10.570000	0.968109
waffles.fm/Children_Of_Bodom-Are_You_Dead_Yet-2005-LOSSLESS	04-children_of_bodom-punch_me_i_bleed.flac	-10.449997	0.962219
waffles.fm/Children_Of_Bodom-Are_You_Dead_Yet-2005-LOSSLESS	05-children_of_bodom-in_your_face.flac	-10.059998	0.962219
waffles.fm/Children_Of_Bodom-Are_You_Dead_Yet-2005-LOSSLESS	06-children_of_bodom-next_in_line.flac	-10.209999	0.962219
waffles.fm/Children_Of_Bodom-Are_You_Dead_Yet-2005-LOSSLESS	07-children_of_bodom-bastards_of_bodom.flac	-10.540001	0.962799
waffles.fm/Children_Of_Bodom-Are_You_Dead_Yet-2005-LOSSLESS	08-children_of_bodom-trashed,_lost_&_strungout.flac	-10.580002	0.962219
waffles.fm/Children_Of_Bodom-Are_You_Dead_Yet-2005-LOSSLESS	09-children_of_bodom-we're_not_gonna_fall.flac	-10.529999	0.962219
waffles.fm/Choking Victim - No Gods, No Managers (1999) [FLAC]	01 - 500 Channels.flac	-12.959999	0.992035
waffles.fm/Choking Victim - No Gods, No Managers (1999) [FLAC]	02 - In Hell.flac	-12.370003	1.000000
waffles.fm/Choking Victim - No Gods, No Managers (1999) [FLAC]	03 - Crack Rock Steady.flac	-11.000000	0.990540
waffles.fm/Choking Victim - No Gods, No Managers (1999) [FLAC]	04 - Suicide (A Better Way).flac	-12.349998	0.990448
waffles.fm/Choking Victim - No Gods, No Managers (1999) [FLAC]	05 - In My Grave.flac	-13.400002	0.990570
waffles.fm/Choking Victim - No Gods, No Managers (1999) [FLAC]	06 - Fucked Reality.flac	-12.760002	0.990662
waffles.fm/Choking Victim - No Gods, No Managers (1999) [FLAC]	07 - Money.flac	-11.879997	0.990387
waffles.fm/Choking Victim - No Gods, No Managers (1999) [FLAC]	08 - Hate Yer State.flac	-12.379997	0.990417
waffles.fm/Choking Victim - No Gods, No Managers (1999) [FLAC]	09 - Fuck America.flac	-11.400002	0.989960
waffles.fm/Choking Victim - No Gods, No Managers (1999) [FLAC]	10 - War Story.flac	-11.660004	0.989929
waffles.fm/Choking Victim - No Gods, No Managers (1999) [FLAC]	11 - Five Finger Discount.flac	-12.250000	0.990173
waffles.fm/Choking Victim - No Gods, No Managers (1999) [FLAC]	12 - Praise to the Sinners.flac	-11.519997	0.990204
waffles.fm/Choking Victim - No Gods, No Managers (1999) [FLAC]	13 - Living the Laws.flac	-11.389999	0.991974
waffles.fm/Dance Hall Crashers - Lockjaw - 1995 [FLAC]	01 - Shelley.flac	-8.820000	1.000000
waffles.fm/Dance Hall Crashers - Lockjaw - 1995 [FLAC]	02 - Don't Wanna Behave.flac	-8.590004	1.000000
waffles.fm/Dance Hall Crashers - Lockjaw - 1995 [FLAC]	03 - Queen for a Day.flac	-8.949997	1.000000
waffles.fm/Dance Hall Crashers - Lockjaw - 1995 [FLAC]	04 - Flyin'.flac	-7.940002	1.000000
waffles.fm/Dance Hall Crashers - Lockjaw - 1995 [FLAC]	05 - Good for Nothin'.flac	-6.940002	1.000000
waffles.fm/Dance Hall Crashers - Lockjaw - 1995 [FLAC]	06 - Buried Alive.flac	-9.750000	1.000000
waffles.fm/Dance Hall Crashers - Lockjaw - 1995 [FLAC]	07 - Sticky.flac	-8.730003	1.000000
waffles.fm/Dance Hall Crashers - Lockjaw - 1995 [FLAC]	08 - Too Late.flac	-8.860001	1.000000
waffles.fm/Dance Hall Crashers - Lockjaw - 1995 [FLAC]	09 - Go.flac	-9.070000	1.000000
waffles.fm/Dance Hall Crashers - Lockjaw - 1995 [FLAC]	10 - Enough.flac	-9.160004	1.000000
waffles.fm/Dance Hall Crashers - Lockjaw - 1995 [FLAC]	11 - Pictures.flac	-9.250000	1.000000
waffles.fm/Dance Hall Crashers - Lockjaw - 1995 [FLAC]	12 - Day Job.flac	-7.949997	1.000000
waffles.fm/Dance Hall Crashers - Lockjaw - 1995 [FLAC]	13 - So Sue Us.flac	-10.620003	1.000000
waffles.fm/Dance Hall Crashers - Lockjaw - 1995 [FLAC]	14 - We Owe.flac	-8.900002	1.000000
waffles.fm/Disturbed - Indestructable	01 - Disturbed - Indestructible - Disturbed.flac	-9.870003	1.000000
waffles.fm/Disturbed - Indestructable	02 - Disturbed - Inside The Fire - Disturbed.flac	-10.220001	1.000000
waffles.fm/Disturbed - Indestructable	03 - Disturbed - Deceiver - Disturbed.flac	-10.360001	1.000000
waffles.fm/Disturbed - Indestructable	04 - Disturbed - The Night - Disturbed.flac	-10.419998	1.000000
waffles.fm/Disturbed - Indestructable	05 - Disturbed - Perfect Insanity - Disturbed.flac	-10.090004	1.000000
waffles.fm/Disturbed - Indestructable	06 - Disturbed - Haunted - Disturbed.flac	-10.239998	1.000000
waffles.fm/Disturbed - Indestructable	07 - Disturbed - Enough - Disturbed.flac	-10.349998	1.000000
waffles.fm/Disturbed - Indestructable	08 - Disturbed - The Curse - Disturbed.flac	-10.500000	1.000000
waffles.fm/Disturbed - Indestructable	09 - Disturbed - Torn - Disturbed.flac	-10.519997	1.000000
waffles.fm/Disturbed - Indestructable	10 - Disturbed - Criminal - Disturbed.flac	-10.360001	1.000000
waffles.fm/Disturbed - Indestructable	11 - Disturbed - Divide - Disturbed.flac	-9.860001	1.000000
waffles.fm/Disturbed - Indestructable	12 - Disturbed - Facade - Disturbed.flac	-10.340004	1.000000
waffles.fm/donots - coma chameleon	01 .Donots - There's A Tunnel At The End Of The Light.flac	-0.750000	0.677856
waffles.fm/donots - coma chameleon	02 .Donots - Break My Stride.flac	-10.129997	0.999969
waffles.fm/donots - coma chameleon	03 .Donots - Pick Up The Pieces.flac	-9.470001	0.974640
waffles.fm/donots - coma chameleon	04 .Donots - Headphones.flac	-9.970001	0.974640
waffles.fm/donots - coma chameleon	05 .Donots - New Hope For The Dead.flac	-9.959999	0.974640
waffles.fm/donots - coma chameleon	06 .Donots - Anything.flac	-9.760002	0.974670
waffles.fm/donots - coma chameleon	07 .Donots - To Hell With Love.flac	-10.080002	0.974640
waffles.fm/donots - coma chameleon	08 .Donots - Stop The Clocks.flac	-8.860001	0.974640
waffles.fm/donots - coma chameleon	09 .Donots - The Right Kind Of Wrong.flac	-10.620003	0.974640
waffles.fm/donots - coma chameleon	10 .Donots - This Is Not A Drill.flac	-9.790001	0.974945
waffles.fm/donots - coma chameleon	11 .Donots - Killing Time.flac	-9.519997	0.974640
waffles.fm/donots - coma chameleon	12 .Donots - Somewhere Someday.flac	-9.570000	0.974640
waffles.fm/Faith No More - Angel Dust {MFSL Gold} [FLAC]	01 - Land Of Sunshine.flac	-2.940002	0.977570
waffles.fm/Faith No More - Angel Dust {MFSL Gold} [FLAC]	02 - Caffeine.flac	-4.449997	0.986725
waffles.fm/Faith No More - Angel Dust {MFSL Gold} [FLAC]	03 - MidLife Crisis.flac	-2.830002	0.989929
waffles.fm/Faith No More - Angel Dust {MFSL Gold} [FLAC]	04 - RV.flac	-3.570000	0.990265
waffles.fm/Faith No More - Angel Dust {MFSL Gold} [FLAC]	05 - Smaller And Smaller.flac	-2.940002	0.980591
waffles.fm/Faith No More - Angel Dust {MFSL Gold} [FLAC]	06 - Everything's Ruined.flac	-2.529999	0.982910
waffles.fm/Faith No More - Angel Dust {MFSL Gold} [FLAC]	07 - Malpractice.flac	-3.840004	0.957367
waffles.fm/Faith No More - Angel Dust {MFSL Gold} [FLAC]	08 - Kindergarten.flac	-2.220001	0.988617
waffles.fm/Faith No More - Angel Dust {MFSL Gold} [FLAC]	09 - Be Aggressive.flac	-2.660004	0.994019
waffles.fm/Faith No More - Angel Dust {MFSL Gold} [FLAC]	10 - A Small Victory.flac	-2.860001	0.986603
waffles.fm/Faith No More - Angel Dust {MFSL Gold} [FLAC]	11 - Crack Hitler.flac	-3.730003	0.984039
waffles.fm/Faith No More - Angel Dust {MFSL Gold} [FLAC]	12 - Jizzlobber.flac	-3.379997	0.984802
waffles.fm/Faith No More - Angel Dust {MFSL Gold} [FLAC]	13 - Midnight Cowboy.flac	0.379997	0.953857
waffles.fm/Fear Factory - Archetype	01 - Fear Factory - Slave Labor.flac	-9.690002	0.999023
waffles.fm/Fear Factory - Archetype	02 - Fear Factory - Cyberwaste.flac	-10.379997	1.000000
waffles.fm/Fear Factory - Archetype	03 - Fear Factory - Act Of God.flac	-10.190002	0.999603
waffles.fm/Fear Factory - Archetype	04 - Fear Factory - Drones.flac	-8.910004	0.999023
waffles.fm/Fear Factory - Archetype	05 - Fear Factory - Archetype.flac	-9.790001	0.999023
waffles.fm/Fear Factory - Archetype	06 - Fear Factory - Corporate Cloning.flac	-9.500000	0.999054
waffles.fm/Fear Factory - Archetype	07 - Fear Factory - Bite The Hand That Bleeds.flac	-9.050003	0.999023
waffles.fm/Fear Factory - Archetype	08 - Fear Factory - Undercurrent.flac	-9.680000	0.999054
waffles.fm/Fear Factory - Archetype	09 - Fear Factory - Default Judgement.flac	-9.699997	0.999023
waffles.fm/Fear Factory - Archetype	10 - Fear Factory - Bonescraper.flac	-9.169998	0.999359
waffles.fm/Fear Factory - Archetype	11 - Fear Factory - Human Shields.flac	-9.279999	0.999023
waffles.fm/Fear Factory - Archetype	12 - Fear Factory - Ascension.flac	5.579998	0.401306
waffles.fm/Fear Factory - Archetype	13 - Fear Factory - School [Nirvana Cover].flac	-9.870003	0.999023
waffles.fm/Gogol Bordello - 2010 - Trans-Continental Hustle [88697 45965 2][waffles]	01 - Gogol Bordello - Pala Tute.flac	-11.070000	0.998352
waffles.fm/Gogol Bordello - 2010 - Trans-Continental Hustle [88697 45965 2][waffles]	02 - Gogol Bordello - My Companjera.flac	-11.440002	0.986877
waffles.fm/Gogol Bordello - 2010 - Trans-Continental Hustle [88697 45965 2][waffles]	03 - Gogol Bordello - Sun Is on My Side.flac	-9.580002	0.998474
waffles.fm/Gogol Bordello - 2010 - Trans-Continental Hustle [88697 45965 2][waffles]	04 - Gogol Bordello - Rebellious Love.flac	-11.330002	0.998535
waffles.fm/Gogol Bordello - 2010 - Trans-Continental Hustle [88697 45965 2][waffles]	05 - Gogol Bordello - Immigraniada (We Comin' Rougher).flac	-12.290001	0.986328
waffles.fm/Gogol Bordello - 2010 - Trans-Continental Hustle [88697 45965 2][waffles]	06 - Gogol Bordello - When Universes Collide.flac	-10.620003	0.998383
waffles.fm/Gogol Bordello - 2010 - Trans-Continental Hustle [88697 45965 2][waffles]	07 - Gogol Bordello - Uma Menina.flac	-11.349998	0.986816
waffles.fm/Gogol Bordello - 2010 - Trans-Continental Hustle [88697 45965 2][waffles]	08 - Gogol Bordello - Raise the Knowledge.flac	-10.900002	0.998169
waffles.fm/Gogol Bordello - 2010 - Trans-Continental Hustle [88697 45965 2][waffles]	09 - Gogol Bordello - Last One Goes the Hope.flac	-10.699997	0.998291
waffles.fm/Gogol Bordello - 2010 - Trans-Continental Hustle [88697 45965 2][waffles]	10 - Gogol Bordello - To Rise Above.flac	-10.529999	0.998352
waffles.fm/Gogol Bordello - 2010 - Trans-Continental Hustle [88697 45965 2][waffles]	11 - Gogol Bordello - In the Meantime in Pernambuco.flac	-11.000000	0.998383
waffles.fm/Gogol Bordello - 2010 - Trans-Continental Hustle [88697 45965 2][waffles]	12 - Gogol Bordello - Break the Spell.flac	-12.139999	0.998383
waffles.fm/Gogol Bordello - 2010 - Trans-Continental Hustle [88697 45965 2][waffles]	13 - Gogol Bordello - Trans-Continental Hustle.flac	-11.209999	0.998505
waffles.fm/How To Do Battle (2009) -flac-	01 - Wake Up, You're On Fire.flac	-1.889999	0.891266
waffles.fm/How To Do Battle (2009) -flac-	02 - Resistance Now.flac	-11.400002	1.000000
waffles.fm/How To Do Battle (2009) -flac-	03 - Brightest Rays.flac	-11.639999	1.000000
waffles.fm/How To Do Battle (2009) -flac-	04 - 2 3 Clear.flac	-11.320000	1.000000
waffles.fm/How To Do Battle (2009) -flac-	05 - Dictator Bling.flac	-11.230003	1.000000
waffles.fm/How To Do Battle (2009) -flac-	06 - End Of The World Show.flac	-11.400002	1.000000
waffles.fm/How To Do Battle (2009) -flac-	07 - Smoking Paranoia.flac	-10.680000	1.000000
waffles.fm/How To Do Battle (2009) -flac-	08 - Sandhurst In Zero G.flac	-4.349998	0.794342
waffles.fm/How To Do Battle (2009) -flac-	09 - So Refined.flac	-11.690002	1.000000
waffles.fm/How To Do Battle (2009) -flac-	10 - Hex.flac	-11.340004	1.000000
waffles.fm/How To Do Battle (2009) -flac-	11 - Fairytale.flac	-9.230003	1.000000
waffles.fm/How To Do Battle (2009) -flac-	12 - Lights Out.flac	-11.239998	1.000000
waffles.fm/How To Do Battle (2009) -flac-	13 - Arturo.flac	-1.540001	1.000000
waffles.fm/Joe Satriani - Surfing With The Alien - 1999 - Mobile Fidelity Sound Lab - UDCD-751	01 - Joe Satriani - Surfing With The Alien.flac	-4.139999	1.000000
waffles.fm/Joe Satriani - Surfing With The Alien - 1999 - Mobile Fidelity Sound Lab - UDCD-751	02 - Joe Satriani - Ice 9.flac	-3.900002	1.000000
waffles.fm/Joe Satriani - Surfing With The Alien - 1999 - Mobile Fidelity Sound Lab - UDCD-751	03 - Joe Satriani - Crushing Day.flac	-4.889999	1.000000
waffles.fm/Joe Satriani - Surfing With The Alien - 1999 - Mobile Fidelity Sound Lab - UDCD-751	04 - Joe Satriani - Always With Me, Always With You.flac	-4.639999	1.000000
waffles.fm/Joe Satriani - Surfing With The Alien - 1999 - Mobile Fidelity Sound Lab - UDCD-751	05 - Joe Satriani - Satch Boogie.flac	-3.019997	1.000000
waffles.fm/Joe Satriani - Surfing With The Alien - 1999 - Mobile Fidelity Sound Lab - UDCD-751	06 - Joe Satriani - Hill Of The Skull.flac	-2.750000	1.000000
waffles.fm/Joe Satriani - Surfing With The Alien - 1999 - Mobile Fidelity Sound Lab - UDCD-751	07 - Joe Satriani - Circles.flac	-1.660004	1.000000
waffles.fm/Joe Satriani - Surfing With The Alien - 1999 - Mobile Fidelity Sound Lab - UDCD-751	08 - Joe Satriani - Lords Of Karma.flac	-4.709999	1.000000
waffles.fm/Joe Satriani - Surfing With The Alien - 1999 - Mobile Fidelity Sound Lab - UDCD-751	09 - Joe Satriani - Midnight.flac	-3.199997	0.963928
waffles.fm/Joe Satriani - Surfing With The Alien - 1999 - Mobile Fidelity Sound Lab - UDCD-751	10 - Joe Satriani - Echo.flac	-3.840004	1.000000
waffles.fm/L7 - Bricks Are Heavy	01 - Wargasm.flac	-5.570000	0.972900
waffles.fm/L7 - Bricks Are Heavy	02 - Scrap.flac	-5.830002	0.972900
waffles.fm/L7 - Bricks Are Heavy	03 - Pretend We're Dead.flac	-6.559998	0.972900
waffles.fm/L7 - Bricks Are Heavy	04 - Diet Pill.flac	-5.590004	0.972900
waffles.fm/L7 - Bricks Are Heavy	05 - Everglade.flac	-4.750000	0.972900
waffles.fm/L7 - Bricks Are Heavy	06 - Slide.flac	-5.660004	0.972900
waffles.fm/L7 - Bricks Are Heavy	07 - One More Thing.flac	-5.480003	1.000000
waffles.fm/L7 - Bricks Are Heavy	08 - Mr. Integrity.flac	-6.790001	0.972900
waffles.fm/L7 - Bricks Are Heavy	09 - Monster.flac	-5.010002	1.000000
waffles.fm/L7 - Bricks Are Heavy	10 - Shitlist.flac	-5.669998	0.972900
waffles.fm/L7 - Bricks Are Heavy	11 - This Ain't Pleasure.flac	-4.840004	0.972900
waffles.fm/Megadeth - Endgame	01 - Dialectic Chaos.flac	-10.379997	0.988708
waffles.fm/Megadeth - Endgame	02 - This Day We Fight!.flac	-10.699997	0.988678
waffles.fm/Megadeth - Endgame	03 - 44 Minutes.flac	-10.090004	0.988678
waffles.fm/Megadeth - Endgame	04 - 1,320.flac	-10.580002	0.988678
waffles.fm/Megadeth - Endgame	05 - Bite the Hand.flac	-10.050003	0.988678
waffles.fm/Megadeth - Endgame	06 - Bodies.flac	-9.849998	0.988678
waffles.fm/Megadeth - Endgame	07 - Endgame.flac	-9.650002	0.988678
waffles.fm/Megadeth - Endgame	08 - The Hardest Part of Letting Go...Sealed With a Kiss.flac	-9.260002	0.988678
waffles.fm/Megadeth - Endgame	09 - Head Crusher.flac	-10.370003	0.988678
waffles.fm/Megadeth - Endgame	10 - How the Story Ends.flac	-9.400002	0.988678
waffles.fm/Megadeth - Endgame	11 - The Right to Go Insane.flac	-9.949997	0.988678
waffles.fm/Miles Davis - Kind Of Blue	01 - So What.flac	-5.309998	0.944153
waffles.fm/Miles Davis - Kind Of Blue	02 - Freddie Freeloader.flac	-5.779999	0.944153
waffles.fm/Miles Davis - Kind Of Blue	03 - Blue In Green.flac	2.380001	0.898315
waffles.fm/Miles Davis - Kind Of Blue	04 - All Blues.flac	-3.769997	0.944153
waffles.fm/Miles Davis - Kind Of Blue	05 - Flamenco Sketches.flac	-2.430000	0.944153
waffles.fm/Miles Davis - Kind Of Blue	06 - Flamenco Sketches (Alternate Take).flac	-3.800003	0.944122
waffles.fm/Mustard Plug - Evildoers Beware! (FLAC)	01 Box.flac	-8.870003	0.977356
waffles.fm/Mustard Plug - Evildoers Beware! (FLAC)	02 Suburband Homesick Blues.flac	-9.150002	0.977356
waffles.fm/Mustard Plug - Evildoers Beware! (FLAC)	03 Never Be.flac	-8.669998	0.977356
waffles.fm/Mustard Plug - Evildoers Beware! (FLAC)	04 You.flac	-8.650002	0.977356
waffles.fm/Mustard Plug - Evildoers Beware! (FLAC)	05 Mendoza.flac	-8.720001	0.999969
waffles.fm/Mustard Plug - Evildoers Beware! (FLAC)	06 Go.flac	-9.090004	0.977356
waffles.fm/Mustard Plug - Evildoers Beware! (FLAC)	07 Jerry.flac	-7.959999	0.977356
waffles.fm/Mustard Plug - Evildoers Beware! (FLAC)	08 Not Again.flac	-8.430000	0.977356
waffles.fm/Mustard Plug - Evildoers Beware! (FLAC)	09 Miss Michigan.flac	-9.320000	0.977356
waffles.fm/Mustard Plug - Evildoers Beware! (FLAC)	10 Sadie May.flac	-9.169998	0.977356
waffles.fm/Mustard Plug - Evildoers Beware! (FLAC)	11 Dressed Up.flac	-8.510002	0.977356
waffles.fm/Mustard Plug - Evildoers Beware! (FLAC)	12 Beer.flac	-9.070000	0.977356
waffles.fm/Nightwish - 2002 - Century Child	Nightwish - 01 - Bless The Child.flac	-7.309998	0.967285
waffles.fm/Nightwish - 2002 - Century Child	Nightwish - 02 - End Of All Hope.flac	-7.690002	0.988525
waffles.fm/Nightwish - 2002 - Century Child	Nightwish - 03 - Dead To The World.flac	-8.029999	0.933167
waffles.fm/Nightwish - 2002 - Century Child	Nightwish - 04 - Ever Dream.flac	-7.110001	0.988556
waffles.fm/Nightwish - 2002 - Century Child	Nightwish - 05 - Slaying The Dreamer.flac	-7.099998	0.892181
waffles.fm/Nightwish - 2002 - Century Child	Nightwish - 06 - Forever Yours.flac	-4.699997	0.884369
waffles.fm/Nightwish - 2002 - Century Child	Nightwish - 07 - Ocean Soul.flac	-6.660004	0.977570
waffles.fm/Nightwish - 2002 - Century Child	Nightwish - 08 - Feel For You.flac	-7.169998	0.962128
waffles.fm/Nightwish - 2002 - Century Child	Nightwish - 09 - The Phantom Of The Opera.flac	-7.190002	0.988647
waffles.fm/Nightwish - 2002 - Century Child	Nightwish - 10 - Beauty Of The Beast.flac	-7.320000	0.988586
waffles.fm/NOFX - 1994 - Punk in Drublic	01 - Linoleum.flac	-6.709999	0.990753
waffles.fm/NOFX - 1994 - Punk in Drublic	02 - Leave It Alone.flac	-5.830002	0.983765
waffles.fm/NOFX - 1994 - Punk in Drublic	03 - Dig.flac	-6.559998	0.971466
waffles.fm/NOFX - 1994 - Punk in Drublic	04 - The Cause.flac	-7.620003	0.941284
waffles.fm/NOFX - 1994 - Punk in Drublic	05 - Don't Call Me White.flac	-6.389999	0.946686
waffles.fm/NOFX - 1994 - Punk in Drublic	06 - My Heart Is Yearning.flac	-3.070000	0.932495
waffles.fm/NOFX - 1994 - Punk in Drublic	07 - Perfect Government.flac	-6.790001	0.990967
waffles.fm/NOFX - 1994 - Punk in Drublic	08 - The Brews.flac	-5.760002	0.937469
waffles.fm/NOFX - 1994 - Punk in Drublic	09 - The Quass.flac	-5.070000	0.957703
waffles.fm/NOFX - 1994 - Punk in Drublic	10 - Dying Degree.flac	-6.519997	0.862244
waffles.fm/NOFX - 1994 - Punk in Drublic	11 - Fleas.flac	-6.120003	0.987793
waffles.fm/NOFX - 1994 - Punk in Drublic	12 - Lori Meyers.flac	-7.349998	0.928986
waffles.fm/NOFX - 1994 - Punk in Drublic	13 - Jeff Wears Birkenstocks.flac	-5.470001	0.969269
waffles.fm/NOFX - 1994 - Punk in Drublic	14 - Punk Guy.flac	-6.889999	0.982941
waffles.fm/NOFX - 1994 - Punk in Drublic	15 - Happy Guy.flac	-6.870003	0.984924
waffles.fm/NOFX - 1994 - Punk in Drublic	16 - Reeko.flac	-7.370003	0.996307
waffles.fm/NOFX - 1994 - Punk in Drublic	17 - Scavenger Type.flac	-0.650002	0.860413
waffles.fm/Papa Roach - Infest	01 - Papa Roach - Infest.flac	-9.919998	0.999969
waffles.fm/Papa Roach - Infest	02 - Papa Roach - Last Resort.flac	-9.900002	0.999023
waffles.fm/Papa Roach - Infest	03 - Papa Roach - Broken Home.flac	-9.400002	0.890381
waffles.fm/Papa Roach - Infest	04 - Papa Roach - Dead Cell.flac	-9.110001	0.999969
waffles.fm/Papa Roach - Infest	05 - Papa Roach - Between Angels And Insects.flac	-10.779999	0.999023
waffles.fm/Papa Roach - Infest	06 - Papa Roach - Blood Brothers.flac	-10.980003	0.999969
waffles.fm/Papa Roach - Infest	07 - Papa Roach - Revenge.flac	-9.849998	0.999023
waffles.fm/Papa Roach - Infest	08 - Papa Roach - Snakes.flac	-10.590004	0.999054
waffles.fm/Papa Roach - Infest	09 - Papa Roach - Never Enough.flac	-8.370003	0.999023
waffles.fm/Papa Roach - Infest	10 - Papa Roach - Binge.flac	-8.809998	0.999023
waffles.fm/Papa Roach - Infest	11 - Papa Roach - Thrown Away.flac	-8.019997	0.999969
waffles.fm/Rage Against The Machine - 1999 - The Battle Of Los Angeles	01 - Testify.flac	-8.610001	0.988739
waffles.fm/Rage Against The Machine - 1999 - The Battle Of Los Angeles	02 - Guerrilla Radio.flac	-9.029999	0.998871
waffles.fm/Rage Against The Machine - 1999 - The Battle Of Los Angeles	03 - Calm Like A Bomb.flac	-9.379997	0.998901
waffles.fm/Rage Against The Machine - 1999 - The Battle Of Los Angeles	04 - Mic Check.flac	-8.459999	0.998871
waffles.fm/Rage Against The Machine - 1999 - The Battle Of Los Angeles	05 - Sleep Now In The Fire.flac	-8.519997	0.978485
waffles.fm/Rage Against The Machine - 1999 - The Battle Of Los Angeles	06 - Born Of A Broken Man.flac	-9.110001	0.979553
waffles.fm/Rage Against The Machine - 1999 - The Battle Of Los Angeles	07 - Born As Ghosts.flac	-9.180000	0.998840
waffles.fm/Rage Against The Machine - 1999 - The Battle Of Los Angeles	08 - Maria.flac	-8.570000	0.998871
waffles.fm/Rage Against The Machine - 1999 - The Battle Of Los Angeles	09 - Voice Of The Voiceless.flac	-7.470001	0.998871
waffles.fm/Rage Against The Machine - 1999 - The Battle Of Los Angeles	10 - New Millennium Homes.flac	-8.090004	0.993378
waffles.fm/Rage Against The Machine - 1999 - The Battle Of Los Angeles	11 - Ashes In The Fall.flac	-8.900002	0.930389
waffles.fm/Rage Against The Machine - 1999 - The Battle Of Los Angeles	12 - War Within A Breath.flac	-8.019997	0.998871
waffles.fm/Raised Fist - 2006 - Sound Of The Republic	01 - You Ignore Them All.flac	-8.400002	0.977356
waffles.fm/Raised Fist - 2006 - Sound Of The Republic	02 - Perfectly Broken.flac	-9.059998	0.977356
waffles.fm/Raised Fist - 2006 - Sound Of The Republic	03 - Sunlight.flac	-8.570000	0.979340
waffles.fm/Raised Fist - 2006 - Sound Of The Republic	04 - Sound Of The Republic.flac	-9.010002	0.977356
waffles.fm/Raised Fist - 2006 - Sound Of The Republic	05 - Killing It.flac	-8.970001	0.977356
waffles.fm/Raised Fist - 2006 - Sound Of The Republic	06 - Back.flac	-8.800003	0.977356
waffles.fm/Raised Fist - 2006 - Sound Of The Republic	07 - Hertz Island Escapades.flac	-8.180000	0.977356
waffles.fm/Raised Fist - 2006 - Sound Of The Republic	08 - Some Of These Times.flac	-8.590004	0.977356
waffles.fm/Raised Fist - 2006 - Sound Of The Republic	09 - Nation Of Incomplete.flac	-8.099998	0.977356
waffles.fm/Raised Fist - 2006 - Sound Of The Republic	10 - And Then They Run.flac	-9.330002	0.977356
waffles.fm/Raised Fist - 2006 - Sound Of The Republic	11 - Bleed Under My Pen.flac	-8.099998	0.977356
waffles.fm/Raised Fist - 2006 - Sound Of The Republic	12 - Time Will Let You Go, All Alone, I Break.flac	-8.160004	0.977356
waffles.fm/Rancid - And Out Come the Wolves (1995) [FLAC]	01 - Maxwell Murder.flac	-8.669998	1.000000
waffles.fm/Rancid - And Out Come the Wolves (1995) [FLAC]	02 - The 11th Hour.flac	-8.269997	1.000000
waffles.fm/Rancid - And Out Come the Wolves (1995) [FLAC]	03 - Roots Radicals.flac	-9.419998	1.000000
waffles.fm/Rancid - And Out Come the Wolves (1995) [FLAC]	04 - Time Bomb.flac	-8.340004	1.000000
waffles.fm/Rancid - And Out Come the Wolves (1995) [FLAC]	05 - Olympia WA..flac	-9.550003	1.000000
waffles.fm/Rancid - And Out Come the Wolves (1995) [FLAC]	06 - Lock, Step & Gone.flac	-8.500000	1.000000
waffles.fm/Rancid - And Out Come the Wolves (1995) [FLAC]	07 - Junkie Man.flac	-8.029999	1.000000
waffles.fm/Rancid - And Out Come the Wolves (1995) [FLAC]	08 - Listed M.I.A..flac	-8.830002	1.000000
waffles.fm/Rancid - And Out Come the Wolves (1995) [FLAC]	09 - Ruby Soho.flac	-9.779999	1.000000
waffles.fm/Rancid - And Out Come the Wolves (1995) [FLAC]	10 - Daly City Train.flac	-8.840004	1.000000
waffles.fm/Rancid - And Out Come the Wolves (1995) [FLAC]	11 - Journey To The End Of The East Bay.flac	-8.059998	1.000000
waffles.fm/Rancid - And Out Come the Wolves (1995) [FLAC]	12 - She's Automatic.flac	-10.559998	1.000000
waffles.fm/Rancid - And Out Come the Wolves (1995) [FLAC]	13 - Old Friend.flac	-8.889999	1.000000
waffles.fm/Rancid - And Out Come the Wolves (1995) [FLAC]	14 - Disorder And Disarray.flac	-8.669998	1.000000
waffles.fm/Rancid - And Out Come the Wolves (1995) [FLAC]	15 - The Wars End.flac	-9.629997	1.000000
waffles.fm/Rancid - And Out Come the Wolves (1995) [FLAC]	16 - You Don't Care Nothin'.flac	-8.139999	1.000000
waffles.fm/Rancid - And Out Come the Wolves (1995) [FLAC]	17 - As Wicked.flac	-10.489998	1.000000
waffles.fm/Rancid - And Out Come the Wolves (1995) [FLAC]	18 - Avenues & Alleyways.flac	-9.489998	1.000000
waffles.fm/Rancid - And Out Come the Wolves (1995) [FLAC]	19 - The Way I Feel.flac	-9.059998	1.000000
waffles.fm/Random Hand - 2010 - Another Change Of Plan [FLAC]	01 - Play Some Ska.flac	-10.930000	0.989044
waffles.fm/Random Hand - 2010 - Another Change Of Plan [FLAC]	02 - Scum Triumphant.flac	-11.550003	0.991760
waffles.fm/Random Hand - 2010 - Another Change Of Plan [FLAC]	03 - Milk.flac	-11.019997	1.000000
waffles.fm/Random Hand - 2010 - Another Change Of Plan [FLAC]	04 - Snakes And Ladders.flac	-11.519997	0.989105
waffles.fm/Random Hand - 2010 - Another Change Of Plan [FLAC]	05 - Dynamo Penis Death Bastard.flac	-11.230003	0.992218
waffles.fm/Random Hand - 2010 - Another Change Of Plan [FLAC]	06 - Anthropology.flac	-10.820000	1.000000
waffles.fm/Random Hand - 2010 - Another Change Of Plan [FLAC]	07 - The Tenant Of Rotherwood Hall.flac	-11.279999	1.000000
waffles.fm/Random Hand - 2010 - Another Change Of Plan [FLAC]	08 - Answers.flac	-11.639999	0.999969
waffles.fm/Random Hand - 2010 - Another Change Of Plan [FLAC]	09 - Danger Makes Enemies.flac	-11.849998	0.989075
waffles.fm/Random Hand - 2010 - Another Change Of Plan [FLAC]	10 - The Wisest Man.flac	-11.059998	0.989075
waffles.fm/Random Hand - 2010 - Another Change Of Plan [FLAC]	11 - Tear Down.flac	-11.620003	0.989044
waffles.fm/Random Hand - 2010 - Another Change Of Plan [FLAC]	12 - Mr Bibs Wakes Up.flac	-11.820000	0.989014
waffles.fm/Random Hand - 2010 - Another Change Of Plan [FLAC]	13 - The Story.flac	-13.330002	0.989105
waffles.fm/Random Hand - 2010 - Another Change Of Plan [FLAC]	14 - Morally Blind.flac	-11.000000	0.988983
waffles.fm/Random Hand - 2010 - Another Change Of Plan [FLAC]	15 - Fury Fix.flac	-11.540001	0.989075
waffles.fm/Save Ferris - Modified	01 - Turn It Up.flac	-9.570000	0.998871
waffles.fm/Save Ferris - Modified	02 - The Only Way To Be.flac	-9.540001	0.998871
waffles.fm/Save Ferris - Modified	03 - I'm Not Cryin' For You.flac	-8.730003	0.998871
waffles.fm/Save Ferris - Modified	04 - Your Friend.flac	-10.029999	0.998871
waffles.fm/Save Ferris - Modified	05 - No Love.flac	-8.900002	0.998840
waffles.fm/Save Ferris - Modified	06 - Angry Situation.flac	-9.779999	0.998871
waffles.fm/Save Ferris - Modified	07 - What You See Is What You Get.flac	-10.040001	0.983307
waffles.fm/Save Ferris - Modified	08 - One More Try.flac	-4.830002	0.977325
waffles.fm/Save Ferris - Modified	09 - Mistaken.flac	-9.650002	0.998871
waffles.fm/Save Ferris - Modified	10 - Holding On.flac	-9.459999	0.991638
waffles.fm/Save Ferris - Modified	11 - Let Me In.flac	-9.059998	0.998840
waffles.fm/Sex Pistols - Never Mind the Bollocks, Here's The Sex Pistols (1977) [FLAC]	01 - The Sex Pistols - Holidays in the Sun.flac	-3.800003	0.850342
waffles.fm/Sex Pistols - Never Mind the Bollocks, Here's The Sex Pistols (1977) [FLAC]	02 - The Sex Pistols - Bodies.flac	-4.029999	0.999969
waffles.fm/Sex Pistols - Never Mind the Bollocks, Here's The Sex Pistols (1977) [FLAC]	03 - The Sex Pistols - No Feelings.flac	-3.029999	0.877441
waffles.fm/Sex Pistols - Never Mind the Bollocks, Here's The Sex Pistols (1977) [FLAC]	04 - The Sex Pistols - Liar.flac	-3.370003	0.998383
waffles.fm/Sex Pistols - Never Mind the Bollocks, Here's The Sex Pistols (1977) [FLAC]	05 - The Sex Pistols - Problems.flac	-3.320000	0.979034
waffles.fm/Sex Pistols - Never Mind the Bollocks, Here's The Sex Pistols (1977) [FLAC]	06 - The Sex Pistols - God Save the Queen.flac	-3.320000	0.981659
waffles.fm/Sex Pistols - Never Mind the Bollocks, Here's The Sex Pistols (1977) [FLAC]	07 - The Sex Pistols - Seventeen.flac	-3.620003	0.999969
waffles.fm/Sex Pistols - Never Mind the Bollocks, Here's The Sex Pistols (1977) [FLAC]	08 - The Sex Pistols - Anarchy in the UK.flac	-4.110001	0.972504
waffles.fm/Sex Pistols - Never Mind the Bollocks, Here's The Sex Pistols (1977) [FLAC]	09 - The Sex Pistols - Submission.flac	-2.470001	0.999542
waffles.fm/Sex Pistols - Never Mind the Bollocks, Here's The Sex Pistols (1977) [FLAC]	10 - The Sex Pistols - Pretty Vacant.flac	-4.019997	1.000000
waffles.fm/Sex Pistols - Never Mind the Bollocks, Here's The Sex Pistols (1977) [FLAC]	11 - The Sex Pistols - New York.flac	-3.279999	0.983887
waffles.fm/Sex Pistols - Never Mind the Bollocks, Here's The Sex Pistols (1977) [FLAC]	12 - The Sex Pistols - EMI.flac	-3.980003	0.999969
waffles.fm/Skindred - Babylon (FLAC 1st issue)	01  Skindred - Set It Off.flac	-10.029999	0.997833
waffles.fm/Skindred - Babylon (FLAC 1st issue)	02  Skindred - Kiss And Make Up.flac	-9.840004	0.997833
waffles.fm/Skindred - Babylon (FLAC 1st issue)	03  Skindred - Pressure.flac	-10.010002	0.997833
waffles.fm/Skindred - Babylon (FLAC 1st issue)	04  Skindred - Sicker.flac	-9.930000	0.997833
waffles.fm/Skindred - Babylon (FLAC 1st issue)	05  Skindred - Selector.flac	-9.760002	0.997833
waffles.fm/Skindred - Babylon (FLAC 1st issue)	06  Skindred - Babylon.flac	-10.340004	0.997833
waffles.fm/Skindred - Babylon (FLAC 1st issue)	07  Skindred - The Fear.flac	-9.559998	0.997833
waffles.fm/Skindred - Babylon (FLAC 1st issue)	08  Skindred - Bruises.flac	-9.739998	0.998871
waffles.fm/Skindred - Babylon (FLAC 1st issue)	09  Skindred - Together.flac	-10.519997	0.998871
waffles.fm/Skindred - Babylon (FLAC 1st issue)	10  Skindred - Word Domination.flac	-9.680000	0.997833
waffles.fm/Skindred - Babylon (FLAC 1st issue)	11  Skindred - Nobody.flac	-9.470001	0.997833
waffles.fm/Static-X - Wisconsin Death Trip [FLAC]	Static-X - 01 - Push It.flac	-9.489998	0.977234
waffles.fm/Static-X - Wisconsin Death Trip [FLAC]	Static-X - 02 - I'm With Stupid.flac	-8.800003	0.977234
waffles.fm/Static-X - Wisconsin Death Trip [FLAC]	Static-X - 03 - Bled For Days.flac	-8.980003	0.984375
waffles.fm/Static-X - Wisconsin Death Trip [FLAC]	Static-X - 04 - Love Dump.flac	-8.050003	0.977234
waffles.fm/Static-X - Wisconsin Death Trip [FLAC]	Static-X - 05 - I Am.flac	-8.139999	0.977356
waffles.fm/Static-X - Wisconsin Death Trip [FLAC]	Static-X - 06 - Otsegolation.flac	-9.110001	0.977570
waffles.fm/Static-X - Wisconsin Death Trip [FLAC]	Static-X - 07 - Stem.flac	-9.260002	0.977234
waffles.fm/Static-X - Wisconsin Death Trip [FLAC]	Static-X - 08 - Sweat Of The Bud.flac	-7.410004	0.977234
waffles.fm/Static-X - Wisconsin Death Trip [FLAC]	Static-X - 09 - Fix.flac	-9.269997	0.977234
waffles.fm/Static-X - Wisconsin Death Trip [FLAC]	Static-X - 10 - Wisconsin Death Trip.flac	-9.120003	0.999969
waffles.fm/Static-X - Wisconsin Death Trip [FLAC]	Static-X - 11 - The Trance Is The Motion.flac	-7.870003	0.977234
waffles.fm/Static-X - Wisconsin Death Trip [FLAC]	Static-X - 12 - December.flac	-8.080002	0.967468
waffles.fm/Streetlight Manifesto - [2003] Everything Goes Numb [FLAC 100%]	01_-_Everything_Went_Numb.flac	-8.580002	0.920929
waffles.fm/Streetlight Manifesto - [2003] Everything Goes Numb [FLAC 100%]	02_-_That'll_Be_The_Day.flac	-8.629997	0.920929
waffles.fm/Streetlight Manifesto - [2003] Everything Goes Numb [FLAC 100%]	03_-_Point_-_Counterpoint.flac	-8.940002	0.920929
waffles.fm/Streetlight Manifesto - [2003] Everything Goes Numb [FLAC 100%]	04_-_If_And_When_We_Rise_Again.flac	-8.300003	0.920929
waffles.fm/Streetlight Manifesto - [2003] Everything Goes Numb [FLAC 100%]	05_-_A_Better_Place,_A_Better_Time.flac	-9.269997	0.920929
waffles.fm/Streetlight Manifesto - [2003] Everything Goes Numb [FLAC 100%]	06_-_We_Are_The_Few.flac	-8.029999	0.920929
waffles.fm/Streetlight Manifesto - [2003] Everything Goes Numb [FLAC 100%]	07_-_Failing,_Flailing.flac	-8.519997	0.920929
waffles.fm/Streetlight Manifesto - [2003] Everything Goes Numb [FLAC 100%]	08_-_Here's_To_Life.flac	-8.370003	0.920929
waffles.fm/Streetlight Manifesto - [2003] Everything Goes Numb [FLAC 100%]	09_-_A_Moment_Of_Silence.flac	-8.019997	0.920929
waffles.fm/Streetlight Manifesto - [2003] Everything Goes Numb [FLAC 100%]	10_-_A_Moment_Of_Violence.flac	-7.650002	0.920929
waffles.fm/Streetlight Manifesto - [2003] Everything Goes Numb [FLAC 100%]	11_-_The_Saddest_Song.flac	-8.489998	0.920929
waffles.fm/Streetlight Manifesto - [2003] Everything Goes Numb [FLAC 100%]	12_-_The_Big_Sleep.flac	-7.430000	0.920898
waffles.fm/System of a Down - Toxicity	01 - System of a Down - Prison Song.flac	-9.849998	0.988800
waffles.fm/System of a Down - Toxicity	02 - System of a Down - Needles.flac	-10.739998	0.966309
waffles.fm/System of a Down - Toxicity	03 - System of a Down - Deer Dance.flac	-10.529999	0.988831
waffles.fm/System of a Down - Toxicity	04 - System of a Down - Jet Pilot.flac	-10.010002	0.988800
waffles.fm/System of a Down - Toxicity	05 - System of a Down - X.flac	-9.769997	0.988770
waffles.fm/System of a Down - Toxicity	06 - System of a Down - Chop Suey!.flac	-10.690002	0.988770
waffles.fm/System of a Down - Toxicity	07 - System of a Down - Bounce.flac	-10.190002	0.988770
waffles.fm/System of a Down - Toxicity	08 - System of a Down - Forest.flac	-9.940002	0.988800
waffles.fm/System of a Down - Toxicity	09 - System of a Down - Atwa.flac	-10.070000	0.988800
waffles.fm/System of a Down - Toxicity	10 - System of a Down - Science.flac	-10.040001	0.988770
waffles.fm/System of a Down - Toxicity	11 - System of a Down - Shimmy.flac	-10.809998	0.988831
waffles.fm/System of a Down - Toxicity	12 - System of a Down - Toxicity.flac	-9.879997	0.988800
waffles.fm/System of a Down - Toxicity	13 - System of a Down - Psycho.flac	-9.669998	0.988800
waffles.fm/System of a Down - Toxicity	14 - System of a Down - Aerials.flac	-9.970001	0.988831
waffles.fm/The Cure - Disintegration	01 - Plainsong.flac	-0.669998	0.775696
waffles.fm/The Cure - Disintegration	02 - Pictures Of You.flac	-2.370003	0.941986
waffles.fm/The Cure - Disintegration	03 - Closedown.flac	-1.830002	0.848541
waffles.fm/The Cure - Disintegration	04 - Love Song.flac	-2.519997	0.909607
waffles.fm/The Cure - Disintegration	05 - Last Dance.flac	-3.220001	0.977203
waffles.fm/The Cure - Disintegration	06 - Lullaby.flac	-0.949997	0.977203
waffles.fm/The Cure - Disintegration	07 - Fascination Street.flac	-3.970001	0.899963
waffles.fm/The Cure - Disintegration	08 - Prayers For Rain.flac	-1.209999	0.977203
waffles.fm/The Cure - Disintegration	09 - The Same Deep Water As You.flac	-1.449997	0.823425
waffles.fm/The Cure - Disintegration	10 - Disintegration.flac	-3.290001	0.954987
waffles.fm/The Cure - Disintegration	11 - Homesick.flac	-0.989998	0.904419
waffles.fm/The Cure - Disintegration	12 - Untitled.flac	-0.930000	0.843170
waffles.fm/The Flatliners - The Great Awake [2007-FLAC-Cue-Log]	01 - The Flatliners - July! August! Reno!.flac	-9.529999	0.999878
waffles.fm/The Flatliners - The Great Awake [2007-FLAC-Cue-Log]	02 - The Flatliners - Eulogy.flac	-9.730003	0.999878
waffles.fm/The Flatliners - The Great Awake [2007-FLAC-Cue-Log]	03 - The Flatliners - ...And The World Files For Chapter 11.flac	-10.340004	0.999878
waffles.fm/The Flatliners - The Great Awake [2007-FLAC-Cue-Log]	04 - The Flatliners - This Respirator.flac	-9.750000	0.999878
waffles.fm/The Flatliners - The Great Awake [2007-FLAC-Cue-Log]	05 - The Flatliners - Meanwhile, In Hell....flac	-10.840004	0.999878
waffles.fm/The Flatliners - The Great Awake [2007-FLAC-Cue-Log]	06 - The Flatliners - Mother Teresa Chokeslams The World.flac	-10.449997	0.999878
waffles.fm/The Flatliners - The Great Awake [2007-FLAC-Cue-Log]	07 - The Flatliners - This Is Giving Up.flac	-9.879997	0.999878
waffles.fm/The Flatliners - The Great Awake [2007-FLAC-Cue-Log]	08 - The Flatliners - Mastering The World's Smallest Violin.flac	-9.040001	0.999878
waffles.fm/The Flatliners - The Great Awake [2007-FLAC-Cue-Log]	09 - The Flatliners - You Guys Want One Of These .flac	-10.040001	0.999878
waffles.fm/The Flatliners - The Great Awake [2007-FLAC-Cue-Log]	10 - The Flatliners - These Words Are Bullets.flac	-10.639999	0.999878
waffles.fm/The Flatliners - The Great Awake [2007-FLAC-Cue-Log]	11 - The Flatliners - Hal Johnson Smokes Cigarettes.flac	-10.129997	0.999878
waffles.fm/The Flatliners - The Great Awake [2007-FLAC-Cue-Log]	12 - The Flatliners - KHTDR.flac	-9.419998	0.999878
waffles.fm/The Mighty Mighty Bosstones - Let's Face It	01 - Noise Brigade.flac	-8.500000	0.928589
waffles.fm/The Mighty Mighty Bosstones - Let's Face It	02 - The Rascal King.flac	-8.199997	0.928436
waffles.fm/The Mighty Mighty Bosstones - Let's Face It	03 - Royal Oil.flac	-6.720001	0.977234
waffles.fm/The Mighty Mighty Bosstones - Let's Face It	04 - The Impression That I Get.flac	-9.269997	0.979889
waffles.fm/The Mighty Mighty Bosstones - Let's Face It	05 - Let's Face It.flac	-8.059998	0.979889
waffles.fm/The Mighty Mighty Bosstones - Let's Face It	06 - That Bug Bit Me.flac	-8.779999	0.979889
waffles.fm/The Mighty Mighty Bosstones - Let's Face It	07 - Another Drinkin' Song.flac	-9.449997	0.999420
waffles.fm/The Mighty Mighty Bosstones - Let's Face It	08 - Numbered Days.flac	-8.910004	0.979889
waffles.fm/The Mighty Mighty Bosstones - Let's Face It	09 - Break So Easily.flac	-8.320000	0.977234
waffles.fm/The Mighty Mighty Bosstones - Let's Face It	10 - Nevermind Me.flac	-8.680000	1.000000
waffles.fm/The Mighty Mighty Bosstones - Let's Face It	11 - Desensitized.flac	-9.879997	0.979889
waffles.fm/The Mighty Mighty Bosstones - Let's Face It	12 - 1-2-8.flac	-8.550003	0.979889
waffles.fm/The Mighty Mighty Bosstones - Pin Points and Gin Joints [FLAC]	01 - The Mighty Mighty Bosstones - Graffiti Worth Reading.flac	-10.290001	0.966125
waffles.fm/The Mighty Mighty Bosstones - Pin Points and Gin Joints [FLAC]	02 - The Mighty Mighty Bosstones - Nah Nah Nah Nah Nah.flac	-10.940002	0.966125
waffles.fm/The Mighty Mighty Bosstones - Pin Points and Gin Joints [FLAC]	03 - The Mighty Mighty Bosstones - The Route That I Took.flac	-10.389999	0.966125
waffles.fm/The Mighty Mighty Bosstones - Pin Points and Gin Joints [FLAC]	04 - The Mighty Mighty Bosstones - You Left Right .flac	-10.139999	0.966125
waffles.fm/The Mighty Mighty Bosstones - Pin Points and Gin Joints [FLAC]	05 - The Mighty Mighty Bosstones - Too Many Stars.flac	-11.610001	0.966125
waffles.fm/The Mighty Mighty Bosstones - Pin Points and Gin Joints [FLAC]	06 - The Mighty Mighty Bosstones - Your Life.flac	-9.430000	0.966125
waffles.fm/The Mighty Mighty Bosstones - Pin Points and Gin Joints [FLAC]	07 - The Mighty Mighty Bosstones - I Wrote It.flac	-10.320000	0.966125
waffles.fm/The Mighty Mighty Bosstones - Pin Points and Gin Joints [FLAC]	08 - The Mighty Mighty Bosstones - Not To Me On That Night.flac	-10.070000	0.966278
waffles.fm/The Mighty Mighty Bosstones - Pin Points and Gin Joints [FLAC]	09 - The Mighty Mighty Bosstones - Wasted Summers.flac	-10.449997	0.966217
waffles.fm/The Mighty Mighty Bosstones - Pin Points and Gin Joints [FLAC]	10 - The Mighty Mighty Bosstones - Sister Mary.flac	-9.809998	0.988647
waffles.fm/The Mighty Mighty Bosstones - Pin Points and Gin Joints [FLAC]	11 - The Mighty Mighty Bosstones - It Will Be.flac	-11.169998	0.988617
waffles.fm/The Mighty Mighty Bosstones - Pin Points and Gin Joints [FLAC]	12 - The Mighty Mighty Bosstones - The Death Valley Vipers.flac	-11.120003	0.988617
waffles.fm/The Mighty Mighty Bosstones - Pin Points and Gin Joints [FLAC]	13 - The Mighty Mighty Bosstones - The Bricklayer's Story.flac	-11.050003	0.988617
waffles.fm/The Mighty Mighty Bosstones - Pin Points and Gin Joints [FLAC]	14 - The Mighty Mighty Bosstones - A Pretty Sad Excuse.flac	-10.879997	0.988617
waffles.fm/The Offspring - Smash (1994) [FLAC]	The Offspring - Smash - 01 - Time To Relax.flac	1.290001	0.696655
waffles.fm/The Offspring - Smash (1994) [FLAC]	The Offspring - Smash - 02 - Nitro (Youth Energy).flac	-8.139999	0.946686
waffles.fm/The Offspring - Smash (1994) [FLAC]	The Offspring - Smash - 03 - Bad Habit.flac	-8.250000	0.946686
waffles.fm/The Offspring - Smash (1994) [FLAC]	The Offspring - Smash - 04 - Gotta Get Away.flac	-6.940002	0.946716
waffles.fm/The Offspring - Smash (1994) [FLAC]	The Offspring - Smash - 05 - Genocide.flac	-7.650002	0.946686
waffles.fm/The Offspring - Smash (1994) [FLAC]	The Offspring - Smash - 06 - Something To Believe In.flac	-7.180000	0.946625
waffles.fm/The Offspring - Smash (1994) [FLAC]	The Offspring - Smash - 07 - Come Out And Play.flac	-6.570000	0.946686
waffles.fm/The Offspring - Smash (1994) [FLAC]	The Offspring - Smash - 08 - Self Esteem.flac	-6.910004	0.946686
waffles.fm/The Offspring - Smash (1994) [FLAC]	The Offspring - Smash - 09 - It'll Be A Long Time.flac	-7.330002	0.946655
waffles.fm/The Offspring - Smash (1994) [FLAC]	The Offspring - Smash - 10 - Killboy Powerhead.flac	-7.690002	0.946655
waffles.fm/The Offspring - Smash (1994) [FLAC]	The Offspring - Smash - 11 - What Happened To You.flac	-6.769997	0.945282
waffles.fm/The Offspring - Smash (1994) [FLAC]	The Offspring - Smash - 12 - So Alone.flac	-7.419998	0.946655
waffles.fm/The Offspring - Smash (1994) [FLAC]	The Offspring - Smash - 13 - Not The One.flac	-7.169998	0.946655
waffles.fm/The Offspring - Smash (1994) [FLAC]	The Offspring - Smash - 14 - Smash.flac	-7.110001	0.946655
waffles.fm/VA - Skank For Brains [FLAC]	01 - The Rudiments - Announcer Beginning.flac	-4.750000	0.491608
waffles.fm/VA - Skank For Brains [FLAC]	02 - The Rudiments - Wailing Paddle.flac	-4.599998	1.000000
waffles.fm/VA - Skank For Brains [FLAC]	03 - The Rudiments - Monkey Grinder.flac	-3.470001	1.000000
waffles.fm/VA - Skank For Brains [FLAC]	04 - The Rudiments - Treadmill.flac	-3.800003	1.000000
waffles.fm/VA - Skank For Brains [FLAC]	05 - The Rudiments - Sunday Morning Suspect.flac	-4.540001	1.000000
waffles.fm/VA - Skank For Brains [FLAC]	06 - The Rudiments - Spoon.flac	-3.739998	1.000000
waffles.fm/VA - Skank For Brains [FLAC]	07 - The Rudiments - Plank.flac	-3.150002	1.000000
waffles.fm/VA - Skank For Brains [FLAC]	08 - The Rudiments - Lucky Charms.flac	-2.879997	0.967377
waffles.fm/VA - Skank For Brains [FLAC]	09 - The Rudiments - Scapegoat.flac	-4.129997	0.999969
waffles.fm/VA - Skank For Brains [FLAC]	10 - The Rudiments - What's Cooking.flac	-3.529999	0.956116
waffles.fm/VA - Skank For Brains [FLAC]	11 - The Rudiments - Mama Cita.flac	-2.760002	0.999969
waffles.fm/VA - Skank For Brains [FLAC]	12 - Jack Kevorkian and The Suicide Machines - Intermission.flac	1.779999	0.266357
waffles.fm/VA - Skank For Brains [FLAC]	13 - Jack Kevorkian and The Suicide Machines - Hey Ska!.flac	-2.800003	1.000000
waffles.fm/VA - Skank For Brains [FLAC]	14 - Jack Kevorkian and The Suicide Machines - New Girl.flac	-2.709999	1.000000
waffles.fm/VA - Skank For Brains [FLAC]	15 - Jack Kevorkian and The Suicide Machines - The Real You.flac	-4.410004	1.000000
waffles.fm/VA - Skank For Brains [FLAC]	16 - Jack Kevorkian and The Suicide Machines - I Don't Want to Hear It.flac	-4.820000	0.999969
waffles.fm/VA - Skank For Brains [FLAC]	17 - Jack Kevorkian and The Suicide Machines - Too Much.flac	-2.480003	1.000000
waffles.fm/VA - Skank For Brains [FLAC]	18 - Jack Kevorkian and The Suicide Machines - The Van's Song.flac	-3.269997	0.993439
waffles.fm/VA - Skank For Brains [FLAC]	19 - Jack Kevorkian and The Suicide Machines - Green World.flac	-3.889999	1.000000
waffles.fm/VA - Skank For Brains [FLAC]	20 - Jack Kevorkian and The Suicide Machines - Inside,Outside.flac	-3.000000	0.993652
waffles.fm/VA - Skank For Brains [FLAC]	21 - Jack Kevorkian and The Suicide Machines - Little Home.flac	-3.349998	1.000000
waffles.fm/VA - Skank For Brains [FLAC]	22 - Jack Kevorkian and The Suicide Machines - Bonkers.flac	-2.809998	0.993164
waffles.fm/VA - Skank For Brains [FLAC]	23 - Jack Kevorkian and The Suicide Machines - Announcer Ending.flac	-1.220001	0.336212
what.cd/17 Reasons	01 - Verbal Kint.flac	-7.959999	0.999939
what.cd/17 Reasons	02 - Nothing Left.flac	-6.910004	0.999939
what.cd/17 Reasons	03 - Enough.flac	-7.980003	0.999969
what.cd/17 Reasons	04 - Pretty Girls.flac	-8.099998	0.999939
what.cd/17 Reasons	05 - Jeff Acree.flac	-7.580002	0.999969
what.cd/17 Reasons	06 - Screwed.flac	-5.120003	0.999939
what.cd/17 Reasons	07 - Termination.flac	-9.529999	0.999969
what.cd/17 Reasons	08 - Turn It Around.flac	-9.080002	0.999969
what.cd/17 Reasons	09 - What Can I Do .flac	-7.360001	0.999939
what.cd/17 Reasons	10 - Up To The Top.flac	-6.900002	0.999969
what.cd/17 Reasons	11 - Dime-Store Hoods.flac	-7.410004	0.999939
what.cd/17 Reasons	12 - Slap.flac	-6.250000	0.999939
what.cd/17 Reasons	13 - Dance Floor.flac	-7.400002	0.999969
what.cd/17 Reasons	14 - Looking Back.flac	-6.690002	0.999939
what.cd/17 Reasons	15 - Nowhere Fast.flac	-6.629997	0.999969
what.cd/17 Reasons	16 - Jennifer's Cafe.flac	-6.930000	0.999939
what.cd/17 Reasons	17 - Burning Down.flac	-5.760002	0.999939
what.cd/1975 - A Night At The Opera - MFSL UDCD 568 - 1992	01 - Death On Two Legs - Dedicated To....flac	-4.840004	0.836395
what.cd/1975 - A Night At The Opera - MFSL UDCD 568 - 1992	02 - Lazing On A Sunday Afternoon.flac	-3.160004	0.919464
what.cd/1975 - A Night At The Opera - MFSL UDCD 568 - 1992	03 - I'm In Love With My Car.flac	-3.139999	0.944305
what.cd/1975 - A Night At The Opera - MFSL UDCD 568 - 1992	04 - You're My Best Friend.flac	-1.269997	0.711487
what.cd/1975 - A Night At The Opera - MFSL UDCD 568 - 1992	05 - '39.flac	-1.430000	0.881378
what.cd/1975 - A Night At The Opera - MFSL UDCD 568 - 1992	06 - Sweet Lady.flac	-2.709999	0.953186
what.cd/1975 - A Night At The Opera - MFSL UDCD 568 - 1992	07 - Seaside Rendezvous.flac	-5.459999	0.908051
what.cd/1975 - A Night At The Opera - MFSL UDCD 568 - 1992	08 - The Prophet's Song.flac	-2.440002	0.967560
what.cd/1975 - A Night At The Opera - MFSL UDCD 568 - 1992	09 - Love Of My Life.flac	-4.639999	0.905975
what.cd/1975 - A Night At The Opera - MFSL UDCD 568 - 1992	10 - Good Company.flac	-2.120003	0.770081
what.cd/1975 - A Night At The Opera - MFSL UDCD 568 - 1992	11 - Bohemian Rhapsody.flac	-2.169998	0.884949
what.cd/1975 - A Night At The Opera - MFSL UDCD 568 - 1992	12 - God Save The Queen.flac	1.520000	0.680420
what.cd/1983 - Labour Of Love	01 - Cherry Oh Baby.flac	1.150002	0.884216
what.cd/1983 - Labour Of Love	02 - Keep On Moving.flac	1.110001	0.582001
what.cd/1983 - Labour Of Love	03 - Please Don't Make Me Cry.flac	0.309998	0.752380
what.cd/1983 - Labour Of Love	04 - Sweet Sensation.flac	2.029999	0.660187
what.cd/1983 - Labour Of Love	05 - Johnny Too Bad.flac	1.739998	0.638214
what.cd/1983 - Labour Of Love	06 - Red Red Wine.flac	-0.209999	0.964294
what.cd/1983 - Labour Of Love	07 - Guilty.flac	2.720001	0.625336
what.cd/1983 - Labour Of Love	08 - She Caught The Train.flac	-2.059998	0.761475
what.cd/1983 - Labour Of Love	09 - Version Girl.flac	0.059998	0.960815
what.cd/1983 - Labour Of Love	10 - Many Rivers To Cross.flac	-2.169998	0.686371
what.cd/[1989] The Real Thing	Faith No More - 01 - From Out Of Nowhere.flac	-4.459999	0.999969
what.cd/[1989] The Real Thing	Faith No More - 02 - Epic.flac	-4.360001	0.968903
what.cd/[1989] The Real Thing	Faith No More - 03 - Falling To Pieces.flac	-3.750000	0.999969
what.cd/[1989] The Real Thing	Faith No More - 04 - Surprise! You're Dead!.flac	-3.029999	0.999969
what.cd/[1989] The Real Thing	Faith No More - 05 - Zombie Eaters.flac	-2.599998	0.999969
what.cd/[1989] The Real Thing	Faith No More - 06 - The Real Thing.flac	-2.279999	0.999084
what.cd/[1989] The Real Thing	Faith No More - 07 - Underwater Love.flac	-3.209999	0.999969
what.cd/[1989] The Real Thing	Faith No More - 08 - The Morning After.flac	-2.209999	0.876892
what.cd/[1989] The Real Thing	Faith No More - 09 - Woodpecker From Mars.flac	-4.269997	0.996552
what.cd/[1989] The Real Thing	Faith No More - 10 - War Pigs.flac	-4.430000	0.999969
what.cd/[1989] The Real Thing	Faith No More - 11 - Edge Of The World.flac	-1.209999	0.848633
what.cd/[1991] - Sailing the Seas of Cheese	01.  Seas of Cheese.flac	0.950001	0.534668
what.cd/[1991] - Sailing the Seas of Cheese	02.  Here Come the Bastards.flac	-2.489998	0.857300
what.cd/[1991] - Sailing the Seas of Cheese	03.  Sgt. Baker.flac	-2.790001	0.922028
what.cd/[1991] - Sailing the Seas of Cheese	04.  American Life.flac	-1.730003	0.906891
what.cd/[1991] - Sailing the Seas of Cheese	05.  Jerry Was a Race Car Driver.flac	-1.699997	0.908417
what.cd/[1991] - Sailing the Seas of Cheese	06.  Eleven.flac	-3.709999	0.990662
what.cd/[1991] - Sailing the Seas of Cheese	07.  Is It Luck .flac	-2.930000	0.844757
what.cd/[1991] - Sailing the Seas of Cheese	08.  Grandad's Little Ditty.flac	5.980000	0.256897
what.cd/[1991] - Sailing the Seas of Cheese	09.  Tommy the Cat.flac	-2.970001	0.889771
what.cd/[1991] - Sailing the Seas of Cheese	10.  Sathington Waltz.flac	-0.730003	0.972198
what.cd/[1991] - Sailing the Seas of Cheese	11.  Those Damned Blue-Collar Tweekers.flac	-1.849998	0.954376
what.cd/[1991] - Sailing the Seas of Cheese	12.  Fish On (Fisherman Chronicles, Chapter II).flac	-1.620003	0.995850
what.cd/[1991] - Sailing the Seas of Cheese	13.  Los Bastardos.flac	-2.519997	0.881256
what.cd/[1992] Automatic For The People (2005 DVD-A 2.0 24-48)	01 - Drive.flac	-4.660004	0.983198
what.cd/[1992] Automatic For The People (2005 DVD-A 2.0 24-48)	02 - Try Not To Breathe.flac	-4.150002	0.991129
what.cd/[1992] Automatic For The People (2005 DVD-A 2.0 24-48)	03 - The Sidewinder Sleeps Tonite.flac	-5.459999	1.000000
what.cd/[1992] Automatic For The People (2005 DVD-A 2.0 24-48)	04 - Everybody Hurts.flac	-4.959999	0.989800
what.cd/[1992] Automatic For The People (2005 DVD-A 2.0 24-48)	05 - New Orleans Instrumental No.1.flac	-0.590004	0.982636
what.cd/[1992] Automatic For The People (2005 DVD-A 2.0 24-48)	06 - Sweetness Follows.flac	-3.930000	1.000000
what.cd/[1992] Automatic For The People (2005 DVD-A 2.0 24-48)	07 - Money Got A Raw Deal.flac	-4.010002	1.000000
what.cd/[1992] Automatic For The People (2005 DVD-A 2.0 24-48)	08 - Ignoreland.flac	-6.779999	1.000000
what.cd/[1992] Automatic For The People (2005 DVD-A 2.0 24-48)	09 - Star Me Kitten.flac	-3.230003	1.000000
what.cd/[1992] Automatic For The People (2005 DVD-A 2.0 24-48)	10 - Man On The Moon.flac	-5.970001	1.000000
what.cd/[1992] Automatic For The People (2005 DVD-A 2.0 24-48)	11 - Nightswimming.flac	-4.949997	0.973507
what.cd/[1992] Automatic For The People (2005 DVD-A 2.0 24-48)	12 - Find The River.flac	-5.989998	1.000000
what.cd/1992 - The Longest Line [EP]	01 - The Death Of John Smith.flac	-5.370003	0.972015
what.cd/1992 - The Longest Line [EP]	02 - The Longest Line.flac	-4.090004	0.984344
what.cd/1992 - The Longest Line [EP]	03 - Stranded.flac	-6.160004	0.984375
what.cd/1992 - The Longest Line [EP]	04 - Remnants.flac	-7.419998	0.984375
what.cd/1992 - The Longest Line [EP]	05 - Kill All The White Man.flac	-8.669998	0.984375
what.cd/[1992] - White Trash, Two Heebs, And A Bean (FLAC)	01 - Soul Doubt.flac	-8.309998	0.953156
what.cd/[1992] - White Trash, Two Heebs, And A Bean (FLAC)	02 - Stickin In My Eye.flac	-7.699997	0.946564
what.cd/[1992] - White Trash, Two Heebs, And A Bean (FLAC)	03 - Bob.flac	-8.650002	0.948853
what.cd/[1992] - White Trash, Two Heebs, And A Bean (FLAC)	04 - You're Bleeding.flac	-7.910004	0.946564
what.cd/[1992] - White Trash, Two Heebs, And A Bean (FLAC)	05 - Straight Edge.flac	-4.090004	0.946564
what.cd/[1992] - White Trash, Two Heebs, And A Bean (FLAC)	06 - Liza and Louise.flac	-7.320000	0.953735
what.cd/[1992] - White Trash, Two Heebs, And A Bean (FLAC)	07 - The Bag.flac	-7.099998	0.950287
what.cd/[1992] - White Trash, Two Heebs, And A Bean (FLAC)	08 - Please Play This Song On The Radio.flac	-6.650002	0.948334
what.cd/[1992] - White Trash, Two Heebs, And A Bean (FLAC)	09 - Warm.flac	-7.260002	0.948364
what.cd/[1992] - White Trash, Two Heebs, And A Bean (FLAC)	10 - I Wanna Be Your Baby.flac	-7.379997	0.961365
what.cd/[1992] - White Trash, Two Heebs, And A Bean (FLAC)	11 - Johnny Appleseed.flac	-5.529999	0.962341
what.cd/[1992] - White Trash, Two Heebs, And A Bean (FLAC)	12 - She's Gone.flac	-8.080002	0.954071
what.cd/[1992] - White Trash, Two Heebs, And A Bean (FLAC)	13 - Buggley Eyes.flac	-1.239998	0.730927
what.cd/1993 - Chaos A.D	01 - Sepultura - Refuse , Resist.flac	-8.360001	0.999969
what.cd/1993 - Chaos A.D	02 - Sepultura - Territory.flac	-8.699997	0.999969
what.cd/1993 - Chaos A.D	03 - Sepultura - Slave New World.flac	-8.830002	0.999969
what.cd/1993 - Chaos A.D	04 - Sepultura - Amen.flac	-7.150002	0.999969
what.cd/1993 - Chaos A.D	05 - Sepultura - Kaiowas.flac	-2.739998	0.999969
what.cd/1993 - Chaos A.D	06 - Sepultura - Propaganda.flac	-7.730003	0.999969
what.cd/1993 - Chaos A.D	07 - Sepultura - Biotech Is Godzilla.flac	-8.260002	0.999969
what.cd/1993 - Chaos A.D	08 - Sepultura - Nomad.flac	-7.459999	0.999969
what.cd/1993 - Chaos A.D	09 - Sepultura - We Who Are Not As Others.flac	-6.940002	0.999969
what.cd/1993 - Chaos A.D	10 - Sepultura - Manifest.flac	-8.389999	0.999969
what.cd/1993 - Chaos A.D	11 - Sepultura - The Hunt.flac	-7.279999	0.999969
what.cd/1993 - Chaos A.D	12 - Sepultura - Clenched Fist.flac	-7.879997	0.999969
what.cd/1993 - Chaos A.D	13 - Sepultura - Talking Shit.flac	-1.080002	0.830963
what.cd/[1994] No Need To Argue	The Cranberries - 01 - Ode To My Family.flac	-5.220001	0.929840
what.cd/[1994] No Need To Argue	The Cranberries - 02 - I Can't Be with You.flac	-4.840004	0.939880
what.cd/[1994] No Need To Argue	The Cranberries - 03 - Twenty One.flac	-0.739998	0.910339
what.cd/[1994] No Need To Argue	The Cranberries - 04 - Zombie.flac	-6.209999	0.994232
what.cd/[1994] No Need To Argue	The Cranberries - 05 - Empty.flac	-4.330002	0.882599
what.cd/[1994] No Need To Argue	The Cranberries - 06 - Everything I Said.flac	-4.669998	0.953247
what.cd/[1994] No Need To Argue	The Cranberries - 07 - The Icicle Melts.flac	-5.860001	0.956787
what.cd/[1994] No Need To Argue	The Cranberries - 08 - Disappointment.flac	-3.470001	0.932800
what.cd/[1994] No Need To Argue	The Cranberries - 09 - Ridiculous Thoughts.flac	-5.040001	0.942749
what.cd/[1994] No Need To Argue	The Cranberries - 10 - Dreaming My Dreams.flac	-1.190002	0.921722
what.cd/[1994] No Need To Argue	The Cranberries - 11 - Yeat's Grave.flac	-5.349998	0.983856
what.cd/[1994] No Need To Argue	The Cranberries - 12 - Daffodil Lament.flac	-4.120003	0.966125
what.cd/[1994] No Need To Argue	The Cranberries - 13 - No Need To Argue.flac	0.980000	0.886658
what.cd/1996 - Losing Streak (FLAC)	00 - Less Than Jake - Untitled.flac	-5.199997	0.935944
what.cd/1996 - Losing Streak (FLAC)	01 - Less Than Jake - Automatic.flac	-12.379997	0.962860
what.cd/1996 - Losing Streak (FLAC)	02 - Less Than Jake - Happyman.flac	-11.150002	0.961823
what.cd/1996 - Losing Streak (FLAC)	03 - Less Than Jake - 9th At Pine.flac	-9.760002	0.960510
what.cd/1996 - Losing Streak (FLAC)	04 - Less Than Jake - Sugar In Your Gas Tank.flac	-11.699997	0.981964
what.cd/1996 - Losing Streak (FLAC)	05 - Less Than Jake - Shindo.flac	-11.070000	1.000000
what.cd/1996 - Losing Streak (FLAC)	06 - Less Than Jake - 107.flac	-12.150002	0.957733
what.cd/1996 - Losing Streak (FLAC)	07 - Less Than Jake - Johnny Quest Thinks We're Sellouts.flac	-11.900002	0.970459
what.cd/1996 - Losing Streak (FLAC)	08 - Less Than Jake - Krazy Glue.flac	-11.169998	0.981842
what.cd/1996 - Losing Streak (FLAC)	09 - Less Than Jake - Never Going Back To New Jersey.flac	-10.860001	0.950531
what.cd/1996 - Losing Streak (FLAC)	10 - Less Than Jake - How's My Driving Doug Hastings .flac	-12.269997	1.000000
what.cd/1996 - Losing Streak (FLAC)	11 - Less Than Jake - Just Like Frank.flac	-10.019997	0.946320
what.cd/1996 - Losing Streak (FLAC)	12 - Less Than Jake - Ask The Magic 8 Ball.flac	-10.940002	0.945068
what.cd/1996 - Losing Streak (FLAC)	13 - Less Than Jake - Dopeman.flac	-11.269997	0.949738
what.cd/1996 - Losing Streak (FLAC)	14 - Less Than Jake - Jen Doesn't Like Me Anymore.flac	-10.650002	0.957123
what.cd/1996 - Losing Streak (FLAC)	15 - Less Than Jake - Rock-n-Roll Pizzeria.flac	-11.459999	0.974579
what.cd/1996 - Losing Streak (FLAC)	16 - Less Than Jake - Lockdown.flac	-10.980003	0.962769
what.cd/1998 - 77 Days [FLAC]	01 - Heart Beat.flac	-7.870003	0.966064
what.cd/1998 - 77 Days [FLAC]	02 - PMA (Positive Mental Attitude).flac	-8.230003	0.966095
what.cd/1998 - 77 Days [FLAC]	03 - Minimum Wage.flac	-8.300003	0.966064
what.cd/1998 - 77 Days [FLAC]	04 - Ohichyo.flac	-8.110001	0.966034
what.cd/1998 - 77 Days [FLAC]	05 - Birthday.flac	-8.650002	0.966003
what.cd/1998 - 77 Days [FLAC]	06 - Nite Drive.flac	-7.260002	0.966034
what.cd/1998 - 77 Days [FLAC]	07 - What Else.flac	-8.090004	0.966064
what.cd/1998 - 77 Days [FLAC]	08 - Tiny Square Room.flac	-8.010002	0.966064
what.cd/1998 - 77 Days [FLAC]	09 - Lights and Shadows.flac	-7.690002	0.966125
what.cd/1998 - 77 Days [FLAC]	10 - Kanasimiyo.flac	-7.610001	0.966064
what.cd/1998 - 77 Days [FLAC]	11 - Second Chance.flac	-8.010002	0.966034
what.cd/1998 - 77 Days [FLAC]	12 - Father's Mountain.flac	-6.180000	0.966003
what.cd/1998 - 77 Days [FLAC]	13 - Secret.flac	-8.209999	0.966034
what.cd/1998 - 77 Days [FLAC]	14 - Along The Longest Way.flac	-7.590004	0.966064
what.cd/[1998] Oceanborn	Nightwish - 01 - Stargazers.flac	-10.050003	0.988647
what.cd/[1998] Oceanborn	Nightwish - 02 - Gethsemane.flac	-10.260002	0.988647
what.cd/[1998] Oceanborn	Nightwish - 03 - Devil & The Deep Dark Ocean.flac	-9.930000	0.988647
what.cd/[1998] Oceanborn	Nightwish - 04 - Sacrament Of Wilderness.flac	-9.570000	0.982788
what.cd/[1998] Oceanborn	Nightwish - 05 - Passion And The Opera.flac	-10.279999	0.982819
what.cd/[1998] Oceanborn	Nightwish - 06 - Swanheart.flac	-8.959999	0.982788
what.cd/[1998] Oceanborn	Nightwish - 07 - Moondance.flac	-10.970001	0.988647
what.cd/[1998] Oceanborn	Nightwish - 08 - The Riddler.flac	-10.180000	0.982819
what.cd/[1998] Oceanborn	Nightwish - 09 - The Pharaoh Sails To Orion.flac	-10.370003	0.988586
what.cd/[1998] Oceanborn	Nightwish - 10 - Walking In The Air.flac	-10.590004	0.988647
what.cd/[1998] Oceanborn	Nightwish - 11 - Sleeping Sun.flac	-8.250000	0.977478
what.cd/2003 - 1й круг	01 - 1й круг.flac	-10.419998	0.982269
what.cd/2003 - 1й круг	02 - В поисках рая.flac	-11.250000	0.982269
what.cd/2003 - 1й круг	03 - Вечное лето.flac	-10.489998	0.982269
what.cd/2003 - 1й круг	04 - Чужими глазами.flac	-12.160004	0.982269
what.cd/2003 - 1й круг	05 - Рост.flac	-10.629997	0.982269
what.cd/2003 - 1й круг	06 - Тоска.flac	-11.290001	0.982269
what.cd/2003 - 1й круг	07 - Черная весна.flac	-10.080002	0.982269
what.cd/2003 - 1й круг	08 - Право.flac	-10.110001	0.982269
what.cd/2003 - 1й круг	09 - Смерть моего тела.flac	-10.230003	0.982269
what.cd/2003 - 1й круг	10 - Зеленый дом.flac	-10.800003	0.982269
what.cd/2003 - 1й круг	11 - 24 часа.flac	-9.959999	0.982269
what.cd/2003 - 1й круг	12 - Тем кто умел летать.flac	-9.519997	0.982269
what.cd/2003 - 1й круг	13 - Безнадежен.flac	-10.129997	0.982269
what.cd/2003 - 1й круг	14 - Армагеддон.flac	-9.370003	0.982269
what.cd/2003 Just One More	01 Drinking For 11.flac	-8.279999	0.988708
what.cd/2003 Just One More	02 Contraband.flac	-10.320000	0.988708
what.cd/2003 Just One More	03 Villains.flac	-9.540001	0.988739
what.cd/2003 Just One More	04 Silence.flac	-10.430000	0.988708
what.cd/2003 Just One More	05 Just One More.flac	-9.680000	0.988647
what.cd/2003 Just One More	06 Day By Day.flac	-10.779999	0.988708
what.cd/2003 Just One More	07 Leavin.flac	-11.010002	0.988708
what.cd/2003 Just One More	08 Rockupation.flac	-10.230003	0.988708
what.cd/2003 Just One More	09 Last Breath.flac	-9.860001	0.988708
what.cd/2003 Just One More	10 Spare Change .flac	-8.220001	0.988708
what.cd/2003 Just One More	11 Riot.flac	-9.349998	0.988708
what.cd/2003 Just One More	12 10 West.flac	-9.940002	0.988739
what.cd/2003 Just One More	13 Good Intentions.flac	-10.690002	0.988739
what.cd/2003 Just One More	14 Wet Dog.flac	-10.230003	0.988708
what.cd/2003 Just One More	15 Game Show.flac	-10.379997	0.988708
what.cd/2003 Souvenirs	00 Telson.flac	-3.220001	0.944061
what.cd/2003 Souvenirs	01 These Good People.flac	-8.919998	1.000000
what.cd/2003 Souvenirs	02 Even The Spirits Are Afraid.flac	-8.620003	1.000000
what.cd/2003 Souvenirs	03 Broken Glass.flac	-9.510002	1.000000
what.cd/2003 Souvenirs	04 You Learn About It.flac	-8.010002	0.985199
what.cd/2003 Souvenirs	05 Souvenirs.flac	-8.650002	1.000000
what.cd/2003 Souvenirs	06 We Just Stopped Breathing.flac	-6.090004	1.000000
what.cd/2003 Souvenirs	07 Monsters.flac	-8.300003	0.996460
what.cd/2003 Souvenirs	08 Golden Grounds.flac	-6.250000	0.999969
what.cd/2003 Souvenirs	09 Jelena.flac	-4.760002	0.888092
what.cd/2003 Souvenirs	10 A Life All Mine.flac	-6.779999	0.998291
what.cd/2003 Souvenirs	11 Telson.flac	-3.260002	0.944092
what.cd/(2003) Through The Ashes Of Empires	01-Imperium.flac	-8.970001	1.000000
what.cd/(2003) Through The Ashes Of Empires	02-Bite The Bullet.flac	-9.970001	0.991333
what.cd/(2003) Through The Ashes Of Empires	03-Left Unfinished.flac	-10.010002	0.999969
what.cd/(2003) Through The Ashes Of Empires	04-Elegy.flac	-9.590004	0.988708
what.cd/(2003) Through The Ashes Of Empires	05-In The Presence Of My Enemies.flac	-8.779999	0.988708
what.cd/(2003) Through The Ashes Of Empires	06-Days Turn Blue To Gray.flac	-9.440002	1.000000
what.cd/(2003) Through The Ashes Of Empires	07-Vim.flac	-8.629997	0.988708
what.cd/(2003) Through The Ashes Of Empires	08-All Falls Down.flac	-9.379997	0.988708
what.cd/(2003) Through The Ashes Of Empires	09-Wipe The Tears.flac	-9.239998	0.988708
what.cd/(2003) Through The Ashes Of Empires	10-Descend The Shades Of Night.flac	-9.320000	0.988708
what.cd/2004 - Once	01 - Dark Chest of Wonders.flac	-8.150002	0.977234
what.cd/2004 - Once	02 - Wish I Had an Angel.flac	-8.320000	0.977264
what.cd/2004 - Once	03 - Nemo.flac	-8.209999	0.948792
what.cd/2004 - Once	04 - Planet Hell.flac	-8.320000	0.977264
what.cd/2004 - Once	05 - Creek Mary's Blood.flac	-8.459999	0.962128
what.cd/2004 - Once	06 - The Siren.flac	-8.760002	0.961853
what.cd/2004 - Once	07 - Dead Gardens.flac	-9.190002	0.977264
what.cd/2004 - Once	08 - Romanticide.flac	-9.980003	0.977264
what.cd/2004 - Once	09 - Ghost Love Score.flac	-9.440002	0.977264
what.cd/2004 - Once	10 - Kuolema Tekee Taiteilijan.flac	-3.360001	0.793579
what.cd/2004 - Once	11 - Higher Than Hope.flac	-9.050003	0.912628
what.cd/2004 The Silent Force [FLAC]	01 Intro.flac	-8.260002	0.988586
what.cd/2004 The Silent Force [FLAC]	02 See Who I Am.flac	-10.050003	1.000000
what.cd/2004 The Silent Force [FLAC]	03 Jillian (I'd Give My Heart).flac	-10.410004	0.988678
what.cd/2004 The Silent Force [FLAC]	04 Stand My Ground.flac	-10.919998	0.988678
what.cd/2004 The Silent Force [FLAC]	05 Pale.flac	-9.500000	0.988678
what.cd/2004 The Silent Force [FLAC]	06 Forsaken.flac	-9.849998	0.988678
what.cd/2004 The Silent Force [FLAC]	07 Angels.flac	-9.959999	0.988678
what.cd/2004 The Silent Force [FLAC]	08 Memories.flac	-9.279999	0.988586
what.cd/2004 The Silent Force [FLAC]	09 Aquarius.flac	-11.010002	0.988678
what.cd/2004 The Silent Force [FLAC]	10 It's The Fear.flac	-9.800003	0.988678
what.cd/2004 The Silent Force [FLAC]	11 Somewhere.flac	-8.220001	0.986053
what.cd/[2005] Whatever People Say I Am, That's What I'm Not	01 - Arctic Monkeys - The View From The Afternoon.flac	-9.340004	0.999084
what.cd/[2005] Whatever People Say I Am, That's What I'm Not	02 - Arctic Monkeys - I Bet You Look Good On The Dancefloor.flac	-9.220001	0.999084
what.cd/[2005] Whatever People Say I Am, That's What I'm Not	03 - Arctic Monkeys - Fake Tales Of San Fransisco.flac	-9.809998	0.999115
what.cd/[2005] Whatever People Say I Am, That's What I'm Not	04 - Arctic Monkeys - Dancing Shoes.flac	-9.480003	0.999115
what.cd/[2005] Whatever People Say I Am, That's What I'm Not	05 - Arctic Monkeys - You Probably Couldn't See For The Lights But You Were Staring Straight At Me.flac	-8.970001	0.999451
what.cd/[2005] Whatever People Say I Am, That's What I'm Not	06 - Arctic Monkeys - Still Take You Home.flac	-9.590004	0.999115
what.cd/[2005] Whatever People Say I Am, That's What I'm Not	07 - Arctic Monkeys - Riot Van.flac	-2.199997	0.999054
what.cd/[2005] Whatever People Say I Am, That's What I'm Not	08 - Arctic Monkeys - Red Light Indicates Doors Are Secured.flac	-9.400002	0.999115
what.cd/[2005] Whatever People Say I Am, That's What I'm Not	09 - Arctic Monkeys - Mardy Bum.flac	-8.599998	0.999146
what.cd/[2005] Whatever People Say I Am, That's What I'm Not	10 - Arctic Monkeys - Perhaps Vampires Is a Bit Strong But....flac	-9.260002	0.999146
what.cd/[2005] Whatever People Say I Am, That's What I'm Not	11 - Arctic Monkeys - When The Sun Goes Down.flac	-9.480003	0.999115
what.cd/[2005] Whatever People Say I Am, That's What I'm Not	12 - Arctic Monkeys - From The Ritz To The Rubble.flac	-9.190002	0.999115
what.cd/[2005] Whatever People Say I Am, That's What I'm Not	13 - Arctic Monkeys - A Certain Romance.flac	-8.699997	0.999207
what.cd/2006 - Never Trust A Hippy [EP]	01 - Seeing Double At The Triple Rock.flac	-9.739998	0.977264
what.cd/2006 - Never Trust A Hippy [EP]	02 - The Marxist Brothers.flac	-8.160004	0.977295
what.cd/2006 - Never Trust A Hippy [EP]	03 - Golden Boys.flac	-9.830002	0.977264
what.cd/2006 - Never Trust A Hippy [EP]	04 - You're Wrong.flac	-6.029999	0.977264
what.cd/2006 - Never Trust A Hippy [EP]	05 - Everything In Moderation (Especially Moderation).flac	-9.010002	0.977264
what.cd/2006 - Never Trust A Hippy [EP]	06 - I'm Going To Hell For This One.flac	-9.959999	0.977295
what.cd/(2007) - Chronichitis {FLAC}	01 Anywhere I Go.flac	-7.160004	0.988556
what.cd/(2007) - Chronichitis {FLAC}	02 The Otherside (feat. Guru).flac	-7.370003	0.988556
what.cd/(2007) - Chronichitis {FLAC}	03 Hold On To The One.flac	-8.760002	0.999786
what.cd/(2007) - Chronichitis {FLAC}	04 2 AM.flac	-7.480003	0.999786
what.cd/(2007) - Chronichitis {FLAC}	05 Blood Of My Blood.flac	-8.830002	0.999786
what.cd/(2007) - Chronichitis {FLAC}	06 Nobody Knows.flac	-8.480003	0.999786
what.cd/(2007) - Chronichitis {FLAC}	07 Above The Clouds.flac	-7.440002	0.999786
what.cd/(2007) - Chronichitis {FLAC}	08 Digital.flac	-8.860001	0.999786
what.cd/(2007) - Chronichitis {FLAC}	09 Round The World.flac	-6.690002	0.999786
what.cd/(2007) - Chronichitis {FLAC}	10 Baby I Like It (feat. G Love).flac	-9.139999	0.946594
what.cd/(2007) - Chronichitis {FLAC}	11 Ocean.flac	-8.720001	0.988556
what.cd/(2007) - Chronichitis {FLAC}	12 Jimi.flac	-9.260002	0.988556
what.cd/(2007) - Chronichitis {FLAC}	13 Breakbeat (feat. DJ Hellnaw).flac	-7.599998	0.999786
what.cd/(2007) - Chronichitis {FLAC}	14 Mind On Your Music.flac	-8.570000	0.999786
what.cd/(2007) - Chronichitis {FLAC}	15 Ever Really Wanted (feat. Angelo Moore).flac	-7.970001	0.988556
what.cd/(2007) - Chronichitis {FLAC}	16 Girl U So Fine Pt. 1,Pt. 2 (feat. Toko Tasi).flac	-8.959999	1.000000
what.cd/(2007) - Chronichitis {FLAC}	17 Reward For Me.flac	-6.959999	0.988556
what.cd/2008 - The Art Of Saying Nothing	01 - Untouchable.flac	-9.800003	0.996735
what.cd/2008 - The Art Of Saying Nothing	02 - Man On The Street.flac	-10.040001	0.999390
what.cd/2008 - The Art Of Saying Nothing	03 - In A Letter.flac	-10.050003	0.992676
what.cd/2008 - The Art Of Saying Nothing	04 - Jenny.flac	-10.709999	0.991333
what.cd/2008 - The Art Of Saying Nothing	05 - The Beast.flac	-11.730003	0.992096
what.cd/2008 - The Art Of Saying Nothing	06 - Alperton.flac	-8.209999	0.993134
what.cd/2008 - The Art Of Saying Nothing	07 - Beer Belly.flac	-9.809998	0.991821
what.cd/2008 - The Art Of Saying Nothing	08 - The Landlord's Daughter.flac	-11.250000	0.993347
what.cd/2008 - The Art Of Saying Nothing	09 - Great British Summertime.flac	-11.910004	0.999451
what.cd/2008 - The Art Of Saying Nothing	10 - First Past The Pump.flac	-9.940002	0.990997
what.cd/2008 - The Art Of Saying Nothing	11 - King Of Kings.flac	-10.660004	0.990692
what.cd/2008 - The Art Of Saying Nothing	12 - Sombrero.flac	-8.919998	1.000000
what.cd/2010 - Immersion	01 - Genesis.flac	-8.750000	0.957275
what.cd/2010 - Immersion	02 - Salt In The Wounds.flac	-9.129997	1.000000
what.cd/2010 - Immersion	03 - Watercolour.flac	-8.080002	0.997803
what.cd/2010 - Immersion	04 - Set Me On Fire.flac	-7.370003	0.997864
what.cd/2010 - Immersion	05 - Crush.flac	-10.150002	0.997894
what.cd/2010 - Immersion	06 - Under The Waves.flac	-8.400002	0.997833
what.cd/2010 - Immersion	07 - Immunize (feat. Liam H).flac	-9.919998	0.997894
what.cd/2010 - Immersion	08 - The Island - Pt. I (Dawn).flac	-8.900002	0.997894
what.cd/2010 - Immersion	09 - The Island - Pt. 2 (Dusk).flac	-9.419998	0.997864
what.cd/2010 - Immersion	10 - Comprachicos.flac	-10.230003	0.997894
what.cd/2010 - Immersion	11 - The Vulture.flac	-10.050003	0.998047
what.cd/2010 - Immersion	12 - Witchcraft.flac	-11.279999	1.000000
what.cd/2010 - Immersion	13 - Self vs Self (feat. In Flames).flac	-11.349998	0.997925
what.cd/2010 - Immersion	14 - The Fountain (feat. Steve Wilson).flac	-10.629997	0.997894
what.cd/2010 - Immersion	15 - Encoder.flac	-8.970001	0.997772
what.cd/[2011] Sunny Side Of The Street	01 - Sunny Side Of The Street.flac	-7.639999	0.977203
what.cd/[2011] Sunny Side Of The Street	02 - Sunny Side Of The Street (Sonic Scribe Remix).flac	-7.309998	0.977203
what.cd/[2011] Sunny Side Of The Street	03 - Sunny Side Of The Street (Demo).flac	-9.040001	0.977203
what.cd/[2013] MC Rises (FLAC)	01 - MC Rises.flac	-7.300003	1.000000
what.cd/[2013] MC Rises (FLAC)	02 - The Devlin Manor of Speech.flac	-5.570000	0.999969
what.cd/[2013] MC Rises (FLAC)	03 - Bat Swoops Down.flac	-6.639999	0.997559
what.cd/[2013] MC Rises (FLAC)	04 - One Solid Connection.flac	-7.650002	0.999969
what.cd/[2013] MC Rises (FLAC)	05 - High Chieftain.flac	-6.269997	1.000000
what.cd/[2013] MC Rises (FLAC)	06 - Super Solar Prominence.flac	-7.669998	1.000000
what.cd/[2013] MC Rises (FLAC)	07 - Conduct the Madness.flac	-7.620003	1.000000
what.cd/[2013] MC Rises (FLAC)	08 - Otras Dimensiones.flac	-8.330002	1.000000
what.cd/[2013] MC Rises (FLAC)	09 - Atop an Ice Cap.flac	-6.690002	1.000000
what.cd/[2013] MC Rises (FLAC)	10 - Clash of the Staves.flac	-6.669998	0.999969
what.cd/[2013] MC Rises (FLAC)	11 - All Men Are Brothers.flac	-6.419998	0.999969
what.cd/[2013] MC Rises (FLAC)	12 - A Knight Amidst Chaos.flac	-5.989998	1.000000
what.cd/[2013] MC Rises (FLAC)	13 - Ghost Band.flac	-5.590004	0.999908
what.cd/(2015) - Slightly Stoopid - Meanwhile... Back in the Lab {FLAC}	01 Dabbington.flac	-9.320000	1.000000
what.cd/(2015) - Slightly Stoopid - Meanwhile... Back in the Lab {FLAC}	02 This Version.flac	-5.750000	1.000000
what.cd/(2015) - Slightly Stoopid - Meanwhile... Back in the Lab {FLAC}	03 The Prophet.flac	-8.090004	1.000000
what.cd/(2015) - Slightly Stoopid - Meanwhile... Back in the Lab {FLAC}	04 Hold It Down.flac	-9.019997	1.000000
what.cd/(2015) - Slightly Stoopid - Meanwhile... Back in the Lab {FLAC}	05 Fades Away.flac	-5.849998	1.000000
what.cd/(2015) - Slightly Stoopid - Meanwhile... Back in the Lab {FLAC}	06 Fuck You ft. Beardo.flac	-11.370003	1.000000
what.cd/(2015) - Slightly Stoopid - Meanwhile... Back in the Lab {FLAC}	07 Time Won't Wait.flac	-9.309998	1.000000
what.cd/(2015) - Slightly Stoopid - Meanwhile... Back in the Lab {FLAC}	08 Rolling Stone.flac	-8.830002	1.000000
what.cd/(2015) - Slightly Stoopid - Meanwhile... Back in the Lab {FLAC}	09 Guns In Paradise.flac	-9.120003	1.000000
what.cd/(2015) - Slightly Stoopid - Meanwhile... Back in the Lab {FLAC}	10 Come Around.flac	-8.750000	1.000000
what.cd/(2015) - Slightly Stoopid - Meanwhile... Back in the Lab {FLAC}	11 Call Me Crazy.flac	-8.870003	1.000000
what.cd/(2015) - Slightly Stoopid - Meanwhile... Back in the Lab {FLAC}	12 One Bright Day ft. Angela Hunte.flac	-6.680000	1.000000
what.cd/(2015) - Slightly Stoopid - Meanwhile... Back in the Lab {FLAC}	13 Life Rolls On.flac	-8.550003	1.000000
what.cd/(2015) - Slightly Stoopid - Meanwhile... Back in the Lab {FLAC}	14 What Your Friends Say.flac	-6.940002	1.000000
what.cd/311 - 311	01 - Down.flac	-6.519997	0.933258
what.cd/311 - 311	02 - Random.flac	-5.040001	0.988556
what.cd/311 - 311	03 - Jackolantern's Weather.flac	-5.949997	0.933258
what.cd/311 - 311	04 - All Mixed Up.flac	-4.660004	0.988556
what.cd/311 - 311	05 - Hive.flac	-7.849998	0.944061
what.cd/311 - 311	06 - Guns (Are For Pussies).flac	-6.699997	0.988556
what.cd/311 - 311	07 - Misdirected Hostility.flac	-6.930000	0.989502
what.cd/311 - 311	08 - Purpose.flac	-5.480003	0.988556
what.cd/311 - 311	09 - Loco.flac	-6.669998	0.988556
what.cd/311 - 311	10 - Brodels.flac	-6.180000	0.988556
what.cd/311 - 311	11 - Don't Stay Home.flac	-7.190002	0.944061
what.cd/311 - 311	12 - Dlmd.flac	-6.660004	0.988556
what.cd/311 - 311	13 - Sweet.flac	-5.590004	0.988556
what.cd/311 - 311	14 - T & P Combo.flac	-9.489998	0.944092
what.cd/311 - From Chaos	01 - You Get Worked.flac	-7.220001	0.988647
what.cd/311 - From Chaos	02 - Sick Tight.flac	-7.620003	0.988647
what.cd/311 - From Chaos	03 - You Wouldn't Believe.flac	-8.620003	0.988647
what.cd/311 - From Chaos	04 - Full Ride.flac	-7.129997	0.988647
what.cd/311 - From Chaos	05 - From Chaos.flac	-7.629997	0.988647
what.cd/311 - From Chaos	06 - I Told Myself.flac	-8.260002	0.988647
what.cd/311 - From Chaos	07 - Champagne.flac	-4.650002	0.881165
what.cd/311 - From Chaos	08 - Hostile Apostle.flac	-7.840004	0.988647
what.cd/311 - From Chaos	09 - Wake Your Mind Up.flac	-8.879997	0.988647
what.cd/311 - From Chaos	10 - Amber.flac	-5.959999	0.988647
what.cd/311 - From Chaos	11 - Uncalm.flac	-6.989998	0.988647
what.cd/311 - From Chaos	12 - I'll Be Here Awhile.flac	-6.340004	0.988647
what.cd/311 - Grassroots	01 - Homebrew.flac	-5.150002	0.956543
what.cd/311 - Grassroots	02 - Lucky.flac	-4.449997	0.955139
what.cd/311 - Grassroots	03 - Nutsymtom.flac	-5.279999	0.950867
what.cd/311 - Grassroots	04 - 8-16 AM.flac	-2.550003	0.933594
what.cd/311 - Grassroots	05 - Omaha Stylee.flac	-5.620003	0.980804
what.cd/311 - Grassroots	06 - Applied Science.flac	-6.449997	0.965668
what.cd/311 - Grassroots	07 - Taiyed.flac	-6.120003	0.953491
what.cd/311 - Grassroots	08 - Silver.flac	-6.910004	0.980377
what.cd/311 - Grassroots	09 - Grassroots.flac	-5.150002	0.969391
what.cd/311 - Grassroots	10 - Salsa.flac	-6.739998	0.980164
what.cd/311 - Grassroots	11 - Lose.flac	-3.169998	0.979034
what.cd/311 - Grassroots	12 - Six.flac	-6.629997	0.983368
what.cd/311 - Grassroots	13 - Offbeat Bare Ass.flac	-7.169998	0.972290
what.cd/311 - Grassroots	14 - 1,2,3.flac	-5.540001	0.940857
what.cd/65daysofstatic - The Fall Of Math	01 - 65daysofstatic - Another Code Against The Gone.flac	-10.239998	0.998993
what.cd/65daysofstatic - The Fall Of Math	02 - 65daysofstatic - Install A Beak In The Heart That Clucks Time In Arabic.flac	-9.449997	1.000000
what.cd/65daysofstatic - The Fall Of Math	03 - 65daysofstatic - Retreat! Retreat!.flac	-12.340004	1.000000
what.cd/65daysofstatic - The Fall Of Math	04 - 65daysofstatic - Default This.flac	-13.430000	0.817505
what.cd/65daysofstatic - The Fall Of Math	05 - 65daysofstatic - I Swallowed Hard, Like I Understood.flac	-11.019997	1.000000
what.cd/65daysofstatic - The Fall Of Math	06 - 65daysofstatic - The Fall of Math.flac	-11.570000	1.000000
what.cd/65daysofstatic - The Fall Of Math	07 - 65daysofstatic - The Cat Is A Landmine.flac	-11.930000	1.000000
what.cd/65daysofstatic - The Fall Of Math	08 - 65daysofstatic - The Last Home Recording.flac	-7.230003	0.888153
what.cd/65daysofstatic - The Fall Of Math	09 - 65daysofstatic - Hole.flac	-10.949997	1.000000
what.cd/65daysofstatic - The Fall Of Math	10 - 65daysofstatic - Fix The Sky A Little.flac	-10.389999	1.000000
what.cd/65daysofstatic - The Fall Of Math	11 - 65daysofstatic - Aren't We All Running .flac	-11.449997	1.000000
what.cd/7paca - Kacheli [FLAC]	01 - Оставь нам боль.flac	-11.389999	0.982269
what.cd/7paca - Kacheli [FLAC]	02 - Качели.flac	-11.209999	0.982269
what.cd/7paca - Kacheli [FLAC]	03 - Нечаянно.flac	-11.070000	0.982269
what.cd/7paca - Kacheli [FLAC]	04 - Топливо.flac	-11.120003	0.982269
what.cd/7paca - Kacheli [FLAC]	05 - Враг культуры.flac	-11.860001	0.982269
what.cd/7paca - Kacheli [FLAC]	06 - Ты или Я.flac	-11.160004	0.982269
what.cd/7paca - Kacheli [FLAC]	07 - xxx.flac	2.689999	0.819641
what.cd/7paca - Kacheli [FLAC]	08 - Е.А..flac	-12.830002	0.982269
what.cd/7paca - Kacheli [FLAC]	09 - Подъём.flac	-11.870003	0.982269
what.cd/7paca - Kacheli [FLAC]	10 - Солдат.flac	-10.919998	0.982269
what.cd/7paca - Kacheli [FLAC]	11 - Люди гибнут за попс.flac	-11.540001	0.982269
what.cd/7paca - Kacheli [FLAC]	12 - Нет сомнений.flac	-10.779999	0.982269
what.cd/7paca - Kacheli [FLAC]	13 - Три цвета.flac	-9.980003	0.982269
what.cd/7paca - Kacheli [FLAC]	14 - Теперь всё будет хорошо.flac	-11.340004	0.982269
what.cd/7paca - Kacheli [FLAC]	15 - Революция.flac	-4.639999	0.875458
what.cd/99sor	01. Streetlight Manifesto - Birds Flying Away.flac	-10.690002	0.991394
what.cd/99sor	02. Streetlight Manifesto - Hell.flac	-9.650002	0.991364
what.cd/99sor	03. Streetlight Manifesto - Just.flac	-10.650002	0.991364
what.cd/99sor	04. Streetlight Manifesto - Skyscraper.flac	-9.559998	0.991455
what.cd/99sor	05. Streetlight Manifesto - Punk Rock Girl.flac	-10.230003	0.991394
what.cd/99sor	06. Streetlight Manifesto - Linoleum.flac	-9.580002	0.991394
what.cd/99sor	07. Streetlight Manifesto - Me and Julio Down by the Schoolyard.flac	-10.209999	0.991364
what.cd/99sor	08. Streetlight Manifesto - They Provide The Paint for The Picture-Perfect Masterpiece That You Will Paint on the Insides of Your Eyelids.flac	-9.519997	0.991333
what.cd/99sor	09. Streetlight Manifesto - Red Rubber Ball.flac	-9.500000	0.991394
what.cd/99sor	10. Streetlight Manifesto - The Troubador.flac	-9.599998	0.991333
what.cd/99sor	11. Streetlight Manifesto - Such Great Heights.flac	-10.489998	0.991394
what.cd/Abney Park - Lost Horizons (2008)	01 - Airship Pirate.flac	-9.000000	0.988617
what.cd/Abney Park - Lost Horizons (2008)	02 - The Emperor's Wives.flac	-7.580002	0.988617
what.cd/Abney Park - Lost Horizons (2008)	03 - Sleep Isabella.flac	-5.120003	0.988617
what.cd/Abney Park - Lost Horizons (2008)	04 - She.flac	-7.540001	0.988617
what.cd/Abney Park - Lost Horizons (2008)	05 - The Secret Life of Dr Calgori.flac	-5.750000	0.988617
what.cd/Abney Park - Lost Horizons (2008)	06 - This Dark and Twisty Road.flac	-7.510002	0.988617
what.cd/Abney Park - Lost Horizons (2008)	07 - Herr Drosselmyers Doll.flac	-4.889999	0.988617
what.cd/Abney Park - Lost Horizons (2008)	08 - Virus.flac	-5.110001	0.988617
what.cd/Abney Park - Lost Horizons (2008)	09 - I am Stretched on Your Grave.flac	-7.260002	0.988617
what.cd/Abney Park - Lost Horizons (2008)	10 - Post Apocolapse Punk.flac	-8.580002	0.988617
what.cd/Abney Park - Lost Horizons (2008)	11 - Hidden Track.flac	-3.389999	0.988617
what.cd/ Acoustic Ladyland - 2006 - Skinny Grin	01 - Road of Bones .flac	-9.599998	0.998901
what.cd/ Acoustic Ladyland - 2006 - Skinny Grin	02 - New Me .flac	-11.410004	0.998901
what.cd/ Acoustic Ladyland - 2006 - Skinny Grin	03 - Red Sky .flac	-9.099998	0.998901
what.cd/ Acoustic Ladyland - 2006 - Skinny Grin	04 - Paris .flac	-11.739998	0.998901
what.cd/ Acoustic Ladyland - 2006 - Skinny Grin	05 - Your Shame .flac	-10.059998	0.998901
what.cd/ Acoustic Ladyland - 2006 - Skinny Grin	06 - Skinny Grin .flac	-9.709999	0.998901
what.cd/ Acoustic Ladyland - 2006 - Skinny Grin	07 - Salt Water (Scott Walker mix) .flac	-9.010002	0.998901
what.cd/ Acoustic Ladyland - 2006 - Skinny Grin	08 - Cuts & Lies .flac	-10.830002	0.998901
what.cd/ Acoustic Ladyland - 2006 - Skinny Grin	09 - Glass Agenda .flac	-9.750000	0.998901
what.cd/ Acoustic Ladyland - 2006 - Skinny Grin	10 - That Night .flac	-9.889999	0.998901
what.cd/ Acoustic Ladyland - 2006 - Skinny Grin	11 - The Rise .flac	-8.000000	0.998901
what.cd/ Acoustic Ladyland - 2006 - Skinny Grin	12 - The Room .flac	-9.750000	0.998901
what.cd/ Acoustic Ladyland - 2006 - Skinny Grin	13 - Hitting Home .flac	-7.980003	0.998901
what.cd/Against All Authority - All Fall Down (FLAC)	01 - All Fall Down.flac	-10.650002	0.988556
what.cd/Against All Authority - All Fall Down (FLAC)	02 - 12-00 AM.flac	-9.849998	0.988556
what.cd/Against All Authority - All Fall Down (FLAC)	03 - Justification.flac	-10.199997	0.988708
what.cd/Against All Authority - All Fall Down (FLAC)	04 - Keep Trying.flac	-10.340004	0.988556
what.cd/Against All Authority - All Fall Down (FLAC)	05 - At Our Expense.flac	-9.959999	0.988556
what.cd/Against All Authority - All Fall Down (FLAC)	06 - Stand in Line.flac	-10.849998	0.988556
what.cd/Against All Authority - All Fall Down (FLAC)	07 - Toby.flac	-10.629997	0.988556
what.cd/Against All Authority - All Fall Down (FLAC)	08 - We Don't Need You.flac	-10.090004	0.988556
what.cd/Against All Authority - All Fall Down (FLAC)	09 - The Mayhem & The Pain.flac	-10.750000	0.988556
what.cd/Against All Authority - All Fall Down (FLAC)	10 - Louder Than Words.flac	-10.989998	0.988556
what.cd/Against All Authority - All Fall Down (FLAC)	11 - What the Fuck'd You Expect .flac	-10.669998	0.988739
what.cd/Against All Authority - All Fall Down (FLAC)	12 - Daddy's Little Girl.flac	-10.430000	0.933685
what.cd/Against All Authority - All Fall Down (FLAC)	13 - Sk8 Rock.flac	-11.349998	0.988556
what.cd/Against All Authority - All Fall Down (FLAC)	14 - Watered Down & Passive.flac	-9.550003	0.988586
what.cd/Against All Authority - All Fall Down (FLAC)	15 - When the Rain Begins to Fall.flac	-10.430000	0.988556
what.cd/Agnostic Front -1998- Something's Gotta Give (FLAC)	Agnostic Front -01- Something's Gotta Give.flac	-9.349998	0.993011
what.cd/Agnostic Front -1998- Something's Gotta Give (FLAC)	Agnostic Front -02- Believe.flac	-9.879997	0.987396
what.cd/Agnostic Front -1998- Something's Gotta Give (FLAC)	Agnostic Front -03- Gotta Go.flac	-10.080002	0.993073
what.cd/Agnostic Front -1998- Something's Gotta Give (FLAC)	Agnostic Front -04- Before My Eyes.flac	-9.330002	0.971313
what.cd/Agnostic Front -1998- Something's Gotta Give (FLAC)	Agnostic Front -05- No Fear.flac	-9.010002	0.974884
what.cd/Agnostic Front -1998- Something's Gotta Give (FLAC)	Agnostic Front -06- Blinded.flac	-9.190002	0.989319
what.cd/Agnostic Front -1998- Something's Gotta Give (FLAC)	Agnostic Front -07- Voices.flac	-9.230003	0.980530
what.cd/Agnostic Front -1998- Something's Gotta Give (FLAC)	Agnostic Front -08- Do Or Die.flac	-9.900002	0.990967
what.cd/Agnostic Front -1998- Something's Gotta Give (FLAC)	Agnostic Front -09- My War.flac	-8.980003	0.992676
what.cd/Agnostic Front -1998- Something's Gotta Give (FLAC)	Agnostic Front -10- Bloodsucker.flac	-9.160004	0.992279
what.cd/Agnostic Front -1998- Something's Gotta Give (FLAC)	Agnostic Front -11- The Blame.flac	-9.980003	0.990967
what.cd/Agnostic Front -1998- Something's Gotta Give (FLAC)	Agnostic Front -12- Today, Tomorrow, Forever.flac	-9.680000	0.977173
what.cd/Agnostic Front -1998- Something's Gotta Give (FLAC)	Agnostic Front -13- Rage.flac	-8.559998	0.970062
what.cd/Agnostic Front -1998- Something's Gotta Give (FLAC)	Agnostic Front -14- Pauly The Dog.flac	-4.169998	0.613373
what.cd/Agnostic Front -1998- Something's Gotta Give (FLAC)	Agnostic Front -15- Crucified.flac	-8.349998	0.973328
what.cd/All That Remains - Overcome (2008) [FLAC]	01 - Before the Damned.flac	-10.099998	0.965881
what.cd/All That Remains - Overcome (2008) [FLAC]	02 - Two Weeks.flac	-9.830002	0.965881
what.cd/All That Remains - Overcome (2008) [FLAC]	03 - Undone.flac	-9.500000	0.965881
what.cd/All That Remains - Overcome (2008) [FLAC]	04 - Forever in Your Hands.flac	-9.750000	0.965881
what.cd/All That Remains - Overcome (2008) [FLAC]	05 - Chiron.flac	-9.010002	0.965881
what.cd/All That Remains - Overcome (2008) [FLAC]	06 - Days Without.flac	-9.010002	0.965881
what.cd/All That Remains - Overcome (2008) [FLAC]	07 - A Song for the Hopeless.flac	-9.660004	0.965881
what.cd/All That Remains - Overcome (2008) [FLAC]	08 - Do Not Obey.flac	-8.580002	0.999847
what.cd/All That Remains - Overcome (2008) [FLAC]	09 - Relinquish.flac	-9.449997	0.965881
what.cd/All That Remains - Overcome (2008) [FLAC]	10 - Overcome.flac	-9.099998	0.965881
what.cd/All That Remains - Overcome (2008) [FLAC]	11 - Believe in Nothing.flac	-9.230003	0.965881
what.cd/All That Remains - The Fall Of Ideals - FLAC	01 This Calling.flac	-10.800003	0.966614
what.cd/All That Remains - The Fall Of Ideals - FLAC	02 Not Alone.flac	-10.910004	0.966675
what.cd/All That Remains - The Fall Of Ideals - FLAC	03 It Dwells In Me.flac	-10.279999	0.966766
what.cd/All That Remains - The Fall Of Ideals - FLAC	04 We Stand.flac	-11.129997	0.966644
what.cd/All That Remains - The Fall Of Ideals - FLAC	05 Whispers (I Hear Your).flac	-10.730003	0.966614
what.cd/All That Remains - The Fall Of Ideals - FLAC	06 The Weak Willed.flac	-10.070000	0.966766
what.cd/All That Remains - The Fall Of Ideals - FLAC	07 Six.flac	-10.550003	0.966583
what.cd/All That Remains - The Fall Of Ideals - FLAC	08 Become The Catalyst.flac	-10.510002	0.966614
what.cd/All That Remains - The Fall Of Ideals - FLAC	09 The Air That I Breathe.flac	-10.110001	0.966583
what.cd/All That Remains - The Fall Of Ideals - FLAC	10 Empty Inside.flac	-10.830002	0.966675
what.cd/All That Remains - The Fall Of Ideals - FLAC	11 Indictment.flac	-9.739998	0.966644
what.cd/Animals As Leaders - Animals As Ledars [2009] [FLAC]	01 - Tempting Time.flac	-8.690002	1.000000
what.cd/Animals As Leaders - Animals As Ledars [2009] [FLAC]	02 - Soraya.flac	-7.480003	1.000000
what.cd/Animals As Leaders - Animals As Ledars [2009] [FLAC]	03 - Thoroughly at Home.flac	-7.830002	1.000000
what.cd/Animals As Leaders - Animals As Ledars [2009] [FLAC]	04 - On Impulse.flac	-7.949997	1.000000
what.cd/Animals As Leaders - Animals As Ledars [2009] [FLAC]	05 - Tessitura.flac	-6.989998	1.000000
what.cd/Animals As Leaders - Animals As Ledars [2009] [FLAC]	06 - Behaving Badly.flac	-9.129997	1.000000
what.cd/Animals As Leaders - Animals As Ledars [2009] [FLAC]	07 - The Price of Everything and the Value of Nothing.flac	-8.010002	1.000000
what.cd/Animals As Leaders - Animals As Ledars [2009] [FLAC]	08 - CAFO.flac	-6.320000	1.000000
what.cd/Animals As Leaders - Animals As Ledars [2009] [FLAC]	09 - Inamorata.flac	-7.440002	1.000000
what.cd/Animals As Leaders - Animals As Ledars [2009] [FLAC]	10 - Point to Point.flac	-6.769997	1.000000
what.cd/Animals As Leaders - Animals As Ledars [2009] [FLAC]	11 - Modern Meat.flac	-3.970001	1.000000
what.cd/Animals As Leaders - Animals As Ledars [2009] [FLAC]	12 - Song of Solomon.flac	-8.739998	1.000000
what.cd/ANTI-FLAG - FOR BLOOD AND EMPIRE [2006][FLAC]	01. ANTI-FLAG - I'D TELL YOU BUT....flac	-10.209999	0.997711
what.cd/ANTI-FLAG - FOR BLOOD AND EMPIRE [2006][FLAC]	02. ANTI-FLAG - THEPRESS CORPSE.flac	-10.300003	0.998596
what.cd/ANTI-FLAG - FOR BLOOD AND EMPIRE [2006][FLAC]	03. ANTI-FLAG - EMIGRE.flac	-10.120003	0.998657
what.cd/ANTI-FLAG - FOR BLOOD AND EMPIRE [2006][FLAC]	04. ANTI-FLAG - THE PROJECT FOR A NEW AMERICAN CENTURY.flac	-9.750000	0.998657
what.cd/ANTI-FLAG - FOR BLOOD AND EMPIRE [2006][FLAC]	05. ANTI-FLAG - HYMN FOR THE DEAD.flac	-9.550003	0.998230
what.cd/ANTI-FLAG - FOR BLOOD AND EMPIRE [2006][FLAC]	06. ANTI-FLAG - THIS IS THE END (FOR YOU MY FRIEND).flac	-10.660004	0.997711
what.cd/ANTI-FLAG - FOR BLOOD AND EMPIRE [2006][FLAC]	07. ANTI-FLAG - 1 TRILLION DOLLAR$.flac	-10.199997	0.997711
what.cd/ANTI-FLAG - FOR BLOOD AND EMPIRE [2006][FLAC]	08. ANTI-FLAG - STATE FUNERAL.flac	-9.529999	0.997711
what.cd/ANTI-FLAG - FOR BLOOD AND EMPIRE [2006][FLAC]	09. ANTI-FLAG - CONFESSIONS OF AN ECONOMIC HIT MAN.flac	-10.449997	0.998138
what.cd/ANTI-FLAG - FOR BLOOD AND EMPIRE [2006][FLAC]	10. ANTI-FLAG - WAR SUCKS, LET'S PARTY !.flac	-10.080002	0.997711
what.cd/ANTI-FLAG - FOR BLOOD AND EMPIRE [2006][FLAC]	11. ANTI-FLAG - THE W.T.O. KILLS FARMERS.flac	-11.040001	0.997711
what.cd/ANTI-FLAG - FOR BLOOD AND EMPIRE [2006][FLAC]	12. ANTI-FLAG - CITIES BURN.flac	-10.199997	0.997833
what.cd/ANTI-FLAG - FOR BLOOD AND EMPIRE [2006][FLAC]	13. ANTI-FLAG - DEPLETED URANIUM IS A WAR CRIME.flac	-11.610001	0.998718
what.cd/A Perfect Circle - eMOTIVe [2004] [FLAC]	01. Annihilation.flac	-2.599998	0.816589
what.cd/A Perfect Circle - eMOTIVe [2004] [FLAC]	02. Imagine.flac	-8.459999	0.988556
what.cd/A Perfect Circle - eMOTIVe [2004] [FLAC]	03. Peace, Love and Understanding.flac	-6.410004	0.988556
what.cd/A Perfect Circle - eMOTIVe [2004] [FLAC]	04. What's Going On.flac	-8.000000	0.988556
what.cd/A Perfect Circle - eMOTIVe [2004] [FLAC]	05. Passive.flac	-9.989998	0.988556
what.cd/A Perfect Circle - eMOTIVe [2004] [FLAC]	06. Gimmie Gimmie Gimmie.flac	-10.279999	0.988556
what.cd/A Perfect Circle - eMOTIVe [2004] [FLAC]	07. People Are People.flac	-8.120003	0.999969
what.cd/A Perfect Circle - eMOTIVe [2004] [FLAC]	08. Freedom of Choice.flac	-9.190002	0.988556
what.cd/A Perfect Circle - eMOTIVe [2004] [FLAC]	09. Let's Have a War.flac	-7.470001	0.988556
what.cd/A Perfect Circle - eMOTIVe [2004] [FLAC]	10. Counting Bodies Like Sheep to the Rhythm of the War Drums.flac	-8.889999	0.988556
what.cd/A Perfect Circle - eMOTIVe [2004] [FLAC]	11. When the Levee Breaks.flac	-5.669998	0.988556
what.cd/A Perfect Circle - eMOTIVe [2004] [FLAC]	12. Fiddle and the Drum.flac	-0.949997	0.643768
what.cd/A Perfect Circle - Thirteenth Step [2003] [FLAC]	01. The Package.flac	-5.500000	0.988678
what.cd/A Perfect Circle - Thirteenth Step [2003] [FLAC]	02. Weak And Powerless.flac	-7.389999	0.988678
what.cd/A Perfect Circle - Thirteenth Step [2003] [FLAC]	03. The Noose.flac	-7.739998	1.000000
what.cd/A Perfect Circle - Thirteenth Step [2003] [FLAC]	04. Blue.flac	-7.080002	0.988678
what.cd/A Perfect Circle - Thirteenth Step [2003] [FLAC]	05. Vanishing.flac	-5.019997	0.988647
what.cd/A Perfect Circle - Thirteenth Step [2003] [FLAC]	06. A Stranger.flac	-5.160004	0.699921
what.cd/A Perfect Circle - Thirteenth Step [2003] [FLAC]	07. The Outsider.flac	-7.949997	0.988647
what.cd/A Perfect Circle - Thirteenth Step [2003] [FLAC]	08. Crimes.flac	-1.430000	0.623779
what.cd/A Perfect Circle - Thirteenth Step [2003] [FLAC]	09. The Nurse Who Loved Me.flac	-3.559998	0.623779
what.cd/A Perfect Circle - Thirteenth Step [2003] [FLAC]	10. Pet.flac	-9.070000	0.988647
what.cd/A Perfect Circle - Thirteenth Step [2003] [FLAC]	11. Lullaby.flac	8.250000	0.547546
what.cd/A Perfect Circle - Thirteenth Step [2003] [FLAC]	12. Gravity.flac	-6.660004	0.988647
what.cd/A Poet's Life	01 - Wake Up.flac	-8.279999	0.998993
what.cd/A Poet's Life	02 - Hold On.flac	-9.790001	0.998993
what.cd/A Poet's Life	03 - Into Action.flac	-9.900002	0.998993
what.cd/A Poet's Life	04 - Translator.flac	-8.900002	0.998993
what.cd/A Poet's Life	05 - Take This City.flac	-8.340004	0.998993
what.cd/A Poet's Life	06 - Inner City Violence.flac	-8.860001	0.998993
what.cd/A Poet's Life	07 - Oh No.flac	-8.750000	0.998993
what.cd/A Poet's Life	08 - Lady Demeter.flac	-8.529999	0.998993
what.cd/A Poet's Life	09 - Among The Dead.flac	-9.230003	0.998993
what.cd/A Poet's Life	10 - Cold Blooded.flac	-8.669998	0.998993
what.cd/Asian Dub Foundation - 2005 - Tank (FLAC)	01 - Flyover.flac	-8.220001	0.980682
what.cd/Asian Dub Foundation - 2005 - Tank (FLAC)	02 - Tank.flac	-6.110001	0.980164
what.cd/Asian Dub Foundation - 2005 - Tank (FLAC)	03 - Hope.flac	-7.050003	0.980133
what.cd/Asian Dub Foundation - 2005 - Tank (FLAC)	04 - Round Up.flac	-7.540001	0.980164
what.cd/Asian Dub Foundation - 2005 - Tank (FLAC)	05 - Oil.flac	-6.669998	0.980133
what.cd/Asian Dub Foundation - 2005 - Tank (FLAC)	06 - Powerlines.flac	-6.510002	0.980072
what.cd/Asian Dub Foundation - 2005 - Tank (FLAC)	07 - Who Runs The Place.flac	-7.680000	0.928223
what.cd/Asian Dub Foundation - 2005 - Tank (FLAC)	08 - Take Back The Power.flac	-7.190002	0.980133
what.cd/Asian Dub Foundation - 2005 - Tank (FLAC)	09 - Warring Dhol.flac	-6.320000	0.980072
what.cd/Asian Dub Foundation - 2005 - Tank (FLAC)	10 - Tomorrow Begins Today.flac	-3.760002	0.875061
what.cd/Asian Dub Foundation - 2005 - Tank (FLAC)	11 - Melody 7.flac	-2.209999	0.979736
what.cd/Atari Teenage Riot - Delete Yourself!	01 - Start The Riot!.flac	-7.550003	0.982880
what.cd/Atari Teenage Riot - Delete Yourself!	02 - Into The Death.flac	-7.680000	0.980560
what.cd/Atari Teenage Riot - Delete Yourself!	03 - Raverbashing.flac	-6.510002	0.982758
what.cd/Atari Teenage Riot - Delete Yourself!	04 - Speed.flac	-7.480003	0.984497
what.cd/Atari Teenage Riot - Delete Yourself!	05 - Sex.flac	-6.220001	0.983673
what.cd/Atari Teenage Riot - Delete Yourself!	06 - Midijunkies.flac	-8.419998	0.985016
what.cd/Atari Teenage Riot - Delete Yourself!	07 - Delete Yourself! You Got No Chance To Win! (Live In Glasgow 17.10.1993).flac	-7.769997	0.984619
what.cd/Atari Teenage Riot - Delete Yourself!	08 - Hetzjagd Auf Nazis! (Live In Berlin 25.2.1994).flac	-5.489998	0.980652
what.cd/Atari Teenage Riot - Delete Yourself!	09 - Cyberpunks Are Dead!.flac	-6.110001	0.986633
what.cd/Atari Teenage Riot - Delete Yourself!	10 - Kids Are United!.flac	-8.949997	0.983948
what.cd/Atari Teenage Riot - Delete Yourself!	11 - Atari Teenage Riot.flac	-6.870003	0.987579
what.cd/Atari Teenage Riot - Delete Yourself!	12 - Riot 1995.flac	-9.440002	0.985596
what.cd/Authority Zero - A Passage In Time	A Passage In Time.flac	-10.220001	0.999969
what.cd/Authority Zero - A Passage In Time	Everyday.flac	-11.099998	0.988770
what.cd/Authority Zero - A Passage In Time	Good Ol' Days.flac	-10.680000	0.988708
what.cd/Authority Zero - A Passage In Time	Intro- 'Papa'.flac	-4.760002	0.999969
what.cd/Authority Zero - A Passage In Time	La Surf.flac	-10.739998	0.988708
what.cd/Authority Zero - A Passage In Time	Lying Awake.flac	-11.209999	0.999969
what.cd/Authority Zero - A Passage In Time	Mesa Town.flac	-10.870003	0.988708
what.cd/Authority Zero - A Passage In Time	Not You.flac	-9.949997	0.988708
what.cd/Authority Zero - A Passage In Time	One More Minute.flac	-10.489998	0.988708
what.cd/Authority Zero - A Passage In Time	Over Seasons.flac	-11.029999	0.988708
what.cd/Authority Zero - A Passage In Time	Sky's The Limit.flac	-10.150002	0.988708
what.cd/Authority Zero - A Passage In Time	Some People.flac	-10.529999	0.988708
what.cd/Authority Zero - A Passage In Time	Superbxtch.flac	-11.110001	0.988708
what.cd/Autonomads - 2013 - No Mans Lands	01 - Great Benefit Cheat.flac	-6.510002	0.986237
what.cd/Autonomads - 2013 - No Mans Lands	02 - The Struggle Continues.flac	-5.510002	1.000000
what.cd/Autonomads - 2013 - No Mans Lands	03 - G.M.P..flac	-6.639999	1.000000
what.cd/Autonomads - 2013 - No Mans Lands	04 - Foot In Mouth.flac	-4.940002	1.000000
what.cd/Autonomads - 2013 - No Mans Lands	05 - Super Market Sweep.flac	-5.500000	1.000000
what.cd/Autonomads - 2013 - No Mans Lands	06 - Foundations.flac	-4.599998	1.000000
what.cd/Autonomads - 2013 - No Mans Lands	07 - Dubbin' Up The Downfall.flac	-4.980003	1.000000
what.cd/Autonomads - 2013 - No Mans Lands	08 - Back To The Bark.flac	-5.889999	1.000000
what.cd/Autonomads - 2013 - No Mans Lands	09 - Motor Dread.flac	-6.220001	1.000000
what.cd/Babyboom - 2007 - Babyboom [FLAC]	01 - Passing Through.flac	-8.150002	0.988525
what.cd/Babyboom - 2007 - Babyboom [FLAC]	02 - Sister.flac	-8.230003	0.988525
what.cd/Babyboom - 2007 - Babyboom [FLAC]	03 - Scatterbrain.flac	-8.610001	0.988525
what.cd/Babyboom - 2007 - Babyboom [FLAC]	04 - Not Yet.flac	-8.349998	0.988525
what.cd/Bad Brains	01 - Bad Brains - Sailin' On.flac	-5.489998	0.837433
what.cd/Bad Brains	02 - Bad Brains - Don't Need It.flac	-6.510002	0.962372
what.cd/Bad Brains	03 - Bad Brains - Attitude.flac	-6.389999	0.880310
what.cd/Bad Brains	04 - Bad Brains - The Regulator.flac	-3.639999	0.775238
what.cd/Bad Brains	05 - Bad Brains - Banned in D.C..flac	-5.269997	0.867004
what.cd/Bad Brains	06 - Bad Brains - Jah Calling.flac	0.449997	0.899231
what.cd/Bad Brains	07 - Bad Brains - Supertouch & Shitfit.flac	-4.769997	0.826935
what.cd/Bad Brains	08 - Bad Brains - Leaving Babylon.flac	1.000000	0.626221
what.cd/Bad Brains	09 - Bad Brains - Fearless Vampire Killers.flac	-4.750000	0.883270
what.cd/Bad Brains	10 - Bad Brains - I.flac	-6.300003	0.976685
what.cd/Bad Brains	11 - Bad Brains - Big Take Over.flac	-7.080002	1.000000
what.cd/Bad Brains	12 - Bad Brains - Pay to Cum.flac	-4.209999	0.885742
what.cd/Bad Brains	13 - Bad Brains - Right Brigade.flac	-6.059998	1.000000
what.cd/Bad Brains	14 - Bad Brains - I Luv I Jah.flac	1.489998	0.770325
what.cd/Bad Brains	15 - Bad Brains - Intro.flac	-2.510002	0.682861
what.cd/Bad Brains	16 - Bad Brains - Extro.flac	-1.730003	1.000000
what.cd/Bad Religion - 2004 - Los Angeles Is Burning [FLAC]	01 - Los Angeles Is Burning.flac	-10.139999	0.999969
what.cd/Bad Religion - 2004 - Los Angeles Is Burning [FLAC]	02 - The Surface Of Me.flac	-11.510002	1.000000
what.cd/Bad Religion - 2004 - Los Angeles Is Burning [FLAC]	03 - Let Them Eat War.flac	-10.220001	0.999969
what.cd/Bad Religion - Stranger Than Fiction (European Release)	01 - Incomplete.flac	-7.320000	0.977234
what.cd/Bad Religion - Stranger Than Fiction (European Release)	02 - Leave Mine To Me.flac	-5.330002	0.977234
what.cd/Bad Religion - Stranger Than Fiction (European Release)	03 - Stranger Than Fiction.flac	-6.660004	0.977234
what.cd/Bad Religion - Stranger Than Fiction (European Release)	04 - Tiny Voices.flac	-5.889999	0.977234
what.cd/Bad Religion - Stranger Than Fiction (European Release)	05 - The Handshake.flac	-5.730003	0.977234
what.cd/Bad Religion - Stranger Than Fiction (European Release)	06 - Better Off Dead.flac	-5.940002	0.977234
what.cd/Bad Religion - Stranger Than Fiction (European Release)	07 - Infected.flac	-5.940002	0.977234
what.cd/Bad Religion - Stranger Than Fiction (European Release)	08 - Television.flac	-5.680000	0.977234
what.cd/Bad Religion - Stranger Than Fiction (European Release)	09 - Individual.flac	-5.040001	0.977234
what.cd/Bad Religion - Stranger Than Fiction (European Release)	10 - Hooray For Me....flac	-6.169998	0.977234
what.cd/Bad Religion - Stranger Than Fiction (European Release)	11 - Slumber.flac	-4.680000	0.977234
what.cd/Bad Religion - Stranger Than Fiction (European Release)	12 - Marked.flac	-7.410004	0.977234
what.cd/Bad Religion - Stranger Than Fiction (European Release)	13 - Inner Logic.flac	-5.290001	0.977234
what.cd/Bad Religion - Stranger Than Fiction (European Release)	14 - What It Is.flac	-3.830002	0.977234
what.cd/Bad Religion - Stranger Than Fiction (European Release)	15 - 21st Century (Digital Boy).flac	-4.610001	0.977234
what.cd/Bad Religion - Stranger Than Fiction (European Release)	16 - News From The Front.flac	-7.090004	0.977234
what.cd/Bad Religion - Stranger Than Fiction (European Release)	17 - Markovian Process.flac	-4.830002	0.977234
what.cd/Bandits of the Acoustic Revolution - A Call To Arms	01 - This Is A Call To Arms.flac	-4.309998	0.977264
what.cd/Bandits of the Acoustic Revolution - A Call To Arms	02 - Heres To Life.flac	-5.519997	0.977264
what.cd/Bandits of the Acoustic Revolution - A Call To Arms	03 - Dear Sergio.flac	-5.699997	0.977264
what.cd/Bandits of the Acoustic Revolution - A Call To Arms	04 - Its A Wonderful Life.flac	-6.379997	0.977264
what.cd/Bandits of the Acoustic Revolution - A Call To Arms	05 - They Provide The Paint For The Picture Perfect Masterpiece That You Will Paint On The Inside Of Your Eyelids.flac	-5.220001	0.977264
what.cd/Beastie Boys - The In Sound From Way Out! (FLAC)	01 - Groove Holmes.flac	-5.389999	0.977325
what.cd/Beastie Boys - The In Sound From Way Out! (FLAC)	02 - Sabrosa.flac	-5.449997	0.977325
what.cd/Beastie Boys - The In Sound From Way Out! (FLAC)	03 - Namaste.flac	-4.750000	0.977325
what.cd/Beastie Boys - The In Sound From Way Out! (FLAC)	04 - Pow.flac	-6.099998	0.977325
what.cd/Beastie Boys - The In Sound From Way Out! (FLAC)	05 - Son Of Neckbone.flac	-6.340004	0.977325
what.cd/Beastie Boys - The In Sound From Way Out! (FLAC)	06 - In 3's.flac	-8.309998	0.977325
what.cd/Beastie Boys - The In Sound From Way Out! (FLAC)	07 - Eugene's Lament.flac	-2.849998	0.977325
what.cd/Beastie Boys - The In Sound From Way Out! (FLAC)	08 - Bobo On The Corner.flac	-5.590004	0.977325
what.cd/Beastie Boys - The In Sound From Way Out! (FLAC)	09 - Shambala.flac	-3.970001	0.977325
what.cd/Beastie Boys - The In Sound From Way Out! (FLAC)	10 - Lighten Up.flac	-4.800003	0.977325
what.cd/Beastie Boys - The In Sound From Way Out! (FLAC)	11 - Ricky's Theme.flac	-6.070000	0.977325
what.cd/Beastie Boys - The In Sound From Way Out! (FLAC)	12 - Transitions.flac	-1.849998	0.977325
what.cd/Beastie Boys - The In Sound From Way Out! (FLAC)	13 - Drinkin'  Wine.flac	-1.900002	0.977325
what.cd/Beatsteaks - 2002 - Living Targets (FLAC)	01. Beatsteaks - Not Ready to Rock.flac	-9.169998	0.988617
what.cd/Beatsteaks - 2002 - Living Targets (FLAC)	02. Beatsteaks - God Knows.flac	-10.379997	0.988647
what.cd/Beatsteaks - 2002 - Living Targets (FLAC)	03. Beatsteaks - Let Me In.flac	-9.050003	0.992889
what.cd/Beatsteaks - 2002 - Living Targets (FLAC)	04. Beatsteaks - Soothe Me.flac	-8.730003	0.988617
what.cd/Beatsteaks - 2002 - Living Targets (FLAC)	05. Beatsteaks - Above Us.flac	-9.510002	0.999969
what.cd/Beatsteaks - 2002 - Living Targets (FLAC)	06. Beatsteaks - This One.flac	-8.489998	0.992889
what.cd/Beatsteaks - 2002 - Living Targets (FLAC)	07. Beatsteaks - Disconnected.flac	-7.940002	0.988617
what.cd/Beatsteaks - 2002 - Living Targets (FLAC)	08. Beatsteaks - A-Way.flac	-8.889999	0.988617
what.cd/Beatsteaks - 2002 - Living Targets (FLAC)	09. Beatsteaks - Mirrored.flac	-8.870003	0.988617
what.cd/Beatsteaks - 2002 - Living Targets (FLAC)	10. Beatsteaks - Run Run.flac	-10.330002	0.933319
what.cd/Beatsteaks - 2002 - Living Targets (FLAC)	11. Beatsteaks - To Be Strong.flac	-10.010002	1.000000
what.cd/Beatsteaks - 2002 - Living Targets (FLAC)	12. Beatsteaks - Summer.flac	-8.330002	0.992889
what.cd/Beatsteaks - 2011 - Boombox	01 - Fix It.flac	-10.529999	0.988708
what.cd/Beatsteaks - 2011 - Boombox	02 - Milk & Honey.flac	-10.169998	0.988708
what.cd/Beatsteaks - 2011 - Boombox	03 - Cheap Comments.flac	-10.989998	0.988739
what.cd/Beatsteaks - 2011 - Boombox	04 - Let's See.flac	-8.209999	0.988739
what.cd/Beatsteaks - 2011 - Boombox	05 - Bullets From Another Dimension.flac	-9.830002	0.988708
what.cd/Beatsteaks - 2011 - Boombox	06 - Under A Clear Blue Sky.flac	-10.370003	0.988739
what.cd/Beatsteaks - 2011 - Boombox	07 - Access Adrenalin.flac	-9.980003	0.988739
what.cd/Beatsteaks - 2011 - Boombox	08 - Behaviour.flac	-10.510002	0.988708
what.cd/Beatsteaks - 2011 - Boombox	09 - Automatic.flac	-7.970001	0.988739
what.cd/Beatsteaks - 2011 - Boombox	10 - Alright.flac	-10.010002	0.988739
what.cd/Beatsteaks - 2011 - Boombox	11 - Houses On Fire.flac	-10.099998	0.988708
what.cd/Beatsteaks - {2014} Beatsteaks [FLAC]	01 - A Real Paradise.flac	-10.370003	0.999054
what.cd/Beatsteaks - {2014} Beatsteaks [FLAC]	02 - DNA.flac	-9.879997	0.999084
what.cd/Beatsteaks - {2014} Beatsteaks [FLAC]	03 - Be Smart and Breathe.flac	-9.849998	0.999054
what.cd/Beatsteaks - {2014} Beatsteaks [FLAC]	04 - Make a Wish.flac	-9.879997	0.943787
what.cd/Beatsteaks - {2014} Beatsteaks [FLAC]	05 - Everything Went Black.flac	-8.239998	0.999054
what.cd/Beatsteaks - {2014} Beatsteaks [FLAC]	06 - Up On the Roof.flac	-9.610001	0.999054
what.cd/Beatsteaks - {2014} Beatsteaks [FLAC]	07 - Pass the Message.flac	-9.970001	0.999146
what.cd/Beatsteaks - {2014} Beatsteaks [FLAC]	08 - Gentlemen of the Year.flac	-9.110001	0.999084
what.cd/Beatsteaks - {2014} Beatsteaks [FLAC]	09 - Wicked Witch.flac	-10.110001	0.999054
what.cd/Beatsteaks - {2014} Beatsteaks [FLAC]	10 - Creep Magnet.flac	-7.570000	0.999054
what.cd/Beatsteaks - {2014} Beatsteaks [FLAC]	11 - I Never Was.flac	-10.529999	0.999054
what.cd/Beatsteaks - 23 Singles (2015) - FLAC	01 - Summer.flac	-9.050003	0.999176
what.cd/Beatsteaks - 23 Singles (2015) - FLAC	02 - Let Me In.flac	-9.220001	0.999115
what.cd/Beatsteaks - 23 Singles (2015) - FLAC	03 - Hey Du.flac	-8.379997	0.998993
what.cd/Beatsteaks - 23 Singles (2015) - FLAC	04 - Hand In Hand.flac	-8.980003	0.999054
what.cd/Beatsteaks - 23 Singles (2015) - FLAC	05 - I Don´t Care As Long As You Sing.flac	-9.239998	0.980347
what.cd/Beatsteaks - 23 Singles (2015) - FLAC	06 - Hello Joe.flac	-8.360001	0.999023
what.cd/Beatsteaks - 23 Singles (2015) - FLAC	07 - Frieda und die Bomben.flac	-9.610001	0.999084
what.cd/Beatsteaks - 23 Singles (2015) - FLAC	08 - Jane Became Insane.flac	-9.910004	0.999054
what.cd/Beatsteaks - 23 Singles (2015) - FLAC	09 - Cut Off The Top.flac	-9.269997	0.999084
what.cd/Beatsteaks - 23 Singles (2015) - FLAC	10 - Demons Galore.flac	-9.720001	0.999115
what.cd/Beatsteaks - 23 Singles (2015) - FLAC	11 - Meantime.flac	-9.830002	0.999054
what.cd/Beatsteaks - 23 Singles (2015) - FLAC	12 - Hail To The Freaks.flac	-9.500000	1.000000
what.cd/Beatsteaks - 23 Singles (2015) - FLAC	13 - Milk & Honey.flac	-9.480003	0.916168
what.cd/Beatsteaks - 23 Singles (2015) - FLAC	14 - Cheap Comments.flac	-9.059998	0.999084
what.cd/Beatsteaks - 23 Singles (2015) - FLAC	15 - Automatic.flac	-8.459999	0.879425
what.cd/Beatsteaks - 23 Singles (2015) - FLAC	16 - House On Fire.flac	-10.050003	0.999084
what.cd/Beatsteaks - 23 Singles (2015) - FLAC	17 - Saysaysay.flac	-8.730003	0.994385
what.cd/Beatsteaks - 23 Singles (2015) - FLAC	18 - DNA.flac	-9.830002	0.993042
what.cd/Beatsteaks - 23 Singles (2015) - FLAC	19 - Gentleman Of The Year.flac	-9.190002	0.999054
what.cd/Beatsteaks - 23 Singles (2015) - FLAC	20 - Make A Wish.flac	-9.900002	0.942688
what.cd/Beatsteaks - 23 Singles (2015) - FLAC	21 - Everything Went Black.flac	-8.510002	0.988647
what.cd/Beatsteaks - 23 Singles (2015) - FLAC	22 - Ticket.flac	-9.029999	0.988251
what.cd/Beatsteaks - 23 Singles (2015) - FLAC	23 - Mad River.flac	-10.400002	0.988586
what.cd/Beatsteaks - Smack Smash	01 - Beatsteaks - Big Attack.flac	-8.900002	0.975464
what.cd/Beatsteaks - Smack Smash	02 - Beatsteaks - Vision.flac	-8.470001	0.981567
what.cd/Beatsteaks - Smack Smash	03 - Beatsteaks - Ain't Complaining.flac	-9.370003	0.981567
what.cd/Beatsteaks - Smack Smash	04 - Beatsteaks - Hello Joe.flac	-8.919998	0.981567
what.cd/Beatsteaks - Smack Smash	05 - Beatsteaks - Hand In Hand.flac	-8.470001	0.981567
what.cd/Beatsteaks - Smack Smash	06 - Beatsteaks - Monster.flac	-8.489998	0.981567
what.cd/Beatsteaks - Smack Smash	07 - Beatsteaks - Everything.flac	-8.090004	0.981140
what.cd/Beatsteaks - Smack Smash	08 - Beatsteaks - I Don't Care As Long As You Sing.flac	-7.750000	0.981567
what.cd/Beatsteaks - Smack Smash	09 - Beatsteaks - Atomic Love.flac	-8.840004	0.977173
what.cd/Beatsteaks - Smack Smash	10 - Beatsteaks - Loyal To None.flac	-9.120003	0.970184
what.cd/Beatsteaks - Smack Smash	11 - Beatsteaks - What's Coming Over You.flac	-8.040001	0.981567
what.cd/Beatsteaks - Smack Smash	12 - Beatsteaks - My Revelation.flac	-8.959999	0.981567
what.cd/Billy Talent - Billy Talent II - [2006-FLAC-Lossless]	01 - Billy Talent - Devil In A Midnight Mass.flac	-9.970001	0.988556
what.cd/Billy Talent - Billy Talent II - [2006-FLAC-Lossless]	02 - Billy Talent - Red Flag.flac	-10.330002	0.988556
what.cd/Billy Talent - Billy Talent II - [2006-FLAC-Lossless]	03 - Billy Talent - This Suffering.flac	-10.610001	0.988556
what.cd/Billy Talent - Billy Talent II - [2006-FLAC-Lossless]	04 - Billy Talent - Worker Bess.flac	-10.720001	0.988556
what.cd/Billy Talent - Billy Talent II - [2006-FLAC-Lossless]	05 - Billy Talent - Pins And Needles.flac	-10.349998	0.988556
what.cd/Billy Talent - Billy Talent II - [2006-FLAC-Lossless]	06 - Billy Talent - Fallen Leaves.flac	-10.180000	0.988556
what.cd/Billy Talent - Billy Talent II - [2006-FLAC-Lossless]	07 - Billy Talent - Where Is The Line .flac	-10.669998	0.988556
what.cd/Billy Talent - Billy Talent II - [2006-FLAC-Lossless]	08 - Billy Talent - Covered In Cowardice.flac	-9.930000	0.988556
what.cd/Billy Talent - Billy Talent II - [2006-FLAC-Lossless]	09 - Billy Talent - Surrender.flac	-10.519997	0.988556
what.cd/Billy Talent - Billy Talent II - [2006-FLAC-Lossless]	10 - Billy Talent - The Navy Song.flac	-9.949997	0.988556
what.cd/Billy Talent - Billy Talent II - [2006-FLAC-Lossless]	11 - Billy Talent - Perfect World.flac	-10.190002	0.988556
what.cd/Billy Talent - Billy Talent II - [2006-FLAC-Lossless]	12 - Billy Talent - Sympathy.flac	-10.790001	0.988556
what.cd/Billy Talent - Billy Talent II - [2006-FLAC-Lossless]	13 - Billy Talent - Burn The Evidence.flac	-10.080002	0.988556
what.cd/Black Flag - 1981 - Damaged	01 - Rise Above.flac	-1.040001	0.639587
what.cd/Black Flag - 1981 - Damaged	02 - Spray Paint.flac	-1.940002	0.672546
what.cd/Black Flag - 1981 - Damaged	03 - Six Pack.flac	-0.940002	0.642548
what.cd/Black Flag - 1981 - Damaged	04 - What I See.flac	-1.550003	0.781616
what.cd/Black Flag - 1981 - Damaged	05 - TV Party.flac	-1.739998	0.696289
what.cd/Black Flag - 1981 - Damaged	06 - Thirsty and Miserable.flac	-1.470001	0.633789
what.cd/Black Flag - 1981 - Damaged	07 - Police Story.flac	-0.440002	0.616852
what.cd/Black Flag - 1981 - Damaged	08 - Gimmie Gimmie Gimmie.flac	-1.879997	0.767975
what.cd/Black Flag - 1981 - Damaged	09 - Depression.flac	-0.610001	0.598114
what.cd/Black Flag - 1981 - Damaged	10 - Room 13.flac	-0.809998	0.517212
what.cd/Black Flag - 1981 - Damaged	11 - Damaged II.flac	-0.480003	0.676544
what.cd/Black Flag - 1981 - Damaged	12 - No More.flac	-1.169998	0.669556
what.cd/Black Flag - 1981 - Damaged	13 - Padded Cell.flac	-1.510002	0.603333
what.cd/Black Flag - 1981 - Damaged	14 - Life of Pain.flac	-0.220001	0.636475
what.cd/Black Flag - 1981 - Damaged	15 - Damaged I.flac	0.040001	0.581818
what.cd/Black Sabbath - 1970 - Paranoid  [FLAC]	01.War Pigs-Luke's Wall.flac	-1.769997	1.000000
what.cd/Black Sabbath - 1970 - Paranoid  [FLAC]	02.Paranoid.flac	-0.019997	0.840912
what.cd/Black Sabbath - 1970 - Paranoid  [FLAC]	03.Planet Caravan.flac	6.439999	0.603058
what.cd/Black Sabbath - 1970 - Paranoid  [FLAC]	04.Iron Man.flac	-3.910004	1.000000
what.cd/Black Sabbath - 1970 - Paranoid  [FLAC]	05.Electric Funeral.flac	-1.320000	0.770447
what.cd/Black Sabbath - 1970 - Paranoid  [FLAC]	06.Hand Of Doom.flac	-2.660004	0.906189
what.cd/Black Sabbath - 1970 - Paranoid  [FLAC]	07.Rat Salad.flac	1.139999	0.595093
what.cd/Black Sabbath - 1970 - Paranoid  [FLAC]	08.Jack The Stripper-Fairies Wear Boots.flac	-2.750000	0.999969
what.cd/Bob Marley & The Wailers - Exodus (MFSL Remaster) - FLAC	01 - Natural Mystic.flac	0.099998	0.951263
what.cd/Bob Marley & The Wailers - Exodus (MFSL Remaster) - FLAC	02 - So Much Things to Say.flac	-2.090004	0.999969
what.cd/Bob Marley & The Wailers - Exodus (MFSL Remaster) - FLAC	03 - Guiltiness.flac	-0.190002	0.942535
what.cd/Bob Marley & The Wailers - Exodus (MFSL Remaster) - FLAC	04 - The Heathen.flac	-2.110001	0.846832
what.cd/Bob Marley & The Wailers - Exodus (MFSL Remaster) - FLAC	05 - Exodus.flac	-1.559998	0.967255
what.cd/Bob Marley & The Wailers - Exodus (MFSL Remaster) - FLAC	06 - Jammin'.flac	-1.790001	0.999969
what.cd/Bob Marley & The Wailers - Exodus (MFSL Remaster) - FLAC	07 - Waiting in Vain.flac	-0.550003	0.865265
what.cd/Bob Marley & The Wailers - Exodus (MFSL Remaster) - FLAC	08 - Turn Your Lights Down Low.flac	-1.629997	0.873566
what.cd/Bob Marley & The Wailers - Exodus (MFSL Remaster) - FLAC	09 - Three Little Birds.flac	-1.459999	0.968689
what.cd/Bob Marley & The Wailers - Exodus (MFSL Remaster) - FLAC	10 - One Love,People Get Ready.flac	-1.389999	1.000000
what.cd/Bomb The Music Industry Get Warmer FLAC Log	01 Jobs Schmobs.flac	-10.120003	0.988983
what.cd/Bomb The Music Industry Get Warmer FLAC Log	02 493 Ruth.flac	-9.629997	0.989014
what.cd/Bomb The Music Industry Get Warmer FLAC Log	03 Bike Test 123.flac	-10.139999	0.990570
what.cd/Bomb The Music Industry Get Warmer FLAC Log	04 Unlimited Breadsticks, Soup And Salad Days.flac	-10.050003	0.989014
what.cd/Bomb The Music Industry Get Warmer FLAC Log	05 No Rest For The Whiny.flac	-8.500000	0.988983
what.cd/Bomb The Music Industry Get Warmer FLAC Log	06 25 Hour Goddamn Telethon.flac	-9.250000	0.990295
what.cd/Bomb The Music Industry Get Warmer FLAC Log	07 Depression Is No Fun.flac	-9.849998	0.989044
what.cd/Bomb The Music Industry Get Warmer FLAC Log	08 I Don't Love You Anymore.flac	-10.510002	0.989075
what.cd/Bomb The Music Industry Get Warmer FLAC Log	09 Pizza Claus Is Comin' To Town.flac	-8.959999	0.989014
what.cd/Bomb The Music Industry Get Warmer FLAC Log	10 Never Trust A Man Without A Horribly Embarrassing Secret.flac	-10.080002	0.989014
what.cd/Bomb The Music Industry Get Warmer FLAC Log	11 Get Warmer.flac	-10.620003	0.989014
what.cd/Bomb The Music Industry Get Warmer FLAC Log	12 The Last Party (Foul).flac	-11.760002	0.990265
what.cd/Bomb The Music Industry!-Scrambles FLAC	01 - Cold Chillin' Cold Chillin'.flac	2.989998	0.725494
what.cd/Bomb The Music Industry!-Scrambles FLAC	02 - Stuff That I Like.flac	-11.400002	0.999969
what.cd/Bomb The Music Industry!-Scrambles FLAC	03 - It Shits!!!.flac	-11.449997	0.999969
what.cd/Bomb The Music Industry!-Scrambles FLAC	04 - Fresh Attitude, Young Body.flac	-10.590004	0.924683
what.cd/Bomb The Music Industry!-Scrambles FLAC	05 - Wednesday Night Drinkball.flac	-8.980003	0.999969
what.cd/Bomb The Music Industry!-Scrambles FLAC	06 - 25!!!.flac	-11.000000	0.999969
what.cd/Bomb The Music Industry!-Scrambles FLAC	07 - $2,400,000.flac	-11.610001	0.999969
what.cd/Bomb The Music Industry!-Scrambles FLAC	08 - Gang of Four Meets the Stooges (But Boring).flac	-10.370003	0.999969
what.cd/Bomb The Music Industry!-Scrambles FLAC	09 - 9,11 Fever!!!.flac	-10.709999	0.999969
what.cd/Bomb The Music Industry!-Scrambles FLAC	10 - (Shut) Up the Punx!!!.flac	-11.489998	0.999969
what.cd/Bomb The Music Industry!-Scrambles FLAC	11 - Can I Pay My Rent In Fun .flac	-10.029999	0.989777
what.cd/Bomb The Music Industry!-Scrambles FLAC	12 - Saddr Weirdr.flac	-10.860001	0.999969
what.cd/Bomb The Music Industry!-Scrambles FLAC	13 - Sort of Like Being Pumped.flac	-10.150002	0.999969
what.cd/Buckethead - Colma [1998.FLAC]	01 - Whitewash.flac	-5.910004	0.988617
what.cd/Buckethead - Colma [1998.FLAC]	02 - For Mom.flac	-5.199997	0.988556
what.cd/Buckethead - Colma [1998.FLAC]	03 - Ghost.flac	-7.449997	0.988556
what.cd/Buckethead - Colma [1998.FLAC]	04 - Hills of Eternity.flac	-6.809998	0.988586
what.cd/Buckethead - Colma [1998.FLAC]	05 - Big Sur Moon.flac	-3.860001	0.988342
what.cd/Buckethead - Colma [1998.FLAC]	06 - Machete.flac	-9.550003	0.988586
what.cd/Buckethead - Colma [1998.FLAC]	07 - Wishing Well.flac	-5.080002	0.988556
what.cd/Buckethead - Colma [1998.FLAC]	08 - Lone Sal Bug.flac	-3.239998	0.988464
what.cd/Buckethead - Colma [1998.FLAC]	09 - Sanctum.flac	-6.820000	0.988556
what.cd/Buckethead - Colma [1998.FLAC]	10 - Wondering.flac	-5.529999	0.988495
what.cd/Buckethead - Colma [1998.FLAC]	11 - Watching The Boats with My Dad.flac	-6.470001	0.988464
what.cd/Buckethead - Colma [1998.FLAC]	12 - Ghost,Part 2.flac	-5.940002	0.988373
what.cd/Buckethead - Colma [1998.FLAC]	13 - Colma.flac	-3.510002	0.988434
what.cd/Buck_O_Nine-Twenty-Eight_Teeth-1997-LOSSLESS-VLR	01-buck_o_nine-round_kid-vlr.flac	-10.419998	0.999023
what.cd/Buck_O_Nine-Twenty-Eight_Teeth-1997-LOSSLESS-VLR	02-buck_o_nine-nineteen-vlr.flac	-11.910004	0.999023
what.cd/Buck_O_Nine-Twenty-Eight_Teeth-1997-LOSSLESS-VLR	03-buck_o_nine-albequerque-vlr.flac	-10.250000	0.999023
what.cd/Buck_O_Nine-Twenty-Eight_Teeth-1997-LOSSLESS-VLR	04-buck_o_nine-tear_jerky-vlr.flac	-11.070000	0.999023
what.cd/Buck_O_Nine-Twenty-Eight_Teeth-1997-LOSSLESS-VLR	05-buck_o_nine-im_the_man-vlr.flac	-10.410004	0.999023
what.cd/Buck_O_Nine-Twenty-Eight_Teeth-1997-LOSSLESS-VLR	06-buck_o_nine-jennifers_cold-vlr.flac	-10.750000	0.999023
what.cd/Buck_O_Nine-Twenty-Eight_Teeth-1997-LOSSLESS-VLR	07-buck_o_nine-steve_was_dead-vlr.flac	-10.019997	0.999023
what.cd/Buck_O_Nine-Twenty-Eight_Teeth-1997-LOSSLESS-VLR	08-buck_o_nine-what_happened_to_my_radio_-vlr.flac	-9.550003	0.999023
what.cd/Buck_O_Nine-Twenty-Eight_Teeth-1997-LOSSLESS-VLR	09-buck_o_nine-twenty-eight_teeth-vlr.flac	-9.860001	0.999023
what.cd/Buck_O_Nine-Twenty-Eight_Teeth-1997-LOSSLESS-VLR	10-buck_o_nine-you_go_youre_gone-vlr.flac	-10.919998	0.999023
what.cd/Buck_O_Nine-Twenty-Eight_Teeth-1997-LOSSLESS-VLR	11-buck_o_nine-peach_fish-vlr.flac	-8.500000	0.999023
what.cd/Buck_O_Nine-Twenty-Eight_Teeth-1997-LOSSLESS-VLR	12-buck_o_nine-record_store-vlr.flac	-10.169998	0.999023
what.cd/Buck_O_Nine-Twenty-Eight_Teeth-1997-LOSSLESS-VLR	13-buck_o_nine-my_town-vlr.flac	-11.750000	0.999023
what.cd/Buck_O_Nine-Twenty-Eight_Teeth-1997-LOSSLESS-VLR	14-buck_o_nine-little_pain_inside-vlr.flac	-8.269997	0.999023
what.cd/Bullet For My Valentine - The Poison [FLAC]	01 - Bullet For My Valentine - Intro.flac	-6.470001	0.948303
what.cd/Bullet For My Valentine - The Poison [FLAC]	02 - Bullet For My Valentine - Her Voice Resides.flac	-10.849998	1.000000
what.cd/Bullet For My Valentine - The Poison [FLAC]	03 - Bullet For My Valentine - 4 Words (to choke upon).flac	-11.160004	1.000000
what.cd/Bullet For My Valentine - The Poison [FLAC]	04 - Bullet For My Valentine - Tears Don't Fall.flac	-11.040001	1.000000
what.cd/Bullet For My Valentine - The Poison [FLAC]	05 - Bullet For My Valentine - Suffocating Under Words Of Sorrow (What Can I Do).flac	-10.940002	1.000000
what.cd/Bullet For My Valentine - The Poison [FLAC]	06 - Bullet For My Valentine - Hit The Floor.flac	-10.610001	0.994598
what.cd/Bullet For My Valentine - The Poison [FLAC]	07 - Bullet For My Valentine - All These Things I Hate (Revolve Around Me).flac	-10.840004	1.000000
what.cd/Bullet For My Valentine - The Poison [FLAC]	08 - Bullet For My Valentine - Room 409.flac	-11.260002	1.000000
what.cd/Bullet For My Valentine - The Poison [FLAC]	09 - Bullet For My Valentine - The Poison.flac	-11.110001	1.000000
what.cd/Bullet For My Valentine - The Poison [FLAC]	10 - Bullet For My Valentine - 10 Years Today.flac	-10.860001	1.000000
what.cd/Bullet For My Valentine - The Poison [FLAC]	11 - Bullet For My Valentine - Cries In Vain.flac	-10.989998	0.994446
what.cd/Bullet For My Valentine - The Poison [FLAC]	12 - Bullet For My Valentine - Spit You Out.flac	-10.639999	1.000000
what.cd/Bullet For My Valentine - The Poison [FLAC]	13 - Bullet For My Valentine - The End.flac	-10.019997	1.000000
what.cd/Butthole Surfers - 1996 - Electriclarryland	01 - Birds.flac	-10.059998	0.999969
what.cd/Butthole Surfers - 1996 - Electriclarryland	02 - Cough Syrup.flac	-10.090004	0.999969
what.cd/Butthole Surfers - 1996 - Electriclarryland	03 - Pepper.flac	-9.590004	0.999969
what.cd/Butthole Surfers - 1996 - Electriclarryland	04 - Thermador.flac	-11.169998	0.999969
what.cd/Butthole Surfers - 1996 - Electriclarryland	05 - Ulcer Breakout.flac	-10.760002	0.999969
what.cd/Butthole Surfers - 1996 - Electriclarryland	06 - Jingle Of A Dog's Collar.flac	-8.559998	0.999969
what.cd/Butthole Surfers - 1996 - Electriclarryland	07 - TV Star.flac	-6.849998	0.999969
what.cd/Butthole Surfers - 1996 - Electriclarryland	08 - My Brother's Wife.flac	-8.529999	0.999969
what.cd/Butthole Surfers - 1996 - Electriclarryland	09 - Ah Ha.flac	-10.500000	0.999969
what.cd/Butthole Surfers - 1996 - Electriclarryland	10 - The Lord Is A Monkey.flac	-10.309998	0.999969
what.cd/Butthole Surfers - 1996 - Electriclarryland	11 - Lets Talk About Cars.flac	-3.190002	0.749878
what.cd/Butthole Surfers - 1996 - Electriclarryland	12 - L.A..flac	-10.900002	0.999969
what.cd/Butthole Surfers - 1996 - Electriclarryland	13 - Space.flac	-9.279999	0.999969
what.cd/Capdown - Civil Disobedients (FLAC)	01 - Unite To Progress.flac	-8.220001	0.999817
what.cd/Capdown - Civil Disobedients (FLAC)	02 - Kained But Able.flac	-7.930000	0.999817
what.cd/Capdown - Civil Disobedients (FLAC)	03 - Ska Wars.flac	-7.529999	0.999817
what.cd/Capdown - Civil Disobedients (FLAC)	04 - Jnr NBC.flac	-8.059998	0.999817
what.cd/Capdown - Civil Disobedients (FLAC)	05 - Dub No.1 (featuring the Dutch Masters).flac	-8.349998	0.999817
what.cd/Capdown - Civil Disobedients (FLAC)	06 - Positivity.flac	-8.470001	0.999817
what.cd/Capdown - Civil Disobedients (FLAC)	07 - Cousin Cleotis.flac	-7.849998	0.999817
what.cd/Capdown - Civil Disobedients (FLAC)	08 - The Neverlution.flac	-8.029999	0.999817
what.cd/Capdown - Civil Disobedients (FLAC)	09 - Civil Disobedients.flac	-7.459999	0.999817
what.cd/Capdown - Civil Disobedients (FLAC)	10 - Headstrong.flac	-7.320000	0.999817
what.cd/Capdown - Civil Disobedients (FLAC)	11 - Deal Real.flac	-7.959999	0.999817
what.cd/Capdown - Civil Disobedients (FLAC)	12 - Bitches And Nike Shoes.flac	-6.489998	0.999817
what.cd/Capdown - Time For Change (FLAC)	01 - Time For Change.flac	-7.169998	1.000000
what.cd/Capdown - Time For Change (FLAC)	02 - Stand My Ground.flac	-7.050003	1.000000
what.cd/Capdown - Time For Change (FLAC)	03 - Yourself, Your Whole Self & Nothing But Yourself.flac	-6.900002	1.000000
what.cd/Capdown - Time For Change (FLAC)	04 - If Money's Your Life.flac	-7.840004	1.000000
what.cd/Capdown - Time For Change (FLAC)	05 - If We Don't Last Very Long.flac	-6.199997	1.000000
what.cd/Catch 22 - 1998 - Keasbey Nights [FLAC]	01 - Dear Sergio.flac	-8.269997	0.966003
what.cd/Catch 22 - 1998 - Keasbey Nights [FLAC]	02 - Sick and Sad.flac	-7.199997	0.966064
what.cd/Catch 22 - 1998 - Keasbey Nights [FLAC]	03 - Keasbey Nights.flac	-8.430000	0.966034
what.cd/Catch 22 - 1998 - Keasbey Nights [FLAC]	04 - Day in Day Out.flac	-8.820000	0.966095
what.cd/Catch 22 - 1998 - Keasbey Nights [FLAC]	05 - Walking Away.flac	-6.879997	0.966095
what.cd/Catch 22 - 1998 - Keasbey Nights [FLAC]	06 - Giving Up Giving In.flac	-8.750000	0.966095
what.cd/Catch 22 - 1998 - Keasbey Nights [FLAC]	07 - On & On & On.flac	-7.099998	0.966003
what.cd/Catch 22 - 1998 - Keasbey Nights [FLAC]	08 - Riding the Fourth Wave.flac	-8.209999	0.966034
what.cd/Catch 22 - 1998 - Keasbey Nights [FLAC]	09 - This One Goes Out To....flac	-8.809998	0.966064
what.cd/Catch 22 - 1998 - Keasbey Nights [FLAC]	10 - Supernothing.flac	-8.340004	0.966034
what.cd/Catch 22 - 1998 - Keasbey Nights [FLAC]	11 - 9mm and a Three Piece Suit.flac	-8.410004	0.966095
what.cd/Catch 22 - 1998 - Keasbey Nights [FLAC]	12 - Kristina She Don't Know I Exist.flac	-7.550003	0.966034
what.cd/Catch 22 - 1998 - Keasbey Nights [FLAC]	13 - As the Footsteps Die Out Forever.flac	-7.300003	0.966003
what.cd/Catch 22 - 1998 - Keasbey Nights [FLAC]	14 - 12341234.flac	-7.739998	0.966034
what.cd/Cat Empire, The (2005) Two Shoes {Aus} [FLAC]	01 - Sly.flac	-8.129997	1.000000
what.cd/Cat Empire, The (2005) Two Shoes {Aus} [FLAC]	02 - In My Pocket.flac	-6.349998	1.000000
what.cd/Cat Empire, The (2005) Two Shoes {Aus} [FLAC]	03 - Lullaby.flac	-6.919998	1.000000
what.cd/Cat Empire, The (2005) Two Shoes {Aus} [FLAC]	04 - The Car Song.flac	-8.889999	1.000000
what.cd/Cat Empire, The (2005) Two Shoes {Aus} [FLAC]	05 - Two Shoes.flac	-7.239998	1.000000
what.cd/Cat Empire, The (2005) Two Shoes {Aus} [FLAC]	06 - Miserere.flac	-2.669998	1.000000
what.cd/Cat Empire, The (2005) Two Shoes {Aus} [FLAC]	07 - Sol y Sombra.flac	-7.129997	1.000000
what.cd/Cat Empire, The (2005) Two Shoes {Aus} [FLAC]	08 - Party Started.flac	-5.190002	1.000000
what.cd/Cat Empire, The (2005) Two Shoes {Aus} [FLAC]	09 - Protons, Neutrons, Electrons.flac	-6.769997	1.000000
what.cd/Cat Empire, The (2005) Two Shoes {Aus} [FLAC]	10 - Saltwater.flac	-6.510002	1.000000
what.cd/Cat Empire, The (2005) Two Shoes {Aus} [FLAC]	11 - The Night That Never End.flac	-5.790001	1.000000
what.cd/Cold - Year Of The Spider (Flac)	01 - Remedy.flac	-10.419998	0.999969
what.cd/Cold - Year Of The Spider (Flac)	02 - Suffocate.flac	-9.660004	0.999969
what.cd/Cold - Year Of The Spider (Flac)	03 - Cure My Tragedy (A Letter To God).flac	-10.150002	0.999969
what.cd/Cold - Year Of The Spider (Flac)	04 - Stupid Girl.flac	-10.190002	0.999969
what.cd/Cold - Year Of The Spider (Flac)	05 - Don't Belong.flac	-9.940002	0.999969
what.cd/Cold - Year Of The Spider (Flac)	06 - Wasted Years.flac	-8.559998	0.999969
what.cd/Cold - Year Of The Spider (Flac)	07 - Whatever You Became.flac	-9.320000	0.999969
what.cd/Cold - Year Of The Spider (Flac)	08 - Sad Happy.flac	-10.139999	0.999969
what.cd/Cold - Year Of The Spider (Flac)	09 - Rain Song.flac	-10.099998	0.999969
what.cd/Cold - Year Of The Spider (Flac)	10 - The Day Seattle Died.flac	-9.410004	0.999969
what.cd/Cold - Year Of The Spider (Flac)	11 - Change The World.flac	-9.480003	0.999969
what.cd/Cold - Year Of The Spider (Flac)	12 - Black Sunday.flac	-9.849998	0.999969
what.cd/Cold - Year Of The Spider (Flac)	13 - Kill The Music Industry.flac	-9.349998	0.999969
what.cd/Crazy Arm - Born To Ruin (2009) - FLAC	01 - Asphalt.flac	-8.580002	0.988617
what.cd/Crazy Arm - Born To Ruin (2009) - FLAC	02 - Still To Keep.flac	-9.480003	0.988617
what.cd/Crazy Arm - Born To Ruin (2009) - FLAC	03 - Blind Summit.flac	-9.570000	0.988617
what.cd/Crazy Arm - Born To Ruin (2009) - FLAC	04 - Desire Lines.flac	-9.779999	0.988617
what.cd/Crazy Arm - Born To Ruin (2009) - FLAC	05 - Born To Ruin.flac	-10.050003	0.999969
what.cd/Crazy Arm - Born To Ruin (2009) - FLAC	06 - Broken By The Wheel.flac	-9.309998	0.988617
what.cd/Crazy Arm - Born To Ruin (2009) - FLAC	07 - International Front.flac	-9.250000	0.988617
what.cd/Crazy Arm - Born To Ruin (2009) - FLAC	08 - Henry Fabian Flynn.flac	-9.470001	0.988617
what.cd/Crazy Arm - Born To Ruin (2009) - FLAC	09 - Kith And Kingdom.flac	-10.430000	0.988617
what.cd/Crazy Arm - Born To Ruin (2009) - FLAC	10 - Reassure Me.flac	-9.860001	0.988617
what.cd/Crazy Arm - Born To Ruin (2009) - FLAC	11 - Christ In Concrete.flac	-10.010002	0.988617
what.cd/Crematory . 2008 . Pray	01. When Darkness Falls.flac	-9.849998	0.988770
what.cd/Crematory . 2008 . Pray	02. Left The Ground.flac	-10.080002	0.988739
what.cd/Crematory . 2008 . Pray	03. Alone.flac	-10.070000	0.988770
what.cd/Crematory . 2008 . Pray	04. Pray.flac	-10.430000	0.988800
what.cd/Crematory . 2008 . Pray	05. Sleeping Solution.flac	-9.790001	0.988739
what.cd/Crematory . 2008 . Pray	06. Just Words.flac	-6.750000	0.988739
what.cd/Crematory . 2008 . Pray	07. Burning Bridges.flac	-10.150002	0.989899
what.cd/Crematory . 2008 . Pray	08. Have You Ever.flac	-9.970001	0.988739
what.cd/Crematory . 2008 . Pray	09. Remember.flac	-10.050003	0.988770
what.cd/Crematory . 2008 . Pray	10. Say Goodbye.flac	-9.860001	0.988739
what.cd/Daft Punk - Human After All - 2005 (CD - FLAC)	01. Human After All.flac	-9.699997	0.944122
what.cd/Daft Punk - Human After All - 2005 (CD - FLAC)	02. The Prime Time Of Your Life.flac	-7.940002	0.944122
what.cd/Daft Punk - Human After All - 2005 (CD - FLAC)	03. Robot Rock.flac	-10.129997	0.945038
what.cd/Daft Punk - Human After All - 2005 (CD - FLAC)	04. Steam Machine.flac	-7.419998	0.944122
what.cd/Daft Punk - Human After All - 2005 (CD - FLAC)	05. Make Love.flac	-8.910004	0.944122
what.cd/Daft Punk - Human After All - 2005 (CD - FLAC)	06. The Brainwasher.flac	-9.230003	0.944183
what.cd/Daft Punk - Human After All - 2005 (CD - FLAC)	07. On,Off.flac	-2.160004	0.375854
what.cd/Daft Punk - Human After All - 2005 (CD - FLAC)	08. Television Rules The Nation.flac	-8.720001	0.944550
what.cd/Daft Punk - Human After All - 2005 (CD - FLAC)	09. Technologic.flac	-7.620003	0.944122
what.cd/Daft Punk - Human After All - 2005 (CD - FLAC)	10. Emotion.flac	-8.919998	0.944122
what.cd/Dance Hall Crashers - 1995 - Lockjaw	01 - Shelley.flac	-8.820000	1.000000
what.cd/Dance Hall Crashers - 1995 - Lockjaw	02 - Don't Wanna Behave.flac	-8.590004	1.000000
what.cd/Dance Hall Crashers - 1995 - Lockjaw	03 - Queen for a Day.flac	-8.949997	1.000000
what.cd/Dance Hall Crashers - 1995 - Lockjaw	04 - Flyin'.flac	-7.940002	1.000000
what.cd/Dance Hall Crashers - 1995 - Lockjaw	05 - Good for Nothin'.flac	-6.940002	1.000000
what.cd/Dance Hall Crashers - 1995 - Lockjaw	06 - Buried Alive.flac	-9.750000	1.000000
what.cd/Dance Hall Crashers - 1995 - Lockjaw	07 - Sticky.flac	-8.730003	1.000000
what.cd/Dance Hall Crashers - 1995 - Lockjaw	08 - Too Late.flac	-8.860001	1.000000
what.cd/Dance Hall Crashers - 1995 - Lockjaw	09 - Go.flac	-9.070000	1.000000
what.cd/Dance Hall Crashers - 1995 - Lockjaw	10 - Enough.flac	-9.160004	1.000000
what.cd/Dance Hall Crashers - 1995 - Lockjaw	11 - Pictures.flac	-9.250000	1.000000
what.cd/Dance Hall Crashers - 1995 - Lockjaw	12 - Day Job.flac	-7.949997	1.000000
what.cd/Dance Hall Crashers - 1995 - Lockjaw	13 - So Sue Us.flac	-10.620003	1.000000
what.cd/Dance Hall Crashers - 1995 - Lockjaw	14 - We Owe.flac	-8.900002	1.000000
what.cd/Dance Hall Crashers - Purr FLAC	01 - Dance Hall Crashers - Beverly Kills.flac	-9.680000	0.944183
what.cd/Dance Hall Crashers - Purr FLAC	02 - Dance Hall Crashers - Setting Sun.flac	-9.090004	0.944183
what.cd/Dance Hall Crashers - Purr FLAC	03 - Dance Hall Crashers - The Real You.flac	-9.340004	0.944183
what.cd/Dance Hall Crashers - Purr FLAC	04 - Dance Hall Crashers - Everything To Lose.flac	-8.699997	0.944183
what.cd/Dance Hall Crashers - Purr FLAC	05 - Dance Hall Crashers - Just Like That.flac	-8.269997	0.944183
what.cd/Dance Hall Crashers - Purr FLAC	06 - Dance Hall Crashers - Remember To Breathe.flac	-9.080002	0.944183
what.cd/Dance Hall Crashers - Purr FLAC	07 - Dance Hall Crashers - Make Her Purr.flac	-9.550003	0.945129
what.cd/Dance Hall Crashers - Purr FLAC	08 - Dance Hall Crashers - Do You Think You're Beautiful.flac	-8.949997	0.944183
what.cd/Dance Hall Crashers - Purr FLAC	09 - Dance Hall Crashers - Nothing Left To Say.flac	-8.330002	0.944183
what.cd/Dance Hall Crashers - Purr FLAC	10 - Dance Hall Crashers - Won't Be The Same.flac	-9.029999	0.944183
what.cd/Dance Hall Crashers - Purr FLAC	11 - Dance Hall Crashers - Cat Fight.flac	-9.150002	0.944183
what.cd/Dance Hall Crashers - Purr FLAC	12 - Dance Hall Crashers - Cricket.flac	-1.980003	0.668427
what.cd/Depeche Mode - Enjoy The Silence [FLAC]	01 – Enjoy the Silence (7'' Version).flac	-3.309998	1.000000
what.cd/Depeche Mode - Enjoy The Silence [FLAC]	02 – Enjoy the Silence (Hands and Feet Mix).flac	-0.459999	1.000000
what.cd/Depeche Mode - Enjoy The Silence [FLAC]	03 – Enjoy the Silence (Ecstatic Dub).flac	0.480003	0.887787
what.cd/Depeche Mode - Enjoy The Silence [FLAC]	04 – Sibeling.flac	2.130001	0.599854
what.cd/Devotchkas - Live Fast... Die Young	01 - Devotchkas - Pseudo Personality.flac	-6.669998	1.000000
what.cd/Devotchkas - Live Fast... Die Young	02 - Devotchkas - Wicked Heart.flac	-6.650002	1.000000
what.cd/Devotchkas - Live Fast... Die Young	03 - Devotchkas - Negative Reaction.flac	-6.500000	1.000000
what.cd/Devotchkas - Live Fast... Die Young	04 - Devotchkas - Pushed to the Limit.flac	-6.250000	1.000000
what.cd/Devotchkas - Live Fast... Die Young	05 - Devotchkas - Live Fast... Die Young.flac	-6.809998	1.000000
what.cd/Devotchkas - Live Fast... Die Young	06 - Devotchkas - Travel in Packs.flac	-7.419998	1.000000
what.cd/Devotchkas - Live Fast... Die Young	07 - Devotchkas - What Happened.flac	-6.129997	1.000000
what.cd/Devotchkas - Live Fast... Die Young	08 - Devotchkas - Transparent Creed.flac	-6.010002	1.000000
what.cd/Devotchkas - Live Fast... Die Young	09 - Devotchkas - Gone Crazy.flac	-6.830002	1.000000
what.cd/Devotchkas - Live Fast... Die Young	10 - Devotchkas - Her Love Is Innocence.flac	-6.779999	1.000000
what.cd/Devotchkas - Live Fast... Die Young	11 - Devotchkas - Like Animals.flac	-5.750000	1.000000
what.cd/Devotchkas - Live Fast... Die Young	12 - Devotchkas - Poogly.flac	-6.019997	1.000000
what.cd/Devotchkas - Live Fast... Die Young	13 - Devotchkas - Hidden Track.flac	-4.720001	1.000000
what.cd/Devotchkas - Live Fast... Die Young	14 - Devotchkas - Hidden Track.flac	3.509998	0.670807
what.cd/Discovery	01 One More Time.flac	-5.959999	0.999969
what.cd/Discovery	02 Aerodynamic.flac	-5.309998	0.999969
what.cd/Discovery	03 Digital Love.flac	-6.510002	0.999969
what.cd/Discovery	04 Harder, Better, Faster, Stronger.flac	-6.290001	0.999969
what.cd/Discovery	05 Crescendolls.flac	-6.870003	0.999969
what.cd/Discovery	06 Nightvision.flac	2.139999	0.940063
what.cd/Discovery	07 Superheroes.flac	-5.459999	0.999969
what.cd/Discovery	08 High Life.flac	-5.070000	0.999969
what.cd/Discovery	09 Something About Us.flac	-3.840004	0.999969
what.cd/Discovery	10 Voyager.flac	-4.449997	0.999969
what.cd/Discovery	11 Veridis Quo.flac	-3.660004	0.999969
what.cd/Discovery	12 Short Circuit.flac	-5.360001	0.999969
what.cd/Discovery	13 Face To Face.flac	-4.269997	0.999969
what.cd/Discovery	14 Too Long.flac	-6.480003	0.999969
what.cd/Distemper - 2001 - Доброе утро [CD]	01. Distemper – Тайна.flac	-9.720001	0.998596
what.cd/Distemper - 2001 - Доброе утро [CD]	02. Distemper – Продавщица.flac	-7.320000	0.977570
what.cd/Distemper - 2001 - Доброе утро [CD]	03. Distemper – Я Лечу (Свобода).flac	-7.879997	0.977570
what.cd/Distemper - 2001 - Доброе утро [CD]	04. Distemper – Похорони Их.flac	-8.000000	0.977570
what.cd/Distemper - 2001 - Доброе утро [CD]	05. Distemper – Фенозипам.flac	-7.459999	0.925110
what.cd/Distemper - 2001 - Доброе утро [CD]	06. Distemper – Доброе Утро.flac	-8.340004	0.977570
what.cd/Distemper - 2001 - Доброе утро [CD]	07. Distemper – Трактористы.flac	-7.720001	0.969208
what.cd/Distemper - 2001 - Доброе утро [CD]	08. Distemper – Вобла.flac	-7.809998	0.999725
what.cd/Distemper - 2001 - Доброе утро [CD]	09. Distemper – Миллениум.flac	-8.459999	0.977539
what.cd/Distemper - 2001 - Доброе утро [CD]	10. Distemper – Ska концерт.flac	-7.809998	0.910339
what.cd/Distemper - 2001 - Доброе утро [CD]	11. Distemper – Проваливай Домой.flac	-8.959999	0.999725
what.cd/Distemper - 2001 - Доброе утро [CD]	12. Distemper – Добрая Песня.flac	-7.870003	0.925110
what.cd/Distemper - 2008 - My Undeground [CD]	01. Distemper – start to relax.flac	-9.860001	0.977448
what.cd/Distemper - 2008 - My Undeground [CD]	02. Distemper – i am at ease.flac	-10.050003	0.977478
what.cd/Distemper - 2008 - My Undeground [CD]	03. Distemper – alive planet.flac	-9.340004	0.977417
what.cd/Distemper - 2008 - My Undeground [CD]	04. Distemper – my underground.flac	-10.230003	0.977478
what.cd/Distemper - 2008 - My Undeground [CD]	05. Distemper – jump.flac	-9.590004	0.977448
what.cd/Distemper - 2008 - My Undeground [CD]	06. Distemper – three minutes on summertime.flac	-8.580002	0.977448
what.cd/Distemper - 2008 - My Undeground [CD]	07. Distemper – dog star.flac	-9.959999	0.977448
what.cd/Distemper - 2008 - My Undeground [CD]	08. Distemper – how to stay human.flac	-9.989998	0.977448
what.cd/Distemper - 2008 - My Undeground [CD]	09. Distemper – blue blue night.flac	-9.650002	0.977478
what.cd/Distemper - 2008 - My Undeground [CD]	10. Distemper – at dawn.flac	-9.690002	0.977478
what.cd/Distemper - 2008 - My Undeground [CD]	11. Distemper – happy end.flac	-10.040001	0.977417
what.cd/Distemper - Distemper - 2004 (CD - FLAC - Lossless)	01 - Do Utra Guljaet Gorod! (City Rocks Till the Morning!).flac	-7.120003	0.818573
what.cd/Distemper - Distemper - 2004 (CD - FLAC - Lossless)	02 - Jamajka (Jamaica).flac	-6.410004	0.818665
what.cd/Distemper - Distemper - 2004 (CD - FLAC - Lossless)	03 - V Zerkalah Moej Nadezhdy (In the Mirror of My Hope).flac	-7.500000	0.818573
what.cd/Distemper - Distemper - 2004 (CD - FLAC - Lossless)	04 - Vsjo Otlichno! (Everything Is OK).flac	-5.440002	0.818573
what.cd/Distemper - Distemper - 2004 (CD - FLAC - Lossless)	05 - Zachem !!! (Why !!!).flac	-7.279999	0.818573
what.cd/Distemper - Distemper - 2004 (CD - FLAC - Lossless)	06 - Ljubov'  (Love ).flac	-6.639999	0.818573
what.cd/Distemper - Distemper - 2004 (CD - FLAC - Lossless)	07 - Net Rasizma - Net Problem! (No Racism - No Problem!).flac	-7.190002	0.818573
what.cd/Distemper - Distemper - 2004 (CD - FLAC - Lossless)	08 - Ostorozhno - Nam Vsjo Mozhno! (Warning - Nothing Is Forbidden for Us!).flac	-6.370003	0.818573
what.cd/Distemper - Distemper - 2004 (CD - FLAC - Lossless)	09 - Incident (Incident).flac	-5.470001	0.818695
what.cd/Distemper - Distemper - 2004 (CD - FLAC - Lossless)	10 - Nachni S Sebja (Start With Yourself).flac	-6.250000	0.818909
what.cd/Distemper - Podumaj Kto Tvoi Druz'ja (Think Who Your Friends Are) - 2005 (CD - FLAC - Lossless)	01 - Internet Pizdoboly (Internet Windbags).flac	-8.860001	1.000000
what.cd/Distemper - Podumaj Kto Tvoi Druz'ja (Think Who Your Friends Are) - 2005 (CD - FLAC - Lossless)	02 - Magija Svobody (The Magic of Freedom).flac	-8.879997	1.000000
what.cd/Distemper - Podumaj Kto Tvoi Druz'ja (Think Who Your Friends Are) - 2005 (CD - FLAC - Lossless)	03 - Ty nastojawij Lish' Vnutri (You Are Real Only Inside).flac	-8.559998	1.000000
what.cd/Distemper - Podumaj Kto Tvoi Druz'ja (Think Who Your Friends Are) - 2005 (CD - FLAC - Lossless)	04 - Slovo Ubivaet (The Word Klls).flac	-9.440002	1.000000
what.cd/Distemper - Podumaj Kto Tvoi Druz'ja (Think Who Your Friends Are) - 2005 (CD - FLAC - Lossless)	05 - Prosto Poguljaem (Let's Walk).flac	-8.620003	1.000000
what.cd/Distemper - Podumaj Kto Tvoi Druz'ja (Think Who Your Friends Are) - 2005 (CD - FLAC - Lossless)	06 - Spros Rozhdaet Predlozhenie (Demand Creates Supply).flac	-8.459999	1.000000
what.cd/Distemper - Podumaj Kto Tvoi Druz'ja (Think Who Your Friends Are) - 2005 (CD - FLAC - Lossless)	07 - Uragan (Hurricane).flac	-9.379997	1.000000
what.cd/Distemper - Podumaj Kto Tvoi Druz'ja (Think Who Your Friends Are) - 2005 (CD - FLAC - Lossless)	08 - All colors crew.flac	-7.739998	1.000000
what.cd/Distemper - Podumaj Kto Tvoi Druz'ja (Think Who Your Friends Are) - 2005 (CD - FLAC - Lossless)	09 - Devochki V Pomojke (Girls in Scrapyard).flac	-8.870003	1.000000
what.cd/Distemper - Podumaj Kto Tvoi Druz'ja (Think Who Your Friends Are) - 2005 (CD - FLAC - Lossless)	10 - Moi Sekrety (My Secrets).flac	-9.419998	1.000000
what.cd/Distemper - Podumaj Kto Tvoi Druz'ja (Think Who Your Friends Are) - 2005 (CD - FLAC - Lossless)	11 - Sljozy (Tears).flac	-8.849998	1.000000
what.cd/Distemper - Podumaj Kto Tvoi Druz'ja (Think Who Your Friends Are) - 2005 (CD - FLAC - Lossless)	12 - Podumaj Kto Tvoi Druz'ja (Think Who Your Friends Are).flac	-8.919998	1.000000
what.cd/Distillers - Coral Fang	01 Drain The Blood.flac	-10.169998	0.999023
what.cd/Distillers - Coral Fang	02 Dismantle Me.flac	-10.489998	0.999023
what.cd/Distillers - Coral Fang	03 Die On A Rope.flac	-9.590004	0.999023
what.cd/Distillers - Coral Fang	04 The Gallow Is God.flac	-9.750000	0.999023
what.cd/Distillers - Coral Fang	05 Coral Fang.flac	-9.790001	0.999023
what.cd/Distillers - Coral Fang	06 The Hunger.flac	-9.430000	0.999329
what.cd/Distillers - Coral Fang	07 Hall Of Mirrors.flac	-9.959999	0.999939
what.cd/Distillers - Coral Fang	08 Beat Your Heart Out.flac	-9.459999	0.999969
what.cd/Distillers - Coral Fang	09 Love Is Paranoid.flac	-10.230003	0.999969
what.cd/Distillers - Coral Fang	10 For Tonight You're Only Here To Know.flac	-9.000000	0.999023
what.cd/Distillers - Coral Fang	11 Death Sex.flac	-8.660004	0.999603
what.cd/Disturbed - Believe (2.0 44.1-24) (DVD-A)	01 - Prayer.flac	-8.570000	1.000000
what.cd/Disturbed - Believe (2.0 44.1-24) (DVD-A)	02 - Liberate.flac	-8.570000	1.000000
what.cd/Disturbed - Believe (2.0 44.1-24) (DVD-A)	03 - Awaken.flac	-8.919998	1.000000
what.cd/Disturbed - Believe (2.0 44.1-24) (DVD-A)	04 - Believe.flac	-8.139999	1.000000
what.cd/Disturbed - Believe (2.0 44.1-24) (DVD-A)	05 - Remember.flac	-9.260002	1.000000
what.cd/Disturbed - Believe (2.0 44.1-24) (DVD-A)	06 - Intoxication.flac	-9.330002	1.000000
what.cd/Disturbed - Believe (2.0 44.1-24) (DVD-A)	07 - Rise.flac	-8.919998	1.000000
what.cd/Disturbed - Believe (2.0 44.1-24) (DVD-A)	08 - Mistress.flac	-8.699997	1.000000
what.cd/Disturbed - Believe (2.0 44.1-24) (DVD-A)	09 - Breathe.flac	-8.489998	1.000000
what.cd/Disturbed - Believe (2.0 44.1-24) (DVD-A)	10 - Bound.flac	-8.449997	1.000000
what.cd/Disturbed - Believe (2.0 44.1-24) (DVD-A)	11 - Devour.flac	-8.540001	1.000000
what.cd/Disturbed - Believe (2.0 44.1-24) (DVD-A)	12 - Darkness.flac	-3.980003	0.929831
what.cd/Dolphin - Звезда (2004)	01. Dolphin - Сумерки.flac	-9.090004	0.986145
what.cd/Dolphin - Звезда (2004)	02. Dolphin - Серебро.flac	-6.559998	0.998566
what.cd/Dolphin - Звезда (2004)	03. Dolphin - Чужой.flac	-5.849998	0.988586
what.cd/Dolphin - Звезда (2004)	04. Dolphin - Весна.flac	-9.430000	0.999023
what.cd/Dolphin - Звезда (2004)	05. Dolphin - Имя.flac	-6.840004	1.000000
what.cd/Dolphin - Звезда (2004)	06. Dolphin - Романс.flac	0.659996	0.972137
what.cd/Dolphin - Звезда (2004)	07. Dolphin - Тоска.flac	-9.470001	0.977539
what.cd/Dolphin - Звезда (2004)	08. Dolphin - Облака.flac	-6.970001	0.988831
what.cd/Dolphin - Звезда (2004)	09. Dolphin - Звезда.flac	-3.669998	0.977478
what.cd/Dolphin - Звезда (2004)	10. Dolphin - Киберпанк.flac	-10.220001	0.977753
what.cd/Dolphin - Звезда (2004)	11. Dolphin - MDMA.flac	-7.910004	1.000000
what.cd/Donots	Donots - Got the Noise - 2004 [flac]/01 - We Got The Noise.flac	-10.199997	0.999756
what.cd/Donots	Donots - Got the Noise - 2004 [flac]/02 - Knowledge.flac	-9.480003	0.999756
what.cd/Donots	Donots - Got the Noise - 2004 [flac]/03 - Wretched Boy.flac	-9.840004	1.000000
what.cd/Donots	Donots - Got the Noise - 2004 [flac]/04 - It's Over.flac	-9.629997	0.999756
what.cd/Donots	Donots - Got the Noise - 2004 [flac]/05 - Disappear.flac	-9.720001	0.999756
what.cd/Donots	Donots - Got the Noise - 2004 [flac]/06 - Life Ain't Gonna Wait.flac	-9.730003	0.999756
what.cd/Donots	Donots - Got the Noise - 2004 [flac]/07 - Alright Now.flac	-9.940002	0.999756
what.cd/Donots	Donots - Got the Noise - 2004 [flac]/08 - Good-Bye Routine.flac	-8.250000	0.999054
what.cd/Donots	Donots - Got the Noise - 2004 [flac]/09 - Your Way Home.flac	-9.000000	0.999756
what.cd/Donots	Donots - Got the Noise - 2004 [flac]/10 - The Jerk Parade.flac	-10.599998	0.999756
what.cd/Donots	Donots - Got the Noise - 2004 [flac]/11 - Cought It Up.flac	-9.129997	0.999756
what.cd/Donots	Donots - Got the Noise - 2004 [flac]/12 - Better Days (Not Included).flac	-10.440002	0.999756
what.cd/Donots	Donots - Got the Noise - 2004 [flac]/13 - Punchline.flac	-8.690002	0.999756
what.cd/Downset - Downset	01 - Anger!.flac	-6.470001	1.000000
what.cd/Downset - Downset	02 - Ritual.flac	-5.980003	1.000000
what.cd/Downset - Downset	03 - Take 'em Out.flac	-6.620003	1.000000
what.cd/Downset - Downset	04 - Prostitutionalized.flac	-6.650002	1.000000
what.cd/Downset - Downset	05 - Downset.flac	-6.739998	0.994476
what.cd/Downset - Downset	06 - My American Prayer.flac	-7.269997	1.000000
what.cd/Downset - Downset	07 - Holding Hands.flac	-6.820000	1.000000
what.cd/Downset - Downset	08 - About to Blast.flac	-6.940002	1.000000
what.cd/Downset - Downset	09 - Breed the Killer.flac	-6.540001	1.000000
what.cd/Downset - Downset	10 - Dying of Thirst.flac	-6.720001	0.999969
what.cd/Dream Theater - Images And Words	Dream Theater - Images And Words/01 - Pull Me Under.flac	-4.980003	0.999969
what.cd/Dream Theater - Images And Words	Dream Theater - Images And Words/02 - Another Day.flac	-3.779999	0.999969
what.cd/Dream Theater - Images And Words	Dream Theater - Images And Words/03 - Take The Time.flac	-4.400002	0.999969
what.cd/Dream Theater - Images And Words	Dream Theater - Images And Words/04 - Surrounded.flac	-5.090004	0.999969
what.cd/Dream Theater - Images And Words	Dream Theater - Images And Words/05 - Metropolis-Part I- The Miracle And The Sleeper.flac	-4.500000	0.999969
what.cd/Dream Theater - Images And Words	Dream Theater - Images And Words/06 - Under A Glass Moon.flac	-3.809998	0.999969
what.cd/Dream Theater - Images And Words	Dream Theater - Images And Words/07 - Wait For Sleep.flac	-0.070000	0.883698
what.cd/Dream Theater - Images And Words	Dream Theater - Images And Words/08 - Learning To Live.flac	-3.760002	0.999969
what.cd/Dub Incorporation - 2005 - Dans le Décor [FLAC]	01-Dub Incorporation-Survie.flac	-7.570000	0.974121
what.cd/Dub Incorporation - 2005 - Dans le Décor [FLAC]	02-Dub Incorporation-One Shot.flac	-7.730003	0.963684
what.cd/Dub Incorporation - 2005 - Dans le Décor [FLAC]	03-Dub Incorporation-Monnaie (ft. Lyricson).flac	-6.989998	1.000000
what.cd/Dub Incorporation - 2005 - Dans le Décor [FLAC]	04-Dub Incorporation-Chaines.flac	-4.959999	1.000000
what.cd/Dub Incorporation - 2005 - Dans le Décor [FLAC]	05-Dub Incorporation-A Imma.flac	-5.820000	1.000000
what.cd/Dub Incorporation - 2005 - Dans le Décor [FLAC]	06-Dub Incorporation-Décor.flac	-7.680000	0.970673
what.cd/Dub Incorporation - 2005 - Dans le Décor [FLAC]	07-Dub Incorporation-Achtah (ft. Omar Perry).flac	-8.040001	0.973267
what.cd/Dub Incorporation - 2005 - Dans le Décor [FLAC]	08-Dub Incorporation-Bla bla.flac	-7.349998	0.977112
what.cd/Dub Incorporation - 2005 - Dans le Décor [FLAC]	09-Dub Incorporation-Face à Soi.flac	-8.019997	0.962982
what.cd/Dub Incorporation - 2005 - Dans le Décor [FLAC]	10-Dub Incorporation-Speed (ft. David Hinds).flac	-7.980003	0.978027
what.cd/Dub Incorporation - 2005 - Dans le Décor [FLAC]	11-Dub Incorporation-La Corde Raide.flac	-7.529999	1.000000
what.cd/Dub Incorporation - 2005 - Dans le Décor [FLAC]	12-Dub Incorporation-Never Stop.flac	-7.440002	0.970398
what.cd/Dub Incorporation - 2005 - Dans le Décor [FLAC]	13-Dub Incorporation-Never More.flac	-6.360001	0.978729
what.cd/Epica - Consign To Oblivion (2005) FLAC (WCD)	01 - Hunab K'u - A New Age Dawns - prologue.flac	-8.610001	0.966064
what.cd/Epica - Consign To Oblivion (2005) FLAC (WCD)	02 - Dance Of Fate.flac	-6.690002	0.966064
what.cd/Epica - Consign To Oblivion (2005) FLAC (WCD)	03 - The Last Crusade - A New Age Dawns #1.flac	-7.379997	0.966064
what.cd/Epica - Consign To Oblivion (2005) FLAC (WCD)	04 - Solitary Ground.flac	-5.489998	0.966064
what.cd/Epica - Consign To Oblivion (2005) FLAC (WCD)	05 - Blank Infinity.flac	-6.739998	0.966064
what.cd/Epica - Consign To Oblivion (2005) FLAC (WCD)	06 - Force Of The Shore.flac	-7.190002	0.966064
what.cd/Epica - Consign To Oblivion (2005) FLAC (WCD)	07 - Quietus.flac	-6.510002	0.966064
what.cd/Epica - Consign To Oblivion (2005) FLAC (WCD)	08 - Mother of Light - A New Age Dawns #2.flac	-7.519997	0.966064
what.cd/Epica - Consign To Oblivion (2005) FLAC (WCD)	09 - Trois Vierges.flac	-5.330002	0.767426
what.cd/Epica - Consign To Oblivion (2005) FLAC (WCD)	10 - Another Me 'In Lack'ech'.flac	-7.209999	0.966064
what.cd/Epica - Consign To Oblivion (2005) FLAC (WCD)	11 - Consign to Oblivion - A New Age Dawns #3.flac	-7.180000	0.966064
what.cd/E-SEX-T - Время Слона (2007) What.cd	01 Что Дороже.flac	-12.250000	0.961731
what.cd/E-SEX-T - Время Слона (2007) What.cd	02 Все Сложней (Облом#2).flac	-12.470001	0.961365
what.cd/E-SEX-T - Время Слона (2007) What.cd	03 А Ты Попробуй.flac	-12.290001	0.961700
what.cd/E-SEX-T - Время Слона (2007) What.cd	04 Театр Теней.flac	-12.300003	0.961731
what.cd/E-SEX-T - Время Слона (2007) What.cd	05 Девчонка (С Мушкой Между Бровей).flac	-12.169998	0.961700
what.cd/E-SEX-T - Время Слона (2007) What.cd	06 Музыкальная Шкатулка.flac	-12.279999	0.961700
what.cd/E-SEX-T - Время Слона (2007) What.cd	07 Некуда Бежать.flac	-12.169998	0.961731
what.cd/E-SEX-T - Время Слона (2007) What.cd	08 Ее Еще Нет.flac	-11.620003	0.961731
what.cd/E-SEX-T - Время Слона (2007) What.cd	09 Грязь.flac	-11.860001	0.961365
what.cd/E-SEX-T - Время Слона (2007) What.cd	10  Волк.flac	-11.739998	0.961731
what.cd/E-SEX-T - Время Слона (2007) What.cd	11 Проще И Лучше.flac	-11.930000	0.961731
what.cd/E-SEX-T - Время Слона (2007) What.cd	12 Не уходи.flac	-12.269997	0.961731
what.cd/Exilia - 2006 - Nobody Excluded	01 - Exilia - Kill Me.flac	-10.199997	0.983246
what.cd/Exilia - 2006 - Nobody Excluded	02 - Exilia - Nobody.flac	-10.519997	0.983246
what.cd/Exilia - 2006 - Nobody Excluded	03 - Exilia - Destroy My Eyes.flac	-10.580002	0.983368
what.cd/Exilia - 2006 - Nobody Excluded	04 - Exilia - No Colours.flac	-10.220001	0.973633
what.cd/Exilia - 2006 - Nobody Excluded	05 - Exilia - Your Rain.flac	-9.889999	0.973663
what.cd/Exilia - 2006 - Nobody Excluded	06 - Exilia - Get Sick.flac	-10.050003	0.983337
what.cd/Exilia - 2006 - Nobody Excluded	07 - Exilia - Speed Of Light.flac	-9.629997	0.973694
what.cd/Exilia - 2006 - Nobody Excluded	08 - Exilia - Fly High Butterfly.flac	-10.239998	0.983368
what.cd/Exilia - 2006 - Nobody Excluded	09 - Exilia - My Prophecy.flac	-10.690002	0.983826
what.cd/Exilia - 2006 - Nobody Excluded	10 - Exilia - In A Coma.flac	-10.830002	0.983795
what.cd/Exilia - 2006 - Nobody Excluded	11 - Exilia - Justify Yourself.flac	-9.919998	0.983856
what.cd/Exilia - 2006 - Nobody Excluded	12 - Exilia - Little Girl In A World.flac	-10.440002	0.983856
what.cd/Exilia - Unleashed	01 - Coincidence.flac	-10.970001	0.999756
what.cd/Exilia - Unleashed	02 - Stop Playing God.flac	-10.269997	0.999847
what.cd/Exilia - Unleashed	03 - Day in Hell.flac	-11.230003	0.999756
what.cd/Exilia - Unleashed	04 - Underdog.flac	-10.919998	0.999756
what.cd/Exilia - Unleashed	05 - Mr. Man.flac	-9.830002	0.999756
what.cd/Exilia - Unleashed	06 - Starseed.flac	-11.040001	0.999756
what.cd/Exilia - Unleashed	07 - Shout Louder.flac	-11.529999	0.999756
what.cd/Exilia - Unleashed	08 - I Guess You Know (feat. MichaIn Extremo).flac	-10.000000	0.999756
what.cd/Exilia - Unleashed	09 - Without you.flac	-11.090004	0.999756
what.cd/Exilia - Unleashed	10 - The World is Fallin' Down.flac	-10.849998	0.999756
what.cd/Exilia - Unleashed	11 - Rise when you Fall.flac	-10.930000	0.999756
what.cd/Exilia - Unleashed	12 - Heaven's Gate.flac	-10.879997	0.999756
what.cd/Exilia - Unleashed	13 - Where I'm wrong.flac	-10.620003	0.999756
what.cd/Faith No More - Angel Dust (1992)[MFSL]	01 - Land Of Sunshine.flac	-2.940002	0.977570
what.cd/Faith No More - Angel Dust (1992)[MFSL]	02 - Caffeine.flac	-4.449997	0.986725
what.cd/Faith No More - Angel Dust (1992)[MFSL]	03 - MidLife Crisis.flac	-2.830002	0.989929
what.cd/Faith No More - Angel Dust (1992)[MFSL]	04 - RV.flac	-3.570000	0.990265
what.cd/Faith No More - Angel Dust (1992)[MFSL]	05 - Smaller And Smaller.flac	-2.940002	0.980591
what.cd/Faith No More - Angel Dust (1992)[MFSL]	06 - Everything's Ruined.flac	-2.529999	0.982910
what.cd/Faith No More - Angel Dust (1992)[MFSL]	07 - Malpractice.flac	-3.840004	0.957367
what.cd/Faith No More - Angel Dust (1992)[MFSL]	08 - Kindergarten.flac	-2.220001	0.988617
what.cd/Faith No More - Angel Dust (1992)[MFSL]	09 - Be Aggressive.flac	-2.660004	0.994019
what.cd/Faith No More - Angel Dust (1992)[MFSL]	10 - A Small Victory.flac	-2.860001	0.986603
what.cd/Faith No More - Angel Dust (1992)[MFSL]	11 - Crack Hitler.flac	-3.730003	0.984039
what.cd/Faith No More - Angel Dust (1992)[MFSL]	12 - Jizzlobber.flac	-3.379997	0.984802
what.cd/Faith No More - Angel Dust (1992)[MFSL]	13 - Midnight Cowboy.flac	0.379997	0.953857
what.cd/Favourite Worst Nightmare	01 Arctic Monkeys - Brianstorm.flac	-9.889999	0.999054
what.cd/Favourite Worst Nightmare	02 Arctic Monkeys - Teddy Picker.flac	-10.139999	0.999237
what.cd/Favourite Worst Nightmare	03 Arctic Monkeys - D Is For Dangerous.flac	-9.340004	0.999054
what.cd/Favourite Worst Nightmare	04 Arctic Monkeys - Balaclava.flac	-10.340004	0.999054
what.cd/Favourite Worst Nightmare	05 Arctic Monkeys - Fluorescent Adolescent.flac	-9.059998	0.999054
what.cd/Favourite Worst Nightmare	06 Arctic Monkeys - Only Ones Who Know.flac	-6.639999	0.999054
what.cd/Favourite Worst Nightmare	07 Arctic Monkeys - Do Me A Favour.flac	-10.190002	0.999054
what.cd/Favourite Worst Nightmare	08 Arctic Monkeys - This House Is A Circus.flac	-9.300003	0.999054
what.cd/Favourite Worst Nightmare	09 Arctic Monkeys - If You Were There, Beware.flac	-9.779999	0.999054
what.cd/Favourite Worst Nightmare	10 Arctic Monkeys - The Bad Thing.flac	-9.809998	0.999054
what.cd/Favourite Worst Nightmare	11 Arctic Monkeys - Old Yellow Bricks.flac	-9.400002	0.999054
what.cd/Favourite Worst Nightmare	12 Arctic Monkeys - 505.flac	-9.860001	0.999054
what.cd/Fishbone - The Reality Of My Surroundings (1991) [FLAC]	01 - Fight The Youth.flac	-6.629997	0.970001
what.cd/Fishbone - The Reality Of My Surroundings (1991) [FLAC]	02 - If I Were A...I'd.flac	-5.949997	0.947418
what.cd/Fishbone - The Reality Of My Surroundings (1991) [FLAC]	03 - So Many Millions.flac	-6.949997	1.000000
what.cd/Fishbone - The Reality Of My Surroundings (1991) [FLAC]	04 - Asswhippin'.flac	-4.389999	0.952515
what.cd/Fishbone - The Reality Of My Surroundings (1991) [FLAC]	05 - Housework.flac	-5.980003	0.956604
what.cd/Fishbone - The Reality Of My Surroundings (1991) [FLAC]	06 - Deathmarch.flac	-1.720001	0.573730
what.cd/Fishbone - The Reality Of My Surroundings (1991) [FLAC]	07 - Behavior Control Technician.flac	-6.400002	0.963959
what.cd/Fishbone - The Reality Of My Surroundings (1991) [FLAC]	08 - If I Were A...I'd.flac	-5.230003	0.951508
what.cd/Fishbone - The Reality Of My Surroundings (1991) [FLAC]	09 - Pressure.flac	-6.760002	0.967316
what.cd/Fishbone - The Reality Of My Surroundings (1991) [FLAC]	10 - Junkies Prayer.flac	-5.500000	0.968872
what.cd/Fishbone - The Reality Of My Surroundings (1991) [FLAC]	11 - Pray To The Junkiemaker.flac	-6.250000	0.970551
what.cd/Fishbone - The Reality Of My Surroundings (1991) [FLAC]	12 - Everyday Sunshine.flac	-7.470001	0.963898
what.cd/Fishbone - The Reality Of My Surroundings (1991) [FLAC]	13 - If I Were A...I'd.flac	-4.760002	0.945129
what.cd/Fishbone - The Reality Of My Surroundings (1991) [FLAC]	14 - Naz-tee May'en.flac	-6.379997	0.984070
what.cd/Fishbone - The Reality Of My Surroundings (1991) [FLAC]	15 - Babyhead.flac	-6.699997	0.964722
what.cd/Fishbone - The Reality Of My Surroundings (1991) [FLAC]	16 - If I Were A...I'd.flac	-8.599998	0.961456
what.cd/Fishbone - The Reality Of My Surroundings (1991) [FLAC]	17 - Those Days Are Gone.flac	-8.260002	0.984100
what.cd/Fishbone - The Reality Of My Surroundings (1991) [FLAC]	18 - Sunless Saturday.flac	-7.809998	0.969604
what.cd/Flobots - 2008 - Fight With Tools	01 - There's A War Going On For Your Mind.flac	-8.169998	0.975250
what.cd/Flobots - 2008 - Fight With Tools	02 - Mayday!!!.flac	-7.769997	0.993530
what.cd/Flobots - 2008 - Fight With Tools	03 - Same Thing.flac	-6.989998	0.979950
what.cd/Flobots - 2008 - Fight With Tools	04 - Stand Up.flac	-5.980003	0.977936
what.cd/Flobots - 2008 - Fight With Tools	05 - Fight With Tools.flac	-8.129997	0.981171
what.cd/Flobots - 2008 - Fight With Tools	06 - Handlebars.flac	-7.440002	0.999969
what.cd/Flobots - 2008 - Fight With Tools	07 - Never Had It.flac	-6.379997	0.979462
what.cd/Flobots - 2008 - Fight With Tools	08 - Combat.flac	-6.699997	0.970581
what.cd/Flobots - 2008 - Fight With Tools	09 - The Rhythm Method (Move!).flac	-7.379997	0.987366
what.cd/Flobots - 2008 - Fight With Tools	10 - Anne Braden.flac	-6.650002	0.937378
what.cd/Flobots - 2008 - Fight With Tools	11 - We Are Winning.flac	-6.050003	0.999969
what.cd/Flobots - 2008 - Fight With Tools	12 - Rise.flac	-7.879997	0.977783
what.cd/Flogging Molly - Swagger (2000) [FLAC]	01 Salty Dog.flac	-8.389999	0.997589
what.cd/Flogging Molly - Swagger (2000) [FLAC]	02 Selfish Man.flac	-8.290001	0.997742
what.cd/Flogging Molly - Swagger (2000) [FLAC]	03 The Worst Day Since Yesterday.flac	-7.830002	0.997498
what.cd/Flogging Molly - Swagger (2000) [FLAC]	04 Every Dog Has Its Day.flac	-8.730003	0.998016
what.cd/Flogging Molly - Swagger (2000) [FLAC]	05 Life in a Tenement Square.flac	-8.820000	0.997711
what.cd/Flogging Molly - Swagger (2000) [FLAC]	06 The Ol' Beggars Bush.flac	-8.570000	0.997772
what.cd/Flogging Molly - Swagger (2000) [FLAC]	07 The Likes of You Again.flac	-9.070000	0.997833
what.cd/Flogging Molly - Swagger (2000) [FLAC]	08 Black Friday Rule.flac	-8.139999	0.997955
what.cd/Flogging Molly - Swagger (2000) [FLAC]	09 Grace of God Go I.flac	-2.410004	0.691162
what.cd/Flogging Molly - Swagger (2000) [FLAC]	10 Devil's Dance Floor.flac	-9.160004	0.997864
what.cd/Flogging Molly - Swagger (2000) [FLAC]	11 These Exiled Years.flac	-8.610001	0.997894
what.cd/Flogging Molly - Swagger (2000) [FLAC]	12 Sentimental Johnny.flac	-8.760002	0.997681
what.cd/Flogging Molly - Swagger (2000) [FLAC]	13 Far Away Boys.flac	-3.919998	0.990265
what.cd/Foo Fighters - Everlong (UK CD Single 1)	Foo Fighters - Everlong (UK CD Single 1) - 01 - Everlong.flac	-9.209999	0.979767
what.cd/Foo Fighters - Everlong (UK CD Single 1)	Foo Fighters - Everlong (UK CD Single 1) - 02 - Drive Me Wild.flac	-7.639999	0.979767
what.cd/Foo Fighters - Everlong (UK CD Single 1)	Foo Fighters - Everlong (UK CD Single 1) - 03 - See You (Live).flac	-7.690002	0.979767
what.cd/F.P.G - 2001 - Гонщики	01 - Ботинки.flac	-8.510002	0.724426
what.cd/F.P.G - 2001 - Гонщики	02 - Ебанутый.flac	-8.930000	0.741302
what.cd/F.P.G - 2001 - Гонщики	03 - Утренняя.flac	-9.239998	0.881042
what.cd/F.P.G - 2001 - Гонщики	04 - Сучка.flac	-9.330002	0.794312
what.cd/F.P.G - 2001 - Гонщики	05 - My Way.flac	-7.709999	0.882416
what.cd/F.P.G - 2001 - Гонщики	06 - Туз Виней.flac	-9.989998	0.977234
what.cd/F.P.G - 2001 - Гонщики	07 - Идиоты.flac	-9.809998	0.785217
what.cd/F.P.G - 2001 - Гонщики	08 - Не отступай.flac	-7.769997	0.794312
what.cd/F.P.G - 2001 - Гонщики	09 - Свобода.flac	-8.860001	0.794312
what.cd/F.P.G - 2001 - Гонщики	10 - Блядская.flac	-7.650002	0.776245
what.cd/F.P.G - 2001 - Гонщики	11 - Восьмое марта.flac	-9.040001	1.000000
what.cd/F.P.G. - 2004 - Гавнорок	01 - Двигатель.flac	-11.190002	0.995605
what.cd/F.P.G. - 2004 - Гавнорок	02 - Клуб.flac	-11.120003	0.995605
what.cd/F.P.G. - 2004 - Гавнорок	03 - Проебал.flac	-10.010002	0.995605
what.cd/F.P.G. - 2004 - Гавнорок	04 - Проснулся.flac	-10.709999	0.995605
what.cd/F.P.G. - 2004 - Гавнорок	05 - Ночь.flac	-9.550003	0.995605
what.cd/F.P.G. - 2004 - Гавнорок	06 - Сейчас.flac	-10.419998	0.995605
what.cd/F.P.G. - 2004 - Гавнорок	07 - Джи.flac	-9.260002	0.995605
what.cd/F.P.G. - 2004 - Гавнорок	08 - У.е.баны.flac	-10.550003	0.995605
what.cd/F.P.G. - 2004 - Гавнорок	09 - Гавнометал.flac	-10.449997	0.995605
what.cd/F.P.G. - 2004 - Гавнорок	10 - Сердце.flac	-10.599998	0.995605
what.cd/F.P.G. - 2004 - Гавнорок	11 - Бунтари.flac	-11.070000	0.995605
what.cd/F.P.G. - 2004 - Гавнорок	12 - Думай!.flac	-9.070000	0.995605
what.cd/Friend or FOE	01 Angry Anthem.flac	-10.379997	1.000000
what.cd/Friend or FOE	02 Go To Hell.flac	-10.059998	1.000000
what.cd/Friend or FOE	03 My Life.flac	-8.459999	1.000000
what.cd/Friend or FOE	04 Dance the Night Away.flac	-9.660004	1.000000
what.cd/Friend or FOE	05 Vague Love Song.flac	-8.730003	1.000000
what.cd/Friend or FOE	06 Hey! Woo! Yea!.flac	-9.870003	1.000000
what.cd/Friend or FOE	07 Mistake.flac	-9.620003	1.000000
what.cd/Friend or FOE	08 Worst Day.flac	-9.879997	1.000000
what.cd/Friend or FOE	09 Maybe I'm Wrong.flac	-9.160004	1.000000
what.cd/Friend or FOE	10 Independent.flac	-9.110001	1.000000
what.cd/Friend or FOE	11 Fight.flac	-9.639999	1.000000
what.cd/God Is An Astronaut - All Is Violent, All Is Bright	01 - Fragile.flac	-10.680000	0.999969
what.cd/God Is An Astronaut - All Is Violent, All Is Bright	02 - All Is Violent, All Is Bright.flac	-10.559998	0.999969
what.cd/God Is An Astronaut - All Is Violent, All Is Bright	03 - Forever Lost.flac	-10.650002	0.999969
what.cd/God Is An Astronaut - All Is Violent, All Is Bright	04 - Fire Flies And Empty Skies.flac	-10.599998	0.999969
what.cd/God Is An Astronaut - All Is Violent, All Is Bright	05 - A Deafening Distance.flac	-10.769997	0.999969
what.cd/God Is An Astronaut - All Is Violent, All Is Bright	06 - Infinite Horizons.flac	-3.320000	0.930756
what.cd/God Is An Astronaut - All Is Violent, All Is Bright	07 - Suicide By Star.flac	-11.489998	0.999969
what.cd/God Is An Astronaut - All Is Violent, All Is Bright	08 - Remembrance Day.flac	-10.099998	0.999969
what.cd/God Is An Astronaut - All Is Violent, All Is Bright	09 - Dust And Echoes.flac	-10.040001	0.999969
what.cd/God Is An Astronaut - All Is Violent, All Is Bright	10 - When Everything Dies.flac	-9.250000	0.999969
what.cd/Gogol Bordello - Super Taranta! [FLAC]	01 - Ultimate.flac	-10.610001	0.999969
what.cd/Gogol Bordello - Super Taranta! [FLAC]	02 - Wonderlust King.flac	-9.980003	0.999969
what.cd/Gogol Bordello - Super Taranta! [FLAC]	03 - Zina-Marina.flac	-9.610001	0.999969
what.cd/Gogol Bordello - Super Taranta! [FLAC]	04 - Supertheory Of Supereverything.flac	-8.919998	0.999969
what.cd/Gogol Bordello - Super Taranta! [FLAC]	05 - Harem In Tuscany (Taranta).flac	-10.669998	0.999969
what.cd/Gogol Bordello - Super Taranta! [FLAC]	06 - Dub The Frequencies Of Love.flac	-9.370003	0.999969
what.cd/Gogol Bordello - Super Taranta! [FLAC]	07 - My Strange Uncles From Abroad.flac	-9.550003	0.999969
what.cd/Gogol Bordello - Super Taranta! [FLAC]	08 - Tribal Connection.flac	-8.410004	0.999969
what.cd/Gogol Bordello - Super Taranta! [FLAC]	09 - Forces Of Victory.flac	-10.919998	0.999969
what.cd/Gogol Bordello - Super Taranta! [FLAC]	10 - Alcohol.flac	-7.459999	0.999969
what.cd/Gogol Bordello - Super Taranta! [FLAC]	11 - Suddenly...(I Miss Carpaty).flac	-10.709999	0.999969
what.cd/Gogol Bordello - Super Taranta! [FLAC]	12 - Your Country.flac	-10.480003	0.999969
what.cd/Gogol Bordello - Super Taranta! [FLAC]	13 - American Wedding.flac	-11.269997	0.999969
what.cd/Gogol Bordello - Super Taranta! [FLAC]	14 - Super Taranta!.flac	-10.129997	0.999969
what.cd/Goldfinger - 2000 - Stomping Ground (FLAC)	01 - I'm Down.flac	-9.370003	0.988647
what.cd/Goldfinger - 2000 - Stomping Ground (FLAC)	02 - Pick A Fight.flac	-9.320000	0.988678
what.cd/Goldfinger - 2000 - Stomping Ground (FLAC)	03 - Carry On.flac	-10.260002	0.988678
what.cd/Goldfinger - 2000 - Stomping Ground (FLAC)	04 - The End Of The Day.flac	-8.449997	0.988647
what.cd/Goldfinger - 2000 - Stomping Ground (FLAC)	05 - Don't Say Goodbye.flac	-8.629997	0.988678
what.cd/Goldfinger - 2000 - Stomping Ground (FLAC)	06 - Counting The Days.flac	-8.379997	0.977325
what.cd/Goldfinger - 2000 - Stomping Ground (FLAC)	07 - Bro.flac	-9.029999	0.988678
what.cd/Goldfinger - 2000 - Stomping Ground (FLAC)	08 - San Simeon.flac	-8.870003	0.988678
what.cd/Goldfinger - 2000 - Stomping Ground (FLAC)	09 - You Think It's A Joke.flac	-8.790001	0.988647
what.cd/Goldfinger - 2000 - Stomping Ground (FLAC)	10 - Forgiveness.flac	-8.970001	0.988678
what.cd/Goldfinger - 2000 - Stomping Ground (FLAC)	11 - Margaret Ann.flac	-8.230003	0.988647
what.cd/Goldfinger - 2000 - Stomping Ground (FLAC)	12 - Get Away.flac	-8.590004	0.988617
what.cd/Goldfinger - 2000 - Stomping Ground (FLAC)	13 - 99 Red Balloons.flac	-7.820000	0.871033
what.cd/Goldfinger - 2000 - Stomping Ground (FLAC)	14 - Donut Dan.flac	-9.529999	0.988617
what.cd/Goldfinger - 99 Red Balloons [FLAC]	01 99 Red Balloons.flac	-7.340004	0.816650
what.cd/Goldfinger - 99 Red Balloons [FLAC]	02 Miles Away.flac	-6.940002	0.926788
what.cd/Goldfinger - 99 Red Balloons [FLAC]	03 Superman.flac	-8.410004	0.944122
what.cd/Goldfinger - 99 Red Balloons [FLAC]	04 Radio.flac	-8.989998	0.988678
what.cd/Green Day - Basket Case (CDS)	01 - Basket Case.flac	-6.040001	0.944336
what.cd/Green Day - Basket Case (CDS)	02 - On The Wagon (Non-LP Track).flac	1.579998	0.979126
what.cd/Green Day - Basket Case (CDS)	03 - Tired Of Waiting For You.flac	-1.650002	0.882538
what.cd/Green Day - Basket Case (CDS)	04 - 409 In Your Coffee Maker (Unmixed).flac	-4.980003	0.988922
what.cd/Guano Apes - Bel Air (2011) - [FLAC]	01 - Sunday Lover.flac	-10.260002	0.998749
what.cd/Guano Apes - Bel Air (2011) - [FLAC]	02 - Oh What a Night.flac	-11.989998	0.998749
what.cd/Guano Apes - Bel Air (2011) - [FLAC]	03 - When the Ships Arrive.flac	-10.309998	0.998749
what.cd/Guano Apes - Bel Air (2011) - [FLAC]	04 - This Time.flac	-9.989998	0.998749
what.cd/Guano Apes - Bel Air (2011) - [FLAC]	05 - She's a Killer.flac	-10.090004	0.986145
what.cd/Guano Apes - Bel Air (2011) - [FLAC]	06 - Tiger.flac	-10.889999	0.986145
what.cd/Guano Apes - Bel Air (2011) - [FLAC]	07 - Fanman.flac	-10.360001	0.998749
what.cd/Guano Apes - Bel Air (2011) - [FLAC]	08 - All I Wanna Do.flac	-10.900002	0.998749
what.cd/Guano Apes - Bel Air (2011) - [FLAC]	09 - Fire in Your Eyes.flac	-10.180000	0.998749
what.cd/Guano Apes - Bel Air (2011) - [FLAC]	10 - Trust.flac	-10.070000	0.986145
what.cd/Guano Apes - Proud Like A God (1997)	01 - Open Your Eyes.flac	-7.349998	0.999969
what.cd/Guano Apes - Proud Like A God (1997)	02 - Maria.flac	-5.190002	0.999969
what.cd/Guano Apes - Proud Like A God (1997)	03 - Rain.flac	-6.340004	0.999969
what.cd/Guano Apes - Proud Like A God (1997)	04 - Lords Of The Boards.flac	-6.989998	0.958862
what.cd/Guano Apes - Proud Like A God (1997)	05 - Crossing The Deadline.flac	-6.070000	0.999969
what.cd/Guano Apes - Proud Like A God (1997)	06 - We Use The Pain.flac	-6.980003	0.999969
what.cd/Guano Apes - Proud Like A God (1997)	07 - Never Born.flac	-5.720001	0.997131
what.cd/Guano Apes - Proud Like A God (1997)	08 - Wash It Down.flac	-6.779999	0.999969
what.cd/Guano Apes - Proud Like A God (1997)	09 - Scapegoat.flac	-4.190002	0.999969
what.cd/Guano Apes - Proud Like A God (1997)	10 - Get Busy.flac	-6.230003	0.999969
what.cd/Guano Apes - Proud Like A God (1997)	11 - Suzie.flac	-6.300003	0.995087
what.cd/Guano Apes - Proud Like A God (1997)	12 - Tribute.flac	-5.830002	0.999969
what.cd/Guano Apes - Proud Like A God (1997)	13 - (Empty).flac	64.820000	0.000122
what.cd/Guano Apes - Proud Like A God (1997)	14 - (Empty).flac	64.820000	0.000122
what.cd/Guano Apes - Proud Like A God (1997)	15 - (Empty).flac	64.820000	0.000122
what.cd/Guano Apes - Proud Like A God (1997)	16 - (Empty).flac	64.820000	0.000122
what.cd/Guano Apes - Proud Like A God (1997)	17 - (Empty).flac	64.820000	0.000122
what.cd/Guano Apes - Proud Like A God (1997)	18 - Move A Little Closer.flac	-6.110001	0.999969
what.cd/(hed)p.e. - 2000 - Broke - FLAC	01 - Killing Time.flac	-10.760002	1.000000
what.cd/(hed)p.e. - 2000 - Broke - FLAC	02 - Waiting To Die.flac	-9.660004	0.999969
what.cd/(hed)p.e. - 2000 - Broke - FLAC	03 - Feel Good.flac	-9.949997	0.999969
what.cd/(hed)p.e. - 2000 - Broke - FLAC	04 - Bartender.flac	-10.750000	0.999969
what.cd/(hed)p.e. - 2000 - Broke - FLAC	05 - Crazy Legs.flac	-10.129997	0.999969
what.cd/(hed)p.e. - 2000 - Broke - FLAC	06 - Pac Bell.flac	-9.590004	0.999969
what.cd/(hed)p.e. - 2000 - Broke - FLAC	07 - I Got You.flac	-10.769997	1.000000
what.cd/(hed)p.e. - 2000 - Broke - FLAC	08 - Boom (How You Like That).flac	-10.379997	0.999969
what.cd/(hed)p.e. - 2000 - Broke - FLAC	09 - Swan Dive.flac	-10.260002	0.999969
what.cd/(hed)p.e. - 2000 - Broke - FLAC	10 - Stevie.flac	-10.699997	0.999969
what.cd/(hed)p.e. - 2000 - Broke - FLAC	11 - Jesus (Of Nazareth).flac	-11.910004	0.999969
what.cd/(hed)p.e. - 2000 - Broke - FLAC	12 - The Meadow.flac	-6.090004	1.000000
what.cd/Hiromi - Alive (2014) [FLAC]	01 - Alive.flac	-5.250000	0.975922
what.cd/Hiromi - Alive (2014) [FLAC]	02 - Wanderer.flac	-3.440002	0.975769
what.cd/Hiromi - Alive (2014) [FLAC]	03 - Dreamer.flac	-3.500000	0.972290
what.cd/Hiromi - Alive (2014) [FLAC]	04 - Seeker.flac	-4.800003	0.975769
what.cd/Hiromi - Alive (2014) [FLAC]	05 - Player.flac	-5.720001	0.975952
what.cd/Hiromi - Alive (2014) [FLAC]	06 - Warrior.flac	-4.720001	0.975769
what.cd/Hiromi - Alive (2014) [FLAC]	07 - Firefly.flac	1.290001	0.831787
what.cd/Hiromi - Alive (2014) [FLAC]	08 - Spirit.flac	-4.010002	0.975739
what.cd/Hiromi - Alive (2014) [FLAC]	09 - Life Goes On.flac	-6.410004	0.975769
what.cd/Horrorpops - 2005 - Bring It On!	01 - Freaks In Uniforms.flac	-10.000000	0.966187
what.cd/Horrorpops - 2005 - Bring It On!	02 - Hit 'N' Run.flac	-9.849998	0.972260
what.cd/Horrorpops - 2005 - Bring It On!	03 - Bring It On!.flac	-9.559998	0.966187
what.cd/Horrorpops - 2005 - Bring It On!	04 - It's Been So Long.flac	-9.940002	0.966187
what.cd/Horrorpops - 2005 - Bring It On!	05 - Undefeated.flac	-10.180000	0.966187
what.cd/Horrorpops - 2005 - Bring It On!	06 - You vs. Me.flac	-10.120003	0.966217
what.cd/Horrorpops - 2005 - Bring It On!	07 - Crawl Straight Home.flac	-9.779999	0.966187
what.cd/Horrorpops - 2005 - Bring It On!	08 - Trapped.flac	-9.690002	0.966187
what.cd/Horrorpops - 2005 - Bring It On!	09 - Walk Like A Zombie.flac	-9.779999	0.966187
what.cd/Horrorpops - 2005 - Bring It On!	10 - Where You Can't Follow.flac	-11.070000	0.966187
what.cd/Horrorpops - 2005 - Bring It On!	11 - Caught In A Blond.flac	-10.540001	0.966248
what.cd/Horrorpops - 2005 - Bring It On!	12 - S.O.B..flac	-8.930000	0.966217
what.cd/Horrorpops - 2005 - Bring It On!	13 - Who's Leading You Now.flac	-10.559998	0.966187
what.cd/Horrorpops - Hell Yeah! - lossless	01 - Horrorpops - Julia.flac	-9.680000	0.912140
what.cd/Horrorpops - Hell Yeah! - lossless	02 - Horrorpops - Drama Queen.flac	-9.169998	1.000000
what.cd/Horrorpops - Hell Yeah! - lossless	03 - Horrorpops - Ghouls.flac	-8.680000	0.922729
what.cd/Horrorpops - Hell Yeah! - lossless	04 - Horrorpops - Girl In A Cage.flac	-7.660004	0.912140
what.cd/Horrorpops - Hell Yeah! - lossless	05 - Horrorpops - Miss Take.flac	-9.599998	0.988647
what.cd/Horrorpops - Hell Yeah! - lossless	06 - Horrorpops - Where They Wander.flac	-7.980003	0.988647
what.cd/Horrorpops - Hell Yeah! - lossless	07 - Horrorpops - Kool Flattop.flac	-8.540001	0.955109
what.cd/Horrorpops - Hell Yeah! - lossless	08 - Horrorpops - Psychobitches Outta Hell.flac	-9.400002	0.988647
what.cd/Horrorpops - Hell Yeah! - lossless	09 - Horrorpops - Dotted With Hearts.flac	-7.699997	0.901733
what.cd/Horrorpops - Hell Yeah! - lossless	10 - Horrorpops - Baby Lou Tattoo.flac	-9.430000	0.891388
what.cd/Horrorpops - Hell Yeah! - lossless	11 - Horrorpops - What's Under My Bed.flac	-8.849998	0.988617
what.cd/Horrorpops - Hell Yeah! - lossless	12 - Horrorpops - Emotional Abuse.flac	-7.400002	0.966125
what.cd/Horrorpops - Hell Yeah! - lossless	13 - Horrorpops - Horrorbeach.flac	-8.529999	1.000000
what.cd/How It Goes	01 - Big D And The Kids Table - The Sounds Of Allston Village.flac	-10.389999	1.000000
what.cd/How It Goes	02 - Big D And The Kids Table - LAX.flac	-12.529999	1.000000
what.cd/How It Goes	03 - Big D And The Kids Table - New Nail Bed.flac	-13.279999	1.000000
what.cd/How It Goes	04 - Big D And The Kids Table - If We Want To.flac	-12.550003	1.000000
what.cd/How It Goes	05 - Big D And The Kids Table - Flashlight.flac	-12.889999	1.000000
what.cd/How It Goes	06 - Big D And The Kids Table - Girls Against Drunk Bitches.flac	-12.389999	1.000000
what.cd/How It Goes	07 - Big D And The Kids Table - You Lost, You're Crazy.flac	-12.389999	1.000000
what.cd/How It Goes	08 - Big D And The Kids Table - Bender.flac	-13.010002	1.000000
what.cd/How It Goes	09 - Big D And The Kids Table - Safe Haven.flac	-11.169998	1.000000
what.cd/How It Goes	10 - Big D And The Kids Table - You're Me Now.flac	-12.559998	1.000000
what.cd/How It Goes	11 - Big D And The Kids Table - Voice Alone.flac	-12.470001	1.000000
what.cd/How It Goes	12 - Big D And The Kids Table - My Girlfriend's On Drugs.flac	-12.500000	1.000000
what.cd/How It Goes	13 - Big D And The Kids Table - President.flac	-13.199997	1.000000
what.cd/How It Goes	14 - Big D And The Kids Table - Cutshow.flac	-11.620003	1.000000
what.cd/How It Goes	15 - Big D And The Kids Table - Little Bitch.flac	-12.709999	1.000000
what.cd/How It Goes	16 - Big D And The Kids Table - (We All Have To) Burn Something.flac	-11.180000	1.000000
what.cd/How It Goes	17 - Big D And The Kids Table - 175.flac	-12.110001	1.000000
what.cd/How It Goes	18 - Big D And The Kids Table - Chicago.flac	-11.709999	1.000000
what.cd/How It Goes	19 - Big D And The Kids Table - How It Goes.flac	-9.970001	1.000000
what.cd/How It Goes	20 - Big D And The Kids Table - Moment Without An End.flac	-12.309998	1.000000
what.cd/Imperial Leisure - 2012 - Death To The One Trick Pony[FLAC]	01 - Imperial Leisure - Clown At The Funeral.flac	-5.400002	0.966156
what.cd/Imperial Leisure - 2012 - Death To The One Trick Pony[FLAC]	02 - Imperial Leisure - Number One.flac	-5.720001	0.966156
what.cd/Imperial Leisure - 2012 - Death To The One Trick Pony[FLAC]	03 - Imperial Leisure - Dance Floor.flac	-6.070000	0.966187
what.cd/Imperial Leisure - 2012 - Death To The One Trick Pony[FLAC]	04 - Imperial Leisure - Can't Lie.flac	-6.269997	0.966187
what.cd/Imperial Leisure - 2012 - Death To The One Trick Pony[FLAC]	05 - Imperial Leisure - All In Good Time.flac	-5.639999	0.966187
what.cd/Imperial Leisure - 2012 - Death To The One Trick Pony[FLAC]	06 - Imperial Leisure - Dead Model.flac	-6.419998	0.966187
what.cd/Imperial Leisure - 2012 - Death To The One Trick Pony[FLAC]	07 - Imperial Leisure - Thin Line.flac	-6.199997	0.966187
what.cd/Imperial Leisure - 2012 - Death To The One Trick Pony[FLAC]	08 - Imperial Leisure - I Thought They'd Love You.flac	-4.099998	0.966156
what.cd/Imperial Leisure - 2012 - Death To The One Trick Pony[FLAC]	09 - Imperial Leisure - Bitter And Twisted.flac	-5.540001	0.966187
what.cd/Imperial Leisure - 2012 - Death To The One Trick Pony[FLAC]	10 - Imperial Leisure - London To Brighton.flac	-6.169998	0.966187
what.cd/Imperial Leisure - 2012 - Death To The One Trick Pony[FLAC]	11 - Imperial Leisure - Talk To Me.flac	-6.059998	0.966187
what.cd/Imperial Leisure - 2012 - Death To The One Trick Pony[FLAC]	12 - Imperial Leisure - Saturday Night.flac	-7.750000	0.966217
what.cd/Imperial Leisure - 2012 - Death To The One Trick Pony[FLAC]	13 - Imperial Leisure - Truth Hurts.flac	-5.519997	0.966187
what.cd/Imperial Leisure - 2012 - Death To The One Trick Pony[FLAC]	14 - Imperial Leisure - Song For Paul.flac	-4.849998	0.966156
what.cd/Inner Circle-Bad Boys [FLAC]	01-Sweat (A La La La La Long).flac	-5.900002	0.972870
what.cd/Inner Circle-Bad Boys [FLAC]	02-Bad Boys - (Theme From Cops).flac	-6.400002	0.950745
what.cd/Inner Circle-Bad Boys [FLAC]	03-Rock With You.flac	-6.160004	0.950745
what.cd/Inner Circle-Bad Boys [FLAC]	04-Wrapped Up In Your Love.flac	-2.750000	0.967529
what.cd/Inner Circle-Bad Boys [FLAC]	05-Looking For A Better Way.flac	-6.340004	0.972870
what.cd/Inner Circle-Bad Boys [FLAC]	06-Sunglasses At Night.flac	-3.989998	0.972870
what.cd/Inner Circle-Bad Boys [FLAC]	07-Living It Up.flac	-4.529999	0.950745
what.cd/Inner Circle-Bad Boys [FLAC]	08-Hey Love.flac	-4.360001	0.945526
what.cd/Inner Circle-Bad Boys [FLAC]	09-Bad To The Bone.flac	-5.269997	0.875031
what.cd/Inner Circle-Bad Boys [FLAC]	10-Down By The River.flac	-5.029999	0.950745
what.cd/Inner Circle-Bad Boys [FLAC]	11-Slow It Down.flac	-3.190002	0.950684
what.cd/Inner Circle-Bad Boys [FLAC]	12-Sweat (A La La La La Long) - (Dancehall Mix).flac	-5.660004	0.962189
what.cd/Inner Circle-Bad Boys [FLAC]	13-Tear Down These Walls.flac	-4.970001	0.950745
what.cd/Inner Circle-Bad Boys [FLAC]	14-Bad Boys - (David Morales Mix).flac	-4.510002	0.950745
what.cd/Irie Révoltés - Allez [FLAC] {2013}	01 - Allez!.flac	-10.239998	0.988129
what.cd/Irie Révoltés - Allez [FLAC] {2013}	02 - La Réalité.flac	-7.860001	0.988129
what.cd/Irie Révoltés - Allez [FLAC] {2013}	03 - Citoyen Du Monde.flac	-10.430000	0.988129
what.cd/Irie Révoltés - Allez [FLAC] {2013}	04 - La Marche.flac	-7.739998	0.988129
what.cd/Irie Révoltés - Allez [FLAC] {2013}	05 - Continuer.flac	-9.050003	0.988129
what.cd/Irie Révoltés - Allez [FLAC] {2013}	06 - Résisdanse.flac	-6.529999	0.988129
what.cd/Irie Révoltés - Allez [FLAC] {2013}	07 - Tout Casser.flac	-11.010002	0.988129
what.cd/Irie Révoltés - Allez [FLAC] {2013}	08 - Ensemble.flac	-9.480003	0.988129
what.cd/Irie Révoltés - Allez [FLAC] {2013}	09 - La Prix!.flac	-8.180000	0.988129
what.cd/Irie Révoltés - Allez [FLAC] {2013}	10 - Make Some Noise.flac	-7.480003	0.988129
what.cd/Irie Révoltés - Allez [FLAC] {2013}	11 - Partout.flac	-10.139999	0.988129
what.cd/Irie Révoltés - Allez [FLAC] {2013}	12 - Une Nouvelle Journée.flac	-9.510002	0.988129
what.cd/Iron Maiden (1986) - Somewhere In Time [FLAC]	01 - Caught Somewhere In Time.flac	-3.860001	0.999908
what.cd/Iron Maiden (1986) - Somewhere In Time [FLAC]	02 - Wasted Years.flac	-3.540001	1.000000
what.cd/Iron Maiden (1986) - Somewhere In Time [FLAC]	03 - Sea Of Madness.flac	-2.760002	0.923523
what.cd/Iron Maiden (1986) - Somewhere In Time [FLAC]	04 - Heaven Can Wait.flac	-1.709999	0.820679
what.cd/Iron Maiden (1986) - Somewhere In Time [FLAC]	05 - The Loneliness Of The Long Distance Runner.flac	-3.760002	0.978943
what.cd/Iron Maiden (1986) - Somewhere In Time [FLAC]	06 - Stranger In A Strange Land.flac	-3.129997	0.999969
what.cd/Iron Maiden (1986) - Somewhere In Time [FLAC]	07 - Deja-Vu.flac	-3.400002	0.998413
what.cd/Iron Maiden (1986) - Somewhere In Time [FLAC]	08 - Alexander The Great.flac	-3.029999	0.963684
what.cd/Iron Maiden (1992) - Fear Of The Dark [FLAC]	01 - Be Quick Or Be Dead.flac	-5.910004	0.927917
what.cd/Iron Maiden (1992) - Fear Of The Dark [FLAC]	02 - From Here To Eternity.flac	-6.529999	0.928436
what.cd/Iron Maiden (1992) - Fear Of The Dark [FLAC]	03 - Afraid To Shoot Strangers.flac	-5.720001	0.929169
what.cd/Iron Maiden (1992) - Fear Of The Dark [FLAC]	04 - Fear Is The Key.flac	-5.489998	0.927460
what.cd/Iron Maiden (1992) - Fear Of The Dark [FLAC]	05 - Childhood's End.flac	-5.389999	0.931061
what.cd/Iron Maiden (1992) - Fear Of The Dark [FLAC]	06 - Wasting Love.flac	-4.360001	0.927612
what.cd/Iron Maiden (1992) - Fear Of The Dark [FLAC]	07 - The Fugitive.flac	-4.660004	0.928467
what.cd/Iron Maiden (1992) - Fear Of The Dark [FLAC]	08 - Chains Of Misery.flac	-5.389999	0.927368
what.cd/Iron Maiden (1992) - Fear Of The Dark [FLAC]	09 - The Apparition.flac	-4.989998	0.928436
what.cd/Iron Maiden (1992) - Fear Of The Dark [FLAC]	10 - Judas Be My Guide.flac	-5.690002	0.927460
what.cd/Iron Maiden (1992) - Fear Of The Dark [FLAC]	11 - Weekend Warrior.flac	-4.989998	0.928223
what.cd/Iron Maiden (1992) - Fear Of The Dark [FLAC]	12 - Fear Of The Dark.flac	-4.919998	0.927460
what.cd/Iron Maiden - Iron Maiden (1980)	01 - Prowler.flac	-5.660004	0.977234
what.cd/Iron Maiden - Iron Maiden (1980)	02 - Remember Tomorrow.flac	-5.690002	0.977234
what.cd/Iron Maiden - Iron Maiden (1980)	03 - Running Free.flac	-6.970001	0.977234
what.cd/Iron Maiden - Iron Maiden (1980)	04 - Phantom Of The Opera.flac	-5.709999	0.977234
what.cd/Iron Maiden - Iron Maiden (1980)	05 - Transylvania.flac	-7.750000	0.977234
what.cd/Iron Maiden - Iron Maiden (1980)	06 - Strange World.flac	-4.070000	0.977234
what.cd/Iron Maiden - Iron Maiden (1980)	07 - Charlotte The Harlot.flac	-6.660004	0.977234
what.cd/Iron Maiden - Iron Maiden (1980)	08 - Iron Maiden.flac	-7.250000	0.977234
what.cd/Izia - 2011 - So Much Trouble [FLAC]	01-Izia-Baby.flac	-10.959999	1.000000
what.cd/Izia - 2011 - So Much Trouble [FLAC]	02-Izia-So Much Trouble.flac	-11.590004	1.000000
what.cd/Izia - 2011 - So Much Trouble [FLAC]	03-Izia-Your Love Is A Gift.flac	-11.389999	1.000000
what.cd/Izia - 2011 - So Much Trouble [FLAC]	04-Izia-I Can Dance.flac	-10.910004	1.000000
what.cd/Izia - 2011 - So Much Trouble [FLAC]	05-Izia-On The Top Of The World.flac	-10.209999	1.000000
what.cd/Izia - 2011 - So Much Trouble [FLAC]	06-Izia-Penicilline.flac	-11.180000	1.000000
what.cd/Izia - 2011 - So Much Trouble [FLAC]	07-Izia-Twenty Times A Day.flac	-10.059998	1.000000
what.cd/Izia - 2011 - So Much Trouble [FLAC]	08-Izia-That Night.flac	-10.349998	1.000000
what.cd/Izia - 2011 - So Much Trouble [FLAC]	09-Izia-She.flac	-10.370003	1.000000
what.cd/Izia - 2011 - So Much Trouble [FLAC]	10-Izia-I Hate You.flac	-11.410004	1.000000
what.cd/Jaya The Cat - 2012 - The New International Sound Of Hedonism[FLAC]	01 - Jaya The Cat - Rebel Sound.flac	-8.800003	0.995575
what.cd/Jaya The Cat - 2012 - The New International Sound Of Hedonism[FLAC]	02 - Jaya The Cat - Late Night Sonic Insurrection.flac	-8.110001	0.996429
what.cd/Jaya The Cat - 2012 - The New International Sound Of Hedonism[FLAC]	03 - Jaya The Cat - Here Come The Drums.flac	-7.480003	0.994934
what.cd/Jaya The Cat - 2012 - The New International Sound Of Hedonism[FLAC]	04 - Jaya The Cat - Bos En Lommerweg.flac	-8.739998	0.889557
what.cd/Jaya The Cat - 2012 - The New International Sound Of Hedonism[FLAC]	05 - Jaya The Cat - Unconditional Love.flac	-7.620003	0.995941
what.cd/Jaya The Cat - 2012 - The New International Sound Of Hedonism[FLAC]	06 - Jaya The Cat - Put A Boombox On My Grave.flac	-8.709999	0.995941
what.cd/Jaya The Cat - 2012 - The New International Sound Of Hedonism[FLAC]	07 - Jaya The Cat - One Way Ticket Home.flac	-6.220001	1.000000
what.cd/Jaya The Cat - 2012 - The New International Sound Of Hedonism[FLAC]	08 - Jaya The Cat - Thessaloniki.flac	-9.190002	0.889557
what.cd/Jaya The Cat - 2012 - The New International Sound Of Hedonism[FLAC]	09 - Jaya The Cat - Peace And Love.flac	-8.559998	0.994781
what.cd/Jaya The Cat - 2012 - The New International Sound Of Hedonism[FLAC]	10 - Jaya The Cat - Fake Carreras.flac	-9.449997	0.994324
what.cd/Jaya The Cat - 2012 - The New International Sound Of Hedonism[FLAC]	11 - Jaya The Cat - Two Ships Passing.flac	-8.519997	0.994720
what.cd/Jaya The Cat - 2012 - The New International Sound Of Hedonism[FLAC]	12 - Jaya The Cat - Date With A Needle.flac	-9.139999	0.994293
what.cd/Jaya The Cat - 2012 - The New International Sound Of Hedonism[FLAC]	13 - Jaya The Cat - This Could All Go So Horribly Wrong.flac	-8.650002	0.994324
what.cd/Jaya The Cat - 2012 - The New International Sound Of Hedonism[FLAC]	14 - Jaya The Cat - Thank You.flac	-7.809998	0.994354
what.cd/Jaya The Cat - 2012 - The New International Sound Of Hedonism[FLAC]	15 - Jaya The Cat - Wayne É.flac	1.759998	0.374786
what.cd/Jaya The Cat - More Late Night Transmissions With (2007) [FLAC]	01 - Hold My Beer And Watch This.flac	-4.849998	0.999847
what.cd/Jaya The Cat - More Late Night Transmissions With (2007) [FLAC]	02 - Blur.flac	-6.910004	0.999939
what.cd/Jaya The Cat - More Late Night Transmissions With (2007) [FLAC]	03 - Good Morning.flac	-6.750000	1.000000
what.cd/Jaya The Cat - More Late Night Transmissions With (2007) [FLAC]	04 - Thank You Reggae.flac	-6.660004	0.999969
what.cd/Jaya The Cat - More Late Night Transmissions With (2007) [FLAC]	05 - Hello Hangover.flac	-6.459999	0.999939
what.cd/Jaya The Cat - More Late Night Transmissions With (2007) [FLAC]	06 - Mistake.flac	-8.019997	0.999969
what.cd/Jaya The Cat - More Late Night Transmissions With (2007) [FLAC]	07 - Chemical Salvation.flac	-6.840004	0.997681
what.cd/Jaya The Cat - More Late Night Transmissions With (2007) [FLAC]	08 - Pass The Ammunition.flac	-6.190002	1.000000
what.cd/Jaya The Cat - More Late Night Transmissions With (2007) [FLAC]	09 - Night Bus.flac	-6.540001	0.994995
what.cd/Jaya The Cat - More Late Night Transmissions With (2007) [FLAC]	10 - Carnival.flac	-8.000000	0.999939
what.cd/Jaya The Cat - More Late Night Transmissions With (2007) [FLAC]	11 - Voice Of The Poor.flac	-7.790001	0.999969
what.cd/Jaya The Cat - More Late Night Transmissions With (2007) [FLAC]	12 - Government Center.flac	-7.660004	0.998077
what.cd/Jaya The Cat - More Late Night Transmissions With (2007) [FLAC]	13 - Closing Time.flac	-6.779999	0.999329
what.cd/Jefferson Airplane - Surrealistic Pillow	01 - She Has Funny Cars.flac	-5.889999	0.883789
what.cd/Jefferson Airplane - Surrealistic Pillow	02 - Somebody To Love.flac	-6.040001	0.798767
what.cd/Jefferson Airplane - Surrealistic Pillow	03 - My Best Friend.flac	-6.290001	1.000000
what.cd/Jefferson Airplane - Surrealistic Pillow	04 - Today.flac	-4.139999	1.000000
what.cd/Jefferson Airplane - Surrealistic Pillow	05 - Comin' Back To Me.flac	1.739998	0.677979
what.cd/Jefferson Airplane - Surrealistic Pillow	06 - 3-5 Of A Mile In 10 Seconds.flac	-7.349998	0.994324
what.cd/Jefferson Airplane - Surrealistic Pillow	07 - D.C.B.A. - 25.flac	-5.580002	1.000000
what.cd/Jefferson Airplane - Surrealistic Pillow	08 - How Do You Feel.flac	-5.309998	1.000000
what.cd/Jefferson Airplane - Surrealistic Pillow	09 - Embryonic Journey.flac	-2.739998	0.998657
what.cd/Jefferson Airplane - Surrealistic Pillow	10 - White Rabbit.flac	-4.730003	1.000000
what.cd/Jefferson Airplane - Surrealistic Pillow	11 - Plastic Fantastic Lover.flac	-4.970001	1.000000
what.cd/Jefferson Airplane - Surrealistic Pillow	12 - In The Morning.flac	-4.260002	0.882446
what.cd/Jefferson Airplane - Surrealistic Pillow	13 - J.P.P.McStep B. Blues.flac	-4.370003	0.952606
what.cd/Jefferson Airplane - Surrealistic Pillow	14 - Go To Her [Version Two].flac	-6.510002	0.942474
what.cd/Jefferson Airplane - Surrealistic Pillow	15 - Come Back Baby.flac	-5.230003	1.000000
what.cd/Jefferson Airplane - Surrealistic Pillow	16 - Somebody To Love [Mono Single Version].flac	-7.080002	0.861145
what.cd/Jefferson Airplane - Surrealistic Pillow	17 - White Rabbit [Mono Single Version].flac	-5.550003	1.000000
what.cd/Joe Satriani - Flying In A Blue Dream - HDTRACKS - 96-24	01-Flying in a Blue Dream.flac	-6.720001	0.891238
what.cd/Joe Satriani - Flying In A Blue Dream - HDTRACKS - 96-24	02-The Mystical Potato Head Groove Thing.flac	-8.489998	0.891239
what.cd/Joe Satriani - Flying In A Blue Dream - HDTRACKS - 96-24	03-Can't Slow Down.flac	-9.370003	0.891239
what.cd/Joe Satriani - Flying In A Blue Dream - HDTRACKS - 96-24	04-Headless.flac	-6.330002	0.891037
what.cd/Joe Satriani - Flying In A Blue Dream - HDTRACKS - 96-24	05-Strange.flac	-8.250000	0.891239
what.cd/Joe Satriani - Flying In A Blue Dream - HDTRACKS - 96-24	06-I Believe.flac	-7.889999	0.891239
what.cd/Joe Satriani - Flying In A Blue Dream - HDTRACKS - 96-24	07-One Big Rush.flac	-8.840004	0.891239
what.cd/Joe Satriani - Flying In A Blue Dream - HDTRACKS - 96-24	08-Big Bad Moon.flac	-9.330002	0.891239
what.cd/Joe Satriani - Flying In A Blue Dream - HDTRACKS - 96-24	09-The Feeling.flac	-1.070000	0.778286
what.cd/Joe Satriani - Flying In A Blue Dream - HDTRACKS - 96-24	10-The Phone Call.flac	-8.720001	0.891239
what.cd/Joe Satriani - Flying In A Blue Dream - HDTRACKS - 96-24	11-Day at the Beach (New Rays from an Ancient Sun).flac	-3.739998	0.891036
what.cd/Joe Satriani - Flying In A Blue Dream - HDTRACKS - 96-24	12-Back to Shalla-Bal.flac	-9.739998	0.891239
what.cd/Joe Satriani - Flying In A Blue Dream - HDTRACKS - 96-24	13-Ride.flac	-7.919998	0.891239
what.cd/Joe Satriani - Flying In A Blue Dream - HDTRACKS - 96-24	14-The Forgotten, Pt. 1.flac	-3.570000	0.891037
what.cd/Joe Satriani - Flying In A Blue Dream - HDTRACKS - 96-24	15-The Forgotten, Pt. 2.flac	-7.260002	0.891239
what.cd/Joe Satriani - Flying In A Blue Dream - HDTRACKS - 96-24	16-The Bells of Lal, Pt.1.flac	-2.230003	0.494600
what.cd/Joe Satriani - Flying In A Blue Dream - HDTRACKS - 96-24	17-The Bells of Lal, Pt. 2.flac	-7.129997	0.891239
what.cd/Joe Satriani - Flying In A Blue Dream - HDTRACKS - 96-24	18-Into the Light.flac	-6.510002	0.891239
what.cd/Joe Satriani  - Surfing With The Alien (MFSL - UDCD-751)	01 - Joe Satriani - Surfing With The Alien.flac	-4.139999	1.000000
what.cd/Joe Satriani  - Surfing With The Alien (MFSL - UDCD-751)	02 - Joe Satriani - Ice 9.flac	-3.900002	1.000000
what.cd/Joe Satriani  - Surfing With The Alien (MFSL - UDCD-751)	03 - Joe Satriani - Crushing Day.flac	-4.889999	1.000000
what.cd/Joe Satriani  - Surfing With The Alien (MFSL - UDCD-751)	04 - Joe Satriani - Always With Me, Always With You.flac	-4.639999	1.000000
what.cd/Joe Satriani  - Surfing With The Alien (MFSL - UDCD-751)	05 - Joe Satriani - Satch Boogie.flac	-3.019997	1.000000
what.cd/Joe Satriani  - Surfing With The Alien (MFSL - UDCD-751)	06 - Joe Satriani - Hill Of The Skull.flac	-2.750000	1.000000
what.cd/Joe Satriani  - Surfing With The Alien (MFSL - UDCD-751)	07 - Joe Satriani - Circles.flac	-1.660004	1.000000
what.cd/Joe Satriani  - Surfing With The Alien (MFSL - UDCD-751)	08 - Joe Satriani - Lords Of Karma.flac	-4.709999	1.000000
what.cd/Joe Satriani  - Surfing With The Alien (MFSL - UDCD-751)	09 - Joe Satriani - Midnight.flac	-3.199997	0.963928
what.cd/Joe Satriani  - Surfing With The Alien (MFSL - UDCD-751)	10 - Joe Satriani - Echo.flac	-3.840004	1.000000
what.cd/King Blues - Save The World, Get The Girl	01 My Boulder.flac	-11.459999	1.000000
what.cd/King Blues - Save The World, Get The Girl	02 I Got Love.flac	-8.580002	0.999969
what.cd/King Blues - Save The World, Get The Girl	03 The Schemers, The Scroungers, And The Rats.flac	-9.230003	0.999969
what.cd/King Blues - Save The World, Get The Girl	04 Underneath This Lamppost Light.flac	-8.290001	0.999908
what.cd/King Blues - Save The World, Get The Girl	05 Save The World, Get The Girl.flac	-8.730003	1.000000
what.cd/King Blues - Save The World, Get The Girl	06 For You My Darling.flac	-9.570000	0.988831
what.cd/King Blues - Save The World, Get The Girl	07 The Streets Are Ours.flac	-8.160004	1.000000
what.cd/King Blues - Save The World, Get The Girl	08 Let's Hang The Landlord.flac	-12.519997	1.000000
what.cd/King Blues - Save The World, Get The Girl	09 Out Of Luck.flac	-7.779999	0.999969
what.cd/King Blues - Save The World, Get The Girl	10 Hold On Tight.flac	-7.639999	0.999969
what.cd/King Blues - Save The World, Get The Girl	11 What If Punk Never Happened.flac	-7.459999	1.000000
what.cd/King Prawn - 2003 - Got The Thirst [FLAC]	01 - Bring Down The House.flac	-9.239998	0.988586
what.cd/King Prawn - 2003 - Got The Thirst [FLAC]	02 - The Dominant View.flac	-8.570000	0.988556
what.cd/King Prawn - 2003 - Got The Thirst [FLAC]	03 - Caught Inna Rut.flac	-8.599998	0.988586
what.cd/King Prawn - 2003 - Got The Thirst [FLAC]	04 - Smoke Some Shit.flac	-9.199997	0.988586
what.cd/King Prawn - 2003 - Got The Thirst [FLAC]	05 - The Loneiest Life.flac	-8.260002	0.988586
what.cd/King Prawn - 2003 - Got The Thirst [FLAC]	06 - Hell Below.flac	-8.180000	0.988556
what.cd/King Prawn - 2003 - Got The Thirst [FLAC]	07 - Bitter Taste.flac	-8.629997	0.988556
what.cd/King Prawn - 2003 - Got The Thirst [FLAC]	08 - Raise The Banner.flac	-8.790001	0.988586
what.cd/King Prawn - 2003 - Got The Thirst [FLAC]	09 - Lick Of The Flame.flac	-9.620003	0.988586
what.cd/King Prawn - 2003 - Got The Thirst [FLAC]	10 - Gather Round.flac	-7.480003	0.988556
what.cd/King Prawn - 2003 - Got The Thirst [FLAC]	11 - Satan's Folly.flac	-8.459999	0.988556
what.cd/King Prawn - 2003 - Got The Thirst [FLAC]	12 - Another Great Escape.flac	-8.300003	0.988556
what.cd/King Prawn - 2003 - Got The Thirst [FLAC]	13 - Viva Devi.flac	-7.639999	0.989319
what.cd/King Prawn - 2003 - Got The Thirst [FLAC]	14 - If Dawn Comes... We Ride.flac	-6.940002	0.988586
what.cd/Kittie - Brackish (2000) [FLAC] {ATM 668952 2}	01 - Brackish.flac	-9.660004	0.998718
what.cd/Kittie - Brackish (2000) [FLAC] {ATM 668952 2}	02 - Da Shit You Can't Fuc Wit.flac	-8.120003	0.998718
what.cd/Kittie - Brackish (2000) [FLAC] {ATM 668952 2}	03 - Charlotte (Alternate Mellow Version).flac	-7.940002	0.998718
what.cd/KMFDM - Symbols	01 - Megalomaniac.flac	-7.879997	0.980560
what.cd/KMFDM - Symbols	02 - Stray Bullet.flac	-7.250000	0.980530
what.cd/KMFDM - Symbols	03 - Leid Und Elend.flac	-7.879997	0.980286
what.cd/KMFDM - Symbols	04 - Mercy.flac	-8.739998	0.981171
what.cd/KMFDM - Symbols	05 - Torture.flac	-8.120003	0.981689
what.cd/KMFDM - Symbols	06 - Spit Sperm.flac	-9.010002	0.982147
what.cd/KMFDM - Symbols	07 - Anarchy.flac	-8.720001	0.980255
what.cd/KMFDM - Symbols	08 - Down And Out.flac	-7.500000	0.980591
what.cd/KMFDM - Symbols	09 - Unfit.flac	-7.430000	0.982880
what.cd/KMFDM - Symbols	10 - Waste.flac	-8.730003	0.980255
what.cd/Korn - Follow The Leader	01 - (Untitled).flac	64.820000	0.000000
what.cd/Korn - Follow The Leader	02 - (Untitled).flac	64.820000	0.000000
what.cd/Korn - Follow The Leader	03 - (Untitled).flac	64.820000	0.000000
what.cd/Korn - Follow The Leader	04 - (Untitled).flac	64.820000	0.000000
what.cd/Korn - Follow The Leader	05 - (Untitled).flac	64.820000	0.000000
what.cd/Korn - Follow The Leader	06 - (Untitled).flac	64.820000	0.000000
what.cd/Korn - Follow The Leader	07 - (Untitled).flac	64.820000	0.000000
what.cd/Korn - Follow The Leader	08 - (Untitled).flac	64.820000	0.000000
what.cd/Korn - Follow The Leader	09 - (Untitled).flac	64.820000	0.000000
what.cd/Korn - Follow The Leader	10 - (Untitled).flac	64.820000	0.000000
what.cd/Korn - Follow The Leader	11 - (Untitled).flac	64.820000	0.000000
what.cd/Korn - Follow The Leader	12 - (Untitled).flac	64.820000	0.000000
what.cd/Korn - Follow The Leader	13 - It's On!.flac	-7.320000	0.988556
what.cd/Korn - Follow The Leader	14 - Freak On A Leash.flac	-7.820000	0.944061
what.cd/Korn - Follow The Leader	15 - Got The Life.flac	-7.400002	0.988556
what.cd/Korn - Follow The Leader	16 - Dead Bodies Everywhere.flac	-7.889999	0.988556
what.cd/Korn - Follow The Leader	17 - Children Of The Korn.flac	-8.529999	0.944061
what.cd/Korn - Follow The Leader	18 - B.B.K..flac	-8.610001	0.977234
what.cd/Korn - Follow The Leader	19 - Pretty.flac	-7.000000	0.954987
what.cd/Korn - Follow The Leader	20 - All In The Family.flac	-7.690002	0.988556
what.cd/Korn - Follow The Leader	21 - Reclaim My Place.flac	-8.349998	0.954987
what.cd/Korn - Follow The Leader	22 - Justin.flac	-8.620003	0.944061
what.cd/Korn - Follow The Leader	23 - Seed.flac	-8.019997	0.944061
what.cd/Korn - Follow The Leader	24 - Cameltosis.flac	-7.459999	0.954987
what.cd/Korn - Follow The Leader	25 - My Gift To You.flac	-7.760002	0.944061
what.cd/Lacuna Coil - Karmacode [2006] [FLAC]	01 - Fragile.flac	-7.209999	0.979431
what.cd/Lacuna Coil - Karmacode [2006] [FLAC]	02 - To The Edge.flac	-7.629997	0.979431
what.cd/Lacuna Coil - Karmacode [2006] [FLAC]	03 - Our Truth.flac	-7.430000	0.986816
what.cd/Lacuna Coil - Karmacode [2006] [FLAC]	04 - Within Me.flac	-6.910004	0.946594
what.cd/Lacuna Coil - Karmacode [2006] [FLAC]	05 - Devoted.flac	-7.800003	0.979431
what.cd/Lacuna Coil - Karmacode [2006] [FLAC]	06 - You Create.flac	-5.110001	0.964691
what.cd/Lacuna Coil - Karmacode [2006] [FLAC]	07 - What I See.flac	-6.949997	0.985931
what.cd/Lacuna Coil - Karmacode [2006] [FLAC]	08 - Fragments Of Faith.flac	-7.680000	0.979431
what.cd/Lacuna Coil - Karmacode [2006] [FLAC]	09 - Closer.flac	-7.480003	0.964691
what.cd/Lacuna Coil - Karmacode [2006] [FLAC]	10 - In Visible Light.flac	-7.669998	0.990387
what.cd/Lacuna Coil - Karmacode [2006] [FLAC]	11 - The Game.flac	-7.279999	0.964691
what.cd/Lacuna Coil - Karmacode [2006] [FLAC]	12 - Without Fear.flac	-7.559998	0.964691
what.cd/Lacuna Coil - Karmacode [2006] [FLAC]	13 - Enjoy The Silence.flac	-7.830002	0.979431
what.cd/Leftover Crack and Citizen Fish - Deadline	01 Working On The Inside.flac	-7.199997	0.958923
what.cd/Leftover Crack and Citizen Fish - Deadline	02 Money.flac	-7.690002	0.958954
what.cd/Leftover Crack and Citizen Fish - Deadline	03 Meltdown.flac	-7.459999	0.958893
what.cd/Leftover Crack and Citizen Fish - Deadline	04 Getting Used To It.flac	-8.360001	0.977081
what.cd/Leftover Crack and Citizen Fish - Deadline	05 Back To Square One.flac	-6.989998	0.958893
what.cd/Leftover Crack and Citizen Fish - Deadline	06 Join The Dots.flac	-8.199997	0.971863
what.cd/Leftover Crack and Citizen Fish - Deadline	07 Clear Channel (Fuck Off!).flac	-8.290001	0.958954
what.cd/Leftover Crack and Citizen Fish - Deadline	08 L.o.c. Intro (B.d.c.).flac	-8.070000	0.977081
what.cd/Leftover Crack and Citizen Fish - Deadline	09 Baby-Punchers.flac	-9.650002	0.977081
what.cd/Leftover Crack and Citizen Fish - Deadline	10 Genocidal Tendencies.flac	-8.849998	0.977081
what.cd/Leftover Crack and Citizen Fish - Deadline	11 And Out Comes The N-Bomb!.flac	-8.870003	0.977081
what.cd/Leftover Crack and Citizen Fish - Deadline	12 Life Causes Cancer.flac	-7.980003	0.977081
what.cd/Leftover Crack and Citizen Fish - Deadline	13 World War 4.flac	-8.410004	0.977081
what.cd/Leftover Crack and Citizen Fish - Deadline	14 Supermarket Song.flac	-8.800003	0.977081
what.cd/Leftover Crack and Citizen Fish - Deadline	15 Reason For Existence.flac	-7.639999	0.977081
what.cd/Leftover Crack - Fuck World Trade - FLAC	01. Clear Channel (Fuck Off!).flac	-9.239998	0.990967
what.cd/Leftover Crack - Fuck World Trade - FLAC	02. Life Is Pain.flac	-10.809998	0.974243
what.cd/Leftover Crack - Fuck World Trade - FLAC	03. Burn Them Prisons.flac	-10.919998	0.989258
what.cd/Leftover Crack - Fuck World Trade - FLAC	04. Gang Control.flac	-10.650002	0.991150
what.cd/Leftover Crack - Fuck World Trade - FLAC	05. Super Tuesday.flac	-11.320000	0.991028
what.cd/Leftover Crack - Fuck World Trade - FLAC	06. Via Sin Dios.flac	-11.150002	0.970734
what.cd/Leftover Crack - Fuck World Trade - FLAC	07. Feed The Children (Books Of Lies).flac	-11.529999	0.981018
what.cd/Leftover Crack - Fuck World Trade - FLAC	08. One Dead Cop.flac	-10.470001	0.990875
what.cd/Leftover Crack - Fuck World Trade - FLAC	09. Ya Can't Go Home.flac	-10.349998	0.982635
what.cd/Leftover Crack - Fuck World Trade - FLAC	10. Rock The 40 oz..flac	-11.019997	0.991333
what.cd/Leftover Crack - Fuck World Trade - FLAC	11. Soon We'll Be Dead.flac	-9.480003	0.986664
what.cd/Leftover Crack - Fuck World Trade - FLAC	12. Gringos Son Puercos Feos,The Rain.flac	-11.160004	0.991302
what.cd/Leftover Crack - Fuck World Trade - FLAC	13. Operation- M.O.V.E..flac	-9.389999	0.991119
what.cd/Less Than Jake - In with the out crowd (Flac)	01  Less Than Jake - Soundtrack Of My Life.flac	-9.790001	0.998840
what.cd/Less Than Jake - In with the out crowd (Flac)	02  Less Than Jake - A Still Life Franchise.flac	-10.800003	0.998871
what.cd/Less Than Jake - In with the out crowd (Flac)	03  Less Than Jake - Overrated (Everything Is).flac	-10.120003	0.998901
what.cd/Less Than Jake - In with the out crowd (Flac)	04  Less Than Jake - Fall Apart.flac	-9.989998	0.998840
what.cd/Less Than Jake - In with the out crowd (Flac)	05  Less Than Jake - In-Dependence Day.flac	-11.340004	0.998840
what.cd/Less Than Jake - In with the out crowd (Flac)	06  Less Than Jake - Don't Fall Asleep On The Subway.flac	-10.349998	0.998840
what.cd/Less Than Jake - In with the out crowd (Flac)	07  Less Than Jake - Landmines And Landslides.flac	-10.290001	0.998840
what.cd/Less Than Jake - In with the out crowd (Flac)	08  Less Than Jake - The Rest Of My Life.flac	-9.529999	0.998840
what.cd/Less Than Jake - In with the out crowd (Flac)	09  Less Than Jake - Mostly Memories.flac	-10.760002	0.998840
what.cd/Less Than Jake - In with the out crowd (Flac)	10  Less Than Jake - Let Her Go.flac	-9.989998	0.998901
what.cd/Less Than Jake - In with the out crowd (Flac)	11  Less Than Jake - Hopeless Case.flac	-9.599998	0.998840
what.cd/Less Than Jake - In with the out crowd (Flac)	12  Less Than Jake - P.S. Shock The World.flac	-10.320000	0.998840
what.cd/Limbo Messiah	01 - As I Please.flac	-9.099998	0.999939
what.cd/Limbo Messiah	02 - Jane Became Insane.flac	-9.889999	0.997559
what.cd/Limbo Messiah	03 - Sharp, Cool & Collected.flac	-9.980003	0.999664
what.cd/Limbo Messiah	04 - Meantime.flac	-9.769997	0.994843
what.cd/Limbo Messiah	05 - Demons Galore.flac	-10.090004	0.929779
what.cd/Limbo Messiah	06 - Cut Off The Top.flac	-8.840004	0.997559
what.cd/Limbo Messiah	07 - Bad Brain.flac	-10.260002	0.924652
what.cd/Limbo Messiah	08 - She Was Great.flac	-4.340004	0.945465
what.cd/Limbo Messiah	09 - Soljanka.flac	-9.660004	0.994659
what.cd/Limbo Messiah	10 - Hail To The Freaks.flac	-8.230003	0.991028
what.cd/Limbo Messiah	11 - E-G-O.flac	-9.629997	0.952271
what.cd/Limp Bizkit - Chocolate Starfish And The Hot Dog Flavored Water	01 - Limp Bizkit , Intro.flac	-1.730003	0.988556
what.cd/Limp Bizkit - Chocolate Starfish And The Hot Dog Flavored Water	02 - Hot Dog.flac	-10.660004	0.988556
what.cd/Limp Bizkit - Chocolate Starfish And The Hot Dog Flavored Water	03 - My Generation.flac	-11.370003	0.988556
what.cd/Limp Bizkit - Chocolate Starfish And The Hot Dog Flavored Water	04 - Full Nelson.flac	-11.349998	0.988556
what.cd/Limp Bizkit - Chocolate Starfish And The Hot Dog Flavored Water	05 - My Way.flac	-11.599998	0.988556
what.cd/Limp Bizkit - Chocolate Starfish And The Hot Dog Flavored Water	06 - Rollin' (Air Raid Vehicle).flac	-10.250000	0.988556
what.cd/Limp Bizkit - Chocolate Starfish And The Hot Dog Flavored Water	07 - Livin' It Up.flac	-10.739998	0.988556
what.cd/Limp Bizkit - Chocolate Starfish And The Hot Dog Flavored Water	08 - The One.flac	-10.480003	0.989197
what.cd/Limp Bizkit - Chocolate Starfish And The Hot Dog Flavored Water	09 - Getcha Groove On.flac	-8.910004	0.988556
what.cd/Limp Bizkit - Chocolate Starfish And The Hot Dog Flavored Water	10 - Take A Look Around.flac	-10.040001	0.988556
what.cd/Limp Bizkit - Chocolate Starfish And The Hot Dog Flavored Water	11 - It'll Be Ok.flac	-10.970001	0.977234
what.cd/Limp Bizkit - Chocolate Starfish And The Hot Dog Flavored Water	12 - Boiler.flac	-10.760002	0.999969
what.cd/Limp Bizkit - Chocolate Starfish And The Hot Dog Flavored Water	13 - Hold On.flac	-6.410004	0.812836
what.cd/Limp Bizkit - Chocolate Starfish And The Hot Dog Flavored Water	14 - Rollin' (Urban Assault Vehicle).flac	-9.050003	0.988556
what.cd/Limp Bizkit - Chocolate Starfish And The Hot Dog Flavored Water	15 - Outro.flac	-3.410004	0.988556
what.cd/Lindsey Stirling - Lindsey Stirling	01 Electric Daisy Violin.flac	-7.320000	1.000000
what.cd/Lindsey Stirling - Lindsey Stirling	02 Zi-Zi's Journey.flac	-8.800003	1.000000
what.cd/Lindsey Stirling - Lindsey Stirling	03 Crystallize.flac	-6.870003	1.000000
what.cd/Lindsey Stirling - Lindsey Stirling	04 Song of the Caged Bird.flac	-7.820000	1.000000
what.cd/Lindsey Stirling - Lindsey Stirling	05 Moon Trance.flac	-9.220001	1.000000
what.cd/Lindsey Stirling - Lindsey Stirling	06 Minimal Beat.flac	-8.800003	1.000000
what.cd/Lindsey Stirling - Lindsey Stirling	07 Transcendence.flac	-7.860001	1.000000
what.cd/Lindsey Stirling - Lindsey Stirling	08 Elements.flac	-8.590004	1.000000
what.cd/Lindsey Stirling - Lindsey Stirling	09 Shadows.flac	-8.000000	1.000000
what.cd/Lindsey Stirling - Lindsey Stirling	10 Spontaneous Me.flac	-6.660004	1.000000
what.cd/Lindsey Stirling - Lindsey Stirling	11 Anti Gravity.flac	-8.629997	1.000000
what.cd/Lindsey Stirling - Lindsey Stirling	12 Stars Align.flac	-9.209999	0.999969
what.cd/Long Beach Dub Allstars - Wonders Of The World - 2001 (CD - FLAC - Lossless)	01 - Wonders Dub I.flac	-6.989998	0.988647
what.cd/Long Beach Dub Allstars - Wonders Of The World - 2001 (CD - FLAC - Lossless)	02 - Sunny Hours (feat. Will.I.Am).flac	-10.800003	0.988586
what.cd/Long Beach Dub Allstars - Wonders Of The World - 2001 (CD - FLAC - Lossless)	03 - Listen To DJ's.flac	-10.099998	0.988617
what.cd/Long Beach Dub Allstars - Wonders Of The World - 2001 (CD - FLAC - Lossless)	04 - Rolled Up.flac	-10.669998	0.988617
what.cd/Long Beach Dub Allstars - Wonders Of The World - 2001 (CD - FLAC - Lossless)	05 - Every Mother's Dream.flac	-12.220001	0.988617
what.cd/Long Beach Dub Allstars - Wonders Of The World - 2001 (CD - FLAC - Lossless)	06 - Life Goes On (feat. Half Pint, Ives, Chali2na and Tippa Irie).flac	-10.029999	0.988617
what.cd/Long Beach Dub Allstars - Wonders Of The World - 2001 (CD - FLAC - Lossless)	07 - It Ain't Easy.flac	-11.349998	0.988617
what.cd/Long Beach Dub Allstars - Wonders Of The World - 2001 (CD - FLAC - Lossless)	08 - Luke.flac	-9.260002	0.988617
what.cd/Long Beach Dub Allstars - Wonders Of The World - 2001 (CD - FLAC - Lossless)	09 - Wonders Dub II.flac	-5.820000	0.988617
what.cd/Long Beach Dub Allstars - Wonders Of The World - 2001 (CD - FLAC - Lossless)	10 - No Way.flac	-11.930000	0.988617
what.cd/Long Beach Dub Allstars - Wonders Of The World - 2001 (CD - FLAC - Lossless)	11 - Lonely End.flac	-11.779999	0.988617
what.cd/Long Beach Dub Allstars - Wonders Of The World - 2001 (CD - FLAC - Lossless)	12 - Talkin' The Truth (feat. Paulie Selekta).flac	-8.019997	0.988617
what.cd/Long Beach Dub Allstars - Wonders Of The World - 2001 (CD - FLAC - Lossless)	13 - Free Love.flac	-10.750000	0.988617
what.cd/Long Beach Dub Allstars - Wonders Of The World - 2001 (CD - FLAC - Lossless)	14 - Lies (feat. I-Man).flac	-9.730003	0.988617
what.cd/Long Beach Dub Allstars - Wonders Of The World - 2001 (CD - FLAC - Lossless)	15 - Kablammin' It.flac	-9.709999	0.988617
what.cd/Long Beach Dub Allstars - Wonders Of The World - 2001 (CD - FLAC - Lossless)	16 - Grass Cloud.flac	-9.389999	0.988617
what.cd/Long Beach Dub Allstars - Wonders Of The World - 2001 (CD - FLAC - Lossless)	17 - Sunny Hours (reprise).flac	-9.840004	0.988647
what.cd/Los Lobos - Kiko [FLAC] (What.cd)	01 Lobos Los - Dream in Blue.flac	-4.379997	0.973175
what.cd/Los Lobos - Kiko [FLAC] (What.cd)	02 Lobos Los - Wake Up Dolores.flac	-5.269997	0.973206
what.cd/Los Lobos - Kiko [FLAC] (What.cd)	03 Lobos Los - Angels With Dirty Faces.flac	-3.690002	0.972992
what.cd/Los Lobos - Kiko [FLAC] (What.cd)	04 Lobos Los - That Train Don't Stop Here.flac	-3.879997	0.973145
what.cd/Los Lobos - Kiko [FLAC] (What.cd)	05 Lobos Los - Kiko And The Lavender Moon.flac	-3.360001	0.973145
what.cd/Los Lobos - Kiko [FLAC] (What.cd)	06 Lobos Los - Saint Behind The Glass.flac	-2.730003	0.973145
what.cd/Los Lobos - Kiko [FLAC] (What.cd)	07 Lobos Los - Reva's House.flac	-5.080002	0.973206
what.cd/Los Lobos - Kiko [FLAC] (What.cd)	08 Lobos Los - When The Circus Comes.flac	-4.940002	0.973053
what.cd/Los Lobos - Kiko [FLAC] (What.cd)	09 Lobos Los - Arizona Skies.flac	-1.099998	0.974640
what.cd/Los Lobos - Kiko [FLAC] (What.cd)	10 Lobos Los - Short Side Of Nothing.flac	-5.500000	0.973267
what.cd/Los Lobos - Kiko [FLAC] (What.cd)	11 Lobos Los - Two Janes.flac	-2.239998	1.000000
what.cd/Los Lobos - Kiko [FLAC] (What.cd)	12 Lobos Los - Wicked Rain.flac	-3.849998	0.973236
what.cd/Los Lobos - Kiko [FLAC] (What.cd)	13 Lobos Los - Whiskey Trail.flac	-5.910004	0.973236
what.cd/Los Lobos - Kiko [FLAC] (What.cd)	14 Lobos Los - Just A Man.flac	-4.300003	0.973175
what.cd/Los Lobos - Kiko [FLAC] (What.cd)	15 Lobos Los - Peace.flac	-1.550003	0.973328
what.cd/Los Lobos - Kiko [FLAC] (What.cd)	16 Lobos Los - Rio de Tenampa.flac	-4.430000	0.863525
what.cd/Machine Head - Burn my eyes [1994] flac	01  Machine Head - Davidian.flac	-8.099998	1.000000
what.cd/Machine Head - Burn my eyes [1994] flac	02  Machine Head - Old.flac	-8.690002	1.000000
what.cd/Machine Head - Burn my eyes [1994] flac	03  Machine Head - A Thousand Lies.flac	-9.650002	1.000000
what.cd/Machine Head - Burn my eyes [1994] flac	04  Machine Head - None But My Own.flac	-9.500000	1.000000
what.cd/Machine Head - Burn my eyes [1994] flac	05  Machine Head - The Rage To Overcome.flac	-9.500000	1.000000
what.cd/Machine Head - Burn my eyes [1994] flac	06  Machine Head - Death Church.flac	-8.959999	1.000000
what.cd/Machine Head - Burn my eyes [1994] flac	07  Machine Head - A Nation On Fire.flac	-8.010002	0.964569
what.cd/Machine Head - Burn my eyes [1994] flac	08  Machine Head - Blood For Blood.flac	-8.820000	1.000000
what.cd/Machine Head - Burn my eyes [1994] flac	09  Machine Head - I'm Your God Now.flac	-9.739998	1.000000
what.cd/Machine Head - Burn my eyes [1994] flac	10  Machine Head - Real Eyes, Realize, Real Lies.flac	-9.010002	1.000000
what.cd/Machine Head - Burn my eyes [1994] flac	11  Machine Head - Block.flac	-8.599998	1.000000
what.cd/Mad Caddies - Keep It Going [FLAC]	01 - The Dirge.flac	-9.930000	1.000000
what.cd/Mad Caddies - Keep It Going [FLAC]	02 - Backyard.flac	-9.900002	1.000000
what.cd/Mad Caddies - Keep It Going [FLAC]	03 - State Of Mind.flac	-8.000000	1.000000
what.cd/Mad Caddies - Keep It Going [FLAC]	04 - Today.flac	-10.610001	0.998962
what.cd/Mad Caddies - Keep It Going [FLAC]	05 - Without You.flac	-9.120003	1.000000
what.cd/Mad Caddies - Keep It Going [FLAC]	06 - Reflections.flac	-8.690002	1.000000
what.cd/Mad Caddies - Keep It Going [FLAC]	07 - Lay Your Head Down.flac	-9.709999	1.000000
what.cd/Mad Caddies - Keep It Going [FLAC]	08 - Tired Bones.flac	-9.699997	1.000000
what.cd/Mad Caddies - Keep It Going [FLAC]	09 - Coyote.flac	-8.480003	1.000000
what.cd/Mad Caddies - Keep It Going [FLAC]	10 - Don't Go.flac	-9.029999	1.000000
what.cd/Mad Caddies - Keep It Going [FLAC]	11 - Pyramid Sheme.flac	-10.139999	1.000000
what.cd/Mad Caddies - Keep It Going [FLAC]	12 - Souls For Sale.flac	-7.680000	1.000000
what.cd/Mad Caddies - Keep It Going [FLAC]	13 - Riding For A Fall.flac	-9.160004	1.000000
what.cd/Mad Caddies - Keep It Going [FLAC]	14 - Watcha Gonna Do.flac	-6.279999	1.000000
what.cd/Mad Caddies - Keep It Going [FLAC]	15 - End Dirge.flac	-5.480003	0.829468
what.cd/Madness - One Step Beyond (Remaster) [1979]	01 - One Step Beyond.flac	-11.320000	0.967865
what.cd/Madness - One Step Beyond (Remaster) [1979]	02 - My Girl.flac	-9.790001	0.968445
what.cd/Madness - One Step Beyond (Remaster) [1979]	03 - Night Boat To Cairo.flac	-11.410004	0.951752
what.cd/Madness - One Step Beyond (Remaster) [1979]	04 - Believe Me.flac	-10.220001	0.968140
what.cd/Madness - One Step Beyond (Remaster) [1979]	05 - Land Of Hope And Glory.flac	-11.090004	0.951752
what.cd/Madness - One Step Beyond (Remaster) [1979]	06 - The Prince.flac	-8.970001	0.948303
what.cd/Madness - One Step Beyond (Remaster) [1979]	07 - Tarzan's Nuts.flac	-8.840004	0.951752
what.cd/Madness - One Step Beyond (Remaster) [1979]	08 - In The Middle Of The Night.flac	-10.230003	0.984314
what.cd/Madness - One Step Beyond (Remaster) [1979]	09 - Bed And Breakfast Man.flac	-10.480003	0.968384
what.cd/Madness - One Step Beyond (Remaster) [1979]	10 - Razor Blade Alley.flac	-9.599998	0.968231
what.cd/Madness - One Step Beyond (Remaster) [1979]	11 - Swan Lake.flac	-9.389999	0.971069
what.cd/Madness - One Step Beyond (Remaster) [1979]	12 - Rockin' In A Flat.flac	-9.090004	0.952087
what.cd/Madness - One Step Beyond (Remaster) [1979]	13 - Mummy's Boy.flac	-9.769997	0.968353
what.cd/Madness - One Step Beyond (Remaster) [1979]	14 - Madness.flac	-10.050003	0.983765
what.cd/Madness - One Step Beyond (Remaster) [1979]	15 - Chipmunks Are Go!.flac	-7.590004	0.790283
what.cd/Megadeth - Countdown To Extinction (Remixed & Remastered) [MFSL] - 1992 [FLAC]	01 - Skin O' My Teeth.flac	-7.360001	0.957825
what.cd/Megadeth - Countdown To Extinction (Remixed & Remastered) [MFSL] - 1992 [FLAC]	02 - Symphony Of Destruction.flac	-7.750000	0.988525
what.cd/Megadeth - Countdown To Extinction (Remixed & Remastered) [MFSL] - 1992 [FLAC]	03 - Architecture Of Aggression.flac	-7.529999	0.953064
what.cd/Megadeth - Countdown To Extinction (Remixed & Remastered) [MFSL] - 1992 [FLAC]	04 - Foreclosure Of A Dream.flac	-7.879997	0.935883
what.cd/Megadeth - Countdown To Extinction (Remixed & Remastered) [MFSL] - 1992 [FLAC]	05 - Sweating Bullets.flac	-7.029999	0.988525
what.cd/Megadeth - Countdown To Extinction (Remixed & Remastered) [MFSL] - 1992 [FLAC]	06 - This Was My Life.flac	-6.699997	0.988525
what.cd/Megadeth - Countdown To Extinction (Remixed & Remastered) [MFSL] - 1992 [FLAC]	07 - Countdown To Extinction.flac	-6.910004	0.986267
what.cd/Megadeth - Countdown To Extinction (Remixed & Remastered) [MFSL] - 1992 [FLAC]	08 - High Speed Dirt.flac	-8.800003	0.988525
what.cd/Megadeth - Countdown To Extinction (Remixed & Remastered) [MFSL] - 1992 [FLAC]	09 - Psychotron.flac	-8.989998	0.988525
what.cd/Megadeth - Countdown To Extinction (Remixed & Remastered) [MFSL] - 1992 [FLAC]	10 - Captive Honour.flac	-9.449997	0.988525
what.cd/Megadeth - Countdown To Extinction (Remixed & Remastered) [MFSL] - 1992 [FLAC]	11 - Ashes In Your Mouth.flac	-9.169998	0.988525
what.cd/Megadeth - Countdown To Extinction (Remixed & Remastered) [MFSL] - 1992 [FLAC]	12 - Crown Of Worms (previously unreleased in the U.S.).flac	-7.800003	0.958374
what.cd/Megadeth - Countdown To Extinction (Remixed & Remastered) [MFSL] - 1992 [FLAC]	13 - Countdown To Extinction (Demo) (previously unreleased).flac	-8.980003	0.988525
what.cd/Megadeth - Countdown To Extinction (Remixed & Remastered) [MFSL] - 1992 [FLAC]	14 - Symphony Of Destruction (Demo) (previously unreleased in the U.S.).flac	-9.410004	0.987518
what.cd/Megadeth - Countdown To Extinction (Remixed & Remastered) [MFSL] - 1992 [FLAC]	15 - Psychotron (Demo) (previously unreleased).flac	-8.750000	0.988525
what.cd/Megadeth - Endgame	01 - Dialectic Chaos.flac	-10.379997	0.988708
what.cd/Megadeth - Endgame	02 - This Day We Fight!.flac	-10.699997	0.988678
what.cd/Megadeth - Endgame	03 - 44 Minutes.flac	-10.090004	0.988678
what.cd/Megadeth - Endgame	04 - 1,320.flac	-10.580002	0.988678
what.cd/Megadeth - Endgame	05 - Bite the Hand.flac	-10.050003	0.988678
what.cd/Megadeth - Endgame	06 - Bodies.flac	-9.849998	0.988678
what.cd/Megadeth - Endgame	07 - Endgame.flac	-9.650002	0.988678
what.cd/Megadeth - Endgame	08 - The Hardest Part of Letting Go...Sealed With a Kiss.flac	-9.260002	0.988678
what.cd/Megadeth - Endgame	09 - Head Crusher.flac	-10.370003	0.988678
what.cd/Megadeth - Endgame	10 - How the Story Ends.flac	-9.400002	0.988678
what.cd/Megadeth - Endgame	11 - The Right to Go Insane.flac	-9.949997	0.988678
what.cd/Megadeth-Rust_In_Peace-Original-1990-FLAC	01 - Holy Wars... The Punishment Due.flac	-2.529999	0.999268
what.cd/Megadeth-Rust_In_Peace-Original-1990-FLAC	02 - Hangar 18.flac	-3.949997	0.937225
what.cd/Megadeth-Rust_In_Peace-Original-1990-FLAC	03 - Take No Prisoners.flac	-3.260002	0.970337
what.cd/Megadeth-Rust_In_Peace-Original-1990-FLAC	04 - Five Magics.flac	-4.550003	0.951874
what.cd/Megadeth-Rust_In_Peace-Original-1990-FLAC	05 - Poison Was The Cure.flac	-3.739998	0.999725
what.cd/Megadeth-Rust_In_Peace-Original-1990-FLAC	06 - Lucretia.flac	-4.220001	0.999359
what.cd/Megadeth-Rust_In_Peace-Original-1990-FLAC	07 - Tornado Of Souls.flac	-3.489998	0.951263
what.cd/Megadeth-Rust_In_Peace-Original-1990-FLAC	08 - Dawn Patrol.flac	0.559998	0.999969
what.cd/Megadeth-Rust_In_Peace-Original-1990-FLAC	09 - Rust In Peace... Polaris.flac	-1.650002	0.903870
what.cd/Melbourne Ska Orchestra - Melbourne Ska Orchestra (2013) [FLAC]	01 - Get Smart.flac	-4.370003	0.999969
what.cd/Melbourne Ska Orchestra - Melbourne Ska Orchestra (2013) [FLAC]	02 - Lygon St.flac	-4.340004	1.000000
what.cd/Melbourne Ska Orchestra - Melbourne Ska Orchestra (2013) [FLAC]	03 - Time To Wake Up.flac	-4.669998	0.997650
what.cd/Melbourne Ska Orchestra - Melbourne Ska Orchestra (2013) [FLAC]	04 - The Diplomat.flac	-5.230003	0.997040
what.cd/Melbourne Ska Orchestra - Melbourne Ska Orchestra (2013) [FLAC]	05 - Dean Went To Mexico.flac	-4.330002	0.995087
what.cd/Melbourne Ska Orchestra - Melbourne Ska Orchestra (2013) [FLAC]	06 - Learn To Love Again.flac	-4.430000	0.994751
what.cd/Melbourne Ska Orchestra - Melbourne Ska Orchestra (2013) [FLAC]	07 - He's A Tripper.flac	-4.599998	0.999969
what.cd/Melbourne Ska Orchestra - Melbourne Ska Orchestra (2013) [FLAC]	08 - Third Time Lucky.flac	-4.419998	0.995026
what.cd/Melbourne Ska Orchestra - Melbourne Ska Orchestra (2013) [FLAC]	09 - While You Wait.flac	-4.559998	0.991608
what.cd/Melbourne Ska Orchestra - Melbourne Ska Orchestra (2013) [FLAC]	10 - Katoomba.flac	-4.470001	0.997467
what.cd/Melbourne Ska Orchestra - Melbourne Ska Orchestra (2013) [FLAC]	11 - Papa's Got A Brand New Ska.flac	-4.449997	1.000000
what.cd/Melbourne Ska Orchestra - Melbourne Ska Orchestra (2013) [FLAC]	12 - Time For This Monkey.flac	-4.809998	0.995789
what.cd/Melbourne Ska Orchestra - Melbourne Ska Orchestra (2013) [FLAC]	13 - Paradiso.flac	-4.440002	0.992493
what.cd/Melbourne Ska Orchestra - Melbourne Ska Orchestra (2013) [FLAC]	14 - Best Things.flac	-4.389999	1.000000
what.cd/Melbourne Ska Orchestra - Melbourne Ska Orchestra (2013) [FLAC]	15 - Singalong Day.flac	-4.389999	0.999420
what.cd/Messer Chups - Zombie Shopping (2007) [FLAC]	01. Darkness Is a Teenager's Friend.flac	-8.809998	0.946442
what.cd/Messer Chups - Zombie Shopping (2007) [FLAC]	02. Cat Mobile.flac	-6.489998	0.941040
what.cd/Messer Chups - Zombie Shopping (2007) [FLAC]	03. Flash Of The Night (Алешеньке - Кыштымскому карлику посвящается).flac	-8.459999	0.946350
what.cd/Messer Chups - Zombie Shopping (2007) [FLAC]	04. When a Knife Thrower Missed the Target.flac	-9.250000	0.960571
what.cd/Messer Chups - Zombie Shopping (2007) [FLAC]	05. Zombie in a Mini Skirt.flac	-8.529999	0.945496
what.cd/Messer Chups - Zombie Shopping (2007) [FLAC]	06. Girls in Orbit.flac	-9.040001	0.949524
what.cd/Messer Chups - Zombie Shopping (2007) [FLAC]	07. Dried Human Head from Ecuador.flac	-7.330002	0.941772
what.cd/Messer Chups - Zombie Shopping (2007) [FLAC]	08. Swamp Cowboy.flac	-8.570000	0.944305
what.cd/Messer Chups - Zombie Shopping (2007) [FLAC]	09. Model.flac	-8.849998	0.945557
what.cd/Messer Chups - Zombie Shopping (2007) [FLAC]	10. Swamp Surfing.flac	-9.099998	0.944031
what.cd/Messer Chups - Zombie Shopping (2007) [FLAC]	11. With an Alligato in Your Hand.flac	-9.309998	0.949615
what.cd/Messer Chups - Zombie Shopping (2007) [FLAC]	12. Holy Psychedelics.flac	-7.550003	0.942688
what.cd/Messer Chups - Zombie Shopping (2007) [FLAC]	13. Vincent Price Is Coming to Russia.flac	-7.400002	0.949432
what.cd/Messer Chups - Zombie Shopping (2007) [FLAC]	14. Hearty Dracula.flac	-8.760002	0.944305
what.cd/Messer Chups - Zombie Shopping (2007) [FLAC]	15. Boys in Skeleton Costumes.flac	-9.300003	0.952759
what.cd/Messer Chups - Zombie Shopping (2007) [FLAC]	16. Laughing Gas Attacking Jamaica.flac	-8.470001	0.946594
what.cd/Messer Chups - Zombie Shopping (2007) [FLAC]	17. Popcorno Revenge.flac	-7.870003	0.954865
what.cd/Metallica - Ride The Lightning (1984) - 1989 Vertigo 838 140-2 - FLAC	01 - Fight Fire With Fire.flac	-4.090004	0.968079
what.cd/Metallica - Ride The Lightning (1984) - 1989 Vertigo 838 140-2 - FLAC	02 - Ride The Lightning.flac	-4.150002	1.000000
what.cd/Metallica - Ride The Lightning (1984) - 1989 Vertigo 838 140-2 - FLAC	03 - For Whom The Bell Tolls.flac	-3.699997	0.969360
what.cd/Metallica - Ride The Lightning (1984) - 1989 Vertigo 838 140-2 - FLAC	04 - Fade To Black.flac	-5.230003	1.000000
what.cd/Metallica - Ride The Lightning (1984) - 1989 Vertigo 838 140-2 - FLAC	05 - Trapped Under Ice.flac	-3.779999	0.862488
what.cd/Metallica - Ride The Lightning (1984) - 1989 Vertigo 838 140-2 - FLAC	06 - Escape.flac	-3.180000	0.829102
what.cd/Metallica - Ride The Lightning (1984) - 1989 Vertigo 838 140-2 - FLAC	07 - Creeping Death.flac	-4.150002	1.000000
what.cd/Metallica - Ride The Lightning (1984) - 1989 Vertigo 838 140-2 - FLAC	08 - The Call Of Ktulu.flac	-4.419998	1.000000
what.cd/Mighty Mighty Bosstones, The - 1993 - Ska-Core, The Devil And More	01 - Someday I suppose.flac	-4.070000	0.999969
what.cd/Mighty Mighty Bosstones, The - 1993 - Ska-Core, The Devil And More	02 - Think again.flac	-4.820000	0.938080
what.cd/Mighty Mighty Bosstones, The - 1993 - Ska-Core, The Devil And More	03 - Lights out.flac	-4.910004	1.000000
what.cd/Mighty Mighty Bosstones, The - 1993 - Ska-Core, The Devil And More	04 - Police beat.flac	-2.989998	1.000000
what.cd/Mighty Mighty Bosstones, The - 1993 - Ska-Core, The Devil And More	05 - Simmer down.flac	-3.150002	1.000000
what.cd/Mighty Mighty Bosstones, The - 1993 - Ska-Core, The Devil And More	06 - Drugs and kittens I'll drink to that.flac	-0.669998	1.000000
what.cd/Mighty Mighty Bosstones - The Magic of Youth-2011 (FLAC)	01 The Mighty Mighty Bosstones - The Daylights.flac	-11.590004	1.000000
what.cd/Mighty Mighty Bosstones - The Magic of Youth-2011 (FLAC)	02 The Mighty Mighty Bosstones - Like a Shotgun.flac	-11.320000	1.000000
what.cd/Mighty Mighty Bosstones - The Magic of Youth-2011 (FLAC)	03 The Mighty Mighty Bosstones - Disappearing.flac	-10.540001	1.000000
what.cd/Mighty Mighty Bosstones - The Magic of Youth-2011 (FLAC)	04 The Mighty Mighty Bosstones - Sunday Afternoons on Wisdom Ave.flac	-11.290001	1.000000
what.cd/Mighty Mighty Bosstones - The Magic of Youth-2011 (FLAC)	05 The Mighty Mighty Bosstones - They Will Need Music.flac	-11.080002	1.000000
what.cd/Mighty Mighty Bosstones - The Magic of Youth-2011 (FLAC)	06 The Mighty Mighty Bosstones - The Package Store Petition.flac	-11.570000	1.000000
what.cd/Mighty Mighty Bosstones - The Magic of Youth-2011 (FLAC)	07 The Mighty Mighty Bosstones - The Horse Shoe and the Rabbits Foot.flac	-10.309998	1.000000
what.cd/Mighty Mighty Bosstones - The Magic of Youth-2011 (FLAC)	08 The Mighty Mighty Bosstones - The Magic of Youth.flac	-11.480003	1.000000
what.cd/Mighty Mighty Bosstones - The Magic of Youth-2011 (FLAC)	09 The Mighty Mighty Bosstones - The Upper Hand.flac	-10.840004	1.000000
what.cd/Mighty Mighty Bosstones - The Magic of Youth-2011 (FLAC)	10 The Mighty Mighty Bosstones - The Ballad of Candlepin Paul.flac	-10.820000	1.000000
what.cd/Mighty Mighty Bosstones - The Magic of Youth-2011 (FLAC)	11 The Mighty Mighty Bosstones - Open and Honest.flac	-10.580002	1.000000
what.cd/Mindless Self Indulgence (2005) You'll Rebel to Anything [FLAC]	01 - Shut Me Up.flac	-9.779999	0.993713
what.cd/Mindless Self Indulgence (2005) You'll Rebel to Anything [FLAC]	02 - 1989.flac	-9.970001	0.999054
what.cd/Mindless Self Indulgence (2005) You'll Rebel to Anything [FLAC]	03 - Straight to Video.flac	-9.389999	0.999146
what.cd/Mindless Self Indulgence (2005) You'll Rebel to Anything [FLAC]	04 - Tom Sawyer.flac	-8.919998	0.999176
what.cd/Mindless Self Indulgence (2005) You'll Rebel to Anything [FLAC]	05 - You'll Rebel to Anything (As Long as it's Not Challenging).flac	-9.239998	0.999115
what.cd/Mindless Self Indulgence (2005) You'll Rebel to Anything [FLAC]	06 - What Do They Know .flac	-8.879997	0.999115
what.cd/Mindless Self Indulgence (2005) You'll Rebel to Anything [FLAC]	07 - Stupid MF.flac	-9.269997	0.999084
what.cd/Mindless Self Indulgence (2005) You'll Rebel to Anything [FLAC]	08 - 2 Hookers and an Eightball.flac	-9.059998	0.999115
what.cd/Mindless Self Indulgence (2005) You'll Rebel to Anything [FLAC]	09 - Prom.flac	-9.489998	0.999115
what.cd/Mindless Self Indulgence (2005) You'll Rebel to Anything [FLAC]	10 - Bullshit.flac	-9.120003	0.999207
what.cd/Misfits - Famous Monsters	01 - Kong at the Gates.flac	-7.660004	0.998871
what.cd/Misfits - Famous Monsters	02 - The Forbidden Zone.flac	-8.809998	0.998932
what.cd/Misfits - Famous Monsters	03 - Lost in Space.flac	-9.150002	0.998932
what.cd/Misfits - Famous Monsters	04 - Dust to Dust.flac	-8.180000	0.998932
what.cd/Misfits - Famous Monsters	05 - Crawling Eye.flac	-9.879997	0.998932
what.cd/Misfits - Famous Monsters	06 - Witch Hunt.flac	-9.449997	0.998932
what.cd/Misfits - Famous Monsters	07 - Scream!.flac	-10.029999	0.998932
what.cd/Misfits - Famous Monsters	08 - Saturday Night.flac	-9.620003	0.998962
what.cd/Misfits - Famous Monsters	09 - Pumpkin Head.flac	-8.449997	0.998962
what.cd/Misfits - Famous Monsters	10 - Scarecrow Man.flac	-9.330002	0.998932
what.cd/Misfits - Famous Monsters	11 - Die Monster Die.flac	-9.000000	0.998962
what.cd/Misfits - Famous Monsters	12 - Living Hell.flac	-9.449997	0.998932
what.cd/Misfits - Famous Monsters	13 - Descending Angel.flac	-9.500000	0.998932
what.cd/Misfits - Famous Monsters	14 - Them.flac	-9.029999	0.998962
what.cd/Misfits - Famous Monsters	15 - Fiend Club.flac	-9.120003	0.998932
what.cd/Misfits - Famous Monsters	16 - Hunting Humans.flac	-9.459999	0.998932
what.cd/Misfits - Famous Monsters	17 - Helena.flac	-9.169998	0.998932
what.cd/Misfits - Famous Monsters	18 - Kong Unleashed.flac	-6.169998	0.998932
what.cd/Misfits - Static Age  (1997) [FLAC]	01 - The Misfits - Static Age.flac	-6.959999	0.999969
what.cd/Misfits - Static Age  (1997) [FLAC]	02 - The Misfits - TV Casualty.flac	-7.459999	0.999969
what.cd/Misfits - Static Age  (1997) [FLAC]	03 - The Misfits - Some Kinda Hate.flac	-6.930000	0.999969
what.cd/Misfits - Static Age  (1997) [FLAC]	04 - The Misfits - Last Caress.flac	-6.489998	0.937805
what.cd/Misfits - Static Age  (1997) [FLAC]	05 - The Misfits - Return Of The Fly.flac	-6.449997	0.942810
what.cd/Misfits - Static Age  (1997) [FLAC]	06 - The Misfits - Hybrid Moments.flac	-6.910004	0.915588
what.cd/Misfits - Static Age  (1997) [FLAC]	07 - The Misfits - We Are 138.flac	-6.690002	0.999969
what.cd/Misfits - Static Age  (1997) [FLAC]	08 - The Misfits - Teenagers From Mars.flac	-6.980003	0.982483
what.cd/Misfits - Static Age  (1997) [FLAC]	09 - The Misfits - Come Back.flac	-6.620003	0.923218
what.cd/Misfits - Static Age  (1997) [FLAC]	10 - The Misfits - Angelfuck.flac	-7.019997	0.949127
what.cd/Misfits - Static Age  (1997) [FLAC]	11 - The Misfits - Hollywood Babylon.flac	-7.059998	0.999969
what.cd/Misfits - Static Age  (1997) [FLAC]	12 - The Misfits - Attitude.flac	-7.419998	0.999969
what.cd/Misfits - Static Age  (1997) [FLAC]	13 - The Misfits - Bullet.flac	-7.120003	0.999878
what.cd/Misfits - Static Age  (1997) [FLAC]	14 - The Misfits - Theme For A Jackal.flac	-7.400002	0.999969
what.cd/Misfits - Static Age  (1997) [FLAC]	15 - The Misfits - She.flac	-7.019997	0.966003
what.cd/Misfits - Static Age  (1997) [FLAC]	16 - The Misfits - Spinal Remains.flac	-7.269997	0.966034
what.cd/Misfits - Static Age  (1997) [FLAC]	17 - The Misfits - In the Doorway.flac	-7.139999	0.965973
what.cd/Misfits - Static Age  (1997) [FLAC]	18 - The Misfits - [Untitled].flac	-4.260002	0.966034
what.cd/Misfits - Static Age  (1997) [FLAC]	19 - The Misfits - [Untitled].flac	64.820000	0.000031
what.cd/Modest Mouse - Good News For People Who Love Bad News [FLAC]	Modest Mouse - Good News For People Who Love Bad News - 01 - Horn Intro.flac	-8.610001	0.999969
what.cd/Modest Mouse - Good News For People Who Love Bad News [FLAC]	Modest Mouse - Good News For People Who Love Bad News - 02 - The World At Large.flac	-5.510002	0.999023
what.cd/Modest Mouse - Good News For People Who Love Bad News [FLAC]	Modest Mouse - Good News For People Who Love Bad News - 03 - Float On.flac	-8.849998	0.999969
what.cd/Modest Mouse - Good News For People Who Love Bad News [FLAC]	Modest Mouse - Good News For People Who Love Bad News - 04 - Ocean Breathes Salty.flac	-9.910004	0.999969
what.cd/Modest Mouse - Good News For People Who Love Bad News [FLAC]	Modest Mouse - Good News For People Who Love Bad News - 05 - Dig Your Grave.flac	-4.480003	0.999023
what.cd/Modest Mouse - Good News For People Who Love Bad News [FLAC]	Modest Mouse - Good News For People Who Love Bad News - 06 - Bury Me With It.flac	-9.949997	0.999969
what.cd/Modest Mouse - Good News For People Who Love Bad News [FLAC]	Modest Mouse - Good News For People Who Love Bad News - 07 - Dance Hall.flac	-9.540001	0.999969
what.cd/Modest Mouse - Good News For People Who Love Bad News [FLAC]	Modest Mouse - Good News For People Who Love Bad News - 08 - Bukowski.flac	-5.279999	0.999054
what.cd/Modest Mouse - Good News For People Who Love Bad News [FLAC]	Modest Mouse - Good News For People Who Love Bad News - 09 - This Devil's Workday.flac	-8.769997	0.999023
what.cd/Modest Mouse - Good News For People Who Love Bad News [FLAC]	Modest Mouse - Good News For People Who Love Bad News - 10 - The View.flac	-8.849998	0.999969
what.cd/Modest Mouse - Good News For People Who Love Bad News [FLAC]	Modest Mouse - Good News For People Who Love Bad News - 11 - Satin In A Coffin.flac	-7.650002	0.999390
what.cd/Modest Mouse - Good News For People Who Love Bad News [FLAC]	Modest Mouse - Good News For People Who Love Bad News - 12 - Interlude (Milo).flac	-1.930000	0.999023
what.cd/Modest Mouse - Good News For People Who Love Bad News [FLAC]	Modest Mouse - Good News For People Who Love Bad News - 13 - Blame It On The Tetons.flac	-2.559998	0.999023
what.cd/Modest Mouse - Good News For People Who Love Bad News [FLAC]	Modest Mouse - Good News For People Who Love Bad News - 14 - Black Cadillacs.flac	-9.330002	0.999969
what.cd/Modest Mouse - Good News For People Who Love Bad News [FLAC]	Modest Mouse - Good News For People Who Love Bad News - 15 - One Chance.flac	-9.129997	0.999969
what.cd/Modest Mouse - Good News For People Who Love Bad News [FLAC]	Modest Mouse - Good News For People Who Love Bad News - 16 - The Good Times Are Killing Me.flac	-7.110001	0.979675
what.cd/Molotov - 1997 - Donde Jugaran Las Ninas	01. Que No Te Haga Bobo Jacobo.flac	-9.090004	1.000000
what.cd/Molotov - 1997 - Donde Jugaran Las Ninas	02. Molotov Cocktail Party.flac	-10.120003	1.000000
what.cd/Molotov - 1997 - Donde Jugaran Las Ninas	03. Voto Latino.flac	-9.480003	1.000000
what.cd/Molotov - 1997 - Donde Jugaran Las Ninas	04. Chinga Tu Madre.flac	-8.980003	1.000000
what.cd/Molotov - 1997 - Donde Jugaran Las Ninas	05. Gimme Tha Power.flac	-5.820000	1.000000
what.cd/Molotov - 1997 - Donde Jugaran Las Ninas	06. Matate Tete.flac	-8.790001	1.000000
what.cd/Molotov - 1997 - Donde Jugaran Las Ninas	07. Mas Vale Cholo.flac	-8.279999	1.000000
what.cd/Molotov - 1997 - Donde Jugaran Las Ninas	08. Use It Or Lose It.flac	-7.699997	1.000000
what.cd/Molotov - 1997 - Donde Jugaran Las Ninas	09. Puto.flac	-8.879997	1.000000
what.cd/Molotov - 1997 - Donde Jugaran Las Ninas	10. Por Que No Te Haces Para Alla ... Al Mas Alla.flac	-7.470001	1.000000
what.cd/Molotov - 1997 - Donde Jugaran Las Ninas	11. Cerdo.flac	-7.139999	1.000000
what.cd/Molotov - 1997 - Donde Jugaran Las Ninas	12. Quitate Que Ma' sturbas (Perra Arrabalera).flac	-8.540001	1.000000
what.cd/Mouthwash - 1000 Dreams FLAC	01 Mouthwash - Drop The Bomb.flac	-9.400002	0.998871
what.cd/Mouthwash - 1000 Dreams FLAC	02 Mouthwash - We Evolve.flac	-7.790001	0.998871
what.cd/Mouthwash - 1000 Dreams FLAC	03 Mouthwash - My Kind Of Love.flac	-10.230003	0.998871
what.cd/Mouthwash - 1000 Dreams FLAC	04 Mouthwash - Fools Gold.flac	-9.889999	0.998871
what.cd/Mouthwash - 1000 Dreams FLAC	05 Mouthwash - One For Sorrow.flac	-10.550003	0.998871
what.cd/Mouthwash - 1000 Dreams FLAC	06 Mouthwash - Competing For Frequency.flac	-9.830002	0.998871
what.cd/Mouthwash - 1000 Dreams FLAC	07 Mouthwash - Live Like Kings.flac	-8.400002	0.998871
what.cd/Mouthwash - 1000 Dreams FLAC	08 Mouthwash - Through The Gray.flac	-10.580002	0.998871
what.cd/Mouthwash - 1000 Dreams FLAC	09 Mouthwash - Babylondon.flac	-9.779999	0.998871
what.cd/Mouthwash - 1000 Dreams FLAC	10 Mouthwash - Neon Heartbeat.flac	-9.699997	0.998871
what.cd/Mouthwash - 1000 Dreams FLAC	11 Mouthwash - Saving Grace.flac	-6.500000	0.840454
what.cd/Mustard_Plug-Big_Daddy_Multitude-1993-LOSSLESS-VLR	01-mustard_plug-skank_by_numbers-vlr.flac	-0.400002	0.999939
what.cd/Mustard_Plug-Big_Daddy_Multitude-1993-LOSSLESS-VLR	02-mustard_plug-too_stoopid-vlr.flac	-3.900002	0.999969
what.cd/Mustard_Plug-Big_Daddy_Multitude-1993-LOSSLESS-VLR	03-mustard_plug-schoolboy-vlr.flac	-1.209999	0.999939
what.cd/Mustard_Plug-Big_Daddy_Multitude-1993-LOSSLESS-VLR	04-mustard_plug-mr_smiley-vlr.flac	-1.340004	0.999939
what.cd/Mustard_Plug-Big_Daddy_Multitude-1993-LOSSLESS-VLR	05-mustard_plug-ball_park_skank-vlr.flac	0.900002	0.999969
what.cd/Mustard_Plug-Big_Daddy_Multitude-1993-LOSSLESS-VLR	06-mustard_plug-thigh_high_nylons-vlr.flac	-3.010002	0.999939
what.cd/Mustard_Plug-Big_Daddy_Multitude-1993-LOSSLESS-VLR	07-mustard_plug-dysfunktional-vlr.flac	-1.570000	0.999969
what.cd/Mustard_Plug-Big_Daddy_Multitude-1993-LOSSLESS-VLR	08-mustard_plug-alone-vlr.flac	-1.660004	0.999939
what.cd/Mustard_Plug-Big_Daddy_Multitude-1993-LOSSLESS-VLR	09-mustard_plug-summertime-vlr.flac	-1.529999	0.999969
what.cd/Mustard_Plug-Big_Daddy_Multitude-1993-LOSSLESS-VLR	10-mustard_plug-murder_in_tulip_city-vlr.flac	-1.860001	0.999969
what.cd/Mustard_Plug-Big_Daddy_Multitude-1993-LOSSLESS-VLR	11-mustard_plug-gum-vlr.flac	-1.919998	0.999969
what.cd/Mustard_Plug-Big_Daddy_Multitude-1993-LOSSLESS-VLR	12-mustard_plug-i_made_love_to_a_martian-vlr.flac	-1.910004	0.999969
what.cd/Mustard_Plug-Big_Daddy_Multitude-1993-LOSSLESS-VLR	13-mustard_plug-brain_on_ska-vlr.flac	-2.389999	0.999969
what.cd/Mustard_Plug-Big_Daddy_Multitude-1993-LOSSLESS-VLR	14-mustard_plug-insomnia-vlr.flac	-0.320000	0.999969
what.cd/Mustard_Plug-Big_Daddy_Multitude-1993-LOSSLESS-VLR	15-mustard_plug-average_guy-vlr.flac	-0.379997	0.999969
what.cd/Mustard_Plug-Big_Daddy_Multitude-1993-LOSSLESS-VLR	16-mustard_plug-grow_up-vlr.flac	-1.830002	0.999969
what.cd/Nevermore - 2005 - This Godless Endeavor [FLAC]	01 - Born.flac	-10.180000	0.994385
what.cd/Nevermore - 2005 - This Godless Endeavor [FLAC]	02 - Final Product.flac	-9.559998	0.996948
what.cd/Nevermore - 2005 - This Godless Endeavor [FLAC]	03 - My Acid Words.flac	-9.160004	0.995422
what.cd/Nevermore - 2005 - This Godless Endeavor [FLAC]	04 - Bittersweet Feast.flac	-9.120003	0.994446
what.cd/Nevermore - 2005 - This Godless Endeavor [FLAC]	05 - Sentient 6.flac	-9.120003	0.994446
what.cd/Nevermore - 2005 - This Godless Endeavor [FLAC]	06 - Medicated Nation.flac	-9.000000	0.994659
what.cd/Nevermore - 2005 - This Godless Endeavor [FLAC]	07 - The Holocaust Of Thought.flac	-5.199997	1.000000
what.cd/Nevermore - 2005 - This Godless Endeavor [FLAC]	08 - Sell My Heart For Stones.flac	-8.940002	0.994446
what.cd/Nevermore - 2005 - This Godless Endeavor [FLAC]	09 - The Psalm Of Lydia.flac	-9.660004	0.999359
what.cd/Nevermore - 2005 - This Godless Endeavor [FLAC]	10 - A Future Uncertain.flac	-9.050003	1.000000
what.cd/Nevermore - 2005 - This Godless Endeavor [FLAC]	11 - This Godless Endeavor.flac	-9.370003	1.000000
what.cd/Nirvana - Nevermind MFSL UDCD 666	01 Smells Like Teen Spirit.flac	-5.169998	0.961945
what.cd/Nirvana - Nevermind MFSL UDCD 666	02 In Bloom.flac	-3.889999	0.984100
what.cd/Nirvana - Nevermind MFSL UDCD 666	03 Come As You Are.flac	-2.580002	0.965912
what.cd/Nirvana - Nevermind MFSL UDCD 666	04 Breed.flac	-3.889999	0.961273
what.cd/Nirvana - Nevermind MFSL UDCD 666	05 Lithium.flac	-3.739998	0.965912
what.cd/Nirvana - Nevermind MFSL UDCD 666	06 Polly.flac	1.090000	0.611298
what.cd/Nirvana - Nevermind MFSL UDCD 666	07 Territorial Pissings.flac	-4.629997	0.975769
what.cd/Nirvana - Nevermind MFSL UDCD 666	08 Drain You.flac	-2.879997	0.979462
what.cd/Nirvana - Nevermind MFSL UDCD 666	09 Lounge Act.flac	-3.949997	0.885162
what.cd/Nirvana - Nevermind MFSL UDCD 666	10 Stay Away.flac	-3.570000	0.977295
what.cd/Nirvana - Nevermind MFSL UDCD 666	11 On A Plain.flac	-3.790001	0.938629
what.cd/Nirvana - Nevermind MFSL UDCD 666	12 Something In The Way (Silent + Hidden Track).flac	-2.250000	0.950775
what.cd/nobody.one - Does [2012]	01. Challenge.flac	-6.940002	0.941620
what.cd/nobody.one - Does [2012]	02. Deadman.flac	-6.919998	0.941467
what.cd/nobody.one - Does [2012]	03. Farvel.flac	-5.010002	0.941437
what.cd/nobody.one - Does [2012]	04. Airblow.flac	-6.860001	0.941650
what.cd/nobody.one - Does [2012]	05. Shuffled God.flac	-5.260002	0.941498
what.cd/nobody.one - Does [2012]	06. Swabbie The Smuggler.flac	-5.169998	0.941467
what.cd/nobody.one - Does [2012]	07. Horizon.flac	-6.650002	0.941864
what.cd/nobody.one - Does [2012]	08. Aurora.flac	-5.840004	0.941223
what.cd/nobody.one - Does [2012]	09. Sunday.flac	-7.080002	0.941559
what.cd/nobody.one - Does [2012]	10. Cosmos.flac	1.639999	0.941040
what.cd/nobody.one - Does [2012]	11. Hover.flac	-1.980003	0.938110
what.cd/nobody.one - Does [2012]	12. Humility.flac	-2.580002	0.941223
what.cd/nobody.one - Head Moves [2010][FLAC]	01. Leerg.flac	-7.639999	0.987091
what.cd/nobody.one - Head Moves [2010][FLAC]	02. Change.flac	-7.419998	0.988007
what.cd/nobody.one - Head Moves [2010][FLAC]	03. Bob.flac	-8.599998	0.991516
what.cd/nobody.one - Head Moves [2010][FLAC]	04. Astronomy.flac	-5.239998	0.982574
what.cd/nobody.one - Head Moves [2010][FLAC]	05. JB.flac	-7.059998	0.988586
what.cd/nobody.one - Head Moves [2010][FLAC]	06. Milena (feat. Artem Abrosimov).flac	-7.199997	0.987488
what.cd/nobody.one - Head Moves [2010][FLAC]	07. Lifeline.flac	-6.940002	0.988251
what.cd/nobody.one - Head Moves [2010][FLAC]	08. The Duck Song.flac	-7.809998	0.989105
what.cd/nobody.one - Head Moves [2010][FLAC]	09. Set.flac	-8.010002	0.988007
what.cd/nobody.one - Head Moves [2010][FLAC]	10. Through.flac	-8.040001	0.988617
what.cd/nobody.one - Head Moves [2010][FLAC]	11. Touching The Void.flac	64.820000	0.000244
what.cd/nobody.one - Head Moves [2010][FLAC]	12. Soul (live 2006).flac	-11.599998	1.000000
what.cd/Nobody.One - The Wall Eater (2013) FLAC	01 - Bring It On.flac	-7.199997	0.999969
what.cd/Nobody.One - The Wall Eater (2013) FLAC	02 - Chasing The Beyond.flac	-7.239998	1.000000
what.cd/Nobody.One - The Wall Eater (2013) FLAC	03 - Edgie The Wall Eater.flac	-6.879997	0.999969
what.cd/Nobody.One - The Wall Eater (2013) FLAC	04 - Home.flac	-7.110001	0.999969
what.cd/Nobody.One - The Wall Eater (2013) FLAC	05 - Trapper.flac	-6.919998	0.999969
what.cd/Nobody.One - The Wall Eater (2013) FLAC	06 - Rumble.flac	-7.320000	0.999969
what.cd/Nobody.One - The Wall Eater (2013) FLAC	07 - The Fluke.flac	-7.010002	0.999969
what.cd/Nobody.One - The Wall Eater (2013) FLAC	08 - The Days of Yore.flac	-6.480003	0.999512
what.cd/Nobody.One - The Wall Eater (2013) FLAC	09 - Third From The Sun.flac	-1.989998	0.987823
what.cd/NoComply - 2002 - Your Life Is Your Direction [FLAC]	01 - Your Life (Is Your Direction).flac	-9.650002	0.983154
what.cd/NoComply - 2002 - Your Life Is Your Direction [FLAC]	02 - Decide.flac	-9.489998	0.983154
what.cd/NoComply - 2002 - Your Life Is Your Direction [FLAC]	03 - Misuse Of Control.flac	-9.320000	0.983154
what.cd/NoComply - 2002 - Your Life Is Your Direction [FLAC]	04 - Rejected.flac	-9.949997	0.983154
what.cd/NoComply - 2002 - Your Life Is Your Direction [FLAC]	05 - Faling From Crosses.flac	-10.230003	0.983154
what.cd/NoComply - 2002 - Your Life Is Your Direction [FLAC]	06 - Background Action.flac	-9.199997	0.983154
what.cd/NoComply - 2004 - With Windmills Turning Wrong Directions [FLAC]	01 - Future Template.flac	-11.410004	1.000000
what.cd/NoComply - 2004 - With Windmills Turning Wrong Directions [FLAC]	02 - Stories.flac	-10.570000	1.000000
what.cd/NoComply - 2004 - With Windmills Turning Wrong Directions [FLAC]	03 - The Price Of You.flac	-11.489998	1.000000
what.cd/NoComply - 2004 - With Windmills Turning Wrong Directions [FLAC]	04 - Sung By Mutes.flac	-11.019997	1.000000
what.cd/NoComply - 2004 - With Windmills Turning Wrong Directions [FLAC]	05 - Close To Hell And Burning.flac	-11.029999	1.000000
what.cd/NoComply - 2004 - With Windmills Turning Wrong Directions [FLAC]	06 - Veronika Decides To Die.flac	-11.239998	1.000000
what.cd/NoComply - 2004 - With Windmills Turning Wrong Directions [FLAC]	07 - Lifetime Of Destruction.flac	-11.239998	1.000000
what.cd/NoComply - 2004 - With Windmills Turning Wrong Directions [FLAC]	08 - A Bloody Welcome.flac	-11.260002	1.000000
what.cd/NoComply - 2004 - With Windmills Turning Wrong Directions [FLAC]	09 - The Against.flac	-10.459999	1.000000
what.cd/NoComply - 2004 - With Windmills Turning Wrong Directions [FLAC]	10 - Silencio.flac	-10.580002	1.000000
what.cd/NoComply - 2004 - With Windmills Turning Wrong Directions [FLAC]	11 - The Love Song.flac	-11.000000	1.000000
what.cd/NoComply - 2004 - With Windmills Turning Wrong Directions [FLAC]	12 - A Waking Dream.flac	-10.639999	1.000000
what.cd/No Doubt - Tragic Kingdom [1995] - FLAC	01 - Spiderwebs.flac	-6.919998	0.949249
what.cd/No Doubt - Tragic Kingdom [1995] - FLAC	02 - Excuse Me Mr..flac	-7.750000	0.950714
what.cd/No Doubt - Tragic Kingdom [1995] - FLAC	03 - Just A Girl.flac	-8.760002	0.957489
what.cd/No Doubt - Tragic Kingdom [1995] - FLAC	04 - Happy Now.flac	-7.730003	0.999969
what.cd/No Doubt - Tragic Kingdom [1995] - FLAC	05 - Different People.flac	-7.980003	0.950714
what.cd/No Doubt - Tragic Kingdom [1995] - FLAC	06 - Hey You.flac	-7.389999	0.950684
what.cd/No Doubt - Tragic Kingdom [1995] - FLAC	07 - The Climb.flac	-7.449997	0.950684
what.cd/No Doubt - Tragic Kingdom [1995] - FLAC	08 - Sixteen.flac	-7.209999	0.956757
what.cd/No Doubt - Tragic Kingdom [1995] - FLAC	09 - Sunday Morning.flac	-8.010002	0.919281
what.cd/No Doubt - Tragic Kingdom [1995] - FLAC	10 - Don't Speak.flac	-7.389999	0.933197
what.cd/No Doubt - Tragic Kingdom [1995] - FLAC	11 - You Can Do It.flac	-8.269997	0.956055
what.cd/No Doubt - Tragic Kingdom [1995] - FLAC	12 - World Go 'round.flac	-7.760002	0.952576
what.cd/No Doubt - Tragic Kingdom [1995] - FLAC	13 - End It On This.flac	-5.900002	0.950714
what.cd/No Doubt - Tragic Kingdom [1995] - FLAC	14 - Tragic Kingdom.flac	-6.879997	0.953308
what.cd/NOFX - 1994 - Punk in Drublic	01 - Linoleum.flac	-6.709999	0.990753
what.cd/NOFX - 1994 - Punk in Drublic	02 - Leave It Alone.flac	-5.830002	0.983765
what.cd/NOFX - 1994 - Punk in Drublic	03 - Dig.flac	-6.559998	0.971466
what.cd/NOFX - 1994 - Punk in Drublic	04 - The Cause.flac	-7.620003	0.941284
what.cd/NOFX - 1994 - Punk in Drublic	05 - Don't Call Me White.flac	-6.389999	0.946686
what.cd/NOFX - 1994 - Punk in Drublic	06 - My Heart Is Yearning.flac	-3.070000	0.932495
what.cd/NOFX - 1994 - Punk in Drublic	07 - Perfect Government.flac	-6.790001	0.990967
what.cd/NOFX - 1994 - Punk in Drublic	08 - The Brews.flac	-5.760002	0.937469
what.cd/NOFX - 1994 - Punk in Drublic	09 - The Quass.flac	-5.070000	0.957703
what.cd/NOFX - 1994 - Punk in Drublic	10 - Dying Degree.flac	-6.519997	0.862244
what.cd/NOFX - 1994 - Punk in Drublic	11 - Fleas.flac	-6.120003	0.987793
what.cd/NOFX - 1994 - Punk in Drublic	12 - Lori Meyers.flac	-7.349998	0.928986
what.cd/NOFX - 1994 - Punk in Drublic	13 - Jeff Wears Birkenstocks.flac	-5.470001	0.969269
what.cd/NOFX - 1994 - Punk in Drublic	14 - Punk Guy.flac	-6.889999	0.982941
what.cd/NOFX - 1994 - Punk in Drublic	15 - Happy Guy.flac	-6.870003	0.984924
what.cd/NOFX - 1994 - Punk in Drublic	16 - Reeko.flac	-7.370003	0.996307
what.cd/NOFX - 1994 - Punk in Drublic	17 - Scavenger Type.flac	-0.650002	0.860413
what.cd/NOFX - Pump Up The Valuum	01 - And Now For Something Completely Similar.flac	-9.040001	0.922638
what.cd/NOFX - Pump Up The Valuum	02 - Take Two Placebos And Call Me Lame.flac	-9.570000	0.977325
what.cd/NOFX - Pump Up The Valuum	03 - What's The Matter With Parents Today.flac	-9.269997	0.977325
what.cd/NOFX - Pump Up The Valuum	04 - Dinosaurs Will Die.flac	-10.779999	0.988647
what.cd/NOFX - Pump Up The Valuum	05 - Thank God It's Monday.flac	-10.949997	0.988678
what.cd/NOFX - Pump Up The Valuum	06 - Clams Have Feelings Too (Actually They Don't).flac	-9.959999	0.977325
what.cd/NOFX - Pump Up The Valuum	07 - Louise.flac	-8.849998	0.988647
what.cd/NOFX - Pump Up The Valuum	08 - Stranger Than Fishin.flac	-9.540001	0.977325
what.cd/NOFX - Pump Up The Valuum	09 - Pharmacist's Daughter.flac	-9.709999	0.977386
what.cd/NOFX - Pump Up The Valuum	10 - Bottles To The Ground.flac	-9.059998	0.988586
what.cd/NOFX - Pump Up The Valuum	11 - Total Bummer.flac	-9.340004	0.988647
what.cd/NOFX - Pump Up The Valuum	12 - My Vagina.flac	-7.900002	0.977325
what.cd/NOFX - Pump Up The Valuum	13 - Herojuana.flac	-9.260002	0.977295
what.cd/NOFX - Pump Up The Valuum	14 - Theme From A NOFX Album.flac	-10.129997	0.977325
what.cd/Oingo Boingo - 1985 - Dead Man's Party	01 - Just Another Day.flac	-4.629997	0.896454
what.cd/Oingo Boingo - 1985 - Dead Man's Party	02 - Dead Man's Party.flac	-4.090004	0.809082
what.cd/Oingo Boingo - 1985 - Dead Man's Party	03 - Heard Somebody Cry.flac	-4.220001	0.911407
what.cd/Oingo Boingo - 1985 - Dead Man's Party	04 - No One Lives Forever.flac	-3.650002	0.826965
what.cd/Oingo Boingo - 1985 - Dead Man's Party	05 - Stay.flac	-4.050003	0.910675
what.cd/Oingo Boingo - 1985 - Dead Man's Party	06 - Fool's Paradise.flac	-1.750000	0.677124
what.cd/Oingo Boingo - 1985 - Dead Man's Party	07 - Help Me.flac	-3.300003	0.898010
what.cd/Oingo Boingo - 1985 - Dead Man's Party	08 - Same Man I Was Before.flac	-2.559998	0.741669
what.cd/Oingo Boingo - 1985 - Dead Man's Party	09 - Weird Science.flac	-3.139999	0.805573
what.cd/Operation Ivy (1990) Energy	01 - Knowledge.flac	-7.379997	0.943420
what.cd/Operation Ivy (1990) Energy	02 - Sound System.flac	-7.410004	0.940979
what.cd/Operation Ivy (1990) Energy	03 - Jaded.flac	-7.910004	0.947418
what.cd/Operation Ivy (1990) Energy	04 - Take Warning.flac	-7.019997	0.944214
what.cd/Operation Ivy (1990) Energy	05 - The Crowd.flac	-6.879997	0.962250
what.cd/Operation Ivy (1990) Energy	06 - Bombshell.flac	-8.160004	0.938263
what.cd/Operation Ivy (1990) Energy	07 - Unity.flac	-8.580002	0.942474
what.cd/Operation Ivy (1990) Energy	08 - Vulnerability.flac	-7.970001	0.933380
what.cd/Operation Ivy (1990) Energy	09 - Bankshot.flac	-8.209999	0.953735
what.cd/Operation Ivy (1990) Energy	10 - One Of These Days.flac	-6.910004	0.962769
what.cd/Operation Ivy (1990) Energy	11 - Gonna Find You.flac	-7.559998	0.969727
what.cd/Operation Ivy (1990) Energy	12 - Bad Town.flac	-7.580002	0.953583
what.cd/Operation Ivy (1990) Energy	13 - Smiling.flac	-7.800003	0.969421
what.cd/Operation Ivy (1990) Energy	14 - Caution.flac	-8.260002	0.943451
what.cd/Operation Ivy (1990) Energy	15 - Freeze Up.flac	-8.010002	0.963226
what.cd/Operation Ivy (1990) Energy	16 - Artificial Life.flac	-6.779999	0.948547
what.cd/Operation Ivy (1990) Energy	17 - Room Without A Window.flac	-8.790001	0.960388
what.cd/Operation Ivy (1990) Energy	18 - Big City.flac	-7.160004	0.952148
what.cd/Operation Ivy (1990) Energy	19 - Missionary.flac	-7.730003	0.944702
what.cd/Operation Ivy (1990) Energy	20 - Junkie's Runnin' Dry.flac	-8.540001	0.945862
what.cd/Operation Ivy (1990) Energy	21 - Here We Go Again.flac	-6.790001	0.938660
what.cd/Operation Ivy (1990) Energy	22 - Hoboken.flac	-7.550003	0.936890
what.cd/Operation Ivy (1990) Energy	23 - Yellin' In My Ear.flac	-8.580002	0.936890
what.cd/Operation Ivy (1990) Energy	24 - Sleep Long.flac	-7.340004	0.932739
what.cd/Operation Ivy (1990) Energy	25 - Healthy Body.flac	-9.500000	0.942169
what.cd/Operation Ivy (1990) Energy	26 - Officer.flac	-7.930000	0.841766
what.cd/Operation Ivy (1990) Energy	27 - I Got No.flac	-7.860001	0.854523
what.cd/Ornette Coleman - The Shape Of Jazz To Come 24-192	01-Lonely Woman.flac	-2.540001	0.984120
what.cd/Ornette Coleman - The Shape Of Jazz To Come 24-192	02-Eventually.flac	-2.949997	0.902799
what.cd/Ornette Coleman - The Shape Of Jazz To Come 24-192	03-Peace.flac	-0.430000	0.786350
what.cd/Ornette Coleman - The Shape Of Jazz To Come 24-192	04-Focus On Sanity.flac	-0.080002	0.991434
what.cd/Ornette Coleman - The Shape Of Jazz To Come 24-192	05-Congeniality.flac	-1.750000	0.842147
what.cd/Ornette Coleman - The Shape Of Jazz To Come 24-192	06-Chronology.flac	-2.629997	0.986726
what.cd/Our Darkest Days	01 - Intro (Our Darkest Days).flac	-8.919998	0.988617
what.cd/Our Darkest Days	02 - Bleeding.flac	-9.379997	0.988647
what.cd/Our Darkest Days	03 - Fear Is Our Tradition.flac	-9.150002	0.988617
what.cd/Our Darkest Days	04 - Let It Burn.flac	-8.769997	0.988617
what.cd/Our Darkest Days	05 - Poverty For All.flac	-8.500000	0.988617
what.cd/Our Darkest Days	06 - My Judgment Day.flac	-8.849998	0.988647
what.cd/Our Darkest Days	07 - Slowdown.flac	-8.959999	0.988617
what.cd/Our Darkest Days	08 - Save Yourself.flac	-8.980003	0.988647
what.cd/Our Darkest Days	09 - Are You Listening.flac	-8.550003	0.988617
what.cd/Our Darkest Days	10 - Three Years.flac	-9.470001	0.988617
what.cd/Our Darkest Days	11 - Know Your History.flac	-9.590004	0.988647
what.cd/Our Darkest Days	12 - Strength.flac	-9.389999	0.988617
what.cd/Our Darkest Days	13 - Sunday Bloody Sunday.flac	-9.309998	0.988617
what.cd/Our Darkest Days	14 - Live For Better Days.flac	-8.199997	0.988617
what.cd/Pantera - 1990 - Cowboys From Hell [FLAC]	01 - Cowboys From Hell.flac	-4.169998	0.890961
what.cd/Pantera - 1990 - Cowboys From Hell [FLAC]	02 - Primal Concrete Sledge.flac	-2.800003	0.860626
what.cd/Pantera - 1990 - Cowboys From Hell [FLAC]	03 - Psycho Holiday.flac	-4.699997	0.891235
what.cd/Pantera - 1990 - Cowboys From Hell [FLAC]	04 - Heresy.flac	-3.029999	0.891235
what.cd/Pantera - 1990 - Cowboys From Hell [FLAC]	05 - Cemetery Gates.flac	-4.500000	0.866394
what.cd/Pantera - 1990 - Cowboys From Hell [FLAC]	06 - Domination.flac	-4.849998	0.870453
what.cd/Pantera - 1990 - Cowboys From Hell [FLAC]	07 - Shattered.flac	-3.709999	0.891235
what.cd/Pantera - 1990 - Cowboys From Hell [FLAC]	08 - Clash With Reality.flac	-5.250000	0.891235
what.cd/Pantera - 1990 - Cowboys From Hell [FLAC]	09 - Medicine Man.flac	-4.739998	0.891205
what.cd/Pantera - 1990 - Cowboys From Hell [FLAC]	10 - Message in Blood.flac	-3.489998	0.891235
what.cd/Pantera - 1990 - Cowboys From Hell [FLAC]	11 - The Sleep.flac	-5.540001	0.891235
what.cd/Pantera - 1990 - Cowboys From Hell [FLAC]	12 - The Art of Shredding.flac	-3.800003	0.891235
what.cd/Papa Roach - Infest	01 - Papa Roach - Infest.flac	-9.919998	0.999969
what.cd/Papa Roach - Infest	02 - Papa Roach - Last Resort.flac	-9.900002	0.999023
what.cd/Papa Roach - Infest	03 - Papa Roach - Broken Home.flac	-9.400002	0.890381
what.cd/Papa Roach - Infest	04 - Papa Roach - Dead Cell.flac	-9.110001	0.999969
what.cd/Papa Roach - Infest	05 - Papa Roach - Between Angels And Insects.flac	-10.779999	0.999023
what.cd/Papa Roach - Infest	06 - Papa Roach - Blood Brothers.flac	-10.980003	0.999969
what.cd/Papa Roach - Infest	07 - Papa Roach - Revenge.flac	-9.849998	0.999023
what.cd/Papa Roach - Infest	08 - Papa Roach - Snakes.flac	-10.590004	0.999054
what.cd/Papa Roach - Infest	09 - Papa Roach - Never Enough.flac	-8.370003	0.999023
what.cd/Papa Roach - Infest	10 - Papa Roach - Binge.flac	-8.809998	0.999023
what.cd/Papa Roach - Infest	11 - Papa Roach - Thrown Away.flac	-8.019997	0.999969
what.cd/Paul Gilbert - Get Out of My Yard (2006) - [FLAC]	01 - Get Out of My Yard.flac	-8.959999	0.963867
what.cd/Paul Gilbert - Get Out of My Yard (2006) - [FLAC]	02 - Hurry Up.flac	-10.410004	0.988586
what.cd/Paul Gilbert - Get Out of My Yard (2006) - [FLAC]	03 - The Curse of Castle Dragon.flac	-11.070000	0.988586
what.cd/Paul Gilbert - Get Out of My Yard (2006) - [FLAC]	04 - Radiator.flac	-9.419998	0.988586
what.cd/Paul Gilbert - Get Out of My Yard (2006) - [FLAC]	05 - Straight Through the Telephone Pole.flac	-11.239998	0.988586
what.cd/Paul Gilbert - Get Out of My Yard (2006) - [FLAC]	06 - Marine Layer.flac	-4.330002	0.917755
what.cd/Paul Gilbert - Get Out of My Yard (2006) - [FLAC]	07 - Twelve Twelve.flac	-10.239998	0.988586
what.cd/Paul Gilbert - Get Out of My Yard (2006) - [FLAC]	08 - Rusty Old Boat.flac	-9.709999	0.988586
what.cd/Paul Gilbert - Get Out of My Yard (2006) - [FLAC]	09 - The Echo Song.flac	-7.480003	0.988556
what.cd/Paul Gilbert - Get Out of My Yard (2006) - [FLAC]	10 - Full Tank.flac	-10.599998	0.988586
what.cd/Paul Gilbert - Get Out of My Yard (2006) - [FLAC]	11 - My Teeth Are a Drumset.flac	-10.440002	0.988586
what.cd/Paul Gilbert - Get Out of My Yard (2006) - [FLAC]	12 - Haydn Symphony No. 88 Finale.flac	-9.480003	0.988525
what.cd/Paul Gilbert - Get Out of My Yard (2006) - [FLAC]	13 - Three Es For Edward.flac	-2.400002	0.728638
what.cd/Paul Gilbert - Get Out of My Yard (2006) - [FLAC]	14 - You Kids.flac	-10.669998	0.988586
what.cd/Pepper - 2006 - No Shame (FLAC)	01 - Bring Me Along.flac	-10.169998	0.999725
what.cd/Pepper - 2006 - No Shame (FLAC)	02 - Rent.flac	-9.500000	0.989136
what.cd/Pepper - 2006 - No Shame (FLAC)	03 - No Control.flac	-10.599998	0.957123
what.cd/Pepper - 2006 - No Shame (FLAC)	04 - Green Hell.flac	-9.019997	1.000000
what.cd/Pepper - 2006 - No Shame (FLAC)	05 - Lost In America.flac	-10.830002	1.000000
what.cd/Pepper - 2006 - No Shame (FLAC)	06 - UFA Point Skit.flac	-1.540001	0.688965
what.cd/Pepper - 2006 - No Shame (FLAC)	07 - Your Face.flac	-8.090004	0.988556
what.cd/Pepper - 2006 - No Shame (FLAC)	08 - Nice Time.flac	-8.540001	0.999725
what.cd/Pepper - 2006 - No Shame (FLAC)	09 - Crazy Love.flac	-9.459999	0.988556
what.cd/Pepper - 2006 - No Shame (FLAC)	10 - Like Your Style.flac	-8.500000	0.988586
what.cd/Pepper - 2006 - No Shame (FLAC)	11 - Point and Shoot.flac	-9.849998	0.963745
what.cd/Pepper - 2006 - No Shame (FLAC)	12 - Old Time Problem.flac	-9.699997	0.988556
what.cd/Pepper - 2006 - No Shame (FLAC)	13 - Beers Skit.flac	-3.459999	0.779449
what.cd/Pepper - 2006 - No Shame (FLAC)	14 - Outta My Face.flac	-9.550003	1.000000
what.cd/Pepper - 2006 - No Shame (FLAC)	15 - Wanted.flac	-9.449997	0.998718
what.cd/Pepper - 2006 - No Shame (FLAC)	16 - Good Enough.flac	-9.129997	0.940308
what.cd/Pepper - 2006 - No Shame (FLAC)	17 - Zicky's Song.flac	-7.739998	0.999725
what.cd/Pepper - 2006 - No Shame (FLAC)	18 - Intro Skit.flac	-1.059998	0.543915
what.cd/Peter Bjorn and John - Writer's Block (2006) [FLAC]	01 Writer's Block.flac	7.320000	0.388611
what.cd/Peter Bjorn and John - Writer's Block (2006) [FLAC]	02 Objects of My Affection.flac	-8.430000	0.988678
what.cd/Peter Bjorn and John - Writer's Block (2006) [FLAC]	03 Young Folks.flac	-9.180000	0.988739
what.cd/Peter Bjorn and John - Writer's Block (2006) [FLAC]	04 Amsterdam.flac	-9.090004	0.988708
what.cd/Peter Bjorn and John - Writer's Block (2006) [FLAC]	05 Start to Melt.flac	-10.309998	0.998840
what.cd/Peter Bjorn and John - Writer's Block (2006) [FLAC]	06 Up Against the Wall.flac	-7.949997	0.998840
what.cd/Peter Bjorn and John - Writer's Block (2006) [FLAC]	07 Paris 2004.flac	-8.480003	0.988647
what.cd/Peter Bjorn and John - Writer's Block (2006) [FLAC]	08 Let's Call It Off.flac	-9.730003	0.988708
what.cd/Peter Bjorn and John - Writer's Block (2006) [FLAC]	09 The Chills.flac	-7.470001	0.998840
what.cd/Peter Bjorn and John - Writer's Block (2006) [FLAC]	10 Roll the Credits.flac	-9.059998	0.988678
what.cd/Peter Bjorn and John - Writer's Block (2006) [FLAC]	11 Poor Cow.flac	-8.059998	0.988647
what.cd/Pink Floyd - Dark Side of the Moon (OMR MFSL 24k Gold Ultradisc II)	01 - Speak to Me.flac	19.209999	0.293976
what.cd/Pink Floyd - Dark Side of the Moon (OMR MFSL 24k Gold Ultradisc II)	02 -  Breathe.flac	4.549999	0.341064
what.cd/Pink Floyd - Dark Side of the Moon (OMR MFSL 24k Gold Ultradisc II)	03 - On the Run.flac	6.500000	0.392639
what.cd/Pink Floyd - Dark Side of the Moon (OMR MFSL 24k Gold Ultradisc II)	04 - Time.flac	0.760002	0.403198
what.cd/Pink Floyd - Dark Side of the Moon (OMR MFSL 24k Gold Ultradisc II)	05 -  The Great Gig in the Sky.flac	2.410000	0.415070
what.cd/Pink Floyd - Dark Side of the Moon (OMR MFSL 24k Gold Ultradisc II)	06 - Money.flac	-1.099998	0.563416
what.cd/Pink Floyd - Dark Side of the Moon (OMR MFSL 24k Gold Ultradisc II)	07 -Us and Them.flac	2.500000	0.492554
what.cd/Pink Floyd - Dark Side of the Moon (OMR MFSL 24k Gold Ultradisc II)	08 - Any Colour You Like.flac	1.799999	0.578430
what.cd/Pink Floyd - Dark Side of the Moon (OMR MFSL 24k Gold Ultradisc II)	09 - Brain Damage.flac	2.230000	0.529602
what.cd/Pink Floyd - Dark Side of the Moon (OMR MFSL 24k Gold Ultradisc II)	10 - Eclipse.flac	-1.440002	0.600952
what.cd/Placebo - Sleeping With Ghosts FLAC	01 - Bulletproof Cupid.flac	-9.290001	0.912598
what.cd/Placebo - Sleeping With Ghosts FLAC	02 - English Summer Rain.flac	-6.599998	0.944305
what.cd/Placebo - Sleeping With Ghosts FLAC	03 - This Picture.flac	-8.459999	0.912781
what.cd/Placebo - Sleeping With Ghosts FLAC	04 - Sleeping With Ghosts.flac	-4.360001	0.905426
what.cd/Placebo - Sleeping With Ghosts FLAC	05 - The Bitter End.flac	-9.300003	0.947083
what.cd/Placebo - Sleeping With Ghosts FLAC	06 - Something Rotten.flac	-10.230003	0.913940
what.cd/Placebo - Sleeping With Ghosts FLAC	07 - Plasticine.flac	-10.870003	0.938782
what.cd/Placebo - Sleeping With Ghosts FLAC	08 - Special Needs.flac	-6.430000	0.835876
what.cd/Placebo - Sleeping With Ghosts FLAC	09 - I'll Be Yours.flac	-2.830002	0.938293
what.cd/Placebo - Sleeping With Ghosts FLAC	10 - Second Sight.flac	-8.820000	0.829987
what.cd/Placebo - Sleeping With Ghosts FLAC	11 - Protect Me From What I Want.flac	-8.919998	0.811676
what.cd/Placebo - Sleeping With Ghosts FLAC	12 - Centrefolds.flac	-1.599998	0.946747
what.cd/Play	01 - Moby - Honey.flac	-4.830002	0.891266
what.cd/Play	02 - Moby - Find My Baby.flac	-7.169998	0.999969
what.cd/Play	03 - Moby - Porcelain.flac	-6.980003	0.999969
what.cd/Play	04 - Moby - Why Does My Heart Feel So Bad .flac	-7.709999	0.999969
what.cd/Play	05 - Moby - South Side.flac	-6.320000	0.999969
what.cd/Play	06 - Moby - Rushing.flac	-3.590004	0.999969
what.cd/Play	07 - Moby - Bodyrock.flac	-5.139999	0.999969
what.cd/Play	08 - Moby - Natural Blues.flac	-5.889999	0.999969
what.cd/Play	09 - Moby - Machete.flac	-6.090004	0.999969
what.cd/Play	10 - Moby - 7.flac	-1.830002	0.999969
what.cd/Play	11 - Moby - Run On.flac	-5.230003	0.999969
what.cd/Play	12 - Moby - Down Slow.flac	-3.239998	0.999969
what.cd/Play	13 - Moby - If Things Were Perfect.flac	-3.860001	0.999939
what.cd/Play	14 - Moby - Everloving.flac	-5.879997	0.999969
what.cd/Play	15 - Moby - Inside.flac	-5.739998	0.999969
what.cd/Play	16 - Moby - Guitar Flute & String.flac	-2.389999	0.824280
what.cd/Play	17 - Moby - The Sky Is Broken.flac	-4.650002	0.999969
what.cd/Play	18 - Moby - My Weakness.flac	-6.199997	0.999969
what.cd/P.O.D. - Payable On Death	01 - Wildfire.flac	-10.669998	0.988617
what.cd/P.O.D. - Payable On Death	02 - Will You.flac	-10.930000	0.988617
what.cd/P.O.D. - Payable On Death	03 - Change The World.flac	-11.400002	0.988617
what.cd/P.O.D. - Payable On Death	04 - Execute The Sounds.flac	-10.500000	0.988617
what.cd/P.O.D. - Payable On Death	05 - Find My Way.flac	-10.769997	0.988586
what.cd/P.O.D. - Payable On Death	06 - Revolution.flac	-10.570000	0.988617
what.cd/P.O.D. - Payable On Death	07 - The Reasons.flac	-10.260002	0.988617
what.cd/P.O.D. - Payable On Death	08 - Freedom Fighters.flac	-9.989998	0.988617
what.cd/P.O.D. - Payable On Death	09 - Waiting On Today.flac	-10.070000	0.988617
what.cd/P.O.D. - Payable On Death	10 - I And Identify.flac	-10.080002	0.988586
what.cd/P.O.D. - Payable On Death	11 - Asthma.flac	-9.750000	0.988586
what.cd/P.O.D. - Payable On Death	12 - Eternal.flac	-6.790001	0.881104
what.cd/Porcupine Tree - Fear Of A Blank Planet (DVD-A) [24-48]	01 - Fear Of A Blank Planet.flac	-4.400002	0.999724
what.cd/Porcupine Tree - Fear Of A Blank Planet (DVD-A) [24-48]	02 - My Ashes.flac	-2.690002	0.911606
what.cd/Porcupine Tree - Fear Of A Blank Planet (DVD-A) [24-48]	03 - Anesthetize.flac	-3.959999	0.946795
what.cd/Porcupine Tree - Fear Of A Blank Planet (DVD-A) [24-48]	04 - Sentimental.flac	-4.309998	0.869397
what.cd/Porcupine Tree - Fear Of A Blank Planet (DVD-A) [24-48]	05 - Way Out Of Here.flac	-3.650002	0.858694
what.cd/Porcupine Tree - Fear Of A Blank Planet (DVD-A) [24-48]	06 - Sleep Together.flac	-4.169998	0.890341
what.cd/Portishead - Dummy (1994) [FLAC] {Go! Beat Records 828 553-2}	01 - Mysterons.flac	-6.000000	0.977234
what.cd/Portishead - Dummy (1994) [FLAC] {Go! Beat Records 828 553-2}	02 - Sour Times.flac	-8.389999	0.977234
what.cd/Portishead - Dummy (1994) [FLAC] {Go! Beat Records 828 553-2}	03 - Strangers.flac	-8.309998	0.977234
what.cd/Portishead - Dummy (1994) [FLAC] {Go! Beat Records 828 553-2}	04 - It Could Be Sweet.flac	-4.900002	0.977234
what.cd/Portishead - Dummy (1994) [FLAC] {Go! Beat Records 828 553-2}	05 - Wandering Star.flac	-6.470001	0.977234
what.cd/Portishead - Dummy (1994) [FLAC] {Go! Beat Records 828 553-2}	06 - It's A Fire.flac	-4.580002	0.977234
what.cd/Portishead - Dummy (1994) [FLAC] {Go! Beat Records 828 553-2}	07 - Numb.flac	-8.199997	0.977234
what.cd/Portishead - Dummy (1994) [FLAC] {Go! Beat Records 828 553-2}	08 - Roads.flac	-6.720001	0.977234
what.cd/Portishead - Dummy (1994) [FLAC] {Go! Beat Records 828 553-2}	09 - Pedestal.flac	-4.040001	0.977234
what.cd/Portishead - Dummy (1994) [FLAC] {Go! Beat Records 828 553-2}	10 - Biscuit.flac	-7.669998	0.977234
what.cd/Portishead - Dummy (1994) [FLAC] {Go! Beat Records 828 553-2}	11 - Glory Box.flac	-6.940002	0.977234
what.cd/Post Orgasmic Chill	Skunk Anansie,Post Orgasmic Chill,01 - Charlie Big Potato.flac	-7.919998	0.920532
what.cd/Post Orgasmic Chill	Skunk Anansie,Post Orgasmic Chill,02 - On My Hotel.flac	-10.500000	0.999969
what.cd/Post Orgasmic Chill	Skunk Anansie,Post Orgasmic Chill,03 - We Don't Need Who You Think You Are.flac	-8.029999	0.999969
what.cd/Post Orgasmic Chill	Skunk Anansie,Post Orgasmic Chill,04 - Tracy's Flaw.flac	-8.250000	0.964417
what.cd/Post Orgasmic Chill	Skunk Anansie,Post Orgasmic Chill,05 - The Skank Heads.flac	-10.150002	0.936920
what.cd/Post Orgasmic Chill	Skunk Anansie,Post Orgasmic Chill,06 - Lately.flac	-8.529999	0.999969
what.cd/Post Orgasmic Chill	Skunk Anansie,Post Orgasmic Chill,07 - Secretly.flac	-7.559998	0.930328
what.cd/Post Orgasmic Chill	Skunk Anansie,Post Orgasmic Chill,08 - Good Things Don't Always Come To You.flac	-8.040001	0.937683
what.cd/Post Orgasmic Chill	Skunk Anansie,Post Orgasmic Chill,09 - Cheap Honesty.flac	-9.360001	0.943420
what.cd/Post Orgasmic Chill	Skunk Anansie,Post Orgasmic Chill,10 - You'll Follow Me Down.flac	-7.480003	0.972260
what.cd/Post Orgasmic Chill	Skunk Anansie,Post Orgasmic Chill,11 - And This Is Nothing That I Thought I Had.flac	-9.110001	0.924316
what.cd/Post Orgasmic Chill	Skunk Anansie,Post Orgasmic Chill,12 - I'm Not Afraid.flac	-7.720001	0.929810
what.cd/Raised Fist - Dedication	01 - Get This Right!.flac	-10.010002	0.988678
what.cd/Raised Fist - Dedication	02 - That's Why.flac	-10.889999	0.988678
what.cd/Raised Fist - Dedication	03 - Message Beneath Contempt.flac	-9.940002	0.988922
what.cd/Raised Fist - Dedication	04 - The People Behind.flac	-9.930000	0.988678
what.cd/Raised Fist - Dedication	05 - Disable Me.flac	-11.209999	0.988678
what.cd/Raised Fist - Dedication	06 - Killing Revenues.flac	-10.529999	0.988678
what.cd/Raised Fist - Dedication	07 - Illustration Of Desperation.flac	-10.389999	0.988678
what.cd/Raised Fist - Dedication	08 - Dedication.flac	-10.220001	0.988678
what.cd/Raised Fist - Dedication	09 - Silence Is The Key.flac	-10.449997	0.988678
what.cd/Raised Fist - Dedication	10 - Another Day.flac	-10.650002	0.988678
what.cd/Raised Fist - Dedication	11 - Between The Demons.flac	-10.830002	0.988678
what.cd/Raised Fist - From The North (2015) [CD FLAC]	01. Flow.flac	-9.699997	1.000000
what.cd/Raised Fist - From The North (2015) [CD FLAC]	02. Chaos.flac	-9.419998	1.000000
what.cd/Raised Fist - From The North (2015) [CD FLAC]	03. Man & Earth.flac	-9.840004	1.000000
what.cd/Raised Fist - From The North (2015) [CD FLAC]	04. In Circles.flac	-10.480003	1.000000
what.cd/Raised Fist - From The North (2015) [CD FLAC]	05. We Will Live Forever.flac	-9.970001	1.000000
what.cd/Raised Fist - From The North (2015) [CD FLAC]	06. Sanctions.flac	-10.760002	1.000000
what.cd/Raised Fist - From The North (2015) [CD FLAC]	07. Ready To Defy.flac	-9.209999	1.000000
what.cd/Raised Fist - From The North (2015) [CD FLAC]	08. Depression.flac	-9.500000	1.000000
what.cd/Raised Fist - From The North (2015) [CD FLAC]	09. Gates.flac	-10.059998	1.000000
what.cd/Raised Fist - From The North (2015) [CD FLAC]	10. Until The End.flac	-10.040001	1.000000
what.cd/Raised Fist - From The North (2015) [CD FLAC]	11. Unsinkable.flac	-9.690002	1.000000
what.cd/Raised Fist - Veil Of Ignorance - FLAC	01 - Raised Fist - Friends And Traitors.flac	-8.340004	1.000000
what.cd/Raised Fist - Veil Of Ignorance - FLAC	02 - Raised Fist - They Can't Keep Us Down.flac	-9.010002	1.000000
what.cd/Raised Fist - Veil Of Ignorance - FLAC	03 - Raised Fist - Wounds.flac	-9.160004	1.000000
what.cd/Raised Fist - Veil Of Ignorance - FLAC	04 - Raised Fist - Afraid.flac	-8.809998	1.000000
what.cd/Raised Fist - Veil Of Ignorance - FLAC	05 - Raised Fist - Slipping Into Coma.flac	-8.599998	1.000000
what.cd/Raised Fist - Veil Of Ignorance - FLAC	06 - Raised Fist - City Of Cold.flac	-8.620003	1.000000
what.cd/Raised Fist - Veil Of Ignorance - FLAC	07 - Raised Fist - Volcano Is Me.flac	-9.449997	1.000000
what.cd/Raised Fist - Veil Of Ignorance - FLAC	08 - Raised Fist - Disbelief.flac	-8.650002	1.000000
what.cd/Raised Fist - Veil Of Ignorance - FLAC	09 - Raised Fist - My Last Day.flac	-8.870003	1.000000
what.cd/Raised Fist - Veil Of Ignorance - FLAC	10 - Raised Fist - I Have To Pretend.flac	-9.519997	1.000000
what.cd/Raised Fist - Veil Of Ignorance - FLAC	11 - Raised Fist - Words And Phrases.flac	-9.980003	1.000000
what.cd/Raised Fist - Veil Of Ignorance - FLAC	12 - Raised Fist - Keeping It To Yourself.flac	-8.860001	1.000000
what.cd/Raised Fist - Veil Of Ignorance - FLAC	13 - Raised Fist - Never Negotiate.flac	-8.690002	1.000000
what.cd/Raised Fist - Veil Of Ignorance - FLAC	14 - Raised Fist - Out.flac	-9.400002	1.000000
what.cd/Rancid - Honor Is All We Know (2014) [FLAC]	01 - Back Where I Belong.flac	-11.019997	1.000000
what.cd/Rancid - Honor Is All We Know (2014) [FLAC]	02 - Raise Your Fist.flac	-10.360001	1.000000
what.cd/Rancid - Honor Is All We Know (2014) [FLAC]	03 - Collision Course.flac	-11.480003	1.000000
what.cd/Rancid - Honor Is All We Know (2014) [FLAC]	04 - Evil's My Friend.flac	-10.360001	1.000000
what.cd/Rancid - Honor Is All We Know (2014) [FLAC]	05 - Honor Is All We Know.flac	-10.250000	1.000000
what.cd/Rancid - Honor Is All We Know (2014) [FLAC]	06 - A Power Inside.flac	-11.809998	1.000000
what.cd/Rancid - Honor Is All We Know (2014) [FLAC]	07 - In The Streets.flac	-11.290001	1.000000
what.cd/Rancid - Honor Is All We Know (2014) [FLAC]	08 - Face Up.flac	-10.750000	1.000000
what.cd/Rancid - Honor Is All We Know (2014) [FLAC]	09 - Already Dead.flac	-10.699997	1.000000
what.cd/Rancid - Honor Is All We Know (2014) [FLAC]	10 - Diabolical.flac	-10.959999	1.000000
what.cd/Rancid - Honor Is All We Know (2014) [FLAC]	11 - Malfunction.flac	-10.379997	1.000000
what.cd/Rancid - Honor Is All We Know (2014) [FLAC]	12 - Now We're Through With You.flac	-10.879997	1.000000
what.cd/Rancid - Honor Is All We Know (2014) [FLAC]	13 - Everybody's Sufferin'.flac	-10.139999	1.000000
what.cd/Rancid - Honor Is All We Know (2014) [FLAC]	14 - Grave Digger.flac	-10.519997	1.000000
what.cd/Rancid - Indestructible (2003) FLAC	01 - Indestructible.flac	-12.660004	0.982788
what.cd/Rancid - Indestructible (2003) FLAC	02 - Fall Back Down.flac	-11.840004	0.979401
what.cd/Rancid - Indestructible (2003) FLAC	03 - Red Hot Moon.flac	-11.269997	0.995697
what.cd/Rancid - Indestructible (2003) FLAC	04 - David Courtney.flac	-11.830002	0.995697
what.cd/Rancid - Indestructible (2003) FLAC	05 - Start Now.flac	-12.169998	0.988342
what.cd/Rancid - Indestructible (2003) FLAC	06 - Out Of Control.flac	-11.540001	0.965179
what.cd/Rancid - Indestructible (2003) FLAC	07 - Django.flac	-12.629997	0.996460
what.cd/Rancid - Indestructible (2003) FLAC	08 - Arrested In Shanghai.flac	-11.070000	0.996948
what.cd/Rancid - Indestructible (2003) FLAC	09 - Travis Bickle.flac	-12.419998	0.995697
what.cd/Rancid - Indestructible (2003) FLAC	10 - Memphis.flac	-12.290001	0.995697
what.cd/Rancid - Indestructible (2003) FLAC	11 - Spirit Of '87.flac	-12.389999	0.993073
what.cd/Rancid - Indestructible (2003) FLAC	12 - Ghost Band.flac	-11.889999	0.995697
what.cd/Rancid - Indestructible (2003) FLAC	13 - Tropical London.flac	-11.730003	0.973938
what.cd/Rancid - Indestructible (2003) FLAC	14 - Roadblock.flac	-11.739998	0.984100
what.cd/Rancid - Indestructible (2003) FLAC	15 - Born Frustrated.flac	-12.959999	0.979797
what.cd/Rancid - Indestructible (2003) FLAC	16 - Back Up Against The Wall.flac	-12.709999	0.987030
what.cd/Rancid - Indestructible (2003) FLAC	17 - Ivory Coast.flac	-12.040001	0.985596
what.cd/Rancid - Indestructible (2003) FLAC	18 - Stand Your Ground.flac	-12.139999	0.988464
what.cd/Rancid - Indestructible (2003) FLAC	19 - Otherside.flac	-11.269997	0.995697
what.cd/Random Hand - 2010 - Another Change Of Plan [FLAC]	01 - Play Some Ska.flac	-10.930000	0.989044
what.cd/Random Hand - 2010 - Another Change Of Plan [FLAC]	02 - Scum Triumphant.flac	-11.550003	0.991760
what.cd/Random Hand - 2010 - Another Change Of Plan [FLAC]	03 - Milk.flac	-11.019997	1.000000
what.cd/Random Hand - 2010 - Another Change Of Plan [FLAC]	04 - Snakes And Ladders.flac	-11.519997	0.989105
what.cd/Random Hand - 2010 - Another Change Of Plan [FLAC]	05 - Dynamo Penis Death Bastard.flac	-11.230003	0.992218
what.cd/Random Hand - 2010 - Another Change Of Plan [FLAC]	06 - Anthropology.flac	-10.820000	1.000000
what.cd/Random Hand - 2010 - Another Change Of Plan [FLAC]	07 - The Tenant Of Rotherwood Hall.flac	-11.279999	1.000000
what.cd/Random Hand - 2010 - Another Change Of Plan [FLAC]	08 - Answers.flac	-11.639999	0.999969
what.cd/Random Hand - 2010 - Another Change Of Plan [FLAC]	09 - Danger Makes Enemies.flac	-11.849998	0.989075
what.cd/Random Hand - 2010 - Another Change Of Plan [FLAC]	10 - The Wisest Man.flac	-11.059998	0.989075
what.cd/Random Hand - 2010 - Another Change Of Plan [FLAC]	11 - Tear Down.flac	-11.620003	0.989044
what.cd/Random Hand - 2010 - Another Change Of Plan [FLAC]	12 - Mr Bibs Wakes Up.flac	-11.820000	0.989014
what.cd/Random Hand - 2010 - Another Change Of Plan [FLAC]	13 - The Story.flac	-13.330002	0.989105
what.cd/Random Hand - 2010 - Another Change Of Plan [FLAC]	14 - Morally Blind.flac	-11.000000	0.988983
what.cd/Random Hand - 2010 - Another Change Of Plan [FLAC]	15 - Fury Fix.flac	-11.540001	0.989075
what.cd/Razika - Program 91 (2011) - FLAC	01 - Youth.flac	-8.309998	0.987274
what.cd/Razika - Program 91 (2011) - FLAC	02 - Why Have We To Wait.flac	-8.379997	0.987488
what.cd/Razika - Program 91 (2011) - FLAC	03 - Vondt i hjertet.flac	-7.279999	0.987701
what.cd/Razika - Program 91 (2011) - FLAC	04 - Taste My Dream.flac	-7.559998	0.987457
what.cd/Razika - Program 91 (2011) - FLAC	05 - Aldri.flac	-7.080002	0.987366
what.cd/Razika - Program 91 (2011) - FLAC	06 - Nytt på nytt.flac	-8.239998	0.987762
what.cd/Razika - Program 91 (2011) - FLAC	07 - Eg vetsje.flac	-7.090004	0.988037
what.cd/Razika - Program 91 (2011) - FLAC	08 - Above All.flac	-7.930000	0.987488
what.cd/Razika - Program 91 (2011) - FLAC	09 - Hvem skal ha tro på deg nå.flac	-7.389999	0.987732
what.cd/Razika - Program 91 (2011) - FLAC	10 - Middelalder.flac	-7.540001	0.987335
what.cd/Razika - Program 91 (2011) - FLAC	11 - Walk In The Park.flac	-6.220001	0.987183
what.cd/Razika - Ut til de andre (2015) [flac]	01 - Faen ta deg.flac	-9.840004	0.988708
what.cd/Razika - Ut til de andre (2015) [flac]	02 - Første gangen om igjen.flac	-9.559998	0.988708
what.cd/Razika - Ut til de andre (2015) [flac]	03 - Gutten i dongerijakke.flac	-8.959999	0.988708
what.cd/Razika - Ut til de andre (2015) [flac]	04 - Mer.flac	-8.879997	0.988678
what.cd/Razika - Ut til de andre (2015) [flac]	05 - Om igjen.flac	-8.949997	0.944214
what.cd/Razika - Ut til de andre (2015) [flac]	06 - Før vi sovner.flac	-9.500000	0.988708
what.cd/Razika - Ut til de andre (2015) [flac]	07 - Gi meg, gi meg, gi meg.flac	-9.510002	0.988708
what.cd/Razika - Ut til de andre (2015) [flac]	08 - Vi som gråter.flac	-9.400002	0.977386
what.cd/Razika - Ut til de andre (2015) [flac]	09 - Syndere i sommersol.flac	-9.180000	0.988708
what.cd/Razika - Ut til de andre (2015) [flac]	10 - Kjedelig.flac	-8.739998	0.988708
what.cd/Razika - Ut til de andre (2015) [flac]	11 - Det Embla sa.flac	-8.760002	0.988678
what.cd/Razika - Ut til de andre (2015) [flac]	12 - Når alle sammen går så går du etter.flac	-9.690002	0.988708
what.cd/Rebelution - Courage to Grow (2007) [FLAC]	01 - Courage to Grow.flac	-7.080002	0.998962
what.cd/Rebelution - Courage to Grow (2007) [FLAC]	02 - Heart Like a Lion.flac	-6.300003	0.996185
what.cd/Rebelution - Courage to Grow (2007) [FLAC]	03 - Safe and Sound.flac	-6.080002	0.995300
what.cd/Rebelution - Courage to Grow (2007) [FLAC]	04 - Feeling Alright.flac	-5.739998	0.992493
what.cd/Rebelution - Courage to Grow (2007) [FLAC]	05 - Ordinary Girl.flac	-5.459999	0.996399
what.cd/Rebelution - Courage to Grow (2007) [FLAC]	06 - R Way.flac	-5.559998	0.996277
what.cd/Rebelution - Courage to Grow (2007) [FLAC]	07 - Attention Span.flac	-6.930000	0.998993
what.cd/Rebelution - Courage to Grow (2007) [FLAC]	08 - Green to Black.flac	-6.080002	0.991608
what.cd/Rebelution - Courage to Grow (2007) [FLAC]	09 - On My Mind.flac	-6.840004	0.998322
what.cd/Rebelution - Courage to Grow (2007) [FLAC]	10 - Running.flac	-4.809998	0.995453
what.cd/Rebelution - Courage to Grow (2007) [FLAC]	11 - Night Crawler.flac	-6.660004	0.998596
what.cd/Rebelution - Courage to Grow (2007) [FLAC]	12 - Other Side.flac	-4.669998	0.998901
what.cd/Rebelution - Courage to Grow (2007) [FLAC]	13 - Safe and Sound Dub.flac	-2.570000	0.990082
what.cd/Red Hot Chili Peppers - By The Way (2002) [FLAC]	01 - By The Way.flac	-9.220001	0.988556
what.cd/Red Hot Chili Peppers - By The Way (2002) [FLAC]	02 - Universally Speaking.flac	-9.400002	0.988556
what.cd/Red Hot Chili Peppers - By The Way (2002) [FLAC]	03 - This Is The Place.flac	-10.040001	0.988556
what.cd/Red Hot Chili Peppers - By The Way (2002) [FLAC]	04 - Dosed.flac	-9.209999	0.988556
what.cd/Red Hot Chili Peppers - By The Way (2002) [FLAC]	05 - Don't Forget Me.flac	-9.599998	0.999969
what.cd/Red Hot Chili Peppers - By The Way (2002) [FLAC]	06 - The Zephyr Song.flac	-9.790001	0.988556
what.cd/Red Hot Chili Peppers - By The Way (2002) [FLAC]	07 - Can't Stop.flac	-10.139999	0.988556
what.cd/Red Hot Chili Peppers - By The Way (2002) [FLAC]	08 - I Could Die For You.flac	-9.940002	0.988556
what.cd/Red Hot Chili Peppers - By The Way (2002) [FLAC]	09 - Midnight.flac	-10.910004	0.988556
what.cd/Red Hot Chili Peppers - By The Way (2002) [FLAC]	10 - Throw Away Your Television.flac	-9.199997	0.988556
what.cd/Red Hot Chili Peppers - By The Way (2002) [FLAC]	11 - Cabron.flac	-9.840004	0.988556
what.cd/Red Hot Chili Peppers - By The Way (2002) [FLAC]	12 - Tear.flac	-10.000000	0.988556
what.cd/Red Hot Chili Peppers - By The Way (2002) [FLAC]	13 - On Mercury.flac	-11.010002	0.988556
what.cd/Red Hot Chili Peppers - By The Way (2002) [FLAC]	14 - Minor Thing.flac	-10.090004	0.988556
what.cd/Red Hot Chili Peppers - By The Way (2002) [FLAC]	15 - Warm Tape.flac	-10.440002	0.988586
what.cd/Red Hot Chili Peppers - By The Way (2002) [FLAC]	16 - Venice Queen.flac	-9.680000	0.988556
what.cd/Red Hot Chili Peppers - Mother's Milk (1989) [MFSL] [FLAC]	01 - Good Time Boys.flac	-4.320000	0.981110
what.cd/Red Hot Chili Peppers - Mother's Milk (1989) [MFSL] [FLAC]	02 - Higher Ground.flac	-2.500000	0.951447
what.cd/Red Hot Chili Peppers - Mother's Milk (1989) [MFSL] [FLAC]	03 - Subway To Venus.flac	-3.410004	0.952423
what.cd/Red Hot Chili Peppers - Mother's Milk (1989) [MFSL] [FLAC]	04 - Magic Johnson.flac	-2.669998	0.946777
what.cd/Red Hot Chili Peppers - Mother's Milk (1989) [MFSL] [FLAC]	05 - Nobody Weird Like Me.flac	-2.709999	0.970001
what.cd/Red Hot Chili Peppers - Mother's Milk (1989) [MFSL] [FLAC]	06 - Knock Me Down.flac	-3.029999	0.921082
what.cd/Red Hot Chili Peppers - Mother's Milk (1989) [MFSL] [FLAC]	07 - Taste The Pain.flac	-2.160004	0.909973
what.cd/Red Hot Chili Peppers - Mother's Milk (1989) [MFSL] [FLAC]	08 - Stone Cold Bush.flac	-2.980003	0.960907
what.cd/Red Hot Chili Peppers - Mother's Milk (1989) [MFSL] [FLAC]	09 - Fire.flac	-5.910004	0.960144
what.cd/Red Hot Chili Peppers - Mother's Milk (1989) [MFSL] [FLAC]	10 - Pretty Little Ditty.flac	-1.610001	0.585022
what.cd/Red Hot Chili Peppers - Mother's Milk (1989) [MFSL] [FLAC]	11 - Punk Rock Classic.flac	-3.949997	0.971985
what.cd/Red Hot Chili Peppers - Mother's Milk (1989) [MFSL] [FLAC]	12 - Sexy Mexican Maid.flac	-2.379997	0.951691
what.cd/Red Hot Chili Peppers - Mother's Milk (1989) [MFSL] [FLAC]	13 - Johnny, Kick A Hole In The Sky.flac	-3.410004	0.974670
what.cd/Reel Big Fish - 1996 - Turn The Radio Off (FLAC)	01 - Sell Out.flac	-7.349998	0.958130
what.cd/Reel Big Fish - 1996 - Turn The Radio Off (FLAC)	02 - Trendy.flac	-7.110001	0.958130
what.cd/Reel Big Fish - 1996 - Turn The Radio Off (FLAC)	03 - Join The Club.flac	-6.059998	0.957916
what.cd/Reel Big Fish - 1996 - Turn The Radio Off (FLAC)	04 - She Has A Girlfriend Now.flac	-7.919998	0.958374
what.cd/Reel Big Fish - 1996 - Turn The Radio Off (FLAC)	05 - Snoop Dog, Baby.flac	-7.190002	0.957153
what.cd/Reel Big Fish - 1996 - Turn The Radio Off (FLAC)	06 - Beer.flac	-6.750000	0.956726
what.cd/Reel Big Fish - 1996 - Turn The Radio Off (FLAC)	07 - 241.flac	-6.599998	0.958008
what.cd/Reel Big Fish - 1996 - Turn The Radio Off (FLAC)	08 - Everything Sucks.flac	-6.629997	0.956512
what.cd/Reel Big Fish - 1996 - Turn The Radio Off (FLAC)	09 - S.R..flac	-5.599998	0.955719
what.cd/Reel Big Fish - 1996 - Turn The Radio Off (FLAC)	10 - Skatanic.flac	-7.989998	0.956482
what.cd/Reel Big Fish - 1996 - Turn The Radio Off (FLAC)	11 - All I Want Is More.flac	-7.129997	0.956451
what.cd/Reel Big Fish - 1996 - Turn The Radio Off (FLAC)	12 - Nothin'.flac	-6.940002	0.956146
what.cd/Reel Big Fish - 1996 - Turn The Radio Off (FLAC)	13 - Say 'Ten'.flac	-7.570000	0.957245
what.cd/Reel Big Fish - 1996 - Turn The Radio Off (FLAC)	14 - I'll Never Be.flac	-6.540001	0.958130
what.cd/Reel Big Fish - 1996 - Turn The Radio Off (FLAC)	15 - Alternative Baby.flac	-6.669998	0.958984
what.cd/Reel Big Fish - 1996 - Turn The Radio Off (FLAC)	16 - Secret Song.flac	3.150002	0.202545
what.cd/Reel Big Fish - 2002 - Cheer Up! [FLAC]	01 - Good Thing.flac	-10.440002	0.999969
what.cd/Reel Big Fish - 2002 - Cheer Up! [FLAC]	02 - Somebody Loved Me.flac	-10.489998	0.999969
what.cd/Reel Big Fish - 2002 - Cheer Up! [FLAC]	03 - Ban The Tube Top.flac	-10.220001	0.999969
what.cd/Reel Big Fish - 2002 - Cheer Up! [FLAC]	04 - Cheer Up.flac	-9.820000	0.999969
what.cd/Reel Big Fish - 2002 - Cheer Up! [FLAC]	05 - Where Have You Been.flac	-10.050003	0.999969
what.cd/Reel Big Fish - 2002 - Cheer Up! [FLAC]	06 - Suckers.flac	-10.279999	0.999969
what.cd/Reel Big Fish - 2002 - Cheer Up! [FLAC]	07 - What Are Friends For.flac	-10.290001	1.000000
what.cd/Reel Big Fish - 2002 - Cheer Up! [FLAC]	08 - A Little Doubt Goes A Long Way.flac	-9.849998	0.999969
what.cd/Reel Big Fish - 2002 - Cheer Up! [FLAC]	09 - Dateless Losers.flac	-10.300003	1.000000
what.cd/Reel Big Fish - 2002 - Cheer Up! [FLAC]	10 - Valerie.flac	-9.449997	1.000000
what.cd/Reel Big Fish - 2002 - Cheer Up! [FLAC]	11 - Rock 'n' Roll Is Bitchin'.flac	-10.699997	0.999969
what.cd/Reel Big Fish - 2002 - Cheer Up! [FLAC]	12 - New York, New York.flac	-8.550003	0.999969
what.cd/Reel Big Fish - 2002 - Cheer Up! [FLAC]	13 - Sayonara Senorita.flac	-9.559998	0.999969
what.cd/Reel Big Fish - 2002 - Cheer Up! [FLAC]	14 - Boss DJ.flac	-10.099998	0.999969
what.cd/Reel Big Fish - 2002 - Cheer Up! [FLAC]	15 - Brand New Hero.flac	-10.260002	0.999969
what.cd/Reel Big Fish - 2002 - Cheer Up! [FLAC]	16 - Drunk Again.flac	-10.000000	0.999969
what.cd/Refused - The Shape Of Punk To Come DVD-Audio 2.0	01. Worms Of The Senses  Faculties Of The Skull.flac	-5.870003	0.990681
what.cd/Refused - The Shape Of Punk To Come DVD-Audio 2.0	02. Liberation Frequency.flac	-6.029999	0.993656
what.cd/Refused - The Shape Of Punk To Come DVD-Audio 2.0	03. The Deadly Rhythm.flac	-6.379997	0.984039
what.cd/Refused - The Shape Of Punk To Come DVD-Audio 2.0	04. Summerholidays Vs. Punkroutine.flac	-5.940002	0.980553
what.cd/Refused - The Shape Of Punk To Come DVD-Audio 2.0	05. Bruitist Pome #5.flac	-2.019997	0.944509
what.cd/Refused - The Shape Of Punk To Come DVD-Audio 2.0	06. New Noise.flac	-5.260002	0.982736
what.cd/Refused - The Shape Of Punk To Come DVD-Audio 2.0	07. The Refused Party Program.flac	-5.840004	0.981363
what.cd/Refused - The Shape Of Punk To Come DVD-Audio 2.0	08. Protest Song '68.flac	-5.449997	1.000000
what.cd/Refused - The Shape Of Punk To Come DVD-Audio 2.0	09. Refused Are Fuckin Dead.flac	-6.599998	0.995601
what.cd/Refused - The Shape Of Punk To Come DVD-Audio 2.0	10. The Shape Of Punk To Come.flac	-5.900002	0.985196
what.cd/Refused - The Shape Of Punk To Come DVD-Audio 2.0	11. Tannhäuser  Derivè.flac	-6.320000	0.990289
what.cd/Refused - The Shape Of Punk To Come DVD-Audio 2.0	12. The Apollo Programme Was A Hoax.flac	2.410000	0.977979
what.cd/Rise Against - 2006 - The Sufferer & the Witness	01 - Chamber the Cartridge.flac	-10.480003	0.966675
what.cd/Rise Against - 2006 - The Sufferer & the Witness	02 - Injection.flac	-10.620003	1.000000
what.cd/Rise Against - 2006 - The Sufferer & the Witness	03 - Ready to Fall.flac	-10.040001	0.966553
what.cd/Rise Against - 2006 - The Sufferer & the Witness	04 - Bricks.flac	-10.510002	0.980347
what.cd/Rise Against - 2006 - The Sufferer & the Witness	05 - Under the Knife.flac	-9.919998	0.969025
what.cd/Rise Against - 2006 - The Sufferer & the Witness	06 - Prayer of the Refugee.flac	-10.639999	0.966644
what.cd/Rise Against - 2006 - The Sufferer & the Witness	07 - Drones.flac	-10.150002	0.971375
what.cd/Rise Against - 2006 - The Sufferer & the Witness	08 - The Approaching Curve.flac	-9.239998	0.966614
what.cd/Rise Against - 2006 - The Sufferer & the Witness	09 - Worth Dying For.flac	-9.849998	0.974243
what.cd/Rise Against - 2006 - The Sufferer & the Witness	10 - Behind Closed Doors.flac	-10.459999	0.966675
what.cd/Rise Against - 2006 - The Sufferer & the Witness	11 - Roadside.flac	-7.379997	0.966431
what.cd/Rise Against - 2006 - The Sufferer & the Witness	12 - The Good Left Undone.flac	-9.639999	0.966553
what.cd/Rise Against - 2006 - The Sufferer & the Witness	13 - Survive.flac	-9.970001	0.966675
what.cd/Rise Against - 2011 - Endgame [FLAC]	01 - Architects.flac	-11.129997	1.000000
what.cd/Rise Against - 2011 - Endgame [FLAC]	02 - Help Is On The Way.flac	-10.720001	1.000000
what.cd/Rise Against - 2011 - Endgame [FLAC]	03 - Make It Stop (September's Children).flac	-10.629997	1.000000
what.cd/Rise Against - 2011 - Endgame [FLAC]	04 - Disparity By Design.flac	-10.470001	1.000000
what.cd/Rise Against - 2011 - Endgame [FLAC]	05 - Satellite.flac	-10.389999	1.000000
what.cd/Rise Against - 2011 - Endgame [FLAC]	06 - Midnight Hands.flac	-10.519997	1.000000
what.cd/Rise Against - 2011 - Endgame [FLAC]	07 - Survivor Guilt.flac	-10.669998	1.000000
what.cd/Rise Against - 2011 - Endgame [FLAC]	08 - Broken Mirrors.flac	-10.500000	1.000000
what.cd/Rise Against - 2011 - Endgame [FLAC]	09 - Wait For Me.flac	-10.370003	1.000000
what.cd/Rise Against - 2011 - Endgame [FLAC]	10 - A Gentlemen's Coup.flac	-10.540001	1.000000
what.cd/Rise Against - 2011 - Endgame [FLAC]	11 - This Is Letting Go.flac	-10.320000	1.000000
what.cd/Rise Against - 2011 - Endgame [FLAC]	12 - Endgame.flac	-9.849998	1.000000
what.cd/Rise Against - Revolutions Per Minute (2003) [FLAC]	01. Black Masks & Gasoline.flac	-11.290001	0.966309
what.cd/Rise Against - Revolutions Per Minute (2003) [FLAC]	02. Heaven Knows.flac	-11.110001	0.966309
what.cd/Rise Against - Revolutions Per Minute (2003) [FLAC]	03. Dead Ringer.flac	-10.940002	0.966309
what.cd/Rise Against - Revolutions Per Minute (2003) [FLAC]	04. Halfway There.flac	-10.830002	0.966309
what.cd/Rise Against - Revolutions Per Minute (2003) [FLAC]	05. Like The Angel.flac	-11.059998	0.966309
what.cd/Rise Against - Revolutions Per Minute (2003) [FLAC]	06. Voices Off Camera.flac	-11.050003	0.966309
what.cd/Rise Against - Revolutions Per Minute (2003) [FLAC]	07. Blood Red, White, & Blue.flac	-11.120003	0.966309
what.cd/Rise Against - Revolutions Per Minute (2003) [FLAC]	08. Broken English.flac	-10.430000	0.966309
what.cd/Rise Against - Revolutions Per Minute (2003) [FLAC]	09. Last Chance Blueprint.flac	-11.019997	0.966278
what.cd/Rise Against - Revolutions Per Minute (2003) [FLAC]	10. To The Core.flac	-10.760002	0.966278
what.cd/Rise Against - Revolutions Per Minute (2003) [FLAC]	11. Torches.flac	-10.660004	0.966309
what.cd/Rise Against - Revolutions Per Minute (2003) [FLAC]	12. Amber Changing.flac	-10.849998	0.966309
what.cd/Rise Against - Revolutions Per Minute (2003) [FLAC]	13. Any Way You Want It.flac	-10.510002	0.966309
what.cd/Rotfront - VisaFree	01 - VisaFree.flac	-10.250000	0.966095
what.cd/Rotfront - VisaFree	02 - Eyn Tsvey.flac	-10.820000	0.968201
what.cd/Rotfront - VisaFree	03 - Gay, Gypsy & Jew.flac	-11.029999	0.983643
what.cd/Rotfront - VisaFree	04 - Revolution Disco.flac	-10.389999	0.990967
what.cd/Rotfront - VisaFree	05 - Cosmos.flac	-10.519997	0.966095
what.cd/Rotfront - VisaFree	06 - Vodka & Garlic.flac	-10.760002	0.966125
what.cd/Rotfront - VisaFree	07 - Money Money Money.flac	-11.150002	0.966095
what.cd/Rotfront - VisaFree	08 - Real Berlin Wedding.flac	-10.360001	0.966095
what.cd/Rotfront - VisaFree	09 - Csöváz.flac	-9.260002	0.966034
what.cd/Rotfront - VisaFree	10 - Live Is Life.flac	-10.019997	0.966095
what.cd/Rotfront - VisaFree	11 - No Sleep Till Berlin.flac	-10.099998	0.966431
what.cd/Rotfront - VisaFree	12 - Village Superstar.flac	-10.059998	0.862030
what.cd/Rotfront - VisaFree	13 - James Bondski.flac	-10.209999	0.966095
what.cd/Rotfront - VisaFree	14 - Sigaretta.flac	-10.169998	0.966095
what.cd/Rotfront - VisaFree	15 - Backsteinpulver.flac	-8.769997	0.966095
what.cd/Rubblebucket-OmegaLaLa(FLAC)	01 Rubblebucket - Down in the Yards.flac	-8.160004	0.988586
what.cd/Rubblebucket-OmegaLaLa(FLAC)	02 Rubblebucket - L'Homme.flac	-7.220001	0.988586
what.cd/Rubblebucket-OmegaLaLa(FLAC)	03 Rubblebucket - Silly Fathers.flac	-8.239998	0.987976
what.cd/Rubblebucket-OmegaLaLa(FLAC)	04 Rubblebucket - Came Out of a Lady.flac	-8.190002	0.988586
what.cd/Rubblebucket-OmegaLaLa(FLAC)	05 Rubblebucket - Raining.flac	-4.940002	0.988586
what.cd/Rubblebucket-OmegaLaLa(FLAC)	06 Rubblebucket - Breatherz (Young As Clouds).flac	-7.720001	0.988586
what.cd/Rubblebucket-OmegaLaLa(FLAC)	07 Rubblebucket - Rescue Ranger.flac	-7.570000	0.988586
what.cd/Rubblebucket-OmegaLaLa(FLAC)	08 Rubblebucket - Lifted／Weak Arms.flac	-7.209999	0.988586
what.cd/Rubblebucket-OmegaLaLa(FLAC)	09 Rubblebucket - Triangular Daisies.flac	-8.040001	0.988586
what.cd/Rubblebucket-OmegaLaLa(FLAC)	10 Rubblebucket - Worker.flac	-7.500000	0.988586
what.cd/Rubblebucket-OmegaLaLa(FLAC)	11 Rubblebucket - Pile of Rage.flac	-7.419998	0.988586
what.cd/Rudiments - Circle Our Empire [FLAC]	01 - Martians Don't Skank.flac	-9.889999	0.991791
what.cd/Rudiments - Circle Our Empire [FLAC]	02 - Scapegoat.flac	-9.559998	0.999481
what.cd/Rudiments - Circle Our Empire [FLAC]	03 - Plank.flac	-9.260002	0.999542
what.cd/Rudiments - Circle Our Empire [FLAC]	04 - Mamacita.flac	-9.150002	0.999481
what.cd/Rudiments - Circle Our Empire [FLAC]	05 - Too Late.flac	-11.959999	0.999451
what.cd/Rudiments - Circle Our Empire [FLAC]	06 - Wailing Paddle.flac	-8.580002	0.999512
what.cd/Rudiments - Circle Our Empire [FLAC]	07 - Lucky Charms.flac	-9.269997	0.999481
what.cd/Rudiments - Circle Our Empire [FLAC]	08 - The Doctor.flac	-11.000000	0.950989
what.cd/Rudiments - Circle Our Empire [FLAC]	09 - Pounce.flac	-11.190002	0.999420
what.cd/Rudiments - Circle Our Empire [FLAC]	10 - Spoon.flac	-8.800003	0.999512
what.cd/Rudiments - Circle Our Empire [FLAC]	11 - What's Cooking.flac	-9.959999	0.999512
what.cd/Rudiments - Circle Our Empire [FLAC]	12 - Pathfinder.flac	-7.699997	0.999481
what.cd/Rudiments - Circle Our Empire [FLAC]	13 - Dine In Crossfire.flac	-8.160004	0.999420
what.cd/Rudiments - Circle Our Empire [FLAC]	14 - Trash.flac	-9.480003	0.999390
what.cd/Rudiments - Circle Our Empire [FLAC]	15 - Two Face.flac	-10.389999	0.972107
what.cd/Rudiments - Circle Our Empire [FLAC]	16 - The Sweet Doc.flac	-8.739998	0.999420
what.cd/Rudiments - Circle Our Empire [FLAC]	17 - Skactopus.flac	-10.750000	0.999420
what.cd/Run Your Pockets (FLAC)	01 No Cash - Samurais Of The Sea.flac	-9.699997	1.000000
what.cd/Run Your Pockets (FLAC)	02 No Cash - Life Sucks.flac	-11.360001	1.000000
what.cd/Run Your Pockets (FLAC)	03 No Cash - Wilkes Booth Style.flac	-12.650002	1.000000
what.cd/Run Your Pockets (FLAC)	04 No Cash - Knowledge Is Power.flac	-9.639999	1.000000
what.cd/Run Your Pockets (FLAC)	05 No Cash - Skate Or Die.flac	-10.849998	1.000000
what.cd/Run Your Pockets (FLAC)	06 No Cash - Pierce The Gates.flac	-8.519997	1.000000
what.cd/Run Your Pockets (FLAC)	07 No Cash - Homelife Is A Drag.flac	-6.340004	1.000000
what.cd/Run Your Pockets (FLAC)	08 No Cash - The Lucky Few.flac	-11.669998	1.000000
what.cd/Run Your Pockets (FLAC)	09 No Cash - Pure Evil.flac	-10.180000	1.000000
what.cd/Run Your Pockets (FLAC)	10 No Cash - A Better Tomorrow.flac	-10.489998	1.000000
what.cd/Run Your Pockets (FLAC)	11 No Cash - Gasoline.flac	-9.220001	1.000000
what.cd/Run Your Pockets (FLAC)	12 No Cash - Run Your Pockets.flac	-10.040001	1.000000
what.cd/RX Bandits - ...And the Battle Begun	01 - Rx Bandits - Intro.flac	0.489998	0.638367
what.cd/RX Bandits - ...And the Battle Begun	02 - Rx Bandits - ...And The Battle Begun.flac	-9.790001	0.996307
what.cd/RX Bandits - ...And the Battle Begun	03 - Rx Bandits - In Her Drawer.flac	-10.209999	0.996277
what.cd/RX Bandits - ...And the Battle Begun	04 - Rx Bandits - Only For the Night.flac	-9.139999	0.996216
what.cd/RX Bandits - ...And the Battle Begun	05 - Rx Bandits - On a Lonely Screen.flac	-9.669998	0.984833
what.cd/RX Bandits - ...And the Battle Begun	06 - Rx Bandits - 1980.flac	-9.660004	0.998901
what.cd/RX Bandits - ...And the Battle Begun	07 - Rx Bandits - One Million Miles an Hour, Fast Asleep.flac	-9.440002	0.996246
what.cd/RX Bandits - ...And the Battle Begun	08 - Rx Bandits - Apparition.flac	-8.639999	0.994720
what.cd/RX Bandits - ...And the Battle Begun	09 - Rx Bandits - A Mouth Full of Hollow Threats .flac	-9.080002	0.996185
what.cd/RX Bandits - ...And the Battle Begun	10 - Rx Bandits - Epoxi-Lips.flac	-9.050003	0.984802
what.cd/RX Bandits - ...And the Battle Begun	11 - Rx Bandits - Tainted Wheat.flac	-8.669998	0.985443
what.cd/RX Bandits - ...And the Battle Begun	12 - Rx Bandits - To Our Unborn Daughters.flac	-9.330002	0.984741
what.cd/RX Bandits - ...And the Battle Begun	13 - Rx Bandits - Crushing Destroyer.flac	-9.699997	0.998871
what.cd/Satellite	01 - Set It Off.flac	-9.639999	0.998962
what.cd/Satellite	02 - Alive.flac	-10.309998	0.987488
what.cd/Satellite	03 - Boom.flac	-9.639999	0.987000
what.cd/Satellite	04 - Youth of the Nation.flac	-8.330002	0.998962
what.cd/Satellite	05 - Celestial.flac	-5.220001	0.998932
what.cd/Satellite	06 - Satellite.flac	-9.699997	0.998962
what.cd/Satellite	07 - Ridiculous.flac	-8.629997	0.998962
what.cd/Satellite	08 - The Messenjah.flac	-9.330002	0.998962
what.cd/Satellite	09 - Guitarras de Amor.flac	-1.459999	0.864716
what.cd/Satellite	10 - Anything Right.flac	-9.220001	0.998962
what.cd/Satellite	11 - Ghetto.flac	-8.650002	0.998932
what.cd/Satellite	12 - Masterpiece Conspiracy.flac	-9.010002	0.998962
what.cd/Satellite	13 - Without Jah, Nothin'.flac	-9.209999	0.998962
what.cd/Satellite	14 - Thinking About Forever.flac	-7.900002	0.998962
what.cd/Satellite	15 - Portrait.flac	-8.480003	0.998962
what.cd/Save Ferris - Modified	01 - Turn It Up.flac	-9.570000	0.998871
what.cd/Save Ferris - Modified	02 - The Only Way To Be.flac	-9.540001	0.998871
what.cd/Save Ferris - Modified	03 - I'm Not Cryin' For You.flac	-8.730003	0.998871
what.cd/Save Ferris - Modified	04 - Your Friend.flac	-10.029999	0.998871
what.cd/Save Ferris - Modified	05 - No Love.flac	-8.900002	0.998840
what.cd/Save Ferris - Modified	06 - Angry Situation.flac	-9.779999	0.998871
what.cd/Save Ferris - Modified	07 - What You See Is What You Get.flac	-10.040001	0.983307
what.cd/Save Ferris - Modified	08 - One More Try.flac	-4.830002	0.977325
what.cd/Save Ferris - Modified	09 - Mistaken.flac	-9.650002	0.998871
what.cd/Save Ferris - Modified	10 - Holding On.flac	-9.459999	0.991638
what.cd/Save Ferris - Modified	11 - Let Me In.flac	-9.059998	0.998840
what.cd/Selah Sue	01 - Selah Sue - This World.flac	-10.400002	0.988525
what.cd/Selah Sue	02 - Selah Sue - Peace Of Mind.flac	-9.580002	0.988525
what.cd/Selah Sue	03 - Selah Sue - Raggamuffin.flac	-8.769997	0.988525
what.cd/Selah Sue	04 - Selah Sue - Crazy Vibes.flac	-9.470001	0.988525
what.cd/Selah Sue	05 - Selah Sue - Black Part Love.flac	-9.070000	0.988525
what.cd/Selah Sue	06 - Selah Sue - Mommy.flac	-8.099998	0.988525
what.cd/Selah Sue	07 - Selah Sue - Explanations.flac	-4.660004	0.795105
what.cd/Selah Sue	08 - Selah Sue - Please (Ft.Cee-Lo Green).flac	-9.059998	0.988525
what.cd/Selah Sue	09 - Selah Sue - Summertime.flac	-5.570000	0.988525
what.cd/Selah Sue	10 - Selah Sue - Style Crazy Sufferin.flac	-8.860001	0.988525
what.cd/Selah Sue	11 - Selah Sue - Fyah Fyah.flac	-9.379997	0.988525
what.cd/Selah Sue	12 - Selah Sue - Just Because I Do.flac	-8.769997	0.901520
what.cd/Senser - How To Do Battle FLAC (2009)	01 - Wake Up, You're On Fire.flac	-1.889999	0.891266
what.cd/Senser - How To Do Battle FLAC (2009)	02 - Resistance Now.flac	-11.400002	1.000000
what.cd/Senser - How To Do Battle FLAC (2009)	03 - Brightest Rays.flac	-11.639999	1.000000
what.cd/Senser - How To Do Battle FLAC (2009)	04 - 2 3 Clear.flac	-11.320000	1.000000
what.cd/Senser - How To Do Battle FLAC (2009)	05 - Dictator Bling.flac	-11.230003	1.000000
what.cd/Senser - How To Do Battle FLAC (2009)	06 - End Of The World Show.flac	-11.400002	1.000000
what.cd/Senser - How To Do Battle FLAC (2009)	07 - Smoking Paranoia.flac	-10.680000	1.000000
what.cd/Senser - How To Do Battle FLAC (2009)	08 - Sandhurst In Zero G.flac	-4.349998	0.794342
what.cd/Senser - How To Do Battle FLAC (2009)	09 - So Refined.flac	-11.690002	1.000000
what.cd/Senser - How To Do Battle FLAC (2009)	10 - Hex.flac	-11.340004	1.000000
what.cd/Senser - How To Do Battle FLAC (2009)	11 - Fairytale.flac	-9.230003	1.000000
what.cd/Senser - How To Do Battle FLAC (2009)	12 - Lights Out.flac	-11.239998	1.000000
what.cd/Senser - How To Do Battle FLAC (2009)	13 - Arturo.flac	-1.540001	1.000000
what.cd/Sepultura - Roots (1996) [FLAC]	01 Roots Bloody Roots.flac	-9.029999	0.966034
what.cd/Sepultura - Roots (1996) [FLAC]	02 Attitude.flac	-9.269997	0.999969
what.cd/Sepultura - Roots (1996) [FLAC]	03 Cut-Throat.flac	-8.090004	0.999969
what.cd/Sepultura - Roots (1996) [FLAC]	04 Ratamahatta.flac	-9.349998	0.999969
what.cd/Sepultura - Roots (1996) [FLAC]	05 Breed Apart.flac	-8.199997	0.999969
what.cd/Sepultura - Roots (1996) [FLAC]	06 Straighthate.flac	-9.510002	0.999969
what.cd/Sepultura - Roots (1996) [FLAC]	07 Spit.flac	-8.519997	0.999969
what.cd/Sepultura - Roots (1996) [FLAC]	08 Lookaway.flac	-7.639999	0.999969
what.cd/Sepultura - Roots (1996) [FLAC]	09 Dusted.flac	-9.349998	0.999969
what.cd/Sepultura - Roots (1996) [FLAC]	10 Born Stubborn.flac	-9.059998	0.999969
what.cd/Sepultura - Roots (1996) [FLAC]	11 Jasco.flac	-3.669998	0.999969
what.cd/Sepultura - Roots (1996) [FLAC]	12 Itsari.flac	-4.840004	0.999969
what.cd/Sepultura - Roots (1996) [FLAC]	13 Ambush.flac	-9.269997	0.999969
what.cd/Sepultura - Roots (1996) [FLAC]	14 Endagered Species.flac	-7.370003	0.999969
what.cd/Sepultura - Roots (1996) [FLAC]	15 Dictatorshit.flac	-8.720001	0.999969
what.cd/Sepultura - Roots (1996) [FLAC]	16 Canyon Jam.flac	-3.790001	0.999969
what.cd/Sex Pistols - Never Mind the Bollocks, Here's The Sex Pistols (1977) [FLAC]	01 - The Sex Pistols - Holidays in the Sun.flac	-3.800003	0.850342
what.cd/Sex Pistols - Never Mind the Bollocks, Here's The Sex Pistols (1977) [FLAC]	02 - The Sex Pistols - Bodies.flac	-4.029999	0.999969
what.cd/Sex Pistols - Never Mind the Bollocks, Here's The Sex Pistols (1977) [FLAC]	03 - The Sex Pistols - No Feelings.flac	-3.029999	0.877441
what.cd/Sex Pistols - Never Mind the Bollocks, Here's The Sex Pistols (1977) [FLAC]	04 - The Sex Pistols - Liar.flac	-3.370003	0.998383
what.cd/Sex Pistols - Never Mind the Bollocks, Here's The Sex Pistols (1977) [FLAC]	05 - The Sex Pistols - Problems.flac	-3.320000	0.979034
what.cd/Sex Pistols - Never Mind the Bollocks, Here's The Sex Pistols (1977) [FLAC]	06 - The Sex Pistols - God Save the Queen.flac	-3.320000	0.981659
what.cd/Sex Pistols - Never Mind the Bollocks, Here's The Sex Pistols (1977) [FLAC]	07 - The Sex Pistols - Seventeen.flac	-3.620003	0.999969
what.cd/Sex Pistols - Never Mind the Bollocks, Here's The Sex Pistols (1977) [FLAC]	08 - The Sex Pistols - Anarchy in the UK.flac	-4.110001	0.972504
what.cd/Sex Pistols - Never Mind the Bollocks, Here's The Sex Pistols (1977) [FLAC]	09 - The Sex Pistols - Submission.flac	-2.470001	0.999542
what.cd/Sex Pistols - Never Mind the Bollocks, Here's The Sex Pistols (1977) [FLAC]	10 - The Sex Pistols - Pretty Vacant.flac	-4.019997	1.000000
what.cd/Sex Pistols - Never Mind the Bollocks, Here's The Sex Pistols (1977) [FLAC]	11 - The Sex Pistols - New York.flac	-3.279999	0.983887
what.cd/Sex Pistols - Never Mind the Bollocks, Here's The Sex Pistols (1977) [FLAC]	12 - The Sex Pistols - EMI.flac	-3.980003	0.999969
what.cd/Siren Song Of The Counter Culture	01 - State Of The Union.flac	-9.750000	0.999390
what.cd/Siren Song Of The Counter Culture	02 - The First Drop.flac	-9.699997	1.000000
what.cd/Siren Song Of The Counter Culture	03 - Life Less Frightening.flac	-10.459999	1.000000
what.cd/Siren Song Of The Counter Culture	04 - Paper Wings.flac	-9.620003	0.999023
what.cd/Siren Song Of The Counter Culture	05 - Blood To Bleed.flac	-9.139999	0.999023
what.cd/Siren Song Of The Counter Culture	06 - To Them These Streets Belong.flac	-10.580002	1.000000
what.cd/Siren Song Of The Counter Culture	07 - Tip The Scales.flac	-9.620003	0.999023
what.cd/Siren Song Of The Counter Culture	08 - Anywhere But Here.flac	-9.309998	0.999023
what.cd/Siren Song Of The Counter Culture	09 - Give It All.flac	-9.779999	0.999603
what.cd/Siren Song Of The Counter Culture	10 - Dancing For Rain.flac	-9.510002	0.999023
what.cd/Siren Song Of The Counter Culture	11 - Swing Life Away.flac	-7.160004	0.999023
what.cd/Siren Song Of The Counter Culture	12 - Rumors Of My Demise Have Been Greatly Exaggerated.flac	-9.860001	0.999023
what.cd/Skafandr - 2006 - Убить Голос FLAC	CD1 (Голос)/Skafandr - 01 - Intro.flac	-6.949997	0.980469
what.cd/Skafandr - 2006 - Убить Голос FLAC	CD1 (Голос)/Skafandr - 02 - Все к чему-то приводит (feat. Илья Разин).flac	-11.660004	1.000000
what.cd/Skafandr - 2006 - Убить Голос FLAC	CD1 (Голос)/Skafandr - 03 - Петр живет в тайге (feat. Захар Май).flac	-10.830002	1.000000
what.cd/Skafandr - 2006 - Убить Голос FLAC	CD1 (Голос)/Skafandr - 04 - Не мы (feat. Вася Васин).flac	-10.440002	1.000000
what.cd/Skafandr - 2006 - Убить Голос FLAC	CD1 (Голос)/Skafandr - 05 - ....flac	5.169998	0.660431
what.cd/Skafandr - 2006 - Убить Голос FLAC	CD1 (Голос)/Skafandr - 06 - Немые речи (feat. Владимир Долгов).flac	-11.360001	1.000000
what.cd/Skafandr - 2006 - Убить Голос FLAC	CD1 (Голос)/Skafandr - 07 - Наблюдатель (feat. Олег Воробьевский).flac	-12.470001	1.000000
what.cd/Skafandr - 2006 - Убить Голос FLAC	CD1 (Голос)/Skafandr - 08 - Солдаты (feat. Dj Shahash, Максим Новый, Сергей Вырвич).flac	-9.650002	0.993805
what.cd/Skafandr - 2006 - Убить Голос FLAC	CD1 (Голос)/Skafandr - 09 - ....flac	-7.320000	0.993256
what.cd/Skafandr - 2006 - Убить Голос FLAC	CD1 (Голос)/Skafandr - 10 - Show must go on (feat. Алексей Никонов, Дмитрий Порубов, Салима).flac	-10.459999	1.000000
what.cd/Skafandr - 2006 - Убить Голос FLAC	CD1 (Голос)/Skafandr - 11 - Холод и лед (feat. Игорь Мамонов).flac	-11.040001	1.000000
what.cd/Skafandr - 2006 - Убить Голос FLAC	CD1 (Голос)/Skafandr - 12 - Вес и сила (feat. Анна Столярова).flac	-10.830002	1.000000
what.cd/Skafandr - 2006 - Убить Голос FLAC	CD1 (Голос)/Skafandr - 13 - Колыбельная для утопленницы (feat. Вера Огарева).flac	-11.169998	1.000000
what.cd/Skafandr - 2006 - Убить Голос FLAC	CD1 (Голос)/Skafandr - 14 - Полоска (feat. Михаил Феничев, Михаил Ильин).flac	-7.739998	0.996216
what.cd/Skafandr - 2006 - Убить Голос FLAC	CD1 (Голос)/Skafandr - 15 - Вселенная (feat. Алена Вартамо).flac	-10.660004	1.000000
what.cd/Skafandr - 2006 - Убить Голос FLAC	CD1 (Голос)/Skafandr - 16 - Поджигай (feat. Андрей Шевченко).flac	-11.510002	1.000000
what.cd/Skafandr - 2006 - Убить Голос FLAC	CD1 (Голос)/Skafandr - 17 - ....flac	-9.309998	1.000000
what.cd/Skafandr - 2006 - Убить Голос FLAC	CD1 (Голос)/Skafandr - 18 - Космические сны (feat. Наталья Полищук).flac	-11.349998	1.000000
what.cd/Skafandr - 2006 - Убить Голос FLAC	CD1 (Голос)/Skafandr - 19 - Были по п.... (feat. Дмитрий Порубов).flac	-9.269997	0.999969
what.cd/Skafandr - 2006 - Убить Голос FLAC	CD1 (Голос)/Skafandr - 20 - Outro.flac	-6.860001	1.000000
what.cd/Skafandr - 2006 - Убить Голос FLAC	CD2 (Убить Голос)/Skafandr - 01 - Intro.flac	-6.949997	0.980469
what.cd/Skafandr - 2006 - Убить Голос FLAC	CD2 (Убить Голос)/Skafandr - 02 - Все к чему-то приводит.flac	-11.180000	1.000000
what.cd/Skafandr - 2006 - Убить Голос FLAC	CD2 (Убить Голос)/Skafandr - 03 - Петр живет в тайге.flac	-9.519997	1.000000
what.cd/Skafandr - 2006 - Убить Голос FLAC	CD2 (Убить Голос)/Skafandr - 04 - Не мы.flac	-10.419998	1.000000
what.cd/Skafandr - 2006 - Убить Голос FLAC	CD2 (Убить Голос)/Skafandr - 05 - ....flac	5.130001	0.660431
what.cd/Skafandr - 2006 - Убить Голос FLAC	CD2 (Убить Голос)/Skafandr - 06 - Немые речи.flac	-10.849998	1.000000
what.cd/Skafandr - 2006 - Убить Голос FLAC	CD2 (Убить Голос)/Skafandr - 07 - Наблюдатель.flac	-12.830002	1.000000
what.cd/Skafandr - 2006 - Убить Голос FLAC	CD2 (Убить Голос)/Skafandr - 08 - Солдаты.flac	-9.669998	0.993500
what.cd/Skafandr - 2006 - Убить Голос FLAC	CD2 (Убить Голос)/Skafandr - 09 - ....flac	-7.349998	0.993256
what.cd/Skafandr - 2006 - Убить Голос FLAC	CD2 (Убить Голос)/Skafandr - 10 - Show must go on.flac	-9.800003	1.000000
what.cd/Skafandr - 2006 - Убить Голос FLAC	CD2 (Убить Голос)/Skafandr - 11 - Холод и лед.flac	-10.139999	1.000000
what.cd/Skafandr - 2006 - Убить Голос FLAC	CD2 (Убить Голос)/Skafandr - 12 - Вес и сила.flac	-10.559998	1.000000
what.cd/Skafandr - 2006 - Убить Голос FLAC	CD2 (Убить Голос)/Skafandr - 13 - Колыбельная для утопленницы.flac	-11.360001	1.000000
what.cd/Skafandr - 2006 - Убить Голос FLAC	CD2 (Убить Голос)/Skafandr - 14 - Полоска.flac	-6.660004	0.993195
what.cd/Skafandr - 2006 - Убить Голос FLAC	CD2 (Убить Голос)/Skafandr - 15 - Вселенная.flac	-9.209999	1.000000
what.cd/Skafandr - 2006 - Убить Голос FLAC	CD2 (Убить Голос)/Skafandr - 16 - Поджигай.flac	-12.029999	1.000000
what.cd/Skafandr - 2006 - Убить Голос FLAC	CD2 (Убить Голос)/Skafandr - 17 - ....flac	-9.480003	1.000000
what.cd/Skafandr - 2006 - Убить Голос FLAC	CD2 (Убить Голос)/Skafandr - 18 - Космические сны.flac	-10.760002	1.000000
what.cd/Skafandr - 2006 - Убить Голос FLAC	CD2 (Убить Голос)/Skafandr - 19 - Были по п.....flac	-8.900002	1.000000
what.cd/Skafandr - 2006 - Убить Голос FLAC	CD2 (Убить Голос)/Skafandr - 20 - Outro.flac	-6.760002	1.000000
what.cd/Ska-P (2002) !! Que Corra La Voz !! [FLAC]	01. Estampida.flac	-10.150002	0.999054
what.cd/Ska-P (2002) !! Que Corra La Voz !! [FLAC]	02. Consumo Gusto.flac	-9.989998	0.999054
what.cd/Ska-P (2002) !! Que Corra La Voz !! [FLAC]	03. Welcom To Hell.flac	-10.010002	0.999054
what.cd/Ska-P (2002) !! Que Corra La Voz !! [FLAC]	04. Casposos.flac	-8.980003	1.000000
what.cd/Ska-P (2002) !! Que Corra La Voz !! [FLAC]	05. Nino Soldado.flac	-10.419998	0.970490
what.cd/Ska-P (2002) !! Que Corra La Voz !! [FLAC]	06. Intifada.flac	-11.110001	0.932739
what.cd/Ska-P (2002) !! Que Corra La Voz !! [FLAC]	07. McDolar.flac	-11.099998	0.999054
what.cd/Ska-P (2002) !! Que Corra La Voz !! [FLAC]	08. Solamente Por Pensar.flac	-11.379997	0.999054
what.cd/Ska-P (2002) !! Que Corra La Voz !! [FLAC]	09. Insensibilidad.flac	-10.349998	0.999054
what.cd/Ska-P (2002) !! Que Corra La Voz !! [FLAC]	10. Esquirol.flac	-10.970001	0.999023
what.cd/Ska-P (2002) !! Que Corra La Voz !! [FLAC]	11. El Olvidado.flac	-10.709999	0.977417
what.cd/Ska-P (2002) !! Que Corra La Voz !! [FLAC]	12. Mis colegas.flac	-11.180000	0.922302
what.cd/Ska-P - 2008 - Lágrimas Y Gozos [FLAC]	01 - Ni Fu Ni Fa.flac	-11.279999	0.989227
what.cd/Ska-P - 2008 - Lágrimas Y Gozos [FLAC]	02 - El Libertador.flac	-11.029999	0.989136
what.cd/Ska-P - 2008 - Lágrimas Y Gozos [FLAC]	03 - Crimen Sollicitationis.flac	-11.730003	0.989105
what.cd/Ska-P - 2008 - Lágrimas Y Gozos [FLAC]	04 - Fuego Y Miedo.flac	-10.879997	0.989044
what.cd/Ska-P - 2008 - Lágrimas Y Gozos [FLAC]	05 - La Colmena.flac	-11.099998	0.989105
what.cd/Ska-P - 2008 - Lágrimas Y Gozos [FLAC]	06 - Gasta Claus.flac	-11.919998	0.989166
what.cd/Ska-P - 2008 - Lágrimas Y Gozos [FLAC]	07 - El Imperio Caerá.flac	-11.269997	0.989044
what.cd/Ska-P - 2008 - Lágrimas Y Gozos [FLAC]	08 - Los Hijos Bastardos De La Globalización.flac	-11.419998	0.989105
what.cd/Ska-P - 2008 - Lágrimas Y Gozos [FLAC]	09 - Vándalo.flac	-11.430000	0.989136
what.cd/Ska-P - 2008 - Lágrimas Y Gozos [FLAC]	10 - El Tercero De La Foto.flac	-11.879997	0.989105
what.cd/Ska-P - 2008 - Lágrimas Y Gozos [FLAC]	11 - Decadencia.flac	-11.300003	0.989166
what.cd/Ska-P - 2008 - Lágrimas Y Gozos [FLAC]	12 - Qué Puedo Decir.flac	-10.370003	0.989166
what.cd/Ska-P - 2008 - Lágrimas Y Gozos [FLAC]	13 - Wild Spain.flac	-11.120003	0.989105
what.cd/Skatalites - 1997 - Foundation Ska [FLAC]	The Skatalites - 1997 - Foundation Ska - Disc One/01 - Christine Keeler.flac	-5.519997	0.988586
what.cd/Skatalites - 1997 - Foundation Ska [FLAC]	The Skatalites - 1997 - Foundation Ska - Disc One/02 - Fidel Castro.flac	-3.790001	0.842621
what.cd/Skatalites - 1997 - Foundation Ska [FLAC]	The Skatalites - 1997 - Foundation Ska - Disc One/03 - Simmer Down (with Bob Marley and The Wailers).flac	-7.300003	0.988556
what.cd/Skatalites - 1997 - Foundation Ska [FLAC]	The Skatalites - 1997 - Foundation Ska - Disc One/04 - Alley Pang.flac	-4.550003	0.988556
what.cd/Skatalites - 1997 - Foundation Ska [FLAC]	The Skatalites - 1997 - Foundation Ska - Disc One/05 - Exodus.flac	-6.590004	0.988556
what.cd/Skatalites - 1997 - Foundation Ska [FLAC]	The Skatalites - 1997 - Foundation Ska - Disc One/06 - King Solomon.flac	-4.849998	0.988586
what.cd/Skatalites - 1997 - Foundation Ska [FLAC]	The Skatalites - 1997 - Foundation Ska - Disc One/07 - Eastern Standard Time.flac	-4.849998	0.988586
what.cd/Skatalites - 1997 - Foundation Ska [FLAC]	The Skatalites - 1997 - Foundation Ska - Disc One/08 - World's Fair (with Stranger Cole and Ken Boothe).flac	-5.489998	0.925873
what.cd/Skatalites - 1997 - Foundation Ska [FLAC]	The Skatalites - 1997 - Foundation Ska - Disc One/09 - Two For One.flac	-6.090004	0.988586
what.cd/Skatalites - 1997 - Foundation Ska [FLAC]	The Skatalites - 1997 - Foundation Ska - Disc One/10 - I Should Have Known Better.flac	-7.760002	0.988586
what.cd/Skatalites - 1997 - Foundation Ska [FLAC]	The Skatalites - 1997 - Foundation Ska - Disc One/11 - Hot Cargo.flac	-5.500000	0.988586
what.cd/Skatalites - 1997 - Foundation Ska [FLAC]	The Skatalites - 1997 - Foundation Ska - Disc One/12 - Black Sunday.flac	-4.650002	0.988586
what.cd/Skatalites - 1997 - Foundation Ska [FLAC]	The Skatalites - 1997 - Foundation Ska - Disc One/13 - Ska La Parisienne.flac	-5.590004	0.964783
what.cd/Skatalites - 1997 - Foundation Ska [FLAC]	The Skatalites - 1997 - Foundation Ska - Disc One/14 - Don D Lion.flac	-5.639999	0.988586
what.cd/Skatalites - 1997 - Foundation Ska [FLAC]	The Skatalites - 1997 - Foundation Ska - Disc One/15 - Dick Tracy.flac	-4.580002	0.988586
what.cd/Skatalites - 1997 - Foundation Ska [FLAC]	The Skatalites - 1997 - Foundation Ska - Disc One/16 - Hanging Tree.flac	-7.349998	0.919373
what.cd/Skatalites - 1997 - Foundation Ska [FLAC]	The Skatalites - 1997 - Foundation Ska - Disc Two/01 - Scandal Ska.flac	-4.150002	0.988586
what.cd/Skatalites - 1997 - Foundation Ska [FLAC]	The Skatalites - 1997 - Foundation Ska - Disc Two/02 - Occupation.flac	-4.180000	0.988586
what.cd/Skatalites - 1997 - Foundation Ska [FLAC]	The Skatalites - 1997 - Foundation Ska - Disc Two/03 - Old Rocking Chair (feat. Jackie Opel).flac	-6.809998	0.780487
what.cd/Skatalites - 1997 - Foundation Ska [FLAC]	The Skatalites - 1997 - Foundation Ska - Disc Two/04 - Third Man Ska.flac	-9.279999	0.820831
what.cd/Skatalites - 1997 - Foundation Ska [FLAC]	The Skatalites - 1997 - Foundation Ska - Disc Two/05 - Ringo's Theme Ska.flac	-5.389999	0.988586
what.cd/Skatalites - 1997 - Foundation Ska [FLAC]	The Skatalites - 1997 - Foundation Ska - Disc Two/06 - Ringo's Theme (v2).flac	-6.290001	0.988586
what.cd/Skatalites - 1997 - Foundation Ska [FLAC]	The Skatalites - 1997 - Foundation Ska - Disc Two/07 - Nimrod.flac	-4.730003	0.988556
what.cd/Skatalites - 1997 - Foundation Ska [FLAC]	The Skatalites - 1997 - Foundation Ska - Disc Two/08 - Woman a Come (feat. Margarita).flac	-4.160004	0.988586
what.cd/Skatalites - 1997 - Foundation Ska [FLAC]	The Skatalites - 1997 - Foundation Ska - Disc Two/09 - Cleopatra.flac	-7.230003	0.907990
what.cd/Skatalites - 1997 - Foundation Ska [FLAC]	The Skatalites - 1997 - Foundation Ska - Disc Two/10 - Beardsman Ska.flac	-6.110001	1.000000
what.cd/Skatalites - 1997 - Foundation Ska [FLAC]	The Skatalites - 1997 - Foundation Ska - Disc Two/11 - Addis Ababa.flac	-5.949997	0.999969
what.cd/Skatalites - 1997 - Foundation Ska [FLAC]	The Skatalites - 1997 - Foundation Ska - Disc Two/12 - Silver Dollar (original version).flac	-4.820000	0.780548
what.cd/Skatalites - 1997 - Foundation Ska [FLAC]	The Skatalites - 1997 - Foundation Ska - Disc Two/13 - The Vow (feat. Jackie Opel & Doreen Schaffer).flac	-5.250000	0.988586
what.cd/Skatalites - 1997 - Foundation Ska [FLAC]	The Skatalites - 1997 - Foundation Ska - Disc Two/14 - Dr Kildare.flac	-2.879997	0.988586
what.cd/Skatalites - 1997 - Foundation Ska [FLAC]	The Skatalites - 1997 - Foundation Ska - Disc Two/15 - Killer Diller.flac	-5.610001	0.928589
what.cd/Skatalites - 1997 - Foundation Ska [FLAC]	The Skatalites - 1997 - Foundation Ska - Disc Two/16 - Naked City.flac	-6.250000	0.988586
what.cd/slapstick [1997]	01 - Slapstick - There's a Metal Head in the Parking Lot.flac	-5.699997	0.999939
what.cd/slapstick [1997]	02 - Slapstick - The Park.flac	-5.150002	0.999939
what.cd/slapstick [1997]	03 - Slapstick - Eighteen.flac	-4.989998	0.999939
what.cd/slapstick [1997]	04 - Slapstick - What I Learned.flac	-5.860001	0.999969
what.cd/slapstick [1997]	05 - Slapstick - February One.flac	-5.959999	0.999969
what.cd/slapstick [1997]	06 - Slapstick - Sick of This Place.flac	-6.019997	0.999939
what.cd/slapstick [1997]	07 - Slapstick - Good Times Gone.flac	-3.590004	0.999969
what.cd/slapstick [1997]	08 - Slapstick - Almost Punk Enough.flac	-2.820000	0.999969
what.cd/slapstick [1997]	09 - Slapstick - Cheat to Win.flac	-3.459999	0.999969
what.cd/slapstick [1997]	10 - Slapstick - Crooked.flac	-0.660004	0.999969
what.cd/slapstick [1997]	11 - Slapstick - Colorado.flac	-2.349998	0.999939
what.cd/slapstick [1997]	12 - Slapstick - 74 Fullerton.flac	-2.750000	0.999969
what.cd/slapstick [1997]	13 - Slapstick - She Doesn't Love Me.flac	-2.349998	0.999969
what.cd/slapstick [1997]	14 - Slapstick - My Way.flac	-1.970001	0.999939
what.cd/slapstick [1997]	15 - Slapstick - The Geek.flac	-3.139999	0.999939
what.cd/slapstick [1997]	16 - Slapstick - Not Tonight.flac	-2.590004	0.999969
what.cd/slapstick [1997]	17 - Slapstick - Ed.flac	-2.320000	0.999939
what.cd/slapstick [1997]	18 - Slapstick - The Punks.flac	-2.540001	0.999939
what.cd/slapstick [1997]	19 - Slapstick - Nate B..flac	-3.110001	0.999969
what.cd/slapstick [1997]	20 - Slapstick - Broken Down.flac	-3.820000	0.999969
what.cd/slapstick [1997]	21 - Slapstick - Johnny.flac	-4.559998	0.999969
what.cd/slapstick [1997]	22 - Slapstick - Wake Up Stanley.flac	-3.150002	0.999969
what.cd/slapstick [1997]	23 - Slapstick - My Only Friend.flac	-4.500000	0.999969
what.cd/slapstick [1997]	24 - Slapstick - Earth Angel.flac	-5.360001	0.999969
what.cd/slapstick [1997]	25 - Slapstick - Alternative Radio.flac	-3.709999	0.999969
what.cd/Slightly Stoopid - 2005 - Closer To The Sun	01 - Intro.flac	-6.230003	0.961975
what.cd/Slightly Stoopid - 2005 - Closer To The Sun	02 - Babylon Is Falling.flac	-7.739998	0.988556
what.cd/Slightly Stoopid - 2005 - Closer To The Sun	03 - Somebody.flac	-8.040001	0.988556
what.cd/Slightly Stoopid - 2005 - Closer To The Sun	04 - Fat Spliffs.flac	-7.699997	0.988556
what.cd/Slightly Stoopid - 2005 - Closer To The Sun	05 - Bandelero.flac	-9.680000	0.988556
what.cd/Slightly Stoopid - 2005 - Closer To The Sun	06 - See It No Other Way.flac	-6.919998	0.988556
what.cd/Slightly Stoopid - 2005 - Closer To The Sun	07 - Nothin Over Me.flac	-11.709999	0.999725
what.cd/Slightly Stoopid - 2005 - Closer To The Sun	08 - This Joint.flac	-8.900002	0.981903
what.cd/Slightly Stoopid - 2005 - Closer To The Sun	09 - Older.flac	-8.879997	0.864227
what.cd/Slightly Stoopid - 2005 - Closer To The Sun	10 - Ain't Got A Lot Of Money.flac	-8.209999	0.988556
what.cd/Slightly Stoopid - 2005 - Closer To The Sun	11 - Till It Gets Wet.flac	-9.379997	0.988556
what.cd/Slightly Stoopid - 2005 - Closer To The Sun	12 - Don't Care.flac	-8.160004	0.988770
what.cd/Slightly Stoopid - 2005 - Closer To The Sun	13 - Basher.flac	-7.059998	0.988556
what.cd/Slightly Stoopid - 2005 - Closer To The Sun	14 - Righteous Man.flac	-10.989998	0.999725
what.cd/Slightly Stoopid - 2005 - Closer To The Sun	15 - Up On A Plane.flac	-8.440002	0.988556
what.cd/Slightly Stoopid - 2005 - Closer To The Sun	16 - Waiting.flac	-10.370003	0.988556
what.cd/Slightly Stoopid - 2005 - Closer To The Sun	17 - Closer To The Sun.flac	-7.830002	0.993561
what.cd/Slightly Stoopid - 2005 - Closer To The Sun	18 - Zeplike.flac	-6.010002	0.988556
what.cd/Slightly Stoopid - 2005 - Closer To The Sun	19 - Comb 4 My Dome.flac	-8.320000	0.851410
what.cd/Slightly Stoopid - 2005 - Closer To The Sun	20 - Open Road.flac	-8.209999	0.997528
what.cd/Slightly Stoopid -Everything You Need (2003) [FLAC]	01 Everything You Need.flac	-7.489998	0.988617
what.cd/Slightly Stoopid -Everything You Need (2003) [FLAC]	02 Officer.flac	-9.459999	0.988617
what.cd/Slightly Stoopid -Everything You Need (2003) [FLAC]	03 Questionable.flac	-10.830002	0.962036
what.cd/Slightly Stoopid -Everything You Need (2003) [FLAC]	04 Runnin' With A Gun.flac	-8.360001	0.988617
what.cd/Slightly Stoopid -Everything You Need (2003) [FLAC]	05 Killin' Me Deep Inside.flac	-9.610001	0.988617
what.cd/Slightly Stoopid -Everything You Need (2003) [FLAC]	06 Perfect Gentleman.flac	-10.680000	0.988617
what.cd/Slightly Stoopid -Everything You Need (2003) [FLAC]	07 Wicked Rebel.flac	-8.120003	0.988953
what.cd/Slightly Stoopid -Everything You Need (2003) [FLAC]	08 Sweet Honey.flac	-9.769997	0.988617
what.cd/Slightly Stoopid -Everything You Need (2003) [FLAC]	09 Punk Rock Billy.flac	-10.430000	0.988617
what.cd/Slightly Stoopid -Everything You Need (2003) [FLAC]	10 World Goes Round (Feat. I-Man).flac	-8.430000	0.988617
what.cd/Slightly Stoopid -Everything You Need (2003) [FLAC]	11 Wiseman.flac	-6.199997	0.999420
what.cd/Slightly Stoopid -Everything You Need (2003) [FLAC]	12 Leaving On A Jet Plane.flac	-8.010002	0.973541
what.cd/Slightly Stoopid -Everything You Need (2003) [FLAC]	13 Mellow Mood (Feat. G. Love).flac	-7.680000	0.988617
what.cd/Slightly Stoopid -Everything You Need (2003) [FLAC]	14 Collie Man.flac	-7.750000	0.988617
what.cd/Slightly Stoopid -Top Of The World-2012-(CD-FLAC- Lossless)	01 Top of the World.flac	-8.800003	1.000000
what.cd/Slightly Stoopid -Top Of The World-2012-(CD-FLAC- Lossless)	02 Don't Stop.flac	-6.739998	0.999725
what.cd/Slightly Stoopid -Top Of The World-2012-(CD-FLAC- Lossless)	03 Devils Door.flac	-9.500000	0.998840
what.cd/Slightly Stoopid -Top Of The World-2012-(CD-FLAC- Lossless)	04 Serious Man.flac	-8.559998	0.998871
what.cd/Slightly Stoopid -Top Of The World-2012-(CD-FLAC- Lossless)	05 Way You Move.flac	-8.099998	0.998871
what.cd/Slightly Stoopid -Top Of The World-2012-(CD-FLAC- Lossless)	06 Drink Professionally.flac	-6.930000	0.998779
what.cd/Slightly Stoopid -Top Of The World-2012-(CD-FLAC- Lossless)	07 Pon Da Horizon (With Barrington Levy).flac	-6.669998	0.997711
what.cd/Slightly Stoopid -Top Of The World-2012-(CD-FLAC- Lossless)	08 We Don't Wanna Go.flac	-8.590004	1.000000
what.cd/Slightly Stoopid -Top Of The World-2012-(CD-FLAC- Lossless)	09 Ska Diddy (With Angelo Moore).flac	-8.800003	0.998840
what.cd/Slightly Stoopid -Top Of The World-2012-(CD-FLAC- Lossless)	10 Just Thinking (With Chali 2NA).flac	-9.019997	0.998871
what.cd/Slightly Stoopid -Top Of The World-2012-(CD-FLAC- Lossless)	11 Your Love.flac	-6.099998	0.997528
what.cd/Slightly Stoopid -Top Of The World-2012-(CD-FLAC- Lossless)	12 Deal with It.flac	-7.199997	0.999573
what.cd/Slightly Stoopid -Top Of The World-2012-(CD-FLAC- Lossless)	13 Work.flac	-7.599998	0.999512
what.cd/Slightly Stoopid -Top Of The World-2012-(CD-FLAC- Lossless)	14 Mona June (With Angela).flac	-7.820000	0.998871
what.cd/Slightly Stoopid -Top Of The World-2012-(CD-FLAC- Lossless)	15 Rhythm Streets.flac	-5.279999	0.998779
what.cd/Slightly Stoopid -Top Of The World-2012-(CD-FLAC- Lossless)	16 Hiphoppablues (With G Love).flac	-8.709999	0.998871
what.cd/Slightly Stoopid -Top Of The World-2012-(CD-FLAC- Lossless)	17 New Day.flac	-3.790001	0.998871
what.cd/Slightly Stoopid -Top Of The World-2012-(CD-FLAC- Lossless)	18 Underneath The Pressure.flac	-8.199997	0.998871
what.cd/Slightly Stoopid -Top Of The World-2012-(CD-FLAC- Lossless)	19 Marijuana (With Don Carlos).flac	-7.940002	0.999451
what.cd/Slightly Stoopid -Top Of The World-2012-(CD-FLAC- Lossless)	20 Im On Fire.flac	-8.379997	0.998871
what.cd/Slightly Stoopid -Top Of The World-2012-(CD-FLAC- Lossless)	21 Intro To Organics (With Dan Papaila).flac	-9.750000	0.998871
what.cd/Sonic Boom Six - 2005 - Sounds to Consume- Champion Edition[FLAC]	01 - The Rape of Punk to Come.flac	-10.099998	0.988708
what.cd/Sonic Boom Six - 2005 - Sounds to Consume- Champion Edition[FLAC]	02 - Let the Children Play.flac	-10.419998	0.988708
what.cd/Sonic Boom Six - 2005 - Sounds to Consume- Champion Edition[FLAC]	03 - Monkey See Monkey Do (Funky Kingston).flac	-7.300003	0.988708
what.cd/Sonic Boom Six - 2005 - Sounds to Consume- Champion Edition[FLAC]	04 - Safe European Home.flac	-9.680000	0.988708
what.cd/Sonic Boom Six - 2005 - Sounds to Consume- Champion Edition[FLAC]	05 - Blood For Oil.flac	-11.449997	0.988708
what.cd/Sonic Boom Six - 2005 - Sounds to Consume- Champion Edition[FLAC]	06 - People Acklike They Don't Know.flac	-11.080002	0.988708
what.cd/Sonic Boom Six - 2005 - Sounds to Consume- Champion Edition[FLAC]	07 - The Devil Made Me Do It.flac	-11.550003	0.988739
what.cd/Sonic Boom Six - 2005 - Sounds to Consume- Champion Edition[FLAC]	08 - Silent Majority.flac	-11.040001	0.988739
what.cd/Sonic Boom Six - 2005 - Sounds to Consume- Champion Edition[FLAC]	09 - SB6 (Demo).flac	-10.199997	0.988739
what.cd/Sonic Boom Six - 2005 - Sounds to Consume- Champion Edition[FLAC]	10 - Northern Skies (Demo).flac	-9.480003	0.988708
what.cd/Sonic Boom Six - 2005 - Sounds to Consume- Champion Edition[FLAC]	11 - Different People (Demo).flac	-11.190002	0.988708
what.cd/Sonic Boom Six - 2005 - Sounds to Consume- Champion Edition[FLAC]	12 - Play Inna Day (Demo).flac	-10.570000	0.988708
what.cd/Sonic Boom Six - 2005 - Sounds to Consume- Champion Edition[FLAC]	13 - Rape of Dub to Come (Tim G Mash-up Refix).flac	-10.080002	0.988708
what.cd/Sonic Boom Six - 2005 - Sounds to Consume- Champion Edition[FLAC]	14 - Monkey See Monkey Do (Rogue Trooper's Jungle Fever).flac	-10.000000	0.988708
what.cd/Sonic Boom Six - 2005 - Sounds to Consume- Champion Edition[FLAC]	15 - Northern Dub (Casa Boom Reggae Refit).flac	-9.629997	0.988525
what.cd/Sonic Boom Six - 2005 - Sounds to Consume- Champion Edition[FLAC]	16 - The Reckoning (Babyboom Bonus Track).flac	-11.739998	0.988708
what.cd/Sonic Boom Six - 2005 - Sounds to Consume- Champion Edition[FLAC]	17 - Monkey See, Monkey Do (Live).flac	-11.070000	1.000000
what.cd/Sonic Boom Six - 2005 - Sounds to Consume- Champion Edition[FLAC]	18 - The Might Mighty Boom.flac	-11.320000	0.988708
what.cd/Sonic Boom Six - 2006 - The Ruff Guide to Genre-Terrorism	01 - Do It Today.flac	-10.519997	1.000000
what.cd/Sonic Boom Six - 2006 - The Ruff Guide to Genre-Terrorism	02 - Apathy Begins At Home.flac	-9.949997	1.000000
what.cd/Sonic Boom Six - 2006 - The Ruff Guide to Genre-Terrorism	03 - All In (feat Coolie Ranx).flac	-8.550003	1.000000
what.cd/Sonic Boom Six - 2006 - The Ruff Guide to Genre-Terrorism	04 - Piggy In The Middle.flac	-10.400002	1.000000
what.cd/Sonic Boom Six - 2006 - The Ruff Guide to Genre-Terrorism	05 - For Unlawful Carnal Knowledge.flac	-9.639999	1.000000
what.cd/Sonic Boom Six - 2006 - The Ruff Guide to Genre-Terrorism	06 - Northern Skies.flac	-10.029999	1.000000
what.cd/Sonic Boom Six - 2006 - The Ruff Guide to Genre-Terrorism	07 - Bigger Than Punk Rock.flac	-10.090004	1.000000
what.cd/Sonic Boom Six - 2006 - The Ruff Guide to Genre-Terrorism	08 - Danger! Danger!.flac	-10.540001	1.000000
what.cd/Sonic Boom Six - 2006 - The Ruff Guide to Genre-Terrorism	09 - Don't Say I Never Warned Ya....flac	-9.019997	1.000000
what.cd/Sonic Boom Six - 2006 - The Ruff Guide to Genre-Terrorism	10 - Shareena.flac	-10.309998	1.000000
what.cd/Sonic Boom Six - 2006 - The Ruff Guide to Genre-Terrorism	11 - A People's History of the Future.flac	-10.550003	1.000000
what.cd/Sonic Boom Six - 2006 - The Ruff Guide to Genre-Terrorism	12 - Until The Sunlight Comes.flac	-9.550003	1.000000
what.cd/Sonic Boom Six - 2007 - All In [FLAC]	01 - All In (feat. Coolie Ranx) (Single Mix).flac	-9.459999	1.000000
what.cd/Sonic Boom Six - 2007 - All In [FLAC]	02 - Face Forward.flac	-9.029999	1.000000
what.cd/Sonic Boom Six - 2007 - All In [FLAC]	03 - Marching Round In Circles.flac	-10.760002	1.000000
what.cd/Sonic Boom Six - 2007 - Arcade Perfect	01 - Arcade Perfect.flac	-8.660004	0.988647
what.cd/Sonic Boom Six - 2007 - Arcade Perfect	02 - While You Were Sleeping.flac	-9.360001	0.988647
what.cd/Sonic Boom Six - 2007 - Arcade Perfect	03 - Sound Of A Revolution.flac	-10.139999	0.988647
what.cd/Sonic Boom Six - 2007 - Arcade Perfect	04 - Tell Me Something That I Don't Know.flac	-9.510002	0.988647
what.cd/Sonic Boom Six - 2007 - Arcade Perfect	05 - The Strange Tale Of Sid The Strangler.flac	-9.739998	0.988647
what.cd/Sonic Boom Six - 2007 - Arcade Perfect	06 - Flower.flac	-5.849998	0.988647
what.cd/Sonic Boom Six - 2007 - Arcade Perfect	07 - Meanwhile, Back In The Real World....flac	-9.779999	0.988647
what.cd/Sonic Boom Six - 2007 - Arcade Perfect	08 - September To May.flac	-10.669998	0.998444
what.cd/Sonic Boom Six - 2007 - Arcade Perfect	09 - Ya Basta! (Rebel Alliance Mix Feat. Suicide Bid).flac	-7.669998	0.988647
what.cd/Sonic Boom Six - 2007 - Arcade Perfect	10 - I Wish I Could Smile.flac	-8.809998	0.988647
what.cd/Sonic Boom Six - 2007 - Arcade Perfect	11 - For 12 Weeks, The City Is Theirs.flac	-10.010002	0.999908
what.cd/Sonic Boom Six - 2008 - Play On - Rare, Rejected & Arcade Perfected [FLAC]	Disc 01 (Arcade Perfected)/01 - Sound Of Revolutionization.flac	-8.139999	0.966553
what.cd/Sonic Boom Six - 2008 - Play On - Rare, Rejected & Arcade Perfected [FLAC]	Disc 01 (Arcade Perfected)/02 - While New Were Sleeping.flac	-8.389999	0.982025
what.cd/Sonic Boom Six - 2008 - Play On - Rare, Rejected & Arcade Perfected [FLAC]	Disc 01 (Arcade Perfected)/03 - Ya Dubsta!.flac	-8.980003	0.966553
what.cd/Sonic Boom Six - 2008 - Play On - Rare, Rejected & Arcade Perfected [FLAC]	Disc 01 (Arcade Perfected)/04 - I Changed I Could Smile.flac	-5.989998	0.967651
what.cd/Sonic Boom Six - 2008 - Play On - Rare, Rejected & Arcade Perfected [FLAC]	Disc 01 (Arcade Perfected)/05 - Arcade Perfected.flac	-9.900002	0.966553
what.cd/Sonic Boom Six - 2008 - Play On - Rare, Rejected & Arcade Perfected [FLAC]	Disc 01 (Arcade Perfected)/06 - Meanwhile, Back In The Other World.flac	-8.000000	0.966553
what.cd/Sonic Boom Six - 2008 - Play On - Rare, Rejected & Arcade Perfected [FLAC]	Disc 01 (Arcade Perfected)/07 - For 12 Weeks, The City Is Different.flac	-7.760002	0.966553
what.cd/Sonic Boom Six - 2008 - Play On - Rare, Rejected & Arcade Perfected [FLAC]	Disc 01 (Arcade Perfected)/08 - Tell Me Something I Dub Know.flac	-8.580002	0.966553
what.cd/Sonic Boom Six - 2008 - Play On - Rare, Rejected & Arcade Perfected [FLAC]	Disc 01 (Arcade Perfected)/09 - Flowered.flac	-8.820000	1.000000
what.cd/Sonic Boom Six - 2008 - Play On - Rare, Rejected & Arcade Perfected [FLAC]	Disc 01 (Arcade Perfected)/10 - The Strange Mix Of Sid The Strangler.flac	-10.040001	0.966553
what.cd/Sonic Boom Six - 2008 - Play On - Rare, Rejected & Arcade Perfected [FLAC]	Disc 01 (Arcade Perfected)/11 - For 12 Weeks, The City Is Sleeping.flac	-9.260002	1.000000
what.cd/Sonic Boom Six - 2008 - Play On - Rare, Rejected & Arcade Perfected [FLAC]	Disc 01 (Arcade Perfected)/12 - September To Maybe.flac	-9.849998	1.000000
what.cd/Sonic Boom Six - 2008 - Play On - Rare, Rejected & Arcade Perfected [FLAC]	Disc 02 (Rare & Rejected)/01 - Play On.flac	-11.349998	0.988678
what.cd/Sonic Boom Six - 2008 - Play On - Rare, Rejected & Arcade Perfected [FLAC]	Disc 02 (Rare & Rejected)/02 - Marching Round In Circles.flac	-10.739998	0.988647
what.cd/Sonic Boom Six - 2008 - Play On - Rare, Rejected & Arcade Perfected [FLAC]	Disc 02 (Rare & Rejected)/03 - We Wanna War.flac	-10.180000	0.988647
what.cd/Sonic Boom Six - 2008 - Play On - Rare, Rejected & Arcade Perfected [FLAC]	Disc 02 (Rare & Rejected)/04 - Devil Made Me Do It.flac	-11.620003	0.988647
what.cd/Sonic Boom Six - 2008 - Play On - Rare, Rejected & Arcade Perfected [FLAC]	Disc 02 (Rare & Rejected)/05 - Boy Meets Girl.flac	-10.459999	0.988647
what.cd/Sonic Boom Six - 2008 - Play On - Rare, Rejected & Arcade Perfected [FLAC]	Disc 02 (Rare & Rejected)/06 - Setting Sun.flac	-8.419998	0.988647
what.cd/Sonic Boom Six - 2008 - Play On - Rare, Rejected & Arcade Perfected [FLAC]	Disc 02 (Rare & Rejected)/07 - Found It, Burned It, Fucked Off.flac	-10.809998	0.988647
what.cd/Sonic Boom Six - 2008 - Play On - Rare, Rejected & Arcade Perfected [FLAC]	Disc 02 (Rare & Rejected)/08 - Cuckold.flac	-12.309998	0.988647
what.cd/Sonic Boom Six - 2008 - Play On - Rare, Rejected & Arcade Perfected [FLAC]	Disc 02 (Rare & Rejected)/09 - 3 Minute Hero.flac	-10.419998	0.988647
what.cd/Sonic Boom Six - 2008 - Play On - Rare, Rejected & Arcade Perfected [FLAC]	Disc 02 (Rare & Rejected)/10 - Sticks & Stones.flac	-7.160004	0.988647
what.cd/Sonic Boom Six - 2008 - Play On - Rare, Rejected & Arcade Perfected [FLAC]	Disc 02 (Rare & Rejected)/11 - The World's A Twisted Place, But It Won't Twist Me.flac	-9.769997	0.988647
what.cd/Sonic Boom Six - 2008 - Play On - Rare, Rejected & Arcade Perfected [FLAC]	Disc 02 (Rare & Rejected)/12 - Face Forward.flac	-7.459999	0.988647
what.cd/Sonic Boom Six - 2009 - City Of Thieves FLAC	01 - Welcome To The City Of Thieves.flac	-11.150002	0.988617
what.cd/Sonic Boom Six - 2009 - City Of Thieves FLAC	02 - Back 2 Skool.flac	-11.709999	0.988617
what.cd/Sonic Boom Six - 2009 - City Of Thieves FLAC	03 - The Road To Hell Is Paved With Good Inventions.flac	-11.849998	0.988617
what.cd/Sonic Boom Six - 2009 - City Of Thieves FLAC	04 - Bang. Bang. Bang. Bang!.flac	-10.169998	0.999969
what.cd/Sonic Boom Six - 2009 - City Of Thieves FLAC	05 - A Bright Cold Day In April.flac	-11.629997	0.989288
what.cd/Sonic Boom Six - 2009 - City Of Thieves FLAC	06 - Rum Little Skallywag.flac	-8.570000	0.989624
what.cd/Sonic Boom Six - 2009 - City Of Thieves FLAC	07 - The Concrete We're Trapped Within (It's Yours).flac	-12.669998	0.988617
what.cd/Sonic Boom Six - 2009 - City Of Thieves FLAC	08 - Strange Transformations.flac	-10.840004	0.988617
what.cd/Sonic Boom Six - 2009 - City Of Thieves FLAC	09 - Through The Eyes Of A Child.flac	-10.080002	0.999420
what.cd/Sonic Boom Six - 2009 - City Of Thieves FLAC	10 - Polished Chrome And Open Kitchens.flac	-11.949997	0.988617
what.cd/Sonic Boom Six - 2009 - City Of Thieves FLAC	11 - Jericho.flac	-12.129997	0.988617
what.cd/Sonic Boom Six - 2009 - City Of Thieves FLAC	12 - Floating Away.flac	-11.389999	0.988617
what.cd/Sonic Boom Six - 2011 - New Style Rocka [FLAC]	01 - New Style Rocka (feat Tonn Piper).flac	-10.750000	0.977203
what.cd/Sonic Boom Six - 2011 - New Style Rocka [FLAC]	02 - What Doesn't Kill You Make You Stronger.flac	-8.730003	0.977203
what.cd/Sonic Boom Six - 2011 - New Style Rocka [FLAC]	03 - New Style Rocka (Frisk Remix).flac	-8.470001	0.977203
what.cd/Sonic Boom Six - 2012 - Sonic Boom Six[FLAC]	01 - Sonic Boom Six - For The Kids Of The Multiculture.flac	-11.599998	0.987244
what.cd/Sonic Boom Six - 2012 - Sonic Boom Six[FLAC]	02 - Sonic Boom Six - Virus.flac	-8.889999	0.925781
what.cd/Sonic Boom Six - 2012 - Sonic Boom Six[FLAC]	03 - Sonic Boom Six - Karma Is A Bitch.flac	-11.980003	0.998199
what.cd/Sonic Boom Six - 2012 - Sonic Boom Six[FLAC]	04 - Sonic Boom Six - S.O.S. (State Of Shock).flac	-11.400002	0.989075
what.cd/Sonic Boom Six - 2012 - Sonic Boom Six[FLAC]	05 - Sonic Boom Six - Gary Got A Gun.flac	-10.790001	0.998199
what.cd/Sonic Boom Six - 2012 - Sonic Boom Six[FLAC]	06 - Sonic Boom Six - The High Cost Of Living.flac	-9.330002	0.998199
what.cd/Sonic Boom Six - 2012 - Sonic Boom Six[FLAC]	07 - Sonic Boom Six - Who Will Survive (And What Will Be Left Of Them).flac	-11.669998	0.998199
what.cd/Sonic Boom Six - 2012 - Sonic Boom Six[FLAC]	08 - Sonic Boom Six - Keep On Believing.flac	-11.349998	0.996368
what.cd/Sonic Boom Six - 2012 - Sonic Boom Six[FLAC]	09 - Sonic Boom Six - Flatline.flac	-11.029999	0.998199
what.cd/Sonic Boom Six - 2012 - Sonic Boom Six[FLAC]	10 - Sonic Boom Six - Karma Is A Lady.flac	-10.440002	0.996368
what.cd/Sonic Youth - Goo (MFSL) [FLAC]	01 - Dirty Boots.flac	-3.250000	0.961182
what.cd/Sonic Youth - Goo (MFSL) [FLAC]	02 - Tunic (Song For Karen).flac	-3.230003	0.882690
what.cd/Sonic Youth - Goo (MFSL) [FLAC]	03 - Mary-Christ.flac	-4.309998	0.975891
what.cd/Sonic Youth - Goo (MFSL) [FLAC]	04 - Kool Thing.flac	-3.239998	0.989960
what.cd/Sonic Youth - Goo (MFSL) [FLAC]	05 - Mote.flac	-3.470001	0.985992
what.cd/Sonic Youth - Goo (MFSL) [FLAC]	06 - My Friend Goo.flac	-5.160004	0.948517
what.cd/Sonic Youth - Goo (MFSL) [FLAC]	07 - Disappearer.flac	-4.750000	0.940308
what.cd/Sonic Youth - Goo (MFSL) [FLAC]	08 - Mildred Pierce.flac	-6.019997	0.977753
what.cd/Sonic Youth - Goo (MFSL) [FLAC]	09 - Cinderella's Big Score.flac	-3.900002	0.915009
what.cd/Sonic Youth - Goo (MFSL) [FLAC]	10 - Scooter + Jinx.flac	-3.910004	0.808990
what.cd/Sonic Youth - Goo (MFSL) [FLAC]	11 - Titanium Exposé.flac	-3.550003	1.000000
what.cd/Soulfly - Primitive (Limited Edition) (Lossless)	01 - Back To The Primitive.flac	-9.360001	0.999969
what.cd/Soulfly - Primitive (Limited Edition) (Lossless)	02 - Pain.flac	-10.110001	1.000000
what.cd/Soulfly - Primitive (Limited Edition) (Lossless)	03 - Bring It.flac	-9.500000	0.999969
what.cd/Soulfly - Primitive (Limited Edition) (Lossless)	04 - Jumpdafuckup.flac	-10.090004	1.000000
what.cd/Soulfly - Primitive (Limited Edition) (Lossless)	05 - Mulambo.flac	-9.919998	0.999969
what.cd/Soulfly - Primitive (Limited Edition) (Lossless)	06 - Son Song.flac	-9.199997	1.000000
what.cd/Soulfly - Primitive (Limited Edition) (Lossless)	07 - Boom.flac	-9.209999	0.998932
what.cd/Soulfly - Primitive (Limited Edition) (Lossless)	08 - Terrorist.flac	-10.550003	1.000000
what.cd/Soulfly - Primitive (Limited Edition) (Lossless)	09 - The Prophet.flac	-9.519997	0.999969
what.cd/Soulfly - Primitive (Limited Edition) (Lossless)	10 - Soulfly II.flac	-4.769997	0.944031
what.cd/Soulfly - Primitive (Limited Edition) (Lossless)	11 - In Memory Of.....flac	-9.590004	0.999969
what.cd/Soulfly - Primitive (Limited Edition) (Lossless)	12 - Flyhigh.flac	-10.279999	1.000000
what.cd/Soulfly - Primitive (Limited Edition) (Lossless)	13 - Eye For An Eye (Live).flac	-9.900002	1.000000
what.cd/Soulfly - Primitive (Limited Edition) (Lossless)	14 - Tribe (Live).flac	-10.349998	0.999969
what.cd/Soulfly - Primitive (Limited Edition) (Lossless)	15 - Soulfire.flac	-10.090004	0.999969
what.cd/Soulfly - Primitive (Limited Edition) (Lossless)	16 - Soulfly (Universal Spirit Mix).flac	-7.639999	0.999969
what.cd/Star Fucking Hipsters - Until We're Dead (2008) [FLAC]	01 Introducción a los Hipsters.flac	-4.669998	0.793610
what.cd/Star Fucking Hipsters - Until We're Dead (2008) [FLAC]	02 Until We're Dead.flac	-9.400002	0.988953
what.cd/Star Fucking Hipsters - Until We're Dead (2008) [FLAC]	03 Immigrants & Hypocrites.flac	-10.010002	0.977173
what.cd/Star Fucking Hipsters - Until We're Dead (2008) [FLAC]	04 Two Cups of Tea.flac	-7.349998	0.907776
what.cd/Star Fucking Hipsters - Until We're Dead (2008) [FLAC]	05 Empty Lives.flac	-8.540001	0.922638
what.cd/Star Fucking Hipsters - Until We're Dead (2008) [FLAC]	06 Snitch To The Suture.flac	-8.510002	0.938232
what.cd/Star Fucking Hipsters - Until We're Dead (2008) [FLAC]	07 Only Sleep.flac	-8.309998	0.931946
what.cd/Star Fucking Hipsters - Until We're Dead (2008) [FLAC]	08 9／11 Was (An Inside Joke).flac	-8.580002	0.941376
what.cd/Star Fucking Hipsters - Until We're Dead (2008) [FLAC]	09 The Path is Paved.flac	-8.500000	0.933105
what.cd/Star Fucking Hipsters - Until We're Dead (2008) [FLAC]	10 Zombie Christ.flac	-9.190002	0.880341
what.cd/Star Fucking Hipsters - Until We're Dead (2008) [FLAC]	11 This Wal-Mart Life.flac	-8.330002	0.922333
what.cd/Star Fucking Hipsters - Until We're Dead (2008) [FLAC]	12 Broken.flac	-8.610001	0.932861
what.cd/Star Fucking Hipsters - Until We're Dead (2008) [FLAC]	13 Death or Fight.flac	-8.779999	0.922394
what.cd/Static-X - Wisconsin Death Trip [FLAC]	Static-X - 01 - Push It.flac	-9.489998	0.977234
what.cd/Static-X - Wisconsin Death Trip [FLAC]	Static-X - 02 - I'm With Stupid.flac	-8.800003	0.977234
what.cd/Static-X - Wisconsin Death Trip [FLAC]	Static-X - 03 - Bled For Days.flac	-8.980003	0.984375
what.cd/Static-X - Wisconsin Death Trip [FLAC]	Static-X - 04 - Love Dump.flac	-8.050003	0.977234
what.cd/Static-X - Wisconsin Death Trip [FLAC]	Static-X - 05 - I Am.flac	-8.139999	0.977356
what.cd/Static-X - Wisconsin Death Trip [FLAC]	Static-X - 06 - Otsegolation.flac	-9.110001	0.977570
what.cd/Static-X - Wisconsin Death Trip [FLAC]	Static-X - 07 - Stem.flac	-9.260002	0.977234
what.cd/Static-X - Wisconsin Death Trip [FLAC]	Static-X - 08 - Sweat Of The Bud.flac	-7.410004	0.977234
what.cd/Static-X - Wisconsin Death Trip [FLAC]	Static-X - 09 - Fix.flac	-9.269997	0.977234
what.cd/Static-X - Wisconsin Death Trip [FLAC]	Static-X - 10 - Wisconsin Death Trip.flac	-9.120003	0.999969
what.cd/Static-X - Wisconsin Death Trip [FLAC]	Static-X - 11 - The Trance Is The Motion.flac	-7.870003	0.977234
what.cd/Static-X - Wisconsin Death Trip [FLAC]	Static-X - 12 - December.flac	-8.080002	0.967468
what.cd/Streetlight Manifesto - 2003 - Everything Goes Numb	01_-_Everything_Went_Numb.flac	-8.580002	0.920929
what.cd/Streetlight Manifesto - 2003 - Everything Goes Numb	02_-_That'll_Be_The_Day.flac	-8.629997	0.920929
what.cd/Streetlight Manifesto - 2003 - Everything Goes Numb	03_-_Point_-_Counterpoint.flac	-8.940002	0.920929
what.cd/Streetlight Manifesto - 2003 - Everything Goes Numb	04_-_If_And_When_We_Rise_Again.flac	-8.300003	0.920929
what.cd/Streetlight Manifesto - 2003 - Everything Goes Numb	05_-_A_Better_Place,_A_Better_Time.flac	-9.269997	0.920929
what.cd/Streetlight Manifesto - 2003 - Everything Goes Numb	06_-_We_Are_The_Few.flac	-8.029999	0.920929
what.cd/Streetlight Manifesto - 2003 - Everything Goes Numb	07_-_Failing,_Flailing.flac	-8.519997	0.920929
what.cd/Streetlight Manifesto - 2003 - Everything Goes Numb	08_-_Here's_To_Life.flac	-8.370003	0.920929
what.cd/Streetlight Manifesto - 2003 - Everything Goes Numb	09_-_A_Moment_Of_Silence.flac	-8.019997	0.920929
what.cd/Streetlight Manifesto - 2003 - Everything Goes Numb	10_-_A_Moment_Of_Violence.flac	-7.650002	0.920929
what.cd/Streetlight Manifesto - 2003 - Everything Goes Numb	11_-_The_Saddest_Song.flac	-8.489998	0.920929
what.cd/Streetlight Manifesto - 2003 - Everything Goes Numb	12_-_The_Big_Sleep.flac	-7.430000	0.920898
what.cd/Streetlight Manifesto - Somewhere In The Between (FLAC) [what.cd]	01 Streetlight Manifesto - We Will Fall Together.flac	-9.970001	0.991455
what.cd/Streetlight Manifesto - Somewhere In The Between (FLAC) [what.cd]	02 Streetlight Manifesto - Down, Down, Down to Mephisto's Cafe.flac	-10.050003	0.991394
what.cd/Streetlight Manifesto - Somewhere In The Between (FLAC) [what.cd]	03 Streetlight Manifesto - Would You Be Impressed.flac	-10.320000	0.991425
what.cd/Streetlight Manifesto - Somewhere In The Between (FLAC) [what.cd]	04 Streetlight Manifesto - One Foot on the Gas, One Foot in the Grave.flac	-9.870003	0.991425
what.cd/Streetlight Manifesto - Somewhere In The Between (FLAC) [what.cd]	05 Streetlight Manifesto - Watch It Crash.flac	-10.169998	0.991425
what.cd/Streetlight Manifesto - Somewhere In The Between (FLAC) [what.cd]	06 Streetlight Manifesto - Somewhere in the Between.flac	-11.040001	0.991394
what.cd/Streetlight Manifesto - Somewhere In The Between (FLAC) [what.cd]	07 Streetlight Manifesto - Forty Days.flac	-10.720001	0.991425
what.cd/Streetlight Manifesto - Somewhere In The Between (FLAC) [what.cd]	08 Streetlight Manifesto - The Blonde Lead the Blind.flac	-10.629997	0.991486
what.cd/Streetlight Manifesto - Somewhere In The Between (FLAC) [what.cd]	09 Streetlight Manifesto - The Receiving End of It All.flac	-11.040001	0.991425
what.cd/Streetlight Manifesto - Somewhere In The Between (FLAC) [what.cd]	10 Streetlight Manifesto - What a Wicked Gang Are We.flac	-10.730003	0.991425
what.cd/Streetlight Manifesto - The Hands That Thieve (2013) [FLAC]	01 The Three of US.flac	-10.209999	0.991333
what.cd/Streetlight Manifesto - The Hands That Thieve (2013) [FLAC]	02 Ungrateful.flac	-10.070000	0.991302
what.cd/Streetlight Manifesto - The Hands That Thieve (2013) [FLAC]	03 The Littlest Things.flac	-9.349998	0.991272
what.cd/Streetlight Manifesto - The Hands That Thieve (2013) [FLAC]	04 The Hands That Thieve.flac	-10.010002	0.991333
what.cd/Streetlight Manifesto - The Hands That Thieve (2013) [FLAC]	05 With Any Sort of Certainity.flac	-9.739998	0.991241
what.cd/Streetlight Manifesto - The Hands That Thieve (2013) [FLAC]	06 If Only For Memories.flac	-9.150002	0.991333
what.cd/Streetlight Manifesto - The Hands That Thieve (2013) [FLAC]	07 They Broke Him Down.flac	-10.080002	0.991272
what.cd/Streetlight Manifesto - The Hands That Thieve (2013) [FLAC]	08 Toe to Toe.flac	-9.290001	0.991272
what.cd/Streetlight Manifesto - The Hands That Thieve (2013) [FLAC]	09 Oh Me, Oh My.flac	-9.690002	0.991333
what.cd/Streetlight Manifesto - The Hands That Thieve (2013) [FLAC]	10 Your Day Will Come.flac	-10.050003	0.991364
what.cd/Strung Out - 1998 - Twisted By Design	01 - Too Close To See.flac	-6.040001	0.989655
what.cd/Strung Out - 1998 - Twisted By Design	02 - Exhumation Of Virginia Madison.flac	-6.410004	1.000000
what.cd/Strung Out - 1998 - Twisted By Design	03 - Deville.flac	-6.379997	0.993622
what.cd/Strung Out - 1998 - Twisted By Design	04 - Mind Of My Own.flac	-6.590004	1.000000
what.cd/Strung Out - 1998 - Twisted By Design	05 - Reason To Believe.flac	-6.230003	0.996124
what.cd/Strung Out - 1998 - Twisted By Design	06 - Crossroads.flac	-6.379997	0.981018
what.cd/Strung Out - 1998 - Twisted By Design	07 - Paperwalls.flac	-6.559998	0.897888
what.cd/Strung Out - 1998 - Twisted By Design	08 - Ice Burn.flac	-6.870003	0.990875
what.cd/Strung Out - 1998 - Twisted By Design	09 - Ultimate Devotion.flac	-6.459999	0.937042
what.cd/Strung Out - 1998 - Twisted By Design	10 - King Alvarez.flac	-6.760002	0.959229
what.cd/Strung Out - 1998 - Twisted By Design	11 - Asking For The World.flac	-6.080002	1.000000
what.cd/Strung Out - 1998 - Twisted By Design	12 - Tattoo.flac	-7.050003	0.986633
what.cd/Strung Out - 1998 - Twisted By Design	13 - Just Like Me.flac	-6.330002	1.000000
what.cd/Strung Out - 1998 - Twisted By Design	14 - Match Book.flac	-6.769997	1.000000
what.cd/Strung Out - Exile in Oblivion - 2004 (CD - FLAC - Lossless)	01 Strung Out - Analog.flac	-9.959999	0.944061
what.cd/Strung Out - Exile in Oblivion - 2004 (CD - FLAC - Lossless)	02 Strung Out - Blueprint of the Fall.flac	-9.620003	1.000000
what.cd/Strung Out - Exile in Oblivion - 2004 (CD - FLAC - Lossless)	03 Strung Out - Katatonia.flac	-9.919998	1.000000
what.cd/Strung Out - Exile in Oblivion - 2004 (CD - FLAC - Lossless)	04 Strung Out - Her Name In Blood.flac	-11.160004	1.000000
what.cd/Strung Out - Exile in Oblivion - 2004 (CD - FLAC - Lossless)	05 Strung Out - Angeldust.flac	-10.510002	1.000000
what.cd/Strung Out - Exile in Oblivion - 2004 (CD - FLAC - Lossless)	06 Strung Out - Lucifermotorcade.flac	-10.760002	1.000000
what.cd/Strung Out - Exile in Oblivion - 2004 (CD - FLAC - Lossless)	07 Strung Out - Vampires.flac	-10.029999	1.000000
what.cd/Strung Out - Exile in Oblivion - 2004 (CD - FLAC - Lossless)	08 Strung Out - No Voice Of Mine.flac	-9.019997	1.000000
what.cd/Strung Out - Exile in Oblivion - 2004 (CD - FLAC - Lossless)	09 Strung Out - Anna Lee.flac	-9.779999	1.000000
what.cd/Strung Out - Exile in Oblivion - 2004 (CD - FLAC - Lossless)	10 Strung Out - Never Speak Again.flac	-9.570000	1.000000
what.cd/Strung Out - Exile in Oblivion - 2004 (CD - FLAC - Lossless)	11 Strung Out - Skeletondanse.flac	-9.340004	1.000000
what.cd/Strung Out - Exile in Oblivion - 2004 (CD - FLAC - Lossless)	12 Strung Out - Scarlet.flac	-9.889999	1.000000
what.cd/Strung Out - Exile in Oblivion - 2004 (CD - FLAC - Lossless)	13 Strung Out - Swan Dive.flac	-10.000000	1.000000
what.cd/Strung Out - Exile in Oblivion - 2004 (CD - FLAC - Lossless)	14 Strung Out - The Misanthropic Principle.flac	-10.120003	1.000000
what.cd/Sublime - 1992 - 40 oz. to Freedom [FLAC]	01 - Waiting For My Ruca.flac	-3.070000	0.987762
what.cd/Sublime - 1992 - 40 oz. to Freedom [FLAC]	02 - 40 oz. To Freedom.flac	-6.910004	1.000000
what.cd/Sublime - 1992 - 40 oz. to Freedom [FLAC]	03 - Smoke Two Joints.flac	-6.639999	1.000000
what.cd/Sublime - 1992 - 40 oz. to Freedom [FLAC]	04 - We're Only Gonna Die For Our Arrogance.flac	-9.680000	1.000000
what.cd/Sublime - 1992 - 40 oz. to Freedom [FLAC]	05 - Don't Push.flac	-6.269997	1.000000
what.cd/Sublime - 1992 - 40 oz. to Freedom [FLAC]	06 - 5446 That's My Number , Ball And Chain.flac	-7.840004	1.000000
what.cd/Sublime - 1992 - 40 oz. to Freedom [FLAC]	07 - Badfish.flac	-7.580002	1.000000
what.cd/Sublime - 1992 - 40 oz. to Freedom [FLAC]	08 - Let's Go Get Stoned.flac	-7.160004	1.000000
what.cd/Sublime - 1992 - 40 oz. to Freedom [FLAC]	09 - New Thrash.flac	-8.559998	0.999969
what.cd/Sublime - 1992 - 40 oz. to Freedom [FLAC]	10 - Scarlet Begonias.flac	-5.440002	0.981598
what.cd/Sublime - 1992 - 40 oz. to Freedom [FLAC]	11 - Live At E's.flac	-7.050003	1.000000
what.cd/Sublime - 1992 - 40 oz. to Freedom [FLAC]	12 - D.J.s.flac	-5.320000	1.000000
what.cd/Sublime - 1992 - 40 oz. to Freedom [FLAC]	13 - Chica Me Tipo.flac	-7.919998	1.000000
what.cd/Sublime - 1992 - 40 oz. to Freedom [FLAC]	14 - Right Back.flac	-8.199997	1.000000
what.cd/Sublime - 1992 - 40 oz. to Freedom [FLAC]	15 - What Happened.flac	-6.160004	1.000000
what.cd/Sublime - 1992 - 40 oz. to Freedom [FLAC]	16 - New Song.flac	-6.250000	1.000000
what.cd/Sublime - 1992 - 40 oz. to Freedom [FLAC]	17 - Ebin.flac	-6.389999	0.999969
what.cd/Sublime - 1992 - 40 oz. to Freedom [FLAC]	18 - Date Rape.flac	-6.510002	1.000000
what.cd/Sublime - 1992 - 40 oz. to Freedom [FLAC]	19 - Hope.flac	-8.110001	1.000000
what.cd/Sublime - 1992 - 40 oz. to Freedom [FLAC]	20 - Krs-One.flac	-6.090004	1.000000
what.cd/Sublime - 1992 - 40 oz. to Freedom [FLAC]	21 - Rivers Of Babylon.flac	-8.090004	1.000000
what.cd/Sublime - 1992 - 40 oz. to Freedom [FLAC]	22 - Thanks.flac	-5.860001	1.000000
what.cd/Sublime - 1994 - Robbin' The Hood	01 - Waiting For Bud .flac	-5.779999	0.976074
what.cd/Sublime - 1994 - Robbin' The Hood	02 - Steady B Loop Dub .flac	-5.650002	0.981323
what.cd/Sublime - 1994 - Robbin' The Hood	03 - Raleigh Soliloquy Pt. I .flac	-3.720001	0.712708
what.cd/Sublime - 1994 - Robbin' The Hood	04 - Pool Shark (orig.) .flac	-7.510002	0.988464
what.cd/Sublime - 1994 - Robbin' The Hood	05 - Steppin' Razor .flac	-2.940002	0.968842
what.cd/Sublime - 1994 - Robbin' The Hood	06 - Greatest Hits .flac	-5.660004	0.998718
what.cd/Sublime - 1994 - Robbin' The Hood	07 - Free Loop Dub .flac	-7.330002	1.000000
what.cd/Sublime - 1994 - Robbin' The Hood	08 - Q-ball .flac	-4.940002	0.977356
what.cd/Sublime - 1994 - Robbin' The Hood	09 - Saw Red .flac	-6.320000	0.998688
what.cd/Sublime - 1994 - Robbin' The Hood	10 - Work That We Do .flac	-6.940002	0.974213
what.cd/Sublime - 1994 - Robbin' The Hood	11 - Lincoln Highway Dub .flac	-5.180000	0.986664
what.cd/Sublime - 1994 - Robbin' The Hood	12 - Pool Shark (Acoustic) .flac	-4.590004	0.965302
what.cd/Sublime - 1994 - Robbin' The Hood	13 - Cisco Kid .flac	-6.840004	0.988556
what.cd/Sublime - 1994 - Robbin' The Hood	14 - Raleigh Soliloquy Pt. II .flac	-2.949997	0.899811
what.cd/Sublime - 1994 - Robbin' The Hood	15 - S.T.P. .flac	-5.529999	0.997192
what.cd/Sublime - 1994 - Robbin' The Hood	16 - Boss D.J. .flac	-5.849998	0.974915
what.cd/Sublime - 1994 - Robbin' The Hood	17 - I Don't Care Too Much For Reggae Dub .flac	-3.660004	0.888214
what.cd/Sublime - 1994 - Robbin' The Hood	18 - Falling Idols .flac	-6.919998	1.000000
what.cd/Sublime - 1994 - Robbin' The Hood	19 - All You Need .flac	-7.230003	1.000000
what.cd/Sublime - 1994 - Robbin' The Hood	20 - Freeway Time In L.A. County Jail .flac	-2.540001	0.982666
what.cd/Sublime - 1994 - Robbin' The Hood	21 - Mary .flac	-5.739998	0.990692
what.cd/Sublime - 1994 - Robbin' The Hood	22 - Raleigh Soliloquy Pt. III .flac	-3.500000	0.987671
what.cd/Sublime - Sublime	01 - Sublime - Garden Grove.flac	-5.620003	1.000000
what.cd/Sublime - Sublime	02 - Sublime - What I Got.flac	-6.709999	1.000000
what.cd/Sublime - Sublime	03 - Sublime - Wrong Way.flac	-7.449997	1.000000
what.cd/Sublime - Sublime	04 - Sublime - Same In The End.flac	-8.980003	1.000000
what.cd/Sublime - Sublime	05 - Sublime - April 29, 1992 (Miami).flac	-7.809998	1.000000
what.cd/Sublime - Sublime	06 - Sublime - Santeria.flac	-7.800003	1.000000
what.cd/Sublime - Sublime	07 - Sublime - Seed.flac	-9.190002	1.000000
what.cd/Sublime - Sublime	08 - Sublime - Jailhouse.flac	-6.910004	1.000000
what.cd/Sublime - Sublime	09 - Sublime - Pawn Shop.flac	-6.639999	1.000000
what.cd/Sublime - Sublime	10 - Sublime - Paddle Out.flac	-9.260002	1.000000
what.cd/Sublime - Sublime	11 - Sublime - The Ballad of Johnny Butt.flac	-6.340004	1.000000
what.cd/Sublime - Sublime	12 - Sublime - Burritos.flac	-7.660004	1.000000
what.cd/Sublime - Sublime	13 - Sublime - Under My Voodoo.flac	-9.309998	1.000000
what.cd/Sublime - Sublime	14 - Sublime - Get Ready.flac	-7.330002	1.000000
what.cd/Sublime - Sublime	15 - Sublime - Caress Me Down.flac	-7.940002	1.000000
what.cd/Sublime - Sublime	16 - Sublime - What I Got (reprise).flac	-7.510002	1.000000
what.cd/Sublime - Sublime	17 - Sublime - Doin' Time.flac	-8.430000	1.000000
what.cd/Sublime With Rome - Yours Truly (2011) [FLAC]	01 - Panic.flac	-9.559998	0.988647
what.cd/Sublime With Rome - Yours Truly (2011) [FLAC]	02 - Only.flac	-7.139999	0.988586
what.cd/Sublime With Rome - Yours Truly (2011) [FLAC]	03 - Lovers Rock.flac	-6.809998	0.988586
what.cd/Sublime With Rome - Yours Truly (2011) [FLAC]	04 - Murdera.flac	-8.300003	0.988586
what.cd/Sublime With Rome - Yours Truly (2011) [FLAC]	05 - My World.flac	-10.489998	0.988586
what.cd/Sublime With Rome - Yours Truly (2011) [FLAC]	06 - Paper Cuts.flac	-8.739998	0.988586
what.cd/Sublime With Rome - Yours Truly (2011) [FLAC]	07 - PCH.flac	-8.019997	0.988586
what.cd/Sublime With Rome - Yours Truly (2011) [FLAC]	08 - Same Old Situation.flac	-8.050003	0.988586
what.cd/Sublime With Rome - Yours Truly (2011) [FLAC]	09 - Take It Or Leave It.flac	-7.800003	0.988586
what.cd/Sublime With Rome - Yours Truly (2011) [FLAC]	10 - You Better Listen.flac	-7.639999	0.988586
what.cd/Sublime With Rome - Yours Truly (2011) [FLAC]	11 - Spun.flac	-9.220001	0.988586
what.cd/Sublime With Rome - Yours Truly (2011) [FLAC]	12 - Can You Feel It (Featuring Wiz Khalifa).flac	-9.590004	0.988586
what.cd/Suicide Machines - Destruction By Definition	01 - New Girl.flac	-10.199997	1.000000
what.cd/Suicide Machines - Destruction By Definition	02 - SOS.flac	-10.190002	1.000000
what.cd/Suicide Machines - Destruction By Definition	03 - Break The Glass.flac	-11.000000	1.000000
what.cd/Suicide Machines - Destruction By Definition	04 - No Face.flac	-8.669998	1.000000
what.cd/Suicide Machines - Destruction By Definition	05 - Hey.flac	-10.029999	1.000000
what.cd/Suicide Machines - Destruction By Definition	06 - Our Time.flac	-10.910004	1.000000
what.cd/Suicide Machines - Destruction By Definition	07 - Too Much.flac	-10.699997	1.000000
what.cd/Suicide Machines - Destruction By Definition	08 - Islands.flac	-10.790001	1.000000
what.cd/Suicide Machines - Destruction By Definition	09 - The Real You.flac	-11.120003	1.000000
what.cd/Suicide Machines - Destruction By Definition	10 - Face Values.flac	-10.590004	1.000000
what.cd/Suicide Machines - Destruction By Definition	11 - Punk Out.flac	-10.930000	1.000000
what.cd/Suicide Machines - Destruction By Definition	12 - Vans Song.flac	-9.500000	1.000000
what.cd/Suicide Machines - Destruction By Definition	13 - Insecurities.flac	-10.250000	1.000000
what.cd/Suicide Machines - Destruction By Definition	14 - Inside,Outside.flac	-10.779999	1.000000
what.cd/Suicide Machines - Destruction By Definition	15 - Zero.flac	-10.320000	1.000000
what.cd/Suicide Machines - Destruction By Definition	16 - So Long.flac	-10.370003	1.000000
what.cd/Tegan & Sara - So Jealous	01 - Tegan & Sara - You Wouldn't Like Me.flac	-9.919998	0.901398
what.cd/Tegan & Sara - So Jealous	02 - Tegan & Sara - Take Me Anywhere.flac	-10.519997	0.901398
what.cd/Tegan & Sara - So Jealous	03 - Tegan & Sara - I Bet It Stung.flac	-10.720001	0.901398
what.cd/Tegan & Sara - So Jealous	04 - Tegan & Sara - I Know I Know I Know.flac	-8.400002	0.901428
what.cd/Tegan & Sara - So Jealous	05 - Tegan & Sara - Where Does The Good Go.flac	-8.180000	0.901428
what.cd/Tegan & Sara - So Jealous	06 - Tegan & Sara - Downtown.flac	-8.870003	0.901398
what.cd/Tegan & Sara - So Jealous	07 - Tegan & Sara - I Won't Be Left.flac	-8.709999	0.901428
what.cd/Tegan & Sara - So Jealous	08 - Tegan & Sara - Walking With A Ghost.flac	-8.690002	0.901398
what.cd/Tegan & Sara - So Jealous	09 - Tegan & Sara - So Jealous.flac	-8.919998	0.901398
what.cd/Tegan & Sara - So Jealous	10 - Tegan & Sara - Speak Slow.flac	-9.080002	0.901398
what.cd/Tegan & Sara - So Jealous	11 - Tegan & Sara - Wake Up Exhausted.flac	-7.599998	0.901398
what.cd/Tegan & Sara - So Jealous	12 - Tegan & Sara - We Didn't Do It.flac	-8.330002	0.901398
what.cd/Tegan & Sara - So Jealous	13 - Tegan & Sara - Fix You Up.flac	-8.570000	0.901398
what.cd/Tegan & Sara - So Jealous	14 - Tegan & Sara - I Can't Take It.flac	-7.290001	0.901398
what.cd/Tequilajazzz - Целлулоид (2009) [FLAC]	01 - В ожидании праздника.flac	-5.090004	0.881012
what.cd/Tequilajazzz - Целлулоид (2009) [FLAC]	02 - Кроме звезд.flac	-8.959999	0.988892
what.cd/Tequilajazzz - Целлулоид (2009) [FLAC]	03 - Авиация и артиллерия.flac	-7.870003	0.988770
what.cd/Tequilajazzz - Целлулоид (2009) [FLAC]	04 - Зимнее Солнце.flac	-7.830002	0.988861
what.cd/Tequilajazzz - Целлулоид (2009) [FLAC]	05 - Тишина и волшебство.flac	-8.150002	0.988831
what.cd/Tequilajazzz - Целлулоид (2009) [FLAC]	06 - Небо с молоком (Испания).flac	-7.870003	0.988831
what.cd/Tequilajazzz - Целлулоид (2009) [FLAC]	07 - Ветры лестниц.flac	-8.730003	0.988861
what.cd/Tequilajazzz - Целлулоид (2009) [FLAC]	08 - Легенда.flac	-8.279999	0.988831
what.cd/Tequilajazzz - Целлулоид (2009) [FLAC]	09 - Ночью в эфире.flac	-8.190002	0.988800
what.cd/Tequilajazzz - Целлулоид (2009) [FLAC]	10 - Лень.flac	-8.090004	0.988922
what.cd/Tequilajazzz - Целлулоид (2009) [FLAC]	11 - Улитка.flac	-8.349998	0.988861
what.cd/Tequilajazzz - Целлулоид (2009) [FLAC]	12 - Наливайя.flac	-8.760002	0.988831
what.cd/Tequilajazzz - Целлулоид (2009) [FLAC]	13 - Тема прошлого лета.flac	-7.840004	0.988831
what.cd/Tequilajazzz - Целлулоид (2009) [FLAC]	14 - Тема прошлого лета (Sinner And Saint Eclectica Mix).flac	-5.660004	0.988586
what.cd/Tequilajazzz - Целлулоид (2009) [FLAC]	15 - Тема прошлого лета (Wonderful Camouflage Eclectica Mix).flac	-6.639999	0.988586
what.cd/Tequilajazzz - Целлулоид (2009) [FLAC]	16 - Зимнее солнце (Tequila Nova Eclectica Mix).flac	-5.709999	0.988586
what.cd/The Artist in the Ambulance	01 - Cold Cash And Colder Hearts.flac	-9.840004	1.000000
what.cd/The Artist in the Ambulance	02 - Under A Killing Moon.flac	-9.889999	1.000000
what.cd/The Artist in the Ambulance	03 - All That's Left.flac	-10.949997	1.000000
what.cd/The Artist in the Ambulance	04 - Silhouette.flac	-10.110001	0.999237
what.cd/The Artist in the Ambulance	05 - Stare At The Sun.flac	-10.199997	0.999908
what.cd/The Artist in the Ambulance	06 - Paper Tigers.flac	-10.330002	1.000000
what.cd/The Artist in the Ambulance	07 - Hoods On Peregrine.flac	-10.099998	1.000000
what.cd/The Artist in the Ambulance	08 - The Melting Point Of Wax.flac	-9.989998	1.000000
what.cd/The Artist in the Ambulance	09 - Blood Clots And Black Holes.flac	-9.940002	1.000000
what.cd/The Artist in the Ambulance	10 - The Artist In The Ambulance.flac	-9.129997	0.999023
what.cd/The Artist in the Ambulance	11 - The Abolition Of Man.flac	-10.470001	1.000000
what.cd/The Artist in the Ambulance	12 - Don't Tell And We Won't Ask.flac	-10.470001	1.000000
what.cd/The Cat Empire (2003)	01-The Cat Empire-How to Explain.flac	-7.580002	0.988617
what.cd/The Cat Empire (2003)	02-The Cat Empire-Days Like These.flac	-7.330002	1.000000
what.cd/The Cat Empire (2003)	03-The Cat Empire-The Lost Song.flac	-5.400002	0.988556
what.cd/The Cat Empire (2003)	04-The Cat Empire-The Chariot.flac	-7.879997	0.988617
what.cd/The Cat Empire (2003)	05-The Cat Empire-Hello.flac	-7.519997	0.988556
what.cd/The Cat Empire (2003)	06-The Cat Empire-One Four Five.flac	-7.669998	0.988556
what.cd/The Cat Empire (2003)	07-The Cat Empire-The Rhythm.flac	-7.910004	0.988556
what.cd/The Cat Empire (2003)	08-The Cat Empire-The Wine Song.flac	-8.120003	0.988556
what.cd/The Cat Empire (2003)	09-The Cat Empire-Nothing.flac	-7.080002	0.988556
what.cd/The Cat Empire (2003)	10-The Cat Empire-Beanni.flac	-7.260002	0.988556
what.cd/The Cat Empire (2003)	11-The Cat Empire-The Crowd.flac	-8.870003	0.988556
what.cd/The Cat Empire (2003)	12-The Cat Empire-Manifesto.flac	-8.519997	0.988617
what.cd/The Cat Empire (2003)	13-The Cat Empire-All That Talking.flac	-6.410004	0.988556
what.cd/The Coral - 2002 - The Coral [FLAC]	01 - Spanish Main.flac	-8.370003	0.997040
what.cd/The Coral - 2002 - The Coral [FLAC]	02 - I Remember When.flac	-6.779999	0.999939
what.cd/The Coral - 2002 - The Coral [FLAC]	03 - Shadows Fall.flac	-6.989998	0.998047
what.cd/The Coral - 2002 - The Coral [FLAC]	04 - Dreaming of You.flac	-7.489998	0.986572
what.cd/The Coral - 2002 - The Coral [FLAC]	05 - Simon Diamond.flac	-7.239998	0.986572
what.cd/The Coral - 2002 - The Coral [FLAC]	06 - Goodbye.flac	-7.980003	0.986603
what.cd/The Coral - 2002 - The Coral [FLAC]	07 - Waiting for the Heartache.flac	-6.120003	0.997131
what.cd/The Coral - 2002 - The Coral [FLAC]	08 - Skeleton Key.flac	-10.400002	0.986542
what.cd/The Coral - 2002 - The Coral [FLAC]	09 - Wildfire.flac	-7.129997	0.986481
what.cd/The Coral - 2002 - The Coral [FLAC]	10 - Bad Man.flac	-8.019997	0.991821
what.cd/The Coral - 2002 - The Coral [FLAC]	11 - Calendars and Clocks.flac	-6.590004	0.998016
what.cd/The Cranberries - Everybody Else Is Doing It, So Why Can't We (514 156-2) [FLAC]	01 - I Still Do.flac	-2.809998	0.999359
what.cd/The Cranberries - Everybody Else Is Doing It, So Why Can't We (514 156-2) [FLAC]	02 - Dreams.flac	-2.139999	0.920868
what.cd/The Cranberries - Everybody Else Is Doing It, So Why Can't We (514 156-2) [FLAC]	03 - Sunday.flac	-2.000000	0.991364
what.cd/The Cranberries - Everybody Else Is Doing It, So Why Can't We (514 156-2) [FLAC]	04 - Pretty.flac	-0.410004	0.954132
what.cd/The Cranberries - Everybody Else Is Doing It, So Why Can't We (514 156-2) [FLAC]	05 - Waltzing Back.flac	-1.419998	0.999359
what.cd/The Cranberries - Everybody Else Is Doing It, So Why Can't We (514 156-2) [FLAC]	06 - Not Sorry.flac	-2.459999	0.953308
what.cd/The Cranberries - Everybody Else Is Doing It, So Why Can't We (514 156-2) [FLAC]	07 - Linger.flac	-1.120003	0.851105
what.cd/The Cranberries - Everybody Else Is Doing It, So Why Can't We (514 156-2) [FLAC]	08 - Wanted.flac	-2.959999	0.975067
what.cd/The Cranberries - Everybody Else Is Doing It, So Why Can't We (514 156-2) [FLAC]	09 - Still Can't....flac	-2.360001	0.861969
what.cd/The Cranberries - Everybody Else Is Doing It, So Why Can't We (514 156-2) [FLAC]	10 - I Will Always.flac	-1.720001	0.961487
what.cd/The Cranberries - Everybody Else Is Doing It, So Why Can't We (514 156-2) [FLAC]	11 - How.flac	-3.010002	0.932495
what.cd/The Cranberries - Everybody Else Is Doing It, So Why Can't We (514 156-2) [FLAC]	12 - Put Me Down.flac	-2.669998	0.959656
what.cd/The Dirty Heads - Any Port in a Storm (2010) - FLAC	01 - Neighborhood.flac	-9.849998	0.999969
what.cd/The Dirty Heads - Any Port in a Storm (2010) - FLAC	02 - Stand Tall.flac	-10.019997	0.999969
what.cd/The Dirty Heads - Any Port in a Storm (2010) - FLAC	03 - Shine.flac	-10.320000	0.999969
what.cd/The Dirty Heads - Any Port in a Storm (2010) - FLAC	04 - Driftin'.flac	-10.040001	0.999969
what.cd/The Dirty Heads - Any Port in a Storm (2010) - FLAC	05 - Taint.flac	-9.720001	0.999969
what.cd/The Dirty Heads - Any Port in a Storm (2010) - FLAC	06 - Morning Light.flac	-9.370003	0.999969
what.cd/The Dirty Heads - Any Port in a Storm (2010) - FLAC	07 - Insomnia.flac	-8.930000	0.999969
what.cd/The Dirty Heads - Any Port in a Storm (2010) - FLAC	08 - Easy.flac	-9.440002	0.999969
what.cd/The Dirty Heads - Any Port in a Storm (2010) - FLAC	09 - Knows That I.flac	-8.330002	0.999969
what.cd/The Dirty Heads - Any Port in a Storm (2010) - FLAC	10 - Chelsea.flac	-9.870003	0.999969
what.cd/The Dirty Heads - Any Port in a Storm (2010) - FLAC	11 - Check the Level.flac	-10.599998	0.999969
what.cd/The Dirty Heads - Any Port in a Storm (2010) - FLAC	12 - Believe.flac	-8.370003	0.999969
what.cd/The Dirty Heads - Any Port in a Storm (2010) - FLAC	13 - Hip Hop Misfits.flac	-9.919998	0.999969
what.cd/The Dirty Heads - Any Port in a Storm (2010) - FLAC	14 - Everything I'm Looking For.flac	-7.470001	0.999969
what.cd/The Dirty Heads - Any Port in a Storm (2010) - FLAC	15 - Stand Tall (acoustic).flac	-9.330002	0.999969
what.cd/The Dirty Heads - Any Port in a Storm (2010) - FLAC	16 - Sails to the Wind.flac	-9.910004	0.999969
what.cd/The Dirty Heads - Any Port in a Storm (2010) - FLAC	17 - Headphones.flac	-8.470001	0.999969
what.cd/The Dirty Heads - Any Port in a Storm (2010) - FLAC	18 - Lonely One.flac	-10.889999	0.999969
what.cd/The Dirty Heads - Any Port in a Storm (2010) - FLAC	19 - Lay Me Down.flac	-8.629997	0.999969
what.cd/The Dirty Heads - Any Port in a Storm (2010) - FLAC	20 - Antelope.flac	-8.519997	0.999969
what.cd/The Dirty Heads - Any Port in a Storm (2010) - FLAC	21 - Rains It Pours.flac	-7.910004	0.999969
what.cd/The Dirty Heads - Any Port in a Storm (2010) - FLAC	22 - I Got No Time.flac	-8.790001	0.999969
what.cd/The Distillers - 2002 - Sing Sing Death House [FLAC]	01 Sick Of It All.flac	-10.610001	0.988831
what.cd/The Distillers - 2002 - Sing Sing Death House [FLAC]	02 I Am A Revenant.flac	-10.590004	0.999969
what.cd/The Distillers - 2002 - Sing Sing Death House [FLAC]	03 Seneca Falls.flac	-10.169998	0.966309
what.cd/The Distillers - 2002 - Sing Sing Death House [FLAC]	04 The Young Crazed Peeling.flac	-10.309998	1.000000
what.cd/The Distillers - 2002 - Sing Sing Death House [FLAC]	05 Sing Sing Death House.flac	-11.360001	0.988831
what.cd/The Distillers - 2002 - Sing Sing Death House [FLAC]	06 Bullet & The Bullseye.flac	-11.269997	0.996246
what.cd/The Distillers - 2002 - Sing Sing Death House [FLAC]	07 City Of Angels.flac	-10.320000	1.000000
what.cd/The Distillers - 2002 - Sing Sing Death House [FLAC]	08 Young Girl.flac	-10.769997	0.988831
what.cd/The Distillers - 2002 - Sing Sing Death House [FLAC]	09 Hate Me.flac	-10.940002	0.988831
what.cd/The Distillers - 2002 - Sing Sing Death House [FLAC]	10 Desperate.flac	-11.470001	0.988831
what.cd/The Distillers - 2002 - Sing Sing Death House [FLAC]	11 I Understand.flac	-10.750000	0.988831
what.cd/The Distillers - 2002 - Sing Sing Death House [FLAC]	12 Lordy Lordy.flac	-10.160004	0.988800
what.cd/The Flaming Tsunamis - 2006 - Fear Everything	01 - The Ritalin Conspiracy.flac	-10.250000	1.000000
what.cd/The Flaming Tsunamis - 2006 - Fear Everything	02 - Bird-Watching and Vice Versa.flac	-9.220001	0.989014
what.cd/The Flaming Tsunamis - 2006 - Fear Everything	03 - Corpse Disposal for Dummies.flac	-9.750000	0.989014
what.cd/The Flaming Tsunamis - 2006 - Fear Everything	04 - Fear Everything.flac	-10.290001	0.989044
what.cd/The Flaming Tsunamis - 2006 - Fear Everything	05 - The Great Red Cross Robbery.flac	-11.309998	1.000000
what.cd/The Flaming Tsunamis - 2006 - Fear Everything	06 - If You Really Love Me..flac	-9.940002	0.989105
what.cd/The Flaming Tsunamis - 2006 - Fear Everything	07 - The First Rule.flac	-9.099998	0.989014
what.cd/The Flaming Tsunamis - 2006 - Fear Everything	08 - Satan vs. The United States of America.flac	-11.410004	1.000000
what.cd/The Flaming Tsunamis - 2006 - Fear Everything	09 - World of Chaos.flac	-10.190002	0.989014
what.cd/The Flaming Tsunamis - 2006 - Fear Everything	10 - Brennett Brauer.flac	-9.370003	0.988892
what.cd/The Flaming Tsunamis - 2006 - Fear Everything	11 - Weaug, Teaug, Peaug (The Powder Of Life).flac	-8.440002	0.989075
what.cd/The Flaming Tsunamis - 2006 - Fear Everything	12 - Shit Piss Die.flac	-9.370003	0.988983
what.cd/The Flatliners-Cavalcade FLAC	01-The_Flatliners-The_Calming_Collection.flac	-9.959999	0.999878
what.cd/The Flatliners-Cavalcade FLAC	02-The_Flatliners-Carry_The_Banner.flac	-10.010002	0.999878
what.cd/The Flatliners-Cavalcade FLAC	03-The_Flatliners-Bleed.flac	-9.650002	0.999878
what.cd/The Flatliners-Cavalcade FLAC	04-The_Flatliners-Here_Comes_Treble.flac	-10.199997	0.999878
what.cd/The Flatliners-Cavalcade FLAC	05-The_Flatliners-He_Was_A_Jazzman.flac	-9.370003	0.999878
what.cd/The Flatliners-Cavalcade FLAC	06-The_Flatliners-Shithawks.flac	-10.120003	0.999878
what.cd/The Flatliners-Cavalcade FLAC	07-The_Flatliners-Monumental.flac	-10.309998	0.999878
what.cd/The Flatliners-Cavalcade FLAC	08-The_Flatliners-Filthy_Habits.flac	-10.199997	0.999878
what.cd/The Flatliners-Cavalcade FLAC	09-The_Flatliners-Liver_Alone.flac	-10.489998	0.999878
what.cd/The Flatliners-Cavalcade FLAC	10-The_Flatliners-Sleep_Your_Life_Away.flac	-9.699997	0.999878
what.cd/The Flatliners-Cavalcade FLAC	11-The_Flatliners-Count_Your_Bruises.flac	-10.510002	0.999878
what.cd/The Flatliners-Cavalcade FLAC	12-The_Flatliners-New_Years_Resolution.flac	-9.239998	0.999878
what.cd/The Flatliners - Dead Language-2013-FLAC	01 - Resuscitation of the Year.flac	-10.290001	1.000000
what.cd/The Flatliners - Dead Language-2013-FLAC	02 - Bury Me.flac	-9.340004	0.999969
what.cd/The Flatliners - Dead Language-2013-FLAC	03 - Birds of England.flac	-9.879997	1.000000
what.cd/The Flatliners - Dead Language-2013-FLAC	04 - Drown in Blood.flac	-10.029999	1.000000
what.cd/The Flatliners - Dead Language-2013-FLAC	05 - Sew My Mouth Shut.flac	-9.590004	0.999969
what.cd/The Flatliners - Dead Language-2013-FLAC	06 - Caskets Full.flac	-10.160004	0.999969
what.cd/The Flatliners - Dead Language-2013-FLAC	07 - Ashes Away.flac	-9.500000	1.000000
what.cd/The Flatliners - Dead Language-2013-FLAC	08 - Hounds.flac	-9.940002	0.999725
what.cd/The Flatliners - Dead Language-2013-FLAC	09 - Dead Hands.flac	-10.389999	1.000000
what.cd/The Flatliners - Dead Language-2013-FLAC	10 - Tail Feathers.flac	-10.040001	1.000000
what.cd/The Flatliners - Dead Language-2013-FLAC	11 - Quitters.flac	-10.040001	1.000000
what.cd/The Flatliners - Dead Language-2013-FLAC	12 - Young Professionals.flac	-10.099998	1.000000
what.cd/The Flatliners - Dead Language-2013-FLAC	13 - Brilliant Resilience.flac	-9.010002	1.000000
what.cd/The Gathering - Disclosure (2012)	01 - Paper Waves.flac	-8.070000	0.988403
what.cd/The Gathering - Disclosure (2012)	02 - Meltdown.flac	-8.900002	0.997528
what.cd/The Gathering - Disclosure (2012)	03 - Paralyzed.flac	-6.169998	0.988403
what.cd/The Gathering - Disclosure (2012)	04 - Heroes for Ghosts.flac	-7.809998	0.998718
what.cd/The Gathering - Disclosure (2012)	05 - Gemini I.flac	-9.760002	0.988800
what.cd/The Gathering - Disclosure (2012)	06 - Missing Seasons.flac	-5.059998	0.988403
what.cd/The Gathering - Disclosure (2012)	07 - I Can See Four Miles.flac	-8.940002	0.988403
what.cd/The Gathering - Disclosure (2012)	08 - Gemini II.flac	-7.169998	0.988403
what.cd/the gathering - if_then_else (2000)	01 Rollercoaster.flac	-7.989998	0.999207
what.cd/the gathering - if_then_else (2000)	02 Shot to Pieces.flac	-7.500000	0.999176
what.cd/the gathering - if_then_else (2000)	03 Amity.flac	-4.449997	0.999146
what.cd/the gathering - if_then_else (2000)	04 Bad Movie Scene.flac	-6.430000	0.999207
what.cd/the gathering - if_then_else (2000)	05 Colorado Incident.flac	-6.010002	0.999207
what.cd/the gathering - if_then_else (2000)	06 Beautiful War.flac	-5.169998	0.999176
what.cd/the gathering - if_then_else (2000)	07 Analog Park.flac	-5.070000	0.999176
what.cd/the gathering - if_then_else (2000)	08 Herbal Movement.flac	-6.059998	0.999176
what.cd/the gathering - if_then_else (2000)	09 Saturnine.flac	-6.550003	0.999207
what.cd/the gathering - if_then_else (2000)	10 Morphia's Waltz.flac	-3.840004	0.999146
what.cd/the gathering - if_then_else (2000)	11 Pathfinder.flac	-3.160004	0.999115
what.cd/The Hot 8 Brass Band - 2007 - Rock With the Hot 8 Brass Band	01 What's My Name .flac	-10.559998	0.977478
what.cd/The Hot 8 Brass Band - 2007 - Rock With the Hot 8 Brass Band	02 It's Real.flac	-9.639999	0.977509
what.cd/The Hot 8 Brass Band - 2007 - Rock With the Hot 8 Brass Band	03 Fly Away.flac	-10.169998	0.977478
what.cd/The Hot 8 Brass Band - 2007 - Rock With the Hot 8 Brass Band	04 I Got You.flac	-10.090004	0.977478
what.cd/The Hot 8 Brass Band - 2007 - Rock With the Hot 8 Brass Band	05 Sexual Healing.flac	-11.459999	0.977509
what.cd/The Hot 8 Brass Band - 2007 - Rock With the Hot 8 Brass Band	06 Jisten to Me.flac	-9.760002	0.977478
what.cd/The Hot 8 Brass Band - 2007 - Rock With the Hot 8 Brass Band	07 We Are One.flac	-10.199997	0.977509
what.cd/The Hot 8 Brass Band - 2007 - Rock With the Hot 8 Brass Band	08 Skeet Street.flac	-11.309998	0.977478
what.cd/The Hot 8 Brass Band - 2007 - Rock With the Hot 8 Brass Band	09 Rastafunk.flac	-9.220001	0.977478
what.cd/The Hot 8 Brass Band - 2007 - Rock With the Hot 8 Brass Band	10 E Flat Blues.flac	-9.870003	0.977509
what.cd/The Hot 8 Brass Band - 2007 - Rock With the Hot 8 Brass Band	11 Skit #1.flac	-6.650002	0.863495
what.cd/The Hot 8 Brass Band - 2007 - Rock With the Hot 8 Brass Band	12 Love Don't Live Here.flac	-11.120003	0.977509
what.cd/The Hot 8 Brass Band - 2007 - Rock With the Hot 8 Brass Band	13 Get Up.flac	-9.940002	0.977509
what.cd/The Jam - Sound Affects and All Mod Cons [MFSL]	01 - All Mod Cons.flac	-4.320000	0.988251
what.cd/The Jam - Sound Affects and All Mod Cons [MFSL]	02 - To Be Someone (Didn't We Have A Nice Time).flac	-3.849998	0.988281
what.cd/The Jam - Sound Affects and All Mod Cons [MFSL]	03 - Mr. Clean.flac	-3.620003	0.988251
what.cd/The Jam - Sound Affects and All Mod Cons [MFSL]	04 - David Watts.flac	-4.470001	0.984863
what.cd/The Jam - Sound Affects and All Mod Cons [MFSL]	05 - English Rose.flac	3.680000	0.374359
what.cd/The Jam - Sound Affects and All Mod Cons [MFSL]	06 - In The Crowd.flac	-5.330002	0.988281
what.cd/The Jam - Sound Affects and All Mod Cons [MFSL]	07 - Billy Hunt.flac	-5.550003	0.988281
what.cd/The Jam - Sound Affects and All Mod Cons [MFSL]	08 - It's Too Bad.flac	-5.040001	0.988281
what.cd/The Jam - Sound Affects and All Mod Cons [MFSL]	09 - Fly.flac	-1.769997	0.792236
what.cd/The Jam - Sound Affects and All Mod Cons [MFSL]	10 - The Place I Love.flac	-5.309998	0.988251
what.cd/The Jam - Sound Affects and All Mod Cons [MFSL]	11 - 'A' Bomb In Wardour Street.flac	-5.650002	0.988281
what.cd/The Jam - Sound Affects and All Mod Cons [MFSL]	12 - Down In The Tube Station At Midnight.flac	-5.590004	0.988281
what.cd/The Jam - Sound Affects and All Mod Cons [MFSL]	13 - Pretty Green.flac	-2.540001	0.934509
what.cd/The Jam - Sound Affects and All Mod Cons [MFSL]	14 - Monday.flac	-2.550003	0.967499
what.cd/The Jam - Sound Affects and All Mod Cons [MFSL]	15 - But I'm Different Now.flac	-4.269997	0.963104
what.cd/The Jam - Sound Affects and All Mod Cons [MFSL]	16 - Set The House Ablaze.flac	-4.370003	0.988281
what.cd/The Jam - Sound Affects and All Mod Cons [MFSL]	17 - Start!.flac	-1.919998	0.922180
what.cd/The Jam - Sound Affects and All Mod Cons [MFSL]	18 - That's Entertainment.flac	-0.470001	0.999969
what.cd/The Jam - Sound Affects and All Mod Cons [MFSL]	19 - Dream Time.flac	-2.370003	0.958832
what.cd/The Jam - Sound Affects and All Mod Cons [MFSL]	20 - Man In The Corner Shop.flac	-1.580002	0.949829
what.cd/The Jam - Sound Affects and All Mod Cons [MFSL]	21 - Music For The Last Couple.flac	0.779999	0.956482
what.cd/The Jam - Sound Affects and All Mod Cons [MFSL]	22 - Boy About Town.flac	-2.840004	0.979645
what.cd/The Jam - Sound Affects and All Mod Cons [MFSL]	23 - Scrape Away.flac	-0.419998	0.859711
what.cd/The Mighty Mighty Bosstones - Let's Face It	01 - Noise Brigade.flac	-8.500000	0.928589
what.cd/The Mighty Mighty Bosstones - Let's Face It	02 - The Rascal King.flac	-8.199997	0.928436
what.cd/The Mighty Mighty Bosstones - Let's Face It	03 - Royal Oil.flac	-6.720001	0.977234
what.cd/The Mighty Mighty Bosstones - Let's Face It	04 - The Impression That I Get.flac	-9.269997	0.979889
what.cd/The Mighty Mighty Bosstones - Let's Face It	05 - Let's Face It.flac	-8.059998	0.979889
what.cd/The Mighty Mighty Bosstones - Let's Face It	06 - That Bug Bit Me.flac	-8.779999	0.979889
what.cd/The Mighty Mighty Bosstones - Let's Face It	07 - Another Drinkin' Song.flac	-9.449997	0.999420
what.cd/The Mighty Mighty Bosstones - Let's Face It	08 - Numbered Days.flac	-8.910004	0.979889
what.cd/The Mighty Mighty Bosstones - Let's Face It	09 - Break So Easily.flac	-8.320000	0.977234
what.cd/The Mighty Mighty Bosstones - Let's Face It	10 - Nevermind Me.flac	-8.680000	1.000000
what.cd/The Mighty Mighty Bosstones - Let's Face It	11 - Desensitized.flac	-9.879997	0.979889
what.cd/The Mighty Mighty Bosstones - Let's Face It	12 - 1-2-8.flac	-8.550003	0.979889
what.cd/The Mighty Mighty Bosstones - Pay Attention (2000) [FLAC]	01 - Let Me Be.flac	-10.389999	0.998474
what.cd/The Mighty Mighty Bosstones - Pay Attention (2000) [FLAC]	02 - The Skeleton Song.flac	-11.379997	0.998413
what.cd/The Mighty Mighty Bosstones - Pay Attention (2000) [FLAC]	03 - All Things Considered.flac	-10.220001	0.998444
what.cd/The Mighty Mighty Bosstones - Pay Attention (2000) [FLAC]	04 - So Sad to Say.flac	-10.970001	0.998566
what.cd/The Mighty Mighty Bosstones - Pay Attention (2000) [FLAC]	05 - Allow Them.flac	-10.019997	0.998474
what.cd/The Mighty Mighty Bosstones - Pay Attention (2000) [FLAC]	06 - High School Dance.flac	-9.980003	0.998383
what.cd/The Mighty Mighty Bosstones - Pay Attention (2000) [FLAC]	07 - Over the Eggshells.flac	-10.290001	0.998535
what.cd/The Mighty Mighty Bosstones - Pay Attention (2000) [FLAC]	08 - She Just Happened.flac	-9.230003	0.998260
what.cd/The Mighty Mighty Bosstones - Pay Attention (2000) [FLAC]	09 - Finally.flac	-9.989998	0.998444
what.cd/The Mighty Mighty Bosstones - Pay Attention (2000) [FLAC]	10 - I Know More.flac	-10.309998	0.998383
what.cd/The Mighty Mighty Bosstones - Pay Attention (2000) [FLAC]	11 - Riot on Broad Street.flac	-9.239998	0.998383
what.cd/The Mighty Mighty Bosstones - Pay Attention (2000) [FLAC]	12 - One Million Reasons.flac	-10.840004	0.998657
what.cd/The Mighty Mighty Bosstones - Pay Attention (2000) [FLAC]	13 - Bad News and Bad Breaks.flac	-9.230003	0.998535
what.cd/The Mighty Mighty Bosstones - Pay Attention (2000) [FLAC]	14 - Temporary Trip.flac	-10.349998	0.998383
what.cd/The Mighty Mighty Bosstones - Pay Attention (2000) [FLAC]	15 - Where You Come From.flac	-10.730003	0.998657
what.cd/The Mighty Mighty Bosstones - Pay Attention (2000) [FLAC]	16 - The Day He Didn't Die.flac	-8.279999	0.998352
what.cd/The Mighty Mighty Bosstones - Pin Points and Gin Joints [FLAC]	01 - The Mighty Mighty Bosstones - Graffiti Worth Reading.flac	-10.290001	0.966125
what.cd/The Mighty Mighty Bosstones - Pin Points and Gin Joints [FLAC]	02 - The Mighty Mighty Bosstones - Nah Nah Nah Nah Nah.flac	-10.940002	0.966125
what.cd/The Mighty Mighty Bosstones - Pin Points and Gin Joints [FLAC]	03 - The Mighty Mighty Bosstones - The Route That I Took.flac	-10.389999	0.966125
what.cd/The Mighty Mighty Bosstones - Pin Points and Gin Joints [FLAC]	04 - The Mighty Mighty Bosstones - You Left Right .flac	-10.139999	0.966125
what.cd/The Mighty Mighty Bosstones - Pin Points and Gin Joints [FLAC]	05 - The Mighty Mighty Bosstones - Too Many Stars.flac	-11.610001	0.966125
what.cd/The Mighty Mighty Bosstones - Pin Points and Gin Joints [FLAC]	06 - The Mighty Mighty Bosstones - Your Life.flac	-9.430000	0.966125
what.cd/The Mighty Mighty Bosstones - Pin Points and Gin Joints [FLAC]	07 - The Mighty Mighty Bosstones - I Wrote It.flac	-10.320000	0.966125
what.cd/The Mighty Mighty Bosstones - Pin Points and Gin Joints [FLAC]	08 - The Mighty Mighty Bosstones - Not To Me On That Night.flac	-10.070000	0.966278
what.cd/The Mighty Mighty Bosstones - Pin Points and Gin Joints [FLAC]	09 - The Mighty Mighty Bosstones - Wasted Summers.flac	-10.449997	0.966217
what.cd/The Mighty Mighty Bosstones - Pin Points and Gin Joints [FLAC]	10 - The Mighty Mighty Bosstones - Sister Mary.flac	-9.809998	0.988647
what.cd/The Mighty Mighty Bosstones - Pin Points and Gin Joints [FLAC]	11 - The Mighty Mighty Bosstones - It Will Be.flac	-11.169998	0.988617
what.cd/The Mighty Mighty Bosstones - Pin Points and Gin Joints [FLAC]	12 - The Mighty Mighty Bosstones - The Death Valley Vipers.flac	-11.120003	0.988617
what.cd/The Mighty Mighty Bosstones - Pin Points and Gin Joints [FLAC]	13 - The Mighty Mighty Bosstones - The Bricklayer's Story.flac	-11.050003	0.988617
what.cd/The Mighty Mighty Bosstones - Pin Points and Gin Joints [FLAC]	14 - The Mighty Mighty Bosstones - A Pretty Sad Excuse.flac	-10.879997	0.988617
what.cd/The Mighty Mighty BossTones - Question The Answers (1994) - flac	01 - Kinder Words.flac	-6.180000	0.988556
what.cd/The Mighty Mighty BossTones - Question The Answers (1994) - flac	02 - A Sad Silence.flac	-5.650002	0.988556
what.cd/The Mighty Mighty BossTones - Question The Answers (1994) - flac	03 - Hell of a Hat.flac	-7.959999	0.988556
what.cd/The Mighty Mighty BossTones - Question The Answers (1994) - flac	04 - Pictures to Prove it.flac	-7.599998	0.988556
what.cd/The Mighty Mighty BossTones - Question The Answers (1994) - flac	05 - We Should Talk.flac	-6.500000	0.988556
what.cd/The Mighty Mighty BossTones - Question The Answers (1994) - flac	06 - A Dollar and a Dream.flac	-4.739998	0.983307
what.cd/The Mighty Mighty BossTones - Question The Answers (1994) - flac	07 - Stand Off.flac	-7.779999	0.988556
what.cd/The Mighty Mighty BossTones - Question The Answers (1994) - flac	08 - 365 Days.flac	-6.959999	0.988556
what.cd/The Mighty Mighty BossTones - Question The Answers (1994) - flac	09 - Toxic Toast.flac	-5.680000	0.988556
what.cd/The Mighty Mighty BossTones - Question The Answers (1994) - flac	10 - Bronzing the Garbage.flac	-7.440002	0.988556
what.cd/The Mighty Mighty BossTones - Question The Answers (1994) - flac	11 - Dogs and Chaplains.flac	-6.180000	0.988556
what.cd/The Mighty Mighty BossTones - Question The Answers (1994) - flac	12 - Jump Through the Hoops.flac	-7.349998	0.988556
what.cd/The Offspring - Americana [FLAC]	The Offspring - Americana - 01 - Welcome.flac	-3.440002	0.944061
what.cd/The Offspring - Americana [FLAC]	The Offspring - Americana - 02 - Have You Ever.flac	-9.340004	0.944244
what.cd/The Offspring - Americana [FLAC]	The Offspring - Americana - 03 - Staring At The Sun.flac	-9.349998	0.944153
what.cd/The Offspring - Americana [FLAC]	The Offspring - Americana - 04 - Pretty Fly (For A White Guy).flac	-9.760002	0.965363
what.cd/The Offspring - Americana [FLAC]	The Offspring - Americana - 05 - The Kids Aren't Alright.flac	-9.169998	0.922668
what.cd/The Offspring - Americana [FLAC]	The Offspring - Americana - 06 - Feelings.flac	-8.720001	0.944153
what.cd/The Offspring - Americana [FLAC]	The Offspring - Americana - 07 - She's Got Issues.flac	-9.769997	0.944153
what.cd/The Offspring - Americana [FLAC]	The Offspring - Americana - 08 - Walla Walla.flac	-9.239998	0.944153
what.cd/The Offspring - Americana [FLAC]	The Offspring - Americana - 09 - The End Of The Line.flac	-9.529999	0.944153
what.cd/The Offspring - Americana [FLAC]	The Offspring - Americana - 10 - No Brakes.flac	-9.050003	0.944153
what.cd/The Offspring - Americana [FLAC]	The Offspring - Americana - 11 - Why Don't You Get A Job.flac	-8.760002	0.944153
what.cd/The Offspring - Americana [FLAC]	The Offspring - Americana - 12 - Americana.flac	-9.510002	0.944153
what.cd/The Offspring - Americana [FLAC]	The Offspring - Americana - 13 - Pay The Man.flac	-8.849998	0.999969
what.cd/The Offspring - Defy You [FLAC]	01 - Defy You.flac	-10.529999	0.988800
what.cd/The Offspring - Defy You [FLAC]	02 - One Hundred Punks.flac	-9.019997	0.999969
what.cd/The Offspring - Defy You [FLAC]	03 - Sel Esteem ( Live ).flac	-8.199997	1.000000
what.cd/The Offspring - Defy You [FLAC]	04 - Want You Bad ( Live ).flac	-9.989998	0.988831
what.cd/The Offspring - Smash [FLAC]	The Offspring - Smash - 01 - Time To Relax.flac	1.290001	0.696655
what.cd/The Offspring - Smash [FLAC]	The Offspring - Smash - 02 - Nitro (Youth Energy).flac	-8.139999	0.946686
what.cd/The Offspring - Smash [FLAC]	The Offspring - Smash - 03 - Bad Habit.flac	-8.250000	0.946686
what.cd/The Offspring - Smash [FLAC]	The Offspring - Smash - 04 - Gotta Get Away.flac	-6.940002	0.946716
what.cd/The Offspring - Smash [FLAC]	The Offspring - Smash - 05 - Genocide.flac	-7.650002	0.946686
what.cd/The Offspring - Smash [FLAC]	The Offspring - Smash - 06 - Something To Believe In.flac	-7.180000	0.946625
what.cd/The Offspring - Smash [FLAC]	The Offspring - Smash - 07 - Come Out And Play.flac	-6.570000	0.946686
what.cd/The Offspring - Smash [FLAC]	The Offspring - Smash - 08 - Self Esteem.flac	-6.910004	0.946686
what.cd/The Offspring - Smash [FLAC]	The Offspring - Smash - 09 - It'll Be A Long Time.flac	-7.330002	0.946655
what.cd/The Offspring - Smash [FLAC]	The Offspring - Smash - 10 - Killboy Powerhead.flac	-7.690002	0.946655
what.cd/The Offspring - Smash [FLAC]	The Offspring - Smash - 11 - What Happened To You.flac	-6.769997	0.945282
what.cd/The Offspring - Smash [FLAC]	The Offspring - Smash - 12 - So Alone.flac	-7.419998	0.946655
what.cd/The Offspring - Smash [FLAC]	The Offspring - Smash - 13 - Not The One.flac	-7.169998	0.946655
what.cd/The Offspring - Smash [FLAC]	The Offspring - Smash - 14 - Smash.flac	-7.110001	0.946655
what.cd/The Police - Synchronicity (1983) [FLAC] (MFSL Gold)	01 - Synchronicity I.flac	-0.849998	0.891235
what.cd/The Police - Synchronicity (1983) [FLAC] (MFSL Gold)	02 - Walking In Your Footsteps.flac	1.259998	0.827118
what.cd/The Police - Synchronicity (1983) [FLAC] (MFSL Gold)	03 - O My God.flac	0.159996	0.891235
what.cd/The Police - Synchronicity (1983) [FLAC] (MFSL Gold)	04 - Mother.flac	-2.139999	0.769104
what.cd/The Police - Synchronicity (1983) [FLAC] (MFSL Gold)	05 - Miss Gradenko.flac	-0.769997	0.891235
what.cd/The Police - Synchronicity (1983) [FLAC] (MFSL Gold)	06 - Synchronicity II.flac	-0.230003	0.891205
what.cd/The Police - Synchronicity (1983) [FLAC] (MFSL Gold)	07 - Every Breath You Take.flac	-0.900002	0.934418
what.cd/The Police - Synchronicity (1983) [FLAC] (MFSL Gold)	08 - King Of Pain.flac	-0.540001	0.869324
what.cd/The Police - Synchronicity (1983) [FLAC] (MFSL Gold)	09 - Wrapped Around Your Finger.flac	1.489998	0.880005
what.cd/The Police - Synchronicity (1983) [FLAC] (MFSL Gold)	10 - Tea In The Sahara.flac	4.770000	0.867218
what.cd/The Police - Synchronicity (1983) [FLAC] (MFSL Gold)	11 - Murder By Numbers.flac	1.540001	0.977234
what.cd/The Reverend Horton Heat - Holy Roller - 24 Hits (1999) [flac]	01 Big Sky.flac	-6.750000	0.977264
what.cd/The Reverend Horton Heat - Holy Roller - 24 Hits (1999) [flac]	02 Baddest of the Bad.flac	-6.650002	1.000000
what.cd/The Reverend Horton Heat - Holy Roller - 24 Hits (1999) [flac]	03 Wiggle Stick.flac	-8.169998	0.991119
what.cd/The Reverend Horton Heat - Holy Roller - 24 Hits (1999) [flac]	04 Big Red Rocket of Love.flac	-7.889999	0.931061
what.cd/The Reverend Horton Heat - Holy Roller - 24 Hits (1999) [flac]	05 Bales of Cocaine.flac	-8.300003	0.992157
what.cd/The Reverend Horton Heat - Holy Roller - 24 Hits (1999) [flac]	06 Bath-Water Blues.flac	-8.220001	0.990692
what.cd/The Reverend Horton Heat - Holy Roller - 24 Hits (1999) [flac]	07 Lie Detector.flac	-9.389999	0.889954
what.cd/The Reverend Horton Heat - Holy Roller - 24 Hits (1999) [flac]	08 400 Bucks.flac	-8.830002	0.991547
what.cd/The Reverend Horton Heat - Holy Roller - 24 Hits (1999) [flac]	09 Marijuana.flac	-8.040001	0.992249
what.cd/The Reverend Horton Heat - Holy Roller - 24 Hits (1999) [flac]	10 It's Martini Time.flac	-7.650002	0.971405
what.cd/The Reverend Horton Heat - Holy Roller - 24 Hits (1999) [flac]	11 Baby I'm Drunk.flac	-8.309998	0.979736
what.cd/The Reverend Horton Heat - Holy Roller - 24 Hits (1999) [flac]	12 Where in the Hell Did You Go with My Toothbrush.flac	-6.300003	0.991882
what.cd/The Reverend Horton Heat - Holy Roller - 24 Hits (1999) [flac]	13 Bad Reputation.flac	-8.529999	0.992310
what.cd/The Reverend Horton Heat - Holy Roller - 24 Hits (1999) [flac]	14 One Time for Me.flac	-6.940002	0.983032
what.cd/The Reverend Horton Heat - Holy Roller - 24 Hits (1999) [flac]	15 Now, Right Now.flac	-7.080002	0.868439
what.cd/The Reverend Horton Heat - Holy Roller - 24 Hits (1999) [flac]	16 Slow.flac	-7.489998	0.907593
what.cd/The Reverend Horton Heat - Holy Roller - 24 Hits (1999) [flac]	17 Love Whip.flac	-8.080002	1.000000
what.cd/The Reverend Horton Heat - Holy Roller - 24 Hits (1999) [flac]	18 Jimbo Song.flac	-7.570000	0.889984
what.cd/The Reverend Horton Heat - Holy Roller - 24 Hits (1999) [flac]	19 Big Little Baby.flac	-8.620003	0.900024
what.cd/The Reverend Horton Heat - Holy Roller - 24 Hits (1999) [flac]	20 Cowboy Love.flac	-6.019997	0.966919
what.cd/The Reverend Horton Heat - Holy Roller - 24 Hits (1999) [flac]	21 In Your Wildest Dreams.flac	-5.300003	0.992218
what.cd/The Reverend Horton Heat - Holy Roller - 24 Hits (1999) [flac]	22 Eat Steak.flac	-5.680000	0.999969
what.cd/The Reverend Horton Heat - Holy Roller - 24 Hits (1999) [flac]	23 Folsom Prison Blues.flac	-6.230003	0.990692
what.cd/The Reverend Horton Heat - Holy Roller - 24 Hits (1999) [flac]	24 The Entertainer.flac	-4.050003	0.955017
what.cd/The Selecter - Too Much Pressure - 1980 (Remaster)	01 - Three Minute Hero.flac	-7.349998	0.988556
what.cd/The Selecter - Too Much Pressure - 1980 (Remaster)	02 - Everyday.flac	-6.239998	0.988556
what.cd/The Selecter - Too Much Pressure - 1980 (Remaster)	03 - They Make Me Mad.flac	-7.769997	0.988556
what.cd/The Selecter - Too Much Pressure - 1980 (Remaster)	04 - Missing Words.flac	-6.669998	0.988556
what.cd/The Selecter - Too Much Pressure - 1980 (Remaster)	05 - Danger.flac	-8.800003	0.988525
what.cd/The Selecter - Too Much Pressure - 1980 (Remaster)	06 - Street Feeling.flac	-7.489998	0.988525
what.cd/The Selecter - Too Much Pressure - 1980 (Remaster)	07 - My Collie (Not A Dog).flac	-5.949997	0.988556
what.cd/The Selecter - Too Much Pressure - 1980 (Remaster)	08 - Too Much Pressure.flac	-7.440002	0.988556
what.cd/The Selecter - Too Much Pressure - 1980 (Remaster)	09 - Murder.flac	-7.489998	0.988556
what.cd/The Selecter - Too Much Pressure - 1980 (Remaster)	10 - Out On The Streets.flac	-6.129997	0.988556
what.cd/The Selecter - Too Much Pressure - 1980 (Remaster)	11 - Carry Go Bring Come.flac	-6.769997	0.988556
what.cd/The Selecter - Too Much Pressure - 1980 (Remaster)	12 - Black And Blue.flac	-7.290001	0.988556
what.cd/The Selecter - Too Much Pressure - 1980 (Remaster)	13 - James Bond.flac	-7.340004	0.988586
what.cd/The Selecter - Too Much Pressure - 1980 (Remaster)	14 - The Selecter.flac	-6.340004	0.988525
what.cd/The Selecter - Too Much Pressure - 1980 (Remaster)	15 - On My Radio.flac	-7.910004	0.988556
what.cd/The Selecter - Too Much Pressure - 1980 (Remaster)	16 - Too Much Pressure (Single Version).flac	-8.230003	0.988556
what.cd/The Skints - 2009 - Live, Breathe, Build, Believe[FLAC]	01 - Mindless.flac	-6.970001	0.977661
what.cd/The Skints - 2009 - Live, Breathe, Build, Believe[FLAC]	02 - 'Get Me!'.flac	-8.540001	0.977661
what.cd/The Skints - 2009 - Live, Breathe, Build, Believe[FLAC]	03 - Ya Know.flac	-7.000000	0.977692
what.cd/The Skints - 2009 - Live, Breathe, Build, Believe[FLAC]	04 - Contemplations of the Modern Rudeboy.flac	-7.570000	0.977722
what.cd/The Skints - 2009 - Live, Breathe, Build, Believe[FLAC]	05 - Culture Vulture.flac	-8.010002	0.977661
what.cd/The Skints - 2009 - Live, Breathe, Build, Believe[FLAC]	06 - Murderer.flac	-6.849998	0.977692
what.cd/The Skints - 2009 - Live, Breathe, Build, Believe[FLAC]	07 - Bright Girl.flac	-6.629997	0.977661
what.cd/The Skints - 2009 - Live, Breathe, Build, Believe[FLAC]	08 - Change the Channel.flac	-6.919998	0.977661
what.cd/The Skints - 2009 - Live, Breathe, Build, Believe[FLAC]	09 - Sociopath.flac	-7.849998	0.977692
what.cd/The Skints - 2009 - Live, Breathe, Build, Believe[FLAC]	10 - Roanna's Song.flac	-7.139999	0.977692
what.cd/The Skints - 2012 - Part & Parcel[FLAC]	01 - The Skints - Rise Up.flac	-7.779999	0.988922
what.cd/The Skints - 2012 - Part & Parcel[FLAC]	02 - The Skints - Ratatat.flac	-7.430000	0.991821
what.cd/The Skints - 2012 - Part & Parcel[FLAC]	03 - The Skints - Can't Take No More.flac	-8.309998	0.994751
what.cd/The Skints - 2012 - Part & Parcel[FLAC]	04 - The Skints - Live East Die Young.flac	-7.840004	0.988525
what.cd/The Skints - 2012 - Part & Parcel[FLAC]	05 - The Skints - Ring Ring.flac	-5.970001	0.982819
what.cd/The Skints - 2012 - Part & Parcel[FLAC]	06 - The Skints - Lay You Down.flac	-6.809998	0.988525
what.cd/The Skints - 2012 - Part & Parcel[FLAC]	07 - The Skints - Sunny Sunny.flac	-6.269997	0.999969
what.cd/The Skints - 2012 - Part & Parcel[FLAC]	08 - The Skints - Rubadub (Done Know).flac	-8.940002	0.989166
what.cd/The Skints - 2012 - Part & Parcel[FLAC]	09 - The Skints - Up Against The Wall Riddm.flac	-8.370003	0.988525
what.cd/The Skints - 2012 - Part & Parcel[FLAC]	10 - The Skints - Soundboy.flac	-6.529999	0.982758
what.cd/The Skints - 2012 - Part & Parcel[FLAC]	11 - The Skints - You Better.flac	-6.330002	0.979523
what.cd/The Skints - FM (2015) [FLAC] { Easy Star Records, ES-1046, 15 TRK }	01 - FM ... DJ Mr. Versatile Breakfast Show.flac	-2.699997	0.976257
what.cd/The Skints - FM (2015) [FLAC] { Easy Star Records, ES-1046, 15 TRK }	02 - This Town  (featuring Tippa Irie & Horseman).flac	-5.779999	0.976349
what.cd/The Skints - FM (2015) [FLAC] { Easy Star Records, ES-1046, 15 TRK }	03 - In The Night  (featuring Horseman).flac	-6.080002	0.976349
what.cd/The Skints - FM (2015) [FLAC] { Easy Star Records, ES-1046, 15 TRK }	04 - Come To You.flac	-6.220001	0.976318
what.cd/The Skints - FM (2015) [FLAC] { Easy Star Records, ES-1046, 15 TRK }	05 - My War.flac	-6.690002	0.976349
what.cd/The Skints - FM (2015) [FLAC] { Easy Star Records, ES-1046, 15 TRK }	06 - FM ... Dancehall Dilemmas with Dr. Ranking Pegasus.flac	-6.019997	0.976227
what.cd/The Skints - FM (2015) [FLAC] { Easy Star Records, ES-1046, 15 TRK }	07 - Friends & Business.flac	-6.480003	0.976318
what.cd/The Skints - FM (2015) [FLAC] { Easy Star Records, ES-1046, 15 TRK }	08 - Where Did You Go.flac	-5.900002	0.976349
what.cd/The Skints - FM (2015) [FLAC] { Easy Star Records, ES-1046, 15 TRK }	09 - Tazer Beam  (featuring Tippa Irie).flac	-5.800003	0.976349
what.cd/The Skints - FM (2015) [FLAC] { Easy Star Records, ES-1046, 15 TRK }	10 - The Forest For The Trees.flac	-6.959999	0.976318
what.cd/The Skints - FM (2015) [FLAC] { Easy Star Records, ES-1046, 15 TRK }	11 - FM ... Grime Hour with Rivz.flac	-5.879997	0.952820
what.cd/The Skints - FM (2015) [FLAC] { Easy Star Records, ES-1046, 15 TRK }	12 - Eyes In The Back Of My Head  (featuring Rival).flac	-6.840004	0.976349
what.cd/The Skints - FM (2015) [FLAC] { Easy Star Records, ES-1046, 15 TRK }	13 - Got No Say.flac	-6.340004	0.976318
what.cd/The Skints - FM (2015) [FLAC] { Easy Star Records, ES-1046, 15 TRK }	14 - FM ... DJ Mr. Versatile Evening Session.flac	-4.800003	0.976257
what.cd/The Skints - FM (2015) [FLAC] { Easy Star Records, ES-1046, 15 TRK }	15 - Tomorrow.flac	-6.459999	0.976318
what.cd/The Specials - 1979 - Specials [FLAC]	01 - A Message to You Rudy.flac	-3.820000	0.962952
what.cd/The Specials - 1979 - Specials [FLAC]	02 - Do the Dog.flac	-6.470001	0.965179
what.cd/The Specials - 1979 - Specials [FLAC]	03 - It's Up to You.flac	-4.910004	0.978058
what.cd/The Specials - 1979 - Specials [FLAC]	04 - Nite Klub.flac	-6.690002	0.969849
what.cd/The Specials - 1979 - Specials [FLAC]	05 - Doesn't Make It Alright.flac	-3.989998	0.959625
what.cd/The Specials - 1979 - Specials [FLAC]	06 - Concrete Jungle.flac	-5.820000	0.955872
what.cd/The Specials - 1979 - Specials [FLAC]	07 - Too Hot.flac	-3.949997	0.961090
what.cd/The Specials - 1979 - Specials [FLAC]	08 - Monkey Man.flac	-4.110001	0.949463
what.cd/The Specials - 1979 - Specials [FLAC]	09 - (Dawning of a) New Era.flac	-6.370003	0.960327
what.cd/The Specials - 1979 - Specials [FLAC]	10 - Blank Expression.flac	-4.050003	0.971558
what.cd/The Specials - 1979 - Specials [FLAC]	11 - Stupid Marriage.flac	-5.820000	0.972900
what.cd/The Specials - 1979 - Specials [FLAC]	12 - Too Much Too Young.flac	-4.739998	0.947266
what.cd/The Specials - 1979 - Specials [FLAC]	13 - Little Bitch.flac	-5.959999	0.963562
what.cd/The Specials - 1979 - Specials [FLAC]	14 - You're Wondering Now.flac	-2.529999	0.971863
what.cd/The Suicide Machines - War Profiteering Is Killing Us All (2005)	01 - War Profiteering Is Killing Us All.flac	-12.610001	0.999725
what.cd/The Suicide Machines - War Profiteering Is Killing Us All (2005)	02 - Capitalist Suicide.flac	-11.779999	1.000000
what.cd/The Suicide Machines - War Profiteering Is Killing Us All (2005)	03 - Ghost On Sunset Strip.flac	-10.519997	0.988556
what.cd/The Suicide Machines - War Profiteering Is Killing Us All (2005)	04 - Junk.flac	-12.029999	0.999725
what.cd/The Suicide Machines - War Profiteering Is Killing Us All (2005)	05 - 17% 18 - 25.flac	-12.389999	1.000000
what.cd/The Suicide Machines - War Profiteering Is Killing Us All (2005)	06 - Capsule (AKA Requiem For The Stupid Human Race).flac	-11.340004	0.944550
what.cd/The Suicide Machines - War Profiteering Is Killing Us All (2005)	07 - All Systems Fail.flac	-10.840004	0.988556
what.cd/The Suicide Machines - War Profiteering Is Killing Us All (2005)	08 - Red Flag.flac	-11.910004	1.000000
what.cd/The Suicide Machines - War Profiteering Is Killing Us All (2005)	09 - Nuclear Generators.flac	-12.040001	0.999725
what.cd/The Suicide Machines - War Profiteering Is Killing Us All (2005)	10 - Bottomed Out.flac	-11.820000	0.999725
what.cd/The Suicide Machines - War Profiteering Is Killing Us All (2005)	11 - Rebellion Is On The Clearance Rack (And I Think I Like It).flac	-11.970001	0.999725
what.cd/The Suicide Machines - War Profiteering Is Killing Us All (2005)	12 - Hands Tied.flac	-10.830002	0.999725
what.cd/The Suicide Machines - War Profiteering Is Killing Us All (2005)	13 - I Went On Tour For Ten Years... And All I Got Was This Lousy T-Shirt.flac	-10.059998	0.999725
what.cd/The Suicide Machines - War Profiteering Is Killing Us All (2005)	14 - 95% Of The World Is Third World.flac	-9.440002	0.988556
what.cd/Thrice (2005) Vheissu [FLAC]	01 - Image of the Invisible.flac	-11.739998	0.988556
what.cd/Thrice (2005) Vheissu [FLAC]	02 - Between the End and Where We Lie.flac	-10.709999	0.988556
what.cd/Thrice (2005) Vheissu [FLAC]	03 - The Earth Will Shake.flac	-11.129997	0.988556
what.cd/Thrice (2005) Vheissu [FLAC]	04 - Atlantic.flac	-9.800003	0.988556
what.cd/Thrice (2005) Vheissu [FLAC]	05 - For Miles.flac	-11.800003	0.988556
what.cd/Thrice (2005) Vheissu [FLAC]	06 - Hold Fast Hope.flac	-11.459999	0.988556
what.cd/Thrice (2005) Vheissu [FLAC]	07 - Music Box.flac	-11.160004	1.000000
what.cd/Thrice (2005) Vheissu [FLAC]	08 - Like Moths to Flame.flac	-11.070000	0.988556
what.cd/Thrice (2005) Vheissu [FLAC]	09 - Of Dust and Nations.flac	-10.690002	0.988556
what.cd/Thrice (2005) Vheissu [FLAC]	10 - Stand and Feel Your Worth.flac	-10.349998	0.991333
what.cd/Thrice (2005) Vheissu [FLAC]	11 - Red Sky.flac	-11.050003	0.988556
what.cd/Time Bomb	01 - Time Bomb.flac	-8.070000	0.988678
what.cd/Time Bomb	02 - Turn Around.flac	-6.669998	0.988678
what.cd/Time Bomb	03 - Let Me Inside.flac	-6.980003	0.988678
what.cd/Time Bomb	04 - Dream.flac	-5.730003	0.988678
what.cd/Time Bomb	05 - You Don't Know (ft. Tunji).flac	-6.610001	0.988678
what.cd/Time Bomb	06 - Get Back Me.flac	-7.790001	0.988678
what.cd/Time Bomb	07 - Coming Your Way.flac	-8.430000	0.988678
what.cd/Time Bomb	08 - Wait and See.flac	-6.320000	0.988678
what.cd/Time Bomb	09 - Changed My Mind.flac	-5.980003	0.988678
what.cd/Time Bomb	10 - Love／Hate.flac	-5.419998	0.988678
what.cd/Time Bomb	11 - All in You.flac	-6.559998	0.988678
what.cd/Time Bomb	12 - Falling.flac	-4.669998	0.988678
what.cd/Time Bomb	13 - The End.flac	-6.320000	0.988678
what.cd/Tokyo Ska Paradise Orchestra {1990} Skapara Toujou [FLAC]	01 - Strange Bird.flac	-5.510002	1.000000
what.cd/Tokyo Ska Paradise Orchestra {1990} Skapara Toujou [FLAC]	02 - Vampire.flac	-4.860001	1.000000
what.cd/Tokyo Ska Paradise Orchestra {1990} Skapara Toujou [FLAC]	03 - Monster Rock.flac	-5.080002	1.000000
what.cd/Tokyo Ska Paradise Orchestra {1990} Skapara Toujou [FLAC]	04 - Kozou No Kousin.flac	-5.150002	1.000000
what.cd/Tokyo Ska Paradise Orchestra {1990} Skapara Toujou [FLAC]	05 - Uuhan No Onna.flac	-5.320000	1.000000
what.cd/Tokyo Ska Paradise Orchestra {1990} Skapara Toujou [FLAC]	06 - Tin Tin Deo.flac	-5.690002	1.000000
what.cd/Tokyo Ska Paradise Orchestra {1990} Skapara Toujou [FLAC]	07 - Getsumen Butou.flac	-3.570000	0.999969
what.cd/Tokyo Ska Paradise Orchestra {1990} Skapara Toujou [FLAC]	08 - Nigai Namida.flac	-5.050003	1.000000
what.cd/Tokyo Ska Paradise Orchestra {1990} Skapara Toujou [FLAC]	09 - Inishie No Hana.flac	-3.970001	1.000000
what.cd/Tokyo Ska Paradise Orchestra {1990} Skapara Toujou [FLAC]	10 - Golden Tiger.flac	-5.050003	1.000000
what.cd/Tokyo Ska Paradise Orchestra {1990} Skapara Toujou [FLAC]	11 - Hit the Road Jack.flac	-4.669998	1.000000
what.cd/Tokyo Ska Paradise Orchestra {1990} Skapara Toujou [FLAC]	12 - Dokidoki Time.flac	-5.750000	1.000000
what.cd/Tokyo Ska Paradise Orchestra {1990} Skapara Toujou [FLAC]	13 - Kimi to Boku.flac	-1.830002	0.488037
what.cd/Tokyo Ska Paradise Orchestra - Perfect Future	01 Perfect Future.flac	-9.370003	0.992096
what.cd/Tokyo Ska Paradise Orchestra - Perfect Future	02 女神の願い.flac	-10.129997	0.995544
what.cd/Tokyo Ska Paradise Orchestra - Perfect Future	03 Punch'n' Sway.flac	-9.790001	0.992096
what.cd/Tokyo Ska Paradise Orchestra - Perfect Future	04 Me & My Skyline.flac	-10.029999	0.992126
what.cd/Tokyo Ska Paradise Orchestra - Perfect Future	05 964スピードスター.flac	-11.080002	0.992096
what.cd/Tokyo Ska Paradise Orchestra - Perfect Future	06 Warrior Chant.flac	-8.870003	0.992096
what.cd/Tokyo Ska Paradise Orchestra - Perfect Future	07 Last Temptation.flac	-8.349998	0.992096
what.cd/Tokyo Ska Paradise Orchestra - Perfect Future	08 Latin Scorcher.flac	-8.970001	0.992096
what.cd/Tokyo Ska Paradise Orchestra - Perfect Future	09 A Song for Athletes.flac	-10.070000	0.992065
what.cd/Tokyo Ska Paradise Orchestra - Perfect Future	10 All About My Monster.flac	-9.849998	0.992126
what.cd/Tokyo Ska Paradise Orchestra - Perfect Future	11 Pride of Lions.flac	-10.330002	0.992096
what.cd/Tokyo Ska Paradise Orchestra - Perfect Future	12 Transit Passenger.flac	-9.360001	0.992126
what.cd/Tokyo Ska Paradise Orchestra - Perfect Future	13 Walking Angel.flac	-8.459999	0.992401
what.cd/Tool (1996) - Ænima [FLAC]	01 - Stinkfist.flac	-8.440002	0.994446
what.cd/Tool (1996) - Ænima [FLAC]	02 - Eulogy.flac	-7.809998	0.994446
what.cd/Tool (1996) - Ænima [FLAC]	03 - H..flac	-7.090004	0.994446
what.cd/Tool (1996) - Ænima [FLAC]	04 - Useful Idiot.flac	5.279999	0.742706
what.cd/Tool (1996) - Ænima [FLAC]	05 - Forty Six & 2.flac	-7.709999	0.994446
what.cd/Tool (1996) - Ænima [FLAC]	06 - Message To Harry Manback.flac	9.610001	0.292236
what.cd/Tool (1996) - Ænima [FLAC]	07 - Hooker With A Penis.flac	-7.559998	0.979980
what.cd/Tool (1996) - Ænima [FLAC]	08 - Intermission.flac	7.160000	0.265686
what.cd/Tool (1996) - Ænima [FLAC]	09 - Jimmy.flac	-7.349998	0.994446
what.cd/Tool (1996) - Ænima [FLAC]	10 - Die Eier Von Satan.flac	-5.459999	0.794342
what.cd/Tool (1996) - Ænima [FLAC]	11 - Pushit.flac	-7.889999	0.994446
what.cd/Tool (1996) - Ænima [FLAC]	12 - Cesaro Summability.flac	-2.180000	0.960724
what.cd/Tool (1996) - Ænima [FLAC]	13 - Ænema.flac	-7.800003	0.994446
what.cd/Tool (1996) - Ænima [FLAC]	14 - (-) Ions.flac	0.550003	0.953156
what.cd/Tool (1996) - Ænima [FLAC]	15 - Third Eye.flac	-7.470001	0.994446
what.cd/Tool (2001) - Lateralus [FLAC]	01 - The Grudge.flac	-7.830002	0.999969
what.cd/Tool (2001) - Lateralus [FLAC]	02 - Eon Blue Apocalypse.flac	6.250000	0.423431
what.cd/Tool (2001) - Lateralus [FLAC]	03 - The Patient.flac	-7.570000	0.988678
what.cd/Tool (2001) - Lateralus [FLAC]	04 - Mantra.flac	6.750000	0.370941
what.cd/Tool (2001) - Lateralus [FLAC]	05 - Schism.flac	-6.459999	0.988708
what.cd/Tool (2001) - Lateralus [FLAC]	06 - Parabol.flac	6.970001	0.619690
what.cd/Tool (2001) - Lateralus [FLAC]	07 - Parabola.flac	-7.090004	0.988770
what.cd/Tool (2001) - Lateralus [FLAC]	08 - Ticks & Leeches.flac	-7.080002	0.988678
what.cd/Tool (2001) - Lateralus [FLAC]	09 - Lateralus.flac	-8.500000	0.988678
what.cd/Tool (2001) - Lateralus [FLAC]	10 - Disposition.flac	2.750000	0.748474
what.cd/Tool (2001) - Lateralus [FLAC]	11 - Reflection.flac	-5.889999	0.988647
what.cd/Tool (2001) - Lateralus [FLAC]	12 - Triad.flac	-6.699997	0.988770
what.cd/Tool (2001) - Lateralus [FLAC]	13 - Faaip De Oiad.flac	-5.209999	1.000000
what.cd/T.R.A.M. - Lingua Franca	01 Seven Ways Till Sunday.flac	-7.900002	1.000000
what.cd/T.R.A.M. - Lingua Franca	02 Consider Yourself Judged.flac	-8.500000	1.000000
what.cd/T.R.A.M. - Lingua Franca	03 Endeavor.flac	-7.559998	1.000000
what.cd/T.R.A.M. - Lingua Franca	04 HAAS Kicker.flac	-6.750000	1.000000
what.cd/T.R.A.M. - Lingua Franca	05 Hollywood Swinging.flac	-7.500000	1.000000
what.cd/T.R.A.M. - Lingua Franca	06 Inverted Ballad.flac	-3.129997	0.991516
what.cd/Transplants - Haunted Cities	01 - Not Today (feat. Sen Dog).flac	-10.680000	0.988556
what.cd/Transplants - Haunted Cities	02 - Apocalypse Now.flac	-9.910004	0.988556
what.cd/Transplants - Haunted Cities	03 - Gangsters and Thugs.flac	-9.040001	0.988586
what.cd/Transplants - Haunted Cities	04 - What I Can't Describe (feat. Boo-Yaa TRIBE).flac	-8.610001	0.989166
what.cd/Transplants - Haunted Cities	05 - Doomsday.flac	-10.000000	0.990448
what.cd/Transplants - Haunted Cities	06 - Killafornia (feat. B.Real).flac	-7.959999	0.988556
what.cd/Transplants - Haunted Cities	07 - American Guns.flac	-9.340004	0.988556
what.cd/Transplants - Haunted Cities	08 - Madness.flac	-10.139999	0.988556
what.cd/Transplants - Haunted Cities	09 - Hit the Fence.flac	-7.690002	0.988556
what.cd/Transplants - Haunted Cities	10 - Pay Any Price.flac	-9.559998	0.988953
what.cd/Transplants - Haunted Cities	11 - I Want It All.flac	-9.400002	0.988556
what.cd/Transplants - Haunted Cities	12 - Crash and Burn (feat. Rakaa).flac	-8.760002	0.988831
what.cd/Transplants - Transplants (Flac)	01 - Transplants - Romper Stomper.flac	-12.150002	1.000000
what.cd/Transplants - Transplants (Flac)	02 - Transplants - Tall Cans In The Air.flac	-11.550003	0.988708
what.cd/Transplants - Transplants (Flac)	03 - Transplants - D.J. D.J..flac	-9.750000	1.000000
what.cd/Transplants - Transplants (Flac)	04 - Transplants - Diamonds And Guns.flac	-10.300003	0.988739
what.cd/Transplants - Transplants (Flac)	05 - Transplants - Quick Death.flac	-11.160004	0.988739
what.cd/Transplants - Transplants (Flac)	06 - Transplants - Sad But True.flac	-10.500000	0.988739
what.cd/Transplants - Transplants (Flac)	07 - Transplants - Weigh On My Mind.flac	-8.660004	0.988739
what.cd/Transplants - Transplants (Flac)	08 - Transplants - One Seventeen.flac	-10.430000	0.988739
what.cd/Transplants - Transplants (Flac)	09 - Transplants - California Babylon.flac	-9.180000	0.988739
what.cd/Transplants - Transplants (Flac)	10 - Transplants - We Trusted You.flac	-9.669998	0.988739
what.cd/Transplants - Transplants (Flac)	11 - Transplants - D.R.E.A.M..flac	-9.080002	1.000000
what.cd/Transplants - Transplants (Flac)	12 - Transplants - Down In Oakland.flac	-9.019997	0.988739
what.cd/Two Door Cinema Club - 2010 - Tourist History [FLAC]	01 - Cigarettes In The Theatre.flac	-10.989998	1.000000
what.cd/Two Door Cinema Club - 2010 - Tourist History [FLAC]	02 - Come Back Home.flac	-10.889999	1.000000
what.cd/Two Door Cinema Club - 2010 - Tourist History [FLAC]	03 - Do You Want It All.flac	-10.599998	1.000000
what.cd/Two Door Cinema Club - 2010 - Tourist History [FLAC]	04 - This Is The Life.flac	-9.930000	1.000000
what.cd/Two Door Cinema Club - 2010 - Tourist History [FLAC]	05 - Something Good Can Work.flac	-9.769997	1.000000
what.cd/Two Door Cinema Club - 2010 - Tourist History [FLAC]	06 - I Can Talk.flac	-9.510002	1.000000
what.cd/Two Door Cinema Club - 2010 - Tourist History [FLAC]	07 - Undercover Martyn.flac	-10.050003	1.000000
what.cd/Two Door Cinema Club - 2010 - Tourist History [FLAC]	08 - What You Know.flac	-9.599998	1.000000
what.cd/Two Door Cinema Club - 2010 - Tourist History [FLAC]	09 - Eat That Up, It's Good For You.flac	-10.989998	1.000000
what.cd/Two Door Cinema Club - 2010 - Tourist History [FLAC]	10 - You're Not Stubborn.flac	-10.620003	1.000000
what.cd/VA - Jazz from the USSR (1987) [FLAC] (MFSL)	01 - Oleg Lundstrum Orchestra - Jive.flac	-6.269997	1.000000
what.cd/VA - Jazz from the USSR (1987) [FLAC] (MFSL)	02 - David Azarian Trio - My Favorite Things.flac	-1.290001	1.000000
what.cd/VA - Jazz from the USSR (1987) [FLAC] (MFSL)	03 - Retro Quartet - Sweet Sue, Just You.flac	-1.639999	0.972992
what.cd/VA - Jazz from the USSR (1987) [FLAC] (MFSL)	04 - Otar Magradze, Otar Sagaelidze - Tenderly.flac	1.630001	0.673798
what.cd/VA - Jazz from the USSR (1987) [FLAC] (MFSL)	05 - Rautio Musical College - Fascinating Rhythm.flac	-1.809998	0.976776
what.cd/VA - Jazz from the USSR (1987) [FLAC] (MFSL)	06 - Igor Butman Ensemble - Summer of '42.flac	-1.660004	0.877747
what.cd/VA - Jazz from the USSR (1987) [FLAC] (MFSL)	07 - Vladimir Voronetsky, Bladimir Gabai - Kusya.flac	7.459999	0.514221
what.cd/VA - Jazz from the USSR (1987) [FLAC] (MFSL)	08 - Allegro Jazz Ensemble - Song of Fading Flowers.flac	8.029999	0.459381
what.cd/VA - Jazz from the USSR (1987) [FLAC] (MFSL)	09 - Valery Mysovsky - Red Roses for a Blue Lady.flac	-1.070000	0.964752
what.cd/VA - Jazz from the USSR (1987) [FLAC] (MFSL)	10 - Nikolai Levinovsky - A Trip With Pleasant Company.flac	-4.959999	0.983063
what.cd/VA - Jazz from the USSR (1987) [FLAC] (MFSL)	11 - Leonid Chizhik - Sentimental Elegy.flac	-0.570000	0.926178
what.cd/Various Artists - 2006 - Forever Free- A Sublime Tribute Album {FLAC}	01 - No Use For A Name - Badfish.flac	-10.650002	0.999512
what.cd/Various Artists - 2006 - Forever Free- A Sublime Tribute Album {FLAC}	02 - Never Heard Of It - Same in the End.flac	-10.830002	1.000000
what.cd/Various Artists - 2006 - Forever Free- A Sublime Tribute Album {FLAC}	03 - Voodoo Glow Skulls - Caress Me Down.flac	-11.190002	1.000000
what.cd/Various Artists - 2006 - Forever Free- A Sublime Tribute Album {FLAC}	04 - UP SyNDROME - Doin' Time.flac	-11.419998	0.999481
what.cd/Various Artists - 2006 - Forever Free- A Sublime Tribute Album {FLAC}	05 - Guttermouth - April 29 1992.flac	-8.989998	0.999451
what.cd/Various Artists - 2006 - Forever Free- A Sublime Tribute Album {FLAC}	06 - If All Else Fails w, Max Gingold - Wrong Way.flac	-9.400002	0.999420
what.cd/Various Artists - 2006 - Forever Free- A Sublime Tribute Album {FLAC}	07 - The Toast - Pawn Shop.flac	-9.889999	0.999603
what.cd/Various Artists - 2006 - Forever Free- A Sublime Tribute Album {FLAC}	08 - Ozomatli - Ebin.flac	-9.650002	1.000000
what.cd/Various Artists - 2006 - Forever Free- A Sublime Tribute Album {FLAC}	09 - The Forces Of Evil - Ball & Chain.flac	-9.739998	0.999481
what.cd/Various Artists - 2006 - Forever Free- A Sublime Tribute Album {FLAC}	10 - The Skeletones - Seed.flac	-10.570000	0.999634
what.cd/Various Artists - 2006 - Forever Free- A Sublime Tribute Album {FLAC}	11 - Ballyhoo! - 40 Oz. To Freedom.flac	-10.080002	0.999420
what.cd/Various Artists - 2006 - Forever Free- A Sublime Tribute Album {FLAC}	12 - The Line - Pool Shark.flac	-10.570000	0.999756
what.cd/Various Artists - 2006 - Forever Free- A Sublime Tribute Album {FLAC}	13 - 1208 - Boss DJ.flac	-10.389999	0.999512
what.cd/Various Artists - 2006 - Forever Free- A Sublime Tribute Album {FLAC}	14 - If All Else Fails - Forever Free [Bonus Track].flac	-7.840004	0.999359
what.cd/Velcra - Between Force and Fate (2005) [Flac]	01 War Is Peace.flac	-9.820000	0.952362
what.cd/Velcra - Between Force and Fate (2005) [Flac]	02 Water Is Getting High.flac	-10.070000	0.989288
what.cd/Velcra - Between Force and Fate (2005) [Flac]	03 Our Will Against Their Will.flac	-10.620003	0.989349
what.cd/Velcra - Between Force and Fate (2005) [Flac]	04 For My Loneliness I Pay.flac	-11.050003	1.000000
what.cd/Velcra - Between Force and Fate (2005) [Flac]	05 Memory Loss.flac	-10.919998	0.989288
what.cd/Velcra - Between Force and Fate (2005) [Flac]	06 I Can't Tell The Sun From The Moon.flac	-10.550003	0.989471
what.cd/Velcra - Between Force and Fate (2005) [Flac]	07 The Bong Song.flac	-8.970001	1.000000
what.cd/Velcra - Between Force and Fate (2005) [Flac]	08 Corruption.flac	-9.919998	1.000000
what.cd/Velcra - Between Force and Fate (2005) [Flac]	09 Hotel Alcatraz.flac	-10.059998	0.989258
what.cd/Velcra - Between Force and Fate (2005) [Flac]	10 Wonderland Sunrise.flac	-9.110001	0.989288
what.cd/Velcra - Consequences of Disobedience (2002) [Flac]	01 My Law.flac	-9.620003	0.977295
what.cd/Velcra - Consequences of Disobedience (2002) [Flac]	02 Big Brother.flac	-8.550003	0.977295
what.cd/Velcra - Consequences of Disobedience (2002) [Flac]	03 Shine for Me.flac	-9.129997	0.977295
what.cd/Velcra - Consequences of Disobedience (2002) [Flac]	04 Not Against Me.flac	-9.269997	0.988556
what.cd/Velcra - Consequences of Disobedience (2002) [Flac]	05 Solar Red.flac	-8.459999	0.988586
what.cd/Velcra - Consequences of Disobedience (2002) [Flac]	06 Tension.flac	-8.790001	0.988586
what.cd/Velcra - Consequences of Disobedience (2002) [Flac]	07 Removed.flac	-8.769997	0.988586
what.cd/Velcra - Consequences of Disobedience (2002) [Flac]	08 Can't Stop Fighting.flac	-9.220001	0.988586
what.cd/Velcra - Consequences of Disobedience (2002) [Flac]	09 Made to Fail.flac	-9.110001	0.977295
what.cd/Velcra - Consequences of Disobedience (2002) [Flac]	10 Test Animals.flac	-8.760002	0.977295
what.cd/Walk Among Us	01 - 20 Eyes.flac	-2.989998	0.709503
what.cd/Walk Among Us	02 - I Turned Into A Martian.flac	-3.760002	0.902313
what.cd/Walk Among Us	03 - All Hell Breaks Loose.flac	-2.980003	0.716888
what.cd/Walk Among Us	04 - Vampira.flac	-3.230003	0.814484
what.cd/Walk Among Us	05 - Nike A Go Go.flac	-3.709999	0.824677
what.cd/Walk Among Us	06 - Hatebreeders.flac	-3.580002	0.802246
what.cd/Walk Among Us	07 - Mommy Can I Go Out & Kill Tonight (Live).flac	-2.370003	0.729340
what.cd/Walk Among Us	08 - Night Of The Living Dead.flac	-3.419998	0.814514
what.cd/Walk Among Us	09 - Skulls.flac	-3.440002	0.734497
what.cd/Walk Among Us	10 - Violent World.flac	-2.949997	0.752289
what.cd/Walk Among Us	11 - Devils Whorehouse.flac	-3.120003	0.926392
what.cd/Walk Among Us	12 - Astro Zombies.flac	-3.410004	0.807068
what.cd/Walk Among Us	13 - Braineaters.flac	-3.760002	0.930878
what.cd/White Lies - 2011 - Ritual [FLAC]	01 - Is Love.flac	-8.349998	0.980682
what.cd/White Lies - 2011 - Ritual [FLAC]	02 - Strangers.flac	-8.660004	0.980682
what.cd/White Lies - 2011 - Ritual [FLAC]	03 - Bigger Than Us.flac	-9.650002	0.980682
what.cd/White Lies - 2011 - Ritual [FLAC]	04 - Peace & Quiet.flac	-8.680000	0.980682
what.cd/White Lies - 2011 - Ritual [FLAC]	05 - Streetlights.flac	-8.559998	0.980682
what.cd/White Lies - 2011 - Ritual [FLAC]	06 - Holy Ghost.flac	-8.279999	0.980682
what.cd/White Lies - 2011 - Ritual [FLAC]	07 - Turn The Bells.flac	-8.730003	0.980682
what.cd/White Lies - 2011 - Ritual [FLAC]	08 - The Power & The Glory.flac	-6.260002	0.980682
what.cd/White Lies - 2011 - Ritual [FLAC]	09 - Bad Love.flac	-8.650002	0.980682
what.cd/White Lies - 2011 - Ritual [FLAC]	10 - Come Down.flac	-7.059998	0.980682
what.cd/White Lies - To Lose My Life	01 - Death.flac	-10.669998	0.999695
what.cd/White Lies - To Lose My Life	02 - To Lose My Life.flac	-10.800003	0.999634
what.cd/White Lies - To Lose My Life	03 - A Place To Hide.flac	-10.290001	0.999664
what.cd/White Lies - To Lose My Life	04 - Fifty On Our Foreheads.flac	-9.230003	0.960632
what.cd/White Lies - To Lose My Life	05 - Unfinished Business.flac	-9.599998	0.984314
what.cd/White Lies - To Lose My Life	06 - E . S . T ..flac	-9.550003	0.999634
what.cd/White Lies - To Lose My Life	07 - From The Stars.flac	-10.290001	0.999664
what.cd/White Lies - To Lose My Life	08 - Farewell To The Fairground.flac	-9.949997	0.998108
what.cd/White Lies - To Lose My Life	09 - Nothing To Give.flac	-9.959999	0.999634
what.cd/White Lies - To Lose My Life	10 - The Price Of Love.flac	-9.449997	0.999695
what.cd/White Zombie - La Sexorcisto; Devil Music Vol. 1	01 - Welcome To Planet Motherfucker,Psychoholic Slag.flac	-2.650002	1.000000
what.cd/White Zombie - La Sexorcisto; Devil Music Vol. 1	02 - Knuckle Duster (Radio 1-A).flac	7.770000	0.218658
what.cd/White Zombie - La Sexorcisto; Devil Music Vol. 1	03 - Thunder Kiss '65.flac	-4.709999	1.000000
what.cd/White Zombie - La Sexorcisto; Devil Music Vol. 1	04 - Black Sunshine.flac	-3.809998	1.000000
what.cd/White Zombie - La Sexorcisto; Devil Music Vol. 1	05 - Soul-Crusher.flac	-3.900002	1.000000
what.cd/White Zombie - La Sexorcisto; Devil Music Vol. 1	06 - Cosmic Monsters Inc..flac	-2.699997	1.000000
what.cd/White Zombie - La Sexorcisto; Devil Music Vol. 1	07 - Spiderbaby (Yeah-Yeah-Yeah).flac	-3.070000	1.000000
what.cd/White Zombie - La Sexorcisto; Devil Music Vol. 1	08 - I Am Legend.flac	-4.000000	0.977234
what.cd/White Zombie - La Sexorcisto; Devil Music Vol. 1	09 - Knuckle Duster (Radio 2-B).flac	10.650002	0.132416
what.cd/White Zombie - La Sexorcisto; Devil Music Vol. 1	10 - Thrust!.flac	-3.279999	0.977234
what.cd/White Zombie - La Sexorcisto; Devil Music Vol. 1	11 - One Big Crunch.flac	7.689999	0.515869
what.cd/White Zombie - La Sexorcisto; Devil Music Vol. 1	12 - Grindhouse (A Go-Go).flac	-3.290001	0.977234
what.cd/White Zombie - La Sexorcisto; Devil Music Vol. 1	13 - Starface.flac	-3.809998	0.977234
what.cd/White Zombie - La Sexorcisto; Devil Music Vol. 1	14 - Warp Asylum.flac	-2.639999	0.977234
what.cd/WWIII	01 - WWIII.flac	-8.739998	0.987518
what.cd/WWIII	02 - From Here On Out.flac	-8.750000	0.999969
what.cd/WWIII	03 - Blackball.flac	-7.680000	0.987518
what.cd/WWIII	04 - Jihad.flac	-7.540001	0.999969
what.cd/WWIII	05 - Last Things.flac	-8.900002	0.987518
what.cd/WWIII	06 - Pitty For The Pious.flac	-9.620003	0.999969
what.cd/WWIII	07 - Stars And Stripes.flac	-7.440002	0.999969
what.cd/WWIII	08 - Bullets,Bombs & Bigotry.flac	-8.029999	0.999969
what.cd/WWIII	09 - Moron.flac	-7.590004	0.999969
what.cd/WWIII	10 - Revenge.flac	-7.889999	0.998962
what.cd/WWIII	11 - Intro.flac	-8.400002	0.998932
what.cd/Yanka - Sold! (1989) FLAC	Yanka - 01 - For the darkest day.flac	-6.870003	0.794464
what.cd/Yanka - Sold! (1989) FLAC	Yanka - 02 - We are knee deep.flac	-4.769997	0.794250
what.cd/Yanka - Sold! (1989) FLAC	Yanka - 03 - Decorations.flac	-6.199997	0.794342
what.cd/Yanka - Sold! (1989) FLAC	Yanka - 04 - Special reason.flac	-3.860001	0.794403
what.cd/Yanka - Sold! (1989) FLAC	Yanka - 05 - Half a kingdom.flac	-0.629997	0.748962
what.cd/Yanka - Sold! (1989) FLAC	Yanka - 06 - Watch out!.flac	-2.239998	0.794189
what.cd/Yanka - Sold! (1989) FLAC	Yanka - 07 - Bear goes hunting.flac	-5.660004	0.794006
what.cd/Yanka - Sold! (1989) FLAC	Yanka - 08 - My grief is light.flac	-2.379997	0.891205
what.cd/Yanka - Sold! (1989) FLAC	Yanka - 09 - I turn to a bitch.flac	-5.190002	0.891205
what.cd/Yanka - Sold! (1989) FLAC	Yanka - 10 - Riga.flac	-4.330002	0.891235
what.cd/Yanka - Sold! (1989) FLAC	Yanka - 11 - Because of big smarts.flac	-4.680000	0.891235
what.cd/Yanka - Sold! (1989) FLAC	Yanka - 12 - Along the rail tracks.flac	-3.590004	0.891235
what.cd/Yanka - Sold! (1989) FLAC	Yanka - 13 - Reggae.flac	-3.440002	0.891235
what.cd/Yanka - Sold! (1989) FLAC	Yanka - 14 - Flocks are flying.flac	1.169998	0.891235
what.cd/Yanka - Sold! (1989) FLAC	Yanka - 15 - Burn baby burn!.flac	-3.860001	0.891235
what.cd/Yanka - Sold! (1989) FLAC	Yanka - 16 - Go home.flac	-5.459999	0.891235
what.cd/Yanka - Sold! (1989) FLAC	Yanka - 17 - With Cross and zero.flac	-5.629997	0.891205
what.cd/Yanka - Sold! (1989) FLAC	Yanka - 18 - Sold.flac	-5.000000	0.891235
what.cd/Yanka - Sold! (1989) FLAC	Yanka - 19 - Outcasts.flac	-6.840004	0.891235
what.cd/Youngblood Brass Band - 2006 - Is That A Riot [FLAC]	01 - March.flac	-9.160004	0.988678
what.cd/Youngblood Brass Band - 2006 - Is That A Riot [FLAC]	02 - Nuclear Summer.flac	-11.510002	0.988708
what.cd/Youngblood Brass Band - 2006 - Is That A Riot [FLAC]	03 - Waiver.flac	-7.400002	0.988617
what.cd/Youngblood Brass Band - 2006 - Is That A Riot [FLAC]	04 - But You Can't Run.flac	-8.959999	0.998993
what.cd/Youngblood Brass Band - 2006 - Is That A Riot [FLAC]	05 - Pala Minima.flac	-8.070000	0.965088
what.cd/Youngblood Brass Band - 2006 - Is That A Riot [FLAC]	06 - JEM.flac	-6.000000	0.988647
what.cd/Youngblood Brass Band - 2006 - Is That A Riot [FLAC]	07 - Dead Man Stomping.flac	-8.790001	0.988678
what.cd/Youngblood Brass Band - 2006 - Is That A Riot [FLAC]	08 - Ake.flac	0.980000	0.988617
what.cd/Youngblood Brass Band - 2006 - Is That A Riot [FLAC]	09 - Is That A Riot.flac	-8.599998	0.988678
what.cd/Youngblood Brass Band - 2006 - Is That A Riot [FLAC]	10 - Bone Refinery.flac	-3.489998	0.988708
what.cd/Youngblood Brass Band - 2006 - Is That A Riot [FLAC]	11 - Sell Me More Or Like You Just Don't Care.flac	-8.209999	0.983368
what.cd/Youngblood Brass Band - 2006 - Is That A Riot [FLAC]	12 - Will.flac	6.639999	0.796967
what.cd/Youngblood Brass Band - 2006 - Is That A Riot [FLAC]	13 - Thanks.flac	-8.750000	0.988678
what.cd/ZZ Top - Eliminator (1983)  [FLAC]	01 - Gimme All Your Lovin'.flac	-7.040001	0.993835
what.cd/ZZ Top - Eliminator (1983)  [FLAC]	02 - Got Me Under Pressure.flac	-7.389999	0.996460
what.cd/ZZ Top - Eliminator (1983)  [FLAC]	03 - Sharp Dressed Man.flac	-7.389999	0.998352
what.cd/ZZ Top - Eliminator (1983)  [FLAC]	04 - I Need You Tonight.flac	-5.559998	0.993896
what.cd/ZZ Top - Eliminator (1983)  [FLAC]	05 - I Got the Six.flac	-6.870003	0.989136
what.cd/ZZ Top - Eliminator (1983)  [FLAC]	06 - Legs.flac	-7.500000	0.964996
what.cd/ZZ Top - Eliminator (1983)  [FLAC]	07 - Thug.flac	-5.459999	0.996246
what.cd/ZZ Top - Eliminator (1983)  [FLAC]	08 - TV Dinners.flac	-5.930000	0.997375
what.cd/ZZ Top - Eliminator (1983)  [FLAC]	09 - Dirty Dog.flac	-5.930000	0.997772
what.cd/ZZ Top - Eliminator (1983)  [FLAC]	10 - If I Could Only Flag Her Down.flac	-4.760002	0.997620
what.cd/ZZ Top - Eliminator (1983)  [FLAC]	11 - Bad Girl.flac	-6.730003	0.996490
what.cd/ZZ Top - Tres Hombres [FLAC]	01 - Waitin' for the Bus.flac	-1.849998	0.955017
what.cd/ZZ Top - Tres Hombres [FLAC]	02 - Jesus Just Left Chicago.flac	-2.080002	0.954987
what.cd/ZZ Top - Tres Hombres [FLAC]	03 - Beer Drinkers & Hell Raisers.flac	-1.959999	0.954987
what.cd/ZZ Top - Tres Hombres [FLAC]	04 - Master of Sparks.flac	-1.489998	0.954407
what.cd/ZZ Top - Tres Hombres [FLAC]	05 - Hot, Blue and Righteous.flac	0.029999	0.955017
what.cd/ZZ Top - Tres Hombres [FLAC]	06 - Move Me on Down the Line.flac	-2.370003	0.955017
what.cd/ZZ Top - Tres Hombres [FLAC]	07 - Precious and Grace.flac	-2.150002	0.954437
what.cd/ZZ Top - Tres Hombres [FLAC]	08 - La Grange.flac	-1.529999	0.954987
what.cd/ZZ Top - Tres Hombres [FLAC]	09 - Shiek.flac	-1.459999	0.954926
what.cd/ZZ Top - Tres Hombres [FLAC]	10 - Have You Heard .flac	-2.360001	0.955017
what.cd/Король и шут - 2001 - Герои и Злодеи [FLAC]	01 Дед на свадьбе.flac	-5.720001	0.995605
what.cd/Король и шут - 2001 - Герои и Злодеи [FLAC]	02 Запрет отца.flac	-4.050003	0.979523
what.cd/Король и шут - 2001 - Герои и Злодеи [FLAC]	03 Кузнец.flac	-4.250000	0.978516
what.cd/Король и шут - 2001 - Герои и Злодеи [FLAC]	04 Разговор с гоблином.flac	-7.230003	0.986450
what.cd/Король и шут - 2001 - Герои и Злодеи [FLAC]	05 Вор, граф и графиня.flac	-5.500000	0.977966
what.cd/Король и шут - 2001 - Герои и Злодеи [FLAC]	06 Что видел малыш.flac	-7.010002	0.976257
what.cd/Король и шут - 2001 - Герои и Злодеи [FLAC]	07 Невеста палача.flac	-5.099998	0.987610
what.cd/Король и шут - 2001 - Герои и Злодеи [FLAC]	08 Мастер приглашает в гости.flac	-4.940002	0.969299
what.cd/Король и шут - 2001 - Герои и Злодеи [FLAC]	09 Бродяга и старик.flac	-4.500000	0.986084
what.cd/Король и шут - 2001 - Герои и Злодеи [FLAC]	10 Смерть халдея.flac	-5.559998	0.999969
what.cd/Король и шут - 2001 - Герои и Злодеи [FLAC]	11 Помнят с горечью древляне.flac	-4.290001	0.967468
what.cd/Король и шут - 2001 - Герои и Злодеи [FLAC]	12 Про Ивана.flac	-4.760002	0.982025
what.cd/Король и шут - 2001 - Герои и Злодеи [FLAC]	13 Воспоминания о былой любви.flac	-6.239998	0.984680
what.cd/Король и шут - 2001 - Герои и Злодеи [FLAC]	14 Разбойники (Live).flac	-9.540001	0.999237
what.cd/Король и шут - 2001 - Герои и Злодеи [FLAC]	15 Паника в селе (Live).flac	-8.550003	0.951691
what.cd/Король и Шут - Бунт на корабле (2004) FLAC	01 - Хардкор по-русски.flac	-10.379997	0.981750
what.cd/Король и Шут - Бунт на корабле (2004) FLAC	02 - Волшебный глаз старика Алонса.flac	-9.889999	0.981750
what.cd/Король и Шут - Бунт на корабле (2004) FLAC	03 - Исповедь вампира.flac	-10.059998	0.981750
what.cd/Король и Шут - Бунт на корабле (2004) FLAC	04 - Месть Гарри.flac	-9.980003	0.981750
what.cd/Король и Шут - Бунт на корабле (2004) FLAC	05 - Северный флот.flac	-9.059998	0.981750
what.cd/Король и Шут - Бунт на корабле (2004) FLAC	06 - Идол.flac	-9.510002	0.981750
what.cd/Король и Шут - Бунт на корабле (2004) FLAC	07 - Бунт на корабле!.flac	-9.820000	0.981750
what.cd/Король и Шут - Бунт на корабле (2004) FLAC	08 - Хороший пират - Мертвый пират.flac	-8.930000	0.981750
what.cd/Король и Шут - Бунт на корабле (2004) FLAC	09 - Рыцарь.flac	-9.550003	0.981750
what.cd/Король и Шут - Бунт на корабле (2004) FLAC	10 - Звонок.flac	-9.239998	0.981750
what.cd/Король и Шут - Бунт на корабле (2004) FLAC	11 - Инквизитор.flac	-9.669998	0.981750
what.cd/Король и Шут - Бунт на корабле (2004) FLAC	12 - Задира и солдат.flac	-10.059998	0.981750
what.cd/Король и Шут - Бунт на корабле (2004) FLAC	13 - Раненый воин.flac	-9.199997	0.981750
what.cd/Король и Шут - Бунт на корабле (2004) FLAC	14 - Муха - маленькая птичка.flac	-5.730003	0.963104
what.cd/Король и Шут - Бунт на корабле (2004) FLAC	15 - Хозяин леса.flac	-9.180000	0.981750
what.cd/Крупский сотоварищи - Чужие песни и несколько своих (1997, flac)	01. Я остаюсь.flac	-6.410004	0.935242
what.cd/Крупский сотоварищи - Чужие песни и несколько своих (1997, flac)	02. Танго.flac	-6.150002	0.934601
what.cd/Крупский сотоварищи - Чужие песни и несколько своих (1997, flac)	03. Игрок.flac	-6.300003	0.929901
what.cd/Крупский сотоварищи - Чужие песни и несколько своих (1997, flac)	04. Про любовь.flac	-4.440002	0.913971
what.cd/Крупский сотоварищи - Чужие песни и несколько своих (1997, flac)	05. Вальс.flac	-5.709999	0.822876
what.cd/Крупский сотоварищи - Чужие песни и несколько своих (1997, flac)	06. Dance Me To The End Of Love.flac	-2.879997	0.924622
what.cd/Крупский сотоварищи - Чужие песни и несколько своих (1997, flac)	07. Дорожная.flac	-6.730003	0.921936
what.cd/Крупский сотоварищи - Чужие песни и несколько своих (1997, flac)	08. Аве Цезарь.flac	-5.639999	0.926422
what.cd/Крупский сотоварищи - Чужие песни и несколько своих (1997, flac)	09. Долго будем ожидать.flac	-6.230003	0.927979
what.cd/Крупский сотоварищи - Чужие песни и несколько своих (1997, flac)	10. Soli.flac	-6.040001	0.925385
what.cd/Крупский сотоварищи - Чужие песни и несколько своих (1997, flac)	11. Пельменная.flac	-4.930000	0.889740
what.cd/Последние Танки в Париже - 2084 (2004, flac)	01. Звёзды.flac	-8.919998	0.999176
what.cd/Последние Танки в Париже - 2084 (2004, flac)	02. Революция!.flac	-8.769997	0.999176
what.cd/Последние Танки в Париже - 2084 (2004, flac)	03. Трава-Любовь.flac	-8.430000	0.999176
what.cd/Последние Танки в Париже - 2084 (2004, flac)	04. Новые календари.flac	-7.639999	0.999176
what.cd/Последние Танки в Париже - 2084 (2004, flac)	05. Улицы в огне.flac	-8.690002	0.999176
what.cd/Последние Танки в Париже - 2084 (2004, flac)	06. Панк-Рок.flac	-7.309998	0.999176
what.cd/Последние Танки в Париже - 2084 (2004, flac)	07. Обратный билет.flac	-7.440002	0.999176
what.cd/Последние Танки в Париже - 2084 (2004, flac)	08. График.flac	-8.510002	0.999176
what.cd/Последние Танки в Париже - 2084 (2004, flac)	09. Игрушки.flac	-7.370003	0.999176
what.cd/Последние Танки в Париже - 2084 (2004, flac)	10. x11 сентября.flac	-7.050003	0.999146
what.cd/Последние Танки в Париже - 2084 (2004, flac)	11. Винстон.flac	-7.639999	0.999176
what.cd/Последние Танки в Париже - 2084 (2004, flac)	12. Королева Гашиша.flac	-8.590004	0.999176
what.cd/Последние Танки в Париже - 2084 (2004, flac)	13. Если сейчас начнётся дождь.flac	-8.650002	0.999176
what.cd/Последние Танки в Париже - 2084 (2004, flac)	14. Здесь или сейчас.flac	-8.190002	0.999176
what.cd/Последние Танки в Париже - 2084 (2004, flac)	15. В руки нож.flac	-7.650002	0.999176
what.cd/Последние Танки в Париже - 2084 (2004, flac)	16. Дискотека.flac	-8.260002	0.999176
what.cd/Психея - 2004 - Психея (1st Edition) (FLAC)	01 - Поколение Ты.flac	-11.650002	0.999176
what.cd/Психея - 2004 - Психея (1st Edition) (FLAC)	02 - Лезвием Сердца.flac	-10.720001	0.999176
what.cd/Психея - 2004 - Психея (1st Edition) (FLAC)	03 - Убей Мента.flac	-11.519997	0.999207
what.cd/Психея - 2004 - Психея (1st Edition) (FLAC)	04 - От А до Я....flac	-10.639999	0.999176
what.cd/Психея - 2004 - Психея (1st Edition) (FLAC)	05 - Люди Врут Тебе, Ты Врёшь Людям, но Ещё Чаще Ты Врёшь Сам Себе.flac	-10.830002	0.999176
what.cd/Психея - 2004 - Психея (1st Edition) (FLAC)	06 - Э].flac	-12.090004	0.999176
what.cd/Психея - 2004 - Психея (1st Edition) (FLAC)	07 - Рефлекс Хичкока.flac	-11.389999	0.999176
what.cd/Психея - 2004 - Психея (1st Edition) (FLAC)	08 - Клон Future.flac	-11.139999	0.999176
what.cd/Психея - 2004 - Психея (1st Edition) (FLAC)	09 - Если Ты Меня Слышишь....flac	-11.269997	0.999176
what.cd/Психея - 2004 - Психея (1st Edition) (FLAC)	10 - ШШШюю.flac	-10.980003	0.999176
what.cd/Психея - 2004 - Психея (1st Edition) (FLAC)	11 - Миф о Розовых Деликатесах.flac	-12.250000	0.999207
what.cd/Психея - 2004 - Психея (1st Edition) (FLAC)	12 - --).flac	2.980000	0.811371
what.cd/Психея - Дневники Одиночки (2009) [FLAC]	01 Эти Дни.flac	-9.000000	0.994293
what.cd/Психея - Дневники Одиночки (2009) [FLAC]	02 В Лицо.flac	-8.800003	0.994293
what.cd/Психея - Дневники Одиночки (2009) [FLAC]	03 Наблюдатель за Наблюдателями.flac	-8.330002	0.994293
what.cd/Психея - Дневники Одиночки (2009) [FLAC]	04 Очевидное Зло.flac	-9.629997	0.994293
what.cd/Психея - Дневники Одиночки (2009) [FLAC]	05 Север Времени.flac	-8.739998	0.994293
what.cd/Психея - Дневники Одиночки (2009) [FLAC]	06 Поцелуи Мечты.flac	-9.300003	0.994293
what.cd/Психея - Дневники Одиночки (2009) [FLAC]	07 Еретики.flac	-10.220001	0.994324
what.cd/Психея - Дневники Одиночки (2009) [FLAC]	08 Ориентир.flac	-9.370003	0.994293
what.cd/Психея - Дневники Одиночки (2009) [FLAC]	09 Увядание.flac	-9.209999	0.994293
what.cd/Психея - Дневники Одиночки (2009) [FLAC]	10 Цвета Индиго.flac	-9.940002	0.994293
what.cd/Химера - 1996 - Zudwa-Dwa [FLAC]	01 - Пётр.flac	-1.529999	0.647980
what.cd/Химера - 1996 - Zudwa-Dwa [FLAC]	02 - Ай-лю-ли.flac	-3.739998	0.999969
what.cd/Химера - 1996 - Zudwa-Dwa [FLAC]	03 - Зайцы.flac	-2.279999	0.750610
what.cd/Химера - 1996 - Zudwa-Dwa [FLAC]	04 - Свистки.flac	1.090000	0.457886
what.cd/Химера - 1996 - Zudwa-Dwa [FLAC]	05 - Дождик.flac	2.660000	0.473236
what.cd/Химера - 1996 - Zudwa-Dwa [FLAC]	06 - Вороны.flac	-2.110001	0.785278
what.cd/Химера - 1996 - Zudwa-Dwa [FLAC]	07 - Графин.flac	1.759998	0.599945
what.cd/Химера - 1996 - Zudwa-Dwa [FLAC]	08 - Лошадь.flac	-1.860001	0.863495
what.cd/Химера - 1996 - Zudwa-Dwa [FLAC]	09 - Челленджер.flac	-2.580002	0.896301
what.cd/Химера - 1996 - Zudwa-Dwa [FLAC]	10 - Узлы.flac	-3.529999	0.904388
what.cd/Химера - 1996 - Zudwa-Dwa [FLAC]	11 - Счастливого пути.flac	-1.209999	0.844574
what.cd/Химера - 1996 - Zudwa-Dwa [FLAC]	12 - Сюзанна.flac	-0.870003	0.915894
what.cd/Химера - 1996 - Zudwa-Dwa [FLAC]	13 - Фантазёры.flac	-2.290001	0.908813
what.cd/Химера - 1996 - Zudwa-Dwa [FLAC]	14 - Bonus Sound.flac	13.730000	0.289642
what.cd/Химера - 1996 - Zudwa-Dwa [FLAC]	15 - Клоп (Remix).flac	-6.669998	0.781708
what.cd/Элизиум - Космос (2003) [FLAC]	01 - Словно Будда.flac	-7.059998	0.930206
what.cd/Элизиум - Космос (2003) [FLAC]	02 - Куда теряется мечта.flac	-6.989998	0.796417
what.cd/Элизиум - Космос (2003) [FLAC]	03 - Расскажите, птицы.flac	-6.639999	0.805481
what.cd/Элизиум - Космос (2003) [FLAC]	04 - Время не ждёт.flac	-6.040001	0.787689
what.cd/Элизиум - Космос (2003) [FLAC]	05 - Ослепительный мир.flac	-6.830002	0.822968
what.cd/Элизиум - Космос (2003) [FLAC]	06 - Солнце.flac	-6.400002	0.799896
what.cd/Элизиум - Космос (2003) [FLAC]	07 - Космос.flac	-6.459999	0.858795
what.cd/Элизиум - Космос (2003) [FLAC]	08 - Колесо Сансары.flac	-7.250000	0.856354
what.cd/Элизиум - Космос (2003) [FLAC]	09 - Южная.flac	-6.529999	0.798004
what.cd/Элизиум - Космос (2003) [FLAC]	10 - Секунды - года.flac	-6.879997	0.810120
what.cd/Элизиум - Космос (2003) [FLAC]	11 - Интересно.flac	-6.949997	0.946106
what.cd/Элизиум - Космос (2003) [FLAC]	12 - Супер робот.flac	-6.540001	0.797516
what.cd/Элизиум - Космос (2003) [FLAC]	13 - До завтра!.flac	-6.580002	0.744873
bandcamp.com/The Middle Volga Social Club - 2016 - Give Me the Way	01 - Chevy-Niva.flac	-7.940002	0.981812
bandcamp.com/The Middle Volga Social Club - 2016 - Give Me the Way	02 - Poison.flac	-6.650002	0.971405
bandcamp.com/The Middle Volga Social Club - 2016 - Give Me the Way	03 - Anastasia Fedorovskaya.flac	-4.739998	0.968109
bandcamp.com/The Middle Volga Social Club - 2016 - Give Me the Way	04 - Give me the way.flac	-9.129997	0.983521
bandcamp.com/The Middle Volga Social Club - 2016 - Give Me the Way	05 - Bus paradise.flac	-6.459999	0.987579
bandcamp.com/The Middle Volga Social Club - 2016 - Give Me the Way	06 - Steve McQueen.flac	-8.510002	0.985016
bandcamp.com/The Middle Volga Social Club - 2016 - Give Me the Way	07 - Emperor.flac	-7.410004	0.983734
bandcamp.com/The Middle Volga Social Club - 2016 - Give Me the Way	08 - Jeremy Clarkson.flac	-7.330002	0.973083
bandcamp.com/The Middle Volga Social Club - 2016 - Give Me the Way	09 - She who runs on the waves.flac	-6.279999	0.971130
bandcamp.com/El Mashe - 2016 - El Mashe	01 - 8 бит.flac	-8.970001	0.998962
bandcamp.com/El Mashe - 2016 - El Mashe	02 - Я в падере дунул (feat. Лёня Кравчук).flac	-9.970001	0.998871
bandcamp.com/El Mashe - 2016 - El Mashe	03 - Монопенисуально.flac	-9.760002	0.998962
bandcamp.com/El Mashe - 2016 - El Mashe	04 - Распиздяй.flac	-9.690002	0.991943
bandcamp.com/El Mashe - 2016 - El Mashe	05 - Love Is... (Тыры-пыры).flac	-9.790001	0.998962
bandcamp.com/El Mashe - 2016 - El Mashe	06 - Из кала (Skit).flac	-9.800003	1.000000
bandcamp.com/El Mashe - 2016 - El Mashe	07 - Ипотека.flac	-9.830002	0.998260
bandcamp.com/El Mashe - 2016 - El Mashe	08 - Грей Сашу! (feat. Ритос).flac	-9.840004	0.994324
bandcamp.com/El Mashe - 2016 - El Mashe	09 - Пацыки-диджики.flac	-10.360001	0.998871
bandcamp.com/El Mashe - 2016 - El Mashe	10 - Учи ин яз (feat. Лумумба).flac	-9.250000	0.998962
bandcamp.com/El Mashe - 2016 - El Mashe	11 - Нокия 3310.flac	-9.180000	0.983795
bandcamp.com/El Mashe - 2016 - El Mashe	12 - Грустная песня рэпера из провинции.flac	-7.840004	0.998962
bandcamp.com/El Mashe - 2016 - El Mashe	13 - От винта! (Skit).flac	-12.099998	1.000000
bandcamp.com/El Mashe - 2016 - El Mashe	14 - Фуфлоу (feat. Mr.Gooch).flac	-9.980003	0.998871
bandcamp.com/El Mashe - 2016 - El Mashe	15 - Безработный.flac	-9.269997	0.998962
bandcamp.com/El Mashe - 2016 - El Mashe	16 - Навали на вэлум!.flac	-10.320000	0.998962
bandcamp.com/El Mashe - 2016 - El Mashe	17 - Шекогали (Bonus Track).flac	-10.660004	0.999084
soundcloud.com/Коля Маню - 2016 - Baadmantown	01 - Каждый день.flac	-6.370003	0.881042
soundcloud.com/Коля Маню - 2016 - Baadmantown	02 - Солнечный.flac	-7.849998	0.891266
soundcloud.com/Коля Маню - 2016 - Baadmantown	03 - Больше огня.flac	-6.550003	0.881042
soundcloud.com/Коля Маню - 2016 - Baadmantown	04 - Всегда готов.flac	-6.870003	0.870972
soundcloud.com/Коля Маню - 2016 - Baadmantown	05 - Процветай.flac	-5.300003	0.891266
soundcloud.com/Коля Маню - 2016 - Baadmantown	06 - Раггамаффин славься.flac	-9.090004	0.999878
soundcloud.com/Коля Маню - 2016 - Baadmantown	07 - Самая самая.flac	-8.529999	0.891266
soundcloud.com/Коля Маню - 2016 - Baadmantown	08 - Baadmantown.flac	-8.389999	0.891266
soundcloud.com/Коля Маню - 2016 - Baadmantown	09 - Океан.flac	-6.379997	0.891266
soundcloud.com/Коля Маню - 2016 - Baadmantown	10 - За мир.flac	-6.269997	0.966064
soundcloud.com/Коля Маню - 2016 - Baadmantown	11 - Скептик.flac	-7.050003	0.966034
soundcloud.com/Коля Маню - 2016 - Baadmantown	12 - Танцуй.flac	-8.769997	0.933258
soundcloud.com/Коля Маню - 2016 - Baadmantown	13 - James Bong.flac	-8.820000	1.000000
soundcloud.com/Коля Маню - 2016 - Baadmantown	14 - Энергия.flac	-8.230003	0.970917
\.

UPDATE track
SET
    rg_peak = track_rg.rg_peak,
    rg_gain = track_rg.rg_gain
FROM album, track_rg
WHERE (
    (
        album.rg_peak IS NULL
        OR album.rg_gain IS NULL
    ) OR album.id IN ('637bf5e0-7681-4d7a-9855-39f16df7cbe4', '2f1c50ec-6e81-4c65-8be8-c60bd28e9ad3')
)
AND album.path = track_rg.album_path
AND track.path = track_rg.path;

UPDATE album
SET
    rg_peak = album_rg.rg_peak,
    rg_gain = album_rg.rg_gain
FROM album_rg
WHERE (
    (
        album.rg_peak IS NULL
        OR album.rg_gain IS NULL
    ) OR album.id IN ('637bf5e0-7681-4d7a-9855-39f16df7cbe4', '2f1c50ec-6e81-4c65-8be8-c60bd28e9ad3')
) AND album.path = album_rg.path;

UPDATE track
SET
    rg_peak = 0,
    rg_gain = 0
FROM album
WHERE (
    album.rg_peak IS NULL
    OR album.rg_gain IS NULL
) AND album.id = track.album_id AND album.state = 'deleted';

UPDATE album
SET
    rg_peak = 0,
    rg_gain = 0
WHERE (
    rg_peak IS NULL
    OR rg_gain IS NULL
) AND state = 'deleted';

UPDATE album
SET state = 'disabled', rg_peak = 0, rg_gain = 0
WHERE path IN (
    'what.cd/P.O.D. - 2008 - When Angels & Serpents Dance',
    'what.cd/Static-X~Cult Of Static [FLAC]-2009'
);
UPDATE track
SET
    rg_peak = 0,
    rg_gain = 0
FROM album
WHERE album.id = track.album_id AND album.path IN (
    'what.cd/P.O.D. - 2008 - When Angels & Serpents Dance',
    'what.cd/Static-X~Cult Of Static [FLAC]-2009'
);

ALTER TABLE album
    ALTER COLUMN rg_peak SET NOT NULL,
    ALTER COLUMN rg_gain SET NOT NULL,
    DROP CONSTRAINT album_rg_check;

ALTER TABLE track
    ALTER COLUMN rg_peak SET NOT NULL,
    ALTER COLUMN rg_gain SET NOT NULL;

ALTER TABLE draft_album
    ALTER COLUMN rg_peak SET NOT NULL,
    ALTER COLUMN rg_gain SET NOT NULL;

ALTER TABLE draft_track
    ALTER COLUMN rg_peak SET NOT NULL,
    ALTER COLUMN rg_gain SET NOT NULL;

COMMIT;
