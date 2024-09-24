---
- dashboard: historical_spend
  title: Historical Spend
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: DHdluVkGpsiXVD89ZWjZqM
  elements:
  - title: Historical Performance by Cost Group
    name: Historical Performance by Cost Group
    model: cbsf_v1
    explore: contract_summary
    type: looker_column
    fields: [contract_summary.invoice_year, contract_summary.invoice_quarter_of_year,
      contract_summary.invoice_month_name, contract_summary.invoice_month, contract_summary.estimated_invoice]
    sorts: [contract_summary.invoice_month]
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
    hidden_fields: [contract_summary.invoice_month]
    listen:
      Cost Group Name: contract_summary.cost_group_name
      Cost Group Type: contract_summary.cost_group_type
      Invoice Start: contract_summary.invoice_month
    row: 0
    col: 0
    width: 24
    height: 7
  - title: Google Cloud Spend by Cost Group
    name: Google Cloud Spend by Cost Group
    model: cbsf_v1
    explore: contract_summary
    type: looker_grid
    fields: [contract_summary.cost_group_name, contract_summary.dedicated, contract_summary.shared,
      contract_summary.license, contract_summary.unallocated, contract_summary.estimated_invoice]
    sorts: [contract_summary.cost_group_name]
    limit: 500
    column_limit: 50
    total: true
    dynamic_fields:
    - _kind_hint: measure
      _type_hint: list
      based_on: contract_summary.cost_group_name
      expression: ''
      label: List of Cost Group Name
      measure: list_of_cost_group_name
      type: list
    show_view_names: false
    show_row_numbers: false
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
    series_cell_visualizations:
      contract_summary.estimated_invoice:
        is_active: true
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Cost Group Name: contract_summary.cost_group_name
      Cost Group Type: contract_summary.cost_group_type
      Invoice Start: contract_summary.invoice_month
    row: 7
    col: 0
    width: 19
    height: 6
  - title: Total Cloud Spend
    name: Total Cloud Spend
    model: cbsf_v1
    explore: contract_summary
    type: single_value
    fields: [contract_summary.estimated_invoice]
    limit: 500
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
    listen:
      Cost Group Type: contract_summary.cost_group_type
      Cost Group Name: contract_summary.cost_group_name
      Invoice Start: contract_summary.invoice_month
      Invoice End: contract_summary.invoice_month
    row: 7
    col: 19
    width: 5
    height: 6
  filters:
  - name: Cost Group Name
    title: Cost Group Name
    type: field_filter
    default_value: ''
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
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: popover
    model: cbsf_v1
    explore: contract_summary
    listens_to_filters: []
    field: contract_summary.cost_group_type
  - name: Invoice Start
    title: Invoice Start
    type: field_filter
    default_value: after 2022/09/01
    allow_multiple_values: false
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: cbsf_v1
    explore: contract_summary
    listens_to_filters: []
    field: contract_summary.invoice_month
  - name: Invoice End
    title: Invoice End
    type: field_filter
    default_value: before 2025/11/30
    allow_multiple_values: false
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: cbsf_v1
    explore: contract_summary
    listens_to_filters: []
    field: contract_summary.invoice_month