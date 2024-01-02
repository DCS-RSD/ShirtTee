<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="ShirtTee.Products" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="bg-white">

        <div class="mx-auto max-w-2xl px-4 pb-10 sm:px-6 sm:pb-10 lg:max-w-7xl lg:px-8">
            <!-- Search -->
            <div class="sm:col-span-1 mb-4">
                <label for="txtSearch" class="sr-only">Search</label>
                <div class="relative">
                    <asp:TextBox runat="server" placeholder="Search product name" ID="txtSearch"
                        AutoPostBack="true" OnTextChanged="txtSearch_TextChanged"
                        class="py-2 px-3 ps-11 block w-full border-gray-200 rounded-lg text-sm focus:border-blue-500 focus:ring-blue-500 disabled:opacity-50 disabled:pointer-events-none dark:bg-slate-900 dark:border-gray-700 dark:text-gray-400 dark:focus:ring-gray-600">
                    </asp:TextBox>
                    <div class="absolute inset-y-0 start-0 flex items-center pointer-events-none ps-4">
                        <svg class="h-4 w-4 text-gray-400" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" viewBox="0 0 16 16">
                            <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z" />
                        </svg>
                    </div>
                </div>
            </div>
            <!-- End Search -->

            <asp:Label runat="server" class="text-2xl font-bold tracking-tight text-gray-900" ID="lblProduct" Text=""></asp:Label>

            <div class="mt-6 grid grid-cols-2 gap-x-6 gap-y-10 sm:grid-cols-2 lg:grid-cols-4 xl:gap-x-8">

                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT * FROM [Product] AS p
INNER JOIN [Category] AS c ON
c.category_ID = p.category_ID
WHERE category_group = @category AND
deleted_at IS NULL">
                    <SelectParameters>
                        <asp:QueryStringParameter QueryStringField="category" Name="category"></asp:QueryStringParameter>
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                    <ItemTemplate>
                        <div onclick='<%# Eval("product_id", "window.location.href = \"ProductDetails.aspx?product_ID={0}\";") %>' class="group relative">
                            <div class="aspect-h-1 aspect-w-1 w-full overflow-hidden rounded-md bg-gray-200 lg:aspect-none group-hover:opacity-75 lg:h-80">
                                <asp:Image ID="imageProduct" runat="server"
                                    ImageUrl='<%# "data:Image/png;base64," + Convert.ToBase64String((byte[])Eval("thumbnail")) %>'
                                    AlternateText='<%# Eval("product_name") %>'
                                    class="h-full w-full object-cover object-center lg:h-full lg:w-full" />
                            </div>
                            <div class="mt-4 flex justify-between">
                                <div>
                                    <h3 class="text-sm text-gray-700">
                                        <a href="#">
                                            <span aria-hidden="true" class="absolute inset-0"></span>
                                            <%# Eval("product_name") %>
                                        </a>
                                    </h3>

                                </div>
                                <p class="text-sm font-medium text-gray-900">
                                    RM<%# Eval("price") %>
                                </ph>
                            </div>
                        </div>

                    </ItemTemplate>

                </asp:Repeater>

                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT * FROM [Product] AS p
