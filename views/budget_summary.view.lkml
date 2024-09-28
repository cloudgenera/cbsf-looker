view: budget_summary {
  derived_table: {
    sql: SELECT
        b.GroupName
        , b.BudgetName
        , DATEADD(m, DATEDIFF(m, 0, cs.InvoiceDate), 0) AS InvoiceMonth
        , CASE cs.CostType WHEN IN ("History", "Previous Month") THEN SUM(cs.TotalCost) ELSE 0 END AS Actual
        , CASE cs.CostType WHEN IN ("History", "Previous Month") THEN 0 ELSE SUM(cs.TotalCost) END AS Forecast
      FROM budgets b
      LEFT JOIN budget-items bi ON b.BudgetName = bi.BudgetName
      LEFT JOIN contract-summary cs ON bi.CostGroupName = cs.CostGroupName
      GROUP BY GroupName, BudgetName, InvoiceMonth
      ;;
  }

  dimension: group_name {
    type: string
    sql: ${TABLE}.GroupName ;;
  }

  dimension: budget_name {
    type: string
    sql: ${TABLE}.BudgetName ;;
  }

  dimension_group: invoice_month {
    type: time
    timeframes: [date, week, month, year]
    sql: ${TABLE}.InvoiceMonth ;;
  }

  dimension: actual {
    type: number
    sql: ${TABLE}.Actual ;;
  }

  dimension: forecast {
    type: number
    sql: ${TABLE}.Forecast ;;
  }
}
