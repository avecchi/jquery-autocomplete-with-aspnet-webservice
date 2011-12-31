<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Autocomplete</title>
    <link type="text/css" href="css/ui-lightness/jquery-ui-1.8.16.custom.css" rel="stylesheet" />	
    <script src="js/jquery-1.6.2.min.js" type="text/javascript"></script>
    <script src="js/jquery-ui-1.8.16.custom.min.js" type="text/javascript"></script>

    <script type="text/javascript">

        $(document).ready(function () {
            SetupAutocomplete();
        });

        function SetupAutocomplete() {
            $(":input[data-autocomplete]").each(function () {
                var autocompleteUrl = $(this).attr("data-autocomplete");
                $(this).autocomplete({
                    source: function (request, response) {
                        $.ajax({
                            url: autocompleteUrl,
                            data: "{ 'q': '" + request.term + "', 'limit': '10' }",
                            dataType: "json",
                            type: "POST",
                            contentType: "application/json; charset=utf-8",
                            success: function (data) {
                                response(data.d);
                            }
                        });
                    }
                });
            });
        }

    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <p>
            Esempio di autocomplete con jquery UI usando un WebService Asp.Net
        </p>
        <p>
            Seleziona la città:
            <asp:TextBox ID="tbCitta" runat="server" data-autocomplete="/Service.asmx/GetCities"></asp:TextBox>
        </p>
    </div>
    </form>
</body>
</html>
