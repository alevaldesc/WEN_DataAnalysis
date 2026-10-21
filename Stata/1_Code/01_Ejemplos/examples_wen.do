********************************************************************************
******************** Women in Economics Network - WEN **************************
******************************* Data Analysis **********************************
********************************************************************************
*  Tema            : Ejemplos de estilo WEN
*  Program Name    : Probar graficos
*  Date            : 21/10/2026
*  Author          : WEN Data Analysis
*  Description     : Cuatro graficos con datos ficticios, sin archivos externos.
*
*  Instalar el esquema una vez con wen_style, replace antes de ejecutar.
*  Ejecutar TODO el do-file. No requiere editar rutas ni cargar bases.
*  Conserva los datos abiertos con preserve/restore. Los graficos quedan
*  disponibles en Stata; las exportaciones al final son opcionales.
********************************************************************************

    version 15.1
    set more off

********************************************************************************
**# 0. Estilo y colores WEN
********************************************************************************

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

preserve
clear
set obs 9
generate int year = 2016 + _n
generate double series_a = 46 + 1.6*(_n-1) + 1.4*sin((_n-1)/1.5)
generate double series_b = 37 + 1.3*(_n-1) + 1.2*cos((_n-1)/1.7)
generate double series_c = 31 + 1.1*(_n-1) + 0.8*sin((_n-1)/1.4)

* 1. SERIES. cmissing(n) evita unir puntos a ambos lados de un missing.
* Para huecos de fechas, inserte esas fechas con valor missing previamente
* (por ejemplo tsset year + tsfill en una serie anual unica).
twoway ///
    (line series_a year, pstyle(p1) sort cmissing(n)) ///
    (line series_b year, pstyle(p2) sort cmissing(n)) ///
    (line series_c year, pstyle(p3) sort cmissing(n)), ///
    title("Evolucion de un indicador", pos(11) span) ///
    subtitle("Datos ficticios | Porcentaje", pos(11) span) ///
    xtitle("") ytitle("Porcentaje") ///
    xlabel(2017(2)2025, nogrid) ylabel(20(10)70, angle(0)) ///
    legend(order(1 "Grupo A" 2 "Grupo B" 3 "Grupo C") rows(1)) ///
    note("Fuente: ejemplo ficticio, sin interpretacion economica.", span) ///
    name(wen_series, replace)

* 2. UNA SERIE CON BANDA. El relleno va primero para quedar detras.
generate double lower = series_a - 3.5
generate double upper = series_a + 3.5
twoway ///
    (rarea lower upper year, sort color("$wen_band") lcolor(none)) ///
    (line series_a year, sort lcolor("$wen_navy") lwidth(medthin) cmissing(n)), ///
    title("Una serie con intervalo", pos(11) span) ///
    subtitle("Datos ficticios | Banda ilustrativa", pos(11) span) ///
    xtitle("") ytitle("Porcentaje") ///
    xlabel(2017(2)2025, nogrid) ylabel(30(10)70, angle(0)) ///
    legend(order(2 "Estimacion" 1 "Intervalo ilustrativo") rows(1)) ///
    note("Fuente: ejemplo ficticio. La banda no proviene de una estimacion.", span) ///
    name(wen_band, replace)

* 3. BARRAS. El mismo grupo conserva el mismo color de las series.
clear
input str12 category a b c
"Categoria 1" 56 43 35
"Categoria 2" 48 39 31
"Categoria 3" 63 51 42
end
graph bar (asis) a b c, over(category, label(labsize(small))) ///
    bar(1, color("$wen_navy")) bar(2, color("$wen_sky")) ///
    bar(3, color("$wen_orange")) ///
    title("Comparacion entre categorias", pos(11) span) ///
    subtitle("Datos ficticios | Porcentaje", pos(11) span) ///
    ytitle("Porcentaje") ylabel(0(20)80, angle(0)) ///
    legend(order(1 "Grupo A" 2 "Grupo B" 3 "Grupo C") rows(1)) ///
    note("Fuente: ejemplo ficticio, sin interpretacion economica.", span) ///
    name(wen_bars, replace)

* 4. ESTIMACIONES CON INTERVALOS. No requiere instalar coefplot.
clear
input byte row double(estimate lower upper)
1 -1.2 -2.3 -0.1
2  0.4 -0.5  1.3
3  1.8  0.7  2.9
4  2.6  1.4  3.8
end
twoway ///
    (rcap lower upper row, horizontal lcolor("$wen_sky") lwidth(medthin)) ///
    (scatter row estimate, mcolor("$wen_navy") msymbol(O) msize(medium)), ///
    title("Estimaciones e intervalos", pos(11) span) ///
    subtitle("Datos ficticios | Puntos porcentuales", pos(11) span) ///
    xline(0, lcolor("$wen_gray") lpattern(shortdash) lwidth(thin)) ///
    xlabel(-3(1)4, grid glcolor("$wen_grid")) ///
    ylabel(1 "Resultado A" 2 "Resultado B" 3 "Resultado C" 4 "Resultado D", ///
        angle(0) nogrid noticks) ///
    yscale(reverse noline) ytitle("") xtitle("Puntos porcentuales") ///
    legend(off) ///
    note("Fuente: ejemplo ficticio. Intervalos fijados a mano.", span) ///
    name(wen_estimates, replace)
restore

* EXPORTACION OPCIONAL. Defina una ruta antes de activar estas lineas.
* global out "C:/WEN/tema_estudio/out"
* graph export "$out/ejemplo_series.png", name(wen_series) width(2400) replace
* graph export "$out/ejemplo_series.pdf", name(wen_series) replace
* graph save wen_series "$out/ejemplo_series.gph", replace
