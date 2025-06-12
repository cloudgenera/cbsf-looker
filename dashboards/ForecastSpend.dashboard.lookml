---
- dashboard: forecast_usage
  title: Forecast Usage
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: E5NEnEZvecxqD7gvRFNkYH
  elements:
  - title: Cloud Spend Forecast
    name: Cloud Spend Forecast
    model: cbsf_v1
    explore: cost_summary_derived
    type: looker_column
    fields: [cost_summary_derived.invoice_date_month, cost_summary_derived.sum_of_cost,
      cost_summary_derived.type]
    pivots: [cost_summary_derived.type]
    fill_fields: [cost_summary_derived.invoice_date_month]
    filters:
      cost_summary_derived.amount_type: Current Month Estimate,Future
    sorts: [cost_summary_derived.type, cost_summary_derived.invoice_date_month]
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
    y_axes: [{label: Cost, orientation: left, series: [{axisId: Dedicated - cost_summary_derived.sum_of_cost,
            id: Dedicated - cost_summary_derived.sum_of_cost, name: Dedicated}, {
            axisId: Distributed - cost_summary_derived.sum_of_cost, id: Distributed
              - cost_summary_derived.sum_of_cost, name: Distributed}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    hidden_series: []
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Cost Group: cost_summary_derived.cost_group
      Cost Type: cost_summary_derived.cost_type
      Cost Group Type: cost_summary_derived.type
      Invoice Date Date: cost_summary_derived.invoice_date_date
    row: 0
    col: 0
    width: 24
    height: 7
  - title: Cost Allocation Forecast
    name: Cost Allocation Forecast
    model: cbsf_v1
    explore: cost_summary_derived
    type: looker_grid
    fields: [cost_summary_derived.cost_group, cost_summary_derived.sum_of_cost, cost_summary_derived.invoice_date_month]
    pivots: [cost_summary_derived.cost_group]
    fill_fields: [cost_summary_derived.invoice_date_month]
    filters:
      cost_summary_derived.amount_type: Current Month Estimate,Future
    sorts: [cost_summary_derived.cost_group, cost_summary_derived.invoice_date_month]
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
      cost_summary_derived.invoice_date_month: Invoice Date
      cost_summary_derived.cost_group: Cost Group
      cost_summary_derived.sum_of_cost: Cost
    series_cell_visualizations:
      cost_summary_derived.sum_of_cost:
        is_active: false
    hidden_pivots: {}
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
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    listen:
      Cost Group: cost_summary_derived.cost_group
      Cost Type: cost_summary_derived.cost_type
      Cost Group Type: cost_summary_derived.type
      Invoice Date Date: cost_summary_derived.invoice_date_date
    row: 7
    col: 0
    width: 24
    height: 6
  - title: Forecast Amount
    name: Forecast Amount
    model: cbsf_v1
    explore: cost_summary_derived
    type: single_value
    fields: [cost_summary_derived.sum_of_cost]
    filters:
      cost_summary_derived.amount_type: Current Month Estimate,Future
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
      Cost Group Type: cost_summary_derived.type
      Invoice Date Date: cost_summary_derived.invoice_date_date
    row: 13
    col: 8
    width: 8
    height: 6
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
  - name: Cost Group Type
    title: Cost Group Type
    type: field_filter
    default_value: Dedicated
    allow_multiple_values: true
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
    default_value: 2025/05/01 to 2026/01/01
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
