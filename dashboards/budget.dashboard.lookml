---
- dashboard: budget
  title: Budget
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: QCetVOESjS5MIf2RopkY2a
  elements:
  - title: Monthly Spend by Budget
    name: Monthly Spend by Budget
    model: cbsf_v1
    explore: budget_summary
    type: looker_grid
    fields: [budget_summary.budget_name, budget_summary.invoice_month_month, budget_summary.spend]
    pivots: [budget_summary.invoice_month_month]
    fill_fields: [budget_summary.invoice_month_month]
    sorts: [budget_summary.invoice_month_month, budget_summary.budget_name]
    limit: 500
    column_limit: 50
    total: true
    row_total: right
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: editable
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
      budget_summary.budget_name: Budget
      budget_summary.invoice_month_month: Month
      budget_summary.cost_share: "."
      budget_summary.spend: "."
    series_cell_visualizations:
      budget_summary.cost:
        is_active: false
    series_value_format:
      budget_summary.spend:
        name: usd_0
        decimals: '0'
        format_string: "$#,##0"
        label: U.S. Dollars (0)
        label_prefix: U.S. Dollars
    truncate_column_names: false
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Budget Year: budget_summary.invoice_month_year
      Budget Group: budget_summary.group_name
    row: 7
    col: 0
    width: 21
    height: 6
  - title: Monthly Spend by Budget Group
    name: Monthly Spend by Budget Group
    model: cbsf_v1
    explore: budget_summary
    type: looker_column
    fields: [budget_summary.group_name, budget_summary.invoice_month_month, budget_summary.spend]
    pivots: [budget_summary.group_name]
    fill_fields: [budget_summary.invoice_month_month]
    sorts: [budget_summary.group_name, budget_summary.invoice_month_month desc]
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
    x_axis_zoom: true
    y_axis_zoom: true
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Budget Year: budget_summary.invoice_month_year
    row: 0
    col: 6
    width: 15
    height: 7
  - title: Untitled
    name: Untitled
    model: cbsf_v1
    explore: budget_summary
    type: single_value
    fields: [budget_summary.spend]
    filters:
      budget_summary.invoice_month_month: before 0 months ago
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
    single_value_title: YTD Spend
    value_format: "$#,##0"
    defaults_version: 1
    listen:
      Budget Year: budget_summary.invoice_month_year
      Budget Group: budget_summary.group_name
    row: 0
    col: 0
    width: 3
    height: 7
  - title: Untitled (Copy)
    name: Untitled (Copy)
    model: cbsf_v1
    explore: budget_summary
    type: single_value
    fields: [budget_summary.spend]
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
    single_value_title: Forecasted Spend
    value_format: "$#,##0"
    defaults_version: 1
    listen:
      Budget Year: budget_summary.invoice_month_year
      Budget Group: budget_summary.group_name
    row: 0
    col: 3
    width: 3
    height: 7
  filters:
  - name: Budget Year
    title: Budget Year
    type: field_filter
    default_value: '2024'
    allow_multiple_values: false
    required: true
    ui_config:
      type: advanced
      display: popover
      options: []
    model: cbsf_v1
    explore: budget_summary
    listens_to_filters: []
    field: budget_summary.invoice_month_year
  - name: Budget Group
    title: Budget Group
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    model: cbsf_v1
    explore: budget_summary
    listens_to_filters: []
    field: budget_summary.group_name
