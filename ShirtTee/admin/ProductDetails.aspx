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
                    <asp:HyperLink ID="hypToStock" runat="server"
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
                        <asp:RequiredFieldValidator ID="rfvProdName" class="text-sm italic"
                            runat="server" ControlToValidate="txtProdName"
                            ErrorMessage="*Please enter product name."
                            Display="Dynamic" ForeColor="Red">
                        </asp:RequiredFieldValidator>
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
                            <asp:ListItem class="px-4" Value="kids">  Kids</asp:ListItem>
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
                        <button type="button"
                            class="w-full justify-center py-2 px-3 inline-flex items-center gap-x-2 text-sm font-semibold rounded-lg border border-transparent bg-red-600 text-white hover:bg-red-700 disabled:opacity-50 hover:cursor-pointer dark:focus:outline-none dark:focus:ring-1 dark:focus:ring-gray-600"
                            data-hs-overlay="#hs-modal-delete">
                            Delete
                        </button>
                    </div>
                </div>
            </asp:Panel>


        </div>
    </div>

    <%-- Delete Modal Box --%>
    <div id="hs-modal-delete" class="hs-overlay hidden w-full h-full fixed top-0 start-0 z-[100] overflow-x-hidden overflow-y-auto">
        <div class="hs-overlay-open:mt-7 hs-overlay-open:opacity-100 hs-overlay-open:duration-500 mt-0 opacity-0 ease-out transition-all sm:max-w-lg sm:w-full m-3 sm:mx-auto">
            <div class="bg-white border border-gray-200 rounded-xl shadow-sm dark:bg-gray-800 dark:border-gray-700 ">
                <div class="p-4 sm:p-7">
                    <div class="p-4 text-center overflow-y-auto">
                        <!-- Icon -->
                        <span class="mb-4 inline-flex justify-center items-center w-[62px] h-[62px] rounded-full border-4 border-yellow-50 bg-yellow-100 text-yellow-500 dark:bg-yellow-700 dark:border-yellow-600 dark:text-yellow-100">
                            <svg class="flex-shrink-0 w-5 h-5" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" viewBox="0 0 16 16">
                                <path d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z" />
                            </svg>
                        </span>
                        <!-- End Icon -->
                        <h3 class="mb-2 text-2xl font-bold text-gray-800 dark:text-gray-200">Delete Product
                        </h3>
                        <p class="text-gray-500">
                            Are you sure to delete this product?
                        </p>
                    </div>

                    <%-- Form --%>
                    <div class="mt-5">
                        <div class="grid gap-y-4">
                            <div class="flex justify-end items-center gap-x-2 py-3 px-2">
                                <asp:Button runat="server"
                                    Text="Delete Product"
                                    ID="btnDelete"
                                    OnClick="btnDelete_Click"
                                    class="py-2 px-3 inline-flex items-center gap-x-2 text-sm font-semibold rounded-lg border border-transparent bg-red-600 text-white hover:bg-red-700 disabled:opacity-50 disabled:pointer-events-none dark:focus:outline-none dark:focus:ring-1 dark:focus:ring-gray-600"></asp:Button>
                                <button type="button" class="py-2 px-3 inline-flex items-center gap-x-2 text-sm font-medium rounded-lg border border-gray-200 bg-white text-gray-800 shadow-sm hover:bg-gray-50 disabled:opacity-50 disabled:pointer-events-none dark:bg-slate-900 dark:border-gray-700 dark:text-white dark:hover:bg-gray-800 dark:focus:outline-none dark:focus:ring-1 dark:focus:ring-gray-600"
                                    data-hs-overlay="#hs-modal-delete">
                                    Close
                                </button>
                            </div>
                        </div>
                    </div>
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
