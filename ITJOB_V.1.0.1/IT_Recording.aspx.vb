Option Explicit On
Option Strict On
Imports System.Linq
Imports System.Data.SqlClient
Imports System.Data

Imports System.Transactions
Imports System.Globalization


Public Class IT_Recording
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        showlistRecording()
    End Sub
    Protected Sub btnSave_ItR_Click(sender As Object, e As EventArgs) Handles btnSave_ItR.Click
        'Using tran As New TransactionScope()
        '    Using db = New DB_EaglesInternalEntities
        '        Try
        '            db.tblIDRecording.Add(New tblIDRecording With { _
        '                                  .recordingDate = DateTime.ParseExact(txtDateIt_R.Text, "dd/MM/yyyy", CultureInfo.CreateSpecificCulture("en-US")), _
        '                                  .recording_Time = txtTimeIt_R.Value, _
        '                                  .problems = txtProblems.Text, _
        '                                  .branch = txtBranch.Text, _
        '                                  .reason = txtReason.Text
        '                                })
        '            db.SaveChanges()
        '            tran.Complete()
        '            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "alertMessage", "alert('บันทึกสำเร็จ !');", True)
        '            clear()
        '            showlistRecording()
        '        Catch ex As Exception
        '            ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "alertMessage", "alert('เกิดข้อผิดพลาด กรุณาบันทึกข้อมูลใหม่อีกครั้ง');", True)
        '        Finally
        '            db.Database.Connection.Close()
        '            db.Dispose()
        '            tran.Dispose()
        '        End Try

        '    End Using
        'End Using
    End Sub
    Private Sub clear()
        txtDateIt_R.Text = ""
        txtTimeIt_R.Value = ""
        txtProblems.Text = ""
        txtBranch.Text = ""
        txtReason.Text = ""
    End Sub
    Private Sub showlistRecording()
        Using db = New DB_EaglesInternalEntities


            'Dim usergv = From tb1 In db.tblIDRecording
            '      Select tb1.recordingID,
            '      tb1.recordingDate,
            '      tb1.problems,
            '      tb1.reason,
            '      tb1.branch,
            '      tb1.recording_Time


            ''Dim result = userGV.Union(usergv1).ToList()
            'Try
            '    If usergv.Count > 0 Then
            '        Me.itRecordingGV.DataSource = usergv.ToList()
            '        Me.itRecordingGV.DataBind()
            '    Else
            '        Me.itRecordingGV.DataSource = Nothing
            '        Me.itRecordingGV.DataBind()
            '    End If
            'Catch ex As Exception
            '    ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "alertMessage", "alert('เกิดข้อผิดพลาด');", True)
            'End Try

        End Using
    End Sub
End Class