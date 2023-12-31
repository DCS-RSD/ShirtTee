<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MainAdmin.Master" AutoEventWireup="true" CodeBehind="NoticeDetails.aspx.cs" Inherits="ShirtTee.admin.NoticeDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%-- Toast --%>
    <script>
        function showSuccessToast() {
            var status = '<%= Session["NoticeUpdated"] %>';
            if (status !== null && status !== undefined) {
                if (status == "success") {
                    toastr["success"]("Notice updated successfully.");
                } else {
                    toastr["error"]("Something went wrong.");
                }
            }
         <% Session.Remove("NoticeUpdated"); %>
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
                    <p class="text-red-500 text-sm text-gray-600 dark:text-gray-400">
                        * Indicates required field.
                    </p>
                </div>
                <%--End Title--%>

                <div class="grid grid-cols-4 gap-6">

                    <%--Notice Title--%>

                    <div class="col-span-1">
                        <label for="txtTitle" class="inline-block text-sm text-gray-800 mt-2.5 dark:text-gray-200">
                            Title <span class="text-red-500">*</span>
                        </label>
                    </div>

                    <div class="col-span-3">
                        <asp:TextBox ID="txtTitle" runat="server"
                            placeholder="Enter notice title"
                            class="cInput">
                        </asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvTitle" runat="server"
                            class="text-sm italic"
                            ControlToValidate="txtTitle"
                            ErrorMessage="Please enter a notice title." Display="Dynamic" ForeColor="Red">
                        </asp:RequiredFieldValidator>
                    </div>

                    <%--Notice Content--%>
                    <div class="col-span-1">
                        <label for="txtContent" class="inline-block text-sm text-gray-800 mt-2.5 dark:text-gray-200">
                            Content <span class="text-red-500">*</span>
                        </label>
                    </div>

                    <div class="col-span-3">
                        <asp:TextBox ID="txtContent" runat="server"
                            placeholder="Enter notice content"
                            class="cInput" TextMode="MultiLine" Rows="3">
                        </asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvContent" class="text-sm italic"
                            runat="server" ControlToValidate="txtContent"
                            ErrorMessage="Please enter a notice content."
                            Display="Dynamic"
                            ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>

                    <%-- Visibility --%>
                    <div class="col-span-1">
                        <label for="radVisibility" class="inline-block text-sm text-gray-800 mt-2.5 dark:text-gray-200">
                            Visibility <span class="text-red-500">*</span>
                        </label>
                    </div>
                    <div class="col-span-3">
                        <asp:RadioButtonList ID="radVisibility" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem class="px-4 text-sm text-gray-800 dark:text-gray-200" Value="is_all"> To everyone</asp:ListItem>
                            <asp:ListItem class="px-4 text-sm text-gray-800 dark:text-gray-200" Value="is_staff_only">  To staff only</asp:ListItem>
                        </asp:RadioButtonList>
                        <asp:RequiredFieldValidator ID="rfvVisibility" class="text-sm italic"
                            runat="server"
                            ControlToValidate="radVisibility"
                            InitialValue=""
                            Display="Dynamic"
                            ErrorMessage="Please select an option"
                            ForeColor="Red">
                        </asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" class="text-sm italic"
                            ControlToValidate="radVisibility"
                            ValidationExpression="^(is_all|is_staff_only)$"
                            ErrorMessage='Please enter "To Everyone" or "To Staff Only".'
                            Display="Dynamic"
                            ForeColor="Red"
                            runat="server">
                        </asp:RegularExpressionValidator>
                    </div>

                    <div class="col-span-4 sm:col-span-1 sm:col-start-3">
                        <asp:Button ID="btnSubmit" runat="server" Text="Save Changes" OnClick="btnSubmit_Click"
                            class="w-full justify-center py-2 px-3 inline-flex items-center gap-x-2 text-sm font-semibold rounded-lg border border-transparent bg-blue-600 text-white hover:bg-blue-700 disabled:opacity-50 disabled:pointer-events-none dark:focus:outline-none dark:focus:ring-1 dark:focus:ring-gray-600"></asp:Button>
                    </div>
                    <div class="col-span-4 sm:col-span-1">
                        <button type="button"
                            class="w-full justify-center py-2 px-3 inline-flex items-center gap-x-2 text-sm font-semibold rounded-lg border border-transparent bg-red-600 text-white hover:bg-red-700 disabled:opacity-50 hover:cursor-pointer dark:focus:outline-none dark:focus:ring-1 dark:focus:ring-gray-600"
                            data-hs-overlay="#hs-modal-delete">
                            Delete
                        </button>
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
                                    <h3 class="mb-2 text-2xl font-bold text-gray-800 dark:text-gray-200">Delete Notice
                                    </h3>
                                    <p class="text-gray-500">
                                        Are you sure to delete this notice?
                                    </p>
                                </div>

                                <%-- Form --%>
                                <div class="mt-5">
                                    <div class="grid gap-y-4">
                                        <div class="flex justify-end items-center gap-x-2 py-3 px-2">
                                            <asp:Button runat="server"
                                                Text="Delete Notice"
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

            </asp:Panel>


        </div>
    </div>

</asp:Content>
