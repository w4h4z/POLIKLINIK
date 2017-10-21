Imports System.Data.SqlClient
Public Class Admin_Nav
    Dim db As New Database
    Dim sql As String
    Dim dbcomm As New SqlCommand
    Dim dbread As SqlDataReader
    Private Sub Admin_Nav_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        'TODO: This line of code loads data into the 'POLIKLINIKDataSet8.BayarVieww' table. You can move, or remove it, as needed.
        Me.BayarViewwTableAdapter.Fill(Me.POLIKLINIKDataSet8.BayarVieww)
        'TODO: This line of code loads data into the 'POLIKLINIKDataSet6.BayarView' table. You can move, or remove it, as needed.
        'Me.BayarViewTableAdapter.Fill(Me.POLIKLINIKDataSet6.BayarView)
        'TODO: This line of code loads data into the 'POLIKLINIKDataSet5.ResepObat' table. You can move, or remove it, as needed.
        Me.ResepObatTableAdapter.Fill(Me.POLIKLINIKDataSet5.ResepObat)
        'TODO: This line of code loads data into the 'POLIKLINIKDataSet4.PemeriksaanPasien' table. You can move, or remove it, as needed.
        Me.PemeriksaanPasienTableAdapter.Fill(Me.POLIKLINIKDataSet4.PemeriksaanPasien)
        'TODO: This line of code loads data into the 'POLIKLINIKDataSet.Pemeriksaan' table. You can move, or remove it, as needed.
        Me.PemeriksaanTableAdapter.Fill(Me.POLIKLINIKDataSet.Pemeriksaan)
        'TODO: This line of code loads data into the 'POLIKLINIKDataSet3.PendaftaranView' table. You can move, or remove it, as needed.
        Me.PendaftaranViewTableAdapter.Fill(Me.POLIKLINIKDataSet3.PendaftaranView)
        'TODO: This line of code loads data into the 'POLIKLINIKDataSet.Obat' table. You can move, or remove it, as needed.
        Me.ObatTableAdapter.Fill(Me.POLIKLINIKDataSet.Obat)
        'TODO: This line of code loads data into the 'POLIKLINIKDataSet2.JadwalDokterPoli' table. You can move, or remove it, as needed.
        Me.JadwalDokterPoliTableAdapter.Fill(Me.POLIKLINIKDataSet2.JadwalDokterPoli)
        'TODO: This line of code loads data into the 'POLIKLINIKDataSet.Dokter' table. You can move, or remove it, as needed.
        Me.DokterTableAdapter.Fill(Me.POLIKLINIKDataSet.Dokter)
        'TODO: This line of code loads data into the 'POLIKLINIKDataSet1.DokterAndPoli' table. You can move, or remove it, as needed.
        Me.DokterAndPoliTableAdapter.Fill(Me.POLIKLINIKDataSet1.DokterAndPoli)
        'TODO: This line of code loads data into the 'POLIKLINIKDataSet.Poliklinik' table. You can move, or remove it, as needed.
        Me.PoliklinikTableAdapter.Fill(Me.POLIKLINIKDataSet.Poliklinik)

        TabControl1.ItemSize = New Size(0, 1)
        TabControl1.SizeMode = TabSizeMode.Fixed

        db.conn()
        dataPegawai()
        maxKodePoli()
        maxKodeDokter()
        maxKodeJadwal()
        maxKodeObat()
        jadwalPasien()
        maxKodePasien()
        noUrutNoPass() '
        pasienPeriksa()
        noPemeriksaan()
        pasienResep()
        maxKodeResep()
        pasienBayar()
        maxKodeBayar()
    End Sub

    Private Function autoIncrement(kode)
        Dim kodeId As String
        Dim huruf As String = kode.substring(0, 1)
        Dim angka As String = kode.substring(1)
        Dim id As Integer = Integer.Parse(angka)
        id += 1
        kodeId = huruf & id.ToString("D" & angka.Length)
        Return kodeId
    End Function

#Region "Side Bar"
    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        TabControl1.SelectTab(0)
    End Sub

    Private Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        TabControl1.SelectTab(1)
    End Sub

    Private Sub Button3_Click(sender As Object, e As EventArgs) Handles Button3.Click
        TabControl1.SelectTab(2)
    End Sub

    Private Sub Button4_Click(sender As Object, e As EventArgs) Handles Button4.Click
        TabControl1.SelectTab(3)
    End Sub

    Private Sub Button5_Click(sender As Object, e As EventArgs) Handles Button5.Click
        TabControl1.SelectTab(4)
    End Sub

    Private Sub Button6_Click(sender As Object, e As EventArgs) Handles Button6.Click
        TabControl1.SelectTab(5)
    End Sub

    Private Sub Button7_Click(sender As Object, e As EventArgs) Handles Button7.Click
        TabControl1.SelectTab(6)
    End Sub

    Private Sub Button8_Click(sender As Object, e As EventArgs) Handles Button8.Click
        TabControl1.SelectTab(7)
    End Sub

    Private Sub Button9_Click(sender As Object, e As EventArgs) Handles Button9.Click
        TabControl1.SelectTab(8)
    End Sub

    Private Sub Button10_Click(sender As Object, e As EventArgs) Handles Button10.Click
        Login.Show()
        Me.Close()
    End Sub

#End Region

