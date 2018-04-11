<%@ Page Title="" Language="C#" MasterPageFile="~/dashboard/contador/Maestra.master" AutoEventWireup="true" CodeFile="PresupuestoBecario.aspx.cs" Inherits="dashboard_contador_PresupuestoBecario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contenidoDePagina" runat="Server">
    <form id="Form1" name="menuEstu" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div class="row">
                    <div class="container">
                        <div class="col s12 m12">
                            <p style="font-size: 20px;"><i class="material-icons left">filter_list</i>Filtros</p>
                        </div>
                        <div class="col s12 m3">
                            <label>Programas:</label>
                            <asp:DropDownList ID="ddlProgramasBecas" CssClass="browser-default" runat="server"></asp:DropDownList>
                        </div>
                        <div class="col s12 m3">
                            <label>Universidades:</label>
                            <asp:DropDownList ID="ddlUniversidad" CssClass="browser-default" runat="server"></asp:DropDownList>
                        </div>
                        <div class="col s12 m3">
                            <label>Carreras:</label>
                            <asp:DropDownList ID="ddlCarrera" CssClass="browser-default" runat="server"></asp:DropDownList>
                        </div>
                        <div class="col s12 m3">
                            <label>Estado del becario</label>
                            <asp:DropDownList ID="ddlEstado" CssClass="browser-default" runat="server">
                                <asp:ListItem Value="1">Activo</asp:ListItem>
                                <asp:ListItem Value="2">Finalizado</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="col s12 m12 center-align">
                            <p></p>
                            <asp:Button ID="btnBuscarAlumnos" runat="server" CssClass="btn blue white-text" Text="Buscar Alumnos" OnClick="btnBuscarAlumnos_Click" />
                            <p></p>
                        </div>
                        <div class="col s12 m12">
                            <div class="divider"></div>
                            <label>Codigos de Estudiantes(dependiendo de los filtros seleccionados)</label>
                            <asp:DropDownList ID="ddlAlumnos" CssClass="browser-default" runat="server"></asp:DropDownList>
                        </div>
                        <div class="col s12 m12 center-align">
                            <p></p>
                            <asp:Button ID="btnBuscarExpediente" runat="server" CssClass="btn blue white-text" Text="Buscar Presupuesto Alumno" OnClick="btnBuscarExpediente_Click" />
                        </div>
                        <div class="col s12 m12 center-align">
                            <p></p>
                            <div class="divider"></div>
                            <p></p>
                            <asp:Label ID="codigo" Font-Size="30px" Font-Bold="true" Visible="false" runat="server"></asp:Label>
                        </div>
                        <div class="col s12 m12 center-align">
                            <p></p>
                            <div class="divider"></div>
                            <p></p>
                            <asp:Label ID="datosP" Font-Size="Larger" Visible="false" runat="server">Presupuesto del Becario</asp:Label>
                            <p></p>
                        </div>
                        <div class="col s12 m6 center-align">
                            <asp:Button ID="agregarAspecto" Visible="false" runat="server" CssClass="btn blue white-text" Text="Agregar Aspecto Presupuesto" OnClick="agregarAspecto_Click" />
                            <p></p>
                        </div>
                        <div class="col s12 m6 center-align">
                            <asp:Button ID="agregarDesembolso" Visible="false" runat="server" CssClass="btn blue white-text" Text="Agregar Desembolso" OnClick="agregarDesembolso_Click" />
                            <p></p>
                        </div>
                        <div class="col s12 m12">
                            <asp:GridView ID="GridView1" CssClass="striped responsive-table" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Visible="False" DataKeyNames="id">
                                <Columns>
                                    <asp:BoundField DataField="id" HeaderText="id" SortExpression="id" Visible="False" InsertVisible="False" />
                                    <asp:BoundField DataField="aspecto" HeaderText="Nombre Aspecto" SortExpression="aspecto" />
                                    <asp:BoundField DataField="principal" HeaderText="Monto Principal" SortExpression="principal" />
                                    <asp:BoundField DataField="ejecutado" HeaderText="Monto Ejecutado" SortExpression="ejecutado" />
                                    <asp:BoundField DataField="faltante" HeaderText="Monto Restastante" SortExpression="faltante" />
                                </Columns>
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CadenaConexion %>" SelectCommand="SELECT pd.id as id,a.nombre as aspecto, pd.monto as principal, SUM(d.monto) as ejecutado, (pd.monto-SUM(d.monto)) as faltante FROM ((((presupuesto_detalle AS pd INNER JOIN aspecto AS a ON pd.id_aspecto=a.id)INNER JOIN presupuesto_maestro as pm ON pd.id_maestro=pm.id)INNER JOIN becario AS b ON pm.id_becario=b.id)FULL OUTER JOIN desembolso AS d ON d.id_presupuestoD=pd.id) WHERE b.id=@codi GROUP BY pd.id,a.nombre,pd.monto
">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ddlAlumnos" Name="codi" PropertyName="SelectedValue" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</asp:Content>

