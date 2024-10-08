view: contract_agreement_v2 {
  sql_table_name: `cloudgenera-public.TestBigQuery.contract_agreement_v2` ;;

  dimension: commit {
    type: number
    sql: ${TABLE}.commit ;;
  }
  dimension: dedicated {
    type: number
    sql: ${TABLE}.dedicated ;;
  }
  dimension: prev_year_rollover_cost {
    type: number
    sql: ${TABLE}.prev_year_rollover_cost ;;
  }
  dimension: rollover_cost {
    type: number
    sql: ${TABLE}.rollover_cost ;;
  }
  dimension: shared {
    type: number
    sql: ${TABLE}.shared ;;
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
