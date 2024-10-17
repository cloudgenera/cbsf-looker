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
    explore: contract_agreement
    type: looker_grid
    fields: [contract_agreement.term_years, contract_agreement.commit, contract_agreement.prev_year_rollover_cost,
      contract_agreement.total_cost]
    sorts: [contract_agreement.term_years]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: |-
        if(${contract_agreement.term_years}="September 2022 - August 2023",
          475613,
          if(${contract_agreement.term_years}="September 2023 - August 2024",
            1076756,
            206000)
        )
      label: manual_add_forecast
      value_format:
      value_format_name: usd
      _kind_hint: dimension
      table_calculation: manual_add_forecast
      _type_hint: number
    - category: table_calculation
      expression: |-
        if(${contract_agreement.term_years}="September 2022 - August 2023",
          2500000,
          if(${contract_agreement.term_years}="September 2023 - August 2024",
            2500000,
            3000000)
        )
      label: manual_add_credit
      value_format:
      value_format_name: usd
      _kind_hint: dimension
      table_calculation: manual_add_credit
      _type_hint: number
    - category: table_calculation
      expression: "${contract_agreement.total_cost}+${manual_add_forecast}-${manual_add_credit}"
      label: actual_cost
      value_format:
      value_format_name: usd
      _kind_hint: dimension
      table_calculation: actual_cost
      _type_hint: number
    - category: table_calculation
      expression: |-
        if(0.1*${contract_agreement.commit} < (${contract_agreement.commit}+${contract_agreement.prev_year_rollover_cost} - (${contract_agreement.total_cost}+${manual_add_forecast})),
          0.1*${contract_agreement.commit},
          if(${contract_agreement.commit}+${contract_agreement.prev_year_rollover_cost}-(${contract_agreement.total_cost}+${manual_add_forecast}) > 0,
            ${contract_agreement.commit}+${contract_agreement.prev_year_rollover_cost}-(${contract_agreement.total_cost}+${manual_add_forecast}),
            0
          )
        )
      label: rollover_cost
      value_format:
      value_format_name: usd
      _kind_hint: dimension
      table_calculation: rollover_cost
      _type_hint: number
    - category: table_calculation
      expression: |-
        if(
          (${contract_agreement.commit}+${contract_agreement.prev_year_rollover_cost}-(${contract_agreement.total_cost}+${manual_add_forecast})) > 0,
          ${contract_agreement.commit}+${contract_agreement.prev_year_rollover_cost}-(${contract_agreement.total_cost}+${manual_add_forecast})-${rollover_cost},
          0
        )
      label: true_up
      value_format:
      value_format_name: usd
      _kind_hint: dimension
      table_calculation: true_up
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
    column_order: ["$$$_row_numbers_$$$", contract_agreement.term_years, contract_agreement.commit,
      contract_agreement.prev_year_rollover_cost, contract_agreement.total_cost, manual_add_forecast,
      manual_add_credit, actual_cost, rollover_cost, true_up]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      contract_agreement.total_cost: Cloud Usage
      manual_add_forecast: Additional Forecast
      manual_add_credit: Credit Amount
      actual_cost: Actual Cost
      true_up: True Up
      rollover_cost: Rollover Cost
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#1A73E8",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 4a00499b-c0fe-4b15-a304-4083c07ff4c4, options: {constraints: {
              min: {type: minimum}, mid: {type: number, value: 0}, max: {type: maximum}},
            mirror: true, reverse: false, stepped: false}}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    series_value_format:
      contract_agreement.commit:
        name: usd
        decimals: '2'
        format_string: "$#,##0.00"
        label: U.S. Dollars (2)
        label_prefix: U.S. Dollars
      contract_agreement.prev_year_rollover_cost:
        name: usd
        decimals: '2'
        format_string: "$#,##0.00"
        label: U.S. Dollars (2)
        label_prefix: U.S. Dollars
      contract_agreement.total_cost:
        name: usd
        decimals: '2'
        format_string: "$#,##0.00"
        label: U.S. Dollars (2)
        label_prefix: U.S. Dollars
      contract_agreement.rollover_cost:
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
      Term Years: contract_agreement.term_years
    row: 0
    col: 0
    width: 24
    height: 6
  - title: Unallocated Usage
    name: Unallocated Usage
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
    defaults_version: 1
    listen:
      Term Years: contract_agreement.term_years
    row: 10
    col: 16
    width: 8
    height: 4
  - title: Infrastructure Usage
    name: Infrastructure Usage
    model: cbsf_v1
    explore: contract_agreement
    type: single_value
    fields: [contract_agreement.contract_dedicated]
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
      Term Years: contract_agreement.term_years
    row: 10
    col: 0
    width: 8
    height: 4
  - title: Shared Usage
    name: Shared Usage
    model: cbsf_v1
    explore: contract_agreement
    type: single_value
    fields: [contract_agreement.contract_shared]
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
      Term Years: contract_agreement.term_years
    row: 10
    col: 8
    width: 8
    height: 4
  - title: Total Cloud Usage
    name: Total Cloud Usage
    model: cbsf_v1
    explore: contract_agreement
    type: single_value
    fields: [contract_agreement.sum_total_cost]
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
      Term Years: contract_agreement.term_years
    row: 6
    col: 7
    width: 10
    height: 4
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
