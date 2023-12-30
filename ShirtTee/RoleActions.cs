using System;
using System.Configuration;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;

namespace WingtipToys.Logic
{
    internal class RoleActions
    {
        internal void AddUserAndRole()
        {
            // Access the application context and create result variables.
            var identityDbContext = new IdentityDbContext("ConnectionString");
            IdentityResult IdRoleResult;
            IdentityResult IdUserResult;

            // Create a RoleStore object by using the ApplicationDbContext object.
            var roleStore = new RoleStore<IdentityRole>(identityDbContext);

            // Create a RoleManager object that is only allowed to contain IdentityRole objects.
            var roleMgr = new RoleManager<IdentityRole>(roleStore);

            //create roles
            if (!roleMgr.RoleExists("admin"))
            {
                IdRoleResult = roleMgr.Create(new IdentityRole { Name = "admin" });
            }

            if (!roleMgr.RoleExists("customer"))
            {
                IdRoleResult = roleMgr.Create(new IdentityRole { Name = "customer" });
            }

            //create admin acc if null
            var userStore = new UserStore<IdentityUser>(identityDbContext);
            var manager = new UserManager<IdentityUser>(userStore);
            var hasAdminAccounr = manager.Find("admin@shirttee.com", "admin123");
            if (hasAdminAccounr == null)
            {
                var adminAccount = new IdentityUser() { UserName = "admin", Email = "admin@shirttee.com" };
                IdentityResult result = manager.Create(adminAccount, "admin123");
            }

            if (!manager.IsInRole(manager.FindByEmail("admin@shirttee.com").Id, "admin"))
            {
                IdUserResult = manager.AddToRole(manager.FindByEmail("admin@shirttee.com").Id, "admin");
            }
        }
    }
}
