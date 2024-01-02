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

            if (!roleMgr.RoleExists("staff"))
            {
                IdRoleResult = roleMgr.Create(new IdentityRole { Name = "staff" });
            }

            if (!roleMgr.RoleExists("customer"))
            {
                IdRoleResult = roleMgr.Create(new IdentityRole { Name = "customer" });
            }

            //create admin acc if null
            var userStore = new UserStore<IdentityUser>(identityDbContext);
            var manager = new UserManager<IdentityUser>(userStore);
            var hasAdminAccount = manager.Find("admin@shirttee.com", "admin123");
            if (hasAdminAccount == null)
            {
                var adminAccount = new IdentityUser() { UserName = "admin", Email = "admin@shirttee.com" };
                IdentityResult result = manager.Create(adminAccount, "admin123");
            }

            if (!manager.IsInRole(manager.FindByEmail("admin@shirttee.com").Id, "admin"))
            {
                IdUserResult = manager.AddToRole(manager.FindByEmail("admin@shirttee.com").Id, "admin");
            }

            //create staff
            var hasStaffAccount = manager.Find("staff@shirttee.com", "staff123");
            if (hasStaffAccount == null)
            {
                var adminAccount = new IdentityUser() { UserName = "staff", Email = "staff@shirttee.com" };
                IdentityResult result = manager.Create(adminAccount, "staff123");
            }

            if (!manager.IsInRole(manager.FindByEmail("staff@shirttee.com").Id, "staff"))
            {
                IdUserResult = manager.AddToRole(manager.FindByEmail("staff@shirttee.com").Id, "staff");
            }
        }
    }
}