#Region "Pegawai"
    Private Sub dataPegawai()
        DataGridViewPegawai.Rows.Clear()
        sql = "select * from Pegawai as p join Login as l on p.NIP=l.NIP"

        Try
            dbcomm = New SqlCommand(sql, db.conn)
            dbread = dbcomm.ExecuteReader
            Dim no As Integer = 1
            While dbread.Read
                Dim jk As String
                If dbread("JnsKelPeg") = "Lk" Then
                    jk = "Laki-Laki"
                ElseIf dbread("JnsKelPeg") = "Pr" Then
                    jk = "Perempuan"
                End If
                DataGridViewPegawai.Rows.Add(no, dbread("NIP"), dbread("NamaPeg"), dbread("AlmPeg"), dbread("TelpPeg"), dbread("TglLhrPeg").toshortdatestring, jk, dbread("Username"), dbread("Password"))
                no += 1
            End While
            dbread.Close()
        Catch ex As Exception
            MsgBox(ex.Message, MsgBoxStyle.Critical)
        End Try
    End Sub

    Private Sub resetPegawai()
        txtNipPegawai.Text = ""
        txtNamaPegawai.Text = ""
        txtTelpPegawai.Text = ""
        txtAlamatPegawai.Text = ""
        DateTimePickerPegawai.Value = Date.Now
        rbLkPegawai.Checked = False
        rbPrPegawai.Checked = False
        txtUnamePegawai.Text = ""
        txtPassPegawai.Text = ""
        dataPegawai()
    End Sub

    Private Sub cbShowPwPegawai_CheckedChanged(sender As Object, e As EventArgs) Handles cbShowPwPegawai.CheckedChanged
        If cbShowPwPegawai.Checked = True Then
            txtPassPegawai.PasswordChar = ""
        ElseIf cbShowPwPegawai.Checked = False Then
            txtPassPegawai.PasswordChar = "$"
        End If
    End Sub

    Private Sub DataGridViewPegawai_CellMouseClick(sender As Object, e As DataGridViewCellMouseEventArgs) Handles DataGridViewPegawai.CellMouseClick
        Dim i As Integer = DataGridViewPegawai.CurrentRow.Index
        txtNipPegawai.Text = DataGridViewPegawai.Item(1, i).Value
        txtNamaPegawai.Text = DataGridViewPegawai.Item(2, i).Value
        txtAlamatPegawai.Text = DataGridViewPegawai.Item(3, i).Value
        txtTelpPegawai.Text = DataGridViewPegawai.Item(4, i).Value
        DateTimePickerPegawai.Value = DataGridViewPegawai.Item(5, i).Value
        If DataGridViewPegawai.Item(6, i).Value = "Laki-Laki" Then
            rbLkPegawai.Checked = True
        ElseIf DataGridViewPegawai.Item(6, i).Value = "Laki-Laki" Then
            rbPrPegawai.Checked = True
        End If
        txtUnamePegawai.Text = DataGridViewPegawai.Item(7, i).Value
        txtPassPegawai.Text = DataGridViewPegawai.Item(8, i).Value
    End Sub

    Private Sub btnCancelPegawai_Click(sender As Object, e As EventArgs) Handles btnCancelPegawai.Click
        resetPegawai()
    End Sub

    Private Sub btnAddPegawai_Click(sender As Object, e As EventArgs) Handles btnAddPegawai.Click
        If txtNipPegawai.Text = "" Or txtNamaPegawai.Text = "" Or txtAlamatPegawai.Text = "" Or txtTelpPegawai.Text = "" Or txtUnamePegawai.Text = "" Or txtPassPegawai.Text = "" Then
            MsgBox("Semua data harus diisi!", MsgBoxStyle.Exclamation)
            Exit Sub
        End If

        For i As Integer = 0 To DataGridViewPegawai.RowCount - 1
            If DataGridViewPegawai.Item(1, i).Value = txtNipPegawai.Text Then
                MsgBox("NIP tidak boleh sama!", MsgBoxStyle.Exclamation)
                Exit Sub
            End If
        Next

        For i As Integer = 0 To DataGridViewPegawai.RowCount - 1
            If DataGridViewPegawai.Item(7, i).Value = txtUnamePegawai.Text Then
                MsgBox("Username tidak boleh sama!", MsgBoxStyle.Exclamation)
                Exit Sub
            End If
        Next

        Dim jk As String
        If rbLkPegawai.Checked = True Then
            jk = "Lk"
        ElseIf rbPrPegawai.Checked = True
            jk = "Pr"
        End If
        db.insertPegawai(txtNipPegawai.Text, txtNamaPegawai.Text, txtAlamatPegawai.Text, txtTelpPegawai.Text, DateTimePickerPegawai.Value.ToString("yyyy/MM/dd"), jk)
        db.insertAkun(txtUnamePegawai.Text, txtNipPegawai.Text, txtPassPegawai.Text, "Staff")
        MsgBox("Insert data success", MsgBoxStyle.Information)
        resetPegawai()
    End Sub

    Private Sub btnEditPegawai_Click(sender As Object, e As EventArgs) Handles btnEditPegawai.Click
        If txtNipPegawai.Text = "" Or txtNamaPegawai.Text = "" Or txtAlamatPegawai.Text = "" Or txtTelpPegawai.Text = "" Or txtUnamePegawai.Text = "" Or txtPassPegawai.Text = "" Then
            MsgBox("Semua data harus diisi!", MsgBoxStyle.Exclamation)
            Exit Sub
        End If

        Dim jk As String
        If rbLkPegawai.Checked = True Then
            jk = "Lk"
        ElseIf rbPrPegawai.Checked = True
            jk = "Pr"
        End If

        Dim i As Integer = DataGridViewPegawai.CurrentRow.Index

        Try
            db.updatePegawai(txtNipPegawai.Text, txtNamaPegawai.Text, txtAlamatPegawai.Text, txtTelpPegawai.Text, DateTimePickerPegawai.Value.ToString("yyyy/MM/dd"), jk, DataGridViewPegawai.Item(1, i).Value)
            db.updateAkun(txtUnamePegawai.Text, txtNipPegawai.Text, txtPassPegawai.Text, DataGridViewPegawai.Item(1, i).Value)

            MsgBox("Update data success", MsgBoxStyle.Information)
            resetPegawai()
        Catch ex As Exception
            MsgBox("Cek NIP/Username!", MsgBoxStyle.Exclamation)
        End Try

    End Sub

    Private Sub btnDeletePegawai_Click(sender As Object, e As EventArgs) Handles btnDeletePegawai.Click
        Dim i As Integer = DataGridViewPegawai.CurrentRow.Index
        db.deleteAkun(DataGridViewPegawai.Item(1, i).Value)
        db.deletePegawai(DataGridViewPegawai.Item(1, i).Value)

        MsgBox("Delete data success", MsgBoxStyle.Information)
        resetPegawai()
    End Sub

