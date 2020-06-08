BEGIN;
    ALTER TABLE album
        ADD COLUMN source_url text;

    UPDATE album
        SET source_url = 'https://what.cd/torrents.php?torrentid=0'
        WHERE download_source = 'WHAT_CD' AND source_id IS NULL
        RETURNING id, download_source, source_id, source_url, title;

    UPDATE album
        SET source_url = 'https://what.cd/torrents.php?torrentid=' || source_id
        WHERE download_source = 'WHAT_CD' AND source_id IS NOT NULL;

    UPDATE album
        SET source_url = 'https://waffles.fm/details.php?id=' || source_id
        WHERE download_source = 'WAFFLES_FM';

    UPDATE album
        SET source_url = 'https://redacted.ch/torrents.php?torrentid=' || source_id
        WHERE download_source = 'REDACTED_CH';


    UPDATE album SET source_url = data.source_url
    FROM (VALUES
        ('434afe7c-da92-4c41-8b5b-3e31117cf694', 'https://themiddlevolgasocialclub.bandcamp.com/album/give-me-the-way'),
        ('12b6092c-61fb-4cff-9bb3-2a697b61ad58', 'https://soundcloud.com/manumaker/sets/baadmantown'),
        ('c27490fe-fdee-4bad-8f75-c684c1a2b293', 'https://elmashe.bandcamp.com/album/el-mashe-lp-2016')
    ) AS data(id, source_url) WHERE album.id::text = data.id;

    ALTER TABLE album
        DROP COLUMN source_id,
        ADD CONSTRAINT album_source_url_check CHECK (
            CASE
                WHEN download_source = 'WHAT_CD'        THEN source_url IS NOT NULL AND source_url ~ '^https://what.cd/torrents.php\?torrentid=\d+$'
                WHEN download_source = 'WAFFLES_FM'     THEN source_url IS NOT NULL AND source_url ~ '^https://waffles.fm/details.php\?id=\d+$'
                WHEN download_source = 'REDACTED_CH'    THEN source_url IS NOT NULL AND source_url ~ '^https://redacted.ch/torrents.php\?torrentid=\d+$'
                WHEN download_source = 'WEB'            THEN source_url IS NOT NULL
                ELSE TRUE
            END
        );

    ALTER TABLE draft_album
        DROP COLUMN source_id,
        ADD COLUMN source_url text,
        ADD CONSTRAINT album_source_url_check CHECK (
            CASE
                WHEN download_source = 'WHAT_CD'        THEN source_url IS NULL OR source_url ~ '^https://what.cd/torrents.php\?torrentid=\d+$'
                WHEN download_source = 'WAFFLES_FM'     THEN source_url IS NULL OR source_url ~ '^https://waffles.fm/details.php\?id=\d+$'
                WHEN download_source = 'REDACTED_CH'    THEN source_url IS NULL OR source_url ~ '^https://redacted.ch/torrents.php\?torrentid=\d+$'
                ELSE TRUE
            END
        );
COMMIT;
