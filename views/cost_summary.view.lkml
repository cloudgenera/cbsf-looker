view: cost_summary {
  sql_table_name: `TestBigQuery.cost_summary` ;;
  dimension: cost_group {
    type: string
    sql: ${TABLE}.cost_group ;;
  }
  dimension_group: invoice_date {
    type: time
    timeframes: [raw, time, date, week, month, month_name, quarter, quarter_of_year, year]
    sql: ${TABLE}.invoice_date ;;
  }
  dimension: amount_type {
    type: string
    sql: ${TABLE}.amount_type ;;
  }
  dimension: dedicated_infrastructure_cost {
    type: number
    sql: ${TABLE}.dedicated_infrastructure_cost ;;
  }
  dimension: dedicated_infrastructure_credit {
    type: number
    sql: ${TABLE}.dedicated_infrastructure_credit ;;
  }
  dimension: dedicated_license_cost {
    type: number
    sql: ${TABLE}.dedicated_license_cost ;;
  }
  dimension: dedicated_license_credit {
    type: number
    sql: ${TABLE}.dedicated_license_credit ;;
  }
  dimension: shared_infrastructure_cost {
    type: number
    sql: ${TABLE}.shared_infrastructure_cost ;;
  }
  dimension: shared_infrastructure_credit {
    type: number
    sql: ${TABLE}.shared_infrastructure_credit ;;
  }
  dimension: shared_license_cost {
    type: number
    sql: ${TABLE}.shared_license_cost ;;
  }
  dimension: shared_license_credit {
    type: number
    sql: ${TABLE}.shared_license_credit ;;
  }
  dimension: unallocated_infrastructure_cost {
    type: number
    sql: ${TABLE}.unallocated_infrastructure_cost ;;
  }
  dimension: unallocated_infrastructure_credit {
    type: number
    sql: ${TABLE}.unallocated_infrastructure_credit ;;
  }
  dimension: unallocated_license_cost {
    type: number
    sql: ${TABLE}.unallocated_license_cost ;;
  }
  dimension: unallocated_license_credit {
    type: number
    sql: ${TABLE}.unallocated_license_credit ;;
  }
  dimension: total_cost {
    type: number
    sql: SUM(${TABLE}.dedicated_infrastructure_cost,${TABLE}.dedicated_license_cost,
          ${TABLE}.shared_infrastructure_cost,${TABLE}.shared_license_cost,
          ${TABLE}.unallocated_infrastructure_cost,${TABLE}.unallocated_license_cost) ;;
  }
  dimension: total_credit {
    type: number
    sql: SUM(${TABLE}.dedicated_infrastructure_credit,${TABLE}.dedicated_license_credit,
          ${TABLE}.shared_infrastructure_credit,${TABLE}.shared_license_credit,
          ${TABLE}.unallocated_infrastructure_credit,${TABLE}.unallocated_license_credit) ;;
  }
  dimension: net_cost {
    type: number
    sql: SUM(${TABLE}.dedicated_infrastructure_cost,${TABLE}.dedicated_license_cost,
          ${TABLE}.shared_infrastructure_cost,${TABLE}.shared_license_cost,
          ${TABLE}.unallocated_infrastructure_cost,${TABLE}.unallocated_license_cost) -
         SUM(${TABLE}.dedicated_infrastructure_credit,${TABLE}.dedicated_license_credit,
          ${TABLE}.shared_infrastructure_credit,${TABLE}.shared_license_credit,
          ${TABLE}.unallocated_infrastructure_credit,${TABLE}.unallocated_license_credit) ;;
  }
  measure: count {
    type: count
    drill_fields: [cost_group]
  }
}
