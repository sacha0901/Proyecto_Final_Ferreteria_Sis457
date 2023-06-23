﻿using System;
using System.Collections.Generic;

namespace WebFerreteria.Models;

public partial class Venta
{
    public int Id { get; set; }

    public string? NumeroVenta { get; set; }

    public int? IdTipoDocumentoVenta { get; set; }

    public int? IdUsuario { get; set; }

    public string? DocumentoCliente { get; set; }

    public string? NombreCliente { get; set; }

    public decimal? SubTotal { get; set; }

    public decimal? ImpuestoTotal { get; set; }

    public decimal? Total { get; set; }

    public string? UsuarioRegistro { get; set; }

    public DateTime? FechaRegistro { get; set; }

    public bool? RegistroActivo { get; set; }

    public virtual ICollection<DetalleVenta> DetalleVenta { get; set; } = new List<DetalleVenta>();

    public virtual TipoDocumentoVenta? IdTipoDocumentoVentaNavigation { get; set; }

    public virtual Usuario? IdUsuarioNavigation { get; set; }
}
