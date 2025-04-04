-- 1. ЖАНРЫ
CREATE TABLE genres (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

-- 2. ИСПОЛНИТЕЛИ
CREATE TABLE artists (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

-- 3. СВЯЗЬ ИСПОЛНИТЕЛЬ ↔ ЖАНР (многие ко многим)
CREATE TABLE artist_genre (
    artist_id INT NOT NULL,
    genre_id INT NOT NULL,
    PRIMARY KEY (artist_id, genre_id),
    FOREIGN KEY (artist_id) REFERENCES artists(id) ON DELETE CASCADE,
    FOREIGN KEY (genre_id) REFERENCES genres(id) ON DELETE CASCADE
);

-- 4. АЛЬБОМЫ
CREATE TABLE albums (
    id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    release_year INT
);

-- 5. СВЯЗЬ ИСПОЛНИТЕЛЬ ↔ АЛЬБОМ (многие ко многим)
CREATE TABLE artist_album (
    artist_id INT NOT NULL,
    album_id INT NOT NULL,
    PRIMARY KEY (artist_id, album_id),
    FOREIGN KEY (artist_id) REFERENCES artists(id) ON DELETE CASCADE,
    FOREIGN KEY (album_id) REFERENCES albums(id) ON DELETE CASCADE
);

-- 6. ТРЕКИ
CREATE TABLE tracks (
    id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    duration TIME NOT NULL,
    album_id INT NOT NULL,
    FOREIGN KEY (album_id) REFERENCES albums(id) ON DELETE CASCADE
);

-- 7. СБОРНИКИ
CREATE TABLE compilations (
    id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    release_year INT
);

-- 8. СВЯЗЬ СБОРНИК ↔ ТРЕК (многие ко многим)
CREATE TABLE compilation_track (
    compilation_id INT NOT NULL,
    track_id INT NOT NULL,
    PRIMARY KEY (compilation_id, track_id),
    FOREIGN KEY (compilation_id) REFERENCES compilations(id) ON DELETE CASCADE,
    FOREIGN KEY (track_id) REFERENCES tracks(id) ON DELETE CASCADE
);

ALTER TABLE tracks
ALTER COLUMN duration TYPE INTEGER USING EXTRACT(EPOCH FROM duration)::INTEGER;

