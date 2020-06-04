ALTER TYPE download_source_enum ADD VALUE 'WEB';

BEGIN;
    UPDATE album SET download_source = 'WEB'
    WHERE path IN (
        'bandcamp.com/El Mashe - 2016 - El Mashe',
        'bandcamp.com/The Middle Volga Social Club - 2016 - Give Me the Way',
        'soundcloud.com/Коля Маню - 2016 - Baadmantown'
    );

    UPDATE album SET path = trim(both '/' from path);

    ALTER TABLE album ADD CONSTRAINT album_path_check CHECK (
        trim(both '/' from path) = path
    );

    WITH updated_album AS (
        UPDATE album SET path = 'what.cd/Random Hand - 2010 - Another Change Of Plan'
        WHERE path = 'deleted/Random Hand-2010-Another Change of Plan'
        RETURNING id
    ) UPDATE track SET path = data.path
    FROM (VALUES
        (1, '01 - Play Some Ska.flac'),
        (2, '02 - Scum Triumphant.flac'),
        (3, '03 - Milk.flac'),
        (4, '04 - Snakes And Ladders.flac'),
        (5, '05 - Dynamo Penis Death Bastard.flac'),
        (6, '06 - Anthropology.flac'),
        (7, '07 - The Tenant Of Rotherwood Hall.flac'),
        (8, '08 - Answers.flac'),
        (9, '09 - Danger Makes Enemies.flac'),
        (10, '10 - The Wisest Man.flac'),
        (11, '11 - Tear Down.flac'),
        (12, '12 - Mr Bibs Wakes Up.flac'),
        (13, '13 - The Story.flac'),
        (14, '14 - Morally Blind.flac'),
        (15, '15 - Fury Fix.flac')
    ) AS data(track_number, path), updated_album
    WHERE updated_album.id = track.album_id
    AND track_num = data.track_number;

    WITH updated_album AS (
        UPDATE album SET path = 'what.cd/Mouthwash - 1000 Dreams FLAC'
        WHERE path = 'deleted/Mouthwash-2000-1000 Dreams'
        RETURNING id
    ) UPDATE track SET path = data.path
    FROM (VALUES
        (1, '01 Mouthwash - Drop The Bomb.flac'),
        (2, '02 Mouthwash - We Evolve.flac'),
        (3, '03 Mouthwash - My Kind Of Love.flac'),
        (4, '04 Mouthwash - Fools Gold.flac'),
        (5, '05 Mouthwash - One For Sorrow.flac'),
        (6, '06 Mouthwash - Competing For Frequency.flac'),
        (7, '07 Mouthwash - Live Like Kings.flac'),
        (8, '08 Mouthwash - Through The Gray.flac'),
        (9, '09 Mouthwash - Babylondon.flac')
    ) AS data(track_number, path), updated_album
    WHERE updated_album.id = track.album_id
    AND track_num = data.track_number;

    WITH updated_album AS (
        UPDATE album SET path = 'what.cd/Modest Mouse - Good News For People Who Love Bad News [FLAC]'
        WHERE path = 'deleted/Modest Mouse-2004-Good News for People Who Love Bad News'
        RETURNING id
    ) UPDATE track SET path = data.path
    FROM (VALUES
        (1, 'Modest Mouse - Good News For People Who Love Bad News - 01 - Horn Intro.flac'),
        (2, 'Modest Mouse - Good News For People Who Love Bad News - 02 - The World At Large.flac'),
        (3, 'Modest Mouse - Good News For People Who Love Bad News - 03 - Float On.flac'),
        (4, 'Modest Mouse - Good News For People Who Love Bad News - 04 - Ocean Breathes Salty.flac'),
        (5, 'Modest Mouse - Good News For People Who Love Bad News - 05 - Dig Your Grave.flac'),
        (6, 'Modest Mouse - Good News For People Who Love Bad News - 06 - Bury Me With It.flac'),
        (7, 'Modest Mouse - Good News For People Who Love Bad News - 07 - Dance Hall.flac'),
        (8, 'Modest Mouse - Good News For People Who Love Bad News - 08 - Bukowski.flac'),
        (9, 'Modest Mouse - Good News For People Who Love Bad News - 09 - This Devil''s Workday.flac'),
        (10, 'Modest Mouse - Good News For People Who Love Bad News - 10 - The View.flac'),
        (11, 'Modest Mouse - Good News For People Who Love Bad News - 11 - Satin In A Coffin.flac'),
        (12, 'Modest Mouse - Good News For People Who Love Bad News - 12 - Interlude (Milo).flac'),
        (13, 'Modest Mouse - Good News For People Who Love Bad News - 13 - Blame It On The Tetons.flac'),
        (14, 'Modest Mouse - Good News For People Who Love Bad News - 14 - Black Cadillacs.flac'),
        (15, 'Modest Mouse - Good News For People Who Love Bad News - 15 - One Chance.flac'),
        (16, 'Modest Mouse - Good News For People Who Love Bad News - 16 - The Good Times Are Killing Me.flac')
    ) AS data(track_number, path), updated_album
    WHERE updated_album.id = track.album_id
    AND track_num = data.track_number;

    WITH updated_album AS (
        UPDATE album SET path = 'what.cd/Bomb The Music Industry!-Scrambles FLAC'
        WHERE path = 'deleted/Bomb the Music Industry!-2009-Scrambles'
        RETURNING id
    ) UPDATE track SET path = data.path
    FROM (VALUES
        (1, '01 - Cold Chillin'' Cold Chillin''.flac'),
        (2, '02 - Stuff That I Like.flac'),
        (3, '03 - It Shits!!!.flac'),
        (4, '04 - Fresh Attitude, Young Body.flac'),
        (5, '05 - Wednesday Night Drinkball.flac'),
        (6, '06 - 25!!!.flac'),
        (7, '07 - $2,400,000.flac'),
        (8, '08 - Gang of Four Meets the Stooges (But Boring).flac'),
        (9, '09 - 9,11 Fever!!!.flac'),
        (10, '10 - (Shut) Up the Punx!!!.flac'),
        (11, '11 - Can I Pay My Rent In Fun .flac'),
        (12, '12 - Saddr Weirdr.flac'),
        (13, '13 - Sort of Like Being Pumped.flac')
    ) AS data(track_number, path), updated_album
    WHERE updated_album.id = track.album_id
    AND track_num = data.track_number;
COMMIT;
