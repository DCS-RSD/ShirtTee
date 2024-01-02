<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="AboutUs.aspx.cs" Inherits="ShirtTee.AboutUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="bg-white">
        <div class="mx-auto py-4 pt-4 pb-8 mb-4 max-w-7xl">
            <div class="space-y-12">
                <h2 class="text-3xl font-extrabold tracking-tight sm:text-4xl">About Us</h2>

                <ul role="list" class="space-y-12 lg:grid lg:grid-cols-2 lg:items-start lg:gap-x-8 lg:gap-y-12 lg:space-y-0">
                    <li>
                        <div class="space-y-4 sm:grid sm:grid-cols-3 sm:gap-6 sm:space-y-0 lg:gap-8">
                            <div class="h-0 aspect-w-3 aspect-h-2 sm:aspect-w-3 sm:aspect-h-4">
                                <img class="object-cover shadow-lg rounded-lg" src="https://images.unsplash.com/photo-1514888286974-6c03e2ca1dba?q=80&w=2043&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" alt="Goh Chun Yen">
                            </div>
                            <div class="sm:col-span-2">
                                <div class="space-y-4">
                                    <div class="text-lg leading-6 font-medium space-y-1">
                                        <h3>Goh Chun Yen</h3>
                                        <p class="text-indigo-600">Developer</p>
                                    </div>
                                    <div class="text-lg">
                                        <p class="text-gray-500">A developer who developed this website.</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="space-y-4 sm:grid sm:grid-cols-3 sm:gap-6 sm:space-y-0 lg:gap-8">
                            <div class="h-0 aspect-w-3 aspect-h-2 sm:aspect-w-3 sm:aspect-h-4">
                                <img class="object-cover shadow-lg rounded-lg" src="https://images.unsplash.com/photo-1625036437298-32345acbf717?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" alt="Yip Zi Yan">
                            </div>
                            <div class="sm:col-span-2">
                                <div class="space-y-4">
                                    <div class="text-lg leading-6 font-medium space-y-1">
                                        <h3>Yip Zi Yan</h3>
                                        <p class="text-indigo-600">Developer</p>
                                    </div>
                                    <div class="text-lg">
                                        <p class="text-gray-500">A developer who developed this website.</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </li>

                    <!-- More people... -->
                </ul>
            </div>
        </div>
    </div>

</asp:Content>
