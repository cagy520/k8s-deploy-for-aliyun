<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>KUBE-CAGY</h1>
        <p class="lead">获取列表，然后更新部署！小田田K8S更新神器！</p>
        <p class="lead">
            地址:<asp:TextBox ID="TextBox1" runat="server" Width="573px" TextMode="Url">https://jks.funenc.com:7901</asp:TextBox>
        </p>
        <p class="lead">
            密钥:<asp:TextBox ID="TextBox2" runat="server" Width="574px" TextMode="Password">eyJhbGciOiJSUzI1NiIsImtpZCI6IiJ9.eyJpc3MiOiJrdWJlcm5ldGVzL3NlcnZpY2VhY2NvdW50Iiwia3ViZXJuZXRlcy5pby9zZXJ2aWNlYWNjb3VudC9uYW1lc3BhY2UiOiJrdWJlLXN5c3RlbSIsImt1YmVybmV0ZXMuaW8vc2VydmljZWFjY291bnQvc2VjcmV0Lm5hbWUiOiJhZG1pbi11c2VyLXRva2VuLXZ0dDJtIiwia3ViZXJuZXRlcy5pby9zZXJ2aWNlYWNjb3VudC9zZXJ2aWNlLWFjY291bnQubmFtZSI6ImFkbWluLXVzZXIiLCJrdWJlcm5ldGVzLmlvL3NlcnZpY2VhY2NvdW50L3NlcnZpY2UtYWNjb3VudC51aWQiOiIwZGE4ZTA1MS01NmRiLTQ0MDctODllYS1kYjcxNzBmM2Q3ODMiLCJzdWIiOiJzeXN0ZW06c2VydmljZWFjY291bnQ6a3ViZS1zeXN0ZW06YWRtaW4tdXNlciJ9.hNrlq12eYIvdRUZG4vhTo8JeY8rBODlfM3CbX6GcLaihNZbHNpSlnqDoFh-rvMW6VQ-lel8Ae-EF8J5tupxpXXzcKMc8XKFXKeBqwH6OSKMV1AmsNtG0F8PIlGSrKj5KhWmx4OGfS1LMT3ESKOvRWRFRPiI4mvEi5CtKhOxoRCvE9HiM46H2UzUd-6YQ4ijkuHtFdRKS70Exapk3SrfL6fdrD_9UJoqsgHiW1lg6yoCWiR14NfLz3RoIlb_u73L5Df3GI4AOvYJjRuFSCE6O4RNhIH9KvwhhLOQ7EN09blM7L31nXA5Rmd4NQU2cHTwAFNZmGejanLEFG_eTwx73AQ</asp:TextBox>
        </p>
        <p>
            <asp:Button ID="Button1" class="btn btn-primary btn-lg" runat="server" OnClick="Button1_Click" Text="获取pods列表" />
            <asp:Button ID="Button2" class="btn btn-primary btn-lg" runat="server" OnClick="Button2_Click" Text="选下面的然后重新拉取新镜像" />
                    
        </p>
            <asp:ListBox ID="ListBox1"  runat="server" Height="500px"  style="width:600px"></asp:ListBox>
        <p>

        </p>
    </div>

   
</asp:Content>
