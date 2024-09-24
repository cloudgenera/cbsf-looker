view: budgets {
  sql_table_name: `TestBigQuery.budgets` ;;

  dimension: budget_name {
    type: string
    sql: ${TABLE}.BudgetName ;;
  }
  dimension: group_name {
    type: string
    sql: ${TABLE}.GroupName ;;
  }
  measure: count {
    type: count
    drill_fields: [group_name, budget_name]
  }
}