#End Region

#Region "Poli"
    Private Sub maxKodePoli()
        sql = "select max(KodePoli) as lastId from Poliklinik"

        Try
            dbcomm = New SqlCommand(sql, db.conn)
            dbread = dbcomm.ExecuteReader
            dbread.Read()
            txtIdPoli.Text = autoIncrement(dbread("lastId"))
            dbread.Close()
        Catch ex As Exception
            MsgBox(ex.Message, MsgBoxStyle.Critical)
        End Try
    End Sub

    Private Sub resetPoli()
        maxKodePoli()
        txtNamaPoli.Text = ""
        Me.PoliklinikTableAdapter.Fill(Me.POLIKLINIKDataSet.Poliklinik)
    End Sub

    Private Sub btnAddPoli_Click(sender As Object, e As EventArgs) Handles btnAddPoli.Click
        If txtNamaPoli.Text = "" Then
            MsgBox("Semua data harus diisi!", MsgBoxStyle.Exclamation)
            Exit Sub
        End If
        Try
            db.insertPoli(txtIdPoli.Text, txtNamaPoli.Text)
            resetPoli()
            MsgBox("Insert data success", MsgBoxStyle.Information)
        Catch ex As Exception
            MsgBox("Kode Poliklinik sudah ada!", MsgBoxStyle.Exclamation)
        End Try

    End Sub

    Private Sub btnEditPoli_Click(sender As Object, e As EventArgs) Handles btnEditPoli.Click
        If txtNamaPoli.Text = "" Then
            MsgBox("Semua data harus diisi!", MsgBoxStyle.Exclamation)
            Exit Sub
        End If

        db.updatePoli(txtIdPoli.Text, txtNamaPoli.Text)
        resetPoli()
        MsgBox("Update data success", MsgBoxStyle.Information)
    End Sub

    Private Sub btnDeletePoli_Click(sender As Object, e As EventArgs) Handles btnDeletePoli.Click
        db.deletePoli(txtIdPoli.Text)
        resetPoli()
        MsgBox("Delete data success", MsgBoxStyle.Information)
    End Sub

    Private Sub btnCancelPoli_Click(sender As Object, e As EventArgs) Handles btnCancelPoli.Click
        resetPoli()
    End Sub

    Private Sub DataGridViewPoli_CellMouseClick(sender As Object, e As DataGridViewCellMouseEventArgs) Handles DataGridViewPoli.CellMouseClick
        Dim i As Integer = DataGridViewPoli.CurrentRow.Index

        txtIdPoli.Text = DataGridViewPoli.Item(0, i).Value
        txtNamaPoli.Text = DataGridViewPoli.Item(1, i).Value
    End Sub

#End Region

#Region "Dokter"
    Private Sub resetDokter()
        txtNamaDokter.Text = ""
        cbPoliDokter.SelectedItem = 0
        txtAlamatDokter.Text = ""
        txtTelpDokter.Text = ""
        Me.DokterAndPoliTableAdapter.Fill(Me.POLIKLINIKDataSet1.DokterAndPoli)
        maxKodeDokter()
    End Sub

    Private Sub maxKodeDokter()
        sql = "select max(KodeDokter) as lastId from Dokter"

        Try
            dbcomm = New SqlCommand(sql, db.conn)
            dbread = dbcomm.ExecuteReader
            dbread.Read()
            txtIdDokter.Text = autoIncrement(dbread("lastId"))
            dbread.Close()
        Catch ex As Exception
            MsgBox(ex.Message, MsgBoxStyle.Critical)
        End Try
    End Sub

    Private Sub btnAddDokter_Click(sender As Object, e As EventArgs) Handles btnAddDokter.Click
        If txtNamaDokter.Text = "" Or txtAlamatDokter.Text = "" Or txtTelpDokter.Text = "" Then
            MsgBox("Semua data harus diisi!", MsgBoxStyle.Exclamation)
            Exit Sub
        End If

        Try
            db.insertDokter(txtIdDokter.Text, cbPoliDokter.SelectedValue, txtNamaDokter.Text, txtAlamatDokter.Text, txtTelpDokter.Text)
            resetDokter()
            MsgBox("Insert data success", MsgBoxStyle.Information)
        Catch ex As Exception
            MsgBox("Kode dokter sudah ada!", MsgBoxStyle.Exclamation)
        End Try
    End Sub

    Private Sub btnEditDokter_Click(sender As Object, e As EventArgs) Handles btnEditDokter.Click
        If txtNamaDokter.Text = "" Or txtAlamatDokter.Text = "" Or txtTelpDokter.Text = "" Then
            MsgBox("Semua data harus diisi!", MsgBoxStyle.Exclamation)
            Exit Sub
        End If

        db.updateDokter(txtIdDokter.Text, cbPoliDokter.SelectedValue, txtNamaDokter.Text, txtAlamatDokter.Text, txtTelpDokter.Text)
        resetDokter()
        MsgBox("Update data success", MsgBoxStyle.Information)
    End Sub

    Private Sub btnDeleteDokter_Click(sender As Object, e As EventArgs) Handles btnDeleteDokter.Click
        db.deleteDokter(txtIdDokter.Text)
        resetDokter()
        MsgBox("Delete data success", MsgBoxStyle.Information)
    End Sub

    Private Sub btnCancelDokter_Click(sender As Object, e As EventArgs) Handles btnCancelDokter.Click
        resetDokter()
    End Sub

    Private Sub DataGridViewDokter_CellMouseClick(sender As Object, e As DataGridViewCellMouseEventArgs) Handles DataGridViewDokter.CellMouseClick
        Dim i As Integer = DataGridViewDokter.CurrentRow.Index

        txtIdDokter.Text = DataGridViewDokter.Item(0, i).Value
        txtNamaDokter.Text = DataGridViewDokter.Item(1, i).Value
        txtAlamatDokter.Text = DataGridViewDokter.Item(2, i).Value
        txtTelpDokter.Text = DataGridViewDokter.Item(3, i).Value
        cbPoliDokter.SelectedValue = DataGridViewDokter.Item(4, i).Value
    End Sub
