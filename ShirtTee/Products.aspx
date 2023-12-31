<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="ShirtTee.Products" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="bg-white">
        <div class="mx-auto max-w-2xl px-4 pb-10 sm:px-6 sm:pb-10 lg:max-w-7xl lg:px-8">
            <div class="sm:block mb-4">
                <asp:Label runat="server" for="icon" class="sr-only">Search</asp:Label>
                <div class="relative">
                    <div class="absolute inset-y-0 start-0 flex items-center pointer-events-none z-20 ps-4">
                        <svg class="flex-shrink-0 h-4 w-4 text-gray-500" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <circle cx="11" cy="11" r="8" />
                            <path d="m21 21-4.3-4.3" />
                        </svg>
                    </div>
                    <asp:TextBox runat="server" ID="txtSearch" class="py-2 pe-4 ps-10 block w-full border-gray-200 rounded-lg text-sm focus:border-blue-500 focus:ring-blue-500 disabled:opacity-50 disabled:pointer-events-none dark:bg-slate-900 dark:border-gray-700 dark:text-gray-400 dark:focus:ring-gray-600" placeholder="Search" />
                </div>
            </div>
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

                <!-- More products... -->
            </div>
        </div>
    </div>

</asp:Content>
