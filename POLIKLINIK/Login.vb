Public Class Login
    Dim db As New Database
    Private Sub Login_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        db.conn()
    End Sub

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        If db.login(TextBox1.Text, TextBox2.Text) = True Then
            Admin_Nav.Show()
            Me.Close()
        Else
            MsgBox("Login failed, check username and password!", MsgBoxStyle.Exclamation)
        End If
    End Sub
End Class