#End Region

#Region "Jadwal Praktek"
    Private Sub resetJadwal()
        cbHariJadwal.SelectedIndex = -1
        cbHariJadwal.Text = "Pilih"
        txtMulaiJadwal.Text = ""
        txtSelesaiJadwal.Text = ""
        cbDokterJadwal.SelectedIndex = 0
        Me.JadwalDokterPoliTableAdapter.Fill(Me.POLIKLINIKDataSet2.JadwalDokterPoli)
        maxKodeJadwal()
    End Sub

    Private Sub maxKodeJadwal()
        sql = "select max(KodeJadwal) as lastId from JadwalPraktek"

        Try
            dbcomm = New SqlCommand(sql, db.conn)
            dbread = dbcomm.ExecuteReader
            dbread.Read()
            txtIdJadwal.Text = autoIncrement(dbread("lastId"))
            dbread.Close()
        Catch ex As Exception
            MsgBox(ex.Message, MsgBoxStyle.Critical)
        End Try
    End Sub

    Private Sub btnAddJadwal_Click(sender As Object, e As EventArgs) Handles btnAddJadwal.Click
        If cbHariJadwal.Text = "Pilih" Or txtMulaiJadwal.Text = "" Or txtSelesaiJadwal.Text = "" Then
            MsgBox("Semua data harus diisi!", MsgBoxStyle.Exclamation)
            Exit Sub
        End If
        Try
            db.insertJadwal(txtIdJadwal.Text, cbDokterJadwal.SelectedValue, cbHariJadwal.Text, txtMulaiJadwal.Text, txtSelesaiJadwal.Text)
            resetJadwal()
            MsgBox("Insert data success", MsgBoxStyle.Information)
        Catch ex As Exception
            MsgBox("Kode Jadwal sudah ada!", MsgBoxStyle.Exclamation)
        End Try

    End Sub

    Private Sub btnEditJadwal_Click(sender As Object, e As EventArgs) Handles btnEditJadwal.Click
        If cbHariJadwal.Text = "Pilih" Or txtMulaiJadwal.Text = "" Or txtSelesaiJadwal.Text = "" Then
            MsgBox("Semua data harus diisi!", MsgBoxStyle.Exclamation)
            Exit Sub
        End If

        db.updateJadwal(txtIdJadwal.Text, cbDokterJadwal.SelectedValue, cbHariJadwal.Text, txtMulaiJadwal.Text, txtSelesaiJadwal.Text)
        resetJadwal()
        MsgBox("Update data success", MsgBoxStyle.Information)
    End Sub

    Private Sub btnDeleteJadwal_Click(sender As Object, e As EventArgs) Handles btnDeleteJadwal.Click
        db.deleteJadwal(txtIdJadwal.Text)
        resetJadwal()
        MsgBox("Delete data success", MsgBoxStyle.Information)
    End Sub

    Private Sub btnCancelJadwal_Click(sender As Object, e As EventArgs) Handles btnCancelJadwal.Click
        resetJadwal()
    End Sub

    Private Sub DataGridViewJadwal_CellMouseClick(sender As Object, e As DataGridViewCellMouseEventArgs) Handles DataGridViewJadwal.CellMouseClick
        Dim i As Integer = DataGridViewJadwal.CurrentRow.Index

        txtIdJadwal.Text = DataGridViewJadwal.Item(0, i).Value
        cbDokterJadwal.SelectedValue = DataGridViewJadwal.Item(1, i).Value
        cbHariJadwal.Text = DataGridViewJadwal.Item(5, i).Value
        txtMulaiJadwal.Text = DataGridViewJadwal.Item(6, i).Value
        txtSelesaiJadwal.Text = DataGridViewJadwal.Item(7, i).Value
    End Sub


#End Region

#Region "Obat"
    Private Sub resetObat()
        txtNamaObat.Text = ""
        txtMerkObat.Text = ""
        txtSatuanObat.Text = ""
        txtHargaObat.Text = ""
        maxKodeObat()
        Me.ObatTableAdapter.Fill(Me.POLIKLINIKDataSet.Obat)
    End Sub

    Private Sub maxKodeObat()
        sql = "select max(KodeObat) as lastId from Obat"

        Try
            dbcomm = New SqlCommand(sql, db.conn)
            dbread = dbcomm.ExecuteReader
            dbread.Read()
            txtIdObat.Text = autoIncrement(dbread("lastId"))
            dbread.Close()
        Catch ex As Exception
            MsgBox(ex.Message, MsgBoxStyle.Critical)
        End Try
    End Sub

    Private Sub btnAddObat_Click(sender As Object, e As EventArgs) Handles btnAddObat.Click
        If txtNamaObat.Text = "" Or txtMerkObat.Text = "" Or txtSatuanObat.Text = "" Or txtHargaObat.Text = "" Then
            MsgBox("Semua data harus diisi!", MsgBoxStyle.Critical)
            Exit Sub
        End If

        Try
            db.insertObat(txtIdObat.Text, txtNamaObat.Text, txtMerkObat.Text, txtSatuanObat.Text, txtHargaObat.Text)
            resetObat()
            MsgBox("Insert data success", MsgBoxStyle.Information)
        Catch ex As Exception
            MsgBox("Kode Obat sudah ada!", MsgBoxStyle.Exclamation)
        End Try

    End Sub

    Private Sub btnEditObat_Click(sender As Object, e As EventArgs) Handles btnEditObat.Click
        If txtNamaObat.Text = "" Or txtMerkObat.Text = "" Or txtSatuanObat.Text = "" Or txtHargaObat.Text = "" Then
            MsgBox("Semua data harus diisi!", MsgBoxStyle.Critical)
            Exit Sub
        End If

        db.updateObat(txtIdObat.Text, txtNamaObat.Text, txtMerkObat.Text, txtSatuanObat.Text, txtHargaObat.Text)
        resetObat()
        MsgBox("Update data success", MsgBoxStyle.Information)
    End Sub

    Private Sub btnDeleteObat_Click(sender As Object, e As EventArgs) Handles btnDeleteObat.Click
        db.deleteObat(txtIdObat.Text)
        resetObat()
        MsgBox("Delete data success", MsgBoxStyle.Information)
    End Sub

    Private Sub btnCancelObat_Click(sender As Object, e As EventArgs) Handles btnCancelObat.Click
        resetObat()
    End Sub

    Private Sub DataGridViewObat_CellMouseClick(sender As Object, e As DataGridViewCellMouseEventArgs) Handles DataGridViewObat.CellMouseClick
        Dim i As Integer = DataGridViewObat.CurrentRow.Index

        txtIdObat.Text = DataGridViewObat.Item(0, i).Value
        txtNamaObat.Text = DataGridViewObat.Item(1, i).Value
        txtMerkObat.Text = DataGridViewObat.Item(2, i).Value
        txtSatuanObat.Text = DataGridViewObat.Item(3, i).Value
        txtHargaObat.Text = DataGridViewObat.Item(4, i).Value
    End Sub

