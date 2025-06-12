view: budget_summary_derived {
  derived_table: {
    sql: SELECT
        b.GroupName AS group_name
        , b.BudgetName AS budget_name
        , bi.Share AS share
        , DATE_TRUNC(cs.date, MONTH) AS invoice_month
        , SUM(cs.infrastructureUsage + cs.licenseUsage + cs.amendments)
          AS cost
        , SUM(cs.infrastructureCredit + cs.licenseCredit + cs.sharedCredit)
          AS credit
        , SUM(cs.amendments + cs.sharedAmendments) AS amendments
        , 0 AS budget_value
      FROM `cloudgenera-public.TestBigQuery.budgets` b
      LEFT JOIN `cloudgenera-public.TestBigQuery.budget-items` bi ON b.BudgetName = bi.BudgetName
      LEFT JOIN `cloudgenera-public.TestBigQuery.cost_summary` cs ON bi.CostGroupName = cs.name
      GROUP BY group_name, budget_name, share, invoice_month
      UNION ALL SELECT b.GroupName AS group_name, buy.BudgetName AS budget_name, 0 AS share, DATE(buy.Year, buy.Month, 1) AS invoice_month, 0 AS cost, 0 AS credit, 0 AS amendments, buy.Value AS budget_value FROM `cloudgenera-public.TestBigQuery.budget-years` buy
      LEFT JOIN `cloudgenera-public.TestBigQuery.budgets` b ON buy.BudgetName = b.BudgetName
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
    sql: CAST(${TABLE}.invoice_month AS TIMESTAMP) ;;
    convert_tz: no
  }
  dimension_group: creation_date {
    type: time
    timeframes: [raw, time, date, week, month, month_name, quarter, quarter_of_year, year]
    sql:  CAST(CURRENT_DATE("America/New_York") AS TIMESTAMP) ;;
  }
  dimension: amount_type {
    type: string
    sql: CASE
      WHEN DATE_DIFF(${invoice_month_date}, ${creation_date_date}, DAY) > 0
      THEN 'Forecasted'

      ELSE 'Actual'

      END
      ;;
  }
  dimension: year {
    type: string
    sql: CAST(EXTRACT(YEAR FROM CAST(${TABLE}.invoice_month AS TIMESTAMP)) AS STRING) ;;
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

  dimension: amendments {
    type: number
    sql: ${TABLE}.amendments ;;
  }

  dimension: budget_value {
    type: number
    sql: ${TABLE}.budget_value ;;
  }

  measure: spend {
    type: sum
    sql: ${cost} * ${share} / 100.0 ;;
    value_format: "#,##0.00"
  }

  measure: budget_value_total {
    type: sum
    sql: ${budget_value} ;;
    value_format: "#,##0.00"
  }

  measure: variance {
    type: sum
    sql: (${cost} * ${share} / 100.0) - ${budget_value} ;;
    value_format: "#,##0.00"
  }
}
