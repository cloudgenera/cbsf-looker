---
- dashboard: contract
  title: Contract
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: BTSiEmnIjv7qLsR22UrlQ2
  elements:
  - title: Contract Commit Tracker
    name: Contract Commit Tracker
    model: cbsf_v1
    explore: enterprise_agreement
    type: looker_grid
    fields: [enterprise_agreement.terms, enterprise_agreement.commit, enterprise_agreement.prev_year_rollover,
      enterprise_agreement.cloud_usage, enterprise_agreement.additional_forecast,
      enterprise_agreement.credit_amount, enterprise_agreement.actual_cost, enterprise_agreement.rollover_cost,
      enterprise_agreement.true_up]
    filters: {}
    sorts: [enterprise_agreement.commit]
    limit: 500
    column_limit: 50
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
    series_value_format:
      enterprise_agreement.commit:
        name: usd
        decimals: '2'
        format_string: "$#,##0.00"
        label: U.S. Dollars (2)
        label_prefix: U.S. Dollars
      enterprise_agreement.prev_year_rollover:
        name: usd
        decimals: '2'
        format_string: "$#,##0.00"
        label: U.S. Dollars (2)
        label_prefix: U.S. Dollars
      enterprise_agreement.cloud_usage:
        name: usd
        decimals: '2'
        format_string: "$#,##0.00"
        label: U.S. Dollars (2)
        label_prefix: U.S. Dollars
      enterprise_agreement.additional_forecast:
        name: usd
        decimals: '2'
        format_string: "$#,##0.00"
        label: U.S. Dollars (2)
        label_prefix: U.S. Dollars
      enterprise_agreement.credit_amount:
        name: usd
        decimals: '2'
        format_string: "$#,##0.00"
        label: U.S. Dollars (2)
        label_prefix: U.S. Dollars
      enterprise_agreement.actual_cost:
        name: usd
        decimals: '2'
        format_string: "$#,##0.00"
        label: U.S. Dollars (2)
        label_prefix: U.S. Dollars
      enterprise_agreement.rollover_cost:
        name: usd
        decimals: '2'
        format_string: "$#,##0.00"
        label: U.S. Dollars (2)
        label_prefix: U.S. Dollars
      enterprise_agreement.true_up:
        name: usd
        decimals: '2'
        format_string: "$#,##0.00"
        label: U.S. Dollars (2)
        label_prefix: U.S. Dollars
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
    listen:
      Terms: enterprise_agreement.terms
    row: 0
    col: 0
    width: 24
    height: 6
  - title: Total Cloud Usage
    name: Total Cloud Usage
    model: cbsf_v1
    explore: enterprise_agreement
    type: single_value
    fields: [enterprise_agreement.total_cloud_usage, enterprise_agreement.terms]
    sorts: [enterprise_agreement.total_cloud_usage desc 0]
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
    hidden_fields: [enterprise_agreement.terms]
    listen:
      Terms: enterprise_agreement.terms
    row: 6
    col: 7
    width: 9
    height: 6
  filters:
  - name: Terms
    title: Terms
    type: field_filter
    default_value: 2024-09-01 to 2025-08-31
    allow_multiple_values: true
    required: true
    ui_config:
      type: button_group
      display: inline
    model: cbsf_v1
    explore: enterprise_agreement
    listens_to_filters: []
    field: enterprise_agreement.terms
