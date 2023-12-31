<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="ProductDetails.aspx.cs" Inherits="ShirtTee.ProductDetails" MaintainScrollPositionOnPostback="true" EnableViewState="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager runat="server"></asp:ScriptManager>

    <div class="bg-white mt-4">
        <nav aria-label="Breadcrumb">
            <ol role="list" class="mx-auto flex max-w-2xl items-center space-x-2 px-4 sm:px-6 lg:max-w-7xl lg:px-8">
                <li>
                    <div class="flex items-center">
                        <a href="#" class="mr-2 text-sm font-medium text-gray-900">Men</a>
                        <svg width="16" height="20" viewBox="0 0 16 20" fill="currentColor" aria-hidden="true" class="h-5 w-4 text-gray-300">
                            <path d="M5.697 4.34L8.98 16.532h1.327L7.025 4.341H5.697z"></path>
                        </svg>
                    </div>
                </li>
                <li>
                    <div class="flex items-center">
                        <a href="#" class="mr-2 text-sm font-medium text-gray-900">Clothing</a>
                        <svg width="16" height="20" viewBox="0 0 16 20" fill="currentColor" aria-hidden="true" class="h-5 w-4 text-gray-300">
                            <path d="M5.697 4.34L8.98 16.532h1.327L7.025 4.341H5.697z"></path>
                        </svg>
                    </div>
                </li>

                <li class="text-sm">
                    <a href="#" aria-current="page" class="font-medium text-gray-500 hover:text-gray-600">Basic Tee 6-Pack</a>
                </li>
            </ol>
        </nav>
        <div class="max-w-2xl mx-auto mt-6 px-4 sm:px-6 lg:max-w-7xl lg:px-8">
            <div class="lg:grid lg:grid-cols-2 lg:gap-x-8 lg:items-start">
                <!-- Image gallery -->
                <div class="flex flex-col-reverse">
                    <!-- Image selector -->
                    <div class=" mt-6 w-full max-w-2xl mx-auto sm:block lg:max-w-none">
                        <div class="grid grid-cols-4 gap-6" aria-orientation="horizontal" role="tablist">
                            <asp:Repeater ID="Repeater6" runat="server" DataSourceID="SqlDataSource3">
                                <ItemTemplate>
                                    <button id="tabs-1-tab-1" data-src='<%# "data:Image/png;base64," + Convert.ToBase64String((byte[])Eval("thumbnail")) %>' data-hs-overlay="#hs-subscription-with-image" class="image-button relative h-40 bg-white rounded-md flex items-center justify-center text-sm font-medium uppercase text-gray-900 cursor-pointer hover:bg-gray-50 focus:outline-none focus:ring focus:ring-offset-4 focus:ring-opacity-50" aria-controls="tabs-1-panel-1" role="tab" type="button">
                                        <span class="sr-only">Angled view </span>
                                        <span class="absolute inset-0 rounded-md overflow-hidden">
                                            <img src='<%# "data:Image/png;base64," + Convert.ToBase64String((byte[])Eval("thumbnail")) %>'
                                                alt="" class="w-full h-full object-center object-cover" />
                                        </span>
                                        <!-- Selected: "ring-indigo-500", Not Selected: "ring-transparent" -->
                                        <span class="ring-transparent absolute inset-0 rounded-md ring-2 ring-offset-2 pointer-events-none" aria-hidden="true"></span>
                                    </button>
                                </ItemTemplate>
                            </asp:Repeater>

                            <%-- Stock Image --%>
                            <asp:Repeater ID="Repeater7" runat="server" DataSourceID="SqlDataSource4">
                                <ItemTemplate>
                                    <button id="tabs-1-tab-1" data-src='<%# "data:Image/png;base64," + Convert.ToBase64String((byte[])Eval("image")) %>' data-hs-overlay="#hs-subscription-with-image" class="image-button relative h-40 bg-white rounded-md flex items-center justify-center text-sm font-medium uppercase text-gray-900 cursor-pointer hover:bg-gray-50 focus:outline-none focus:ring focus:ring-offset-4 focus:ring-opacity-50" aria-controls="tabs-1-panel-1" role="tab" type="button">
                                        <span class="sr-only">Angled view </span>
                                        <span class="absolute inset-0 rounded-md overflow-hidden">
                                            <img src='<%# "data:Image/png;base64," + Convert.ToBase64String((byte[])Eval("image")) %>' alt="" class="w-full h-full object-center object-cover" />
                                        </span>
                                        <!-- Selected: "ring-indigo-500", Not Selected: "ring-transparent" -->
                                        <span class="ring-transparent absolute inset-0 rounded-md ring-2 ring-offset-2 pointer-events-none" aria-hidden="true"></span>
                                    </button>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </div>

                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT * FROM [Product] WHERE ([product_ID] = @product_ID)">
                        <SelectParameters>
                            <asp:QueryStringParameter QueryStringField="product_ID" Name="product_ID" Type="Int32"></asp:QueryStringParameter>
                        </SelectParameters>
                    </asp:SqlDataSource>

                    <div class="w-full aspect-w-1 ">
                        <!-- Tab panel, show/hide based on tab state. -->

                        <!-- Slider -->
                        <div data-hs-carousel="{
    &quot;loadingClasses&quot;: &quot;opacity-0&quot;,
    &quot;isAutoPlay&quot;: true
  }"
                            class="relative init">
                            <div class="hs-carousel relative overflow-hidden w-full min-h-[500px] bg-white rounded-lg">
                                <div class="hs-carousel-body absolute top-0 bottom-0 start-0 flex flex-nowrap transition-transform duration-700" style="width: 1872px; transform: translate(-624px, 0px);">

                                    <asp:Repeater ID="Repeater3" runat="server" DataSourceID="SqlDataSource3">
                                        <ItemTemplate>
                                            <div class="hs-carousel-slide" style="width: 500px;">
                                                <div class="flex justify-center h-full bg-gray-100 p-6">
                                                    <span class="self-center text-4xl transition duration-700">First slide
                                                        <img src='<%# "data:Image/png;base64," + Convert.ToBase64String((byte[])Eval("thumbnail")) %>' />
                                                    </span>
                                                </div>
                                            </div>
                                        </ItemTemplate>
                                    </asp:Repeater>

                                    <%-- Stock Image(pending) --%>
                                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT DISTINCT s.color_ID, CONVERT(VARBINARY(MAX), s.image) AS image FROM Product_Details AS s INNER JOIN Product AS p ON s.product_ID = p.product_ID WHERE (p.product_ID = @product_ID) AND (s.image IS NOT NULL) AND (on_sale = 1)
