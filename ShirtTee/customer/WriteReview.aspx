<%@ Page ValidateRequest="false" Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="WriteReview.aspx.cs" Inherits="ShirtTee.customer.WriteReview" %>



<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style>
        .ProseMirror:focus {
            outline: none;
        }

        .tiptap ul p,
        .tiptap ol p {
            display: inline;
        }

        .tiptap p.is-editor-empty:first-child::before {
            font-size: 14px;
            content: attr(data-placeholder);
            float: left;
            height: 0;
            pointer-events: none;
        }
    </style>

    <script>
        function showSuccessToast() {
            var status = '<%= Session["ReviewSubmitted"] %>';
                console.log(status);
                if (status !== null && status !== undefined) {
                    if (status == "success") {
                        toastr["success"]("Review submitted successfully.");
                    }
                    else {
                        toastr["error"]("Empty rating / Same review & rating cannot be submitted.");
                    }
                }
        <% Session.Remove("ReviewSubmitted"); %>
        }
    </script>
    <div class="bg-white">
        <div class=" mx-auto pt-4 pb-12 px-8 lg:max-w-7xl lg:px-12">
            <div class="sm:text-left text-center">
                <h2 class="text-2xl text-gray-800 font-bold sm:text-3xl dark:text-white mb-2">Review & Rating
                </h2>
                <asp:Label runat="server" ID="lblOrderID" class="font-semibold" Text=""></asp:Label>
            </div>

            <!-- Products -->
            <div class="mt-6">
                <h2 class="sr-only">Products purchased</h2>

                <div class="space-y-8">


                    <div class="bg-white border-t border-b border-gray-200 shadow-sm sm:border sm:rounded-lg">
                        <div class="py-6 px-4 sm:px-6 lg:grid lg:grid-cols-12 lg:gap-x-8 lg:p-8">
                            <div class="sm:flex lg:col-span-7">
                                <div class="flex-shrink-0 w-full aspect-w-1 aspect-h-1 rounded-lg overflow-hidden sm:aspect-none sm:w-40 sm:h-40">
                                    <asp:Image runat="server" ImageUrl="" ID="imgProduct" AlternateText="" class="w-full h-full object-center object-cover sm:w-full sm:h-full" />
                                </div>

                                <div class="mt-6 sm:mt-0 sm:ml-6">
                                    <h3 class="text-base font-medium text-gray-900">
                                        <asp:Label runat="server" ID="lblProductName" Text="" />
                                    </h3>
                                    <p class="mt-2 text-sm font-medium text-gray-900">
                                        RM
                                        <asp:Label runat="server" ID="lblPrice" Text="" />
                                    </p>
                                    <asp:Label runat="server" ID="lblDescription" Text="" class="mt-3 text-sm text-gray-500" />
                                    <p class="mt-3 text-sm font-bold text-gray-900">
                                        Total: RM
                                        <asp:Label runat="server" ID="lblTotal" Text="" />
                                    </p>
                                </div>
                            </div>

                            <div class="mt-6 lg:mt-0 lg:col-span-5">
                                <dl class="grid grid-cols-2 gap-x-6 text-sm">
                                    <div>
                                        <dt class="font-medium text-gray-900">Quantity</dt>
                                        <dd class="mt-3 text-gray-500">


                                            <span class="block">
                                                <asp:Label runat="server" ID="lblQuantity" Text="" /></span>
                                        </dd>
                                    </div>
                                    <div>
                                        <dt class="font-medium text-gray-900">Color / Size</dt>
                                        <dd class="mt-3 text-gray-500 space-y-3">
                                            <asp:Label runat="server" ID="lblColor" Text="" />
                                            <asp:Label runat="server" ID="lblSize" class="block" Text="" />
                                        </dd>
                                    </div>
                                </dl>
                            </div>
                        </div>

                    </div>
                </div>
            </div>

            <div class="mt-5 p-4 z-10 bg-white border rounded-xl sm:mt-10 md:p-10 dark:bg-gray-800 dark:border-gray-700">



                <div class="mb-4 sm:mb-8">
                    <label for="hs-feedback-post-comment-email-1" class="block mb-2 text-sm font-medium dark:text-white">Rating</label>
                    <div class="flex flex-row-reverse justify-end mt-4 items-center">
                        <!--Built in javascript, must use html input, will use asp:Label to get value-->
                        <input id="hs-ratings-readonly-1" type="radio" class="peer -ms-10 w-10 h-10 bg-transparent border-0 text-transparent cursor-pointer appearance-none checked:bg-none focus:bg-none focus:ring-0 focus:ring-offset-0" name="hs-ratings-readonly" value="5" />
                        <asp:Label runat="server" for="hs-ratings-readonly-1" class="peer-checked:text-yellow-400 text-gray-300 pointer-events-none dark:peer-checked:text-yellow-600 dark:text-gray-600">
    <svg class="flex-shrink-0 w-10 h-10" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" viewBox="0 0 16 16">
      <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"></path>
    </svg>
                        </asp:Label>
                        <input id="hs-ratings-readonly-2" type="radio" class="peer -ms-10 w-10 h-10 bg-transparent border-0 text-transparent cursor-pointer appearance-none checked:bg-none focus:bg-none focus:ring-0 focus:ring-offset-0" name="hs-ratings-readonly" value="4">
                        <asp:Label runat="server" for="hs-ratings-readonly-2" class="peer-checked:text-yellow-400 text-gray-300 pointer-events-none dark:peer-checked:text-yellow-600 dark:text-gray-600">
    <svg class="flex-shrink-0 w-10 h-10" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" viewBox="0 0 16 16">
      <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"></path>
    </svg>
                        </asp:Label>
                        <input id="hs-ratings-readonly-3" type="radio" class="peer -ms-10 w-10 h-10 bg-transparent border-0 text-transparent cursor-pointer appearance-none checked:bg-none focus:bg-none focus:ring-0 focus:ring-offset-0" name="hs-ratings-readonly" value="3">
                        <asp:Label runat="server" for="hs-ratings-readonly-3" class="peer-checked:text-yellow-400 text-gray-300 pointer-events-none dark:peer-checked:text-yellow-600 dark:text-gray-600">
    <svg class="flex-shrink-0 w-10 h-10" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" viewBox="0 0 16 16">
      <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"></path>
    </svg>
                        </asp:Label>
                        <input id="hs-ratings-readonly-4" type="radio" class="peer -ms-10 w-10 h-10 bg-transparent border-0 text-transparent cursor-pointer appearance-none checked:bg-none focus:bg-none focus:ring-0 focus:ring-offset-0" name="hs-ratings-readonly" value="2">
                        <asp:Label runat="server" for="hs-ratings-readonly-4" class="peer-checked:text-yellow-400 text-gray-300 pointer-events-none dark:peer-checked:text-yellow-600 dark:text-gray-600">
    <svg class="flex-shrink-0 w-10 h-10" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" viewBox="0 0 16 16">
      <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"></path>
    </svg>
                        </asp:Label>
                        <input id="hs-ratings-readonly-5" type="radio" class="peer -ms-10 w-10 h-10 bg-transparent border-0 text-transparent cursor-pointer appearance-none checked:bg-none focus:bg-none focus:ring-0 focus:ring-offset-0" name="hs-ratings-readonly" value="1">
                        <asp:Label runat="server" for="hs-ratings-readonly-5" class="peer-checked:text-yellow-400 text-gray-300 pointer-events-none dark:peer-checked:text-yellow-600 dark:text-gray-600">
    <svg class="flex-shrink-0 w-10 h-10" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" viewBox="0 0 16 16">
      <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"></path>
    </svg>
                        </asp:Label>
                        <asp:HiddenField ID="lblRating" runat="server" Value="0" />
                    </div>

                </div>



                <div>
                    <label for="hs_feedback_post_comment_textarea_1" class="block mb-2 text-sm font-medium dark:text-white">Review</label>
                    <div class="border border-gray-200 rounded-lg overflow-hidden dark:border-gray-700">
                        <div id="hs-editor-tiptap">
                            <div class="flex align-middle gap-x-0.5 border-b border-gray-200 p-2 dark:border-gray-700">
                                <button class="w-8 h-8 inline-flex justify-center items-center gap-x-2 text-sm font-semibold rounded-full border border-transparent text-gray-800 hover:bg-gray-100 disabled:opacity-50 disabled:pointer-events-none dark:text-white dark:hover:bg-gray-700 dark:focus:outline-none dark:focus:ring-1 dark:focus:ring-gray-600" type="button" data-hs-editor-bold>
                                    <svg class="flex-shrink-0 w-4 h-4" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                        <path d="M14 12a4 4 0 0 0 0-8H6v8" />
                                        <path d="M15 20a4 4 0 0 0 0-8H6v8Z" />
                                    </svg>
                                </button>
                                <button class="w-8 h-8 inline-flex justify-center items-center gap-x-2 text-sm font-semibold rounded-full border border-transparent text-gray-800 hover:bg-gray-100 disabled:opacity-50 disabled:pointer-events-none dark:text-white dark:hover:bg-gray-700 dark:focus:outline-none dark:focus:ring-1 dark:focus:ring-gray-600" type="button" data-hs-editor-italic>
                                    <svg class="flex-shrink-0 w-4 h-4" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                        <line x1="19" x2="10" y1="4" y2="4" />
                                        <line x1="14" x2="5" y1="20" y2="20" />
                                        <line x1="15" x2="9" y1="4" y2="20" />
                                    </svg>
                                </button>
                                <button class="w-8 h-8 inline-flex justify-center items-center gap-x-2 text-sm font-semibold rounded-full border border-transparent text-gray-800 hover:bg-gray-100 disabled:opacity-50 disabled:pointer-events-none dark:text-white dark:hover:bg-gray-700 dark:focus:outline-none dark:focus:ring-1 dark:focus:ring-gray-600" type="button" data-hs-editor-underline>
                                    <svg class="flex-shrink-0 w-4 h-4" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                        <path d="M6 4v6a6 6 0 0 0 12 0V4" />
                                        <line x1="4" x2="20" y1="20" y2="20" />
                                    </svg>
                                </button>
                                <button class="w-8 h-8 inline-flex justify-center items-center gap-x-2 text-sm font-semibold rounded-full border border-transparent text-gray-800 hover:bg-gray-100 disabled:opacity-50 disabled:pointer-events-none dark:text-white dark:hover:bg-gray-700 dark:focus:outline-none dark:focus:ring-1 dark:focus:ring-gray-600" type="button" data-hs-editor-strike>
                                    <svg class="flex-shrink-0 w-4 h-4" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                        <path d="M16 4H9a3 3 0 0 0-2.83 4" />
                                        <path d="M14 12a4 4 0 0 1 0 8H6" />
                                        <line x1="4" x2="20" y1="12" y2="12" />
                                    </svg>
                                </button>
                                <button class="w-8 h-8 inline-flex justify-center items-center gap-x-2 text-sm font-semibold rounded-full border border-transparent text-gray-800 hover:bg-gray-100 disabled:opacity-50 disabled:pointer-events-none dark:text-white dark:hover:bg-gray-700 dark:focus:outline-none dark:focus:ring-1 dark:focus:ring-gray-600" type="button" data-hs-editor-link>
                                    <svg class="flex-shrink-0 w-4 h-4" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                        <path d="M10 13a5 5 0 0 0 7.54.54l3-3a5 5 0 0 0-7.07-7.07l-1.72 1.71" />
                                        <path d="M14 11a5 5 0 0 0-7.54-.54l-3 3a5 5 0 0 0 7.07 7.07l1.71-1.71" />
                                    </svg>
                                </button>
                                <button class="w-8 h-8 inline-flex justify-center items-center gap-x-2 text-sm font-semibold rounded-full border border-transparent text-gray-800 hover:bg-gray-100 disabled:opacity-50 disabled:pointer-events-none dark:text-white dark:hover:bg-gray-700 dark:focus:outline-none dark:focus:ring-1 dark:focus:ring-gray-600" type="button" data-hs-editor-ol>
                                    <svg class="flex-shrink-0 w-4 h-4" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                        <line x1="10" x2="21" y1="6" y2="6" />
                                        <line x1="10" x2="21" y1="12" y2="12" />
                                        <line x1="10" x2="21" y1="18" y2="18" />
                                        <path d="M4 6h1v4" />
                                        <path d="M4 10h2" />
                                        <path d="M6 18H4c0-1 2-2 2-3s-1-1.5-2-1" />
                                    </svg>
                                </button>
                                <button class="w-8 h-8 inline-flex justify-center items-center gap-x-2 text-sm font-semibold rounded-full border border-transparent text-gray-800 hover:bg-gray-100 disabled:opacity-50 disabled:pointer-events-none dark:text-white dark:hover:bg-gray-700 dark:focus:outline-none dark:focus:ring-1 dark:focus:ring-gray-600" type="button" data-hs-editor-ul>
                                    <svg class="flex-shrink-0 w-4 h-4" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                        <line x1="8" x2="21" y1="6" y2="6" />
                                        <line x1="8" x2="21" y1="12" y2="12" />
                                        <line x1="8" x2="21" y1="18" y2="18" />
                                        <line x1="3" x2="3.01" y1="6" y2="6" />
                                        <line x1="3" x2="3.01" y1="12" y2="12" />
                                        <line x1="3" x2="3.01" y1="18" y2="18" />
                                    </svg>
                                </button>
                                <button class="w-8 h-8 inline-flex justify-center items-center gap-x-2 text-sm font-semibold rounded-full border border-transparent text-gray-800 hover:bg-gray-100 disabled:opacity-50 disabled:pointer-events-none dark:text-white dark:hover:bg-gray-700 dark:focus:outline-none dark:focus:ring-1 dark:focus:ring-gray-600" type="button" data-hs-editor-blockquote>
                                    <svg class="flex-shrink-0 w-4 h-4" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                        <path d="M17 6H3" />
                                        <path d="M21 12H8" />
                                        <path d="M21 18H8" />
                                        <path d="M3 12v6" />
                                    </svg>
                                </button>
                                <button class="w-8 h-8 inline-flex justify-center items-center gap-x-2 text-sm font-semibold rounded-full border border-transparent text-gray-800 hover:bg-gray-100 disabled:opacity-50 disabled:pointer-events-none dark:text-white dark:hover:bg-gray-700 dark:focus:outline-none dark:focus:ring-1 dark:focus:ring-gray-600" type="button" data-hs-editor-code>
                                    <svg class="flex-shrink-0 w-4 h-4" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                        <path d="m18 16 4-4-4-4" />
                                        <path d="m6 8-4 4 4 4" />
                                        <path d="m14.5 4-5 16" />
                                    </svg>
                                </button>
                            </div>
                            <asp:Label data-hs-editor-field runat="server" class="py-3 px-4 block w-full border-gray-200 rounded-lg text-sm focus:border-blue-500 focus:ring-blue-500 disabled:opacity-50 disabled:pointer-events-none dark:bg-slate-900 dark:border-gray-700 dark:text-gray-400 dark:focus:ring-gray-600"></asp:Label>


                        </div>
                    </div>
                </div>

                <asp:HiddenField ID="lblReviewText" runat="server" Value="" />

                <asp:HiddenField ID="lblRenderText" runat="server" Value='' />


                <div class="mt-6 grid">
                    <asp:Button data-hs-overlay="#hs-modal-confirm" runat="server" OnClientClick="return false" ID="btnReview" class="w-full py-3 px-4 inline-flex justify-center items-center gap-x-2 text-sm font-semibold rounded-lg border border-transparent bg-blue-600 text-white hover:bg-blue-700 disabled:opacity-50 disabled:pointer-events-none dark:focus:outline-none dark:focus:ring-1 dark:focus:ring-gray-600" Text="Submit"></asp:Button>
                </div>

            </div>

        </div>
    </div>

    <div id="hs-modal-confirm" class="hs-overlay hidden w-full h-full fixed top-0 start-0 z-[100] overflow-x-hidden overflow-y-auto">
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
                        <h3 class="mb-2 text-2xl font-bold text-gray-800 dark:text-gray-200">Review Product
                        </h3>
                        <p class="text-gray-500">
                            Are you sure to review this product? (Review can only be edited once.)
                        </p>
                    </div>

                    <%-- Form --%>
                    <div class="mt-5">
                        <div class="grid gap-y-4">
                            <div class="flex justify-end items-center gap-x-2 py-3 px-2">
                                <asp:Button runat="server"
                                    Text="Confirm"
                                    ID="btnSubmitReview" OnClick="btnSubmitReview_Click"
                                    class="py-2 px-3 inline-flex items-center gap-x-2 text-sm font-semibold rounded-lg border border-transparent bg-teal-600 text-white hover:bg-teal-700 disabled:opacity-50 disabled:pointer-events-none dark:focus:outline-none dark:focus:ring-1 dark:focus:ring-gray-600"></asp:Button>
                                <button type="button" class="py-2 px-3 inline-flex items-center gap-x-2 text-sm font-medium rounded-lg border border-gray-200 bg-white text-gray-800 shadow-sm hover:bg-gray-50 disabled:opacity-50 disabled:pointer-events-none dark:bg-slate-900 dark:border-gray-700 dark:text-white dark:hover:bg-gray-800 dark:focus:outline-none dark:focus:ring-1 dark:focus:ring-gray-600"
                                    data-hs-overlay="#hs-modal-confirm">
                                    Close
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        document.addEventListener('DOMContentLoaded', function () {
            var radioButtons = document.querySelectorAll('input[name="hs-ratings-readonly"]');
            var lblRating = document.getElementById('<%= lblRating.ClientID %>');

            radioButtons.forEach(function (radioButton) {
                radioButton.addEventListener('click', function () {
                    lblRating.value = this.value;
                });
            });
        });
    </script>

    <script type="text/javascript">
        function setRatingByValue(value) {
            var radioButtons = document.querySelectorAll('input[name="hs-ratings-readonly"]');
            var lblRating = document.getElementById('<%= lblRating.ClientID %>').value;

            // Loop through radio buttons to find the one with a matching value
            radioButtons.forEach(function (radioButton) {
                if (radioButton.value === value) {
                    radioButton.click();
                }
            });
        }
    </script>

    <script type="module">
        // Tiptap
        import { Editor } from 'https://esm.sh/@tiptap/core';
        import Placeholder from 'https://esm.sh/@tiptap/extension-placeholder';
        import StarterKit from 'https://esm.sh/@tiptap/starter-kit';
        import Paragraph from 'https://esm.sh/@tiptap/extension-paragraph';
        import Bold from 'https://esm.sh/@tiptap/extension-bold';
        import Underline from 'https://esm.sh/@tiptap/extension-underline';
        import Link from 'https://esm.sh/@tiptap/extension-link';
        import BulletList from 'https://esm.sh/@tiptap/extension-bullet-list';
        import OrderedList from 'https://esm.sh/@tiptap/extension-ordered-list';
        import ListItem from 'https://esm.sh/@tiptap/extension-list-item';
        import Blockquote from 'https://esm.sh/@tiptap/extension-blockquote';
        var lblRenderText = document.getElementById('<%= lblRenderText.ClientID %>').value.toString();
        const editor = new Editor({
            element: document.querySelector('#hs-editor-tiptap [data-hs-editor-field]'),
            content: lblRenderText,
            extensions: [
                Placeholder.configure({
                    placeholder: 'Leave your comment here...',
                    emptyNodeClass: 'rmvDiv text-gray-600 dark:text-gray-400'
                }),
                StarterKit,
                Paragraph.configure({
                    HTMLAttributes: {
                        class: 'text-gray-600 dark:text-gray-400'
                    }
                }),
                Bold.configure({
                    HTMLAttributes: {
                        class: 'font-bold'
                    }
                }),
                Underline,
                Link.configure({
                    HTMLAttributes: {
                        class: 'inline-flex items-center gap-x-1 text-blue-600 decoration-2 hover:underline font-medium dark:text-white'
                    }
                }),
                BulletList.configure({
                    HTMLAttributes: {
                        class: 'list-disc list-inside text-gray-800 dark:text-white'
                    }
                }),
                OrderedList.configure({
                    HTMLAttributes: {
                        class: 'list-decimal list-inside text-gray-800 dark:text-white'
                    }
                }),
                ListItem,
                Blockquote.configure({
                    HTMLAttributes: {
                        class: 'text-gray-800 sm:text-xl dark:text-white'
                    }
                })
            ]
        });
        const actions = [
            {
                id: '#hs-editor-tiptap [data-hs-editor-bold]',
                fn: () => editor.chain().focus().toggleBold().run()
            },
            {
                id: '#hs-editor-tiptap [data-hs-editor-italic]',
                fn: () => editor.chain().focus().toggleItalic().run()
            },
            {
                id: '#hs-editor-tiptap [data-hs-editor-underline]',
                fn: () => editor.chain().focus().toggleUnderline().run()
            },
            {
                id: '#hs-editor-tiptap [data-hs-editor-strike]',
                fn: () => editor.chain().focus().toggleStrike().run()
            },
            {
                id: '#hs-editor-tiptap [data-hs-editor-link]',
                fn: () => {
                    const url = window.prompt('URL');
                    editor.chain().focus().extendMarkRange('link').setLink({ href: url }).run();
                }
            },
            {
                id: '#hs-editor-tiptap [data-hs-editor-ol]',
                fn: () => editor.chain().focus().toggleOrderedList().run()
            },
            {
                id: '#hs-editor-tiptap [data-hs-editor-ul]',
                fn: () => editor.chain().focus().toggleBulletList().run()
            },
            {
                id: '#hs-editor-tiptap [data-hs-editor-blockquote]',
                fn: () => editor.chain().focus().toggleBlockquote().run()
            },
            {
                id: '#hs-editor-tiptap [data-hs-editor-code]',
                fn: () => editor.chain().focus().toggleCode().run()
            }
        ];

        actions.forEach(({ id, fn }) => {
            const action = document.querySelector(id);

            if (action === null) return;

            action.addEventListener('click', fn);
        });

        editor.on('update', () => {
            const editorContent = editor.getHTML(); // Get the HTML content of the editor
            document.getElementById('<%= lblReviewText.ClientID %>').value = editorContent;
        });
        const editorContent = editor.getHTML(); // Get the HTML content of the editor
        document.getElementById('<%= lblReviewText.ClientID %>').value = editorContent;
        
    </script>
</asp:Content>
