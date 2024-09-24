view: budgetitems {
  sql_table_name: `TestBigQuery.budget-items` ;;

  dimension: budget_name {
    type: string
    sql: ${TABLE}.BudgetName ;;
  }
  dimension: cost_group_name {
    type: string
    sql: ${TABLE}.CostGroupName ;;
  }
  dimension: share {
    type: number
    sql: ${TABLE}.Share ;;
  }
  measure: count {
    type: count
    drill_fields: [cost_group_name, budget_name]
  }
}
