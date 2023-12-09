<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MainAdmin.Master" AutoEventWireup="true" CodeBehind="OrderDetails.aspx.cs" Inherits="ShirtTee.admin.OrderDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="max-w-4xl mx-auto">
        <div class="bg-white rounded-xl shadow dark:bg-gray-800 p-8">
            <%--Title--%>
            <div class="mb-8">
                <h2 class="text-xl font-bold text-gray-800 dark:text-gray-200">
                    <asp:Label ID="lblTitle" runat="server"></asp:Label>
                </h2>
                <p class="text-sm text-gray-600 dark:text-gray-400">
                    <asp:Label ID="lblSubTitle" runat="server"></asp:Label>
                </p>
            </div>
        </div>
    </div>
</asp:Content>
