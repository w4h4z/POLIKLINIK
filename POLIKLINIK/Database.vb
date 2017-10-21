Imports System.Data.SqlClient
Public Class Database
    Dim dbcomm As New SqlCommand
    Dim dbconn As SqlConnection
    Dim dbread As SqlDataReader
    Dim sql As String
    Dim lastId As String

    Public Function conn()
        dbconn = New SqlConnection("data source=.\SQLEXPRESS;database=POLIKLINIK;integrated security=true")

        Try
            dbconn.Open()
        Catch ex As Exception
            MsgBox(ex.Message, MsgBoxStyle.Critical)
        End Try

        Return dbconn
    End Function

    Public Function crud(sql)
        Try
            dbcomm = New SqlCommand(sql, conn)
            dbread = dbcomm.ExecuteReader
            dbread.Read()
            Return dbread
        Catch ex As Exception
            MsgBox(ex.Message, MsgBoxStyle.Critical)
        End Try
    End Function

    Public Function crudid(sql)
        Try
            dbcomm = New SqlCommand(sql, conn)
            lastId = dbcomm.ExecuteScalar
        Catch ex As Exception
            MsgBox(ex.Message, MsgBoxStyle.Critical)
        End Try

        Return lastId
    End Function

    Public Function login(uname, pw)
        sql = "select * from Login where Username='" & uname & "' and Password='" & pw & "'"
        Dim b As Boolean
        dbread = crud(sql)
        If dbread.HasRows Then
            b = True
        End If

        dbread.Close()

        Return b
    End Function

#Region "Pegawai"
    Public Sub insertPegawai(nip, nama, alm, telp, lhr, jk)
        sql = "insert into Pegawai(NIP,NamaPeg,AlmPeg,TelpPeg,TglLhrPeg,JnsKelPeg) values('" & nip & "','" & nama & "','" & alm & "','" & telp & "','" & lhr & "','" & jk & "')"

        crud(sql)
        dbread.Close()
    End Sub

    Public Sub insertAkun(uname, nip, pw, tu)
        sql = "insert into Login(Username,NIP,Password,TypeUser) values('" & uname & "','" & nip & "','" & pw & "','" & tu & "')"

        crud(sql)
        dbread.Close()
    End Sub

    Public Sub updatePegawai(nip, nama, alm, telp, lhr, jk, id)
        sql = "update Pegawai set NIP='" & nip & "',NamaPeg='" & nama & "',AlmPeg='" & alm & "',TelpPeg='" & telp & "',TglLhrPeg='" & lhr & "',JnsKelPeg='" & jk & "' where NIP='" & id & "'"

        crud(sql)
        dbread.Close()
    End Sub

    Public Sub updateAkun(uname, nip, pw, id)
        sql = "update Login set Username='" & uname & "', Password='" & pw & "',NIP='" & nip & "' where NIP='" & id & "'"

        crud(sql)
        dbread.Close()
    End Sub

    Public Sub deletePegawai(nip)
        sql = "delete Pegawai where NIP='" & nip & "'"

        crud(sql)
        dbread.Close()
    End Sub

    Public Sub deleteAkun(nip)
        sql = "delete Login where NIP='" & nip & "'"

        crud(sql)
        dbread.Close()
    End Sub
#End Region

#Region "Poli"
    Public Sub insertPoli(kode, nama)
        sql = "insert into Poliklinik(KodePoli,NamaPoli) values('" & kode & "','" & nama & "')"

        crud(sql)
        dbread.Close()
    End Sub

    Public Sub updatePoli(kode, nama)
        sql = "update Poliklinik set NamaPoli='" & nama & "' where KodePoli='" & kode & "'"

        crud(sql)
        dbread.Close()
    End Sub

    Public Sub deletePoli(kode)
        sql = "delete Poliklinik where KodePoli='" & kode & "'"

        crud(sql)
        dbread.Close()
    End Sub
#End Region

