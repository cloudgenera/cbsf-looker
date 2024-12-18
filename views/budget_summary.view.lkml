view: budget_summary {
  derived_table: {
    sql: SELECT
        b.GroupName AS group_name
        , b.BudgetName AS budget_name
        , bi.Share AS share
        , DATE_TRUNC(cs.invoice_date, MONTH) AS invoice_month
        , SUM(cs.dedicated_infrastructure_cost + cs.dedicated_license_cost
            + cs.shared_infrastructure_cost + cs.shared_license_cost
            + cs.unallocated_infrastructure_cost + cs.unallocated_license_cost)
          AS cost
        , SUM(cs.dedicated_infrastructure_credit + cs.dedicated_license_credit
            + cs.shared_infrastructure_credit + cs.shared_license_credit
            + cs.unallocated_infrastructure_credit + cs.unallocated_license_credit)
          AS credit
      FROM `cloudgenera-public.TestBigQuery.budgets` b
      LEFT JOIN `cloudgenera-public.TestBigQuery.budget-items` bi ON b.BudgetName = bi.BudgetName
      LEFT JOIN `cloudgenera-public.TestBigQuery.cost_summary` cs ON bi.CostGroupName = cs.cost_group
      GROUP BY group_name, budget_name, share, invoice_month ;;
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
    sql: CAST(${TABLE}.invoice_month AS TIMESTAMP) ;;
  }

  dimension: share {
    type: number
    sql: ${TABLE}.share ;;
  }

  dimension: cost {
    type: number
    sql: ${TABLE}.cost ;;
  }

  dimension: credit {
    type: number
    sql: ${TABLE}.credit ;;
  }

  measure: spend {
    type: sum
    sql: (${cost} + ${credit}) * ${share} ;;
  }
}
