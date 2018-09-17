Option Explicit On
Option Strict On

Imports Ionic.Zip
Imports System.Transactions
Imports System.IO

Public Class Manual
    Inherits System.Web.UI.Page
    Dim f As String
    Dim bytes As Byte()
    Dim fileName As String
    ' Dim contentType As String
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim menu As String = "ITJOB"
        Dim userid = Session("UserID").ToString
        Using db = New DB_EaglesInternalEntities
            Dim men = From c In db.tblUserMenus Where c.UserID = userid And
                     c.Menu = menu And c.Edit_ = 1

            If men.Any Then

                FileUpload1.Visible = True
                lbltitle.Visible = True
                TextBox1.Visible = True
                btnUp.Visible = True
                lblText.Visible = True

            End If
        End Using
        If Not Me.IsPostBack Then
            BindData()
        End If
    End Sub
    Protected Sub btnUp_Click(sender As Object, e As EventArgs) Handles btnUp.Click
        Dim menu As String = "ITJOB"
        Dim userid = Session("UserID").ToString
        Using db = New DB_EaglesInternalEntities
            Dim men = From c In db.tblUserMenus Where c.UserID = userid And
                     c.Menu = menu And c.Edit_ = 1

            If men.Any Then
                Using tran As New TransactionScope()
                    Try

                        db.Database.Connection.Open()

                        If Me.FileUpload1.HasFile Then

                            db.tblFileITs.Add(New tblFileIT() With { _
                        .Filename = FileUpload1.FileName, _
                        .Title = TextBox1.Text.Trim, _
                        .Createby = Session("UserID").ToString, _
                        .Createdate = Now _
                   })
                            db.SaveChanges()

                        End If
                        tran.Complete()
                        Dim filename As String = Path.GetFileName(FileUpload1.PostedFile.FileName)
                        Me.FileUpload1.SaveAs(Server.MapPath("Myfiles/" & filename))
                        Me.lblText.Text = FileUpload1.FileName & "   Uploaded File Success.<br>"
                        'Response.Write("<script>alert('File Uploaded')</script>")
                        Response.Redirect("Manual.aspx")
                    Catch ex As Exception
                        Me.lblText.Text = FileUpload1.FileName & "   Uploaded File Error.<br>"
                    Finally
                        db.Database.Connection.Close()
                        db.Dispose()
                        tran.Dispose()

                    End Try

                End Using
            Else
                ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "alertMessage", "alert('You do not have access')", True)
            End If
        End Using
    End Sub

    Sub BindData()

        Dim userid = Session("UserID").ToString
        Using db = New DB_EaglesInternalEntities

            Dim Myfiles = From tb1 In db.tblFileITs Order By tb1.FileID Ascending
                    Select tb1.FileID,
                           tb1.Filename,
                           tb1.Title,
                           tb1.Createdate()


            'Assign to GridView
            If Myfiles.Count > 0 Then
                Me.FileGV.DataSource = Myfiles.ToList
                Me.FileGV.DataBind()
            Else
                Me.FileGV.DataSource = Nothing
                Me.FileGV.DataBind()
            End If
        End Using
    End Sub


    Protected Sub DownloadFiles(sender As Object, e As EventArgs)

        Dim userid = Session("UserID").ToString
        Using db = New DB_EaglesInternalEntities

            Try
                Using zip As New ZipFile()
                    zip.AlternateEncodingUsage = ZipOption.AsNecessary
                    For Each row As GridViewRow In FileGV.Rows
                        If TryCast(row.FindControl("chkSelect"), CheckBox).Checked Then
                            Dim filename As String = TryCast(row.FindControl("lblfilename"), Label).Text
                            Dim filePath As String = Server.MapPath("~/Myfiles/" + filename)
                            'zip.AddFile(filePath, "Myfiles")
                            Dim peoc As New Diagnostics.Process
                            Process.Start(filePath)
                        End If
                    Next

                    'Response.Clear()
                    'Response.BufferOutput = False
                    'Dim zipName As String = [String].Format("Zip_{0}.zip", DateTime.Now.ToString("yyyy-MMM-dd-HHmmss"))
                    'Response.ContentType = "application/zip"
                    'Response.AppendHeader("content-disposition", "attachment; filename=" + zipName)
                    'zip.Save(Response.OutputStream)
                    'Response.[End]()
                End Using
            Catch ex As Exception
                ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "alertMessage", "alert('เกิดข้อผิดพลาด !!!!')", True)
            End Try

        End Using

    End Sub
End Class