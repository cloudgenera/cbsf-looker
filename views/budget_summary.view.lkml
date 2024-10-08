view: budget_summary {
  derived_table: {
    sql: SELECT
        b.GroupName AS group_name
        , b.BudgetName AS budget_name
        , DATE_TRUNC(cs.invoice_date, MONTH) AS invoice_month
        , (
            SUM(cs.dedicated_infrastructure_cost) +
            SUM(cs.dedicated_license_cost) +
            SUM(cs.shared_infrastructure_cost) +
            SUM(cs.shared_license_cost) +
            SUM(cs.unallocated_infrastructure_cost) +
            SUM(cs.unallocated_license_cost)
          ) -
          (
            SUM(cs.dedicated_infrastructure_credit) +
            SUM(cs.dedicated_license_credit) +
            SUM(cs.shared_infrastructure_credit) +
            SUM(cs.shared_license_credit) +
            SUM(cs.unallocated_infrastructure_credit) +
            SUM(cs.unallocated_license_credit)
          ) AS cost
      FROM `cloudgenera-public.TestBigQuery.budgets` b
      LEFT JOIN `cloudgenera-public.TestBigQuery.budget-items` bi ON b.BudgetName = bi.BudgetName
      LEFT JOIN `cloudgenera-public.TestBigQuery.cost_summary` cs ON bi.CostGroupName = cs.cost_group
      GROUP BY group_name, budget_name, invoice_month ;;
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

  measure: cost {
    type: sum
    sql: ${TABLE}.cost ;;
  }
}
