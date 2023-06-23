using System;
using System.Collections.Generic;

namespace WebFerreteria.Models;

public partial class TipoDocumentoVentum
{
    public int Id { get; set; }

    public string? Descripcion { get; set; }

    public string? UsuarioRegistro { get; set; }

    public DateTime? FechaRegistro { get; set; }

    public bool? RegistroActivo { get; set; }

    public virtual ICollection<Ventum> Venta { get; set; } = new List<Ventum>();
}
