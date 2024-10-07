view: budget_summary {
  derived_table: {
    sql: SELECT
        b.GroupName AS group_name
        , b.BudgetName AS budget_name
        , DATE_TRUNC(cs.invoice_date, MONTH) AS invoice_month
        , SUM(cs.net_cost) AS cost
      FROM budgets b
      LEFT JOIN budget-items bi ON b.BudgetName = bi.BudgetName
      LEFT JOIN cost_summary cs ON bi.CostGroupName = cs.cost_group
      GROUP BY GroupName, BudgetName, InvoiceMonth
      ;;
  }

  dimension: group_name {
    type: string
    sql: ${TABLE}.group_name ;;
  }

  dimension: budget_name {
    type: string
    sql: ${TABLE}.budget_name ;;
  }

  dimension_group: invoice_month {
    type: time
    timeframes: [date, week, month, year]
    sql: ${TABLE}.invoice_month ;;
  }

  dimension: cost {
    type: number
    sql: ${TABLE}.cost ;;
  }
}
