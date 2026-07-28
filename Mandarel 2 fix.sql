DROP TABLE IF EXISTS TransaksiKeluar;
DROP TABLE IF EXISTS TransaksiMasuk;
DROP TABLE IF EXISTS Barang;
DROP TABLE IF EXISTS Pengguna;
DROP TABLE IF EXISTS Supplier;
DROP TABLE IF EXISTS Lokasi;

CREATE TABLE Supplier (
    ID_Supplier VARCHAR(5) PRIMARY KEY,
    Nama_Supplier VARCHAR(100) NOT NULL,
    Kontak_Supplier VARCHAR(50),
    Alamat_Supplier VARCHAR(100),
    Email_Supplier VARCHAR(50)
);

CREATE TABLE Lokasi (
    ID_Lokasi VARCHAR(5) PRIMARY KEY,
    Nama_Lokasi VARCHAR(50) NOT NULL,
    Alamat_Lokasi VARCHAR(100),
    Kapasitas_Penyimpanan INT
);

CREATE TABLE Pengguna (
    ID_Pengguna VARCHAR(5) PRIMARY KEY,
    Nama VARCHAR(50) NOT NULL,
    Jabatan VARCHAR(50),
    Email VARCHAR(50)
);

	CREATE TABLE Barang (
		ID_Barang VARCHAR(5) PRIMARY KEY,
		Nama_Barang VARCHAR(50) NOT NULL,
		Kategori_Barang VARCHAR(20),
		ID_Lokasi INT NOT NULL,
		Jumlah_Stok INT DEFAULT 0,
		Harga_Satuan DECIMAL(15,2),
		FOREIGN KEY (ID_Lokasi) REFERENCES Lokasi(ID_Lokasi)
	);

CREATE TABLE TransaksiMasuk (
	ID_TransaksiMasuk Varchar(5) PRIMARY KEY,
    ID_Barang VARCHAR(5) NOT NULL,
    ID_Supplier VARCHAR(5) NOT NULL,
    Tanggal_Masuk DATE,
    Jumlah_Masuk INT NOT NULL,
    Harga_Beli DECIMAL(15,2),
    FOREIGN KEY (ID_Barang) REFERENCES Barang(ID_Barang),
    FOREIGN KEY (ID_Supplier) REFERENCES Supplier(ID_Supplier)
);

CREATE TABLE TransaksiKeluar (
	ID_TransaksiKeluar Varchar(5) PRIMARY KEY,
    ID_Barang VARCHAR(5) NOT NULL,
    ID_Pengguna VARCHAR(5) NOT NULL,
    Tanggal_Keluar DATE,
    Jumlah_Keluar INT NOT NULL,
    Tujuan VARCHAR(200),
    FOREIGN KEY (ID_Barang) REFERENCES Barang(ID_Barang),
    FOREIGN KEY (ID_Pengguna) REFERENCES Pengguna(ID_Pengguna)
);

INSERT INTO Lokasi (ID_Lokasi, Nama_Lokasi, Alamat_Lokasi, Kapasitas_Penyimpanan) VALUES
('L0001', 'Gudang Utama', 'Jl. Industri No. 123', 1000),
('L0002', 'Gudang Cabang A', 'Jl. Merdeka No. 45', 800),
('L0003', 'Ruang Penyimpanan B', 'Jl. Sudirman No. 67', 600),
('L0004', 'Gudang Pusat', 'Jl. Gatot Subroto No. 89', 1200),
('L0005', 'Warehouse C', 'Jl. Thamrin No. 12', 900),
('L0006', 'Gudang Cabang B', 'Jl. Industri No. 125', 1000),
('L0007', 'Gudang Cabang C', 'Jl. Merdeka No. 49', 800),
('L0008', 'Ruang Penyimpanan L', 'Jl. Sudirman No. 69', 600),
('L0009', 'Gudang YTTA', 'Jl. Gatot Subroto No. 78', 1200),
('L0010', 'Warehouse G', 'Jl. Thamrin No. 24', 900);


