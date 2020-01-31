<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Synerscope.aspx.cs" Inherits="Synerscope.Synerscope" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="float:left">
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="PersoonID" DataSourceID="SynerscopeDS" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" ShowDeleteButton="True" />
                    <asp:BoundField DataField="Voornaam" HeaderText="Voornaam" SortExpression="Voornaam" />
                    <asp:BoundField DataField="Achternaam" HeaderText="Achternaam" SortExpression="Achternaam" />
                </Columns>
            </asp:GridView>
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="PersoonHobbyID" DataSourceID="PersoonHobbyDS">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="HobbyID" HeaderText="HobbyID" SortExpression="HobbyID" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="PersoonHobbyDS" runat="server" ConnectionString="<%$ ConnectionStrings:PersoonConnectionString %>" SelectCommand="SELECT * FROM [PersoonHobby] WHERE ([PersoonID] = @PersoonID)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="GridView1" Name="PersoonID" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SynerscopeDS" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:PersoonConnectionString %>" DeleteCommand="DELETE FROM [Persoon] WHERE [PersoonID] = @original_PersoonID AND (([Voornaam] = @original_Voornaam) OR ([Voornaam] IS NULL AND @original_Voornaam IS NULL)) AND (([Achternaam] = @original_Achternaam) OR ([Achternaam] IS NULL AND @original_Achternaam IS NULL)) AND (([DEL] = @original_DEL) OR ([DEL] IS NULL AND @original_DEL IS NULL))" InsertCommand="INSERT INTO [Persoon] ([Voornaam], [Achternaam], [DEL]) VALUES (@Voornaam, @Achternaam, @DEL)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Persoon]" UpdateCommand="UPDATE [Persoon] SET [Voornaam] = @Voornaam, [Achternaam] = @Achternaam, [DEL] = @DEL WHERE [PersoonID] = @original_PersoonID AND (([Voornaam] = @original_Voornaam) OR ([Voornaam] IS NULL AND @original_Voornaam IS NULL)) AND (([Achternaam] = @original_Achternaam) OR ([Achternaam] IS NULL AND @original_Achternaam IS NULL)) AND (([DEL] = @original_DEL) OR ([DEL] IS NULL AND @original_DEL IS NULL))">
                <DeleteParameters>
                    <asp:Parameter Name="original_PersoonID" Type="Int32" />
                    <asp:Parameter Name="original_Voornaam" Type="String" />
                    <asp:Parameter Name="original_Achternaam" Type="String" />
                    <asp:Parameter Name="original_DEL" Type="Boolean" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Voornaam" Type="String" />
                    <asp:Parameter Name="Achternaam" Type="String" />
                    <asp:Parameter Name="DEL" Type="Boolean" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Voornaam" Type="String" />
                    <asp:Parameter Name="Achternaam" Type="String" />
                    <asp:Parameter Name="DEL" Type="Boolean" />
                    <asp:Parameter Name="original_PersoonID" Type="Int32" />
                    <asp:Parameter Name="original_Voornaam" Type="String" />
                    <asp:Parameter Name="original_Achternaam" Type="String" />
                    <asp:Parameter Name="original_DEL" Type="Boolean" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataKeyNames="HobbyID" DataSourceID="dsHobby">
                <Columns>
                    <asp:BoundField DataField="HobbyNaam" HeaderText="HobbyNaam" SortExpression="HobbyNaam" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="dsHobby" runat="server" ConnectionString="<%$ ConnectionStrings:PersoonConnectionString %>" SelectCommand="SELECT * FROM [Hobby] WHERE ([HobbyID] = @HobbyID)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="GridView2" Name="HobbyID" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
        <div style="float:left; margin-left:20px">
            <asp:Label ID="Label1" runat="server" Text="Voornaam"></asp:Label><br />
            <asp:TextBox ID="txtVoornaam" runat="server"></asp:TextBox><br />
            <asp:Label ID="Label2" runat="server" Text="Achternaam"></asp:Label><br />
            <asp:TextBox ID="txtAchternaam" runat="server"></asp:TextBox><br />
            <asp:Button ID="btnPersoonToevoegen" runat="server" Text="Persoon toevoegen" OnClick="btnPersoonToevoegen_Click" />
        </div>
        <div style="float:left; margin-left:20px">
            <asp:Label ID="Label3" runat="server" Text="Persoon"></asp:Label><br />
            <asp:DropDownList ID="ddlPersoon" runat="server" AutoPostBack="True" DataSourceID="dsHobbyAanPersoon" DataTextField="Naam" DataValueField="PersoonID"></asp:DropDownList><br />
            <asp:SqlDataSource ID="dsHobbyAanPersoon" runat="server" ConnectionString="<%$ ConnectionStrings:PersoonConnectionString %>" SelectCommand="HobbyAanPersoon" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
            <asp:Label ID="Label4" runat="server" Text="Hobby"></asp:Label><br />
            <asp:DropDownList ID="ddlHobby" runat="server" AutoPostBack="True" DataSourceID="dsHobbyAanPersoonH" DataTextField="HobbyNaam" DataValueField="HobbyID"></asp:DropDownList>
            <asp:SqlDataSource ID="dsHobbyAanPersoonH" runat="server" ConnectionString="<%$ ConnectionStrings:PersoonConnectionString %>" SelectCommand="HobbyAanPersoonH" SelectCommandType="StoredProcedure"></asp:SqlDataSource><br />
            <asp:Button ID="btnHobbyToevoegenAanPersoon" runat="server" Text="Hobby toevoegen aan persoon" OnClick="btnHobbyToevoegenAanPersoon_Click" />
        </div>
    </form>
</body>
</html>
