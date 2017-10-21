Public Class Recapt
    Private Sub Recapt_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        'TODO: This line of code loads data into the 'POLIKLINIKDataSet7.Recapt' table. You can move, or remove it, as needed.
        Me.RecaptTableAdapter.Fill(Me.POLIKLINIKDataSet7.Recapt)

        Me.ReportViewer1.RefreshReport()
    End Sub
End Class