-- Insert data Supplier (8 supplier)
INSERT INTO Supplier (ID_Supplier, Nama_Supplier, Kontak_Supplier, Alamat_Supplier, Email_Supplier) VALUES
('S0001', 'PT Elektronik Maju', '08123456701', 'Jl. Elektronik No. 1', 'info@elektronikmaju.com'),
('S0002', 'CV Alat Tulis Jaya', '08123456702', 'Jl. Pasar Baru No. 2', 'sales@alattulisjaya.com'),
('S0003', 'PT Furniture Indonesia', '08123456703', 'Jl. Kayu Jati No. 3', 'contact@furniture.co.id'),
('S0004', 'UD Bahan Bangunan', '08123456704', 'Jl. Konstruksi No. 4', 'udbangunan@gmail.com'),
('S0005', 'PT Komputer Modern', '08123456705', 'Jl. Teknologi No. 5', 'support@komputermodern.com'),
('S0006', 'CV Perlengkapan Kantor', '08123456706', 'Jl. Kantor No. 6', 'info@perlengkapan.co.id'),
('S0007', 'PT Otomotif Nusantara', '08123456707', 'Jl. Otomotif No. 7', 'sales@otomotifnusantara.com'),
('S0008', 'UD Makanan Sehat', '08123456708', 'Jl. Pangan No. 8', 'udmakanan@yahoo.com'),
('S0009', 'PT Keren mantap Nusantara', '08123456707', 'Jl. Keren No. 7', 'sale232s@otomotifnusantara.com'),
('S0010', 'UD Makanan WOW', '08123456708', 'Jl. Ikan No. 8', 'udmakanan232@yahoo.com');

-- Insert data Pengguna (10 pengguna)
INSERT INTO Pengguna (ID_Pengguna, Nama, Jabatan, Email) VALUES
('P0001', 'Ahmad Wijaya', 'Manager Gudang', 'ahmad.wijaya@company.com'),
('P0002', 'Siti Rahayu', 'Staff Inventory', 'siti.rahayu@company.com'),
('P0003', 'Budi Santoso', 'Supervisor', 'budi.santoso@company.com'),
('P0004', 'Dewi Lestari', 'Admin Gudang', 'dewi.lestari@company.com'),
('P0005', 'Rudi Hermawan', 'Koordinator Logistik', 'rudi.hermawan@company.com'),
('P0006', 'Maya Sari', 'Staff Administrasi', 'maya.sari@company.com'),
('P0007', 'Joko Prasetyo', 'Operator Gudang', 'joko.prasetyo@company.com'),
('P0008', 'Linda Wati', 'Quality Control', 'linda.wati@company.com'),
('P0009', 'Hendra Kurniawan', 'Kepala Divisi', 'hendra.kurniawan@company.com'),
('P0010', 'Fitri Anggraini', 'Staff Pembelian', 'fitri.anggraini@company.com');

-- Insert data Barang (15 barang)
INSERT INTO Barang (ID_Barang, Nama_Barang, Kategori_Barang, ID_Lokasi, Jumlah_Stok, Harga_Satuan) VALUES
('B0001', 'Laptop Dell XPS', 'Elektronik', 'L0001', 50, 15000000),
('B0002', 'Mouse Wireless', 'Elektronik', 'L0002', 100, 250000),
('B0003', 'Keyboard Mechanical', 'Elektronik', 'L0001', 75, 800000),
('B0004', 'Monitor 24 inch', 'Elektronik', 'L0003', 30, 2000000),
('B0005', 'Printer LaserJet', 'Elektronik', 'L0004', 25, 1500000),
('B0006', 'Kursi Kantor', 'Furniture', 'L0005', 40, 750000),
('B0007', 'Meja Kerja', 'Furniture', 'L0004', 20, 1200000),
('B0008', 'Pulpen Pilot', 'Alat Tulis', 'L0002', 200, 5000),
('B0009', 'Buku Catatan', 'Alat Tulis', 'L0002', 150, 25000),
('B0010', 'Stapler Max', 'Alat Tulis', 'L0002', 80, 45000),
('B0011', 'Scanner Document', 'Elektronik', 'L0003', 15, 1800000),
('B0012', 'Headphone Sony', 'Elektronik', 'L0001', 60, 950000),
('B0013', 'Webcam Logitech', 'Elektronik', 'L0001', 45, 650000),
('B0014', 'Speaker Bluetooth', 'Elektronik', 'L0003', 35, 550000),
('B0015', 'Power Bank 20000mAh', 'Elektronik', 'L0001', 90, 350000);

