---
- dashboard: budget_group_summary
  title: Budget Group Summary
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: r2YU9HSGnbY5xhY01RsNfy
  elements:
  - title: Forecast
    name: Forecast
    model: cbsf_v1
    explore: budget_summary_derived
    type: single_value
    fields: [budget_summary_derived.spend]
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
    hidden_pivots: {}
    listen:
      Year: budget_summary_derived.year
      Budget Name: budget_summary_derived.budget_name
      Cost Group: budget_summary_derived.group_name
    row: 0
    col: 0
    width: 6
    height: 3
  - title: Variance $
    name: Variance $
    model: cbsf_v1
    explore: budget_summary_derived
    type: single_value
    fields: [budget_summary_derived.variance]
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
      Year: budget_summary_derived.year
      Budget Name: budget_summary_derived.budget_name
      Cost Group: budget_summary_derived.group_name
    row: 6
    col: 0
    width: 6
    height: 3
  - title: Budget Amount
    name: Budget Amount
    model: cbsf_v1
    explore: budget_summary_derived
    type: single_value
    fields: [budget_summary_derived.budget_value_total]
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
      Year: budget_summary_derived.year
      Budget Name: budget_summary_derived.budget_name
      Cost Group: budget_summary_derived.group_name
    row: 3
    col: 0
    width: 6
    height: 3
  - title: Variance %
    name: Variance %
    model: cbsf_v1
    explore: budget_summary_derived
    type: single_value
    fields: [budget_summary_derived.spend, budget_summary_derived.budget_value_total]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${budget_summary_derived.spend}/${budget_summary_derived.budget_value_total}"
      label: Variance %
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      table_calculation: variance
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
    hidden_fields: [budget_summary_derived.spend, budget_summary_derived.budget_value_total]
    listen:
      Year: budget_summary_derived.year
      Budget Name: budget_summary_derived.budget_name
      Cost Group: budget_summary_derived.group_name
    row: 9
    col: 0
    width: 6
    height: 3
  - title: YTD Budget Amount
    name: YTD Budget Amount
    model: cbsf_v1
    explore: budget_summary_derived
    type: single_value
    fields: [budget_summary_derived.budget_value_total]
    filters:
      budget_summary_derived.invoice_month_date: before 0 days ago
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
    listen:
      Year: budget_summary_derived.year
      Budget Name: budget_summary_derived.budget_name
      Cost Group: budget_summary_derived.group_name
    row: 3
    col: 6
    width: 6
    height: 3
  - title: YTD Spend
    name: YTD Spend
    model: cbsf_v1
    explore: budget_summary_derived
    type: single_value
    fields: [budget_summary_derived.spend]
    filters:
      budget_summary_derived.invoice_month_date: before 0 days ago
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
    hidden_fields: []
    listen:
      Year: budget_summary_derived.year
      Budget Name: budget_summary_derived.budget_name
      Cost Group: budget_summary_derived.group_name
    row: 0
    col: 6
    width: 6
    height: 3
  - title: YTD Variance %
    name: YTD Variance %
    model: cbsf_v1
    explore: budget_summary_derived
    type: single_value
    fields: [budget_summary_derived.spend, budget_summary_derived.budget_value_total]
    filters:
      budget_summary_derived.invoice_month_date: before 0 days ago
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${budget_summary_derived.spend}/${budget_summary_derived.budget_value_total}"
      label: YTD Variance %
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      table_calculation: ytd_variance
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
    hidden_fields: [budget_summary_derived.spend, budget_summary_derived.budget_value_total]
    defaults_version: 1
    listen:
      Year: budget_summary_derived.year
      Budget Name: budget_summary_derived.budget_name
      Cost Group: budget_summary_derived.group_name
    row: 9
    col: 6
    width: 6
    height: 3
  - title: YTD Variance $
    name: YTD Variance $
    model: cbsf_v1
    explore: budget_summary_derived
    type: single_value
    fields: [budget_summary_derived.variance]
    filters:
      budget_summary_derived.invoice_month_date: before 0 days ago
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
    listen:
      Year: budget_summary_derived.year
      Budget Name: budget_summary_derived.budget_name
      Cost Group: budget_summary_derived.group_name
    row: 6
    col: 6
    width: 6
    height: 3
  - title: Cloud Spend
    name: Cloud Spend
    model: cbsf_v1
    explore: budget_summary_derived
    type: looker_column
    fields: [budget_summary_derived.budget_name, budget_summary_derived.invoice_month_month,
      budget_summary_derived.spend]
    pivots: [budget_summary_derived.budget_name]
    fill_fields: [budget_summary_derived.invoice_month_month]
    sorts: [budget_summary_derived.budget_name, budget_summary_derived.invoice_month_month
        desc]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
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
    hidden_pivots: {}
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    listen:
      Year: budget_summary_derived.year
      Budget Name: budget_summary_derived.budget_name
      Cost Group: budget_summary_derived.group_name
    row: 0
    col: 12
    width: 12
    height: 12
  - title: Monthly Spend by Budget Group
    name: Monthly Spend by Budget Group
    model: cbsf_v1
    explore: budget_summary_derived
    type: looker_grid
    fields: [budget_summary_derived.group_name, budget_summary_derived.budget_name,
      budget_summary_derived.spend, budget_summary_derived.invoice_month_month]
    pivots: [budget_summary_derived.invoice_month_month]
    fill_fields: [budget_summary_derived.invoice_month_month]
    sorts: [budget_summary_derived.invoice_month_month, budget_summary_derived.group_name]
    limit: 500
    column_limit: 50
    total: true
    row_total: right
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
    series_labels:
      budget_summary_derived.invoice_month_month: Month
    series_cell_visualizations:
      budget_summary_derived.spend:
        is_active: false
    hidden_pivots: {}
    defaults_version: 1
    listen:
      Year: budget_summary_derived.year
      Budget Name: budget_summary_derived.budget_name
      Cost Group: budget_summary_derived.group_name
    row: 12
    col: 0
    width: 24
    height: 7
  filters:
  - name: Year
    title: Year
    type: field_filter
    default_value: '2025'
    allow_multiple_values: false
    required: true
    ui_config:
      type: button_toggles
      display: inline
    model: cbsf_v1
    explore: budget_summary_derived
    listens_to_filters: []
    field: budget_summary_derived.year
  - name: Cost Group
    title: Cost Group
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: popover
    model: cbsf_v1
    explore: budget_summary_derived
    listens_to_filters: []
    field: budget_summary_derived.group_name
  - name: Budget Name
    title: Budget Name
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: popover
    model: cbsf_v1
    explore: budget_summary_derived
    listens_to_filters: []
    field: budget_summary_derived.budget_name