">
                                        <SelectParameters>
                                            <asp:QueryStringParameter QueryStringField="product_ID" Name="product_ID"></asp:QueryStringParameter>
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                    <asp:Repeater ID="Repeater4" runat="server" DataSourceID="SqlDataSource4">
                                        <ItemTemplate>
                                            <div class="hs-carousel-slide" style="width: 624px;">
                                                <div class="flex justify-center h-full bg-gray-100 p-6">
                                                    <span class="self-center text-4xl transition duration-700">First slide
                                                        <img src='<%# "data:Image/png;base64," + Convert.ToBase64String((byte[])Eval("image")) %>' />
                                                    </span>
                                                </div>
                                            </div>
                                        </ItemTemplate>
                                    </asp:Repeater>

                                </div>
                            </div>

                            <button type="button" class="hs-carousel-prev hs-carousel:disabled:opacity-50 disabled:pointer-events-none absolute inset-y-0 start-0 inline-flex justify-center items-center w-[46px] h-full text-gray-800 hover:bg-gray-800/[.1]">
                                <span class="text-2xl" aria-hidden="true">
                                    <svg class="w-4 h-4" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" viewBox="0 0 16 16">
                                        <path fill-rule="evenodd" d="M11.354 1.646a.5.5 0 0 1 0 .708L5.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0z"></path>
                                    </svg>
                                </span>
                                <span class="sr-only">Previous</span>
                            </button>
                            <button type="button" class="hs-carousel-next hs-carousel:disabled:opacity-50 disabled:pointer-events-none absolute inset-y-0 end-0 inline-flex justify-center items-center w-[46px] h-full text-gray-800 hover:bg-gray-800/[.1]">
                                <span class="sr-only">Next</span>
                                <span class="text-2xl" aria-hidden="true">
                                    <svg class="w-4 h-4" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" viewBox="0 0 16 16">
                                        <path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"></path>
                                    </svg>
                                </span>
                            </button>

                            <div class="hs-carousel-pagination flex justify-center absolute bottom-3 start-0 end-0 space-x-2">
                                <span class="hs-carousel-active:bg-blue-700 hs-carousel-active:border-blue-700 w-3 h-3 border border-gray-400 rounded-full cursor-pointer"></span>
                                <asp:Repeater ID="Repeater5" runat="server" DataSourceID="SqlDataSource4">
                                    <ItemTemplate>
                                        <span class="hs-carousel-active:bg-blue-700 hs-carousel-active:border-blue-700 w-3 h-3 border border-gray-400 rounded-full cursor-pointer active"></span>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                        </div>
                        <!-- End Slider -->
                        <!-- More images... -->

                    </div>
                </div>

                <!-- Product info -->
                <div class="mt-10 px-4 sm:px-0 lg:mt-0">
                    <asp:Label runat="server" ID="lblProdName" class="text-2xl font-bold tracking-tight text-gray-900 sm:text-3xl" Text=""></asp:Label>

                    <div class="mt-3">
                        <asp:Label runat="server" ID="lblPrice" class="text-3xl text-gray-900"></asp:Label>
                    </div>

                    <!-- Reviews -->


                    <div class="mt-6">

                        <div class="text-base text-gray-700 space-y-6">
                            <asp:Label runat="server" ID="lblDesc"></asp:Label>
                        </div>
                    </div>


                    <!-- Colors -->
                    <div class="mt-4">
                        <h3 class="text-sm font-medium text-gray-900">Color</h3>
                        <fieldset class="mt-4">
                            <legend class="sr-only">Choose a color</legend>
                            <div class="flex items-center space-x-3">
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT s.color_ID, color_name, hex_color FROM [Product_Details] AS s INNER JOIN [Color] AS c ON s.color_ID = c.color_ID WHERE product_ID = @product_ID AND on_sale = 1 AND stock_available > 0 GROUP BY s.color_ID, color_name, hex_color">
                                    <SelectParameters>
                                        <asp:QueryStringParameter QueryStringField="product_ID" Name="product_ID"></asp:QueryStringParameter>
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1" OnItemDataBound="Repeater1_ItemDataBound">
                                    <ItemTemplate>
                                        <label class="color_grp relative -m-0.5 flex cursor-pointer items-center justify-center rounded-full p-0.5 focus:outline-none ring-gray-400">
                                            <asp:RadioButton ID="radColor" OnCheckedChanged="radColor_CheckedChanged" value="" runat="server" name="color-choice" class="sr-only" aria-labelledby="color-choice-0-label" AutoPostBack="True" />
                                            <span id="color-choice-0-label" class="sr-only"><%# Eval("color_name") %></span>
                                            <span aria-hidden="true" style='<%# "background-color: "+Eval("hex_color")+";" %>' class="h-8 w-8 rounded-full border border-black border-opacity-10"></span>
                                        </label>
                                    </ItemTemplate>
                                </asp:Repeater>
                                <asp:Label ID="lblColor" runat="server" Text="" Visible="false"></asp:Label>
                            </div>
                        </fieldset>
                    </div>
                    <div class="mt-10">
                        <div class="flex items-center justify-between">
                            <h3 class="text-sm font-medium text-gray-900">Size</h3>
                            <a href="#" class="text-sm font-medium text-indigo-600 hover:text-indigo-500">Size guide</a>
                        </div>
                        <asp:Label ID="lblMsg" runat="server" Text="Select Color To View Available Size." class="italic" Visible="true"></asp:Label>

                        <fieldset class="mt-4">
                            <legend class="sr-only">Choose a size</legend>
                            <div class="grid grid-cols-4 gap-4 sm:grid-cols-8 lg:grid-cols-4">
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT i.size_ID, size_name FROM [Product_Details] AS s INNER JOIN [Size] AS i ON s.size_ID = i.size_ID WHERE product_ID = @product_ID AND color_ID = @color_ID AND stock_available > 0 AND on_sale = 1 GROUP BY i.size_ID, size_name">
                                    <SelectParameters>
                                        <asp:QueryStringParameter QueryStringField="product_ID" Name="product_ID"></asp:QueryStringParameter>
                                        <asp:ControlParameter ControlID="lblColor" PropertyName="Text" Name="color_ID"></asp:ControlParameter>
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource2" OnItemDataBound="Repeater2_ItemDataBound">
                                    <ItemTemplate>
                                        <label class="size_grp relative flex items-center justify-center rounded-md border-2 py-3 px-4 text-sm font-medium uppercase hover:bg-gray-300 focus:outline-none sm:flex-1 sm:py-6 cursor-pointer bg-white text-gray-900 shadow-sm">
                                            <asp:RadioButton ID="radSize" OnCheckedChanged="radSize_CheckedChanged" value="" name="size-choice" runat="server" class="sr-only" aria-labelledby="size-choice-1-label" AutoPostBack="True" />
                                            <span id="size-choice-1-label"><%# Eval("size_name") %></span>
                                            <span class="pointer-events-none absolute -inset-px rounded-md" aria-hidden="true"></span>
                                        </label>
                                    </ItemTemplate>
                                </asp:Repeater>
                                <asp:Label ID="lblSize" runat="server" Text="" Visible="false"></asp:Label>

                            </div>
                        </fieldset>
                    </div>


                    <div class="mt-10 flex sm:flex-col1">
                        <asp:Button runat="server" ID="btnAddToBag" OnClick="btnAddToBag_Click" class="flex-1 bg-indigo-600 border border-transparent rounded-md py-3 px-8 flex items-center justify-center text-base font-medium text-white hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-offset-gray-50 focus:ring-indigo-500 sm:w-full" Text="Add To Bag"></asp:Button>


                    </div>
                    <div class="text-center mt-2">
                           <asp:Label ID="lblErrAdd" runat="server" Text="" class="italic text-red-600 font-semibold "></asp:Label>
                    </div>


                </div>
            </div>
        </div>
    </div>

    <div class="bg-white">
        <div class="max-w-2xl mx-auto mt-8 pt-8 pb-12 px-8 lg:max-w-7xl lg:grid lg:grid-cols-12 lg:gap-x-8">
            <div class="lg:col-span-4">
                <h2 class="text-2xl font-bold tracking-tight text-gray-900">Customer Reviews</h2>


                <div class="mt-1 flex items-center">
                    <div>
                        <div runat="server" id="ratingStars" class="flex items-center">

                        </div>
                    </div>
                    <p class="ml-2 text-sm text-gray-900">
                        <asp:Label runat="server" ID="lblTotalRating" Text="0"></asp:Label>
                        stars based on
                        <asp:Label runat="server" ID="lblTotalReviews" Text="0"></asp:Label>
                        reviews
                    </p>
                </div>

                <div class="mt-6">
                    <h3 class="sr-only">Review data</h3>

                    <dl class="space-y-3">
                        <div class="flex items-center text-sm">
                            <dt class="flex-1 flex items-center">
                                <p class="w-3 font-medium text-gray-900">5<span class="sr-only"> star reviews</span></p>
                                <div aria-hidden="true" class="ml-1 flex-1 flex items-center">
                                    <!-- Heroicon name: solid/star -->
                                    <svg class="flex-shrink-0 h-5 w-5 text-yellow-400" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
                                        <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"></path>
                                    </svg>

                                    <div class="ml-3 relative flex-1">
                                        <div class="h-3 bg-gray-100 border border-gray-200 rounded-full"></div>

                                        <div id="starBar5" runat="server" style="" class="absolute inset-y-0 bg-yellow-400 border border-yellow-400 rounded-full"></div>
                                    </div>
                                </div>
                            </dt>
                            <dd class="ml-3 w-10 text-right tabular-nums text-sm text-gray-900">
                                <asp:Label runat="server" ID="lblFivePer" Text="0"></asp:Label>%</dd>
                        </div>

                        <div class="flex items-center text-sm">
                            <dt class="flex-1 flex items-center">
                                <p class="w-3 font-medium text-gray-900">4<span class="sr-only"> star reviews</span></p>
                                <div aria-hidden="true" class="ml-1 flex-1 flex items-center">
                                    <!-- Heroicon name: solid/star -->
                                    <svg class="flex-shrink-0 h-5 w-5 text-yellow-400" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
                                        <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"></path>
                                    </svg>

                                    <div class="ml-3 relative flex-1">
                                        <div class="h-3 bg-gray-100 border border-gray-200 rounded-full"></div>

                                        <div id="starBar4" runat="server" style="" class="absolute inset-y-0 bg-yellow-400 border border-yellow-400 rounded-full"></div>
                                    </div>
                                </div>
                            </dt>
                            <dd class="ml-3 w-10 text-right tabular-nums text-sm text-gray-900">
                                <asp:Label runat="server" ID="lblFourPer" Text="0"></asp:Label>%</dd>
                        </div>

                        <div class="flex items-center text-sm">
                            <dt class="flex-1 flex items-center">
                                <p class="w-3 font-medium text-gray-900">3<span class="sr-only"> star reviews</span></p>
                                <div aria-hidden="true" class="ml-1 flex-1 flex items-center">
                                    <!-- Heroicon name: solid/star -->
                                    <svg class="flex-shrink-0 h-5 w-5 text-yellow-400" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
                                        <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"></path>
                                    </svg>

                                    <div class="ml-3 relative flex-1">
                                        <div class="h-3 bg-gray-100 border border-gray-200 rounded-full"></div>

                                        <div id="starBar3" runat="server" style="" class="absolute inset-y-0 bg-yellow-400 border border-yellow-400 rounded-full"></div>
                                    </div>
                                </div>
                            </dt>
                            <dd class="ml-3 w-10 text-right tabular-nums text-sm text-gray-900">
                                <asp:Label runat="server" ID="lblThreePer" Text="0"></asp:Label>%</dd>
                        </div>

                        <div class="flex items-center text-sm">
                            <dt class="flex-1 flex items-center">
                                <p class="w-3 font-medium text-gray-900">2<span class="sr-only"> star reviews</span></p>
                                <div aria-hidden="true" class="ml-1 flex-1 flex items-center">
                                    <!-- Heroicon name: solid/star -->
                                    <svg class="flex-shrink-0 h-5 w-5 text-yellow-400" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
                                        <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"></path>
                                    </svg>

                                    <div class="ml-3 relative flex-1">
                                        <div class="h-3 bg-gray-100 border border-gray-200 rounded-full"></div>

                                        <div id="starBar2" runat="server" style="" class="absolute inset-y-0 bg-yellow-400 border border-yellow-400 rounded-full"></div>
                                    </div>
                                </div>
                            </dt>
                            <dd class="ml-3 w-10 text-right tabular-nums text-sm text-gray-900">
                                <asp:Label runat="server" ID="lblTwoPer" Text="0"></asp:Label>%</dd>
                        </div>

                        <div class="flex items-center text-sm">
                            <dt class="flex-1 flex items-center">
                                <p class="w-3 font-medium text-gray-900">1<span class="sr-only"> star reviews</span></p>
                                <div aria-hidden="true" class="ml-1 flex-1 flex items-center">
                                    <!-- Heroicon name: solid/star -->
                                    <svg class="flex-shrink-0 h-5 w-5 text-yellow-400" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
                                        <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"></path>
                                    </svg>

                                    <div class="ml-3 relative flex-1">
                                        <div class="h-3 bg-gray-100 border border-gray-200 rounded-full"></div>

                                        <div id="starBar1" runat="server" style="" class="absolute inset-y-0 bg-yellow-400 border border-yellow-400 rounded-full"></div>
                                    </div>
                                </div>
                            </dt>
                            <dd class="ml-3 w-10 text-right tabular-nums text-sm text-gray-900">
                                <asp:Label runat="server" ID="lblOnePer" Text="0"></asp:Label>%</dd>
                        </div>
                    </dl>
                </div>


            </div>

            <div class=" mt-12 lg:mt-0 lg:col-start-6 lg:col-span-7">
                <h3 class="sr-only">Recent reviews</h3>

                <div class="flow-root">
                    <div class=" divide-y divide-gray-200">
                        <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT * FROM [Review] AS r
