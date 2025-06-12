---
- dashboard: historical_spend
  title: Historical Spend
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: DHdluVkGpsiXVD89ZWjZqM
  elements:
  - title: Sum of Cost
    name: Sum of Cost
    model: cbsf_v1
    explore: cost_summary_derived
    type: single_value
    fields: [cost_summary_derived.sum_of_cost]
    filters:
      cost_summary_derived.amount_type: History,Previous Month
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
      Cost Group: cost_summary_derived.cost_group
      Cost Type: cost_summary_derived.cost_type
      Type: cost_summary_derived.type
      Invoice Date Date: cost_summary_derived.invoice_date_date
    row: 7
    col: 18
    width: 6
    height: 7
  - title: Historical Performance
    name: Historical Performance
    model: cbsf_v1
    explore: cost_summary_derived
    type: looker_column
    fields: [cost_summary_derived.invoice_date_month, cost_summary_derived.sum_of_cost,
      cost_summary_derived.cost_group]
    pivots: [cost_summary_derived.cost_group]
    fill_fields: [cost_summary_derived.invoice_date_month]
    filters:
      cost_summary_derived.amount_type: History,Previous Month
    sorts: [cost_summary_derived.cost_group, cost_summary_derived.invoice_date_month]
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
    y_axes: [{label: Cost, orientation: left, series: [{axisId: cost_summary_derived.sum_of_cost,
            id: cost_summary_derived.sum_of_cost, name: Sum of Cost}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    hide_legend: false
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Cost Group: cost_summary_derived.cost_group
      Cost Type: cost_summary_derived.cost_type
      Type: cost_summary_derived.type
      Invoice Date Date: cost_summary_derived.invoice_date_date
    row: 0
    col: 0
    width: 24
    height: 7
  - title: Cloud Spend By Cost Group
    name: Cloud Spend By Cost Group
    model: cbsf_v1
    explore: cost_summary_derived
    type: looker_grid
    fields: [cost_summary_derived.sum_of_dedicated, cost_summary_derived.sum_of_shared,
      cost_summary_derived.sum_of_cost, cost_summary_derived.cost_group]
    filters:
      cost_summary_derived.amount_type: History,Previous Month
    sorts: [cost_summary_derived.cost_group]
    limit: 500
    column_limit: 50
    total: true
    dynamic_fields:
    - _kind_hint: measure
      _type_hint: list
      based_on: cost_summary_derived.cost_group
      expression: ''
      label: List of Cost Group
      measure: list_of_cost_group
      type: list
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
      cost_summary_derived.sum_of_cost: Total
      cost_summary_derived.sum_of_dedicated: Dedicated
      cost_summary_derived.sum_of_shared: Shared
    series_cell_visualizations:
      cost_summary_derived.sum_of_dedicated:
        is_active: false
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Cost Group: cost_summary_derived.cost_group
      Cost Type: cost_summary_derived.cost_type
      Type: cost_summary_derived.type
      Invoice Date Date: cost_summary_derived.invoice_date_date
    row: 7
    col: 0
    width: 18
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
    explore: cost_summary_derived
    listens_to_filters: []
    field: cost_summary_derived.cost_group
  - name: Cost Type
    title: Cost Type
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: popover
    model: cbsf_v1
    explore: cost_summary_derived
    listens_to_filters: []
    field: cost_summary_derived.cost_type
  - name: Type
    title: Type
    type: field_filter
    default_value: Dedicated
    allow_multiple_values: false
    required: true
    ui_config:
      type: button_toggles
      display: inline
    model: cbsf_v1
    explore: cost_summary_derived
    listens_to_filters: []
    field: cost_summary_derived.type
  - name: Invoice Date Date
    title: Invoice Date Date
    type: field_filter
    default_value: 2025/01/01 to 2026/01/01
    allow_multiple_values: true
    required: false
    ui_config:
      type: day_range_picker
      display: inline
      options: []
    model: cbsf_v1
    explore: cost_summary_derived
    listens_to_filters: []
    field: cost_summary_derived.invoice_date_date
