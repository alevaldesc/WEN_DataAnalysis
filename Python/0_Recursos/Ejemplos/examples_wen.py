################################################################################
#################### Women in Economics Network - WEN ##########################
############################### Data Analysis ##################################
################################################################################
#  Tema            : Ejemplos de estilo WEN
#  Program Name    : Probar graficos
#  Date            : 21/10/2026
#  Author          : WEN Data Analysis
#  Description     : Cuatro graficos con datos ficticios, sin archivos externos.
################################################################################

"""Cuatro plantillas WEN con datos ficticios, listas para modificar.

Ejecutar: python examples_wen.py
Exporta cuatro figuras PNG/PDF y una vista previa en la subcarpeta out.
Los archivos con el mismo nombre se reemplazan al ejecutar de nuevo.
"""

from pathlib import Path

import matplotlib.pyplot as plt
import numpy as np
from matplotlib.patches import FancyBboxPatch

from wen_style import (
    COLORS, PALETTE, legend_below, save_wen, style_axes, title_wen, use_wen_style,
)


def series_data():
    """Mismas fórmulas y períodos que los ejemplos de Stata."""
    t = np.arange(9)
    years = 2017 + t
    a = 46 + 1.6*t + 1.4*np.sin(t/1.5)
    b = 37 + 1.3*t + 1.2*np.cos(t/1.7)
    c = 31 + 1.1*t + 0.8*np.sin(t/1.4)
    return years, a, b, c


def plot_series(ax):
    years, a, b, c = series_data()
    # El mismo grupo conserva su color aunque cambie el orden de dibujo.
    for values, color, label in (
        (a, COLORS["navy"], "Grupo A"),
        (b, COLORS["sky"], "Grupo B"),
        (c, COLORS["orange"], "Grupo C"),
    ):
        ax.plot(years, values, color=color, label=label)
    style_axes(ax)
    title_wen(ax, "Series de tiempo", "Datos ficticios | Tres grupos")
    ax.set(xlim=(2017, 2025), ylim=(20, 70), xticks=years[::2],
           yticks=np.arange(20, 71, 10), ylabel="Porcentaje")
    legend_below(ax)
    return ax


def plot_bars(ax):
    positions = np.arange(3)
    width = 0.23
    for k, (values, color, label) in enumerate((
        ([56, 48, 63], COLORS["navy"], "Grupo A"),
        ([43, 39, 51], COLORS["sky"], "Grupo B"),
        ([35, 31, 42], COLORS["orange"], "Grupo C"),
    )):
        ax.bar(positions + (k-1)*width, values, width=0.21,
               color=color, label=label)
    style_axes(ax)
    title_wen(ax, "Comparación entre categorías", "Datos ficticios | Barras con base cero")
    ax.set(xticks=positions, xticklabels=["Categoría 1", "Categoría 2", "Categoría 3"],
           ylim=(0, 80), yticks=np.arange(0, 81, 20), ylabel="Porcentaje")
    legend_below(ax)
    return ax


def plot_band(ax):
    years, a, _, _ = series_data()
    # Sustituir por intervalos calculados desde el modelo real.
    ax.fill_between(years, a-3.5, a+3.5, color=COLORS["band"],
                    edgecolor="none", label="Intervalo ilustrativo", zorder=1)
    ax.plot(years, a, color=COLORS["navy"], label="Estimación", zorder=2)
    style_axes(ax)
    title_wen(ax, "Una serie con intervalo", "Datos ficticios | Banda fijada a mano")
    ax.set(xlim=(2017, 2025), ylim=(30, 70), xticks=years[::2],
           yticks=np.arange(30, 71, 10), ylabel="Porcentaje")
    legend_below(ax, ncol=2)
    return ax


