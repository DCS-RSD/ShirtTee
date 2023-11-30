<%@ Page Title="" Language="C#" MasterPageFile="~/testing.Master" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="ShirtTee.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [product]" OnSelecting="SqlDataSource1_Selecting"></asp:SqlDataSource>
        <div class="bg-white">
        <div class="mx-auto max-w-2xl px-4 py-16 sm:px-6 sm:py-18 lg:max-w-7xl lg:px-8">
            <h2 class="sr-only">Products</h2>
            <h2 class="text-2xl font-bold tracking-tight text-gray-900 pb-8">TRENDING NOW</h2>
                        <div class="grid grid-cols-1 gap-x-6 gap-y-10 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 xl:gap-x-8">

    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
        <ItemTemplate>

                <a href="#" class="group">
                    <div class="aspect-h-1 aspect-w-1 w-full overflow-hidden rounded-lg bg-gray-200 xl:aspect-h-8 xl:aspect-w-7">
                        <img src="<%#Eval("imagepath") %>" alt="Front of men&#039;s Basic Tee in black." class="h-full w-full object-cover object-center lg:h-full lg:w-full">
                    </div>
                    <h3 class="mt-4 text-sm text-gray-700"><%#Eval("prodname") %></h3>
                    <p class="mt-1 text-lg font-medium text-gray-900"><%#Eval("price") %></p>
                </a>



                <!-- More products... -->
            

        </ItemTemplate>
    </asp:Repeater>
            </div></div></div>
</asp:Content>
