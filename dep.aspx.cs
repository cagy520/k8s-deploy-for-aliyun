using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class dep : System.Web.UI.Page
{
    string depl = "apiVersion: apps/v1\r\nkind: Deployment\r\nmetadata:\r\n  labels:\r\n    app: %cagy\r\n  name: %cagy\r\nspec:\r\n  replicas: 1\r\n  revisionHistoryLimit: 10\r\n  selector:\r\n    matchLabels:\r\n      app: %cagy\r\n  template:\r\n    metadata:\r\n      labels:\r\n        app: %cagy\r\n    spec:\r\n      containers:\r\n        - env:\r\n            - name: LANG\r\n              value: C.UTF-8\r\n          image: '%docker'\r\n          imagePullPolicy: Always\r\n          name: %cagy\r\n          resources:\r\n            requests:\r\n              cpu: 50m\r\n              memory: 100Mi\r\n          volumeMounts:\r\n            - mountPath: /var/log/supervisor\r\n              name: vm-%cagy-supervisor\r\n            - mountPath: /var/lib/odoo\r\n              name: vm-%cagy-odoo\r\n      dnsPolicy: ClusterFirst\r\n      restartPolicy: Always\r\n      schedulerName: default-scheduler\r\n      securityContext: {}\r\n      volumes:\r\n        - hostPath:\r\n            path: /tmp/%cagy\r\n            type: ''\r\n          name: vm-%cagy-supervisor\r\n        - hostPath:\r\n            path: /tmp/%cagy\r\n            type: ''\r\n          name: vm-%cagy-odoo";
    string svc = "apiVersion: v1\r\nkind: Service\r\nmetadata:\r\n  annotations:\r\n    service.beta.kubernetes.io/alicloud-loadbalancer-address-type: intranet\r\n    service.beta.kubernetes.io/alicloud-loadbalancer-id: lb-bp1fgv4f4ayv01dbj9awc\r\n  name: %cagy-svc\r\n  namespace: default\r\nspec:\r\n  externalTrafficPolicy: Cluster\r\n  ports:\r\n    - name: %cagy-svc-8069\r\n      port: 8069\r\n      protocol: TCP\r\n      targetPort: 8069\r\n    - name: %cagy-svc-9001\r\n      port: 9001\r\n      protocol: TCP\r\n      targetPort: 9001\r\n  selector:\r\n    app: %cagy\r\n  sessionAffinity: None\r\n  type: LoadBalancer";
    string ing = "apiVersion: extensions/v1beta1\r\nkind: Ingress\r\nmetadata:\r\n  annotations:\r\n    nginx.ingress.kubernetes.io/service-weight: ''\r\n  name: %cagy-ing\r\n  namespace: default\r\nspec:\r\n  rules:\r\n    - host: %domain.yourdomain.com\r\n      http:\r\n        paths:\r\n          - backend:\r\n              serviceName: %cagy-svc\r\n              servicePort: 8069\r\n            path: /\r\n    - host: log.%domain.yourdomain.com\r\n      http:\r\n        paths:\r\n          - backend:\r\n              serviceName: %cagy-svc\r\n              servicePort: 9001\r\n            path: /\r\nstatus:\r\n  loadBalancer:\r\n    ingress:\r\n      - ip: 47.110.119.34";
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnCreate_Click(object sender, EventArgs e)
    {

        txtResult.Text = "";
      
        txtResult.Text += ExeCommand("kubectl apply -f " + txtName.Text + ".yaml");

        txtResult.Text += ExeCommand("kubectl apply -f " + txtName.Text + "-svc.yaml") + "\r\n";
    
        txtResult.Text += ExeCommand("kubectl apply -f " + txtName.Text + "-ing.yaml") + "\r\n";

        txtDepl.Text = depl;
        txtSvc.Text = svc;
        txtIng.Text = ing;
        
    }

    public string ExeCommand(string commandText)
    {
        Process p = new Process();
        p.StartInfo.FileName = "cmd.exe";
        p.StartInfo.UseShellExecute = false;
        p.StartInfo.RedirectStandardInput = true;
        p.StartInfo.RedirectStandardOutput = true;
        p.StartInfo.RedirectStandardError = true;
        p.StartInfo.CreateNoWindow = true;
        string strOutput = null;
        try
        {
            p.Start();
            p.StandardInput.WriteLine(commandText);
            p.StandardInput.WriteLine("exit");
            strOutput = p.StandardOutput.ReadToEnd();
            p.WaitForExit();
            p.Close();
        }
        catch (Exception e)
        {
            strOutput = e.Message;
        }
        return strOutput;
    }


    protected void btnBuild_Click(object sender, EventArgs e)
    {

        if (txtDomain.Text == "") return;
        if (txtName.Text == "") return;
        if (txtDocker.Text == "") return;

        txtDepl.Text = txtDepl.Text.Replace("%cagy", txtName.Text);
        txtSvc.Text = txtSvc.Text.Replace("%cagy", txtName.Text);
        txtIng.Text = txtIng.Text.Replace("%cagy", txtName.Text);

        txtDepl.Text = txtDepl.Text.Replace("%docker", txtDocker.Text);
        //txtSvc.Text = txtSvc.Text.Replace("%cagy", txtName.Text);
        txtIng.Text = txtIng.Text.Replace("%domain", txtDomain.Text);

        StreamWriter wt = new StreamWriter(txtName.Text+".yaml",false);
        wt.Write(txtDepl.Text);
        wt.Close();


        StreamWriter wtsvc = new StreamWriter( txtName.Text + "-svc.yaml", false);
        wtsvc.Write(txtSvc.Text);
        wtsvc.Close();

        StreamWriter wting = new StreamWriter(txtName.Text + "-ing.yaml", false);
        wting.Write(txtIng.Text);
        wting.Close();


    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        //txtResult.Text = ExeCommand(@"cd C:\Users\Administrator\");
        txtResult.Text += ExeCommand("kubectl replace -f " + txtName.Text + ".yaml");
        //txtResult.Text += ExeCommand("exit") + "\r\n";
    }
}
