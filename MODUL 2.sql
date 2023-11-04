
---------------------------------------------------------------------------------------------------------------------------------- lolll
--- Chalvin Reza Farrel - 5025221054
--- Sistem Basis Data H

CREATE DATABASE KKN1;

--1--

CREATE TABLE Customer(
	ID_customer CHAR(6) PRIMARY KEY NOT NULL,
	Nama_customer VARCHAR(100)
);

CREATE TABLE pegawai(
	NIK CHAR(16) PRIMARY KEY NOT NULL,
	Nama_pegawai VARCHAR(100),
	Jenis_kelamin CHAR(1),
	Email VARCHAR(50),
	Umur INT 
);

ALTER TABLE pegawai
	MODIFY Jenis_kelamin CHAR(10)

CREATE TABLE Transaksi(
    ID_transaksi CHAR(10) PRIMARY KEY,
    Tanggal_transaksi DATE NOT NULL,
    Metode_pembayaran VARCHAR(15) NOT NULL,
    Customer_id_customer CHAR(6) NOT NULL,
    Pegawai_NIK CHAR(16) NOT NULL,
    FOREIGN KEY (Customer_id_customer) REFERENCES Customer(ID_customer),
    FOREIGN KEY (Pegawai_NIK) REFERENCES Pegawai(NIK)
);

CREATE TABLE Telepon(
	No_telp_pegawai VARCHAR(15) PRIMARY KEY NOT NULL,
	Pegawai_NIK CHAR(16), FOREIGN KEY (Pegawai_NIK) REFERENCES pegawai(NIK)
);

CREATE TABLE Menu_minuman(
	ID_minuman CHAR(6) PRIMARY KEY NOT NULL,
	Nama_minuman VARCHAR(50),
	Harga_minuman FLOAT(2)
);

CREATE TABLE Transaksi_minuman (
    TM_Menu_minuman_ID CHAR(6),
    TM_Transaksi_ID CHAR(10),
    Jumlah_cup INT,
    PRIMARY KEY (TM_Menu_minuman_ID, TM_Transaksi_ID)
    -- FOREIGN KEY (TM_Menu_minuman_ID) REFERENCES Transaksi_minuman(TM_Menu_minuman_ID),
    -- FOREIGN KEY (TM_Transaksi_ID) REFERENCES Transaksi_minuman(TM_Transaksi_ID)
);

ALTER TABLE transaksi_minuman
	ADD FOREIGN KEY (TM_Menu_minuman_ID) REFERENCES menu_minuman(ID_minuman);
ALTER TABLE transaksi_minuman
	ADD FOREIGN KEY (TM_Transaksi_ID) REFERENCES transaksi(ID_transaksi);

-- 2

CREATE TABLE Membership(
	ID_membership CHAR(6),
	No_telp_customer VARCHAR(15),
	Alamat_customer VARCHAR(100),
	Tanggal_pembuatan_kartu_membership DATE,
	Tanggal_kadaluarsa_kartu_membership DATE NULL,
	Total_poin INT,
	Customer_id_customer CHAR(6)
);

ALTER TABLE Membership
	ADD CONSTRAINT PK_Membership
	PRIMARY KEY (ID_membership);
ALTER TABLE Membership 
	ADD CONSTRAINT FK_Customer_Membership 
	FOREIGN KEY (Customer_id_customer) REFERENCES Customer(ID_customer) 
	ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE Transaksi 
	ADD CONSTRAINT FK_Customer_Transaksi 
	FOREIGN KEY (Customer_id_customer) REFERENCES Customer(ID_customer) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE Membership 
	ALTER tanggal_pembuatan_kartu_membership SET DEFAULT(CURDATE());
ALTER TABLE Membership 
	ADD CHECK (total_poin >= 0);
ALTER TABLE membership 
MODIFY alamat_customer VARCHAR(150);


-- 3

DROP TABLE telepon;
ALTER TABLE pegawai
	ADD No_telepon_pegawai VARCHAR(15);
	
	
-- 4
-- Customer
INSERT INTO customer VALUES ('CTR001', 'Budi Santoso');
INSERT INTO customer VALUES ('CTR002', 'Sisil Triana');
INSERT INTO customer VALUES ('CTR003', 'Davi Liam');
INSERT INTO customer VALUES ('CTRo04', 'Sutris Ten An');
INSERT INTO customer VALUES ('CTR005', 'Hendra Asto');

-- Membership
INSERT INTO membership VALUES ('MBR001', '08123456789', 'Jl. Imam Bonjol', '2023-10-24', '2023-11-30', 0, 'CTR001');
INSERT INTO membership VALUES ('MBR002', '0812345678', 'Jl. Kelinci', '2023-10-24', '2023-11-30', 3, 'CTR002');
INSERT INTO membership VALUES ('MBR003', '081234567890', 'Jl. Abah Ojak', '2023-10-25', '2023-12-1', 2, 'CTR003');
INSERT INTO membership VALUES ('MBR004', '08987654321', 'Jl. Kenangan', '2023-10-26', '2023-12-2', 6, 'CTR004');

