view: budgetyears {
  sql_table_name: `TestBigQuery.budget-years` ;;

  dimension: budget_name {
    type: string
    sql: ${TABLE}.BudgetName ;;
  }
  dimension: month {
    type: number
    sql: ${TABLE}.Month ;;
  }
  dimension: value {
    type: number
    sql: ${TABLE}.Value ;;
  }
  dimension: year {
    type: number
    sql: ${TABLE}.Year ;;
  }
  dimension_group: budget_timestamp {
    type: time
    timeframes: [date, week, month, year]
    sql: CAST(DATE(${TABLE}.Year, ${TABLE}.Month, 1) AS TIMESTAMP) ;;
    convert_tz: no
  }
  measure: count {
    type: count
    drill_fields: [budget_name]
  }
}
