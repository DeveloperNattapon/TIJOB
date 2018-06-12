Option Explicit On
Option Strict On

Imports System.Linq
Imports System.Data.SqlClient
Imports System.Data
Imports System.Web.UI.WebControls
Imports System.Transactions
Public Class edit_PreviewJob
    Inherits System.Web.UI.Page
    Private _jobId As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Me.IsPostBack Then
            checkUser()
            showEditPreview()

        End If

    End Sub
    Sub RunNo()


        Using tran As New TransactionScope()
            Using db = New DB_EaglesInternalEntities

                Try
                    db.Database.Connection.Open()


                Catch ex As Exception
                    ScriptManager.RegisterStartupScript(Me, Me.GetType(), "redirect", "alert('error runnumber');", True)
                Finally
                    db.Database.Connection.Close()
                    db.Dispose()
                    tran.Dispose()
                End Try

            End Using
        End Using

    End Sub

    Private Sub checkUser()
        'Check permissions user'
        Dim menu As String = "ITJOB"
        Dim userid = Session("UserID").ToString
        Using db = New DB_EaglesInternalEntities

            Dim men = From c In db.tblUserMenus Where c.UserID = ID And
            c.Menu = menu And c.Edit_ = 1

        End Using

    End Sub
    Private Sub showEditPreview()

        Dim JobID As String = Request.QueryString("Job_ID")

        Using db = New DB_EaglesInternalEntities

            Dim ds = (From c In db.tblItJobDocs Where c.ItJobDocID = JobID).SingleOrDefault
            lblDocID.Text = ds.ItJobDocID
            txtRequest.Text = ds.RequestFrom
            txtUserIP.Text = ds.UserIP
            txtUserTel.Text = ds.UserTel
            txtDivision.Text = ds.DivisionName
            txtDetail.Text = ds.JobDetail
            labbuild.Text = String.Format("{0:dd/MM/yyyy }", ds.CreateDate)

            Dim ds3 = (From c In db.tblCaseJobs Where c.CaseJobID = ds.CaseJobID).SingleOrDefault
            txtCaseJob.Text = ds3.CaseName

        End Using


    End Sub
    Private Sub upDatePreview()
        Dim JobID As String = Request.QueryString("Job_ID")
        Using db = New DB_EaglesInternalEntities

            Try

                Dim edit As tblItJobDoc = (From c In db.tblItJobDocs Where c.ItJobDocID = JobID
                                            Select c).First()

                'Dim ds3 As tblCaseJob = (From c In db.tblCaseJob Where c.CaseJobID = update.CaseJobID Select c).FirstOrDefault()
                If edit IsNot Nothing Then
                    edit.RequestFrom = txtRequest.Text.Trim
                    edit.UserIP = txtUserIP.Text.Trim
                    edit.UserTel = txtUserTel.Text.Trim
                    edit.DivisionName = txtDivision.Text.Trim
                    edit.JobDetail = txtDetail.Text.Trim

                    'ds3.CaseName = txtCaseJob.Text.ToString
                    edit.Updateby = Session("userid").ToString

                    db.SaveChanges()

                    ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "redirect", "alert('แก้ไขเรียบร้อย ค่ะ ! ')", True)

                    Response.Redirect("homepage.aspx")

                End If

            Catch ex As Exception

                ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "alertMessage", "alert('ไม่สามารถแก้ไข ได้ค่ะ ! ')", True)

            End Try

        End Using
    End Sub


    Protected Sub btnSave_Preview_Click(sender As Object, e As EventArgs) Handles btnSave_Preview.Click
        'เรียก '
        upDatePreview()

    End Sub

    Public Overridable Property jobDocID() As String
        Get
            Return _jobId
        End Get
        Set(value As String)

            _jobId = value

        End Set
    End Property


End Class