INNER JOIN [Category] AS c ON
c.category_ID = p.category_ID
WHERE category_group = @category AND
category_name = @subcategory AND
deleted_at IS NULL">
                    <SelectParameters>
                        <asp:QueryStringParameter QueryStringField="category" Name="category"></asp:QueryStringParameter>
                        <asp:QueryStringParameter QueryStringField="sub" Name="subcategory"></asp:QueryStringParameter>
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource2">
                    <ItemTemplate>
                        <div onclick='<%# Eval("product_id", "window.location.href = \"ProductDetails.aspx?product_ID={0}\";") %>' class="group relative">
                            <div class="aspect-h-1 aspect-w-1 w-full overflow-hidden rounded-md bg-gray-200 lg:aspect-none group-hover:opacity-75 lg:h-80">
                                <asp:Image ID="imageProduct" runat="server"
                                    ImageUrl='<%# "data:Image/png;base64," + Convert.ToBase64String((byte[])Eval("thumbnail")) %>'
                                    AlternateText='<%# Eval("product_name") %>'
                                    class="h-full w-full object-cover object-center lg:h-full lg:w-full" />
                            </div>
                            <div class="mt-4 flex justify-between">
                                <div>
                                    <h3 class="text-sm text-gray-700">
                                        <a href="#">
                                            <span aria-hidden="true" class="absolute inset-0"></span>
                                            <%# Eval("product_name") %>
                                        </a>
                                    </h3>

                                </div>
                                <p class="text-sm font-medium text-gray-900">
                                    RM<%# Eval("price") %>
                                </ph>
                            </div>
                        </div>

                    </ItemTemplate>
                </asp:Repeater>

                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT * FROM [Product]
WHERE deleted_at IS NULL"></asp:SqlDataSource>
                <asp:Repeater ID="Repeater3" runat="server" DataSourceID="SqlDataSource3">
                    <ItemTemplate>
                        <div onclick='<%# Eval("product_id", "window.location.href = \"ProductDetails.aspx?product_ID={0}\";") %>' class="group relative">
                            <div class="aspect-h-1 aspect-w-1 w-full overflow-hidden rounded-md bg-gray-200 lg:aspect-none group-hover:opacity-75 lg:h-80">
                                <asp:Image ID="imageProduct" runat="server"
                                    ImageUrl='<%# "data:Image/png;base64," + Convert.ToBase64String((byte[])Eval("thumbnail")) %>'
                                    AlternateText='<%# Eval("product_name") %>'
                                    class="h-full w-full object-cover object-center lg:h-full lg:w-full" />
                            </div>
                            <div class="mt-4 flex justify-between">
                                <div>
                                    <h3 class="text-sm text-gray-700">
                                        <a href="#">
                                            <span aria-hidden="true" class="absolute inset-0"></span>
                                            <%# Eval("product_name") %>
                                        </a>
                                    </h3>

                                </div>
                                <p class="text-sm font-medium text-gray-900">
                                    RM<%# Eval("price") %>
                                </ph>
                            </div>
                        </div>

                    </ItemTemplate>
                </asp:Repeater>

                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT * FROM [Product] AS p
WHERE product_name LIKE '%' + @product_name + '%' AND
deleted_at IS NULL">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtSearch" PropertyName="Text" Name="product_name"></asp:ControlParameter>

                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:Repeater ID="Repeater4" runat="server" DataSourceID="SqlDataSource4">

                    <ItemTemplate>
                        <div onclick='<%# Eval("product_id", "window.location.href = \"ProductDetails.aspx?product_ID={0}\";") %>' class="group relative">
                            <div class="aspect-h-1 aspect-w-1 w-full overflow-hidden rounded-md bg-gray-200 lg:aspect-none group-hover:opacity-75 lg:h-80">
                                <asp:Image ID="imageProduct" runat="server"
                                    ImageUrl='<%# "data:Image/png;base64," + Convert.ToBase64String((byte[])Eval("thumbnail")) %>'
                                    AlternateText='<%# Eval("product_name") %>'
                                    class="h-full w-full object-cover object-center lg:h-full lg:w-full" />
                            </div>
                            <div class="mt-4 flex justify-between">
                                <div>
                                    <h3 class="text-sm text-gray-700">
                                        <a href="#">
                                            <span aria-hidden="true" class="absolute inset-0"></span>
                                            <%# Eval("product_name") %>
                                        </a>
                                    </h3>

                                </div>
                                <p class="text-sm font-medium text-gray-900">
                                    RM<%# Eval("price") %>
                                </ph>
                            </div>
                        </div>

                    </ItemTemplate>

                </asp:Repeater>

                <!-- More products... -->
            </div>
        </div>
    </div>

</asp:Content>
