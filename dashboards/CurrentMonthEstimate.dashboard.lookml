---
- dashboard: current_month_estimate
  title: Current Month Estimate
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: yvVO8azRyuESP7t2O3QFEJ
  elements:
  - title: Current Month Estimate
    name: Current Month Estimate
    model: cbsf_v1
    explore: contract_summary
    type: single_value
    fields: [contract_summary.estimated_invoice]
    filters:
      contract_summary.contract_invoice_months: Current Month
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen: {}
    row: 0
    col: 0
    width: 8
    height: 5
  - title: Cost Allocation Estimates
    name: Cost Allocation Estimates
    model: cbsf_v1
    explore: contract_summary
    type: looker_grid
    fields: [contract_summary.cost_group_name, contract_summary.dedicated, contract_summary.shared,
      contract_summary.license, contract_summary.estimated_invoice]
    filters:
      contract_summary.contract_invoice_months: Current Month
    sorts: [contract_summary.estimated_invoice desc]
    limit: 500
    column_limit: 50
    total: true
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen: {}
    row: 5
    col: 8
    width: 8
    height: 9
  - title: Cost Distributions by Customer (>1k)
    name: Cost Distributions by Customer (>1k)
    model: cbsf_v1
    explore: contract_summary
    type: looker_column
    fields: [contract_summary.cost_group_name, contract_summary.dedicated, contract_summary.shared,
      contract_summary.dedicated_plus_shared]
    filters:
      contract_summary.contract_invoice_months: Current Month
      contract_summary.dedicated_plus_shared: ">=1000"
    sorts: [contract_summary.dedicated_plus_shared desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${contract_summary.dedicated}+${contract_summary.shared}"
      label: dedicated_plus_shared
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: dedicated_plus_shared
      _type_hint: number
      is_disabled: true
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: contract_summary.dedicated,
            id: contract_summary.dedicated, name: Dedicated}, {axisId: contract_summary.shared,
            id: contract_summary.shared, name: Shared}], showLabels: true, showValues: true,
        minValue: 1000, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    defaults_version: 1
    hidden_fields: [contract_summary.dedicated_plus_shared]
    hidden_pivots: {}
    listen: {}
    row: 5
    col: 0
    width: 8
    height: 9
  - title: Google Spend Estimate Pie Chart
    name: Google Spend Estimate Pie Chart
    model: cbsf_v1
    explore: contract_summary
    type: looker_pie
    fields: [contract_summary.cost_group_name, contract_summary.estimated_invoice]
    filters:
      contract_summary.contract_invoice_months: Current Month
    sorts: [contract_summary.estimated_invoice desc 0]
    limit: 500
    column_limit: 50
    value_labels: legend
    label_type: labPer
    defaults_version: 1
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    show_value_labels: true
    font_size: 12
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    smoothedBars: false
    orientation: automatic
    labelPosition: left
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    up_color: false
    down_color: false
    total_color: false
    x_axis_scale: auto
    color_application: undefined
    groupBars: true
    labelSize: 10pt
    showLegend: true
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    map: auto
    map_projection: ''
    quantize_colors: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    label_density: 25
    y_axis_combined: true
    show_null_points: true
    row: 5
    col: 16
    width: 8
    height: 9
  - title: Monthly Google Commit
    name: Monthly Google Commit
    model: cbsf_v1
    explore: contract_agreement
    type: single_value
    fields: [contract_agreement.current_budget]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    value_format: "#,##0.00"
    defaults_version: 1
    row: 0
    col: 16
    width: 8
    height: 5
  - title: Monthly Average (TTM)
    name: Monthly Average (TTM)
    model: cbsf_v1
    explore: contract_summary
    type: single_value
    fields: [contract_summary.dedicated_total_cost, contract_summary.current_and_previous_months_count]
    filters:
      contract_summary.contract_invoice_months: Current Month,HISTORY,Previous Month
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${contract_summary.dedicated_total_cost}/${contract_summary.current_and_previous_months_count}"
      label: monthly_avg
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: monthly_avg
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    value_format: "#,##0.00"
    defaults_version: 1
    hidden_fields: [contract_summary.dedicated_total_cost, contract_summary.current_and_previous_months_count]
    row: 0
    col: 8
    width: 8
    height: 5