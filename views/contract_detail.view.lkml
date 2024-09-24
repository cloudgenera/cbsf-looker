view: contract_detail {
  sql_table_name: `TestBigQuery.contract_detail` ;;

  dimension: cost_group {
    type: string
    sql: ${TABLE}.costGroup ;;
  }
  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }
  dimension_group: invoice {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.invoiceDate ;;
  }
  dimension: project_name {
    type: string
    sql: ${TABLE}.projectName ;;
  }
  dimension: source {
    type: string
    sql: ${TABLE}.source ;;
  }
  dimension: total_cost {
    type: number
    sql: ${TABLE}.totalCost ;;
  }
  measure: count {
    type: count
    drill_fields: [project_name]
  }
}
