<%@ Page Title="" Language="C#" MasterPageFile="~/dashboard/gestor/Maestra.master" AutoEventWireup="true" CodeFile="PresupuestoBecarioD.aspx.cs" Inherits="dashboard_gestor_PresupuestoBecarioD" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contenidoDePagina" runat="Server">
    <form runat="server">
          <div class="row">
        <h3 class="center-align">Presupuesto especifico</h3>

        <div class="col s12 m12">
            <div class="container">
                <asp:GridView CssClass="highlight" ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" DataKeyNames="nombre">
                    <Columns>
                        <asp:BoundField DataField="nombre" HeaderText="Aspecto" SortExpression="nombre" ReadOnly="True"></asp:BoundField>
                        <asp:BoundField DataField="monto" HeaderText="Saldo original" SortExpression="monto" />
                        <asp:BoundField DataField="gasto" HeaderText="Gastado" SortExpression="gasto" />
                        <asp:BoundField DataField="fecha" HeaderText="Fecha" SortExpression="fecha" />
                        <asp:CommandField HeaderText="Seleccionar" ShowSelectButton="True" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:CadenaConexion %>"
                    SelectCommand="select a.nombre,dp.monto,de.monto as gasto,de.fecha from ((((becario b inner join presupuesto_maestro pm on b.id=pm.id_becario) inner join presupuesto_detalle dp on pm.id=dp.id_maestro) inner join aspecto a on a.id=dp.id_aspecto)inner join desembolso de on de.id_presupuestoD=dp.id and b.id=@codigo)">
                    <SelectParameters>

                        <asp:QueryStringParameter QueryStringField="id" Name="codigo"/>
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </div>
    </div>
    </form>
</asp:Content>

