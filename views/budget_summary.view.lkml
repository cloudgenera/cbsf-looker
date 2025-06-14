view: budget_summary {
  derived_table: {
    sql: SELECT
        b.GroupName AS group_name
        , b.BudgetName AS budget_name
        , bi.Share AS share
        , DATE_TRUNC(cs.date, MONTH) AS invoice_month
        , SUM(cs.infrastructureUsage + cs.licenseUsage)
          AS cost
        , SUM(cs.infrastructureCredit + cs.licenseCredit + cs.sharedCredit)
          AS credit
        , SUM(cs.amendments + cs.sharedAmendments) AS amendments
      FROM `cloudgenera-public.TestBigQuery.budgets` b
      LEFT JOIN `cloudgenera-public.TestBigQuery.budget-items` bi ON b.BudgetName = bi.BudgetName
      LEFT JOIN `cloudgenera-public.TestBigQuery.cost_summary` cs ON bi.CostGroupName = cs.name
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
    sql: EXTRACT(YEAR FROM CAST(${TABLE}.invoice_month AS TIMESTAMP)) ;;
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

  measure: spend {
    type: sum
    sql: ${cost} * ${share} / 100.0 ;;
    value_format: "#,##0.00"
  }
}