#End Region

#Region "Pendaftaran Pasien"
    Private Sub resetPendaftaran()
        txtNamaPasien.Text = ""
        txtAlamatPasien.Text = ""
        txtTelpPasien.Text = ""
        DateTimePickerLhrPasien.Value = Date.Now
        rbLkPasien.Checked = True
        Me.PendaftaranViewTableAdapter.Fill(Me.POLIKLINIKDataSet3.PendaftaranView)
        maxKodePasien()
        noUrutNoPass()
        cbJadwalPasien.SelectedIndex = -1
        cbJadwalPasien.Text = "Pilih"
    End Sub

    Private Sub maxKodePasien()
        sql = "select max(NoPasien) as lastId from pasien"

        Try
            dbcomm = New SqlCommand(sql, db.conn)
            dbread = dbcomm.ExecuteReader
            dbread.Read()
            txtNoPasien.Text = autoIncrement(dbread("lastId"))
            dbread.Close()
        Catch ex As Exception
            MsgBox(ex.Message, MsgBoxStyle.Critical)
        End Try
    End Sub

    Private Sub noUrutNoPass()
        Dim a As String = DataGridViewPasien.RowCount + 1
        txtPendaftaranPasien.Text = a
        txtUrutPasien.Text = a
    End Sub

    Private Sub jadwalPasien()
        cbJadwalPasien.Items.Clear()
        Dim hari As String = Date.Now.ToString("dddd")
        sql = "select * from Dokter as d join Poliklinik as p on d.KodePoli=p.KodePoli join JadwalPraktek as jp on d.KodeDokter=jp.KodeDokter where jp.Hari='" & hari & "'"

        Try
            dbcomm = New SqlCommand(sql, db.conn)
            dbread = dbcomm.ExecuteReader
            While dbread.Read
                cbJadwalPasien.DisplayMember = "Text"
                cbJadwalPasien.ValueMember = "Value"
                cbJadwalPasien.Items.Add(New With {Key .Text = dbread("KodeJadwal") & " - " & dbread("NmDokter") & " - " & dbread("NamaPoli") & " - Mulai " & dbread("JamMulai") & " - " & dbread("JamSelesai"), Key .Value = dbread("KodeJadwal")})
            End While
            dbread.Close()
        Catch ex As Exception
            MsgBox(ex.Message, MsgBoxStyle.Critical)
        End Try
    End Sub

    Private Sub btnEditPasien_Click(sender As Object, e As EventArgs) Handles btnEditPasien.Click
        Dim jk As String
        If rbLkPasien.Checked = True Then
            jk = "L"
        ElseIf rbPrPasien.Checked = True
            jk = "P"
        End If

        If txtNamaPasien.Text = "" Or txtAlamatPasien.Text = "" Or cbJadwalPasien.Text = "Pilih" Or txtTelpPasien.Text = "" Then
            MsgBox("Semua data harus diisi!", MsgBoxStyle.Exclamation)
            Exit Sub
        End If

        db.updatePasien(txtNoPasien.Text, txtNamaPasien.Text, txtAlamatPasien.Text, txtTelpPasien.Text, DateTimePickerLhrPasien.Value.ToString("yyyy/MM/dd"), jk, DateTimePickerPasien.Value.ToString("yyyy/MM/dd"))
        db.updatePendaftaran(cbJadwalPasien.SelectedItem.Value, txtPendaftaranPasien.Text)
        resetPendaftaran()
        MsgBox("Update data success", MsgBoxStyle.Information)
    End Sub

    Private Sub btnAddPasien_Click(sender As Object, e As EventArgs) Handles btnAddPasien.Click
        Dim jk As String
        If rbLkPasien.Checked = True Then
            jk = "L"
        ElseIf rbPrPasien.Checked = True
            jk = "P"
        End If

        If txtNamaPasien.Text = "" Or txtAlamatPasien.Text = "" Or cbJadwalPasien.Text = "Pilih" Or txtTelpPasien.Text = "" Then
            MsgBox("Semua data harus diisi!", MsgBoxStyle.Exclamation)
            Exit Sub
        End If

        db.insertPasien(txtNoPasien.Text, txtNamaPasien.Text, txtAlamatPasien.Text, txtTelpPasien.Text, DateTimePickerLhrPasien.Value.ToString("yyyy/MM/dd"), jk, DateTimePickerPasien.Value.ToString("yyyy/MM/dd"))
        db.insertPendaftaran(txtPendaftaranPasien.Text, txtNoPasien.Text, txtPegawaiPasien.Text, cbJadwalPasien.SelectedItem.Value, DateTimePickerPasien.Value.ToString("yyyy/MM/dd"), txtUrutPasien.Text)
        resetPendaftaran()
        MsgBox("Insert data success", MsgBoxStyle.Information)
    End Sub

    Private Sub btnDeletePasien_Click(sender As Object, e As EventArgs) Handles btnDeletePasien.Click
        db.deletePendaftaran(txtPendaftaranPasien.Text)
        db.deletePasien(txtNoPasien.Text)
        resetPendaftaran()
        MsgBox("Delete data success", MsgBoxStyle.Information)
    End Sub

    Private Sub btnCancelPasien_Click(sender As Object, e As EventArgs) Handles btnCancelPasien.Click
        resetPendaftaran()
    End Sub

    Private Sub DataGridViewPasien_CellMouseClick(sender As Object, e As DataGridViewCellMouseEventArgs) Handles DataGridViewPasien.CellMouseClick
        Dim i As Integer = DataGridViewPasien.CurrentRow.Index

        txtPendaftaranPasien.Text = DataGridViewPasien.Item(1, i).Value
        txtPegawaiPasien.Text = DataGridViewPasien.Item(9, i).Value
        txtUrutPasien.Text = DataGridViewPasien.Item(0, i).Value
        txtNoPasien.Text = DataGridViewPasien.Item(2, i).Value
        txtNamaPasien.Text = DataGridViewPasien.Item(3, i).Value
        cbJadwalPasien.SelectedIndex = cbJadwalPasien.FindString(DataGridViewPasien.Item(16, i).Value).ToString
        txtAlamatPasien.Text = DataGridViewPasien.Item(4, i).Value
        txtTelpPasien.Text = DataGridViewPasien.Item(5, i).Value
        DateTimePickerLhrPasien.Value = DataGridViewPasien.Item(6, i).Value
        If DataGridViewPasien.Item(7, i).Value = "L" Then
            rbLkPasien.Checked = True
        ElseIf DataGridViewPasien.Item(7, i).Value = "P"
            rbPrPasien.Checked = True
        End If
    End Sub

