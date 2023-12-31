<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MainAdmin.Master" AutoEventWireup="true" CodeBehind="VoucherAddForm.aspx.cs" Inherits="ShirtTee.admin.AddVoucherForm" EnableViewState="true" %>

<asp:Content ID="Head1" ContentPlaceHolderID="head" runat="server">
    <script src="../dist/flowbite.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.2.1/datepicker.min.js"></script>
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
                        for="txtVoucherName"
                        class="inline-block text-sm text-gray-800 mt-2.5 dark:text-gray-200">
                        Voucher Name
                    </label>
                </div>

                <div class="col-span-3">
                    <asp:TextBox
                        ID="txtVoucherName"
                        runat="server"
                        placeholder="Enter voucher name"
                        class="cInput">
                    </asp:TextBox>
                </div>

                <%--Voucher Desc--%>

                <div class="col-span-1">
                    <label
                        for="txtVoucherDesc"
                        class="inline-block text-sm text-gray-800 mt-2.5 dark:text-gray-200">
                        Voucher Description
                    </label>
                </div>

                <div class="col-span-3">
                    <asp:TextBox
                        ID="txtVoucherDesc"
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
                        for="txtDiscount"
                        class="inline-block text-sm text-gray-800 mt-2.5 dark:text-gray-200">
                        Discount Rate (%)
                    </label>
                </div>

                <div class="col-span-3">
                    <div class="flex">
                        <asp:TextBox
                            ID="txtDiscount"
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
                        for="txtMinSpend"
                        class="inline-block text-sm text-gray-800 mt-2.5 dark:text-gray-200">
                        Min Spend
                    </label>
                </div>

                <div class="col-span-3">
                    <div class="flex">
                        <asp:TextBox
                            ID="txtMinSpend"
                            runat="server"
                            placeholder="Enter min spend"
                            class="cInput"
                            TextMode="Number">
                        </asp:TextBox>
                    </div>
                </div>

                <%--Cap At--%>

                <div class="col-span-1">
                    <label
                        for="txtCapAt"
                        class="inline-block text-sm text-gray-800 mt-2.5 dark:text-gray-200">
                        Cap At
                    </label>
                </div>

                <div class="col-span-3">
                    <div class="flex">
                        <asp:TextBox
                            ID="txtCapAt"
                            runat="server"
                            placeholder="Enter cap at value"
                            class="cInput"
                            TextMode="Number">
                        </asp:TextBox>
                    </div>
                </div>

                <%--Expired Date--%>
                <div class="col-span-1">
                    <label
                        for="txtDate"
                        class="inline-block text-sm text-gray-800 mt-2.5 dark:text-gray-200">
                        Expired Date
                    </label>
                </div>

                <div class="col-span-3">
                    <div class="flex">
                        <div class="relative max-w-sm">
                            <div class="absolute inset-y-0 start-0 flex items-center ps-3.5 pointer-events-none">
                                <svg class="w-4 h-4 text-gray-500 dark:text-gray-400" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 20 20">
                                    <path d="M20 4a2 2 0 0 0-2-2h-2V1a1 1 0 0 0-2 0v1h-3V1a1 1 0 0 0-2 0v1H6V1a1 1 0 0 0-2 0v1H2a2 2 0 0 0-2 2v2h20V4ZM0 18a2 2 0 0 0 2 2h16a2 2 0 0 0 2-2V8H0v10Zm5-8h10a1 1 0 0 1 0 2H5a1 1 0 0 1 0-2Z" />
                                </svg>
                            </div>
                            <asp:TextBox ID="txtDate" runat="server"
                                datepicker datepicker-format="yyyy-mm-dd"
                                ReadOnly="true"
                                class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full ps-10 p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                                placeholder="Select date" />
                        </div>
                    </div>
                </div>


                <div class="col-start-3">
                    <asp:Button
                        ID="btnSubmit"
                        OnClick="btnSubmit_Click"
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
