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
                    Add new voucher to products.
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

                <%--Voucher Image--%>

                <div class="col-span-1">
                    <label
                        for="txtProdDescription"
                        class="inline-block text-sm text-gray-800 mt-2.5 dark:text-gray-200">
                        Voucher Image
                    </label>
                </div>

                <div class="col-span-3">
                    <asp:Image
                        class="my-2"
                        ID="Image1"
                        runat="server"
                        ClientIDMode="Static" />
                    <asp:FileUpload
                        class="block w-full text-sm text-gray-900 border border-gray-300 rounded-lg cursor-pointer bg-gray-50 dark:text-gray-400 focus:outline-none dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400"
                        onchange="loadFile(event)"
                        ID="fileImage1"
                        runat="server"
                        AllowMultiple="true" />

                    <%--<asp:Panel ID="Panel1" runat="server"></asp:Panel>--%> <%--
          <p class="mt-3">
            <asp:Button
              runat="server"
              Text="+ Add More Image"
              ID="btnAddImageInput"
              class="inline-flex items-center gap-x-1 text-sm text-blue-600 decoration-2 cursor-pointer font-medium dark:focus:outline-none dark:focus:ring-1 dark:focus:ring-gray-600"
              OnClick="btnAddImageInput_Click"
            >
            </asp:Button>
          </p>
                    --%>
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

    <script>
        var loadFile = function (event) {
            var input = event.target;
            var file = input.files[0];
            var type = file.type;
            var output = document.getElementById("Image1");

            output.src = URL.createObjectURL(event.target.files[0]);

            output.onload = function () {
                URL.revokeObjectURL(output.src); // free memory
            };
            output.classList.add("w-24");
            output.classList.add("h-24");
        };
    </script>
</asp:Content>