-- Pegawai 
INSERT INTO pegawai VALUES ('1234567890123456', 'Naufal Raf', 'Laki-Laki', 'nuafal@gmail.com', 19, '62123456789');
INSERT INTO pegawai VALUES ('2345678901234561', 'Surinala', 'Perempuan', 'surinala@gmail.com', 24, '621234567890');
INSERT INTO pegawai VALUES ('3456789012345612', 'Ben John', 'Laki-Laki', 'benjohn@gmail.com', 22, '6212345678');

-- Menu
INSERT INTO menu_minuman VALUES ('MNM001', 'Expresso', 18000);
INSERT INTO menu_minuman VALUES ('MNM002', 'Cappucino', 20000);
INSERT INTO menu_minuman VALUES ('MNM003', 'Latte', 21000);
INSERT INTO menu_minuman VALUES ('MNM004', 'Americano', 19000);
INSERT INTO menu_minuman VALUES ('MNM005', 'Mocha', 22000);
INSERT INTO menu_minuman VALUES ('MNM006', 'Macchiato', 23000);
INSERT INTO menu_minuman VALUES ('MNM007', 'Cold Brew', 21000);
INSERT INTO menu_minuman VALUES ('MNM008', 'Iced Coffe', 18000);
INSERT INTO menu_minuman VALUES ('MNM009', 'Affogato', 23000);
INSERT INTO menu_minuman VALUES ('MNM010', 'Coffee Frappe', 22000);

-- Transaksi Menu
INSERT INTO transaksi_minuman VALUES ('MNM006', 'TRX0000005', 2);
INSERT INTO transaksi_minuman VALUES ('MNM010', 'TRX0000001', 1);
INSERT INTO transaksi_minuman VALUES ('MNM005', 'TRX0000002', 1);
INSERT INTO transaksi_minuman VALUES ('MNM009', 'TRX0000005', 1);
INSERT INTO transaksi_minuman VALUES ('MNM001', 'TRX0000003', 3);
INSERT INTO transaksi_minuman VALUES ('MNM003', 'TRX0000006', 2);
INSERT INTO transaksi_minuman VALUES ('MNM004', 'TRX0000004', 2);
INSERT INTO transaksi_minuman VALUES ('MNM010', 'TRX0000004', 1);
INSERT INTO transaksi_minuman VALUES ('MNM003', 'TRX0000002', 2);
INSERT INTO transaksi_minuman VALUES ('MNM007', 'TRX0000001', 1);
INSERT INTO transaksi_minuman VALUES ('MNM001', 'TRX0000005', 1);
INSERT INTO transaksi_minuman VALUES ('MNM003', 'TRX0000003', 1);


-- Transaksi
INSERT INTO transaksi VALUES ('TRX0000001', '2023-10-01', 'Kartu Kredit' , 'CTR002', '2345678901234561');
INSERT INTO transaksi VALUES ('TRX0000002', '2023-10-03', 'Transfer Bank' , 'CTRo04', '3456789012345612');
INSERT INTO transaksi VALUES ('TRX0000003', '2023-10-05', 'Tunai' , 'CTR001', '3456789012345612');
INSERT INTO transaksi VALUES ('TRX0000004', '2023-10-15', 'Kartu Debit' , 'CTR003', '1234567890123456');
INSERT INTO transaksi VALUES ('TRX0000005', '2023-10-15', 'E-Wallet' , 'CTRo04', '1234567890123456');
INSERT INTO transaksi VALUES ('TRX0000006', '2023-10-21', 'TUnai' , 'CTR001', '2345678901234561');



-- 5
INSERT INTO transaksi_minuman VALUES ('MNM005', 'TRX0000003', 1);


-- 6
INSERT INTO pegawai (NIK, Nama_pegawai, Umur) VALUES ('1111222233334444', 'Maimunah', 25);

-- 7 
UPDATE customer
	SET ID_customer = 'CTR004'
	WHERE ID_customer = 'CTRo04';

-- 8
UPDATE pegawai
	SET Jenis_kelamin = 'Perempuan', No_telepon_pegawai = '621234567', Email = 'maimunah@gmail.com'
	WHERE Nama_pegawai = 'Maimunah';
	
-- 9
UPDATE membership
	SET Total_poin = 0
	WHERE Tanggal_kadaluarsa_kartu_membership < '2023-12-01';


-- 10
DELETE FROM membership

-- 11
DELETE FROM pegawai
	WHERE Nama_pegawai = 'Mainmunah';