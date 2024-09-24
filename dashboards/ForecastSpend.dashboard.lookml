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
    explore: contract_summary
    type: single_value
    fields: [contract_summary.estimated_invoice]
    filters:
      contract_summary.contract_invoice_months: Current Month,Future
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
    listen:
      Invoice Month: contract_summary.invoice_month
      Cost Group Name: contract_summary.cost_group_name
      Cost Group Type: contract_summary.cost_group_type
    row: 0
    col: 18
    width: 6
    height: 6
  - title: Cost Allocation Forecast
    name: Cost Allocation Forecast
    model: cbsf_v1
    explore: contract_summary
    type: table
    fields: [contract_summary.invoice_month, contract_summary.cost_group_name, contract_summary.estimated_invoice]
    pivots: [contract_summary.cost_group_name]
    fill_fields: [contract_summary.invoice_month]
    filters:
      contract_summary.contract_invoice_months: Current Month,Future
    sorts: [contract_summary.cost_group_name, contract_summary.invoice_month desc,
      contract_summary.estimated_invoice desc 0]
    limit: 500
    column_limit: 50
    total: true
    row_total: right
    show_view_names: false
    show_row_numbers: false
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_labels: {}
    transpose: false
    truncate_text: true
    size_to_fit: true
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Invoice Month: contract_summary.invoice_month
      Cost Group Name: contract_summary.cost_group_name
      Cost Group Type: contract_summary.cost_group_type
    row: 6
    col: 0
    width: 24
    height: 6
  - title: Cloud Spend Forecast
    name: Cloud Spend Forecast
    model: cbsf_v1
    explore: contract_summary
    type: looker_column
    fields: [contract_summary.invoice_quarter, contract_summary.dedicated, contract_summary.shared,
      contract_summary.license, contract_summary.invoice_month_name]
    filters:
      contract_summary.contract_invoice_months: Current Month,Future
    sorts: [contract_summary.invoice_quarter desc]
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
    defaults_version: 1
    listen:
      Invoice Month: contract_summary.invoice_month
      Cost Group Name: contract_summary.cost_group_name
      Cost Group Type: contract_summary.cost_group_type
    row: 0
    col: 0
    width: 18
    height: 6
  filters:
  - name: Invoice Month
    title: Invoice Month
    type: field_filter
    default_value: 2024/09/01 to 2026/01/01
    allow_multiple_values: true
    required: false
    ui_config:
      type: day_range_picker
      display: popover
      options: []
    model: cbsf_v1
    explore: contract_summary
    listens_to_filters: []
    field: contract_summary.invoice_month
  - name: Cost Group Name
    title: Cost Group Name
    type: field_filter
    default_value: GCP Invoice
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: popover
    model: cbsf_v1
    explore: contract_summary
    listens_to_filters: []
    field: contract_summary.cost_group_name
  - name: Cost Group Type
    title: Cost Group Type
    type: field_filter
    default_value: Dedicated
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: inline
    model: cbsf_v1
    explore: contract_summary
    listens_to_filters: []
    field: contract_summary.cost_group_type