#End Region

#Region "Pemeriksaan"
    Private Sub resetPeriksa()
        cbPasienPeriksa.SelectedIndex = -1
        cbPasienPeriksa.Text = "Pilih"
        txtKeluhanPeriksa.Text = ""
        txtDiagnosaPeriksa.Text = ""
        txtPerawatanPeriksa.Text = ""
        txtTindakanPeriksa.Text = ""
        txtbbPeriksa.Text = ""
        txttdPeriksa.Text = ""
        txttsPeriksa.Text = ""
        Me.PemeriksaanPasienTableAdapter.Fill(Me.POLIKLINIKDataSet4.PemeriksaanPasien)
        noPemeriksaan()
    End Sub

    Private Sub noPemeriksaan()
        Dim a As String = DataGridViewPeriksa.RowCount + 1
        txtIdPeriksa.Text = a
    End Sub

    Private Sub pasienPeriksa()
        cbPasienPeriksa.Items.Clear()
        sql = "select * from Pasien as p join Pendaftaran as pe on p.NoPasien=pe.NoPasien"

        Try
            dbcomm = New SqlCommand(sql, db.conn)
            dbread = dbcomm.ExecuteReader
            While dbread.Read
                cbPasienPeriksa.DisplayMember = "Text"
                cbPasienPeriksa.ValueMember = "Value"
                cbPasienPeriksa.Items.Add(New With {Key .Text = dbread("NoPendaftaran") & " - " & dbread("NoPasien") & " - " & dbread("NamaPass"), Key .Value = dbread("NoPendaftaran")})
            End While
            dbread.Close()
        Catch ex As Exception
            MsgBox(ex.Message, MsgBoxStyle.Critical)
        End Try
    End Sub

    Private Sub btnAddPeriksa_Click(sender As Object, e As EventArgs) Handles btnAddPeriksa.Click
        If cbPasienPeriksa.Text = "Pilih" Or txtKeluhanPeriksa.Text = "" Or txtDiagnosaPeriksa.Text = "" Or txtPerawatanPeriksa.Text = "" Or txtTindakanPeriksa.Text = "" Or txtbbPeriksa.Text = "" Or txttdPeriksa.Text = "" Or txttsPeriksa.Text = "" Then
            MsgBox("Semua data harus diisi!", MsgBoxStyle.Exclamation)
            Exit Sub
        End If
        Try
            db.insertPemeriksaan(txtIdPeriksa.Text, cbPasienPeriksa.SelectedItem.Value, txtKeluhanPeriksa.Text, txtDiagnosaPeriksa.Text, txtPerawatanPeriksa.Text, txtTindakanPeriksa.Text, txtbbPeriksa.Text, txttdPeriksa.Text, txttsPeriksa.Text)
            MsgBox("Insert data success", MsgBoxStyle.Information)
            resetPeriksa()
        Catch ex As Exception
            MsgBox("Kode belum ada!", MsgBoxStyle.Exclamation)
        End Try
    End Sub

    Private Sub btnEditPeriksa_Click(sender As Object, e As EventArgs) Handles btnEditPeriksa.Click
        If cbPasienPeriksa.Text = "Pilih" Or txtKeluhanPeriksa.Text = "" Or txtDiagnosaPeriksa.Text = "" Or txtPerawatanPeriksa.Text = "" Or txtTindakanPeriksa.Text = "" Or txtbbPeriksa.Text = "" Or txttdPeriksa.Text = "" Or txttsPeriksa.Text = "" Then
            MsgBox("Semua data harus diisi!", MsgBoxStyle.Exclamation)
            Exit Sub
        End If
        Try
            db.updatePemeriksaan(txtIdPeriksa.Text, cbPasienPeriksa.SelectedItem.Value, txtKeluhanPeriksa.Text, txtDiagnosaPeriksa.Text, txtPerawatanPeriksa.Text, txtTindakanPeriksa.Text, txtbbPeriksa.Text, txttdPeriksa.Text, txttsPeriksa.Text)
            MsgBox("Update data success", MsgBoxStyle.Information)
            resetPeriksa()
        Catch ex As Exception
            MsgBox("Kode sudah ada!", MsgBoxStyle.Exclamation)
        End Try
    End Sub

    Private Sub btnDeletePeriksa_Click(sender As Object, e As EventArgs) Handles btnDeletePeriksa.Click
        db.deletePemeriksaan(txtIdPeriksa.Text)
        MsgBox("Delete data success", MsgBoxStyle.Information)
        resetPeriksa()
    End Sub

    Private Sub btnCancelPeriksa_Click(sender As Object, e As EventArgs) Handles btnCancelPeriksa.Click
        resetPeriksa()
    End Sub

    Private Sub DataGridViewPeriksa_CellMouseClick(sender As Object, e As DataGridViewCellMouseEventArgs) Handles DataGridViewPeriksa.CellMouseClick
        Dim i As Integer = DataGridViewPeriksa.CurrentRow.Index

        txtIdPeriksa.Text = DataGridViewPeriksa.Item(0, i).Value
        cbPasienPeriksa.SelectedIndex = cbPasienPeriksa.FindString(DataGridViewPeriksa.Item(2, i).Value)
        txtKeluhanPeriksa.Text = DataGridViewPeriksa.Item(5, i).Value
        txtDiagnosaPeriksa.Text = DataGridViewPeriksa.Item(6, i).Value
        txtPerawatanPeriksa.Text = DataGridViewPeriksa.Item(7, i).Value
        txtTindakanPeriksa.Text = DataGridViewPeriksa.Item(8, i).Value
        txtbbPeriksa.Text = DataGridViewPeriksa.Item(9, i).Value
        txttdPeriksa.Text = DataGridViewPeriksa.Item(10, i).Value
        txttsPeriksa.Text = DataGridViewPeriksa.Item(11, i).Value
    End Sub

