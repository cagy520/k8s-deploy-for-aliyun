<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="mds.aspx.cs" Inherits="_mds" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>KUBE-MDIAS</h1>
        <p class="lead">获取列表，然后更新部署！小田田K8S更新神器！</p>
        <p class="lead">
            地址:<asp:TextBox ID="TextBox1" runat="server" Width="573px" TextMode="Url">https://47.97.217.46:7104</asp:TextBox>
        </p>
        <p class="lead">
            密钥:<asp:TextBox ID="TextBox2" runat="server" Width="574px">eyJhbGciOiJSUzI1NiIsImtpZCI6IiJ9.eyJpc3MiOiJrdWJlcm5ldGVzL3NlcnZpY2VhY2NvdW50Iiwia3ViZXJuZXRlcy5pby9zZXJ2aWNlYWNjb3VudC9uYW1lc3BhY2UiOiJrdWJlLXN5c3RlbSIsImt1YmVybmV0ZXMuaW8vc2VydmljZWFjY291bnQvc2VjcmV0Lm5hbWUiOiJhZG1pbi11c2VyLXRva2VuLXRocnRkIiwia3ViZXJuZXRlcy5pby9zZXJ2aWNlYWNjb3VudC9zZXJ2aWNlLWFjY291bnQubmFtZSI6ImFkbWluLXVzZXIiLCJrdWJlcm5ldGVzLmlvL3NlcnZpY2VhY2NvdW50L3NlcnZpY2UtYWNjb3VudC51aWQiOiI1NjM1YWI5Ny1iOTdhLTExZTktOTUwMS04MDE4NDRmMmIwZTAiLCJzdWIiOiJzeXN0ZW06c2VydmljZWFjY291bnQ6a3ViZS1zeXN0ZW06YWRtaW4tdXNlciJ9.lh3IS9ywWQc_3GcJf0uQj7mzSmxyqeQdMdmYKk7vnqgNLMe9yufXB2KOUGASW36pWdC2MU8iriKbXlDC9Q9bi8hZi1c234uiyOgzj8gzeB-ZVbellGnb8EzDgjLKGQ2zNrdCraMtfcjhdKLkRmO2wBlooWdSwjEu3ClHemivOWO43D-hXVfKnlTN9VvQdKD_VVTjAomkrs-LeqDwbsrbAt_HmhguAURrl8uf33Prp_fzRwsBKTyUQgZ5nw0ha9A0u11WJZrXjw2pBsD38wGE7WmYtaitzPGI2BMxxOXq3km7Qvnmppi-6BZ4EcyRqGezY4HNzSkYRihTJZ7eGjtSqA</asp:TextBox>
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
