<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class Recapt
    Inherits System.Windows.Forms.Form

    'Form overrides dispose to clean up the component list.
    <System.Diagnostics.DebuggerNonUserCode()> _
    Protected Overrides Sub Dispose(ByVal disposing As Boolean)
        Try
            If disposing AndAlso components IsNot Nothing Then
                components.Dispose()
            End If
        Finally
            MyBase.Dispose(disposing)
        End Try
    End Sub

    'Required by the Windows Form Designer
    Private components As System.ComponentModel.IContainer

    'NOTE: The following procedure is required by the Windows Form Designer
    'It can be modified using the Windows Form Designer.  
    'Do not modify it using the code editor.
    <System.Diagnostics.DebuggerStepThrough()> _
    Private Sub InitializeComponent()
        Me.components = New System.ComponentModel.Container()
        Dim ReportDataSource1 As Microsoft.Reporting.WinForms.ReportDataSource = New Microsoft.Reporting.WinForms.ReportDataSource()
        Me.RecaptBindingSource = New System.Windows.Forms.BindingSource(Me.components)
        Me.POLIKLINIKDataSet7 = New POLIKLINIK.POLIKLINIKDataSet7()
        Me.ReportViewer1 = New Microsoft.Reporting.WinForms.ReportViewer()
        Me.RecaptTableAdapter = New POLIKLINIK.POLIKLINIKDataSet7TableAdapters.RecaptTableAdapter()
        CType(Me.RecaptBindingSource, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.POLIKLINIKDataSet7, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SuspendLayout()
        '
        'RecaptBindingSource
        '
        Me.RecaptBindingSource.DataMember = "Recapt"
        Me.RecaptBindingSource.DataSource = Me.POLIKLINIKDataSet7
        '
        'POLIKLINIKDataSet7
        '
        Me.POLIKLINIKDataSet7.DataSetName = "POLIKLINIKDataSet7"
        Me.POLIKLINIKDataSet7.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema
        '
        'ReportViewer1
        '
        Me.ReportViewer1.Dock = System.Windows.Forms.DockStyle.Fill
        ReportDataSource1.Name = "DataSet1"
        ReportDataSource1.Value = Me.RecaptBindingSource
        Me.ReportViewer1.LocalReport.DataSources.Add(ReportDataSource1)
        Me.ReportViewer1.LocalReport.ReportEmbeddedResource = "POLIKLINIK.Report1.rdlc"
        Me.ReportViewer1.Location = New System.Drawing.Point(0, 0)
        Me.ReportViewer1.Name = "ReportViewer1"
        Me.ReportViewer1.Size = New System.Drawing.Size(1132, 377)
        Me.ReportViewer1.TabIndex = 0
        '
        'RecaptTableAdapter
        '
        Me.RecaptTableAdapter.ClearBeforeFill = True
        '
        'Recapt
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(1132, 377)
        Me.Controls.Add(Me.ReportViewer1)
        Me.Name = "Recapt"
        Me.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen
        Me.Text = "Recapt"
        CType(Me.RecaptBindingSource, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.POLIKLINIKDataSet7, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ResumeLayout(False)

    End Sub

    Friend WithEvents ReportViewer1 As Microsoft.Reporting.WinForms.ReportViewer
    Friend WithEvents RecaptBindingSource As BindingSource
    Friend WithEvents POLIKLINIKDataSet7 As POLIKLINIKDataSet7
    Friend WithEvents RecaptTableAdapter As POLIKLINIKDataSet7TableAdapters.RecaptTableAdapter
End Class
