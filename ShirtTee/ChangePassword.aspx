<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="ShirtTee.ChangePassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="./dist/output.css" rel="stylesheet" />
    <script defer src="https://cdn.jsdelivr.net/npm/alpinejs@3.13.3/dist/cdn.min.js"></script>
    <script src="../dist/preline.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.2.0/datepicker.min.js"></script>
    <style>
        @layer utilities {
            input[type="number"]::-webkit-inner-spin-button,
            input[type="number"]::-webkit-outer-spin-button {
                -webkit-appearance: none;
                margin: 0;
            }
        }
    </style>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>

</head>
<body>
    <header class="flex flex-wrap sm:justify-start sm:flex-nowrap z-50 w-full bg-white border-b text-sm py-4 dark:bg-slate-900 dark:border-gray-700">
        <nav class="flex items-center justify-center w-full " aria-label="Global">
            <div class="m-auto">
                <a id="linkHomepage" class="flex-none text-xl font-semibold dark:text-white dark:focus:outline-none dark:focus:ring-1 dark:focus:ring-gray-600" aria-label="Brand" href="Homepage.aspx">SHIRTTEE</a>
            </div>

        </nav>
    </header>
    <form id="formLogin" runat="server">
        <div id="hs-modal-signin" class="flex justify-center items-center hs-overlay w-full h-full fixed top-0 start-0 z-[60] overflow-x-hidden overflow-y-auto">
            <div class=" max-w-lg w-full mx-auto my-auto">
                <div class="relative bg-white border border-gray-200 rounded-xl shadow-sm dark:bg-gray-800 dark:border-gray-700">
                    <div class="px-4 sm:p-7">
                        <div class="text-center">
                            <h2 class="block text-2xl font-bold text-gray-800 dark:text-gray-200">Change Password</h2>
                        </div>

                        <div class="mt-5">

                            <!-- Form -->

                            <div class="grid gap-y-4">
                                <!-- Form Group -->
                                <div>
                                    <asp:Label runat="server" for="password" class="block text-sm mb-2 dark:text-white">Current Password</asp:Label>
                                    <div class="relative">
                                        <asp:TextBox runat="server" ID="txtCurPwd" class="py-3 px-4 block w-full border-gray-200 rounded-lg text-sm focus:border-blue-500 focus:ring-blue-500 disabled:opacity-50 disabled:pointer-events-none dark:bg-slate-900 dark:border-gray-700 dark:text-gray-400 dark:focus:ring-gray-600" aria-describedby="signupPasswordError" TextMode="Password" />
                                        <asp:RequiredFieldValidator runat="server" ValidationGroup="SigninValidation" ControlToValidate="txtCurPwd" Display="Dynamic" ErrorMessage="Password is required" ForeColor="Red" ID="RequiredFieldValidator1" CssClass="text-sm italic" />
                                        <asp:CustomValidator ID="CustomValidator1" runat="server" OnServerValidate="CustomValidator1_ServerValidate" ValidationGroup="SigninValidation"  ErrorMessage="The current password is incorrect." ControlToValidate="txtCurPwd" Display="Dynamic" ForeColor="Red" CssClass="text-sm italic"></asp:CustomValidator>
                                        <button type="button" data-hs-toggle-password='{
                "target": "#txtCurPwd"
              }'
                                            class="absolute top-0 end-0 p-3.5 rounded-e-md dark:focus:outline-none dark:focus:ring-1 dark:focus:ring-gray-600">
                                            <svg class="flex-shrink-0 w-3.5 h-3.5 text-gray-400 dark:text-gray-600" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                                <path class="hs-password-active:hidden" d="M9.88 9.88a3 3 0 1 0 4.24 4.24" />
                                                <path class="hs-password-active:hidden" d="M10.73 5.08A10.43 10.43 0 0 1 12 5c7 0 10 7 10 7a13.16 13.16 0 0 1-1.67 2.68" />
                                                <path class="hs-password-active:hidden" d="M6.61 6.61A13.526 13.526 0 0 0 2 12s3 7 10 7a9.74 9.74 0 0 0 5.39-1.61" />
                                                <line class="hs-password-active:hidden" x1="2" x2="22" y1="2" y2="22" />
                                                <path class="hidden hs-password-active:block" d="M2 12s3-7 10-7 10 7 10 7-3 7-10 7-10-7-10-7Z" />
                                                <circle class="hidden hs-password-active:block" cx="12" cy="12" r="3" />
                                            </svg>
                                        </button>
                                        <div class="hidden absolute inset-y-0 end-0 flex items-center pointer-events-none pe-3">
                                            <svg class="h-5 w-5 text-red-500" width="16" height="16" fill="currentColor" viewBox="0 0 16 16" aria-hidden="true">
                                                <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM8 4a.905.905 0 0 0-.9.995l.35 3.507a.552.552 0 0 0 1.1 0l.35-3.507A.905.905 0 0 0 8 4zm.002 6a1 1 0 1 0 0 2 1 1 0 0 0 0-2z"></path>
                                            </svg>
                                        </div>
                                    </div>
                                    <p class="hidden text-xs text-red-600 mt-2" id="signupPasswordError">8+ characters required</p>
                                </div>
                                <!-- End Form Group -->

                                <!-- Form Group -->
                                <div>
                                    <asp:Label runat="server" for="password" class="block text-sm mb-2 dark:text-white">New Password</asp:Label>
                                    <div class="relative">
                                        <asp:TextBox runat="server" ID="txtNewPwd" class="py-3 px-4 block w-full border-gray-200 rounded-lg text-sm focus:border-blue-500 focus:ring-blue-500 disabled:opacity-50 disabled:pointer-events-none dark:bg-slate-900 dark:border-gray-700 dark:text-gray-400 dark:focus:ring-gray-600" aria-describedby="signupPasswordError" TextMode="Password" />
                                        <asp:RequiredFieldValidator runat="server" ValidationGroup="SigninValidation" ControlToValidate="txtNewPwd" Display="Dynamic" ErrorMessage="New password is required" ForeColor="Red" ID="rfvPassword" CssClass="text-sm italic" />
                                        <asp:RegularExpressionValidator runat="server" ValidationGroup="SigninValidation" ControlToValidate="txtNewPwd" Display="Dynamic" ErrorMessage="Password must be at least 8 characters and include uppercase, lowercase, numbers, and symbols" ForeColor="Red" ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[^\da-zA-Z]).{8,}$" ID="revPassword" CssClass="text-sm italic" />
                                        <asp:CompareValidator ID="CompareValidator1"  ValidationGroup="SigninValidation"  runat="server" ControlToValidate="txtNewPwd" ControlToCompare="txtCurPwd" Operator="NotEqual" Display="Dynamic" ErrorMessage="New password cannot same with old password" ForeColor="Red" CssClass="text-sm italic"></asp:CompareValidator>
                                        <button type="button" data-hs-toggle-password='{
                "target": "#txtNewPwd"
              }'
                                            class="absolute top-0 end-0 p-3.5 rounded-e-md dark:focus:outline-none dark:focus:ring-1 dark:focus:ring-gray-600">
                                            <svg class="flex-shrink-0 w-3.5 h-3.5 text-gray-400 dark:text-gray-600" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                                <path class="hs-password-active:hidden" d="M9.88 9.88a3 3 0 1 0 4.24 4.24" />
                                                <path class="hs-password-active:hidden" d="M10.73 5.08A10.43 10.43 0 0 1 12 5c7 0 10 7 10 7a13.16 13.16 0 0 1-1.67 2.68" />
                                                <path class="hs-password-active:hidden" d="M6.61 6.61A13.526 13.526 0 0 0 2 12s3 7 10 7a9.74 9.74 0 0 0 5.39-1.61" />
                                                <line class="hs-password-active:hidden" x1="2" x2="22" y1="2" y2="22" />
                                                <path class="hidden hs-password-active:block" d="M2 12s3-7 10-7 10 7 10 7-3 7-10 7-10-7-10-7Z" />
                                                <circle class="hidden hs-password-active:block" cx="12" cy="12" r="3" />
                                            </svg>
                                        </button>
                                        <div class="hidden absolute inset-y-0 end-0 flex items-center pointer-events-none pe-3">
                                            <svg class="h-5 w-5 text-red-500" width="16" height="16" fill="currentColor" viewBox="0 0 16 16" aria-hidden="true">
                                                <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM8 4a.905.905 0 0 0-.9.995l.35 3.507a.552.552 0 0 0 1.1 0l.35-3.507A.905.905 0 0 0 8 4zm.002 6a1 1 0 1 0 0 2 1 1 0 0 0 0-2z"></path>
                                            </svg>
                                        </div>
                                    </div>
                                    <p class="hidden text-xs text-red-600 mt-2" id="signupPasswordError">8+ characters required</p>
                                </div>
                                <!-- End Form Group -->

                                <!-- Form Group -->
                                <div class="mb-4">
                                    <asp:Label runat="server" for="confirm-password" class="block text-sm mb-2 dark:text-white">Confirm New Password</asp:Label>
                                    <div class="relative">
                                        <asp:TextBox runat="server" ID="txtConPwd" ValidationGroup="SigninValidation" class="py-3 px-4 block w-full border-gray-200 rounded-lg text-sm focus:border-blue-500 focus:ring-blue-500 disabled:opacity-50 disabled:pointer-events-none dark:bg-slate-900 dark:border-gray-700 dark:text-gray-400 dark:focus:ring-gray-600" aria-describedby="signupConfirmPasswordError" TextMode="Password" />
                                        <asp:RequiredFieldValidator runat="server" ValidationGroup="SigninValidation" ControlToValidate="txtConPwd" Display="Dynamic" ErrorMessage="Please confirm the new password" ForeColor="Red" ID="rfvConfirmPassword" CssClass="text-sm italic" />
                                        <asp:CompareValidator runat="server" ValidationGroup="SigninValidation" ControlToValidate="txtConPwd" ControlToCompare="txtNewPwd" Display="Dynamic" ErrorMessage="Password does not match" ForeColor="Red" ID="cvConfirmPassword" CssClass="text-sm italic" />
                                        <button type="button" data-hs-toggle-password='{
                "target": "#txtConPwd"
              }'
                                            class="absolute top-0 end-0 p-3.5 rounded-e-md dark:focus:outline-none dark:focus:ring-1 dark:focus:ring-gray-600">
                                            <svg class="flex-shrink-0 w-3.5 h-3.5 text-gray-400 dark:text-gray-600" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                                <path class="hs-password-active:hidden" d="M9.88 9.88a3 3 0 1 0 4.24 4.24" />
                                                <path class="hs-password-active:hidden" d="M10.73 5.08A10.43 10.43 0 0 1 12 5c7 0 10 7 10 7a13.16 13.16 0 0 1-1.67 2.68" />
                                                <path class="hs-password-active:hidden" d="M6.61 6.61A13.526 13.526 0 0 0 2 12s3 7 10 7a9.74 9.74 0 0 0 5.39-1.61" />
                                                <line class="hs-password-active:hidden" x1="2" x2="22" y1="2" y2="22" />
                                                <path class="hidden hs-password-active:block" d="M2 12s3-7 10-7 10 7 10 7-3 7-10 7-10-7-10-7Z" />
                                                <circle class="hidden hs-password-active:block" cx="12" cy="12" r="3" />
                                            </svg>
                                        </button>
                                        <div class="hidden absolute inset-y-0 end-0 flex items-center pointer-events-none pe-3">
                                            <svg class="h-5 w-5 text-red-500" width="16" height="16" fill="currentColor" viewBox="0 0 16 16" aria-hidden="true">
                                                <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM8 4a.905.905 0 0 0-.9.995l.35 3.507a.552.552 0 0 0 1.1 0l.35-3.507A.905.905 0 0 0 8 4zm.002 6a1 1 0 1 0 0 2 1 1 0 0 0 0-2z"></path>
                                            </svg>
                                        </div>
                                    </div>
                                    <p class="hidden text-xs text-red-600 mt-2" id="signupConfirmPasswordError">Password does not match the password</p>
                                </div>
                                <!-- End Form Group -->

                                <asp:Button runat="server" ID="btnChange" OnClick="btnChange_Click" ValidationGroup="SigninValidation" class="w-full py-3 px-4 inline-flex justify-center items-center gap-x-2 text-sm font-semibold rounded-lg border border-transparent bg-blue-600 text-white hover:bg-blue-700 disabled:opacity-50 disabled:pointer-events-none dark:focus:outline-none dark:focus:ring-1 dark:focus:ring-gray-600" Text="Reset Password"></asp:Button>
                            </div>
                            <div class="text-center mt-4 mb-2">
                                <asp:HyperLink runat="server" class="w-full py-3 px-4 inline-flex justify-center items-center gap-x-2 text-sm font-medium rounded-lg border border-gray-200 bg-white text-gray-800 shadow-sm hover:bg-gray-50 disabled:opacity-50 disabled:pointer-events-none dark:bg-slate-900 dark:border-gray-700 dark:text-white dark:hover:bg-gray-800 dark:focus:outline-none dark:focus:ring-1 dark:focus:ring-gray-600" NavigateUrl="~/customer/Profile.aspx">Back to Profile</asp:HyperLink>
                            </div>

                            <div class="text-center mt-4">
                                <asp:Label runat="server" Style="display: none" class="text-sm italic font-medium text-c" ID="lblMsg" Text="Please check your email to get the password reset link. If you cannot find the email, try to look at spam email."></asp:Label>

                            </div>
                            <!-- End Form -->
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </form>
</body>

</html>

