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
    explore: contract_agreement_v2
    type: looker_grid
    fields: [contract_agreement_v2.term_years, contract_agreement_v2.commit, contract_agreement_v2.prev_year_rollover_cost,
      contract_agreement_v2.total_cost, contract_agreement_v2.rollover_cost, contract_agreement_v2.unused]
    sorts: [contract_agreement_v2.term_years]
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
    series_labels:
      contract_agreement_v2.total_cost: Total Cloud Spend
      contract_agreement_v2.rollover_cost: Rollover Amount
      contract_agreement_v2.unused: True Up Amount
      contract_agreement_v2.prev_year_rollover_cost: Prev Year Rollover
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#1A73E8",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 4a00499b-c0fe-4b15-a304-4083c07ff4c4, options: {constraints: {
              min: {type: minimum}, mid: {type: number, value: 0}, max: {type: maximum}},
            mirror: true, reverse: false, stepped: false}}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    series_value_format:
      contract_agreement_v2.commit:
        name: usd
        decimals: '2'
        format_string: "$#,##0.00"
        label: U.S. Dollars (2)
        label_prefix: U.S. Dollars
      contract_agreement_v2.prev_year_rollover_cost:
        name: usd
        decimals: '2'
        format_string: "$#,##0.00"
        label: U.S. Dollars (2)
        label_prefix: U.S. Dollars
      contract_agreement_v2.total_cost:
        name: eur
        decimals: '2'
        format_string: '"€"#,##0.00'
        label: Euros (2)
        label_prefix: Euros
      contract_agreement_v2.rollover_cost:
        name: usd
        decimals: '2'
        format_string: "$#,##0.00"
        label: U.S. Dollars (2)
        label_prefix: U.S. Dollars
      contract_agreement_v2.unused:
        name: usd
        decimals: '2'
        format_string: "$#,##0.00"
        label: U.S. Dollars (2)
        label_prefix: U.S. Dollars
    defaults_version: 1
    listen:
      Term Years: contract_agreement_v2.term_years
    row: 0
    col: 0
    width: 24
    height: 6
  - title: Google Compute Engine Spend
    name: Google Compute Engine Spend
    model: cbsf_v1
    explore: contract_agreement_v2
    type: single_value
    fields: [sum_of_dedicated]
    filters: {}
    limit: 500
    column_limit: 50
    dynamic_fields:
    - _kind_hint: measure
      _type_hint: number
      based_on: contract_agreement_v2.dedicated
      expression: ''
      label: Sum of Dedicated
      measure: sum_of_dedicated
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
    listen:
      Term Years: contract_agreement_v2.term_years
    row: 6
    col: 0
    width: 8
    height: 6
  - title: Total Cloud Spend
    name: Total Cloud Spend
    model: cbsf_v1
    explore: contract_agreement_v2
    type: single_value
    fields: [sum_of_total_cost]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - _kind_hint: measure
      _type_hint: number
      based_on: contract_agreement_v2.total_cost
      expression: ''
      label: Sum of Total Cost
      measure: sum_of_total_cost
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
    listen:
      Term Years: contract_agreement_v2.term_years
    row: 6
    col: 8
    width: 8
    height: 6
  - title: Unallocated Spend
    name: Unallocated Spend
    model: cbsf_v1
    explore: contract_agreement_v2
    type: single_value
    fields: [sum_of_unallocated]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - _kind_hint: measure
      _type_hint: number
      based_on: contract_agreement_v2.unallocated
      expression: ''
      label: Sum of Unallocated
      measure: sum_of_unallocated
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
    listen:
      Term Years: contract_agreement_v2.term_years
    row: 6
    col: 16
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
    explore: contract_agreement_v2
    listens_to_filters: []
    field: contract_agreement_v2.term_years
