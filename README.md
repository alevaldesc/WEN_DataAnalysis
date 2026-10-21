# WEN_DataAnalysis

Repositorio de códigos, templates y documentación del equipo de Data Analysis
de Women in Economics Network. Los datos y resultados de trabajo se mantienen
en una carpeta compartida externa, por ejemplo en Drive.

## Organización

| Ruta | Contenido |
| --- | --- |
| [Stata](Stata/README.md) | Guía de Stata, ado del estilo y vista previa. |
| [Stata/0_Recursos](Stata/0_Recursos) | Template, gráficos de ejemplo y modelo de README. |
| [Stata/1_Code](Stata/1_Code) | Códigos de los estudios, organizados por tema. |
| [Python](Python/README.md) | Guía de Python, dependencias y vista previa. |
| [Python/0_Recursos](Python/0_Recursos) | Template, gráficos de ejemplo y modelo de README. |
| [Python/1_Code](Python/1_Code) | Códigos de los estudios, organizados por tema. |

Dentro de cada **`0_Recursos`** hay:

- **`Template`**: punto de partida para los códigos de un tema nuevo.
- **`Ejemplos`**: cuatro gráficos con datos ficticios para probar el estilo.
- **`README_tema.md`**: modelo para documentar el objetivo, los datos y los códigos
  de cada estudio.

**`1_Code` queda reservado para las carpetas de temas reales.** Por ahora
incluye solo un README con instrucciones; no hay una carpeta de estudio ficticio.

Los temas nuevos van al mismo nivel, por ejemplo
`Stata/1_Code/mercado_laboral_mujeres` y
`Python/1_Code/mercado_laboral_mujeres`.
Crea la carpeta solo en el lenguaje que vayas a usar; si se usan ambos,
conserva el mismo nombre de tema en los dos.

## Dónde van los datos

Para cada tema, habrá una carpeta compartida externa con `raw`, `temp`,
`dta` (bases limpias para Stata), `data` (bases limpias para Python) y `out`.
Crea solo las carpetas que utilice ese análisis. La carpeta del tema debe existir;
los templates crean sus subcarpetas cuando se ejecutan.

| En GitHub | En Drive u otra carpeta compartida |
| --- | --- |
| Códigos `.do`, `.ado`, `.py` | Datos originales en `raw`. |
| README con objetivo, fuentes y orden de ejecución | Archivos intermedios en `temp`. |
| Templates y ejemplos con datos ficticios | Bases limpias en `dta` o `data`. |
| Vistas previas del estilo | Resultados, gráficos de trabajo y logs en `out`. |

Cada código define **`workfolder` según el usuario**, apuntando a la carpeta
de datos del tema en su equipo. El código permanece en el repositorio:
los templates no crean una segunda carpeta `code` dentro de Drive.

En el README de cada tema se debe registrar la ubicación compartida de sus
datos, las fuentes y el orden para ejecutar los códigos. Las rutas incluidas
en los templates son ejemplos que cada persona debe ajustar.

## Empezar un tema

1. Elige el lenguaje y crea una carpeta con el nombre del tema dentro de `1_Code`.
2. Copia los archivos de `0_Recursos/Template` a esa carpeta y nombra los códigos
   `01_cargar_limpiar`, `02_analisis`, `03_graficos`, según corresponda.
3. Agrega el README del tema usando el modelo de `0_Recursos/README_tema.md`.
4. Configura tu usuario y la ruta externa de los datos en el código.
5. Guarda los resultados en `out` y sube al repositorio los cambios de código
   y documentación.

Usamos nombres descriptivos, sin tildes ni espacios en carpetas y códigos.
Por eso la carpeta se llama `1_Code`. Los nombres de temas son iguales en
GitHub y en la carpeta compartida de datos.

## Trabajo en equipo

Antes de trabajar, actualiza tu copia del repositorio. Al terminar, revisa qué
archivos cambiaste, guarda un commit con una descripción concreta y sube los
cambios. Evita que dos personas editen el mismo código al mismo tiempo cuando
puedan repartirse tareas por archivo.

Se incluye un archivo de exclusiones para que Git ignore datos y resultados
que se creen por accidente dentro del repositorio. Revisa igualmente los
archivos de cada commit: las exclusiones no eliminan archivos ya versionados.

La carpeta compartida de datos todavía debe definirse. La estructura está
preparada para usar Drive u otra ubicación, sin asumir una cuenta ni un enlace.
