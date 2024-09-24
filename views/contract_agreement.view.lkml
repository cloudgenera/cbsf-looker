view: contract_agreement {
  sql_table_name: `TestBigQuery.contract_agreement` ;;

  dimension: commit {
    type: number
    sql: ${TABLE}.Commit ;;
  }
  dimension: dedicated {
    type: number
    sql: ${TABLE}.Dedicated ;;
  }
  dimension: license {
    type: number
    sql: ${TABLE}.License ;;
  }
  dimension: prev_year_rollover_cost {
    type: number
    sql: ${TABLE}.PrevYearRolloverCost ;;
  }
  dimension: rollover_cost {
    type: number
    sql: ${TABLE}.RolloverCost ;;
  }
  dimension: term_type {
    type: string
    sql: ${TABLE}.TermType ;;
  }
  dimension: term_years {
    type: string
    sql: ${TABLE}.TermYears ;;
  }
  dimension: total_cost {
    type: number
    sql: ${TABLE}.TotalCost ;;
  }
  dimension: unallocated {
    type: number
    sql: ${TABLE}.Unallocated ;;
  }
  dimension: unused {
    type: number
    sql: ${TABLE}.Unused ;;
  }
  dimension: total_commitment {
    type: number
    sql: ${commit} + ${prev_year_rollover_cost} ;;
  }
  measure: contract_dedicated {
    type: sum
    sql: ${dedicated} ;;
  }
  measure: contract_unallocated {
    type: sum
    sql: ${unallocated} ;;
  }
  measure: contract_license {
    type: sum
    sql: ${license} ;;
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
