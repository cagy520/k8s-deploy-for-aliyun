<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>KUBE-CAGY</h1>
        <p class="lead">获取列表，然后更新部署！小田田K8S更新神器！</p>
        <p class="lead">
            地址:<asp:TextBox ID="TextBox1" runat="server" Width="573px" TextMode="Url">https://yourdomain.com:6443</asp:TextBox>
        </p>
        <p class="lead">
            密钥:<asp:TextBox ID="TextBox2" runat="server" Width="574px" TextMode="Password">your token</asp:TextBox>
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
