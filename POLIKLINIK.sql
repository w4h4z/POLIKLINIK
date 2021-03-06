USE [master]
GO
/****** Object:  Database [POLIKLINIK]    Script Date: 18/10/2017 15:24:28 ******/
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
/****** Object:  Table [dbo].[DetailBiaya]    Script Date: 18/10/2017 15:24:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetailBiaya](
	[IDJenisBiaya] [varchar](5) NOT NULL,
	[NoPendaftaran] [int] NOT NULL,
 CONSTRAINT [PK_DetailBiaya] PRIMARY KEY CLUSTERED 
(
	[IDJenisBiaya] ASC,
	[NoPendaftaran] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Dokter]    Script Date: 18/10/2017 15:24:28 ******/
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
/****** Object:  Table [dbo].[JadwalPraktek]    Script Date: 18/10/2017 15:24:28 ******/
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
/****** Object:  Table [dbo].[JenisBiaya]    Script Date: 18/10/2017 15:24:28 ******/
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
/****** Object:  Table [dbo].[Login]    Script Date: 18/10/2017 15:24:28 ******/
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
/****** Object:  Table [dbo].[Obat]    Script Date: 18/10/2017 15:24:28 ******/
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
/****** Object:  Table [dbo].[Pasien]    Script Date: 18/10/2017 15:24:28 ******/
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
/****** Object:  Table [dbo].[Pegawai]    Script Date: 18/10/2017 15:24:28 ******/
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
/****** Object:  Table [dbo].[Pemeriksaan]    Script Date: 18/10/2017 15:24:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pemeriksaan](
	[NoPemeriksaan] [int] IDENTITY(1,1) NOT NULL,
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
/****** Object:  Table [dbo].[Pendaftaran]    Script Date: 18/10/2017 15:24:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pendaftaran](
	[NoPendaftaran] [int] IDENTITY(1,1) NOT NULL,
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
/****** Object:  Table [dbo].[Poliklinik]    Script Date: 18/10/2017 15:24:28 ******/
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
/****** Object:  Table [dbo].[Resep]    Script Date: 18/10/2017 15:24:28 ******/
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
/****** Object:  View [dbo].[DokterAndPoli]    Script Date: 18/10/2017 15:24:28 ******/
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
/****** Object:  View [dbo].[JadwalDokterPoli]    Script Date: 18/10/2017 15:24:28 ******/
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
INSERT [dbo].[Dokter] ([KodeDokter], [KodePoli], [NmDokter], [AlmDokter], [TelpDokter]) VALUES (N'D0001', N'K0001', N'Wildan', N'sawojajar', N'1244')
INSERT [dbo].[Dokter] ([KodeDokter], [KodePoli], [NmDokter], [AlmDokter], [TelpDokter]) VALUES (N'D0002', N'K0003', N'Akbar', N'Malang', N'09876543')
INSERT [dbo].[Dokter] ([KodeDokter], [KodePoli], [NmDokter], [AlmDokter], [TelpDokter]) VALUES (N'D0003', N'K0005', N'Rizal', N'Blimbing', N'07654')
INSERT [dbo].[JadwalPraktek] ([KodeJadwal], [KodeDokter], [Hari], [JamMulai], [JamSelesai]) VALUES (N'J0001', N'D0001', N'Selasa', N'08.00', N'15.00')
INSERT [dbo].[JadwalPraktek] ([KodeJadwal], [KodeDokter], [Hari], [JamMulai], [JamSelesai]) VALUES (N'J0002', N'D0002', N'Kamis', N'01.00', N'15.00')
INSERT [dbo].[JadwalPraktek] ([KodeJadwal], [KodeDokter], [Hari], [JamMulai], [JamSelesai]) VALUES (N'J0003', N'D0003', N'Jumat', N'09.00', N'14.00')
INSERT [dbo].[Login] ([Username], [NIP], [Password], [TypeUser]) VALUES (N'admin', N'1345', N'admin', N'Staff')
INSERT [dbo].[Login] ([Username], [NIP], [Password], [TypeUser]) VALUES (N'admin1', N'1', N'admin1', N'Staff')
INSERT [dbo].[Obat] ([KodeObat], [NmObat], [Merk], [Satuan], [HargaJual]) VALUES (N'O0001', N'Bodrexin', N'Kalbe', N'Pil', 3000)
INSERT [dbo].[Obat] ([KodeObat], [NmObat], [Merk], [Satuan], [HargaJual]) VALUES (N'O0002', N'Paramex', N'Kalbe', N'Pil', 5000)
INSERT [dbo].[Obat] ([KodeObat], [NmObat], [Merk], [Satuan], [HargaJual]) VALUES (N'O0003', N'OBH Woods', N'Unilever', N'Botol', 7000)
INSERT [dbo].[Pegawai] ([NIP], [NamaPeg], [AlmPeg], [TelpPeg], [TglLhrPeg], [JnsKelPeg]) VALUES (N'1', N'faisal', N'sidoarjo', N'09876', CAST(N'2017-10-18' AS Date), N'Pr')
INSERT [dbo].[Pegawai] ([NIP], [NamaPeg], [AlmPeg], [TelpPeg], [TglLhrPeg], [JnsKelPeg]) VALUES (N'1345', N'wahaz', N'malang', N'098765', CAST(N'2017-10-18' AS Date), N'Lk')
INSERT [dbo].[Poliklinik] ([KodePoli], [NamaPoli]) VALUES (N'K0001', N'Poliklinik Penyakit Dalam')
INSERT [dbo].[Poliklinik] ([KodePoli], [NamaPoli]) VALUES (N'K0002', N'Poliklinik Anak')
INSERT [dbo].[Poliklinik] ([KodePoli], [NamaPoli]) VALUES (N'K0003', N'Poliklinik Bedah')
INSERT [dbo].[Poliklinik] ([KodePoli], [NamaPoli]) VALUES (N'K0004', N'Poliklinik Gigi dan Mulut ')
INSERT [dbo].[Poliklinik] ([KodePoli], [NamaPoli]) VALUES (N'K0005', N'Poliklinik Konsultasi Gizi')
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
USE [master]
GO
ALTER DATABASE [POLIKLINIK] SET  READ_WRITE 
GO