#End Region

#Region "Resep"
    Private Sub maxKodeResep()
        sql = "select max(NoResep) as lastId from Resep"

        Try
            dbcomm = New SqlCommand(sql, db.conn)
            dbread = dbcomm.ExecuteReader
            dbread.Read()
            Dim kodeId As String
            Dim huruf As String = dbread("lastId").substring(0, 1)
            Dim angka As String = dbread("lastId").substring(1, 4)
            Dim id As Integer = Integer.Parse(angka)
            id += 1
            kodeId = huruf & id.ToString("D" & angka.Length)
            txtIdResep.Text = kodeId
            dbread.Close()
        Catch ex As Exception
            MsgBox(ex.Message, MsgBoxStyle.Critical)
        End Try
    End Sub

    Private Sub pasienResep()
        cbPasienResep.Items.Clear()
        sql = "select * from Pasien as p join Pendaftaran as pe on p.NoPasien=pe.NoPasien"

        Try
            dbcomm = New SqlCommand(sql, db.conn)
            dbread = dbcomm.ExecuteReader
            While dbread.Read
                cbPasienResep.DisplayMember = "Text"
                cbPasienResep.ValueMember = "Value"
                cbPasienResep.Items.Add(New With {Key .Text = dbread("NoPendaftaran") & " - " & dbread("NoPasien") & " - " & dbread("NamaPass"), Key .Value = dbread("NoPendaftaran")})
            End While
            dbread.Close()
        Catch ex As Exception
            MsgBox(ex.Message, MsgBoxStyle.Critical)
        End Try
    End Sub

    Private Sub resetResep()
        cbPasienPeriksa.SelectedIndex = -1
        cbPasienPeriksa.Text = "Pilih"
        txtDosisResep.Text = ""
        txtJumlahResep.Text = ""
        cbObatResep.SelectedIndex = 0
        maxKodeResep()
        Me.ResepObatTableAdapter.Fill(Me.POLIKLINIKDataSet5.ResepObat)
    End Sub

    Private Sub btnAddResep_Click(sender As Object, e As EventArgs) Handles btnAddResep.Click
        db.insertResep(txtIdResep.Text, cbPasienResep.SelectedItem.Value, cbObatResep.SelectedValue, txtDosisResep.Text, txtJumlahResep.Text)
        MsgBox("Insert data success", MsgBoxStyle.Information)
        resetResep()
    End Sub

    Private Sub btnEditResep_Click(sender As Object, e As EventArgs) Handles btnEditResep.Click
        db.updateResep(txtIdResep.Text, cbPasienResep.SelectedItem.Value, cbObatResep.SelectedValue, txtDosisResep.Text, txtJumlahResep.Text)
        MsgBox("Update data success", MsgBoxStyle.Information)
        resetResep()
    End Sub

    Private Sub btnDeleteResep_Click(sender As Object, e As EventArgs) Handles btnDeleteResep.Click
        db.deleteResep(txtIdResep.Text)
        MsgBox("Delete data success", MsgBoxStyle.Information)
        resetResep()
    End Sub

    Private Sub btnCancelResep_Click(sender As Object, e As EventArgs) Handles btnCancelResep.Click
        resetResep()
    End Sub

    Private Sub DataGridViewDetailResep_CellMouseClick(sender As Object, e As DataGridViewCellMouseEventArgs) Handles DataGridViewDetailResep.CellMouseClick
        Dim i As Integer = DataGridViewDetailResep.CurrentRow.Index

        txtIdResep.Text = DataGridViewDetailResep.Item(4, i).Value
        cbPasienResep.SelectedIndex = cbPasienResep.FindString(DataGridViewDetailResep.Item(2, i).Value)
        txtDosisResep.Text = DataGridViewDetailResep.Item(9, i).Value
        txtJumlahResep.Text = DataGridViewDetailResep.Item(10, i).Value
        cbObatResep.SelectedValue = DataGridViewDetailResep.Item(5, i).Value
    End Sub

#End Region

