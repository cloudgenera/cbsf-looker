view: contract_summary {
  sql_table_name: `TestBigQuery.contract_summary` ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.Id ;;
  }
  dimension: compute_engine_cost {
    type: string
    sql: ${TABLE}.ComputeEngineCost ;;
  }
  dimension: cost_group_name {
    type: string
    sql: ${TABLE}.CostGroupName ;;
  }
  dimension: cost_group_type {
    type: string
    sql: ${TABLE}.CostGroupType ;;
  }
  dimension: cost_type {
    type: string
    sql: ${TABLE}.CostType ;;
  }
  dimension_group: invoice {
    type: time
    timeframes: [raw, time, date, week, month, month_name, quarter, quarter_of_year, year]
    sql: ${TABLE}.InvoiceDate ;;
  }
  dimension: other_cost {
    type: string
    sql: ${TABLE}.OtherCost ;;
  }
  dimension: shared_cost {
    type: number
    sql: ${TABLE}.SharedCost ;;
  }
  dimension: storage_cost {
    type: string
    sql: ${TABLE}.StorageCost ;;
  }
  dimension: total_cost {
    type: string
    sql: ${TABLE}.TotalCost ;;
  }
  dimension: contract_invoice_months {
    group_label: "Invoice Date"
    sql: CASE
        WHEN EXTRACT(YEAR from ${invoice_raw}) = EXTRACT(YEAR from CURRENT_TIMESTAMP())
        AND EXTRACT(MONTH from ${invoice_raw}) = EXTRACT(MONTH from CURRENT_TIMESTAMP())
        THEN 'Current Month'

      WHEN EXTRACT(YEAR from ${invoice_raw}) = EXTRACT(YEAR from CURRENT_TIMESTAMP())
      AND EXTRACT(MONTH from ${invoice_raw}) + 1 = EXTRACT(MONTH from CURRENT_TIMESTAMP())
      THEN 'Previous Month'

      WHEN EXTRACT(YEAR from ${invoice_raw}) > EXTRACT(YEAR from CURRENT_TIMESTAMP())
      OR EXTRACT(YEAR from ${invoice_raw}) = EXTRACT(YEAR from CURRENT_TIMESTAMP())
      AND EXTRACT(MONTH from ${invoice_raw}) > EXTRACT(MONTH from CURRENT_TIMESTAMP())
      THEN 'Future'

      ELSE 'HISTORY'

      END
      ;;
  }
  measure: license {
    type:  sum
    sql:  ${total_cost} ;;
    filters: [cost_group_type: "License"]
  }
  measure: dedicated {
    type:  sum
    sql:  ${compute_engine_cost} + ${storage_cost} + ${other_cost} ;;
    filters: [cost_group_type: "Dedicated"]
  }
  measure: shared {
    type:  sum
    sql:  ${shared_cost} ;;
    filters: [cost_group_type: "Dedicated"]
  }
  measure: unallocated {
    type:  sum
    sql:  ${total_cost} ;;
    filters: [cost_group_type: "Unallocated"]
  }
  measure: estimated_invoice {
    type: number
    sql: ${license} + ${dedicated} + ${shared} + ${unallocated};;
  }
  measure: dedicated_plus_shared {
    type: sum
    sql: ${total_cost}+${shared_cost} ;;
    filters: [cost_group_type: "Dedicated"]
  }
  measure: dedicated_total_cost {
    type:  sum
    sql:  ${total_cost} ;;
    filters: [cost_group_type: "Dedicated"]
  }
  measure: current_and_previous_months_count {
    type: count_distinct
    sql: ${invoice_month} ;;
    filters: [contract_invoice_months: "Current Month, Previous Month, HISTORY"]
  }
  measure: count {
    type: count
    drill_fields: [id, cost_group_name]
  }
}