#Region "Dokter"
    Public Sub insertDokter(dokter, poli, nm, alm, telp)
        sql = "insert into Dokter(KodeDokter,KodePoli,NmDokter,AlmDokter,TelpDokter) values('" & dokter & "','" & poli & "','" & nm & "','" & alm & "','" & telp & "')"

        crud(sql)
        dbread.Close()
    End Sub

    Public Sub updateDokter(dokter, poli, nm, alm, telp)
        sql = "update Dokter set KodePoli='" & poli & "',NmDokter='" & nm & "',AlmDokter='" & alm & "',TelpDokter='" & telp & "' where KodeDokter='" & dokter & "'"

        crud(sql)
        dbread.Close()
    End Sub

    Public Sub deleteDokter(kode)
        sql = "delete Dokter where KodeDokter='" & kode & "'"

        crud(sql)
        dbread.Close()
    End Sub
#End Region

#Region "Jadwal Praktek"
    Public Sub insertJadwal(jadwal, dokter, hari, mulai, selesai)
        sql = "insert into JadwalPraktek(KodeJadwal,KodeDokter,Hari,JamMulai,JamSelesai) values('" & jadwal & "','" & dokter & "','" & hari & "','" & mulai & "','" & selesai & "')"

        crud(sql)
        dbread.Close()
    End Sub

    Public Sub updateJadwal(jadwal, dokter, hari, mulai, selesai)
        sql = "update JadwalPraktek set KodeDokter='" & dokter & "',Hari='" & hari & "',JamMulai='" & mulai & "',JamSelesai='" & selesai & "' where KodeJadwal='" & jadwal & "'"

        crud(sql)
        dbread.Close()
    End Sub

    Public Sub deleteJadwal(kode)
        sql = "delete JadwalPraktek where KodeJadwal='" & kode & "'"

        crud(sql)
        dbread.Close()
    End Sub
#End Region

#Region "Obat"
    Public Sub insertObat(obat, nama, merk, satuan, harga)
        sql = "insert into Obat(KodeObat,NmObat,Merk,Satuan,HargaJual) values('" & obat & "','" & nama & "','" & merk & "','" & satuan & "','" & harga & "')"

        crud(sql)
        dbread.Close()
    End Sub

    Public Sub updateObat(obat, nama, merk, satuan, harga)
        sql = "update Obat set NmObat='" & nama & "',Merk='" & merk & "',Satuan='" & satuan & "',HargaJual='" & harga & "' where KodeObat='" & obat & "'"

        crud(sql)
        dbread.Close()
    End Sub

    Public Sub deleteObat(kode)
        sql = "delete Obat where KodeObat='" & kode & "'"

        crud(sql)
        dbread.Close()
    End Sub
#End Region

#Region "Pendaftaran Pasien"
    Public Sub insertPasien(nopass, nama, alm, telp, lhr, jk, tglreg)
        sql = "insert into Pasien(NoPasien,NamaPass,AlmPass,TelpPass,TglLhrPass,JenisKelPass,TglRegistrasi) values('" & nopass & "','" & nama & "','" & alm & "','" & telp & "','" & lhr & "','" & jk & "','" & tglreg & "')"

        crud(sql)
        dbread.Close()
    End Sub

    Public Sub insertPendaftaran(nopen, nopass, nip, kodejadwal, tglreg, nourut)
        sql = "insert into Pendaftaran(NoPendaftaran,NoPasien,NIP,KodeJadwal,TglPendaftaran,NoUrut) values('" & nopen & "','" & nopass & "','" & nip & "','" & kodejadwal & "','" & tglreg & "','" & nourut & "')"

        crud(sql)
        dbread.Close()
    End Sub

    Public Sub updatePasien(nopass, nama, alm, telp, lhr, jk, tglreg)
        sql = "update Pasien set NamaPass='" & nama & "',AlmPass='" & alm & "',TelpPass='" & telp & "',TglLhrPass='" & lhr & "',JenisKelPass='" & jk & "',TglRegistrasi='" & tglreg & "' where NoPasien='" & nopass & "'"

        crud(sql)
        dbread.Close()
    End Sub

    Public Sub updatePendaftaran(kodeJadwal, noPen)
        sql = "update Pendaftaran set KodeJadwal='" & kodeJadwal & "' where NoPendaftaran='" & noPen & "'"

        crud(sql)
        dbread.Close()
    End Sub

    Public Sub deletePasien(nopass)
        sql = "delete Pasien where NoPasien='" & nopass & "'"

        crud(sql)
        dbread.Close()
    End Sub

    Public Sub deletePendaftaran(nopen)
        sql = "delete Pendaftaran where NoPendaftaran='" & nopen & "'"

        crud(sql)
        dbread.Close()
    End Sub
