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
  dimension_group: term_start {
    type: time
    timeframes: [raw, time, date, week, month, month_name, quarter, quarter_of_year, year]
    sql: CAST(${TABLE}.term_start AS TIMESTAMP) ;;
    convert_tz: no
  }
  dimension_group: term_end {
    type: time
    timeframes: [raw, time, date, week, month, month_name, quarter, quarter_of_year, year]
    sql: CAST(${TABLE}.term_end AS TIMESTAMP) ;;
    convert_tz: no
  }
  dimension: terms {
    type: string
    sql: CONCAT(${TABLE}.term_start, " to ", ${TABLE}.term_end) ;;
  }
  dimension: term_type {
    type: string
    sql: CASE
      WHEN DATE_DIFF(CURRENT_DATE(), ${term_start_date}, DAY) >= 0
      AND DATE_DIFF(CURRENT_DATE(), ${term_end_date}, DAY) <= 0
      THEN 'Current'

      ELSE 'History'

      END
      ;;
  }
  dimension: true_up {
    type: number
    sql: ${TABLE}.true_up ;;
  }
  measure: count {
    type: count
  }
  measure: total_cloud_usage {
    type: sum
    sql: ${cloud_usage} ;;
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
}
