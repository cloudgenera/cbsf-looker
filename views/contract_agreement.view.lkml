view: contract_agreement {
  sql_table_name: `TestBigQuery.contract_agreement` ;;

  dimension: commit {
    type: number
    sql: ${TABLE}.commit ;;
  }
  dimension: dedicated {
    type: number
    sql: ${TABLE}.dedicated ;;
  }
  dimension: shared {
    type: number
    sql: ${TABLE}.shared ;;
  }
  dimension: license {
    type: number
    sql: ${TABLE}.license ;;
  }
  dimension: prev_year_rollover_cost {
    type: number
    sql: ${TABLE}.prev_year_rollover_cost ;;
  }
  dimension: rollover_cost {
    type: number
    sql: ${TABLE}.rollover_cost ;;
  }
  dimension: term_type {
    type: string
    sql: ${TABLE}.term_type ;;
  }
  dimension: term_years {
    type: string
    sql: ${TABLE}.term_years ;;
  }
  dimension: total_cost {
    type: number
    sql: ${TABLE}.total_cost ;;
  }
  dimension: unallocated {
    type: number
    sql: ${TABLE}.unallocated ;;
  }
  dimension: unused {
    type: number
    sql: ${TABLE}.unused ;;
  }
  dimension: total_commitment {
    type: number
    sql: ${commit} + ${prev_year_rollover_cost} ;;
  }
  measure: sum_total_cost {
    type: sum
    sql: ${total_cost} ;;
    value_format: "$#,##0.00"
  }
  measure: contract_dedicated {
    type: sum
    sql: ${dedicated} ;;
    value_format: "$#,##0.00"
  }
  measure: contract_shared {
    type: sum
    sql: ${shared} ;;
    value_format: "$#,##0.00"
  }
  measure: contract_unallocated {
    type: sum
    sql: ${unallocated} ;;
    value_format: "$#,##0.00"
  }
  measure: contract_license {
    type: sum
    sql: ${license} ;;
    value_format: "$#,##0.00"
  }
  measure: current_commit {
    type: sum
    filters: [term_type: "Current"]
    sql: ${commit} ;;
  }
  measure: current_budget {
    type: number
    sql: ${current_commit}/12 ;;
  }
  measure: count {
    type: count
  }
}
