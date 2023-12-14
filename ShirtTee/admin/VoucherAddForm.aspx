<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MainAdmin.Master" AutoEventWireup="true" CodeBehind="VoucherAddForm.aspx.cs" Inherits="ShirtTee.admin.AddVoucherForm" EnableViewState="true" %>

<asp:Content ID="Head1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content
    ID="Content1"
    ContentPlaceHolderID="ContentPlaceHolder1"
    runat="server">
    <div class="max-w-4xl mx-auto">
        <div class="bg-white rounded-xl shadow dark:bg-gray-800 p-8">
            <%--Title--%>
            <div class="mb-8">
                <h2 class="text-xl font-bold text-gray-800 dark:text-gray-200">Voucher
                </h2>
                <p class="text-sm text-gray-600 dark:text-gray-400">
                    Add new voucher.
                </p>
            </div>
            <%--End Title--%>

            <div class="grid grid-cols-4 gap-6">
                <%--Voucher Name--%>

                <div class="col-span-1">
                    <label
                        for="txtProdName"
                        class="inline-block text-sm text-gray-800 mt-2.5 dark:text-gray-200">
                        Voucher Name
                    </label>
                </div>

                <div class="col-span-3">
                    <asp:TextBox
                        ID="txtProdName"
                        runat="server"
                        placeholder="Enter voucher name"
                        class="cInput">
                    </asp:TextBox>
                </div>

                <%--Voucher Desc--%>

                <div class="col-span-1">
                    <label
                        for="txtProdDescription"
                        class="inline-block text-sm text-gray-800 mt-2.5 dark:text-gray-200">
                        Voucher Description
                    </label>
                </div>

                <div class="col-span-3">
                    <asp:TextBox
                        ID="txtProdDesc"
                        runat="server"
                        placeholder="Enter voucher description"
                        class="cInput"
                        TextMode="MultiLine"
                        Rows="3">
                    </asp:TextBox>
                </div>

                <%--Discount Rate--%>

                <div class="col-span-1">
                    <label
                        for="txtPrice"
                        class="inline-block text-sm text-gray-800 mt-2.5 dark:text-gray-200">
                        Discount Rate
                    </label>
                </div>

                <div class="col-span-3">
                    <div class="flex">
                        <asp:TextBox
                            ID="txtPrice"
                            runat="server"
                            placeholder="Enter discount rate"
                            class="cInput"
                            TextMode="Number">
                        </asp:TextBox>
                    </div>
                </div>

                <%--MIN SPEND--%>

                <div class="col-span-1">
                    <label
                        for="txtPrice"
                        class="inline-block text-sm text-gray-800 mt-2.5 dark:text-gray-200">
                        Min Spend
                    </label>
                </div>

                <div class="col-span-3">
                    <div class="flex">
                        <asp:TextBox
                            ID="TextBox1"
                            runat="server"
                            placeholder="Enter discount rate"
                            class="cInput"
                            TextMode="Number">
                        </asp:TextBox>
                    </div>
                </div>

                <%--Cap At--%>

                <div class="col-span-1">
                    <label
                        for="txtPrice"
                        class="inline-block text-sm text-gray-800 mt-2.5 dark:text-gray-200">
                        Cap At
                    </label>
                </div>

                <div class="col-span-3">
                    <div class="flex">
                        <asp:TextBox
                            ID="TextBox2"
                            runat="server"
                            placeholder="Enter discount rate"
                            class="cInput"
                            TextMode="Number">
                        </asp:TextBox>
                    </div>
                </div>


                <div class="col-start-3">
                    <asp:Button
                        ID="btnSubmit"
                        runat="server"
                        Text="Confirm"
                        class="w-full justify-center py-2 px-3 inline-flex items-center gap-x-2 text-sm font-semibold rounded-lg border border-transparent bg-blue-600 text-white hover:bg-blue-700 disabled:opacity-50 disabled:pointer-events-none dark:focus:outline-none dark:focus:ring-1 dark:focus:ring-gray-600"></asp:Button>
                </div>
                <div class="col-span-1">
                    <input
                        type="reset"
                        value="Reset"
                        class="w-full justify-center py-2 px-3 inline-flex items-center gap-x-2 text-sm font-medium rounded-lg border border-gray-200 bg-white text-gray-800 shadow-sm hover:bg-gray-50 disabled:opacity-50 disabled:pointer-events-none dark:bg-slate-900 dark:border-gray-700 dark:text-white dark:hover:bg-gray-800 dark:focus:outline-none dark:focus:ring-1 dark:focus:ring-gray-600" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
