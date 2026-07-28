CREATE TABLE Tim (
    Id_Tim SERIAL PRIMARY KEY,
    NIK_Kepala_Tim VARCHAR(20),
    Jumlah_Anggota INTEGER NOT NULL CHECK (Jumlah_Anggota > 0)
);

CREATE TABLE Kepala_Tim (
    NIK VARCHAR(20) PRIMARY KEY,
    Nama VARCHAR(100) NOT NULL,
    Asal_Daerah VARCHAR(100),
    Fee_Kepala_Tim NUMERIC(12,2) CHECK (Fee_Kepala_Tim > 0),
    Id_Tim INTEGER,
    CONSTRAINT fk_kepala_tim FOREIGN KEY (Id_Tim)
        REFERENCES Tim(Id_Tim)
        ON DELETE SET NULL
);

ALTER TABLE Tim
ADD CONSTRAINT fk_tim_kepala FOREIGN KEY (NIK_Kepala_Tim)
    REFERENCES Kepala_Tim(NIK)
    ON DELETE SET NULL;

CREATE TABLE Anggota (
    NIK VARCHAR(20) PRIMARY KEY,
    Nama VARCHAR(100) NOT NULL,
    Asal_Daerah VARCHAR(100),
    NIK_Kepala_Tim VARCHAR(20),
    Id_Tim INTEGER,
    CONSTRAINT fk_anggota_kepala FOREIGN KEY (NIK_Kepala_Tim)
        REFERENCES Kepala_Tim(NIK)
        ON DELETE SET NULL,
    CONSTRAINT fk_anggota_tim FOREIGN KEY (Id_Tim)
        REFERENCES Tim(Id_Tim)
        ON DELETE SET NULL
);

CREATE TABLE Lahan (
    Id_Lahan SERIAL PRIMARY KEY,
    Lokasi VARCHAR(100) NOT NULL UNIQUE,
    Pengawas VARCHAR(100) NOT NULL,
    Luas_Lahan NUMERIC(10,2) CHECK (Luas_Lahan > 0)
);

CREATE TABLE Pekerjaan (
    Id_Kerja SERIAL PRIMARY KEY,
    Kegiatan VARCHAR(100) NOT NULL,
    Luas_Lahan NUMERIC(10,2) CHECK (Luas_Lahan > 0),
    Tanggal_Mulai_Kerja DATE NOT NULL,
    Id_Tim INTEGER,
    Id_Lahan INTEGER,
    CONSTRAINT fk_pekerjaan_tim FOREIGN KEY (Id_Tim)
        REFERENCES Tim(Id_Tim)
        ON DELETE CASCADE,
    CONSTRAINT fk_pekerjaan_lahan FOREIGN KEY (Id_Lahan)
        REFERENCES Lahan(Id_Lahan)
        ON DELETE CASCADE,
    CONSTRAINT unq_pekerjaan UNIQUE (Id_Tim, Id_Lahan, Tanggal_Mulai_Kerja)
);

CREATE TABLE Tagihan (
    Id_Tagihan SERIAL PRIMARY KEY,
    Id_Kerja INTEGER UNIQUE,
    Harga_Perusahaan NUMERIC(12,2) CHECK (Harga_Perusahaan > 0),
    Total NUMERIC(12,2) CHECK (Total >= Harga_Perusahaan),
    CONSTRAINT fk_tagihan_pekerjaan FOREIGN KEY (Id_Kerja)
        REFERENCES Pekerjaan(Id_Kerja)
        ON DELETE CASCADE
);

CREATE TABLE Pembayaran (
    Id_Pembayaran SERIAL PRIMARY KEY,
    Id_Tim INTEGER,
    Harga_Anggota NUMERIC(12,2) CHECK (Harga_Anggota > 0),
    Total NUMERIC(12,2) CHECK (Total >= Harga_Anggota),
    CONSTRAINT fk_pembayaran_tim FOREIGN KEY (Id_Tim)
        REFERENCES Tim(Id_Tim)
        ON DELETE CASCADE
);

CREATE TABLE Pinjaman (
    NIK VARCHAR(20),
    No_Pinjam SERIAL,
    Jenis_Pinjaman VARCHAR(50) NOT NULL,
    Total_Pinjaman NUMERIC(12,2) CHECK (Total_Pinjaman > 0),
    PRIMARY KEY (NIK, No_Pinjam),
    CONSTRAINT fk_pinjaman_kepala FOREIGN KEY (NIK)
        REFERENCES Kepala_Tim(NIK)
        ON DELETE CASCADE
);

ALTER TABLE Pinjaman
ADD CONSTRAINT fk_pinjaman_anggota FOREIGN KEY (NIK)
    REFERENCES Anggota(NIK)
    ON DELETE CASCADE;

ALTER TABLE Kepala_Tim
RENAME COLUMN NIK TO NIK_Kepala_Tim;

ALTER TABLE Tim
DROP CONSTRAINT IF EXISTS fk_tim_kepala;

ALTER TABLE Tim
ADD CONSTRAINT fk_tim_kepala
FOREIGN KEY (NIK_Kepala_Tim)
REFERENCES Kepala_Tim(NIK_Kepala_Tim)
ON DELETE SET NULL;

ALTER TABLE Anggota
DROP CONSTRAINT IF EXISTS fk_anggota_kepala;

ALTER TABLE Anggota
ADD CONSTRAINT fk_anggota_kepala
FOREIGN KEY (NIK_Kepala_Tim)
REFERENCES Kepala_Tim(NIK_Kepala_Tim)
ON DELETE SET NULL;

ALTER TABLE Pinjaman
DROP CONSTRAINT IF EXISTS fk_pinjaman_kepala;

ALTER TABLE Pinjaman
ADD CONSTRAINT fk_pinjaman_kepala
FOREIGN KEY (NIK)
REFERENCES Kepala_Tim(NIK_Kepala_Tim)
ON DELETE CASCADE;

SET search_path TO fajarindo;