INSERT INTO TransaksiMasuk (ID_TransaksiMasuk, ID_Barang, ID_Supplier, Tanggal_Masuk, Jumlah_Masuk, Harga_Beli) VALUES
('TM001', 'B0001', 'S0001', '2024-01-05', 20, 12000000),
('TM002', 'B0002', 'S0001', '2024-01-05', 50, 180000),
('TM003', 'B0003', 'S0001', '2024-01-06', 30, 600000),
('TM004', 'B0004', 'S0005', '2024-01-07', 15, 1500000),
('TM005', 'B0005', 'S0005', '2024-01-08', 10, 1200000),
('TM006', 'B0006', 'S0003', '2024-01-09', 20, 550000),
('TM007', 'B0007', 'S0003', '2024-01-10', 10, 900000),
('TM008', 'B0008', 'S0002', '2024-01-11', 100, 3000),
('TM009', 'B0009', 'S0002', '2024-01-12', 80, 15000),
('TM010', 'B0010', 'S0006', '2024-01-13', 40, 30000),
('TM011', 'B0011', 'S0005', '2024-01-14', 8, 1400000),
('TM012', 'B0012', 'S0001', '2024-01-15', 25, 700000),
('TM013', 'B0013', 'S0001', '2024-01-16', 20, 480000),
('TM014', 'B0014', 'S0005', '2024-01-17', 15, 400000),
('TM015', 'B0015', 'S0001', '2024-01-18', 50, 250000),
('TM016', 'B0001', 'S0001', '2024-01-19', 15, 12500000),
('TM017', 'B0002', 'S0001', '2024-01-20', 25, 190000),
('TM018', 'B0006', 'S0003', '2024-01-21', 15, 560000),
('TM019', 'B0008', 'S0002', '2024-01-22', 50, 3200),
('TM020', 'B0010', 'S0006', '2024-01-23', 20, 31000),
('TM021', 'B0012', 'S0001', '2024-01-24', 20, 720000),
('TM022', 'B0013', 'S0001', '2024-01-25', 15, 500000),
('TM023', 'B0014', 'S0005', '2024-01-26', 10, 420000),
('TM024', 'B0015', 'S0001', '2024-01-27', 30, 260000),
('TM025', 'B0003', 'S0001', '2024-01-28', 25, 620000);

INSERT INTO TransaksiKeluar (ID_TransaksiKeluar, ID_Barang, ID_Pengguna, Tanggal_Keluar, Jumlah_Keluar, Tujuan) VALUES
('TK001', 'B0001', 'P0001', '2024-01-06', 2, 'Permintaan Departemen IT'),
('TK002', 'B0002', 'P0002', '2024-01-06', 10, 'Distribusi ke Cabang A'),
('TK003', 'B0003', 'P0003', '2024-01-07', 5, 'Penggantian barang rusak'),
('TK004', 'B0004', 'P0004', '2024-01-08', 3, 'Permintaan Direktur'),
('TK005', 'B0005', 'P0005', '2024-01-09', 2, 'Pemakaian internal kantor'),
('TK006', 'B0006', 'P0006', '2024-01-10', 5, 'Penambahan ruang meeting'),
('TK007', 'B0007', 'P0007', '2024-01-11', 2, 'Renovasi kantor lantai 2'),
('TK008', 'B0008', 'P0008', '2024-01-12', 25, 'Stok alat tulis karyawan'),
('TK009', 'B0009', 'P0009', '2024-01-13', 20, 'Kebutuhan training'),
('TK010', 'B0010', 'P0010', '2024-01-14', 10, 'Distribusi ke Cabang B'),
('TK011', 'B0011', 'P0001', '2024-01-15', 1, 'Permintaan Accounting'),
('TK012', 'B0012', 'P0002', '2024-01-16', 8, 'Kebutuhan tim marketing'),
('TK013', 'B0013', 'P0003', '2024-01-17', 5, 'Meeting online'),
('TK014', 'B0014', 'P0004', '2024-01-18', 4, 'Acara perusahaan'),
('TK015', 'B0015', 'P0005', '2024-01-19', 15, 'Giveaway event'),
('TK016', 'B0001', 'P0006', '2024-01-20', 3, 'Karyawan baru'),
('TK017', 'B0002', 'P0007', '2024-01-21', 8, 'Replacement stock'),
('TK018', 'B0003', 'P0008', '2024-01-22', 4, 'Upgrade workstation'),
('TK019', 'B0006', 'P0009', '2024-01-23', 3, 'Penambahan ruang kerja'),
('TK020', 'B0008', 'P0010', '2024-01-24', 15, 'Stok bulanan'),
('TK021', 'B0010', 'P0001', '2024-01-25', 5, 'Maintenance'),
('TK022', 'B0012', 'P0002', '2024-01-26', 6, 'Tim sales'),
('TK023', 'B0013', 'P0003', '2024-01-27', 3, 'Work from home'),
('TK024', 'B0014', 'P0004', '2024-01-28', 2, 'Presentasi client'),
('TK025', 'B0015', 'P0005', '2024-01-29', 10, 'Corporate event');



