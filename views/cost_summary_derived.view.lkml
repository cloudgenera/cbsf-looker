view: cost_summary_derived {
  derived_table: {
    sql: SELECT id, name, type, date, 'Infrastructure' as cost_type, infrastructureUsage as cost, infrastructureUsage as dedicated, 0 as shared FROM cost_summary
      UNION ALL SELECT id, name, type, date, 'Infrastructure Credit' as cost_type, infrastructureCredit as cost, infrastructureCredit as dedicated, 0 as shared FROM cost_summary
      UNION ALL SELECT id, name, type, date, 'License' as cost_type, licenseUsage as cost, licenseUsage as dedicated, 0 as shared FROM cost_summary
      UNION ALL SELECT id, name, type, date, 'License Credit' as cost_type, licenseCredit as cost, licenseCredit as dedicated, 0 as shared FROM cost_summary
      UNION ALL SELECT id, name, type, date, 'Shared' as cost_type, sharedUsage as cost, 0 as dedicated, sharedUsage as shared FROM cost_summary
      UNION ALL SELECT id, name, type, date, 'Shared Credit' as cost_type, sharedCredit as cost, 0 as dedicated, sharedCredit as shared FROM cost_summary
      UNION ALL SELECT id, name, type, date, 'Amendments' as cost_type, amendments as cost, amendments as dedicated, 0 as shared FROM cost_summary
      UNION ALL SELECT id, name, type, date, 'Shared Amendments' as cost_type, sharedAmendments as cost, 0 as dedicated, sharedAmendments as shared FROM cost_summary
      ;;
  }
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
    timeframes: [raw, date, week, month, month_name, quarter, quarter_of_year, year]
    sql: CAST(${TABLE}.date AS TIMESTAMP) ;;
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

  dimension: cost_type {
    type: string
    sql: ${TABLE}.cost_type ;;
  }
  dimension: cost {
    type: number
    sql: ${TABLE}.cost ;;
  }

  dimension: dedicated {
    type: number
    sql: ${TABLE}.dedicated ;;
  }
  dimension: shared {
    type: number
    sql: ${TABLE}.shared ;;
  }

  measure: sum_of_cost {
    type: sum
    sql: ${cost} ;;
    value_format: "#,##0.00"
  }
  measure: sum_of_dedicated {
    type: sum
    sql: ${dedicated} ;;
    value_format: "#,##0.00"
  }
  measure: sum_of_shared {
    type: sum
    sql: ${shared} ;;
    value_format: "#,##0.00"
  }

}
