USE [master]
GO
/****** Object:  Database [POLIKLINIK]    Script Date: 19/10/2017 13:37:15 ******/
CREATE DATABASE [POLIKLINIK]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'POLIKLINIK', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\POLIKLINIK.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'POLIKLINIK_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\POLIKLINIK_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [POLIKLINIK].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [POLIKLINIK] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [POLIKLINIK] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [POLIKLINIK] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [POLIKLINIK] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [POLIKLINIK] SET ARITHABORT OFF 
GO
ALTER DATABASE [POLIKLINIK] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [POLIKLINIK] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [POLIKLINIK] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [POLIKLINIK] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [POLIKLINIK] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [POLIKLINIK] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [POLIKLINIK] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [POLIKLINIK] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [POLIKLINIK] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [POLIKLINIK] SET  DISABLE_BROKER 
GO
ALTER DATABASE [POLIKLINIK] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [POLIKLINIK] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [POLIKLINIK] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [POLIKLINIK] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [POLIKLINIK] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [POLIKLINIK] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [POLIKLINIK] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [POLIKLINIK] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [POLIKLINIK] SET  MULTI_USER 
GO
ALTER DATABASE [POLIKLINIK] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [POLIKLINIK] SET DB_CHAINING OFF 
GO
ALTER DATABASE [POLIKLINIK] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [POLIKLINIK] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [POLIKLINIK] SET DELAYED_DURABILITY = DISABLED 
GO
USE [POLIKLINIK]
GO
/****** Object:  Table [dbo].[DetailBiaya]    Script Date: 19/10/2017 13:37:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetailBiaya](
	[IDJenisBiaya] [varchar](5) NOT NULL,
	[NoPendaftaran] [int] NOT NULL,
	[BiayaObat] [int] NOT NULL,
	[Total] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Dokter]    Script Date: 19/10/2017 13:37:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dokter](
	[KodeDokter] [char](5) NOT NULL,
	[KodePoli] [char](5) NOT NULL,
	[NmDokter] [varchar](50) NOT NULL,
	[AlmDokter] [varchar](50) NOT NULL,
	[TelpDokter] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Dokter] PRIMARY KEY CLUSTERED 
(
	[KodeDokter] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[JadwalPraktek]    Script Date: 19/10/2017 13:37:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JadwalPraktek](
	[KodeJadwal] [varchar](5) NOT NULL,
	[KodeDokter] [char](5) NOT NULL,
	[Hari] [varchar](15) NOT NULL,
	[JamMulai] [varchar](20) NOT NULL,
	[JamSelesai] [varchar](20) NOT NULL,
 CONSTRAINT [PK_JadwalPraktek] PRIMARY KEY CLUSTERED 
(
	[KodeJadwal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[JenisBiaya]    Script Date: 19/10/2017 13:37:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JenisBiaya](
	[IDJenisBiaya] [varchar](5) NOT NULL,
	[NamaBiaya] [varchar](50) NOT NULL,
	[Tarif] [int] NOT NULL,
 CONSTRAINT [PK_JenisBiaya] PRIMARY KEY CLUSTERED 
(
	[IDJenisBiaya] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Login]    Script Date: 19/10/2017 13:37:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Login](
	[Username] [varchar](15) NOT NULL,
	[NIP] [varchar](10) NOT NULL,
	[Password] [varchar](15) NOT NULL,
	[TypeUser] [char](5) NOT NULL,
 CONSTRAINT [PK_Login] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Obat]    Script Date: 19/10/2017 13:37:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Obat](
	[KodeObat] [varchar](10) NOT NULL,
	[NmObat] [varchar](50) NOT NULL,
	[Merk] [varchar](50) NOT NULL,
	[Satuan] [varchar](20) NOT NULL,
	[HargaJual] [int] NOT NULL,
 CONSTRAINT [PK_Obat] PRIMARY KEY CLUSTERED 
(
	[KodeObat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Pasien]    Script Date: 19/10/2017 13:37:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pasien](
	[NoPasien] [varchar](10) NOT NULL,
	[NamaPass] [varchar](50) NOT NULL,
	[AlmPass] [varchar](50) NOT NULL,
	[TelpPass] [varchar](20) NOT NULL,
	[TglLhrPass] [date] NOT NULL,
	[JenisKelPass] [char](1) NOT NULL,
	[TglRegistrasi] [date] NOT NULL,
 CONSTRAINT [PK_Pasien] PRIMARY KEY CLUSTERED 
(
	[NoPasien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Pegawai]    Script Date: 19/10/2017 13:37:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pegawai](
	[NIP] [varchar](10) NOT NULL,
	[NamaPeg] [varchar](50) NOT NULL,
	[AlmPeg] [varchar](50) NOT NULL,
	[TelpPeg] [varchar](50) NOT NULL,
	[TglLhrPeg] [date] NOT NULL,
	[JnsKelPeg] [char](2) NOT NULL,
 CONSTRAINT [PK_Pegawai] PRIMARY KEY CLUSTERED 
(
	[NIP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Pemeriksaan]    Script Date: 19/10/2017 13:37:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pemeriksaan](
	[NoPemeriksaan] [int] NOT NULL,
	[NoPendaftaran] [int] NOT NULL,
	[Keluhan] [text] NOT NULL,
	[Diagnosa] [text] NOT NULL,
	[Perawatan] [text] NOT NULL,
	[Tindakan] [text] NOT NULL,
	[BeratBadan] [int] NOT NULL,
	[TensiDiastolik] [int] NOT NULL,
	[TensiSistolik] [int] NOT NULL,
 CONSTRAINT [PK_Pemeriksaan] PRIMARY KEY CLUSTERED 
(
	[NoPemeriksaan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Pendaftaran]    Script Date: 19/10/2017 13:37:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pendaftaran](
	[NoPendaftaran] [int] NOT NULL,
	[NoPasien] [varchar](10) NOT NULL,
	[NIP] [varchar](10) NOT NULL,
	[KodeJadwal] [varchar](5) NOT NULL,
	[TglPendaftaran] [date] NOT NULL,
	[NoUrut] [int] NOT NULL,
 CONSTRAINT [PK_Pendaftaran] PRIMARY KEY CLUSTERED 
(
	[NoPendaftaran] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Poliklinik]    Script Date: 19/10/2017 13:37:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Poliklinik](
	[KodePoli] [char](5) NOT NULL,
	[NamaPoli] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Poliklinik] PRIMARY KEY CLUSTERED 
(
	[KodePoli] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Resep]    Script Date: 19/10/2017 13:37:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Resep](
	[NoResep] [char](10) NOT NULL,
	[NoPemeriksaan] [int] NOT NULL,
	[KodeObat] [varchar](10) NOT NULL,
	[Dosis] [text] NOT NULL,
	[Jumlah] [int] NOT NULL,
 CONSTRAINT [PK_Resep] PRIMARY KEY CLUSTERED 
(
	[NoResep] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  View [dbo].[BayarView]    Script Date: 19/10/2017 13:37:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[BayarView]
AS
SELECT        dbo.JadwalPraktek.KodeJadwal, dbo.JadwalPraktek.KodeDokter, dbo.JadwalPraktek.Hari, dbo.JadwalPraktek.JamMulai, dbo.JadwalPraktek.JamSelesai, dbo.Dokter.KodeDokter AS Expr1, dbo.Dokter.KodePoli, 
                         dbo.Dokter.NmDokter, dbo.Dokter.AlmDokter, dbo.Dokter.TelpDokter, dbo.JenisBiaya.IDJenisBiaya, dbo.JenisBiaya.NamaBiaya, dbo.JenisBiaya.Tarif, dbo.DetailBiaya.IDJenisBiaya AS Expr2, 
                         dbo.DetailBiaya.NoPendaftaran, dbo.Pegawai.NIP, dbo.Pegawai.NamaPeg, dbo.Pegawai.AlmPeg, dbo.Pegawai.TelpPeg, dbo.Pegawai.TglLhrPeg, dbo.Pegawai.JnsKelPeg, dbo.Login.Username, 
                         dbo.Login.NIP AS Expr3, dbo.Login.Password, dbo.Login.TypeUser, dbo.Pendaftaran.NoPendaftaran AS Expr4, dbo.Pendaftaran.NoPasien, dbo.Pendaftaran.NIP AS Expr5, dbo.Pendaftaran.KodeJadwal AS Expr6, 
                         dbo.Pendaftaran.TglPendaftaran, dbo.Pendaftaran.NoUrut, dbo.Pasien.NoPasien AS Expr7, dbo.Pasien.NamaPass, dbo.Pasien.AlmPass, dbo.Pasien.TelpPass, dbo.Pasien.TglLhrPass, dbo.Pasien.JenisKelPass, 
                         dbo.Pasien.TglRegistrasi, dbo.Pemeriksaan.NoPemeriksaan, dbo.Pemeriksaan.NoPendaftaran AS Expr8, dbo.Pemeriksaan.Keluhan, dbo.Pemeriksaan.Diagnosa, dbo.Pemeriksaan.Perawatan, 
                         dbo.Pemeriksaan.Tindakan, dbo.Pemeriksaan.BeratBadan, dbo.Pemeriksaan.TensiDiastolik, dbo.Pemeriksaan.TensiSistolik, dbo.Poliklinik.KodePoli AS Expr9, dbo.Poliklinik.NamaPoli, dbo.Resep.NoResep, 
                         dbo.Resep.NoPemeriksaan AS Expr10, dbo.Resep.KodeObat, dbo.Resep.Dosis, dbo.Resep.Jumlah, dbo.Obat.KodeObat AS Expr11, dbo.Obat.NmObat, dbo.Obat.Merk, dbo.Obat.Satuan, dbo.Obat.HargaJual
FROM            dbo.JadwalPraktek INNER JOIN
                         dbo.Dokter ON dbo.JadwalPraktek.KodeDokter = dbo.Dokter.KodeDokter INNER JOIN
                         dbo.JenisBiaya INNER JOIN
                         dbo.DetailBiaya ON dbo.JenisBiaya.IDJenisBiaya = dbo.DetailBiaya.IDJenisBiaya INNER JOIN
                         dbo.Pegawai INNER JOIN
                         dbo.Login ON dbo.Pegawai.NIP = dbo.Login.NIP INNER JOIN
                         dbo.Pendaftaran ON dbo.Pegawai.NIP = dbo.Pendaftaran.NIP INNER JOIN
                         dbo.Pasien ON dbo.Pendaftaran.NoPasien = dbo.Pasien.NoPasien ON dbo.DetailBiaya.NoPendaftaran = dbo.Pendaftaran.NoPendaftaran ON 
                         dbo.JadwalPraktek.KodeJadwal = dbo.Pendaftaran.KodeJadwal INNER JOIN
                         dbo.Pemeriksaan ON dbo.Pendaftaran.NoPendaftaran = dbo.Pemeriksaan.NoPendaftaran INNER JOIN
                         dbo.Poliklinik ON dbo.Dokter.KodePoli = dbo.Poliklinik.KodePoli INNER JOIN
                         dbo.Resep ON dbo.Pemeriksaan.NoPemeriksaan = dbo.Resep.NoPemeriksaan INNER JOIN
                         dbo.Obat ON dbo.Resep.KodeObat = dbo.Obat.KodeObat

GO
/****** Object:  View [dbo].[BayarVieww]    Script Date: 19/10/2017 13:37:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[BayarVieww]
AS
SELECT        dbo.DetailBiaya.IDJenisBiaya, dbo.DetailBiaya.NoPendaftaran, dbo.DetailBiaya.BiayaObat, dbo.DetailBiaya.Total, dbo.JenisBiaya.IDJenisBiaya AS Expr1, dbo.JenisBiaya.NamaBiaya, dbo.JenisBiaya.Tarif, 
                         dbo.Pendaftaran.NoPendaftaran AS Expr2, dbo.Pendaftaran.NoPasien, dbo.Pendaftaran.NIP, dbo.Pendaftaran.KodeJadwal, dbo.Pendaftaran.TglPendaftaran, dbo.Pendaftaran.NoUrut, 
                         dbo.Pasien.NoPasien AS Expr3, dbo.Pasien.NamaPass, dbo.Pasien.AlmPass, dbo.Pasien.TelpPass, dbo.Pasien.TglLhrPass, dbo.Pasien.JenisKelPass, dbo.Pasien.TglRegistrasi, 
                         dbo.Pemeriksaan.NoPemeriksaan, dbo.Pemeriksaan.NoPendaftaran AS Expr4, dbo.Pemeriksaan.Keluhan, dbo.Pemeriksaan.Diagnosa, dbo.Pemeriksaan.Perawatan, dbo.Pemeriksaan.Tindakan, 
                         dbo.Pemeriksaan.BeratBadan, dbo.Pemeriksaan.TensiDiastolik, dbo.Pemeriksaan.TensiSistolik, dbo.Obat.KodeObat, dbo.Obat.NmObat, dbo.Obat.Merk, dbo.Obat.Satuan, dbo.Obat.HargaJual
FROM            dbo.DetailBiaya INNER JOIN
                         dbo.JenisBiaya ON dbo.DetailBiaya.IDJenisBiaya = dbo.JenisBiaya.IDJenisBiaya INNER JOIN
                         dbo.Pendaftaran ON dbo.DetailBiaya.NoPendaftaran = dbo.Pendaftaran.NoPendaftaran INNER JOIN
                         dbo.Pasien ON dbo.Pendaftaran.NoPasien = dbo.Pasien.NoPasien INNER JOIN
                         dbo.Pemeriksaan ON dbo.Pendaftaran.NoPendaftaran = dbo.Pemeriksaan.NoPendaftaran INNER JOIN
                         dbo.Resep ON dbo.Pemeriksaan.NoPemeriksaan = dbo.Resep.NoPemeriksaan INNER JOIN
                         dbo.Obat ON dbo.Resep.KodeObat = dbo.Obat.KodeObat

GO
/****** Object:  View [dbo].[DokterAndPoli]    Script Date: 19/10/2017 13:37:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[DokterAndPoli]
AS
SELECT        dbo.Dokter.KodeDokter, dbo.Dokter.KodePoli, dbo.Dokter.NmDokter, dbo.Dokter.AlmDokter, dbo.Dokter.TelpDokter, dbo.Poliklinik.NamaPoli
FROM            dbo.Dokter INNER JOIN
                         dbo.Poliklinik ON dbo.Dokter.KodePoli = dbo.Poliklinik.KodePoli

GO
/****** Object:  View [dbo].[JadwalDokterPoli]    Script Date: 19/10/2017 13:37:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[JadwalDokterPoli]
AS
SELECT        dbo.Dokter.KodeDokter, dbo.Dokter.KodePoli, dbo.Dokter.NmDokter, dbo.Dokter.AlmDokter, dbo.Dokter.TelpDokter, dbo.JadwalPraktek.KodeJadwal, dbo.JadwalPraktek.Hari, dbo.JadwalPraktek.JamMulai, 
                         dbo.JadwalPraktek.JamSelesai, dbo.Poliklinik.NamaPoli
FROM            dbo.Dokter INNER JOIN
                         dbo.JadwalPraktek ON dbo.Dokter.KodeDokter = dbo.JadwalPraktek.KodeDokter INNER JOIN
                         dbo.Poliklinik ON dbo.Dokter.KodePoli = dbo.Poliklinik.KodePoli

GO
/****** Object:  View [dbo].[PemeriksaanPasien]    Script Date: 19/10/2017 13:37:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[PemeriksaanPasien]
AS
SELECT        dbo.Pasien.NoPasien, dbo.Pasien.NamaPass, dbo.Pasien.AlmPass, dbo.Pasien.TelpPass, dbo.Pasien.TglLhrPass, dbo.Pasien.JenisKelPass, dbo.Pasien.TglRegistrasi, dbo.Pendaftaran.NoPendaftaran, 
                         dbo.Pendaftaran.NoPasien AS Expr1, dbo.Pendaftaran.NIP, dbo.Pendaftaran.KodeJadwal, dbo.Pendaftaran.TglPendaftaran, dbo.Pendaftaran.NoUrut, dbo.Pemeriksaan.NoPemeriksaan, 
                         dbo.Pemeriksaan.NoPendaftaran AS Expr2, dbo.Pemeriksaan.Keluhan, dbo.Pemeriksaan.Diagnosa, dbo.Pemeriksaan.Perawatan, dbo.Pemeriksaan.Tindakan, dbo.Pemeriksaan.BeratBadan, 
                         dbo.Pemeriksaan.TensiDiastolik, dbo.Pemeriksaan.TensiSistolik
FROM            dbo.Pasien INNER JOIN
                         dbo.Pendaftaran ON dbo.Pasien.NoPasien = dbo.Pendaftaran.NoPasien INNER JOIN
                         dbo.Pemeriksaan ON dbo.Pendaftaran.NoPendaftaran = dbo.Pemeriksaan.NoPendaftaran

GO
/****** Object:  View [dbo].[PendaftaranView]    Script Date: 19/10/2017 13:37:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[PendaftaranView]
AS
SELECT        dbo.Dokter.KodeDokter, dbo.Dokter.KodePoli, dbo.Dokter.NmDokter, dbo.Dokter.AlmDokter, dbo.Dokter.TelpDokter, dbo.JadwalPraktek.KodeJadwal, dbo.JadwalPraktek.Hari, dbo.JadwalPraktek.JamMulai, 
                         dbo.JadwalPraktek.JamSelesai, dbo.Pendaftaran.NoPendaftaran, dbo.Pendaftaran.NoPasien, dbo.Pendaftaran.NIP, dbo.Pendaftaran.TglPendaftaran, dbo.Pendaftaran.NoUrut, dbo.Pasien.NamaPass, 
                         dbo.Pasien.AlmPass, dbo.Pasien.TelpPass, dbo.Pasien.TglLhrPass, dbo.Pasien.JenisKelPass, dbo.Pasien.TglRegistrasi, dbo.Pegawai.NamaPeg, dbo.Pegawai.AlmPeg, dbo.Pegawai.TelpPeg, 
                         dbo.Pegawai.TglLhrPeg, dbo.Pegawai.JnsKelPeg, dbo.Poliklinik.NamaPoli
FROM            dbo.Dokter INNER JOIN
                         dbo.JadwalPraktek ON dbo.Dokter.KodeDokter = dbo.JadwalPraktek.KodeDokter INNER JOIN
                         dbo.Pendaftaran ON dbo.JadwalPraktek.KodeJadwal = dbo.Pendaftaran.KodeJadwal INNER JOIN
                         dbo.Pasien ON dbo.Pendaftaran.NoPasien = dbo.Pasien.NoPasien INNER JOIN
                         dbo.Pegawai ON dbo.Pendaftaran.NIP = dbo.Pegawai.NIP INNER JOIN
                         dbo.Poliklinik ON dbo.Dokter.KodePoli = dbo.Poliklinik.KodePoli

GO
/****** Object:  View [dbo].[Recapt]    Script Date: 19/10/2017 13:37:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Recapt]
AS
SELECT        dbo.DetailBiaya.IDJenisBiaya, dbo.DetailBiaya.NoPendaftaran, dbo.DetailBiaya.BiayaObat, dbo.DetailBiaya.Total, dbo.JenisBiaya.IDJenisBiaya AS Expr1, dbo.JenisBiaya.NamaBiaya, dbo.JenisBiaya.Tarif, 
                         dbo.Pendaftaran.NoPendaftaran AS Expr2, dbo.Pendaftaran.NoPasien, dbo.Pendaftaran.NIP, dbo.Pendaftaran.KodeJadwal, dbo.Pendaftaran.TglPendaftaran, dbo.Pendaftaran.NoUrut, 
                         dbo.Pasien.NoPasien AS Expr3, dbo.Pasien.NamaPass, dbo.Pasien.AlmPass, dbo.Pasien.TelpPass, dbo.Pasien.TglLhrPass, dbo.Pasien.JenisKelPass, dbo.Pasien.TglRegistrasi, 
                         dbo.Pemeriksaan.NoPemeriksaan, dbo.Pemeriksaan.NoPendaftaran AS Expr4, dbo.Pemeriksaan.Keluhan, dbo.Pemeriksaan.Diagnosa, dbo.Pemeriksaan.Perawatan, dbo.Pemeriksaan.Tindakan, 
                         dbo.Pemeriksaan.BeratBadan, dbo.Pemeriksaan.TensiDiastolik, dbo.Pemeriksaan.TensiSistolik
FROM            dbo.DetailBiaya INNER JOIN
                         dbo.JenisBiaya ON dbo.DetailBiaya.IDJenisBiaya = dbo.JenisBiaya.IDJenisBiaya INNER JOIN
                         dbo.Pendaftaran ON dbo.DetailBiaya.NoPendaftaran = dbo.Pendaftaran.NoPendaftaran INNER JOIN
                         dbo.Pasien ON dbo.Pendaftaran.NoPasien = dbo.Pasien.NoPasien INNER JOIN
                         dbo.Pemeriksaan ON dbo.Pendaftaran.NoPendaftaran = dbo.Pemeriksaan.NoPendaftaran
WHERE        (dbo.JenisBiaya.IDJenisBiaya =
                             (SELECT        MAX(IDJenisBiaya) AS lastId
                               FROM            dbo.JenisBiaya AS biaya1))

GO
/****** Object:  View [dbo].[ResepObat]    Script Date: 19/10/2017 13:37:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ResepObat]
AS
SELECT        dbo.Pendaftaran.NoPendaftaran, dbo.Pendaftaran.NoPasien, dbo.Pendaftaran.NIP, dbo.Pendaftaran.KodeJadwal, dbo.Pendaftaran.TglPendaftaran, dbo.Pendaftaran.NoUrut, dbo.Pasien.NoPasien AS Expr1, 
                         dbo.Pasien.NamaPass, dbo.Pasien.AlmPass, dbo.Pasien.TelpPass, dbo.Pasien.TglLhrPass, dbo.Pasien.JenisKelPass, dbo.Pasien.TglRegistrasi, dbo.Pemeriksaan.NoPemeriksaan, 
                         dbo.Pemeriksaan.NoPendaftaran AS Expr2, dbo.Pemeriksaan.Keluhan, dbo.Pemeriksaan.Diagnosa, dbo.Pemeriksaan.Perawatan, dbo.Pemeriksaan.Tindakan, dbo.Pemeriksaan.BeratBadan, 
                         dbo.Pemeriksaan.TensiDiastolik, dbo.Pemeriksaan.TensiSistolik, dbo.Resep.NoResep, dbo.Resep.NoPemeriksaan AS Expr3, dbo.Resep.KodeObat, dbo.Resep.Dosis, dbo.Resep.Jumlah, 
                         dbo.Obat.KodeObat AS Expr4, dbo.Obat.NmObat, dbo.Obat.Merk, dbo.Obat.Satuan, dbo.Obat.HargaJual
FROM            dbo.Pendaftaran INNER JOIN
                         dbo.Pasien ON dbo.Pendaftaran.NoPasien = dbo.Pasien.NoPasien INNER JOIN
                         dbo.Pemeriksaan ON dbo.Pendaftaran.NoPendaftaran = dbo.Pemeriksaan.NoPendaftaran INNER JOIN
                         dbo.Resep ON dbo.Pemeriksaan.NoPemeriksaan = dbo.Resep.NoPemeriksaan INNER JOIN
                         dbo.Obat ON dbo.Resep.KodeObat = dbo.Obat.KodeObat

GO
INSERT [dbo].[DetailBiaya] ([IDJenisBiaya], [NoPendaftaran], [BiayaObat], [Total]) VALUES (N'B0001', 1, 7000, 17000)
INSERT [dbo].[Dokter] ([KodeDokter], [KodePoli], [NmDokter], [AlmDokter], [TelpDokter]) VALUES (N'D0001', N'K0001', N'Wildan', N'sawojajar', N'1244')
INSERT [dbo].[Dokter] ([KodeDokter], [KodePoli], [NmDokter], [AlmDokter], [TelpDokter]) VALUES (N'D0002', N'K0003', N'Akbar', N'Malang', N'09876543')
INSERT [dbo].[Dokter] ([KodeDokter], [KodePoli], [NmDokter], [AlmDokter], [TelpDokter]) VALUES (N'D0003', N'K0005', N'Rizal', N'Blimbing', N'07654')
INSERT [dbo].[JadwalPraktek] ([KodeJadwal], [KodeDokter], [Hari], [JamMulai], [JamSelesai]) VALUES (N'J0001', N'D0001', N'Selasa', N'08.00', N'15.00')
INSERT [dbo].[JadwalPraktek] ([KodeJadwal], [KodeDokter], [Hari], [JamMulai], [JamSelesai]) VALUES (N'J0002', N'D0002', N'Kamis', N'01.00', N'15.00')
INSERT [dbo].[JadwalPraktek] ([KodeJadwal], [KodeDokter], [Hari], [JamMulai], [JamSelesai]) VALUES (N'J0003', N'D0003', N'Jumat', N'09.00', N'14.00')
INSERT [dbo].[JadwalPraktek] ([KodeJadwal], [KodeDokter], [Hari], [JamMulai], [JamSelesai]) VALUES (N'J0004', N'D0001', N'Kamis', N'07.00', N'17.00')
INSERT [dbo].[JenisBiaya] ([IDJenisBiaya], [NamaBiaya], [Tarif]) VALUES (N'B0001', N'Operasi Pelastik', 10000)
INSERT [dbo].[Login] ([Username], [NIP], [Password], [TypeUser]) VALUES (N'admin', N'1345', N'admin', N'Staff')
INSERT [dbo].[Login] ([Username], [NIP], [Password], [TypeUser]) VALUES (N'admin1', N'1', N'admin1', N'Staff')
INSERT [dbo].[Obat] ([KodeObat], [NmObat], [Merk], [Satuan], [HargaJual]) VALUES (N'O0001', N'Bodrexin', N'Kalbe', N'Pil', 3000)
INSERT [dbo].[Obat] ([KodeObat], [NmObat], [Merk], [Satuan], [HargaJual]) VALUES (N'O0002', N'Paramex', N'Kalbe', N'Pil', 5000)
INSERT [dbo].[Obat] ([KodeObat], [NmObat], [Merk], [Satuan], [HargaJual]) VALUES (N'O0003', N'OBH Woods', N'Unilever', N'Botol', 7000)
INSERT [dbo].[Pasien] ([NoPasien], [NamaPass], [AlmPass], [TelpPass], [TglLhrPass], [JenisKelPass], [TglRegistrasi]) VALUES (N'C0001', N'Amirudin', N'Sawojajar', N'06566', CAST(N'2017-10-19' AS Date), N'L', CAST(N'2017-10-19' AS Date))
INSERT [dbo].[Pasien] ([NoPasien], [NamaPass], [AlmPass], [TelpPass], [TglLhrPass], [JenisKelPass], [TglRegistrasi]) VALUES (N'C0002', N'Rusli', N'Malang', N'098765', CAST(N'2017-10-19' AS Date), N'P', CAST(N'2017-10-19' AS Date))
INSERT [dbo].[Pegawai] ([NIP], [NamaPeg], [AlmPeg], [TelpPeg], [TglLhrPeg], [JnsKelPeg]) VALUES (N'1', N'faisal', N'sidoarjo', N'09876', CAST(N'2017-10-18' AS Date), N'Pr')
INSERT [dbo].[Pegawai] ([NIP], [NamaPeg], [AlmPeg], [TelpPeg], [TglLhrPeg], [JnsKelPeg]) VALUES (N'1345', N'wahaz', N'malang', N'098765', CAST(N'2017-10-18' AS Date), N'Lk')
INSERT [dbo].[Pemeriksaan] ([NoPemeriksaan], [NoPendaftaran], [Keluhan], [Diagnosa], [Perawatan], [Tindakan], [BeratBadan], [TensiDiastolik], [TensiSistolik]) VALUES (1, 1, N'batuk,pilek', N'flu', N'istirahat 2 hari', N'minum obat', 60, 100, 120)
INSERT [dbo].[Pemeriksaan] ([NoPemeriksaan], [NoPendaftaran], [Keluhan], [Diagnosa], [Perawatan], [Tindakan], [BeratBadan], [TensiDiastolik], [TensiSistolik]) VALUES (2, 2, N'panas, demam,batuk', N'tifus', N'suntik', N'rawat inap 3 hari', 70, 150, 140)
INSERT [dbo].[Pendaftaran] ([NoPendaftaran], [NoPasien], [NIP], [KodeJadwal], [TglPendaftaran], [NoUrut]) VALUES (1, N'C0001', N'1345', N'J0002', CAST(N'2017-10-19' AS Date), 1)
INSERT [dbo].[Pendaftaran] ([NoPendaftaran], [NoPasien], [NIP], [KodeJadwal], [TglPendaftaran], [NoUrut]) VALUES (2, N'C0002', N'1345', N'J0002', CAST(N'2017-10-19' AS Date), 2)
INSERT [dbo].[Poliklinik] ([KodePoli], [NamaPoli]) VALUES (N'K0001', N'Poliklinik Penyakit Dalam')
INSERT [dbo].[Poliklinik] ([KodePoli], [NamaPoli]) VALUES (N'K0002', N'Poliklinik Anak')
INSERT [dbo].[Poliklinik] ([KodePoli], [NamaPoli]) VALUES (N'K0003', N'Poliklinik Bedah')
INSERT [dbo].[Poliklinik] ([KodePoli], [NamaPoli]) VALUES (N'K0004', N'Poliklinik Gigi dan Mulut ')
INSERT [dbo].[Poliklinik] ([KodePoli], [NamaPoli]) VALUES (N'K0005', N'Poliklinik Konsultasi Gizi')
INSERT [dbo].[Resep] ([NoResep], [NoPemeriksaan], [KodeObat], [Dosis], [Jumlah]) VALUES (N'R0001     ', 2, N'O0001', N'10', 12)
INSERT [dbo].[Resep] ([NoResep], [NoPemeriksaan], [KodeObat], [Dosis], [Jumlah]) VALUES (N'R0002     ', 2, N'O0002', N'10', 5)
INSERT [dbo].[Resep] ([NoResep], [NoPemeriksaan], [KodeObat], [Dosis], [Jumlah]) VALUES (N'R0003     ', 1, N'O0003', N'1', 1)
ALTER TABLE [dbo].[DetailBiaya]  WITH CHECK ADD  CONSTRAINT [FK_DetailBiaya_JenisBiaya] FOREIGN KEY([IDJenisBiaya])
REFERENCES [dbo].[JenisBiaya] ([IDJenisBiaya])
GO
ALTER TABLE [dbo].[DetailBiaya] CHECK CONSTRAINT [FK_DetailBiaya_JenisBiaya]
GO
ALTER TABLE [dbo].[DetailBiaya]  WITH CHECK ADD  CONSTRAINT [FK_DetailBiaya_Pendaftaran] FOREIGN KEY([NoPendaftaran])
REFERENCES [dbo].[Pendaftaran] ([NoPendaftaran])
GO
ALTER TABLE [dbo].[DetailBiaya] CHECK CONSTRAINT [FK_DetailBiaya_Pendaftaran]
GO
ALTER TABLE [dbo].[Dokter]  WITH CHECK ADD  CONSTRAINT [FK_Dokter_Poliklinik] FOREIGN KEY([KodePoli])
REFERENCES [dbo].[Poliklinik] ([KodePoli])
GO
ALTER TABLE [dbo].[Dokter] CHECK CONSTRAINT [FK_Dokter_Poliklinik]
GO
ALTER TABLE [dbo].[JadwalPraktek]  WITH CHECK ADD  CONSTRAINT [FK_JadwalPraktek_Dokter] FOREIGN KEY([KodeDokter])
REFERENCES [dbo].[Dokter] ([KodeDokter])
GO
ALTER TABLE [dbo].[JadwalPraktek] CHECK CONSTRAINT [FK_JadwalPraktek_Dokter]
GO
ALTER TABLE [dbo].[Login]  WITH CHECK ADD  CONSTRAINT [FK_Login_Pegawai] FOREIGN KEY([NIP])
REFERENCES [dbo].[Pegawai] ([NIP])
GO
ALTER TABLE [dbo].[Login] CHECK CONSTRAINT [FK_Login_Pegawai]
GO
ALTER TABLE [dbo].[Pemeriksaan]  WITH CHECK ADD  CONSTRAINT [FK_Pemeriksaan_Pendaftaran] FOREIGN KEY([NoPendaftaran])
REFERENCES [dbo].[Pendaftaran] ([NoPendaftaran])
GO
ALTER TABLE [dbo].[Pemeriksaan] CHECK CONSTRAINT [FK_Pemeriksaan_Pendaftaran]
GO
ALTER TABLE [dbo].[Pendaftaran]  WITH CHECK ADD  CONSTRAINT [FK_Pendaftaran_JadwalPraktek] FOREIGN KEY([KodeJadwal])
REFERENCES [dbo].[JadwalPraktek] ([KodeJadwal])
GO
ALTER TABLE [dbo].[Pendaftaran] CHECK CONSTRAINT [FK_Pendaftaran_JadwalPraktek]
GO
ALTER TABLE [dbo].[Pendaftaran]  WITH CHECK ADD  CONSTRAINT [FK_Pendaftaran_Pasien] FOREIGN KEY([NoPasien])
REFERENCES [dbo].[Pasien] ([NoPasien])
GO
ALTER TABLE [dbo].[Pendaftaran] CHECK CONSTRAINT [FK_Pendaftaran_Pasien]
GO
ALTER TABLE [dbo].[Pendaftaran]  WITH CHECK ADD  CONSTRAINT [FK_Pendaftaran_Pegawai] FOREIGN KEY([NIP])
REFERENCES [dbo].[Pegawai] ([NIP])
GO
ALTER TABLE [dbo].[Pendaftaran] CHECK CONSTRAINT [FK_Pendaftaran_Pegawai]
GO
ALTER TABLE [dbo].[Resep]  WITH CHECK ADD  CONSTRAINT [FK_Resep_Obat] FOREIGN KEY([KodeObat])
REFERENCES [dbo].[Obat] ([KodeObat])
GO
ALTER TABLE [dbo].[Resep] CHECK CONSTRAINT [FK_Resep_Obat]
GO
ALTER TABLE [dbo].[Resep]  WITH CHECK ADD  CONSTRAINT [FK_Resep_Pemeriksaan] FOREIGN KEY([NoPemeriksaan])
REFERENCES [dbo].[Pemeriksaan] ([NoPemeriksaan])
GO
ALTER TABLE [dbo].[Resep] CHECK CONSTRAINT [FK_Resep_Pemeriksaan]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "DetailBiaya"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 102
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Dokter"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "JadwalPraktek"
            Begin Extent = 
               Top = 6
               Left = 454
               Bottom = 136
               Right = 624
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "JenisBiaya"
            Begin Extent = 
               Top = 6
               Left = 662
               Bottom = 119
               Right = 832
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Login"
            Begin Extent = 
               Top = 6
               Left = 870
               Bottom = 136
               Right = 1040
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Obat"
            Begin Extent = 
               Top = 6
               Left = 1078
               Bottom = 136
               Right = 1248
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Pasien"
            Begin Extent = 
               Top = 6
               Left = 1286
               Bottom = 136
               Right = 1456
            End
            DisplayFlags = 2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'BayarView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'80
            TopColumn = 0
         End
         Begin Table = "Pegawai"
            Begin Extent = 
               Top = 102
               Left = 38
               Bottom = 232
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Pemeriksaan"
            Begin Extent = 
               Top = 120
               Left = 662
               Bottom = 250
               Right = 834
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Pendaftaran"
            Begin Extent = 
               Top = 138
               Left = 246
               Bottom = 268
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Poliklinik"
            Begin Extent = 
               Top = 138
               Left = 454
               Bottom = 234
               Right = 624
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Resep"
            Begin Extent = 
               Top = 138
               Left = 872
               Bottom = 268
               Right = 1044
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 10
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'BayarView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'BayarView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[17] 2[22] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "DetailBiaya"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "JenisBiaya"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 119
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Pasien"
            Begin Extent = 
               Top = 6
               Left = 662
               Bottom = 136
               Right = 832
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Pemeriksaan"
            Begin Extent = 
               Top = 6
               Left = 870
               Bottom = 136
               Right = 1042
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Pendaftaran"
            Begin Extent = 
               Top = 6
               Left = 1080
               Bottom = 136
               Right = 1250
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Obat"
            Begin Extent = 
               Top = 6
               Left = 454
               Bottom = 136
               Right = 624
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Resep"
            Begin Extent = 
               Top = 6
               Left = 1288
               Bottom = 136
               Right = 1460
            End
            DisplayFlags ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'BayarVieww'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'= 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 35
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'BayarVieww'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'BayarVieww'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Dokter"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Poliklinik"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 102
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'DokterAndPoli'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'DokterAndPoli'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Dokter"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "JadwalPraktek"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Poliklinik"
            Begin Extent = 
               Top = 6
               Left = 454
               Bottom = 102
               Right = 624
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 11
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'JadwalDokterPoli'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'JadwalDokterPoli'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Pasien"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Pemeriksaan"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 418
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Pendaftaran"
            Begin Extent = 
               Top = 6
               Left = 456
               Bottom = 136
               Right = 626
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'PemeriksaanPasien'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'PemeriksaanPasien'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Dokter"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "JadwalPraktek"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Pasien"
            Begin Extent = 
               Top = 6
               Left = 454
               Bottom = 136
               Right = 624
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Pegawai"
            Begin Extent = 
               Top = 6
               Left = 662
               Bottom = 136
               Right = 832
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Pendaftaran"
            Begin Extent = 
               Top = 6
               Left = 870
               Bottom = 136
               Right = 1040
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Poliklinik"
            Begin Extent = 
               Top = 6
               Left = 1078
               Bottom = 102
               Right = 1248
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 32
         Width = 284
         Width = 1500
         Width = 150' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'PendaftaranView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'0
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'PendaftaranView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'PendaftaranView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "DetailBiaya"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "JenisBiaya"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 119
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Pasien"
            Begin Extent = 
               Top = 6
               Left = 454
               Bottom = 136
               Right = 624
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Pemeriksaan"
            Begin Extent = 
               Top = 6
               Left = 662
               Bottom = 136
               Right = 834
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Pendaftaran"
            Begin Extent = 
               Top = 6
               Left = 872
               Bottom = 136
               Right = 1042
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 30
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
    ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Recapt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'     Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Recapt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Recapt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Obat"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Pasien"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Pemeriksaan"
            Begin Extent = 
               Top = 6
               Left = 454
               Bottom = 136
               Right = 626
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Pendaftaran"
            Begin Extent = 
               Top = 6
               Left = 664
               Bottom = 136
               Right = 834
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Resep"
            Begin Extent = 
               Top = 6
               Left = 872
               Bottom = 136
               Right = 1044
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 10
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
        ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ResepObat'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N' Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ResepObat'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ResepObat'
GO
USE [master]
GO
ALTER DATABASE [POLIKLINIK] SET  READ_WRITE 
GO
