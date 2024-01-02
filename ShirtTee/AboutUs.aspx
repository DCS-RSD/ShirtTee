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
                                        <h3>Prof. Dr Goh Chun Yen</h3>
                                        <p class="text-indigo-600">Co-Founder / CEO</p>
                                    </div>
                                    <div class="text-m text-justify">
                                        <p class="text-gray-500">
                                            As the Co-Founder and CEO of ShirtTee, Prof. Dr Goh is the driving force behind our innovative approach to online shopping. With a keen eye for fashion and a passion for empowering individual expression, Prof. Dr Goh has led ShirtTee to become a go-to destination for those seeking style, comfort, and sustainability.
                                        </p>
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
                                        <p class="text-indigo-600">Co-Founder / CTO</p>
                                    </div>
                                    <div class="text-m text-justify">
                                        <p class="text-gray-500">Meet the technological architect behind ShirtTee's success, Mr. Yip. As the Co-Founder and Chief Technology Officer, Mr. Yip is at the forefront of our digital evolution. With a profound commitment to innovation and a strategic vision, Mr. Yip ensures ShirtTee stays ahead in the ever-evolving landscape of online shopping.</p>
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
