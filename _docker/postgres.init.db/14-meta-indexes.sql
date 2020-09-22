BEGIN;
	CREATE INDEX release_album_id_idx
		ON release USING btree (album_id);

	CREATE INDEX track_album_id_idx
		ON track USING btree (album_id);

	CREATE INDEX album_artist_id_idx
		ON album USING btree (artist_id);

	CREATE INDEX track_album_id_disc_idx
		ON track USING btree (album_id, disc DESC);

	CREATE INDEX track_meta_idx
		ON track USING btree (album_state, album_id, disc, track_num);
COMMIT;
