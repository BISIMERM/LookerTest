---
- dashboard: Dashboard_Test
  title: Indicadores de Ajustes
  description: ''
  filters_bar_collapsed: false
  layout: newspaper
  elements:

  # ---------- ENCABEZADO ----------
  - name: encabezado
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: |-
      <div style="display: flex; align-items: center; height: 100%; padding-left: 10px; font-family: Roboto, Arial, sans-serif;">
        <img src="https://www.qualitas.com.mx/documents/19189400/19781967/Qualitas-horizontal.png/692ae411-2d86-ae6b-461d-625b0bfd9472?t=1774680700783" style="height: 45px; margin-right: 20px;" />
        <span style="font-size: 30px; font-weight: 700; color: #1B5E9B;">Indicadores de Ajustes</span>
      </div>
    row: 0
    col: 0
    width: 44
    height: 5

  - name: metas
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: |-
      <table style="width: 100%; border-collapse: collapse; font-family: Roboto, Arial, sans-serif; font-size: 13px;">
        <tr style="background: #1B5E9B; color: #FFFFFF;">
          <th style="padding: 3px 6px; text-align: left;">Indicador</th>
          <th style="padding: 3px 6px; text-align: center;">Meta</th>
        </tr>
        <tr style="background: #F1F3F4;">
          <td style="padding: 3px 6px;">Ajuste</td>
          <td style="padding: 3px 6px; text-align: center; font-weight: 700; color: #1B5E9B;">96%</td>
        </tr>
        <tr>
          <td style="padding: 3px 6px;">% efectividad ajuste express</td>
          <td style="padding: 3px 6px; text-align: center; font-weight: 700; color: #1B5E9B;">85% - 88%</td>
        </tr>
        <tr style="background: #F1F3F4;">
          <td style="padding: 3px 6px;">% asignación por cercanía</td>
          <td style="padding: 3px 6px; text-align: center; font-weight: 700; color: #1B5E9B;">80%</td>
        </tr>
      </table>
    row: 0
    col: 44
    width: 28
    height: 5

  # ---------- KPIs (columna izquierda) ----------
  - title: Ajuste Tradicional (PS)
    name: kpi_ajuste_tradicional
    model: Modelo_Indic_Encuestas
    explore: fact_encuesta
    type: single_value
    fields: [fact_encuesta.ps]
    filters:
      dim_encuesta.tipo_encuesta: 02 AJUSTE PRESENCIAL,25 Ajustador Presencial 48h
    limit: 500
    show_single_value_title: false
    show_comparison: false
    note_state: expanded
    note_display: below
    note_text: Meta 96%
    custom_color_enabled: true
    custom_color: "#1B5E9B"
    font_size: '60'
    listen:
      Año: dim_tiempo.num_anio
    row: 5
    col: 0
    width: 16
    height: 6

  - title: Ajuste Express (PS)
    name: kpi_ajuste_express
    model: Modelo_Indic_Encuestas
    explore: fact_encuesta
    type: single_value
    fields: [fact_encuesta.ps]
    filters:
      dim_encuesta.tipo_encuesta: 03 AJUSTE EXPRÉS
    limit: 500
    show_single_value_title: false
    show_comparison: false
    note_state: expanded
    note_display: below
    note_text: Meta 96%
    custom_color_enabled: true
    custom_color: "#1B5E9B"
    font_size: '60'
    listen:
      Año: dim_tiempo.num_anio
    row: 11
    col: 0
    width: 16
    height: 6

  - title: "% Eficiencia Ajuste Express"
    name: kpi_eficiencia
    model: Modelo_Indic_Eficiencia_Ade
    explore: fact_eficiencia_ade
    type: single_value
    fields: [fact_eficiencia_ade.porcentaje_eficiencia]
    limit: 500
    show_single_value_title: false
    show_comparison: false
    note_state: expanded
    note_display: below
    note_text: Meta 85% - 88%
    custom_color_enabled: true
    custom_color: "#1B5E9B"
    font_size: '60'
    listen:
      Año: dim_tiempo.num_anio
    row: 17
    col: 0
    width: 16
    height: 6

  - title: "% Asignación por Cercanía"
    name: kpi_cercania
    model: Modelo_Indic_Tip_Cerc
    explore: fact_tip_cerc
    type: single_value
    fields: [fact_tip_cerc.pct_asignacion_cercania_corregido]
    limit: 500
    show_single_value_title: false
    show_comparison: false
    note_state: expanded
    note_display: below
    note_text: Meta 80%
    custom_color_enabled: true
    custom_color: "#1B5E9B"
    font_size: '60'
    listen:
      Año: dim_tiempo.num_anio
    row: 23
    col: 0
    width: 16
    height: 6

  - title: Integral Atención Ajustador
    name: kpi_atencion
    model: Modelo_Indic_Tip_Cerc
    explore: fact_tip_cerc
    type: single_value
    fields: [fact_tip_cerc.atencion]
    limit: 500
    show_single_value_title: false
    show_comparison: false
    custom_color_enabled: true
    custom_color: "#1B5E9B"
    font_size: '60'
    listen:
      Año: dim_tiempo.num_anio
    row: 29
    col: 0
    width: 16
    height: 6

  # ---------- GRÁFICAS (derecha) ----------
  - title: PS Ajuste Tradicional por mes
    name: grafica_ps_tradicional
    model: Modelo_Indic_Encuestas
    explore: fact_encuesta
    type: looker_column
    fields: [dim_tiempo.num_anio, dim_tiempo.num_mes, dim_tiempo.desc_mes, fact_encuesta.ps]
    pivots: [dim_tiempo.num_anio]
    filters:
      dim_encuesta.tipo_encuesta: 02 AJUSTE PRESENCIAL,25 Ajustador Presencial 48h
    sorts: [dim_tiempo.num_anio, dim_tiempo.num_mes]
    limit: 500
    column_limit: 50
    hidden_fields: [dim_tiempo.num_mes]
    stacking: ''
    show_value_labels: true
    show_view_names: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_x_axis_label: false
    legend_position: center
    colors: ["#1565C0", "#64B5F6"]
    font_size: '12'
    defaults_version: 1
    listen:
      Año: dim_tiempo.num_anio
    row: 5
    col: 16
    width: 28
    height: 15

  - title: PS Ajuste Express por mes
    name: grafica_ps_express
    model: Modelo_Indic_Encuestas
    explore: fact_encuesta
    type: looker_column
    fields: [dim_tiempo.num_anio, dim_tiempo.num_mes, dim_tiempo.desc_mes, fact_encuesta.ps]
    pivots: [dim_tiempo.num_anio]
    filters:
      dim_encuesta.tipo_encuesta: 03 AJUSTE EXPRÉS
    sorts: [dim_tiempo.num_anio, dim_tiempo.num_mes]
    limit: 500
    column_limit: 50
    hidden_fields: [dim_tiempo.num_mes]
    stacking: ''
    show_value_labels: true
    show_view_names: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_x_axis_label: false
    legend_position: center
    colors: ["#1565C0", "#64B5F6"]
    font_size: '12'
    defaults_version: 1
    listen:
      Año: dim_tiempo.num_anio
    row: 5
    col: 44
    width: 28
    height: 15

  - title: "% Eficiencia Ajuste Express"
    name: grafica_eficiencia
    model: Modelo_Indic_Eficiencia_Ade
    explore: fact_eficiencia_ade
    type: looker_line
    fields: [dim_tiempo.num_anio, dim_tiempo.num_mes, dim_tiempo.desc_mes, fact_eficiencia_ade.porcentaje_eficiencia]
    pivots: [dim_tiempo.num_anio]
    filters:
      dim_tiempo.fch_fecha_year: after 2025/01/01
    sorts: [dim_tiempo.num_anio, dim_tiempo.num_mes]
    limit: 500
    column_limit: 50
    hidden_fields: [dim_tiempo.num_mes]
    stacking: ''
    point_style: circle
    show_value_labels: true
    show_view_names: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_x_axis_label: false
    legend_position: center
    interpolation: linear
    colors: ["#1565C0", "#64B5F6"]
    font_size: '12'
    defaults_version: 1
    listen:
      Año: dim_tiempo.num_anio
    row: 20
    col: 16
    width: 28
    height: 15

  - title: "% Asignación por Cercanía"
    name: grafica_cercania
    model: Modelo_Indic_Tip_Cerc
    explore: fact_tip_cerc
    type: looker_line
    fields: [dim_tiempo.num_anio, dim_tiempo.num_mes, dim_tiempo.desc_mes, fact_tip_cerc.pct_asignacion_cercania_corregido]
    pivots: [dim_tiempo.num_anio]
    filters:
      dim_tiempo.fch_fecha_year: after 2025/01/01
    sorts: [dim_tiempo.num_anio, dim_tiempo.num_mes]
    limit: 500
    column_limit: 50
    hidden_fields: [dim_tiempo.num_mes]
    stacking: ''
    point_style: circle
    show_value_labels: true
    show_view_names: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_x_axis_label: false
    legend_position: center
    interpolation: linear
    colors: ["#1565C0", "#64B5F6"]
    font_size: '12'
    defaults_version: 1
    listen:
      Año: dim_tiempo.num_anio
    row: 20
    col: 44
    width: 28
    height: 15

  - title: Distribución del tiempo de arribo por mes
    name: grafica_arribo_distribucion
    model: Modelo_Indic_Tip_Cerc
    explore: fact_tip_cerc
    type: looker_column
    fields: [dim_tiempo.num_anio, dim_tiempo.num_mes, dim_tiempo.desc_mes,
      fact_tip_cerc.pct_menor_31_min, fact_tip_cerc.pct_entre_31_45_min,
      fact_tip_cerc.pct_entre_45_60_min, fact_tip_cerc.pct_mayor_60_min]
    filters:
      dim_tiempo.fch_fecha_date: after 2025/01/01
    sorts: [dim_tiempo.num_anio, dim_tiempo.num_mes]
    limit: 500
    column_limit: 50
    hidden_fields: [dim_tiempo.num_anio, dim_tiempo.num_mes]
    stacking: normal
    show_value_labels: false
    show_view_names: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_x_axis_label: false
    legend_position: center
    series_labels:
      fact_tip_cerc.pct_menor_31_min: "< 31 min"
      fact_tip_cerc.pct_entre_31_45_min: 31 - 45 min
      fact_tip_cerc.pct_entre_45_60_min: 45 - 60 min
      fact_tip_cerc.pct_mayor_60_min: "> 60 min"
    colors: ["#1565C0", "#64B5F6", "#BBDEFB", "#E53935"]
    font_size: '12'
    defaults_version: 1
    listen:
      Año: dim_tiempo.num_anio
    row: 35
    col: 0
    width: 36
    height: 16

  - title: Integral Arribo Ajustador Presencial
    name: grafica_arribo_integral
    model: Modelo_Indic_Tip_Cerc
    explore: fact_tip_cerc
    type: looker_line
    fields: [dim_tiempo.num_anio, dim_tiempo.num_mes, dim_tiempo.desc_mes, fact_tip_cerc.promedio_arribo_hhmmss]
    pivots: [dim_tiempo.num_anio]
    filters:
      dim_tiempo.fch_fecha_year: after 2025/01/01
    sorts: [dim_tiempo.num_anio, dim_tiempo.num_mes]
    limit: 500
    column_limit: 50
    hidden_fields: [dim_tiempo.num_mes]
    stacking: ''
    point_style: circle
    show_value_labels: true
    show_view_names: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_x_axis_label: false
    legend_position: center
    interpolation: linear
    colors: ["#1565C0", "#64B5F6"]
    font_size: '12'
    defaults_version: 1
    listen:
      Año: dim_tiempo.num_anio
    row: 35
    col: 36
    width: 36
    height: 16

  - title: Integral Atención Ajustador Presencial
    name: grafica_atencion
    model: Modelo_Indic_Tip_Cerc
    explore: fact_tip_cerc
    type: looker_line
    fields: [dim_tiempo.num_anio, dim_tiempo.num_mes, dim_tiempo.desc_mes, fact_tip_cerc.atencion]
    pivots: [dim_tiempo.num_anio]
    filters:
      dim_tiempo.fch_fecha_year: after 2025/01/01
    sorts: [dim_tiempo.num_anio, dim_tiempo.num_mes]
    limit: 500
    column_limit: 50
    hidden_fields: [dim_tiempo.num_mes]
    stacking: ''
    point_style: circle
    show_value_labels: true
    show_view_names: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_x_axis_label: false
    legend_position: center
    interpolation: linear
    colors: ["#1565C0", "#64B5F6"]
    font_size: '12'
    defaults_version: 1
    listen:
      Año: dim_tiempo.num_anio
    row: 51
    col: 0
    width: 72
    height: 15

  filters:
  - name: Año
    title: Año
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
      options:
      - '2025'
      - '2026'
    model: Modelo_Indic_Eficiencia_Ade
    explore: fact_eficiencia_ade
    listens_to_filters: []
    field: dim_tiempo.num_anio
