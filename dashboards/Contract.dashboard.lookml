---
- dashboard: contract
  title: Contract
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: BTSiEmnIjv7qLsR22UrlQ2
  elements:
  - title: Google Contract Commit Tracker
    name: Google Contract Commit Tracker
    model: cbsf_v1
    explore: contract_agreement
    type: table
    fields: [contract_agreement.term_years, contract_agreement.commit, contract_agreement.prev_year_rollover_cost,
      contract_agreement.total_commitment, contract_agreement.total_cost, contract_agreement.rollover_cost,
      contract_agreement.unused]
    sorts: [contract_agreement.term_years]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_labels:
      contract_agreement.prev_year_rollover_cost: Previous Year Rollover
      contract_agreement.unused: True Up Amount
      contract_agreement.total_cost: Total Cloud Spend
      contract_agreement.rollover_cost: Rollover Amount
    transpose: false
    truncate_text: true
    size_to_fit: true
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    defaults_version: 1
    hidden_pivots: {}
    listen: {}
    row: 0
    col: 0
    width: 24
    height: 6
  - title: Google Compute Engine Spend
    name: Google Compute Engine Spend
    model: cbsf_v1
    explore: contract_agreement
    type: single_value
    fields: [contract_agreement.contract_dedicated]
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
      Term Years: contract_agreement.term_years
    row: 6
    col: 0
    width: 8
    height: 6
  - title: Unallocated Spend
    name: Unallocated Spend
    model: cbsf_v1
    explore: contract_agreement
    type: single_value
    fields: [contract_agreement.contract_unallocated]
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
    hidden_pivots: {}
    listen:
      Term Years: contract_agreement.term_years
    row: 6
    col: 16
    width: 8
    height: 6
  - title: Google Marketplace Spend
    name: Google Marketplace Spend
    model: cbsf_v1
    explore: contract_agreement
    type: single_value
    fields: [contract_agreement.contract_license]
    sorts: [contract_agreement.contract_license desc 0]
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
      Term Years: contract_agreement.term_years
    row: 6
    col: 8
    width: 8
    height: 6
  filters:
  - name: Term Years
    title: Term Years
    type: field_filter
    default_value: September 2022 - August 2023,September 2023 - August 2024,September
      2024 - August 2025
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_group
      display: inline
    model: cbsf_v1
    explore: contract_agreement
    listens_to_filters: []
    field: contract_agreement.term_years
