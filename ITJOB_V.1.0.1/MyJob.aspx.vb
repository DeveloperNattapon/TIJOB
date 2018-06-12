Option Explicit On
Option Strict On

Public Class MyJob
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim menu As String = "ITJOB"
        Dim userid = Session("UserID").ToString
        Using db = New DB_EaglesInternalEntities
            Dim men = From c In db.tblUserMenus Where c.UserID = userid And
                     c.Menu = menu And c.Edit_ = 1

            If men.Any Then
                lblaccess.Visible = False
                lbltitle1.Visible = True
                lbltitle2.Visible = True
                BindData()
                BindData1()
            End If
        End Using
    End Sub
    Sub BindData()

        Dim userid = Session("UserID").ToString
        Using db = New DB_EaglesInternalEntities

            Dim MyJobGV = From tb1 In db.tblItJobDocs Where tb1.AssignJobTo = userid And tb1.JobStatus = "acceptjob.png"
                    Join tb2 In db.tblCaseJobs On tb1.CaseJobID Equals tb2.CaseJobID
                    Join tb3 In db.tblUsers On tb1.RecipientJob Equals tb3.UserId
                    Select tb1.ItJobDocID,
                           tb1.RequestFrom,
                           tb1.JobStatus,
                           tb1.CreateDate,
                           tb1.CaseJobID,
                           CaseJob = tb2.CaseName,
                           Recipient = tb3.Name_thai

            'Assign to GridView
            If MyJobGV.Count > 0 Then
                Me.MyJobGV.DataSource = MyJobGV.ToList()
                Me.MyJobGV.DataBind()
            Else
                Me.MyJobGV.DataSource = Nothing
                Me.MyJobGV.DataBind()
            End If


        End Using

    End Sub

    Sub BindData1()

        Dim userid = Session("UserID").ToString
        Using db = New DB_EaglesInternalEntities

            Dim RepairGV = From tb1 In db.tblItJobDocs Where tb1.AssignJobTo = userid And tb1.JobStatus <> "acceptjob.png" And tb1.JobStatus <> "closejob.png" Or tb1.RecipientJob = userid And tb1.JobStatus <> "closejob.png"
                  Join tb2 In db.tblCaseJobs On tb1.CaseJobID Equals tb2.CaseJobID
                  Join tb3 In db.tblUsers On tb1.AssignJobTo Equals tb3.UserId
                  Join tb4 In db.tblUsers On tb1.RecipientJob Equals tb4.UserId
                  Order By tb1.CreateDate
                  Select tb1.ItJobDocID,
                         tb1.RequestFrom,
                         tb1.JobStatus,
                         tb1.CreateDate,
                         tb1.CaseJobID,
                         CaseJob = tb2.CaseName,
                         Assign = tb3.Name_thai,
                         Recipient = tb4.Name_thai

            'Assign to GridView
            If RepairGV.Count > 0 Then
                Me.RepairGV.DataSource = RepairGV.ToList()
                Me.RepairGV.DataBind()
            Else
                Me.RepairGV.DataSource = Nothing
                Me.RepairGV.DataBind()
            End If


        End Using

    End Sub

    Protected Sub Edit_Click(sender As Object, e As EventArgs)

        Dim lnkbtn As LinkButton = CType(sender, LinkButton)
        Dim id As String = lnkbtn.CommandArgument.ToString
        getusetMail(id)

    End Sub



    Protected Sub RepairGV_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles RepairGV.RowDataBound
        Dim Job_Id As Label = CType(e.Row.FindControl("lblDocID1"), Label)

        If e.Row.RowType = DataControlRowType.DataRow Then
            e.Row.Style.Add(HtmlTextWriterStyle.Cursor, "pointer")
            e.Row.Attributes.Add("onmouseover", "this.style.backgroundColor='#ffdaa9';")
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor='#fff';")
            e.Row.Attributes.Add("onclick", "window.open('closejob.aspx?Job_ID=" & Job_Id.Text & "',target='_self')")
        End If
    End Sub

    Protected Sub btnAddClode_Click(sender As Object, e As EventArgs)
        Response.Redirect("itClose_Job.aspx")
    End Sub
    Private Sub getusetMail(itID As String)

        'Dim userid = Session("UserID").ToString
        Using db As New DB_EaglesInternalEntities
            Dim _mail As New Mail()
            Dim MyJobGV = (From tb1 In db.tblItJobDocs Where tb1.ItJobDocID = itID
                  Join tb2 In db.tblUsers On tb1.RecipientJob Equals tb2.UserId).SingleOrDefault
            Dim m As String = MyJobGV.tb2.Email
            Try
                'เช็คค่าว่าง
                If (String.IsNullOrEmpty(m)) Then
                    getJob(itID)

                Else
                    _mail.sendMail("nattaphon.k@eaglesthai.com")
                    getJob(itID)
                End If
            Catch ex As Exception
                ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "alertMessage", "alert('เกิดข้อมูลผิดพลาด กรุณาติดต่อฝ่าย IT ! ')", True)
            End Try
        End Using

    End Sub
    Private Sub getJob(userId As String)
        Using db = New DB_EaglesInternalEntities

            Dim Job As tblItJobDoc = (From c In db.tblItJobDocs _
                                Where c.ItJobDocID = userId _
                                Select c).First()
            Job.JobStatus = "repairjob.png"
            Job.Updateby = Session("userid").ToString
            Job.UpdateDate = Now

            db.SaveChanges()
            Response.Redirect("MyJob.aspx")
            ' Response.Redirect(Request.Cookies("MainConfigPath").Value + "SearchUser.aspx")

        End Using
    End Sub
End Class