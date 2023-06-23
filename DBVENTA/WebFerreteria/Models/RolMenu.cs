using System;
using System.Collections.Generic;

namespace WebFerreteria.Models;

public partial class RolMenu
{
    public int Id { get; set; }

    public int? IdRol { get; set; }

    public int? IdMenu { get; set; }

    public string? UsuarioRegistro { get; set; }

    public DateTime? FechaRegistro { get; set; }

    public bool? RegistroActivo { get; set; }

    public virtual Menu? IdMenuNavigation { get; set; }

    public virtual Rol? IdRolNavigation { get; set; }
}