#End Region

#Region "Pemeriksaan"
    Public Sub insertPemeriksaan(noper, nopen, keluhan, diagnosa, perawatan, tindakan, bb, td, ts)
        sql = "insert into Pemeriksaan(NoPemeriksaan,NoPendaftaran,Keluhan,Diagnosa,Perawatan,Tindakan,BeratBadan,TensiDiastolik,TensiSistolik) values('" & noper & "','" & nopen & "','" & keluhan & "','" & diagnosa & "','" & perawatan & "','" & tindakan & "','" & bb & "','" & td & "','" & ts & "')"

        crud(sql)
        dbread.Close()
    End Sub

    Public Sub updatePemeriksaan(noper, nopen, keluhan, diagnosa, perawatan, tindakan, bb, td, ts)
        sql = "update Pemeriksaan set NoPendaftaran='" & nopen & "', Keluhan='" & keluhan & "',Diagnosa='" & diagnosa & "',Perawatan='" & perawatan & "',Tindakan='" & tindakan & "',BeratBadan='" & bb & "',TensiDiastolik='" & td & "',TensiSistolik='" & ts & "' where NoPemeriksaan='" & noper & "'"

        crud(sql)
        dbread.Close()
    End Sub

    Public Sub deletePemeriksaan(noper)
        sql = "delete Pemeriksaan where NoPemeriksaan='" & noper & "'"

        crud(sql)
        dbread.Close()
    End Sub
#End Region

#Region "Resep"
    Public Sub insertResep(noresep, noperiksa, kodeobat, dosis, jumlah)
        sql = "insert into Resep(NoResep,NoPemeriksaan,KodeObat,Dosis,Jumlah) values('" & noresep & "','" & noperiksa & "','" & kodeobat & "','" & dosis & "','" & jumlah & "')"

        crud(sql)
        dbread.Close()
    End Sub

    Public Sub updateResep(noresep, noperiksa, kodeobat, dosis, jumlah)
        sql = "update Resep set NoPemeriksaan='" & noperiksa & "',KodeObat='" & kodeobat & "',Dosis='" & dosis & "',Jumlah='" & jumlah & "' where NoResep='" & noresep & "'"

        crud(sql)
        dbread.Close()
    End Sub

    Public Sub deleteResep(koderesep)
        sql = "delete Resep where NoResep='" & koderesep & "'"

        crud(sql)
        dbread.Close()
    End Sub
#End Region

#Region "Bayar"
    Public Sub insertBiaya(idbiaya, nama, tarif)
        sql = "insert into JenisBiaya(IDJenisBiaya,NamaBiaya,Tarif) values('" & idbiaya & "','" & nama & "','" & tarif & "')"

        crud(sql)
        dbread.Close()
    End Sub

    Public Sub insertDetailBiaya(IDJenisBiaya, NoPendaftaran, biayaobat, total)
        sql = "insert into DetailBiaya(IDJenisBiaya,NoPendaftaran,BiayaObat,Total) values('" & IDJenisBiaya & "','" & NoPendaftaran & "','" & biayaobat & "','" & total & "')"

        crud(sql)
        dbread.Close()
    End Sub

    Public Sub updateBiaya(idbiaya, nama, tarif)
        sql = "update JenisBiaya set NamaBiaya='" & nama & "',Tarif='" & tarif & "' where IDJenisBiaya='" & idbiaya & "'"

        crud(sql)
        dbread.Close()
    End Sub

    Public Sub updateDetailBiaya(IDJenisBiaya, NoPendaftaran, biayaobat, total)
        sql = "update DetailBiaya set NoPendaftaran='" & NoPendaftaran & "',BiayaObat='" & biayaobat & "',Total='" & total & "' where IDJenisBiaya='" & IDJenisBiaya & "'"

        crud(sql)
        dbread.Close()
    End Sub

    Public Sub deleteBiaya(kode)
        sql = "delete JenisBiaya where IDJenisBiaya='" & kode & "'"

        crud(sql)
        dbread.Close()
    End Sub

    Public Sub deleteDetailBiaya(kode)
        sql = "delete DetailBiaya where IDJenisBiaya='" & kode & "'"

        crud(sql)
        dbread.Close()
    End Sub
#End Region
End Class
