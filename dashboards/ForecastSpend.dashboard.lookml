---
- dashboard: forecast_usage
  title: Forecast Usage
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
    fields: [sum_of_total_cost]
    filters: {}
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
    - category: measure
      expression: ''
      label: Sum of Total Cost
      value_format:
      value_format_name: usd
      based_on: cost_summary.total_cost
      _kind_hint: measure
      measure: sum_of_total_cost
      type: sum
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
    value_format: "$#,##0.00"
    defaults_version: 1
    listen:
      Cost Group: cost_summary.cost_group
      Amount Type: cost_summary.amount_type
      Invoice Date Date: cost_summary.invoice_date_date
    row: 0
    col: 0
    width: 9
    height: 3
  - title: Cloud Spend Forecast
    name: Cloud Spend Forecast
    model: cbsf_v1
    explore: cost_summary
    type: looker_column
    fields: [cost_summary.invoice_date_month_name, cost_summary.invoice_date_quarter,
      cost_summary.invoice_date_month, cost_summary.dedicated_usage, cost_summary.shared_usage]
    filters: {}
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
      Cost Group: cost_summary.cost_group
      Amount Type: cost_summary.amount_type
      Invoice Date Date: cost_summary.invoice_date_date
    row: 3
    col: 0
    width: 24
    height: 6
  - title: Cost Allocation Forecast
    name: Cost Allocation Forecast
    model: cbsf_v1
    explore: cost_summary
    type: looker_grid
    fields: [cost_summary.cost_group, cost_summary.invoice_date_month, sum_of_total_cost]
    pivots: [cost_summary.cost_group]
    fill_fields: [cost_summary.invoice_date_month]
    filters: {}
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
    - category: measure
      expression: ''
      label: Sum of Total Cost
      value_format:
      value_format_name: usd
      based_on: cost_summary.total_cost
      _kind_hint: measure
      measure: sum_of_total_cost
      type: sum
      _type_hint: number
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
      sum_of_total_cost: Usage
    series_column_widths:
      cloud billing show back and forecast_sum_of_total_cost: 88
    series_cell_visualizations:
      sum_of_net_cost:
        is_active: false
    hidden_pivots: {}
    defaults_version: 1
    listen:
      Cost Group: cost_summary.cost_group
      Amount Type: cost_summary.amount_type
      Invoice Date Date: cost_summary.invoice_date_date
    row: 9
    col: 0
    width: 24
    height: 7
  filters:
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
  - name: Amount Type
    title: Amount Type
    type: field_filter
    default_value: Current Month Estimate,Future
    allow_multiple_values: true
    required: true
    ui_config:
      type: button_group
      display: popover
      options:
      - Current Month Estimate
      - Future
    model: cbsf_v1
    explore: cost_summary
    listens_to_filters: []
    field: cost_summary.amount_type
  - name: Invoice Date Date
    title: Invoice Date Date
    type: field_filter
    default_value: 2024/10/01 to 2026/01/02
    allow_multiple_values: true
    required: false
    ui_config:
      type: day_range_picker
      display: inline
      options: []
    model: cbsf_v1
    explore: cost_summary
    listens_to_filters: []
    field: cost_summary.invoice_date_date
