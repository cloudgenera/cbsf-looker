view: enterprise_agreement {
  sql_table_name: `cloudgenera-public.TestBigQuery.enterprise_agreement` ;;

  dimension: actual_cost {
    type: number
    sql: ${TABLE}.actual_cost ;;
  }
  dimension: additional_forecast {
    type: number
    sql: ${TABLE}.additional_forecast ;;
  }
  dimension: cloud_usage {
    type: number
    sql: ${TABLE}.cloud_usage ;;
  }
  dimension: commit {
    type: number
    sql: ${TABLE}.commit ;;
  }
  dimension: credit_amount {
    type: number
    sql: ${TABLE}.credit_amount ;;
  }
  dimension: prev_year_rollover {
    type: number
    sql: ${TABLE}.prev_year_rollover ;;
  }
  dimension: rollover_cost {
    type: number
    sql: ${TABLE}.rollover_cost ;;
  }
  dimension: term_years {
    type: string
    sql: ${TABLE}.term_years ;;
  }
  dimension: term_start {
    type: string
    sql: LEFT(${TABLE}.term_years, CHARINDEX('-', ${TABLE}.term_years)-1) ;;
  }
  dimension: term_end {
    type: string
    sql: RIGHT(${TABLE}.term_years, CHARINDEX('-', ${TABLE}.term_years)-1) ;;
  }
  dimension: true_up {
    type: number
    sql: ${TABLE}.true_up ;;
  }
  measure: count {
    type: count
  }
}
