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
    timeframes: [raw, time, date, week, month, quarter, year]
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
  measure: count {
    type: count
    drill_fields: [id, cost_group_name]
  }
}
