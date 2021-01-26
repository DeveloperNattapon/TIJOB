Option Strict On
Option Explicit On
Imports System
Imports System.Collections.Generic
Imports System.Linq
Imports System.Web.UI
Imports System.Web
Imports System.Web.UI.WebControls
Imports System.Globalization

Public Class Homepage
    Inherits System.Web.UI.Page
    Dim jobID As String
    Dim typejob As String
    Dim createBy As String
    Dim recipient As String
    Dim cssign As String
    Dim dateSB As String
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        title2.Visible = False
        BindData()
        showData()
    End Sub

    Sub BindData()
        Dim menu As String = "ITJOB"
        Dim userid = Session("UserID").ToString
        'Using db = New DB_EaglesInternalEntities


        '    'Dim usergv = From tb1 In db.tblItJobDoc Where tb1.CreateBy = userid
        '    '     Select tb1.ItJobDocID,
        '    '            tb1.RequestFrom,
        '    '            tb1.DivisionName,
        '    '            tb1.JobStatus,
        '    '            tb1.CreateDate,
        '    '            Recipient = tb1.RecipientJob,
        '    '            Assign = tb1.AssignJobTo

        '    Dim usergv = From tb1 In db.tblItJobDocs
        '          Join tb2 In db.tblUsers On tb1.RecipientJob Equals tb2.UserId
        '          Select tb1.ItJobDocID,
        '                 tb1.RequestFrom,
        '                 tb1.DivisionName,
        '                 tb1.JobStatus,
        '                 tb1.CreateDate,
        '                 Recipient = tb2.Name_thai,
        '                 Assign = tb2.Name_thai


        'Dim result = userGV.Union(usergv1).ToList()

        'If usergv.Count > 0 Then
        '        Me.userGV.DataSource = usergv.ToList()
        '        Me.userGV.DataBind()
        '    Else
        '        Me.userGV.DataSource = Nothing
        '        Me.userGV.DataBind()
        '    End If
        'End Using

    End Sub
    Private Sub showData()

        Dim menu As String = "ITJOB"
        Dim userid = Session("UserID").ToString
        Using db = New DB_EaglesInternalEntities
            Dim men = From c In db.tblUserMenus Where c.UserID = userid And
                           c.Menu = menu And c.Edit_ = 1

            If men.Any Then

                title2.Visible = True

                Dim JobITGV = From tb1 In db.tblItJobDocs Where tb1.JobStatus = "createjob.png"
                    Join tb2 In db.tblCaseJobs On tb1.CaseJobID Equals tb2.CaseJobID
                    Select tb1.ItJobDocID,
                           tb1.RequestFrom,
                           tb1.JobStatus,
                           tb1.CreateDate,
                           tb1.CaseJobID,
                           CaseJob = tb2.CaseName


                'Assign to GridView
                If JobITGV.Count > 0 Then
                    Me.JobITGV.DataSource = JobITGV.ToList()
                    Me.JobITGV.DataBind()
                Else
                    Me.JobITGV.DataSource = Nothing
                    Me.JobITGV.DataBind()
                End If
            End If


        End Using
    End Sub

    Sub SearchBindData(jobID As String, typejob As String, createBy As String, _recipient As String, cssign As String, dateup As String)



        Dim menu As String = "ITJOB"
        Dim userid = Session("UserID").ToString

        Convert.ToDateTime(False).ToString("dd/MM/yyyy")
        Using db = New DB_EaglesInternalEntities

            Dim dateS As Date = DateTime.ParseExact(dateup, "dd/MM/yyyy", CultureInfo.CreateSpecificCulture("en-US"))


            Dim usergv = From tb1 In db.tblItJobDocs
                  Join tb2 In db.tblUsers On tb1.RecipientJob Equals tb2.UserId
                  Join tb3 In db.tblCaseJobs On tb1.CaseJobID Equals tb3.CaseJobID
                  Where tb1.ItJobDocID = jobID Or tb1.CreateBy = createBy Or tb3.CaseName = typejob Or tb2.Name_thai = _recipient _
                  Or tb2.Name_thai = cssign Or tb1.CreateDate >= dateS
                  Select tb1.ItJobDocID,
                         tb1.RequestFrom,
                         tb1.DivisionName,
                         tb1.JobStatus,
                         tb1.CreateDate,
                         Recipient = tb2.Name_thai,
                         Assign = tb2.Name_thai

            'Dim result = usergv.Union(usergv1).ToList()

            If usergv.Count > 0 Then
                Me.userGV.DataSource = usergv.ToList
                Me.userGV.DataBind()
            Else
                Me.userGV.DataSource = Nothing
                Me.userGV.DataBind()
            End If

        End Using

    End Sub


    Protected Sub btnAdd_Click(sender As Object, e As EventArgs)
        Response.Redirect("addjob.aspx")
    End Sub
    Protected Sub JobITGV_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles JobITGV.RowCommand

        Dim index As String = CStr(e.CommandArgument)
        Dim LoginCls As New LoginCls

        Dim Key As String = LoginCls.EncryptPass
        Dim id As String = Session("UserID").ToString
        Dim menu As String = "ITJOB"

        If e.CommandName.Equals("AssignTo") Then

            Using db = New DB_EaglesInternalEntities
                Dim men = From c In db.tblUserMenus Where c.UserID = id And
                c.Menu = menu And c.Edit_ = 1

                If men.Any Then

                    Dim ds = (From c In db.tblItJobDocs Where c.ItJobDocID = index).SingleOrDefault
                    lbldocID2.Text = ds.ItJobDocID
                    lblRequest2.Text = ds.RequestFrom
                    lblDetail.Text = ds.JobDetail

                    Dim ds1 = (From c In db.tblUsers Where c.UserId = ds.CreateBy).SingleOrDefault
                    lblcreate2.Text = ds1.Name_thai
                    lblDept.Text = ds1.Dept
                    lblBranch.Text = ds1.Branch

                    Dim ds2 = (From c In db.tblCaseJobs Where c.CaseJobID = ds.CaseJobID).SingleOrDefault
                    'lblCaseJob.Text = ds2.CaseName

                    ScriptManager.RegisterStartupScript(Me, Me.GetType(), "EditModalScript", "openModal();", True)
                Else
                    ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "alertMessage", "alert('You do not have access')", True)

                End If

            End Using
        End If

    End Sub

    Protected Sub btnSaveChange_Click(sender As Object, e As EventArgs) Handles btnSaveChange.Click

        Using db = New DB_EaglesInternalEntities

            Dim Job As tblItJobDoc = (From c In db.tblItJobDocs Where c.ItJobDocID = lbldocID2.Text
                        Select c).First()

            Job.Position = ddlPosition.Text.Trim
            Job.AssignJobTo = ddlAssign.Text.Trim
            Job.RecipientJob = Session("userid").ToString
            Job.Comment = txtComment.Text.Trim
            Job.JobStatus = "acceptjob.png"
            Job.Updateby = Session("userid").ToString
            Job.UpdateDate = Now

            db.SaveChanges()
            ' Response.Redirect(Request.Cookies("MainConfigPath").Value + "SearchUser.aspx")
            Response.Redirect("homepage.aspx")
        End Using

    End Sub



    Protected Sub userGV_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles userGV.RowDataBound
        Dim JobId As Label = CType(e.Row.FindControl("lblDocID"), Label)

        If e.Row.RowType = DataControlRowType.DataRow Then
            e.Row.Style.Add(HtmlTextWriterStyle.Cursor, "pointer")
            'e.Row.Attributes.Add("onmouseover", "this.style.backgroundColor='#ffdaa9';")
            'e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor='#fff';")
            'e.Row.Attributes.Add("onclick", " Response.Redirect('Preview.aspx?JobID=" & e.Row.Cells(0).text.Trim() & "',target='_self')")
            e.Row.Attributes.Add("onclick", "window.open('Preview.aspx?Job_ID=" & JobId.Text & "',target='_self')")
        End If
    End Sub



    Protected Sub userGV_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles userGV.RowCommand

        Dim index As String = CStr(e.CommandArgument)
        Dim LoginCls As New LoginCls

        Dim Key As String = LoginCls.EncryptPass
        Dim id As String = Session("UserID").ToString
        Dim menu As String = "ITJOB"

        If e.CommandName.Equals("Edit") Then

            Using db = New DB_EaglesInternalEntities
                Dim men = From c In db.tblUserMenus Where c.UserID = id And
                c.Menu = menu And c.Edit_ = 1
                If men.Any Then
                    Dim ds = (From c In db.tblItJobDocs Where c.ItJobDocID = index).SingleOrDefault
                    lbldocID2.Text = ds.ItJobDocID
                    lblRequest2.Text = ds.RequestFrom
                    lblDetail.Text = ds.JobDetail

                    Dim ds1 = (From c In db.tblUsers Where c.UserId = ds.CreateBy).SingleOrDefault
                    lblcreate2.Text = ds1.Name_thai
                    lblDept.Text = ds1.Dept
                    lblBranch.Text = ds1.Branch

                    Dim ds2 = (From c In db.tblCaseJobs Where c.CaseJobID = ds.CaseJobID).SingleOrDefault
                    'lblCaseJob.Text = ds2.CaseName

                    ScriptManager.RegisterStartupScript(Me, Me.GetType(), "EditModalScript", "openModal();", True)
                Else
                    ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "alertMessage", "alert('You do not have access')", True)

                End If

            End Using
        End If

    End Sub

    Protected Sub btnSearhHp_click(sender As Object, e As EventArgs)



        If ddlcategory.Text = "ค้นหาจาก" Then
            BindData()
        Else

            If ddlcategory.Text = "ประเภทงาน" Then
                typejob = txtSearchHp.Value
            ElseIf ddlcategory.Text = "หมายเลขเอกสาร" Then
                jobID = txtSearchHp.Value
            ElseIf ddlcategory.Text = "ชื่อผู้สร้าง" Then
                createBy = txtSearchHp.Value
            ElseIf ddlcategory.Text = "ผู้รับงาน" Then
                recipient = txtSearchHp.Value
            ElseIf ddlcategory.Text = "ผู้แก้ไข" Then
                cssign = txtSearchHp.Value
            ElseIf ddlcategory.Text = "วันที่รับงาน" Then
                dateSB = Convert.ToDateTime(dtpFromDate.Text).ToString("dd/MM/yyyy")

            End If
            'MsgBox(dateSB)
            SearchBindData(jobID, typejob, createBy, recipient, cssign, dateSB)
        End If


    End Sub

    Protected Sub userGV_PageIndexChanging(sender As Object, e As GridViewPageEventArgs) Handles userGV.PageIndexChanging
        userGV.PageIndex = e.NewPageIndex
    End Sub

    Private Sub showCaseJob()
        ddlAssign.Items.Clear()
        ddlAssign.Items.Add(New ListItem("Select CaseJob", ""))
        ddlAssign.AppendDataBoundItems = True

        Using db As New DB_EaglesInternalEntities
            Dim din = From di In db.tblUsers
                      Select di.UserId, di.Name_thai
            Try
                ddlAssign.DataSource = din.ToList
                ddlAssign.DataTextField = "Name_thai"
                ddlAssign.DataValueField = "UserId"
                ddlAssign.DataBind()
                If ddlAssign.Items.Count > 1 Then
                    ddlAssign.Enabled = True
                Else
                    ddlAssign.Enabled = False
                End If
            Catch ex As Exception
                Throw ex
            End Try
        End Using

    End Sub
End Class