"""Estilo WEN para Matplotlib. Versión 0.2.0, 21 de octubre de 2026.

Uso: from wen_style import use_wen_style, COLORS, save_wen
     use_wen_style()  # antes de crear figuras
"""

from pathlib import Path

import matplotlib.pyplot as plt
from cycler import cycler

__version__ = "0.2.0"

# Misma paleta y mismo orden que WEN Stata 0.2.1.
# Los tres primeros provienen de la referencia; los demás son complementarios.
COLORS = {
    "navy": "#1F2A44",
    "sky": "#82B4CC",
    "orange": "#FA6829",
    "teal": "#3D7C78",
    "purple": "#806D9C",
    "plum": "#784A63",
    "slate": "#627A93",
    "rose": "#B8747C",
    "text": "#414141",
    "gray": "#666666",
    "grid": "#E8EBEF",
    "band": "#DCEAF1",
    "orange_band": "#FFE1D3",
    "axis": "#B9BFC9",
}
PALETTE = tuple(COLORS[name] for name in (
    "navy", "sky", "orange", "teal", "purple", "plum", "slate", "rose"
))
WEN_STYLE = {
    'axes.axisbelow': True,
    'axes.edgecolor': '#B9BFC9',
    'axes.facecolor': 'white',
    'axes.grid': True,
    'axes.grid.axis': 'y',
    'axes.grid.which': 'major',
    'axes.labelcolor': '#666666',
    'axes.labelpad': 9.0,
    'axes.labelsize': 10.0,
    'axes.linewidth': 0.6,
    'axes.prop_cycle': cycler(color=PALETTE),
    'axes.spines.right': False,
    'axes.spines.top': False,
    'axes.titlecolor': '#1F2A44',
    'axes.titlelocation': 'left',
    'axes.titlepad': 12.0,
    'axes.titlesize': 14.0,
    'axes.titleweight': 'bold',
    'figure.dpi': 120.0,
    'figure.facecolor': 'white',
    'figure.figsize': [7.0, 4.4],
    'font.family': ['sans-serif'],
    'font.sans-serif': ['DejaVu Sans', 'Arial', 'Liberation Sans'],
    'font.size': 10.0,
    'grid.color': '#E8EBEF',
    'grid.linestyle': '-',
    'grid.linewidth': 0.6,
    'legend.fontsize': 9.0,
    'legend.frameon': False,
    'lines.linewidth': 1.6,
    'lines.markersize': 5.0,
    'patch.linewidth': 0.0,
    'pdf.fonttype': 42,
    'ps.fonttype': 42,
    'savefig.bbox': 'tight',
    'savefig.dpi': 300.0,
    'savefig.facecolor': 'white',
    'savefig.pad_inches': 0.15,
    'savefig.transparent': False,
    'svg.fonttype': 'path',
    'text.color': '#414141',
    'xtick.color': '#666666',
    'xtick.labelsize': 9.0,
    'xtick.major.pad': 7.0,
    'xtick.major.size': 0.0,
    'xtick.minor.size': 0.0,
    'ytick.color': '#666666',
    'ytick.labelsize': 9.0,
    'ytick.major.pad': 7.0,
    'ytick.major.size': 0.0,
    'ytick.minor.size': 0.0,
}



def use_wen_style():
    """Activa WEN para las figuras nuevas de esta sesión.

    Parte del estilo predeterminado de Matplotlib para que estilos usados
    previamente no dejen ajustes residuales. No escribe configuración del equipo.
    """
    plt.style.use(["default", WEN_STYLE])


def style_axes(ax, grid="y"):
    """Grilla horizontal, vertical o ninguna. Útil también con pandas/Seaborn."""
    if grid not in ("x", "y", "none"):
        raise ValueError("grid debe ser 'x', 'y' o 'none'.")
    ax.set_facecolor("white")
    ax.set_axisbelow(True)
    ax.grid(False, which="both", axis="both")
    if grid != "none":
        ax.grid(True, which="major", axis=grid, color=COLORS["grid"], linewidth=0.6)
    for side in ("top", "right"):
        ax.spines[side].set_visible(False)
    for side in ("left", "bottom"):
        ax.spines[side].set_color(COLORS["axis"])
        ax.spines[side].set_linewidth(0.6)
    ax.tick_params(axis="both", which="both", length=0, pad=7, colors=COLORS["gray"])
    return ax


def title_wen(ax, title, subtitle=None):
    """Título a la izquierda y subtítulo opcional. Llámala una vez por eje."""
    ax.set_title(title, loc="left", pad=32 if subtitle else 12)
    if subtitle:
        ax.text(0, 1.065, subtitle, transform=ax.transAxes,
                ha="left", va="bottom", fontsize=9, color=COLORS["gray"])
    return ax


def legend_below(ax, ncol=None):
    """Leyenda sin recuadro al pie. Reserva margen inferior en tu figura."""
    handles, labels = ax.get_legend_handles_labels()
    if not labels:
        return None
    if ncol is None:
        ncol = min(3, len(labels))
    return ax.legend(handles, labels, loc="upper center", bbox_to_anchor=(0.5, -0.18),
                     ncol=ncol, frameon=False, fontsize=9,
                     handlelength=2, columnspacing=1.5)


def save_wen(fig, path, dpi=300):
    """Guarda PNG, PDF o SVG sobre blanco; crea carpetas si hace falta.

    Si ya existe un archivo con el mismo nombre, lo reemplaza. Si no se
    indica extensión, usa PNG. Devuelve la ruta del archivo exportado.
    """
    path = Path(path)
    if not path.suffix:
        path = path.with_suffix(".png")
    suffix = path.suffix.lower()
    if suffix not in (".png", ".pdf", ".svg"):
        raise ValueError("Use una extensión .png, .pdf o .svg.")
    path.parent.mkdir(parents=True, exist_ok=True)
    fig.savefig(path, format=suffix[1:], dpi=dpi, bbox_inches="tight",
                pad_inches=0.15, facecolor="white", transparent=False)
    return path
