<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MainAdmin.Master" AutoEventWireup="true" CodeBehind="NoticeAddForm.aspx.cs" Inherits="ShirtTee.admin.NoticeAddForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="max-w-4xl mx-auto">
        <div class="bg-white rounded-xl shadow dark:bg-gray-800 p-8">
            <%--Title--%>
            <div class="mb-8">
                <h2 class="text-xl font-bold text-gray-800 dark:text-gray-200">Notice
                </h2>
                <p class="text-sm text-gray-600 dark:text-gray-400">
                    Add new notice to broadcast.
                </p>
            </div>
            <%--End Title--%>

            <div class="grid grid-cols-4 gap-6">

                <%--Notice Title--%>

                <div class="col-span-1">
                    <label for="txtTitle" class="inline-block text-sm text-gray-800 mt-2.5 dark:text-gray-200">
                        Title
                    </label>
                </div>

                <div class="col-span-3">
                    <asp:TextBox ID="txtTitle" runat="server"
                        placeholder="Enter notice title"
                        class="cInput">
                    </asp:TextBox>
                </div>

                <%--Notice Content--%>
                <div class="col-span-1">
                    <label for="txtContent" class="inline-block text-sm text-gray-800 mt-2.5 dark:text-gray-200">
                        Content
                    </label>
                </div>

                <div class="col-span-3">
                    <asp:TextBox ID="txtContent" runat="server"
                        placeholder="Enter notice content"
                        class="cInput" TextMode="MultiLine" Rows="3">
                    </asp:TextBox>
                </div>

                <%-- Visibility --%>
                <div class="col-span-1">
                    <label for="radVisibility" class="inline-block text-sm text-gray-800 mt-2.5 dark:text-gray-200">
                        Visibility
                    </label>
                </div>
                <div class="col-span-3">
                    <asp:RadioButtonList ID="radVisibility" runat="server"  RepeatDirection="Horizontal">
                        <asp:ListItem class="px-4" Value="is_all" Selected="True">  To everyone</asp:ListItem>
                        <asp:ListItem class="px-4" Value="is_staff_only">  To staff only</asp:ListItem>
                    </asp:RadioButtonList>
                </div>

                <div class="col-start-3">
                    <asp:Button ID="btnSubmit" runat="server" Text="Confirm" OnClick="btnSubmit_Click"
                        class="w-full justify-center py-2 px-3 inline-flex items-center gap-x-2 text-sm font-semibold rounded-lg border border-transparent bg-blue-600 text-white hover:bg-blue-700 disabled:opacity-50 disabled:pointer-events-none dark:focus:outline-none dark:focus:ring-1 dark:focus:ring-gray-600"></asp:Button>
                </div>
                <div class="col-span-1">
                    <input type="reset" value="Reset" class="w-full justify-center py-2 px-3 inline-flex items-center gap-x-2 text-sm font-medium rounded-lg border border-gray-200 bg-white text-gray-800 shadow-sm hover:bg-gray-50 disabled:opacity-50 disabled:pointer-events-none dark:bg-slate-900 dark:border-gray-700 dark:text-white dark:hover:bg-gray-800 dark:focus:outline-none dark:focus:ring-1 dark:focus:ring-gray-600" />
                </div>
            </div>

        </div>
    </div>
</asp:Content>
