<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MainAdmin.Master" AutoEventWireup="true" CodeBehind="ProductDetails.aspx.cs" Inherits="ShirtTee.admin.ProductDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%-- Toast --%>
    <script>
        function showSuccessToast() {
            var status = '<%= Session["ProductUpdated"] %>'; // Enclose the session variable in quotes
            console.log(status)
            if (status !== null && status !== undefined) {
                if (status == "success") {
                    toastr["success"]("Product updated successfully.");
                } else {
                    toastr["error"]("Something went wrong.");
                }
            }
            <% Session.Remove("ProductUpdated"); %>
        }
    </script>
    <div class="max-w-4xl mx-auto">
        <div class="bg-white rounded-xl shadow dark:bg-gray-800 p-8">

            <asp:Label runat="server" ID="lblError" Visible="false"></asp:Label>
            <asp:Panel ID="Panel1" runat="server">
                <%--Title--%>
                <div class="mb-8">
                    <h2 class="text-xl font-bold text-gray-800 dark:text-gray-200">
                        <asp:Label ID="lblTitle" runat="server"></asp:Label>
                    </h2>
                    <p class="text-sm text-gray-600 dark:text-gray-400">
                        <asp:Label ID="lblSubTitle" runat="server"></asp:Label>
                    </p>
                    <asp:HyperLink ID="hypToStock" runat="server" Target="_blank"
                        class="text-sm font-medium text-indigo-600 hover:text-indigo-500 hover:cursor-pointer hover:underline">
                        View Stock<span> &rarr;</span>
                    </asp:HyperLink>
                </div>
                <%--End Title--%>

                <div class="grid grid-cols-4 gap-6">

                    <%--Product Name--%>

                    <div class="col-span-1">
                        <label for="txtProdName" class="inline-block text-sm text-gray-800 mt-2.5 dark:text-gray-200">
                            Name
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
                            Group
                        </label>
                    </div>
                    <div class="col-span-3">
                        <asp:RadioButtonList ID="radProdGroup" runat="server" AutoPostBack="True" RepeatDirection="Horizontal">
                            <asp:ListItem class="px-4" Value="men">  Men</asp:ListItem>
                            <asp:ListItem class="px-4" Value="women">  Women</asp:ListItem>
                            <asp:ListItem class="px-4" Value="kid">  Kid</asp:ListItem>
                        </asp:RadioButtonList>
                    </div>

                    <%--Product Category--%>

                    <div class="col-span-1">
                        <label for="ddlProdCategory" class="inline-block text-sm text-gray-800 mt-2.5 dark:text-gray-200">
                            Category
                        </label>
                    </div>

                    <div class="col-span-3">
                        <asp:DropDownList ID="ddlProdCategory" CssClass="cInput" runat="server" DataSourceID="SqlDataSource1" DataTextField="category_name" DataValueField="category_ID">
                            <asp:ListItem>Select Product Category</asp:ListItem>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [category_ID], [category_name] FROM [Category] WHERE ([category_group] = @category_group)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="radProdGroup" Name="category_group" PropertyName="SelectedValue" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>

                    <%--Product Price--%>

                    <div class="col-span-1">
                        <label for="txtPrice" class="inline-block text-sm text-gray-800 mt-2.5 dark:text-gray-200">
                            Price
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
                            Description
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
                            Image
                        </label>
                    </div>


                    <div class="col-span-3">
                        <asp:Image class="my-2 h-24 w-24" ID="Image1" runat="server" ClientIDMode="Static" />
                        <asp:FileUpload class="block w-full text-sm text-gray-900 border border-gray-300 rounded-lg cursor-pointer bg-gray-50 dark:text-gray-400 focus:outline-none dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400"
                            onchange="loadFile(event)"
                            ID="fileThumbnail" runat="server" AllowMultiple="true" />
                    </div>

                    <%--Button--%>
                    <div class="col-span-4 sm:col-span-1 sm:col-start-3">
                        <asp:Button ID="btnSubmit" runat="server" Text="Save Changes" class="w-full justify-center py-2 px-3 inline-flex items-center gap-x-2 text-sm font-semibold rounded-lg border border-transparent bg-blue-600 text-white hover:bg-blue-700 disabled:opacity-50  hover:cursor-pointer dark:focus:outline-none dark:focus:ring-1 dark:focus:ring-gray-600" 
                            OnClick="btnSubmit_Click"></asp:Button>
                    </div>
                    <div class="col-span-4 sm:col-span-1">
                        <asp:Button ID="btnDelete" runat="server" Text="Delete" class="w-full justify-center py-2 px-3 inline-flex items-center gap-x-2 text-sm font-semibold rounded-lg border border-transparent bg-red-600 text-white hover:bg-red-700 disabled:opacity-50 hover:cursor-pointer dark:focus:outline-none dark:focus:ring-1 dark:focus:ring-gray-600" 
                            OnClick="btnDelete_Click"></asp:Button>
                    </div>
                </div>
            </asp:Panel>


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
