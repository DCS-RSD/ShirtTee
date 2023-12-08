<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MainAdmin.Master" AutoEventWireup="true" CodeBehind="ProductAddForm.aspx.cs" Inherits="ShirtTee.admin.AddProductForm" EnableViewState="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="max-w-4xl mx-auto">
        <div class="bg-white rounded-xl shadow dark:bg-gray-800 p-8">
            <%--Title--%>
            <div class="mb-8">
                <h2 class="text-xl font-bold text-gray-800 dark:text-gray-200">Product
                </h2>
                <p class="text-sm text-gray-600 dark:text-gray-400">
                    Add new product to sales.
                </p>
            </div>
            <%--End Title--%>

            <div class="grid grid-cols-4 gap-6">

                <%--Product Name--%>

                <div class="col-span-1">
                    <label for="txtProdName" class="inline-block text-sm text-gray-800 mt-2.5 dark:text-gray-200">
                        Product Name
                    </label>
                </div>

                <div class="col-span-3">
                    <asp:TextBox ID="txtProdName" runat="server"
                        placeholder="Enter product name"
                        class="cInput">
                    </asp:TextBox>
                </div>

                <%--Product Group--%>
                <div class="col-span-1">
                    <label for="radProdGroup" class="inline-block text-sm text-gray-800 mt-2.5 dark:text-gray-200">
                        Product Group
                    </label>
                </div>
                <div class="col-span-3">
                    <asp:RadioButtonList ID="radProdGroup" runat="server" AutoPostBack="True" RepeatDirection="Horizontal" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged">
                        <asp:ListItem class="px-4" Value="men">  Men</asp:ListItem>
                        <asp:ListItem class="px-4" Value="women">  Women</asp:ListItem>
                        <asp:ListItem class="px-4" Value="kid">  Kid</asp:ListItem>
                    </asp:RadioButtonList>
                </div>

                <%--Product Category--%>

                <div class="col-span-1">
                    <label for="ddlProdCategory" class="inline-block text-sm text-gray-800 mt-2.5 dark:text-gray-200">
                        Product Category
                    </label>
                </div>

                <div class="col-span-3">
                    <asp:DropDownList ID="ddlProdCategory" CssClass="cInput" runat="server" DataSourceID="SqlDataSource1" DataTextField="category_name" DataValueField="category_name" Enabled="False">
                        <asp:ListItem>Select Product Category</asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [category_name] FROM [Category] WHERE ([category_group] = @category_group)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="radProdGroup" Name="category_group" PropertyName="SelectedValue" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>

                <%--Product Price--%>

                <div class="col-span-1">
                    <label for="txtPrice" class="inline-block text-sm text-gray-800 mt-2.5 dark:text-gray-200">
                        Product Price
                    </label>
                </div>

                <div class="col-span-3">
                    <div class="flex">
                        <asp:TextBox ID="txtPrice" runat="server"
                            placeholder="Enter product price"
                            class="cInput" TextMode="Number">
                        </asp:TextBox>
                    </div>

                </div>

                <%--Product Desc--%>

                <div class="col-span-1">
                    <label for="txtProdDescription" class="inline-block text-sm text-gray-800 mt-2.5 dark:text-gray-200">
                        Product Description
                    </label>
                </div>

                <div class="col-span-3">
                    <asp:TextBox ID="txtProdDesc" runat="server"
                        placeholder="Enter product description"
                        class="cInput" TextMode="MultiLine" Rows="3">
                    </asp:TextBox>
                </div>

                <%--Product Image--%>

                <div class="col-span-1">
                    <label for="txtProdDescription" class="inline-block text-sm text-gray-800 mt-2.5 dark:text-gray-200">
                        Product Image
                    </label>
                </div>

                <div class="col-span-3">
                    <asp:Image class="my-2" ID="Image1" runat="server" ClientIDMode="Static" />
                    <asp:FileUpload class="block w-full text-sm text-gray-900 border border-gray-300 rounded-lg cursor-pointer bg-gray-50 dark:text-gray-400 focus:outline-none dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400" onchange="loadFile(event)"
                        ID="fileImage1" runat="server" />

                    <asp:Panel ID="Panel1" runat="server"></asp:Panel>
                    <asp:Label ID="test" runat="server"></asp:Label>
                    <p class="mt-3">

                        <svg class="flex-shrink-0 w-4 h-4" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <circle cx="12" cy="12" r="10" />
                            <path d="M8 12h8" />
                            <path d="M12 8v8" />
                        </svg>
                        <asp:Button runat="server" Text="Add More Image"
                            ID="btnAddImageInput"
                            class="inline-flex items-center gap-x-1 px-4 text-sm text-blue-600 decoration-2 hover:underline font-medium dark:focus:outline-none dark:focus:ring-1 dark:focus:ring-gray-600" 
                            OnClick="btnAddImageInput_Click" UseSubmitBehavior="False" OnClientClick="return false">
                        </asp:Button>
                    </p>
                </div>



                <div class="col-start-3">
                    <asp:Button ID="btnSubmit" runat="server" Text="Confirm" class="w-full justify-center py-2 px-3 inline-flex items-center gap-x-2 text-sm font-semibold rounded-lg border border-transparent bg-blue-600 text-white hover:bg-blue-700 disabled:opacity-50 disabled:pointer-events-none dark:focus:outline-none dark:focus:ring-1 dark:focus:ring-gray-600"></asp:Button>
                </div>
                <div class="col-span-1">
                    <input type="reset" value="Reset" class="w-full justify-center py-2 px-3 inline-flex items-center gap-x-2 text-sm font-medium rounded-lg border border-gray-200 bg-white text-gray-800 shadow-sm hover:bg-gray-50 disabled:opacity-50 disabled:pointer-events-none dark:bg-slate-900 dark:border-gray-700 dark:text-white dark:hover:bg-gray-800 dark:focus:outline-none dark:focus:ring-1 dark:focus:ring-gray-600" />
                </div>
            </div>

        </div>
    </div>

    <script>
        var loadFile = function (event) {

            var input = event.target;
            var file = input.files[0];
            var type = file.type;

            var output = document.getElementById('Image1');


            output.src = URL.createObjectURL(event.target.files[0]);
            output.onload = function () {
                URL.revokeObjectURL(output.src) // free memory
            }
        };
    </script>

</asp:Content>
