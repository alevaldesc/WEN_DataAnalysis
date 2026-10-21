*! wen_style 0.2.0 | 21oct2026 | WEN Data Analysis
* Instala el esquema WEN. Este es el unico archivo de instalacion necesario.
program define wen_style, rclass
    version 15.1
    syntax [, REPLACE]

    local target "`c(sysdir_personal)'scheme-wen.scheme"
    capture confirm file "`target'"
    if _rc | "`replace'" != "" {
        tempname handle
        file open `handle' using "`target'", write text replace
        file write `handle' `"* WEN Stata | version 0.2.0 | 21 October 2026"' _n
        file write `handle' `"* First three colors sampled from Paleta de colores.png."' _n
        file write `handle' `"* Other colors are a proposed extension, not official brand colors."' _n
        file write `handle' `"* Native Stata scheme: no SSC dependencies. Intended for Stata 15.1+."' _n
        file write `handle' `"#include s2color"' _n
        file write `handle' `""' _n
        file write `handle' `"* White canvas, no enclosing box."' _n
        file write `handle' `"color background white"' _n
        file write `handle' `"color plotregion white"' _n
        file write `handle' `"linestyle plotregion none"' _n
        file write `handle' `"linestyle legend none"' _n
        file write `handle' `"color legend white"' _n
        file write `handle' `"color heading "31 42 68""' _n
        file write `handle' `"color subheading "102 102 102""' _n
        file write `handle' `"color body "65 65 65""' _n
        file write `handle' `"color small_body "102 102 102""' _n
        file write `handle' `"color axis_title "65 65 65""' _n
        file write `handle' `"color tick_label "102 102 102""' _n
        file write `handle' `"color key_label "65 65 65""' _n
        file write `handle' `"color note "102 102 102""' _n
        file write `handle' `"color caption "102 102 102""' _n
        file write `handle' `"color textbox none"' _n
        file write `handle' `"color bylabel_outline none"' _n
        file write `handle' `"color mat_label_box none"' _n
        file write `handle' `""' _n
        file write `handle' `"* Horizontal grid only. Individual graph options can override these defaults."' _n
        file write `handle' `"color grid "232 235 239""' _n
        file write `handle' `"color major_grid "232 235 239""' _n
        file write `handle' `"color minor_grid "242 244 246""' _n
        file write `handle' `"linepattern grid solid"' _n
        file write `handle' `"linepattern major_grid solid"' _n
        file write `handle' `"linewidth grid vthin"' _n
        file write `handle' `"linewidth major_grid vthin"' _n
        file write `handle' `"yesno draw_major_hgrid yes"' _n
        file write `handle' `"yesno draw_major_vgrid no"' _n
        file write `handle' `"yesno draw_minor_hgrid no"' _n
        file write `handle' `"yesno draw_minor_vgrid no"' _n
        file write `handle' `"yesno grid_draw_min no"' _n
        file write `handle' `"yesno grid_draw_max no"' _n
        file write `handle' `"color axisline "185 191 201""' _n
        file write `handle' `"color tick "185 191 201""' _n
        file write `handle' `"color minortick "185 191 201""' _n
        file write `handle' `"linewidth axisline thin"' _n
        file write `handle' `"linewidth tick thin"' _n
        file write `handle' `"anglestyle vertical_tick horizontal"' _n
        file write `handle' `"yesno extend_axes_low no"' _n
        file write `handle' `"yesno extend_axes_high no"' _n
        file write `handle' `"yesno extend_axes_full_low no"' _n
        file write `handle' `"yesno extend_axes_full_high no"' _n
        file write `handle' `""' _n
        file write `handle' `"* Quiet reference lines and readable text."' _n
        file write `handle' `"color xyline "160 169 183""' _n
        file write `handle' `"linepattern xyline shortdash"' _n
        file write `handle' `"linewidth xyline thin"' _n
        file write `handle' `"gsize heading medium"' _n
        file write `handle' `"gsize subheading medsmall"' _n
        file write `handle' `"gsize axis_title medsmall"' _n
        file write `handle' `"gsize tick_label small"' _n
        file write `handle' `"gsize key_label small"' _n
        file write `handle' `"gsize note small"' _n
        file write `handle' `"gsize caption small"' _n
        file write `handle' `"gsize axis_title_gap small"' _n
        file write `handle' `"clockdir legend_position 6"' _n
        file write `handle' `"numstyle legend_cols 3"' _n
        file write `handle' `"numstyle legend_rows 0"' _n
        file write `handle' `"graphsize x 7"' _n
        file write `handle' `"graphsize y 4.4"' _n
        file write `handle' `""' _n
        file write `handle' `"* Full palette intensity, including bars and areas."' _n
        file write `handle' `"intensity bar 100"' _n
        file write `handle' `"intensity histogram 100"' _n
        file write `handle' `"intensity box 100"' _n
        file write `handle' `"intensity pie 100"' _n
        file write `handle' `"color histogram "31 42 68""' _n
        file write `handle' `"color histogram_line white"' _n
        file write `handle' `"color ci_area "220 234 241""' _n
        file write `handle' `"color ci_arealine none"' _n
        file write `handle' `"color ci2_area "255 225 211""' _n
        file write `handle' `"color ci2_arealine none"' _n
        file write `handle' `"color ci_line "31 42 68""' _n
        file write `handle' `"color ci2_line "250 104 41""' _n
        file write `handle' `"linewidth p medthin"' _n
        file write `handle' `"linewidth pline medthin"' _n
        file write `handle' `"linewidth pbar vthin"' _n
        file write `handle' `"symbolsize p small"' _n
        file write `handle' `""' _n
        file write `handle' `"* Eight distinct colors; p9-p15 reuse colors with dashed lines."' _n
        file write `handle' `"color p1 "31 42 68""' _n
        file write `handle' `"color p1line "31 42 68""' _n
        file write `handle' `"color p1lineplot "31 42 68""' _n
        file write `handle' `"color p1markfill "31 42 68""' _n
        file write `handle' `"color p1markline "31 42 68""' _n
        file write `handle' `"color p1bar "31 42 68""' _n
        file write `handle' `"color p1barline "31 42 68""' _n
        file write `handle' `"color p1area "31 42 68""' _n
        file write `handle' `"color p1arealine "31 42 68""' _n
        file write `handle' `"color p1box "31 42 68""' _n
        file write `handle' `"color p1boxline "31 42 68""' _n
        file write `handle' `"color p1pie "31 42 68""' _n
        file write `handle' `"linewidth p1line medthin"' _n
        file write `handle' `"linewidth p1lineplot medthin"' _n
        file write `handle' `"linewidth p1bar vthin"' _n
        file write `handle' `"linepattern p1line solid"' _n
        file write `handle' `"linepattern p1lineplot solid"' _n
        file write `handle' `""' _n
        file write `handle' `"color p2 "130 180 204""' _n
        file write `handle' `"color p2line "130 180 204""' _n
        file write `handle' `"color p2lineplot "130 180 204""' _n
        file write `handle' `"color p2markfill "130 180 204""' _n
        file write `handle' `"color p2markline "130 180 204""' _n
        file write `handle' `"color p2bar "130 180 204""' _n
        file write `handle' `"color p2barline "130 180 204""' _n
        file write `handle' `"color p2area "130 180 204""' _n
        file write `handle' `"color p2arealine "130 180 204""' _n
        file write `handle' `"color p2box "130 180 204""' _n
        file write `handle' `"color p2boxline "130 180 204""' _n
        file write `handle' `"color p2pie "130 180 204""' _n
        file write `handle' `"linewidth p2line medthin"' _n
        file write `handle' `"linewidth p2lineplot medthin"' _n
        file write `handle' `"linewidth p2bar vthin"' _n
        file write `handle' `"linepattern p2line solid"' _n
        file write `handle' `"linepattern p2lineplot solid"' _n
        file write `handle' `""' _n
        file write `handle' `"color p3 "250 104 41""' _n
        file write `handle' `"color p3line "250 104 41""' _n
        file write `handle' `"color p3lineplot "250 104 41""' _n
        file write `handle' `"color p3markfill "250 104 41""' _n
        file write `handle' `"color p3markline "250 104 41""' _n
        file write `handle' `"color p3bar "250 104 41""' _n
        file write `handle' `"color p3barline "250 104 41""' _n
        file write `handle' `"color p3area "250 104 41""' _n
        file write `handle' `"color p3arealine "250 104 41""' _n
        file write `handle' `"color p3box "250 104 41""' _n
        file write `handle' `"color p3boxline "250 104 41""' _n
        file write `handle' `"color p3pie "250 104 41""' _n
        file write `handle' `"linewidth p3line medthin"' _n
        file write `handle' `"linewidth p3lineplot medthin"' _n
        file write `handle' `"linewidth p3bar vthin"' _n
        file write `handle' `"linepattern p3line solid"' _n
        file write `handle' `"linepattern p3lineplot solid"' _n
        file write `handle' `""' _n
        file write `handle' `"color p4 "61 124 120""' _n
        file write `handle' `"color p4line "61 124 120""' _n
        file write `handle' `"color p4lineplot "61 124 120""' _n
        file write `handle' `"color p4markfill "61 124 120""' _n
        file write `handle' `"color p4markline "61 124 120""' _n
        file write `handle' `"color p4bar "61 124 120""' _n
        file write `handle' `"color p4barline "61 124 120""' _n
        file write `handle' `"color p4area "61 124 120""' _n
        file write `handle' `"color p4arealine "61 124 120""' _n
        file write `handle' `"color p4box "61 124 120""' _n
        file write `handle' `"color p4boxline "61 124 120""' _n
        file write `handle' `"color p4pie "61 124 120""' _n
        file write `handle' `"linewidth p4line medthin"' _n
        file write `handle' `"linewidth p4lineplot medthin"' _n
        file write `handle' `"linewidth p4bar vthin"' _n
        file write `handle' `"linepattern p4line solid"' _n
        file write `handle' `"linepattern p4lineplot solid"' _n
        file write `handle' `""' _n
        file write `handle' `"color p5 "128 109 156""' _n
        file write `handle' `"color p5line "128 109 156""' _n
        file write `handle' `"color p5lineplot "128 109 156""' _n
        file write `handle' `"color p5markfill "128 109 156""' _n
        file write `handle' `"color p5markline "128 109 156""' _n
        file write `handle' `"color p5bar "128 109 156""' _n
        file write `handle' `"color p5barline "128 109 156""' _n
        file write `handle' `"color p5area "128 109 156""' _n
        file write `handle' `"color p5arealine "128 109 156""' _n
        file write `handle' `"color p5box "128 109 156""' _n
        file write `handle' `"color p5boxline "128 109 156""' _n
        file write `handle' `"color p5pie "128 109 156""' _n
        file write `handle' `"linewidth p5line medthin"' _n
        file write `handle' `"linewidth p5lineplot medthin"' _n
        file write `handle' `"linewidth p5bar vthin"' _n
        file write `handle' `"linepattern p5line solid"' _n
        file write `handle' `"linepattern p5lineplot solid"' _n
        file write `handle' `""' _n
        file write `handle' `"color p6 "120 74 99""' _n
        file write `handle' `"color p6line "120 74 99""' _n
        file write `handle' `"color p6lineplot "120 74 99""' _n
        file write `handle' `"color p6markfill "120 74 99""' _n
        file write `handle' `"color p6markline "120 74 99""' _n
        file write `handle' `"color p6bar "120 74 99""' _n
        file write `handle' `"color p6barline "120 74 99""' _n
        file write `handle' `"color p6area "120 74 99""' _n
        file write `handle' `"color p6arealine "120 74 99""' _n
        file write `handle' `"color p6box "120 74 99""' _n
        file write `handle' `"color p6boxline "120 74 99""' _n
        file write `handle' `"color p6pie "120 74 99""' _n
        file write `handle' `"linewidth p6line medthin"' _n
        file write `handle' `"linewidth p6lineplot medthin"' _n
        file write `handle' `"linewidth p6bar vthin"' _n
        file write `handle' `"linepattern p6line solid"' _n
        file write `handle' `"linepattern p6lineplot solid"' _n
        file write `handle' `""' _n
        file write `handle' `"color p7 "98 122 147""' _n
        file write `handle' `"color p7line "98 122 147""' _n
        file write `handle' `"color p7lineplot "98 122 147""' _n
        file write `handle' `"color p7markfill "98 122 147""' _n
        file write `handle' `"color p7markline "98 122 147""' _n
        file write `handle' `"color p7bar "98 122 147""' _n
        file write `handle' `"color p7barline "98 122 147""' _n
        file write `handle' `"color p7area "98 122 147""' _n
        file write `handle' `"color p7arealine "98 122 147""' _n
        file write `handle' `"color p7box "98 122 147""' _n
        file write `handle' `"color p7boxline "98 122 147""' _n
        file write `handle' `"color p7pie "98 122 147""' _n
        file write `handle' `"linewidth p7line medthin"' _n
        file write `handle' `"linewidth p7lineplot medthin"' _n
        file write `handle' `"linewidth p7bar vthin"' _n
        file write `handle' `"linepattern p7line solid"' _n
        file write `handle' `"linepattern p7lineplot solid"' _n
        file write `handle' `""' _n
        file write `handle' `"color p8 "184 116 124""' _n
        file write `handle' `"color p8line "184 116 124""' _n
        file write `handle' `"color p8lineplot "184 116 124""' _n
        file write `handle' `"color p8markfill "184 116 124""' _n
        file write `handle' `"color p8markline "184 116 124""' _n
        file write `handle' `"color p8bar "184 116 124""' _n
        file write `handle' `"color p8barline "184 116 124""' _n
        file write `handle' `"color p8area "184 116 124""' _n
        file write `handle' `"color p8arealine "184 116 124""' _n
        file write `handle' `"color p8box "184 116 124""' _n
        file write `handle' `"color p8boxline "184 116 124""' _n
        file write `handle' `"color p8pie "184 116 124""' _n
        file write `handle' `"linewidth p8line medthin"' _n
        file write `handle' `"linewidth p8lineplot medthin"' _n
        file write `handle' `"linewidth p8bar vthin"' _n
        file write `handle' `"linepattern p8line solid"' _n
        file write `handle' `"linepattern p8lineplot solid"' _n
        file write `handle' `""' _n
        file write `handle' `"color p9 "31 42 68""' _n
        file write `handle' `"color p9line "31 42 68""' _n
        file write `handle' `"color p9lineplot "31 42 68""' _n
        file write `handle' `"color p9markfill "31 42 68""' _n
        file write `handle' `"color p9markline "31 42 68""' _n
        file write `handle' `"color p9bar "31 42 68""' _n
        file write `handle' `"color p9barline "31 42 68""' _n
        file write `handle' `"color p9area "31 42 68""' _n
        file write `handle' `"color p9arealine "31 42 68""' _n
        file write `handle' `"color p9box "31 42 68""' _n
        file write `handle' `"color p9boxline "31 42 68""' _n
        file write `handle' `"color p9pie "31 42 68""' _n
        file write `handle' `"linewidth p9line medthin"' _n
        file write `handle' `"linewidth p9lineplot medthin"' _n
        file write `handle' `"linewidth p9bar vthin"' _n
        file write `handle' `"linepattern p9line dash"' _n
        file write `handle' `"linepattern p9lineplot dash"' _n
        file write `handle' `""' _n
        file write `handle' `"color p10 "130 180 204""' _n
        file write `handle' `"color p10line "130 180 204""' _n
        file write `handle' `"color p10lineplot "130 180 204""' _n
        file write `handle' `"color p10markfill "130 180 204""' _n
        file write `handle' `"color p10markline "130 180 204""' _n
        file write `handle' `"color p10bar "130 180 204""' _n
        file write `handle' `"color p10barline "130 180 204""' _n
        file write `handle' `"color p10area "130 180 204""' _n
        file write `handle' `"color p10arealine "130 180 204""' _n
        file write `handle' `"color p10box "130 180 204""' _n
        file write `handle' `"color p10boxline "130 180 204""' _n
        file write `handle' `"color p10pie "130 180 204""' _n
        file write `handle' `"linewidth p10line medthin"' _n
        file write `handle' `"linewidth p10lineplot medthin"' _n
        file write `handle' `"linewidth p10bar vthin"' _n
        file write `handle' `"linepattern p10line dash"' _n
        file write `handle' `"linepattern p10lineplot dash"' _n
        file write `handle' `""' _n
        file write `handle' `"color p11 "250 104 41""' _n
        file write `handle' `"color p11line "250 104 41""' _n
        file write `handle' `"color p11lineplot "250 104 41""' _n
        file write `handle' `"color p11markfill "250 104 41""' _n
        file write `handle' `"color p11markline "250 104 41""' _n
        file write `handle' `"color p11bar "250 104 41""' _n
        file write `handle' `"color p11barline "250 104 41""' _n
        file write `handle' `"color p11area "250 104 41""' _n
        file write `handle' `"color p11arealine "250 104 41""' _n
        file write `handle' `"color p11box "250 104 41""' _n
        file write `handle' `"color p11boxline "250 104 41""' _n
        file write `handle' `"color p11pie "250 104 41""' _n
        file write `handle' `"linewidth p11line medthin"' _n
        file write `handle' `"linewidth p11lineplot medthin"' _n
        file write `handle' `"linewidth p11bar vthin"' _n
        file write `handle' `"linepattern p11line dash"' _n
        file write `handle' `"linepattern p11lineplot dash"' _n
        file write `handle' `""' _n
        file write `handle' `"color p12 "61 124 120""' _n
        file write `handle' `"color p12line "61 124 120""' _n
        file write `handle' `"color p12lineplot "61 124 120""' _n
        file write `handle' `"color p12markfill "61 124 120""' _n
        file write `handle' `"color p12markline "61 124 120""' _n
        file write `handle' `"color p12bar "61 124 120""' _n
        file write `handle' `"color p12barline "61 124 120""' _n
        file write `handle' `"color p12area "61 124 120""' _n
        file write `handle' `"color p12arealine "61 124 120""' _n
        file write `handle' `"color p12box "61 124 120""' _n
        file write `handle' `"color p12boxline "61 124 120""' _n
        file write `handle' `"color p12pie "61 124 120""' _n
        file write `handle' `"linewidth p12line medthin"' _n
        file write `handle' `"linewidth p12lineplot medthin"' _n
        file write `handle' `"linewidth p12bar vthin"' _n
        file write `handle' `"linepattern p12line dash"' _n
        file write `handle' `"linepattern p12lineplot dash"' _n
        file write `handle' `""' _n
        file write `handle' `"color p13 "128 109 156""' _n
        file write `handle' `"color p13line "128 109 156""' _n
        file write `handle' `"color p13lineplot "128 109 156""' _n
        file write `handle' `"color p13markfill "128 109 156""' _n
        file write `handle' `"color p13markline "128 109 156""' _n
        file write `handle' `"color p13bar "128 109 156""' _n
        file write `handle' `"color p13barline "128 109 156""' _n
        file write `handle' `"color p13area "128 109 156""' _n
        file write `handle' `"color p13arealine "128 109 156""' _n
        file write `handle' `"color p13box "128 109 156""' _n
        file write `handle' `"color p13boxline "128 109 156""' _n
        file write `handle' `"color p13pie "128 109 156""' _n
        file write `handle' `"linewidth p13line medthin"' _n
        file write `handle' `"linewidth p13lineplot medthin"' _n
        file write `handle' `"linewidth p13bar vthin"' _n
        file write `handle' `"linepattern p13line dash"' _n
        file write `handle' `"linepattern p13lineplot dash"' _n
        file write `handle' `""' _n
        file write `handle' `"color p14 "120 74 99""' _n
        file write `handle' `"color p14line "120 74 99""' _n
        file write `handle' `"color p14lineplot "120 74 99""' _n
        file write `handle' `"color p14markfill "120 74 99""' _n
        file write `handle' `"color p14markline "120 74 99""' _n
        file write `handle' `"color p14bar "120 74 99""' _n
        file write `handle' `"color p14barline "120 74 99""' _n
        file write `handle' `"color p14area "120 74 99""' _n
        file write `handle' `"color p14arealine "120 74 99""' _n
        file write `handle' `"color p14box "120 74 99""' _n
        file write `handle' `"color p14boxline "120 74 99""' _n
        file write `handle' `"color p14pie "120 74 99""' _n
        file write `handle' `"linewidth p14line medthin"' _n
        file write `handle' `"linewidth p14lineplot medthin"' _n
        file write `handle' `"linewidth p14bar vthin"' _n
        file write `handle' `"linepattern p14line dash"' _n
        file write `handle' `"linepattern p14lineplot dash"' _n
        file write `handle' `""' _n
        file write `handle' `"color p15 "98 122 147""' _n
        file write `handle' `"color p15line "98 122 147""' _n
        file write `handle' `"color p15lineplot "98 122 147""' _n
        file write `handle' `"color p15markfill "98 122 147""' _n
        file write `handle' `"color p15markline "98 122 147""' _n
        file write `handle' `"color p15bar "98 122 147""' _n
        file write `handle' `"color p15barline "98 122 147""' _n
        file write `handle' `"color p15area "98 122 147""' _n
        file write `handle' `"color p15arealine "98 122 147""' _n
        file write `handle' `"color p15box "98 122 147""' _n
        file write `handle' `"color p15boxline "98 122 147""' _n
        file write `handle' `"color p15pie "98 122 147""' _n
        file write `handle' `"linewidth p15line medthin"' _n
        file write `handle' `"linewidth p15lineplot medthin"' _n
        file write `handle' `"linewidth p15bar vthin"' _n
        file write `handle' `"linepattern p15line dash"' _n
        file write `handle' `"linepattern p15lineplot dash"' _n
        file write `handle' `""' _n
        file close `handle'
        display as result "Esquema WEN instalado."
    }
    set scheme wen
    return local c1 "31 42 68"
    return local navy "31 42 68"
    return local c2 "130 180 204"
    return local sky "130 180 204"
    return local c3 "250 104 41"
    return local orange "250 104 41"
    return local c4 "61 124 120"
    return local teal "61 124 120"
    return local c5 "128 109 156"
    return local purple "128 109 156"
    return local c6 "120 74 99"
    return local plum "120 74 99"
    return local c7 "98 122 147"
    return local slate "98 122 147"
    return local c8 "184 116 124"
    return local rose "184 116 124"
    return local text "65 65 65"
    return local gray "102 102 102"
    return local grid "232 235 239"
    return local band "220 234 241"
    return local orange_band "255 225 211"
    return local scheme "wen"
    return scalar n = 8
    display as text "Para sus do-files: set scheme wen"
end
