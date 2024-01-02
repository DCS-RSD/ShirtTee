<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ShirtTee.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ShirtTee</title>
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
    <script>
        toastr.options = {
            "closeButton": true,
            "debug": false,
            "newestOnTop": false,
            "progressBar": true,
            "positionClass": "toast-bottom-center",
            "preventDuplicates": false,
            "onclick": null,
            "showDuration": "300",
            "hideDuration": "1000",
            "timeOut": "5000",
            "extendedTimeOut": "1000",
            "showEasing": "swing",
            "hideEasing": "linear",
            "showMethod": "fadeIn",
            "hideMethod": "fadeOut"
        }
    </script>
    <script>
        function showSuccessToast() {
            var status = '<%= Session["LoginValidate"] %>';
            console.log(status);
            if (status !== null && status !== undefined) {
                if (status == "invalidUser") {
                    toastr["error"]("Email doesn't exists.")
                }
                else if (status == "notMatch") {
                    toastr["error"]("Email or password invalid.");
                }
                else if (status == "resetPwd") {
                    toastr["success"]("Password reset successfully.");
                }
            }
            var status2 = '<%= Session["SigninValidate"] %>'
            if (status2 !== null && status2 !== undefined) {
                if (status2 == "validSignin") {
                    toastr["success"]("Create account successfully.")
                }
            }
        <% Session.Remove("LoginValidate"); %>
        <% Session.Remove("SigninValidate"); %>
        }
    </script>
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
                            <h2 class="block text-2xl font-bold text-gray-800 dark:text-gray-200">Sign in</h2>
                            <p class="mt-2 text-sm text-gray-600 dark:text-gray-400">
                                Don't have an account yet?
            <asp:HyperLink runat="server" class="text-blue-600 decoration-2 hover:underline font-medium dark:focus:outline-none dark:focus:ring-1 dark:focus:ring-gray-600" NavigateUrl="~/Signup.aspx">Sign up here
            </asp:HyperLink>
                            </p>
                        </div>

                        <div class="mt-5">

                            <!-- Form -->

                            <div class="grid gap-y-4">
                                <!-- Form Group -->
                                <div>
                                    <asp:Label runat="server" for="email" class="block text-sm mb-2 dark:text-white">Email address</asp:Label>
                                    <div class="relative">
                                        <asp:TextBox runat="server" ID="signinEmail" class="py-3 px-4 block w-full border-gray-200 rounded-lg text-sm focus:border-blue-500 focus:ring-blue-500 disabled:opacity-50 disabled:pointer-events-none dark:bg-slate-900 dark:border-gray-700 dark:text-gray-400 dark:focus:ring-gray-600" aria-describedby="signInEmailError" TextMode="Email" />
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="signinEmail" Display="Dynamic" ErrorMessage="Please enter your email address" ForeColor="Red" ValidationGroup="LoginValidation" CssClass="text-sm italic" />
                                        <asp:RegularExpressionValidator runat="server" ControlToValidate="signinEmail" Display="Dynamic" ErrorMessage="Please enter a valid email address" ForeColor="Red" ValidationExpression="\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b" ValidationGroup="LoginValidation" CssClass="text-sm italic" />
                                        <div class="hidden absolute inset-y-0 end-0 flex items-center pointer-events-none pe-3">
                                            <svg class="h-5 w-5 text-red-500" width="16" height="16" fill="currentColor" viewBox="0 0 16 16" aria-hidden="true">
                                                <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM8 4a.905.905 0 0 0-.9.995l.35 3.507a.552.552 0 0 0 1.1 0l.35-3.507A.905.905 0 0 0 8 4zm.002 6a1 1 0 1 0 0 2 1 1 0 0 0 0-2z" />
                                            </svg>
                                        </div>
                                    </div>
                                    <p class="hidden text-xs text-red-600 mt-2" id="signInEmailError">Please include a valid email address so we can get back to you</p>
                                </div>
                                <!-- End Form Group -->

                                <!-- Form Group -->
                                <div>
                                    <div class="flex justify-between items-center">
                                        <asp:Label runat="server" for="password" class="block text-sm mb-2 dark:text-white">Password</asp:Label>
                                        <asp:HyperLink runat="server" NavigateUrl="~/ForgetPassword.aspx" class="text-sm text-blue-600 decoration-2 hover:underline font-medium dark:focus:outline-none dark:focus:ring-1 dark:focus:ring-gray-600">Forgot password?</asp:HyperLink>
                                    </div>
                                    <div class="relative">
                                        <asp:TextBox runat="server" ID="signInPassword" name="password" class="py-3 px-4 block w-full border-gray-200 rounded-lg text-sm focus:border-blue-500 focus:ring-blue-500 disabled:opacity-50 disabled:pointer-events-none dark:bg-slate-900 dark:border-gray-700 dark:text-gray-400 dark:focus:ring-gray-600" aria-describedby="signInPasswordError" TextMode="Password" />
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="signInPassword" Display="Dynamic" ErrorMessage="Please enter your password" ForeColor="Red" ValidationGroup="LoginValidation" CssClass="text-sm italic" />
                                        <button type="button" data-hs-toggle-password='{
                "target": "#signInPassword"
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
                                                <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM8 4a.905.905 0 0 0-.9.995l.35 3.507a.552.552 0 0 0 1.1 0l.35-3.507A.905.905 0 0 0 8 4zm.002 6a1 1 0 1 0 0 2 1 1 0 0 0 0-2z" />
                                            </svg>
                                        </div>
                                    </div>
                                    <p class="hidden text-xs text-red-600 mt-2" id="signInPasswordError">8+ characters required</p>
                                </div>
                                <!-- End Form Group -->

                                <!-- Checkbox -->
                                <div class="flex items-center">
                                    <div>
                                        <asp:CheckBox runat="server" ID="chkRememberMe" OnCheckedChanged="chkRememberMe_CheckedChanged" class="focus:ring-indigo-500 h-4 w-4 text-indigo-600 border-gray-300 rounded" />
                                    </div>
                                    <div class="ms-3">
                                        <asp:Label runat="server" for="remember-me" class="text-sm dark:text-white">Remember me</asp:Label>
                                    </div>
                                </div>
                                <!-- End Checkbox -->

                                <asp:Button runat="server" ID="btnLogin" ValidationGroup="LoginValidation" OnClick="btnLogin_Click" class="w-full py-3 px-4 inline-flex justify-center items-center gap-x-2 text-sm font-semibold rounded-lg border border-transparent bg-blue-600 text-white hover:bg-blue-700 disabled:opacity-50 disabled:pointer-events-none dark:focus:outline-none dark:focus:ring-1 dark:focus:ring-gray-600" Text="Sign in"></asp:Button>
                            </div>
                            <div class="text-center mt-4">

                                <asp:HyperLink runat="server" class="w-full py-3 px-4 inline-flex justify-center items-center gap-x-2 text-sm font-medium rounded-lg border border-gray-200 bg-white text-gray-800 shadow-sm hover:bg-gray-50 disabled:opacity-50 disabled:pointer-events-none dark:bg-slate-900 dark:border-gray-700 dark:text-white dark:hover:bg-gray-800 dark:focus:outline-none dark:focus:ring-1 dark:focus:ring-gray-600" NavigateUrl="Homepage.aspx">Continue as a guest</asp:HyperLink>
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
