<%@ Page Title="" Language="C#" MasterPageFile="~/dashboard/contador/Maestra.master" AutoEventWireup="true" CodeFile="BitacoraBecario.aspx.cs" Inherits="dashboard_contador_BitacoraBecario" %>

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
                            <asp:Button ID="btnBuscarExpediente" runat="server" CssClass="btn blue white-text" Text="Buscar Bitacora Alumno" OnClick="btnBuscarExpediente_Click" />
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
                            <asp:Label ID="datosP" Font-Size="Larger" Visible="false" runat="server">Incidentes del Becario</asp:Label>
                            <p></p>
                        </div>
                        <div class="col s12 m12">
                            <asp:GridView ID="GridView1" CssClass="striped responsive-table" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Visible="False" DataKeyNames="id">
                                <Columns>
                                    <asp:BoundField DataField="id" HeaderText="id" SortExpression="id" ReadOnly="True" Visible="False" InsertVisible="False" />
                                    <asp:BoundField DataField="nombre Becario" HeaderText="Nombre Becario" SortExpression="nombre Becario" ReadOnly="True" />
                                    <asp:BoundField DataField="detalle" HeaderText="Motivo de Incidente" SortExpression="detalle" />
                                    <asp:BoundField DataField="nombre Usuario" HeaderText="Usuario que realizo el registro" ReadOnly="True" SortExpression="nombre Usuario" />
                                    <asp:BoundField DataField="fecha" DataFormatString="{0:dd/MM/yy}" HeaderText="Fecha de ingreso" SortExpression="fecha" />
                                </Columns>
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CadenaConexion %>" SelectCommand="SELECT i.id, i.detalle, (b.nombres + ' ' + b.apellidos) as [nombre Becario], (u.nombres + ' ' + u.apellidos) as [nombre Usuario], i.fecha from ((incidentes as i inner join becario as b on i.id_becario=b.id)inner join usuario as u on i.id_usuario=u.id) WHERE b.id=@codiBeca">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ddlAlumnos" Name="codiBeca" PropertyName="SelectedValue" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</asp:Content>

