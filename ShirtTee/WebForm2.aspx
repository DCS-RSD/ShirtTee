<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="ShirtTee.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ShirtTee - Online Shirt Shopping</title>
    <!-- Include Tailwind CSS via CDN or local file -->
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
</head>
<body class="font-sans bg-gray-100">

    <form id="form1" runat="server">
        <!-- Header -->
        <nav class="bg-white shadow-lg">
            <div class="container mx-auto p-4">
                <a class="text-2xl font-bold text-gray-800" href="#">ShirtTee</a>
                <div class="flex">
                    <a class="mx-2 text-gray-600 hover:text-gray-800" href="#">Home</a>
                    <a class="mx-2 text-gray-600 hover:text-gray-800" href="#">Products</a>
                    <a class="mx-2 text-gray-600 hover:text-gray-800" href="#">Contact</a>
                </div>
            </div>
        </nav>

        <!-- Main Content - Featured Products -->
        <div class="container mx-auto mt-8">
            <h2 class="text-3xl font-bold mb-4 text-center">Welcome to ShirtTee - Your Online Shirt Shopping Destination</h2>

            <!-- Featured Products Section -->
            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
                <div class="bg-white p-4 shadow-md">
                    <img src="https://img.muji.net/img/item/4550182332216_1260.jpg" class="w-full h-108 object-cover mb-4 rounded" alt="Shirt Image">
                    <h5 class="text-xl font-bold mb-2">Casual Cotton Shirt</h5>
                    <p class="text-gray-700">Discover our comfortable and stylish casual cotton shirt for everyday wear.</p>
                    <div class="flex justify-between items-center mt-4">
                        <span class="text-blue-500 font-semibold">$29.99</span>
                        <a href="#" class="text-sm text-gray-600 hover:text-gray-800">View Details</a>
                    </div>
                </div>
                <div class="bg-white p-4 shadow-md">
                    <img src="https://image.uniqlo.com/UQ/ST3/AsianCommon/imagesgoods/465825/item/goods_30_465825.jpg?width=494" class="w-full h-108 object-cover mb-4 rounded" alt="Shirt Image">
                    <h5 class="text-xl font-bold mb-2">Casual Cotton Shirt</h5>
                    <p class="text-gray-700">Discover our comfortable and stylish casual cotton shirt for everyday wear.</p>
                    <div class="flex justify-between items-center mt-4">
                        <span class="text-blue-500 font-semibold">$29.99</span>
                        <a href="#" class="text-sm text-gray-600 hover:text-gray-800">View Details</a>
                    </div>
                </div>
                                <div class="bg-white p-4 shadow-md">
                    <img src="https://contents.mediadecathlon.com/p1901255/k$8870d3bdfed8faa1f8b3422de5d92354/men-s-regular-fit-pilates-gentle-gym-sport-t-shirt-100-white.jpg?format=auto&quality=70&f=768x768" class="w-full h-108 object-cover mb-4 rounded" alt="Shirt Image">
                    <h5 class="text-xl font-bold mb-2">Casual Cotton Shirt</h5>
                    <p class="text-gray-700">Discover our comfortable and stylish casual cotton shirt for everyday wear.</p>
                    <div class="flex justify-between items-center mt-4">
                        <span class="text-blue-500 font-semibold">$29.99</span>
                        <a href="#" class="text-sm text-gray-600 hover:text-gray-800">View Details</a>
                    </div>
                </div>
                <!-- Add more product cards as needed -->
            </div>
        </div>

        <!-- Footer -->
        <footer class="bg-gray-200 text-center p-4 mt-8">
            <p class="text-gray-600">&copy; 2023 ShirtTee - Online Shirt Shopping</p>
        </footer>

    </form>

    <!-- Optionally, include Tailwind CSS via npm and build your own CSS file -->
    <!-- <link href="path/to/your/tailwind-output.css" rel="stylesheet"> -->
</body>
</html>
