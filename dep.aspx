<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="dep.aspx.cs" Inherits="dep" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">

    <div class="jumbotron">
        <h1>KUBE-CAGY</h1>
        <p class="lead">K8S快速部署页面！</p>
         <p class="lead">
            域名地址:<asp:TextBox ID="txtDomain" runat="server" Width="153px" ></asp:TextBox>.app.funenc.com（只写前缀）</p>
        <p class="lead">
            应用名称:<asp:TextBox ID="txtName" runat="server" Width="154px" ></asp:TextBox>
            只能用英文小写xxx-xxx,表写错了哈</p>
        <p class="lead">
            镜像地址:<asp:TextBox ID="txtDocker" runat="server" Width="871px" ></asp:TextBox>
            docker镜像地址</p>
            <asp:Button ID="btnBuild" class="btn btn-primary btn-lg" runat="server" OnClick="btnBuild_Click" Text="构建YAML文件" Width="152px" />----->
            <asp:Button ID="btnCreate" class="btn btn-primary btn-lg" runat="server" OnClick="btnCreate_Click" Text="一键部署Odoo" Width="185px" />
        <br />
        (构建的YAML可以在下面文本中自行修改.比如端口号调整，路径调整等，修改完成后再点击一次构建YAML文件,然后再点击一键部署)<br />
                    <asp:Button ID="btnUpdate" class="btn btn-primary btn-lg" runat="server" OnClick="btnUpdate_Click" Text="更新部署" Width="185px" BackColor="#FF0066" />
        (更新部署需要输入应用名称和镜像地址,点击构建YAML文件，请把镜像地址后面的:latest去掉，第二次更新再把:latest加上,常年如此反复,首次部署后，如果你想要立即更新，请关闭页面重新打开再做更新操作)<br />

        <asp:TextBox ID="txtResult" runat="server" TextMode="MultiLine" Height="232px" Width="649px"></asp:TextBox>
        <table style="width: 100%;height:900px">
            <tr>
                <td><asp:TextBox ID="txtDepl" runat="server" Height="898px" Width="100%" TextMode="MultiLine">apiVersion: apps/v1
kind: Deployment
metadata:
  labels:
    app: %cagy
  name: %cagy
spec:
  replicas: 1
  revisionHistoryLimit: 10
  selector:
    matchLabels:
      app: %cagy
  template:
    metadata:
      labels:
        app: %cagy
    spec:
      containers:
        - env:
            - name: LANG
              value: C.UTF-8
          image: &#39;%docker&#39;
          imagePullPolicy: Always
          name: %cagy
          resources:
            requests:
              cpu: 50m
              memory: 100Mi
          volumeMounts:
            - mountPath: /var/log/supervisor
              name: vm-%cagy-supervisor
            - mountPath: /var/lib/odoo
              name: vm-%cagy-odoo
      dnsPolicy: ClusterFirst
      restartPolicy: Always
      schedulerName: default-scheduler
      securityContext: {}
      volumes:
        - hostPath:
            path: /tmp/%cagy
            type: &#39;&#39;
          name: vm-%cagy-supervisor
        - hostPath:
            path: /tmp/%cagy
            type: &#39;&#39;
          name: vm-%cagy-odoo</asp:TextBox></td>
                <td><asp:TextBox ID="txtSvc" runat="server" Height="898px" Width="100%" TextMode="MultiLine">apiVersion: v1
kind: Service
metadata:
  annotations:
    service.beta.kubernetes.io/alicloud-loadbalancer-address-type: intranet
    service.beta.kubernetes.io/alicloud-loadbalancer-id: lb-bp1fgv4f4ayv01dbj9awc
  name: %cagy-svc
  namespace: default
spec:
  externalTrafficPolicy: Cluster
  ports:
    - name: %cagy-svc-8069
      port: 8069
      protocol: TCP
      targetPort: 8069
    - name: %cagy-svc-9001
      port: 9001
      protocol: TCP
      targetPort: 9001
  selector:
    app: %cagy
  sessionAffinity: None
  type: LoadBalancer</asp:TextBox></td>
                <td><asp:TextBox ID="txtIng" runat="server" Height="898px" Width="100%" TextMode="MultiLine">apiVersion: extensions/v1beta1
kind: Ingress
metadata:
  annotations:
    nginx.ingress.kubernetes.io/service-weight: &#39;&#39;
  name: %cagy-ing
  namespace: default
spec:
  rules:
    - host: %domain.app.funenc.com
      http:
        paths:
          - backend:
              serviceName: %cagy-svc
              servicePort: 8069
            path: /
    - host: log.%domain.app.funenc.com
      http:
        paths:
          - backend:
              serviceName: %cagy-svc
              servicePort: 9001
            path: /
status:
  loadBalancer:
    ingress:
      - ip: 47.110.119.34</asp:TextBox></td>
            </tr>
          
        </table>
    </div>

</asp:Content>