INNER JOIN [Product_Details] AS p ON r.product_details_ID = p.product_details_ID
INNER JOIN [AspNetUsers] AS u ON r.user_ID = Id 
INNER JOIN [Color] AS c ON p.color_ID = c.color_ID 
INNER JOIN [Size] AS s ON p.size_ID = s.size_ID 
WHERE product_ID = @product_ID
ORDER BY review_date DESC">
                            <SelectParameters>
                                <asp:QueryStringParameter QueryStringField="product_ID" Name="product_ID"></asp:QueryStringParameter>
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:Repeater ID="Repeater8" runat="server" DataSourceID="SqlDataSource5" OnItemDataBound="Repeater8_ItemDataBound">
                            <ItemTemplate>
                                <div class="py-4 border-t border-b">
                                    <div class="flex items-center">
                                        <img src="https://images.unsplash.com/photo-1502685104226-ee32379fefbe?ixlib=rb-=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=8&w=256&h=256&q=80" alt="Emily Selman." class="h-12 w-12 rounded-full">
                                        <div class="ml-4">
                                            <asp:Label runat="server" ID="lblRating" Text='<%# Eval("rating") %>' Visible="false"/>
                                            <h4 class="text-sm font-bold text-gray-900"><%# Eval("UserName") %></h4>
                                            <div class="mt-1 flex items-center">

                                                <%# GenerateStars(Convert.ToInt32(Eval("rating"))) %>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="mt-4 text-base">
                                        <p><%# Eval("review_description") %></p>

                                        <div class="flex justify-between mt-4  italic text-gray-600">
                                            <p><%# Eval("size_name") %> | <%# Eval("color_name") %></p>


                                            <p class="block"><%# Eval("review_date") %></p>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                        <!-- More reviews... -->
                    </div>
                </div>
            </div>
        </div>
    </div>


    <div id="hs-subscription-with-image" class="flex justify-center items-center hidden w-full h-full fixed top-0 start-0 z-[60] overflow-x-hidden overflow-y-auto">
        <div class="h-full hs-overlay-open:opacity-100 hs-overlay-open:duration-500 opacity-0 ease-out transition-all sm:max-w-lg sm:w-full sm:mx-auto">
            <div class="absolute top-2 end-2 z-[10]">
                <button type="button" class="inline-flex justify-center items-center w-8 h-8 text-sm font-semibold rounded-lg border border-transparent bg-white/10 text-black hover:bg-white/20 disabled:opacity-50 disabled:pointer-events-none dark:focus:outline-none dark:focus:ring-1 dark:focus:ring-gray-600" data-hs-overlay="#hs-subscription-with-image">
                    <span class="sr-only">Close</span>
                    <svg class="flex-shrink-0 w-4 h-4" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <path d="M18 6 6 18" />
                        <path d="m6 6 12 12" />
                    </svg>
                </button>
            </div>
            <div class="relative flex flex-col bg-white shadow-lg rounded-xl dark:bg-gray-800">


                <div>
                    <img class="w-full object-cover rounded-xl" src="" alt="Image Description">
                </div>

            </div>
        </div>
    </div>

    <script> 
        function handleSizeRadioClick(radioButton) {
            const sizeSpans = document.querySelectorAll('span[name="size-choice"]');
            sizeSpans.forEach(function (span) {
                const radioBtn = span.querySelector('input[type="radio"]');
                if (radioBtn !== radioButton) {
                    radioBtn.checked = false;
                }
            });
            radioButton.checked = true;
        }
    </script>

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            // Get all radio buttons for color choices
            const sizeSpans = document.querySelectorAll('span[name="size-choice"]');

            // Add click event listener to each color span
            sizeSpans.forEach(function (span) {
                const radioBtn = span.querySelector('input[type="radio"]');
                if (radioBtn.checked) {
                    document.querySelectorAll('.size_grp').forEach(function (label) {
                        label.classList.remove('border-black');
                        label.classList.remove('bg-gray-300');
                        label.classList.add('bg-white');
                    });
                    const selectedLabel = span.closest('label');
                    selectedLabel.classList.add('border-black');
                    selectedLabel.classList.remove('bg-white');
                    selectedLabel.classList.add('bg-gray-300');
                }
            });

        });
    </script>

    <script> 
        function handleColorRadioClick(radioButton) {
            const colorSpans = document.querySelectorAll('span[name="color-choice"]');
            colorSpans.forEach(function (span) {
                const radioBtn = span.querySelector('input[type="radio"]');
                if (radioBtn !== radioButton) {
                    radioBtn.checked = false;
                }
            });
            radioButton.checked = true;
        }
    </script>

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            // Get all radio buttons for color choices
            const colorSpans = document.querySelectorAll('span[name="color-choice"]');

            // Add click event listener to each color span
            colorSpans.forEach(function (span) {
                const radioBtn = span.querySelector('input[type="radio"]');
                if (radioBtn.checked) {
                    document.querySelectorAll('.color_grp').forEach(function (label) {
                        label.classList.remove('ring');
                        label.classList.remove('ring-offset-1');
                    });
                    const selectedLabel = span.closest('label');
                    selectedLabel.classList.add('ring');
                    selectedLabel.classList.add('ring-offset-1');
                }
            });

        });
    </script>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script>
        $(document).ready(function () {
            // Handler for image button click
            $('.image-button').on('click', function () {
                // Get the image source from the data-src attribute
                var imageSrc = $(this).data('src');

                // Update the modal's image source
                $('#hs-subscription-with-image img').attr('src', imageSrc);

            });

        });
    </script>

</asp:Content>
