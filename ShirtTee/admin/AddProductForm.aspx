<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MainAdmin.Master" AutoEventWireup="true" CodeBehind="AddProductForm.aspx.cs" Inherits="ShirtTee.admin.AddProductForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="rounded-lg bg-white p-8 shadow-lg ">
        <div class="grid grid-cols-4 gap-6">

            <div class="col-span-3">
                <label for="txtName" class="block text-xs font-medium text-gray-700">
                    Name
                </label>

                <asp:TextBox ID="txtName" runat="server"
                    placeholder="Enter your name"
                    class="mt-1 w-full rounded-md border-gray-200 shadow-sm sm:text-sm">
                </asp:TextBox>
            </div>

            <div class="col-span-1">
                <label for="txtEmail" class="block text-xs font-medium text-gray-700">
                    Email
                </label>

                <asp:TextBox ID="txtEmail" runat="server"
                    placeholder="Enter your email"
                    class="mt-1 w-full rounded-md border-gray-200 shadow-sm sm:text-sm">
                </asp:TextBox>
            </div>

        </div>
    </div>
</asp:Content>