#Region "Bayar"
    Private Sub pasienBayar()
        cbPasienBayar.Items.Clear()
        sql = "select * from Pasien as p join Pendaftaran as pe on p.NoPasien=pe.NoPasien"

        Try
            dbcomm = New SqlCommand(sql, db.conn)
            dbread = dbcomm.ExecuteReader
            While dbread.Read
                cbPasienBayar.DisplayMember = "Text"
                cbPasienBayar.ValueMember = "Value"
                cbPasienBayar.Items.Add(New With {Key .Text = dbread("NoPendaftaran") & " - " & dbread("NoPasien") & " - " & dbread("NamaPass"), Key .Value = dbread("NoPendaftaran")})
            End While
            dbread.Close()
        Catch ex As Exception
            MsgBox(ex.Message, MsgBoxStyle.Critical)
        End Try
    End Sub

    Private Sub maxKodeBayar()
        sql = "select max(IDJenisBiaya) as lastId from JenisBiaya"

        Try
            dbcomm = New SqlCommand(sql, db.conn)
            dbread = dbcomm.ExecuteReader
            dbread.Read()
            txtIdBayar.Text = autoIncrement(dbread("lastId"))
            dbread.Close()
        Catch ex As Exception
            MsgBox(ex.Message, MsgBoxStyle.Critical)
        End Try
    End Sub

    Private Sub resetBayar()
        txtNamaBayar.Text = ""
        txtTarifBayar.Text = ""
        txtBiayaObat.Text = ""
        txtTotalBayar.Text = ""
        cbPasienBayar.SelectedIndex = -1
        cbPasienBayar.Text = "Pilih"
        maxKodeBayar()
        Me.BayarViewwTableAdapter.Fill(Me.POLIKLINIKDataSet8.BayarVieww)
    End Sub

    Private Sub btnAddBayar_Click(sender As Object, e As EventArgs) Handles btnAddBayar.Click
        db.insertBiaya(txtIdBayar.Text, txtNamaBayar.Text, txtTarifBayar.Text)
        db.insertDetailBiaya(txtIdBayar.Text, cbPasienBayar.SelectedItem.Value, txtBiayaObat.Text, txtTotalBayar.Text)
        MsgBox("Insert data success", MsgBoxStyle.Information)
        resetBayar()
        Recapt.Show()
    End Sub

    Private Sub btnEditBayar_Click_1(sender As Object, e As EventArgs) Handles btnEditBayar.Click
        db.updateBiaya(txtIdBayar.Text, txtNamaBayar.Text, txtTarifBayar.Text)
        db.updateDetailBiaya(txtIdBayar.Text, cbPasienBayar.SelectedItem.Value, txtBiayaObat.Text, txtTotalBayar.Text)
        MsgBox("Update data success", MsgBoxStyle.Information)
        resetBayar()
    End Sub

    Private Sub btnDeleteBayar_Click(sender As Object, e As EventArgs) Handles btnDeleteBayar.Click
        Dim i As Integer = DataGridViewBayar.CurrentRow.Index
        db.deleteDetailBiaya(DataGridViewBayar.Item(0, i).Value)
        db.deleteBiaya(DataGridViewBayar.Item(0, i).Value)
        MsgBox("Delete data success", MsgBoxStyle.Information)
        resetBayar()
    End Sub

    Private Sub btnCancelBayar_Click(sender As Object, e As EventArgs) Handles btnCancelBayar.Click
        resetBayar()
    End Sub

    Private Sub cbPasienBayar_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cbPasienBayar.SelectedIndexChanged
        Try
            sql = "select pe.NoPendaftaran as NoPendaftaran,p.nopasien as NoPasien,pe.NoPemeriksaan as NoPemeriksaan,r.jumlah as Jumlah,o.HargaJual as HargaJual,(r.jumlah*o.HargaJual) as total from Pendaftaran as p join Pasien as pa on p.NoPasien=pa.NoPasien join Pemeriksaan as pe on p.NoPendaftaran=pe.NoPendaftaran join Resep as r on r.NoPemeriksaan=pe.NoPemeriksaan join obat as o on r.KodeObat=o.KodeObat left join DetailBiaya as db on p.NoPendaftaran=db.NoPendaftaran left join JenisBiaya as jb on db.IDJenisBiaya=jb.IDJenisBiaya where p.NoPendaftaran=" & cbPasienBayar.SelectedItem.Value & ""

            Try
                dbcomm = New SqlCommand(sql, db.conn)
                dbread = dbcomm.ExecuteReader
                Dim i As Integer = 0
                Dim a As Integer() = New Integer(10) {}
                While dbread.Read()
                    a(i) = dbread("total")
                    i += 1
                End While

                Dim total As String
                For z As Integer = 0 To a.Length - 1
                    total += a(z)
                Next
                txtBiayaObat.Text = total

                Try
                    Dim y As Integer = txtTarifBayar.Text
                    Dim x As Integer = txtBiayaObat.Text
                    Dim s As Integer = y + x
                    txtTotalBayar.Text = s
                Catch ex As Exception

                End Try

                dbread.Close()
            Catch ex As Exception
                MsgBox(ex.Message, MsgBoxStyle.Critical)
            End Try
        Catch ex As Exception

        End Try
    End Sub

    Private Sub txtTarifBayar_TextChanged(sender As Object, e As EventArgs) Handles txtTarifBayar.TextChanged
        Try
            Dim y As Integer = txtTarifBayar.Text
            Dim x As Integer = txtBiayaObat.Text
            Dim s As Integer = y + x
            txtTotalBayar.Text = s
        Catch ex As Exception

        End Try
    End Sub

    Private Sub DataGridViewBayar_CellMouseClick(sender As Object, e As DataGridViewCellMouseEventArgs) Handles DataGridViewBayar.CellMouseClick
        Dim i As Integer = DataGridViewBayar.CurrentRow.Index

        txtIdBayar.Text = DataGridViewBayar.Item(0, i).Value
        txtNamaBayar.Text = DataGridViewBayar.Item(4, i).Value
        txtTarifBayar.Text = DataGridViewBayar.Item(5, i).Value
        txtBiayaObat.Text = DataGridViewBayar.Item(2, i).Value
        txtTotalBayar.Text = DataGridViewBayar.Item(3, i).Value
        cbPasienBayar.SelectedIndex = cbPasienBayar.FindString(DataGridViewBayar.Item(1, i).Value)
    End Sub



#End Region
End Class