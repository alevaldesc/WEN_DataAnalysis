################################################################################
#################### Women in Economics Network - WEN ##########################
############################### Data Analysis ##################################
################################################################################
#  Tema            : [Nombre del tema de estudio]
#  Program Name    : [Nombre del programa]
#  Date            : [dd/mm/aaaa]
#  Author          : [Nombre]
#  Description     : [Objetivo del programa]
#
#  Guardar wen_style.py en la misma carpeta que este codigo.
################################################################################

# %% Configuracion inicial
from pathlib import Path
import getpass
import logging

import pandas as pd
import matplotlib.pyplot as plt
from wen_style import COLORS, use_wen_style, title_wen, legend_below, save_wen

################################################################################
# %% 0. Paths
################################################################################

# Cada persona agrega su usuario y la ruta del tema en su equipo.
# Para consultar su usuario: print(getpass.getuser())
# workfolder es la carpeta de DATOS en Drive, fuera del repositorio.
# La carpeta del tema debe existir. Las rutas siguientes son ejemplos.
username = getpass.getuser()
workfolder = None

if username == "avaldes":
    workfolder = Path("C:/RUTA/DRIVE/WEN/tema_estudio")

if username == "OTRO_USUARIO":
    workfolder = Path("C:/RUTA/DRIVE/DE/ESA/PERSONA/WEN/tema_estudio")

if workfolder is None:
    raise RuntimeError(f"Agrega tu usuario ({username}) y ruta al bloque de Paths.")

if not workfolder.is_dir():
    raise FileNotFoundError(f"Crea la carpeta del tema o corrige su ruta: {workfolder}")

raw = workfolder / "raw"
temp = workfolder / "temp"
data = workfolder / "data"
code = Path(__file__).resolve().parent  # Este codigo esta en el repositorio.
out = workfolder / "out"

# Crear las subcarpetas si todavia no existen.
for folder in (raw, temp, data, out):
    folder.mkdir(exist_ok=True)

################################################################################
# %% 1. Estilo y colores WEN
################################################################################

use_wen_style()

# Equivalentes a las globales de colores del template de Stata.
wen_navy = COLORS["navy"]
wen_sky = COLORS["sky"]
wen_orange = COLORS["orange"]
wen_teal = COLORS["teal"]
wen_purple = COLORS["purple"]
wen_plum = COLORS["plum"]
wen_slate = COLORS["slate"]
wen_rose = COLORS["rose"]
wen_gray = COLORS["gray"]
wen_grid = COLORS["grid"]
wen_band = COLORS["band"]

# Cambiar el nombre del log para que coincida con el codigo.
logging.basicConfig(
    filename=out / "01_analisis.log",
    filemode="w",
    encoding="utf-8",
    level=logging.INFO,
    format="%(asctime)s | %(message)s",
    force=True,
)
logging.info("Inicio del analisis")

################################################################################
# %% 2. Cargar datos
################################################################################

# Elija la instruccion que corresponda y quite el numeral (#).
# df = pd.read_excel(raw / "base_original.xlsx", sheet_name="Hoja1")
# df = pd.read_csv(raw / "base_original.csv")
# df = pd.read_stata(raw / "base_original.dta")
# df = pd.read_csv(data / "base_analisis.csv")

################################################################################
# %% 3. Preparar la base
################################################################################

# Limpieza, construccion de variables y validaciones.
# En estos ejemplos, df es la tabla con los datos (DataFrame).

# Para guardar archivos intermedios:
# df.to_csv(temp / "base_intermedia.csv", index=False)

# Para guardar la base lista para el analisis:
# df.to_csv(data / "base_analisis.csv", index=False)

################################################################################
# %% 4. Analisis
################################################################################

# Estadisticas, estimaciones y resultados.
# resumen = df.describe()
# resumen.to_excel(out / "01_estadisticas.xlsx")
# logging.info("Estadisticas calculadas")

################################################################################
# %% 5. Graficos y resultados
################################################################################

# Ejemplo de estructura. Reemplazar year, indicador_a e indicador_b por las
# columnas de su base y quitar los numerales (#) para ejecutar.
# Ordenar por fecha y completar los periodos faltantes antes de graficar.

# df = df.sort_values("year")
# fig, ax = plt.subplots()
# fig.subplots_adjust(left=0.15, right=0.97, top=0.77, bottom=0.26)
# ax.plot(df["year"], df["indicador_a"], color=wen_navy, label="Grupo A")
# ax.plot(df["year"], df["indicador_b"], color=wen_sky, label="Grupo B")
# ax.set_xlabel("")
# ax.set_ylabel("Unidad")
# title_wen(ax, "Titulo del grafico", "Periodo o unidad")
# legend_below(ax)
# fig.text(0.02, 0.025, "Fuente: indicar fuente real.", fontsize=8)

# save_wen(fig, out / "01_nombre_grafico.png")
# save_wen(fig, out / "01_nombre_grafico.pdf")
# plt.show()
# plt.close(fig)

################################################################################
# %% 6. Cierre
################################################################################

logging.info("Fin del analisis")
