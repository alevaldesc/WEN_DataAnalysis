# [Nombre del tema]

Esta carpeta es una referencia para crear temas nuevos; no contiene un estudio real.
Copia este README a la carpeta de tu tema y completa los campos.

## Objetivo

[Pregunta que se quiere responder y resultado esperado.]

## Equipo

[Personas encargadas y tareas.]

## Datos y fuentes

- Carpeta compartida de datos: [agregar ubicación o enlace].
- Fuente original: [organismo, publicación o descarga].
- Período y cobertura: [completar].
- Fecha o versión de la descarga: [completar].
- Archivo principal: [nombre exacto y subcarpeta raw].

Los datos se guardan fuera de GitHub. Cada persona configura `workfolder` con
la ruta local de esa carpeta compartida.

## Orden de ejecución

| Código | Qué hace | Entrada | Salida |
| --- | --- | --- | --- |
| `01_cargar_limpiar.py` | Importar y preparar la base. | `raw/[archivo]` | `[dta o data]/[base limpia]` |
| `02_analisis.py` | Analizar la base. | `[dta o data]/[base limpia]` | `out/[resultado]` |
| `03_graficos.py` | Crear gráficos. | `[dta o data]/[base limpia]` | `out/[gráficos]` |

Reemplaza `EXT` por la extensión del lenguaje y conserva solo los códigos
que vayas a utilizar. Estos nombres son un modelo, no archivos ya existentes.

## Notas para reproducir

[Variables principales, filtros, unidades, definiciones y comprobaciones.]

## Estado

[Último avance y próximas tareas.]
