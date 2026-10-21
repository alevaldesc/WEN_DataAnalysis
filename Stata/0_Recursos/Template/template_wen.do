********************************************************************************
******************** Women in Economics Network - WEN **************************
******************************* Data Analysis **********************************
********************************************************************************
*  Tema            : [Nombre del tema de estudio]
*  Program Name    : [Nombre del programa]
*  Date            : [dd/mm/aaaa]
*  Author          : [Nombre]
*  Description     : [Objetivo del programa]
*
********************************************************************************

    version 15.1
    clear all
    capture log close
    set more off
    set type double

    * Si necesita importar un Excel grande, puede activar esta opcion:
    * set excelxlsxlargefile on

********************************************************************************
**# 0. Paths
********************************************************************************

    * Cada persona agrega su usuario y la ruta del tema en su equipo.
    * Para consultar su usuario: display c(username)
    * workfolder es la carpeta de DATOS en Drive, fuera del repositorio.
    * El do-file se guarda en Stata/1_Code/tema. Las rutas son ejemplos.
    global workfolder ""

    if "`c(username)'" == "avaldes" {
        global workfolder "C:/RUTA/DRIVE/WEN/tema_estudio"
    }

    if "`c(username)'" == "OTRO_USUARIO" {
        global workfolder "C:/RUTA/DRIVE/DE/ESA/PERSONA/WEN/tema_estudio"
    }

    if "$workfolder" == "" {
        display as error "Agrega tu usuario y ruta al bloque de Paths."
        exit 198
    }

    global raw   "$workfolder/raw"
    global temp  "$workfolder/temp"
    global dta   "$workfolder/dta"
    global out   "$workfolder/out"

    cd "$workfolder"

    * Crear las subcarpetas si todavia no existen.
    capture mkdir "$raw"
    capture mkdir "$temp"
    capture mkdir "$dta"
    capture mkdir "$out"

********************************************************************************
**# 1. Estilo y colores WEN
********************************************************************************

    * Requiere haber ejecutado wen_style una vez para instalar el esquema.
    set scheme wen

    global wen_navy     "31 42 68"    // Azul marino
    global wen_sky      "130 180 204"    // Celeste
    global wen_orange   "250 104 41"    // Naranja
    global wen_teal     "61 124 120"    // Verde petroleo
    global wen_purple   "128 109 156"    // Malva
    global wen_plum     "120 74 99"    // Ciruela
    global wen_slate    "98 122 147"    // Azul gris
    global wen_rose     "184 116 124"    // Rosa tierra
    global wen_gray     "102 102 102"    // Gris
    global wen_grid     "232 235 239"    // Grilla
    global wen_band     "220 234 241"    // Banda de confianza

    * Opcional: definir la fuente de los graficos en Windows.
    * graph set window fontface "Arial"

    * Cambiar el nombre del log para que coincida con el do-file.
    log using "$out/01_analisis.log", text replace

********************************************************************************
**# 2. Cargar datos
********************************************************************************

    * Elija la instruccion que corresponda y quite el asterisco.
    * import excel "$raw/base_original.xlsx", sheet("Hoja1") firstrow clear
    * import delimited "$raw/base_original.csv", clear
    * use "$dta/base_analisis.dta", clear

********************************************************************************
**# 3. Preparar la base
********************************************************************************

    * Limpieza, construccion de variables y validaciones.

    * Para guardar archivos intermedios:
    * save "$temp/base_intermedia.dta", replace

    * Para guardar la base lista para el analisis:
    * save "$dta/base_analisis.dta", replace

********************************************************************************
**# 4. Analisis
********************************************************************************

    * Estadisticas, estimaciones y resultados.

********************************************************************************
**# 5. Graficos y resultados
********************************************************************************

    * Ejemplo de estructura. Reemplazar year, indicador_a e indicador_b
    * por los nombres de las variables y quitar los asteriscos para ejecutar.
    * Ordenar los datos por fecha. Si faltan periodos completos, insertar
    * esas fechas con valores missing antes de graficar.

    * twoway ///
    *     (line indicador_a year, sort cmissing(n) lcolor("$wen_navy")) ///
    *     (line indicador_b year, sort cmissing(n) lcolor("$wen_sky")), ///
    *     title("Titulo del grafico", pos(11) span) ///
    *     subtitle("Periodo o unidad", pos(11) span) ///
    *     xtitle("") ytitle("Unidad") ///
    *     xlabel(, nogrid) ylabel(, angle(0)) ///
    *     legend(order(1 "Grupo A" 2 "Grupo B") rows(1)) ///
    *     note("Fuente: indicar fuente real.", span)

    * graph export "$out/01_nombre_grafico.png", width(2400) replace
    * graph export "$out/01_nombre_grafico.pdf", replace
    * graph save "$out/01_nombre_grafico.gph", replace

    * export excel using "$out/01_nombre_tabla.xlsx", firstrow(variables) replace

********************************************************************************
**# 6. Cierre
********************************************************************************

    log close