def plot_estimates(ax):
    estimates = np.array([-1.2, 0.4, 1.8, 2.6])
    lower = np.array([-2.3, -0.5, 0.7, 1.4])
    upper = np.array([-0.1, 1.3, 2.9, 3.8])
    rows = np.arange(4)
    # errorbar recibe distancias al estimador, no los límites absolutos.
    ax.errorbar(estimates, rows, xerr=np.vstack([estimates-lower, upper-estimates]),
                fmt="o", color=COLORS["navy"], ecolor=COLORS["sky"],
                elinewidth=1.5, capsize=3.5, markersize=5)
    ax.axvline(0, color=COLORS["gray"], linewidth=0.9, linestyle=(0, (4, 3)))
    style_axes(ax, grid="x")
    ax.spines["left"].set_visible(False)
    title_wen(ax, "Estimaciones e intervalos", "Datos ficticios | Referencia en cero")
    ax.set(yticks=rows, yticklabels=["Resultado A", "Resultado B", "Resultado C", "Resultado D"],
           xlim=(-3, 4), xticks=np.arange(-3, 5), ylim=(3.6, -0.6),
           xlabel="Puntos porcentuales")
    return ax


EXAMPLES = (
    ("01_series", plot_series),
    ("02_barras", plot_bars),
    ("03_banda", plot_band),
    ("04_estimaciones", plot_estimates),
)


def make_figure(plotter):
    """Crea una figura con espacio para título, leyenda y fuente."""
    fig, ax = plt.subplots()
    fig.subplots_adjust(left=0.15, right=0.97, top=0.77, bottom=0.26)
    plotter(ax)
    fig.text(0.02, 0.025, "Fuente: ejemplo ficticio, sin interpretación económica.",
             color=COLORS["gray"], fontsize=8)
    return fig, ax


def make_preview():
    """Vista conjunta construida con los mismos cuatro gráficos del módulo."""
    fig = plt.figure(figsize=(13, 10))
    fig.text(0.07, 0.95, "WEN / PYTHON", color=COLORS["navy"], fontsize=13, weight="bold")
    fig.text(0.07, 0.91, "Una base común para los datos", color=COLORS["navy"],
             fontsize=26, weight="bold")
    fig.text(0.07, 0.875, "La misma paleta y líneas finas · fondo blanco · detalles sutiles",
             color=COLORS["gray"], fontsize=11)
    names = ["Azul marino", "Celeste", "Naranja", "Verde petróleo", "Malva", "Ciruela", "Azul gris", "Rosa tierra"]
    for i, (color, name) in enumerate(zip(PALETTE, names)):
        x = 0.07 + i*0.111
        fig.patches.append(FancyBboxPatch(
            (x, 0.8), 0.092, 0.035, boxstyle="round,pad=0,rounding_size=0.004",
            facecolor=color, edgecolor="none", transform=fig.transFigure))
        fig.text(x, 0.784, name, fontsize=8, color=COLORS["navy"])
        fig.text(x, 0.767, color, fontsize=8, color=COLORS["gray"])
    grid = fig.add_gridspec(2, 2, left=0.08, right=0.95, top=0.69, bottom=0.13,
                            wspace=0.25, hspace=0.65)
    for i, (_, plotter) in enumerate(EXAMPLES):
        plotter(fig.add_subplot(grid[i//2, i % 2]))
    fig.text(0.07, 0.05, "EJEMPLOS EJECUTADOS EN PYTHON · DATOS FICTICIOS",
             color=COLORS["navy"], fontsize=9, weight="bold")
    fig.text(0.07, 0.029, "Estilo WEN para Matplotlib. Las bandas e intervalos son ilustrativos.",
             color=COLORS["gray"], fontsize=9)
    return fig


def main():
    use_wen_style()
    folder = Path(__file__).resolve().parent
    for name, plotter in EXAMPLES:
        fig, _ = make_figure(plotter)
        for extension in ("png", "pdf"):
            save_wen(fig, folder / "out" / f"{name}.{extension}")
        plt.close(fig)
    preview = make_preview()
    save_wen(preview, folder / "out" / "vista_previa.png", dpi=160)
    plt.close(preview)
    print(f"Listo: cuatro gráficos PNG/PDF en {folder / 'out'}")


if __name__ == "__main__":
    main()
