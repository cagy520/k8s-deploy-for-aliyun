using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _mds : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        ListBox1.Items.Clear();
        string json= GetUrlJson();
        string[] a = { "\"name\":\"" };
        string[] b = { "\",\"generateName" };
        string[] js = json.Split(a,StringSplitOptions.RemoveEmptyEntries);
        List<string> pods = new List<string>();

        for (int i = 0; i < js.Length; i++)
        {
            if ((js[i].Contains("generateName"))&&(!js[i].Contains("coredns"))&&(!js[i].Contains("kube"))) ListBox1.Items.Add(js[i].Split(b, StringSplitOptions.RemoveEmptyEntries)[0]);// pods.Add(js[i].Split(b, StringSplitOptions.RemoveEmptyEntries)[0]);
            
        }
    }
   

    public void del()
    {
        //Web访问对象，构造请求的url地址
        string serviceUrl = string.Format(TextBox1.Text+"/api/v1/namespaces/default/pods/" + ListBox1.SelectedValue);

        //构造http请求的对象
        HttpWebRequest myRequest = (HttpWebRequest)WebRequest.Create(serviceUrl);
        //转成网络流
        byte[] buf = System.Text.Encoding.GetEncoding("UTF-8").GetBytes("");
        //设置
        myRequest.Method = "DELETE";
        myRequest.ContentLength = buf.Length;
        myRequest.ContentType = "application/json";
        myRequest.MaximumAutomaticRedirections = 1;
        myRequest.AllowAutoRedirect = true;
        // 发送请求
        Stream newStream = myRequest.GetRequestStream();
        newStream.Write(buf, 0, buf.Length);
        newStream.Close();
        // 获得接口返回值
        HttpWebResponse myResponse = (HttpWebResponse)myRequest.GetResponse();
        StreamReader reader = new StreamReader(myResponse.GetResponseStream(), Encoding.UTF8);
        string ReturnXml = reader.ReadToEnd();
        reader.Close();
        myResponse.Close();
        ListBox1.Items.Add("---------");
        ListBox1.Items.Add("好像没报错");
        ListBox1.Items.Add("再获取POD列表看看有没有变化");
        ListBox1.Items.Add("有变化就成功了");
        ListBox1.Width = 600;
    }
    public string GetUrlJson()
    {
        try
        {
            //构造http请求的对象
            ServicePointManager.SecurityProtocol = (SecurityProtocolType)3072; //一定要有这一句
            HttpWebRequest request = (HttpWebRequest)WebRequest.Create(TextBox1.Text+ "/api/v1/pods");
            ServicePointManager.ServerCertificateValidationCallback = delegate { return true; };
            ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls;

            request.Method = "get";
            request.Headers["Token"] = "eyJhbGciOiJSUzI1NiIsImtpZCI6IiJ9.eyJpc3MiOiJrdWJlcm5ldGVzL3NlcnZpY2VhY2NvdW50Iiwia3ViZXJuZXRlcy5pby9zZXJ2aWNlYWNjb3VudC9uYW1lc3BhY2UiOiJrdWJlLXN5c3RlbSIsImt1YmVybmV0ZXMuaW8vc2VydmljZWFjY291bnQvc2VjcmV0Lm5hbWUiOiJhZG1pbi11c2VyLXRva2VuLXZ0dDJtIiwia3ViZXJuZXRlcy5pby9zZXJ2aWNlYWNjb3VudC9zZXJ2aWNlLWFjY291bnQubmFtZSI6ImFkbWluLXVzZXIiLCJrdWJlcm5ldGVzLmlvL3NlcnZpY2VhY2NvdW50L3NlcnZpY2UtYWNjb3VudC51aWQiOiIwZGE4ZTA1MS01NmRiLTQ0MDctODllYS1kYjcxNzBmM2Q3ODMiLCJzdWIiOiJzeXN0ZW06c2VydmljZWFjY291bnQ6a3ViZS1zeXN0ZW06YWRtaW4tdXNlciJ9.hNrlq12eYIvdRUZG4vhTo8JeY8rBODlfM3CbX6GcLaihNZbHNpSlnqDoFh-rvMW6VQ-lel8Ae-EF8J5tupxpXXzcKMc8XKFXKeBqwH6OSKMV1AmsNtG0F8PIlGSrKj5KhWmx4OGfS1LMT3ESKOvRWRFRPiI4mvEi5CtKhOxoRCvE9HiM46H2UzUd-6YQ4ijkuHtFdRKS70Exapk3SrfL6fdrD_9UJoqsgHiW1lg6yoCWiR14NfLz3RoIlb_u73L5Df3GI4AOvYJjRuFSCE6O4RNhIH9KvwhhLOQ7EN09blM7L31nXA5Rmd4NQU2cHTwAFNZmGejanLEFG_eTwx73AQ"; //添加头
            request.ContentType = "application/json;charset=UTF-8";
            HttpWebResponse response = (HttpWebResponse)request.GetResponse();
            string json = GetResponseString(response);
            return json;
        }
        catch (Exception e)
        {
            Console.Write("WebHelper:" + e.Message);
            ListBox1.Items.Add(e.Message);
            return "";
        }
    }
    public string GetResponseString(HttpWebResponse response)
    {
        string json = null;
        using (StreamReader reader = new StreamReader(response.GetResponseStream(), System.Text.Encoding.GetEncoding("UTF-8")))
        {
            json = reader.ReadToEnd();
        }
        return json;
    }


    protected void Button2_Click(object sender, EventArgs e)
    {
        del();
    }
}