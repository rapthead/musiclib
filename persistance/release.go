package persistance

import (
	"context"
	"fmt"

	"github.com/gofrs/uuid"
	"github.com/rapthead/musiclib/models"
)

func (p *Queries) GetReleaseByAlbumID(ctx context.Context, id uuid.UUID) ([]models.Release, error) {
	releaseInfo := []models.Release{}
	err := p.db.SelectContext(ctx, &releaseInfo, `
        SELECT
            release.id,
            label.name AS label,
            release.catalog_num,
            release.album_id
        FROM release
        JOIN label ON label.id = release.label_id
        WHERE album_id = $1
        ORDER BY label.name ASC
    `, id)
	return releaseInfo, err
}

func (p *Queries) UpdateRelease(ctx context.Context, release models.Release) error {
	_, err := p.db.NamedExecContext(ctx, `
        WITH existen_label AS (
            SELECT id FROM label WHERE name = :label
        ), inserted_label AS (
            INSERT INTO label (id, name)
            SELECT uuid_generate_v4(), :label
            WHERE NOT EXISTS (SELECT * FROM existen_label)
            RETURNING id
        )
        UPDATE release SET
            label_id = COALESCE(
                (SELECT id FROM existen_label),
                (SELECT id FROM inserted_label)
            ),
            catalog_num = :catalog_num
        WHERE id = :id
    `, release)
	if err != nil {
		return fmt.Errorf("release updation error: %w", err)
	}
	return nil
}

func (p *Queries) InsertRelease(ctx context.Context, release models.Release) error {
	_, err := p.db.NamedExecContext(ctx, `
        WITH existen_label AS (
            SELECT id FROM label WHERE name = :label
        ), inserted_label AS (
            INSERT INTO label (id, name)
            SELECT uuid_generate_v4(), :label
            WHERE NOT EXISTS (SELECT * FROM existen_label)
            RETURNING id
        )
        INSERT INTO release (
            id,
            album_id,
            label_id,
            catalog_num
        ) VALUES (
            :id,
            :album_id,
            COALESCE(
                (SELECT id FROM existen_label),
                (SELECT id FROM inserted_label)
            ),
            :catalog_num
        )
    `, release)
	if err != nil {
		return fmt.Errorf("release updation error: %w", err)
	}
	return nil
}

func (p *Queries) DeleteRelease(ctx context.Context, releaseID uuid.UUID) error {
	_, err := p.db.ExecContext(ctx, `
        DELETE FROM release
        WHERE id = $1
    `, releaseID)
	if err != nil {
		return fmt.Errorf("cover deletion error: %w", err)
	}
	return nil
}
