using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(update_k8s.Startup))]
namespace update_k8s
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
