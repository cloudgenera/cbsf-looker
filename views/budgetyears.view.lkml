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
  measure: count {
    type: count
    drill_fields: [budget_name]
  }
}
