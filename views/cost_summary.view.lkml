view: cost_summary {
  sql_table_name: `TestBigQuery.cost_summary` ;;
  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }
  dimension: cost_group {
    type: string
    sql: ${TABLE}.name ;;
  }
  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }
  dimension_group: invoice_date {
    type: time
    timeframes: [raw, time, date, week, month, month_name, quarter, quarter_of_year, year]
    sql: CAST(${TABLE}.date AS TIMESTAMP) ;;
    convert_tz: no
  }
  # dimension_group: creation_date {
  #   type: time
  #   timeframes: [raw, time, date, week, month, month_name, quarter, quarter_of_year, year]
  #   sql: CAST(${TABLE}.creation_date AS TIMESTAMP) ;;
  # }
  dimension_group: creation_date {
    type: time
    timeframes: [raw, time, date, week, month, month_name, quarter, quarter_of_year, year]
    sql:  CAST(CURRENT_DATE("America/New_York") AS TIMESTAMP) ;;
  }
  dimension: amount_type {
    type: string
    sql: CASE
      WHEN DATE_DIFF(${invoice_date_date}, ${creation_date_date}, MONTH) = 0
      THEN 'Current Month Estimate'

      WHEN DATE_DIFF(${invoice_date_date}, ${creation_date_date}, MONTH) > 0
      THEN 'Future'

      WHEN DATE_DIFF(${invoice_date_date}, ${creation_date_date}, MONTH) = -1
      THEN 'Previous Month'

      ELSE 'History'

      END
    ;;
  }
  dimension: infrastructure_usage {
    type: number
    sql: ${TABLE}.infrastructureUsage ;;
  }
  dimension: infrastructure_credit {
    type: number
    sql: ${TABLE}.infrastructureCredit ;;
  }
  dimension: infrastructure_net_cost {
    type: number
    sql: ${TABLE}.infrastructureUsage+${TABLE}.infrastructureCredit ;;
  }
  dimension: license_usage {
    type: number
    sql: ${TABLE}.licenseUsage ;;
  }
  dimension: license_credit {
    type: number
    sql: ${TABLE}.licenseCredit ;;
  }
  dimension: license_net_cost {
    type: number
    sql: ${TABLE}.licenseUsage+${TABLE}.licenseCredit ;;
  }
  dimension: amendments{
    type: number
    sql: ${TABLE}.amendments ;;
  }
  dimension: shared_usage {
    type: number
    sql: ${TABLE}.sharedUsage ;;
  }
  dimension: shared_credit {
    type: number
    sql: ${TABLE}.sharedCredit ;;
  }
  dimension: shared_net_cost {
    type: number
    sql: ${TABLE}.sharedUsage+${TABLE}.sharedCredit ;;
  }
  dimension: shared_amendments {
    type: number
    sql: ${TABLE}.sharedAmendments ;;
  }

  dimension: total_cost {
    type: number
    sql: ${TABLE}.infrastructureUsage+${TABLE}.licenseUsage+${TABLE}.sharedUsage ;;
  }
  dimension: total_credit {
    type: number
    sql: ${TABLE}.infrastructureCredit+${TABLE}.licenseCredit+${TABLE}.sharedCredit ;;
  }
  dimension: net_cost {
    type: number
    sql:  ${TABLE}.infrastructureUsage+${TABLE}.licenseUsage+${TABLE}.sharedUsage
          +${TABLE}.infrastructureCredit+${TABLE}.licenseCredit+${TABLE}.sharedCredit
          +${amendments};;
  }
  measure: current_and_previous_months_count {
    type: count_distinct
    sql: ${invoice_date_month} ;;
    filters: [amount_type: "Current Month Estimate, Previous Month, History"]
  }
  measure: count {
    type: count
    drill_fields: [cost_group]
  }
}
