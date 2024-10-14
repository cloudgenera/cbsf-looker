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
    explore: cost_summary
    type: single_value
    fields: [cost_summary.dedicated_usage]
    filters:
      cost_summary.amount_type: Current Month Estimate
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
    listen: {}
    row: 0
    col: 0
    width: 8
    height: 5
  - title: Monthly Average (TTM)
    name: Monthly Average (TTM)
    model: cbsf_v1
    explore: cost_summary
    type: single_value
    fields: [cost_summary.dedicated_usage]
    filters:
      cost_summary.amount_type: Current Month Estimate,Previous Month,History
      cost_summary.invoice_date_month: after 12 months ago
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${cost_summary.dedicated_usage}/${cost_summary.current_and_previous_months_count}"
      label: monthly_avg
      value_format:
      value_format_name: usd
      _kind_hint: measure
      table_calculation: monthly_avg
      _type_hint: number
      is_disabled: true
    - category: table_calculation
      expression: "${cost_summary.dedicated_usage}/12"
      label: monthly_avg
      value_format:
      value_format_name: usd
      _kind_hint: measure
      table_calculation: monthly_avg_1
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
    hidden_fields: [cost_summary.dedicated_usage]
    defaults_version: 1
    hidden_pivots: {}
    listen: {}
    row: 0
    col: 8
    width: 8
    height: 5
  - title: Cost Allocations by Cost Group (>1k)
    name: Cost Allocations by Cost Group (>1k)
    model: cbsf_v1
    explore: cost_summary
    type: looker_column
    fields: [cost_summary.cost_group, cost_summary.dedicated_usage, cost_summary.shared_usage,
      cost_summary.dedicated_plus_shared_usage]
    filters:
      cost_summary.dedicated_plus_shared_net_cost: ">=1000"
      cost_summary.amount_type: Current Month Estimate
    sorts: [cost_summary.dedicated_plus_shared_usage desc]
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
    hidden_fields: [cost_summary.dedicated_plus_shared_usage]
    defaults_version: 1
    hidden_pivots: {}
    listen: {}
    row: 5
    col: 0
    width: 8
    height: 9
  - title: Cost Allocation Estimates
    name: Cost Allocation Estimates
    model: cbsf_v1
    explore: cost_summary
    type: looker_grid
    fields: [cost_summary.cost_group, cost_summary.dedicated_usage, cost_summary.shared_usage,
      cost_summary.dedicated_plus_shared_usage]
    filters:
      cost_summary.amount_type: Current Month Estimate
    sorts: [cost_summary.dedicated_plus_shared_usage desc]
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
      cost_summary.dedicated_net_cost:
        is_active: false
    x_axis_gridlines: false
    y_axis_gridlines: true
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
    hidden_fields:
    hidden_pivots: {}
    listen: {}
    row: 5
    col: 8
    width: 8
    height: 9
  - title: Current Spend Estimate Pie Chart
    name: Current Spend Estimate Pie Chart
    model: cbsf_v1
    explore: cost_summary
    type: looker_pie
    fields: [cost_summary.cost_group, sum_of_total_cost]
    filters:
      cost_summary.amount_type: Current Month Estimate
    sorts: [sum_of_total_cost desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: measure
      expression: ''
      label: Sum of Net Cost
      value_format:
      value_format_name: usd
      based_on: cost_summary.net_cost
      _kind_hint: measure
      measure: sum_of_net_cost
      type: sum
      _type_hint: number
    - _kind_hint: measure
      _type_hint: number
      based_on: cost_summary.total_cost
      expression: ''
      label: Sum of Total Cost
      measure: sum_of_total_cost
      type: sum
    value_labels: legend
    label_type: labPer
    defaults_version: 1
    hidden_pivots: {}
    listen: {}
    row: 5
    col: 16
    width: 8
    height: 9
  - title: Monthly Commitment
    name: Monthly Commitment
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
    value_format: "$#,##0.00"
    defaults_version: 1
    hidden_pivots: {}
    row: 0
    col: 16
    width: 8
    height: 5
