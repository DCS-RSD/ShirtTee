<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MainAdmin.Master" AutoEventWireup="true" CodeBehind="ProductAddForm.aspx.cs" Inherits="ShirtTee.admin.AddProductForm" EnableViewState="true" %>

<asp:Content ID="Head1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="max-w-4xl mx-auto">
        <div class="bg-white rounded-xl shadow dark:bg-gray-800 p-8">
            <%--Title--%>
            <div class="mb-8">
                <h2 class="text-xl font-bold text-gray-800 dark:text-gray-200">Product
                </h2>
                <p class="text-red-500 text-sm text-gray-600 dark:text-gray-400">
                    * Indicates required field.
                </p>
            </div>
            <%--End Title--%>

            <div class="grid grid-cols-4 gap-6">

                <%--Product Name--%>

                <div class="col-span-1">
                    <label for="txtProdName" class="inline-block text-sm text-gray-800 mt-2.5 dark:text-gray-200">
                        Name <span class="text-red-500">*</span>
                    </label>
                </div>

                <div class="col-span-3">
                    <asp:TextBox ID="txtProdName" runat="server"
                        placeholder="Enter product name"
                        class="cInput">
                    </asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvProdName" class="text-sm italic"
                        runat="server" ControlToValidate="txtProdName"
                        ErrorMessage="Please enter a product name."
                        Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>

                <%--Product Group--%>
                <div class="col-span-1">
                    <label for="radProdGroup" class="inline-block text-sm text-gray-800 mt-2.5 dark:text-gray-200">
                        Group <span class="text-red-500">*</span>
                    </label>
                </div>
                <div class="col-span-3">
                    <asp:RadioButtonList ID="radProdGroup" runat="server" AutoPostBack="True" RepeatDirection="Horizontal" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged">
                        <asp:ListItem class="px-4" Value="men">  Men</asp:ListItem>
                        <asp:ListItem class="px-4" Value="women">  Women</asp:ListItem>
                        <asp:ListItem class="px-4" Value="kids">  Kids</asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="rfvProdGroup" class="text-sm italic"
                        runat="server" ControlToValidate="radProdGroup"
                        ErrorMessage="Please select a product group."
                        Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" class="text-sm italic"
                        ControlToValidate="radProdGroup"
                        ValidationExpression="^(men|women|kids)$"
                        ErrorMessage='Please enter "Men", "Women" or "Kids" only.'
                        Display="Dynamic"
                        ForeColor="Red"
                        runat="server">
                    </asp:RegularExpressionValidator>
                </div>

                <%--Product Category--%>

                <div class="col-span-1">
                    <label for="ddlProdCategory" class="inline-block text-sm text-gray-800 mt-2.5 dark:text-gray-200">
                        Category <span class="text-red-500">*</span>
                    </label>
                </div>

                <div class="col-span-3">
                    <asp:DropDownList ID="ddlProdCategory" CssClass="cInput" runat="server" DataSourceID="SqlDataSource1" DataTextField="category_name" DataValueField="category_ID" Enabled="False">
                        <asp:ListItem>Select Product Category</asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Category] WHERE ([category_group] = @category_group)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="radProdGroup" Name="category_group" PropertyName="SelectedValue" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:RequiredFieldValidator ID="rfvProdCategory" class="text-sm italic"
                        runat="server" ControlToValidate="ddlProdCategory"
                        ErrorMessage="Please select a product category."
                        Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>

                <%--Product Price--%>

                <div class="col-span-1">
                    <label for="txtPrice" class="inline-block text-sm text-gray-800 mt-2.5 dark:text-gray-200">
                        Price <span class="text-red-500">*</span>
                    </label>
                </div>

                <div class="col-span-3">
                    <div class="flex">
                        <asp:TextBox ID="txtPrice" runat="server"
                            placeholder="Enter product price (e.g: 100.50)"
                            class="cInput">
                        </asp:TextBox>
                    </div>
                    <asp:RequiredFieldValidator ID="rfvProdPrice" class="text-sm italic"
                        runat="server" ControlToValidate="txtPrice"
                        ErrorMessage="Please enter a product price."
                        Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>

                    <asp:CompareValidator runat="server" ID="cValidator" ControlToValidate="txtPrice"
                        class="text-sm italic" ForeColor="Red"
                        Type="Currency" Operator="DataTypeCheck" EnableClientScript="true"
                        ErrorMessage="Please enter a valid currency amount. (Example: 12.30)" Display="Dynamic" />
                </div>

                <%--Product Desc--%>

                <div class="col-span-1">
                    <label for="txtProdDescription" class="inline-block text-sm text-gray-800 mt-2.5 dark:text-gray-200">
                        Description <span class="text-red-500">*</span>
                    </label>
                </div>

                <div class="col-span-3">
                    <asp:TextBox ID="txtProdDesc" runat="server"
                        placeholder="Enter product description"
                        class="cInput" TextMode="MultiLine" Rows="3">
                    </asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvProdDesc" class="text-sm italic"
                        runat="server" ControlToValidate="txtProdDesc"
                        ErrorMessage="Please enter a product description."
                        Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>

                <%--Product Image--%>

                <div class="col-span-1">
                    <label for="txtProdDescription" class="inline-block text-sm text-gray-800 mt-2.5 dark:text-gray-200">
                        Thumbnail
                    </label>
                </div>


                <div class="col-span-3">
                    <asp:Image class="my-2" ID="Image1" runat="server" ClientIDMode="Static" />
                    <asp:FileUpload class="block w-full text-sm text-gray-900 border border-gray-300 rounded-lg cursor-pointer bg-gray-50 dark:text-gray-400 focus:outline-none dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400"
                        onchange="loadFile(event)"
                        ID="fileThumbnail" runat="server" />
                    <asp:RegularExpressionValidator ID="revFileThumbnail" class="text-sm italic"
                        runat="server" ControlToValidate="fileThumbnail"
                        ErrorMessage="Please choose a valid image file (JPG, JPEG, or PNG)."
                        Display="Dynamic" ForeColor="Red"
                        ValidationExpression="^.*\.(jpg|jpeg|png|JPG|JPEG|PNG)$"></asp:RegularExpressionValidator>
                </div>



                <div class="col-start-3">
                    <asp:Button ID="btnSubmit" runat="server" Text="Confirm" class="w-full justify-center py-2 px-3 inline-flex items-center gap-x-2 text-sm font-semibold rounded-lg border border-transparent bg-blue-600 text-white hover:bg-blue-700 disabled:opacity-50 disabled:pointer-events-none dark:focus:outline-none dark:focus:ring-1 dark:focus:ring-gray-600" OnClick="btnSubmit_Click"></asp:Button>
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
            output.classList.add("w-24");
            output.classList.add("h-24");


        };
    </script>

</asp:Content>
