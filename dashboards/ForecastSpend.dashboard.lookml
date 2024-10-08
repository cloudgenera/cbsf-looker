---
- dashboard: forecast_spend
  title: Forecast Spend
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: E5NEnEZvecxqD7gvRFNkYH
  elements:
  - title: Forecast Amount
    name: Forecast Amount
    model: cbsf_v1
    explore: cost_summary
    type: single_value
    fields: [sum_of_net_cost]
    filters:
      cost_summary.amount_type: Current Month Estimate,Future
    limit: 500
    column_limit: 50
    dynamic_fields:
    - _kind_hint: measure
      _type_hint: number
      based_on: cost_summary.net_cost
      expression: ''
      label: Sum of Net Cost
      measure: sum_of_net_cost
      type: sum
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    value_format: "$#,##0.00"
    defaults_version: 1
    listen:
      Invoice Date Month: cost_summary.invoice_date_month
      Cost Group: cost_summary.cost_group
    row: 0
    col: 19
    width: 5
    height: 6
  - title: Cloud Spend Forecast
    name: Cloud Spend Forecast
    model: cbsf_v1
    explore: cost_summary
    type: looker_column
    fields: [cost_summary.dedicated_net_cost, cost_summary.shared_net_cost, cost_summary.invoice_date_month_name,
      cost_summary.invoice_date_quarter, cost_summary.invoice_date_month]
    filters:
      cost_summary.amount_type: Current Month Estimate,Future
    sorts: [cost_summary.invoice_date_month]
    limit: 500
    column_limit: 50
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
    stacking: ''
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
    y_axes: [{label: '', orientation: left, series: [{axisId: cost_summary.dedicated_net_cost,
            id: cost_summary.dedicated_net_cost, name: Dedicated Net Cost}, {axisId: cost_summary.shared_net_cost,
            id: cost_summary.shared_net_cost, name: Shared Net Cost}], showLabels: true,
        showValues: true, valueFormat: '', unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    label_value_format: ''
    defaults_version: 1
    hidden_fields: [cost_summary.invoice_date_month]
    listen:
      Invoice Date Month: cost_summary.invoice_date_month
      Cost Group: cost_summary.cost_group
    row: 0
    col: 0
    width: 19
    height: 6
  - title: Cost Allocation Forecast
    name: Cost Allocation Forecast
    model: cbsf_v1
    explore: cost_summary
    type: looker_grid
    fields: [cost_summary.cost_group, cost_summary.invoice_date_month, sum_of_net_cost]
    pivots: [cost_summary.cost_group]
    fill_fields: [cost_summary.invoice_date_month]
    filters:
      cost_summary.amount_type: Current Month Estimate,Future
    sorts: [cost_summary.cost_group, cost_summary.invoice_date_month]
    limit: 500
    column_limit: 50
    total: true
    row_total: right
    dynamic_fields:
    - _kind_hint: measure
      _type_hint: number
      based_on: cost_summary.net_cost
      expression: ''
      label: Sum of Net Cost
      measure: sum_of_net_cost
      type: sum
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
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      sum_of_net_cost: Net Cost
    series_column_widths:
      Accredit_sum_of_net_cost: 148
    series_cell_visualizations:
      sum_of_net_cost:
        is_active: false
    series_value_format:
      sum_of_net_cost: "$#,##0.00"
    hidden_pivots: {}
    defaults_version: 1
    listen:
      Invoice Date Month: cost_summary.invoice_date_month
      Cost Group: cost_summary.cost_group
    row: 6
    col: 0
    width: 24
    height: 6
  filters:
  - name: Invoice Date Month
    title: Invoice Date Month
    type: field_filter
    default_value: 2024/10/01 to 2025/12/31
    allow_multiple_values: true
    required: false
    ui_config:
      type: day_range_picker
      display: inline
      options: []
    model: cbsf_v1
    explore: cost_summary
    listens_to_filters: []
    field: cost_summary.invoice_date_month
  - name: Cost Group
    title: Cost Group
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: cbsf_v1
    explore: cost_summary
    listens_to_filters: []
    field: cost_summary.cost_group
